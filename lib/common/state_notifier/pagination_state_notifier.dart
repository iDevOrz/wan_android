import 'package:easy_refresh/easy_refresh.dart' show IndicatorResult;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

class PaginationNotifier<Item>
    extends StateNotifier<AsyncValue<BasePaginationData<Item>>> {
  PaginationNotifier(this._loadProjectList) : super(const AsyncValue.loading());

  final Future<BasePaginationData<Item>> Function(int pageIndex)
      _loadProjectList;

  final int initialPageIndex = 0;

  Future<IndicatorResult> onRefresh() async {
    if (state.isLoading) {
      return IndicatorResult.none;
    }

    try {
      final result = await _loadProjectList(initialPageIndex);
      state = AsyncValue.data(result);
      return IndicatorResult.success;
    } catch (error, stackTrace) {
      state = AsyncValue<BasePaginationData<Item>>.error(error, stackTrace)
          .copyWithPrevious(state);
      return IndicatorResult.fail;
    }
  }

  Future<IndicatorResult> onLoad() async {
    try {
      final curPage = state.valueOrNull?.curPage ?? 0;
      final result = await _loadProjectList(curPage + 1);
      final previousData = state.valueOrNull?.datas ?? [];
      state = AsyncValue.data(
          result.copyWith(datas: [...previousData, ...result.datas]));
      return result.over ? IndicatorResult.noMore : IndicatorResult.success;
    } catch (error, stackTrace) {
      state = AsyncValue<BasePaginationData<Item>>.error(error, stackTrace)
          .copyWithPrevious(state);
      return IndicatorResult.fail;
    }
  }
}
