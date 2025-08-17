import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/common/state_notifier/pagination_state_notifier.dart';
import 'package:wan_android/feature/project/data/project_list_item.dart';
import 'package:wan_android/feature/project/data/project_repository.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

part 'project_list_controller.g.dart';

@riverpod
class ProjectListController extends _$ProjectListController {
  @override
  FutureOr<BasePaginationData<ProjectListItem>> build(
      {required int cid}) async {
    return _loadProjectList();
  }

  Future<BasePaginationData<ProjectListItem>> _loadProjectList() {
    return ref
        .watch(projectRepositoryProvider)
        .getProjectPaginationList(pageIndex: 1, cid: cid)
        .then((value) => value.data);
  }

  Future<IndicatorResult> onRefresh() async {
    if (state.isLoading) {
      return IndicatorResult.none;
    }

    try {
      final result = await _loadProjectList();
      state = AsyncValue.data(result);
      return IndicatorResult.success;
    } catch (error, stackTrace) {
      state = AsyncValue<BasePaginationData<ProjectListItem>>.error(
              error, stackTrace)
          .copyWithPrevious(state);
      return IndicatorResult.fail;
    }
  }

  Future<IndicatorResult> onLoad() async {
    if (state.isLoading) {
      return IndicatorResult.none;
    }
    try {
      final result = await _loadProjectList();
      final previousData = state.value?.datas ?? [];
      state = AsyncValue.data(
          result.copyWith(datas: [...previousData, ...result.datas]));
      return result.over ? IndicatorResult.noMore : IndicatorResult.success;
    } catch (error, stackTrace) {
      state = AsyncValue<BasePaginationData<ProjectListItem>>.error(
              error, stackTrace)
          .copyWithPrevious(state);
      return IndicatorResult.fail;
    }
  }
}

final projectListProvider = AsyncNotifierProvider.family<
    PaginationNotifier<ProjectListItem, int>,
    BasePaginationData<ProjectListItem>,
    int>(() {
  return PaginationNotifier((ref, pageIndex, cid) => ref
      .read(projectRepositoryProvider)
      .getProjectPaginationList(pageIndex: pageIndex, cid: cid)
      .then((value) => value.data));
});
