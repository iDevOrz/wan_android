import 'dart:async';

import 'package:easy_refresh/easy_refresh.dart' show IndicatorResult;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

class PaginationNotifier<Item, T>
    extends FamilyAsyncNotifier<BasePaginationData<Item>, T> {
  PaginationNotifier(this._loadProjectList);

  final Future<BasePaginationData<Item>> Function(Ref ref, int pageIndex, T arg)
      _loadProjectList;

  final int initialPageIndex = 0;

  @override
  Future<BasePaginationData<Item>> build(T arg) async {
    // 初始化时加载第一页数据
    return await _loadProjectList(ref, initialPageIndex, arg);
  }

  Future<IndicatorResult> onRefresh() async {
    if (state.isLoading) {
      return IndicatorResult.none;
    }

    try {
      // 使用 update 方法来更新状态
      await update((previous) async {
        return await _loadProjectList(ref, initialPageIndex, arg);
      });
      return IndicatorResult.success;
    } catch (error, stackTrace) {
      // 在 AsyncNotifier 中，错误处理会自动更新 state
      state = AsyncValue<BasePaginationData<Item>>.error(error, stackTrace)
          .copyWithPrevious(state);
      return IndicatorResult.fail;
    }
  }

  Future<IndicatorResult> onLoad() async {
    try {
      final curPage = state.value?.curPage ?? 0;

      await update((previous) async {
        final result = await _loadProjectList(ref, curPage + 1, arg);
        final previousData = previous.datas;
        return result.copyWith(datas: [...previousData, ...result.datas]);
      });

      final currentData = state.value;
      return currentData?.over == true
          ? IndicatorResult.noMore
          : IndicatorResult.success;
    } catch (error, stackTrace) {
      state = AsyncValue<BasePaginationData<Item>>.error(error, stackTrace)
          .copyWithPrevious(state);
      return IndicatorResult.fail;
    }
  }
}
