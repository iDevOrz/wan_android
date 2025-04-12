import 'dart:async';

import 'package:easy_refresh/easy_refresh.dart' show IndicatorResult;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/home/data/home_article_list_item.dart';
import 'package:wan_android/feature/home/data/home_banner_item.dart';
import 'package:wan_android/feature/home/data/home_repository.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeController extends _$HomeController {
  @override
  FutureOr<BasePaginationData<HomeArticleListItem>> build() async {
    return _fetch();
  }

  Future<BasePaginationData<HomeArticleListItem>> _fetch(
      {int pageIndex = 0}) async {
    final response = await ref
        .watch(homeRepositoryProvider)
        .getArticlePaginationList(pageIndex: pageIndex);
    return response.data;
  }

  Future<IndicatorResult> onRefresh() async {
    if (state.isLoading) {
      return IndicatorResult.none;
    }

    try {
      final result = await _fetch();
      state = AsyncValue.data(result);
      return IndicatorResult.success;
    } catch (error, stackTrace) {
      state = AsyncValue<BasePaginationData<HomeArticleListItem>>.error(
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
      final result = await _fetch();
      final previousData = state.valueOrNull?.datas ?? [];
      state = AsyncValue.data(
          result.copyWith(datas: [...previousData, ...result.datas]));
      return result.over ? IndicatorResult.noMore : IndicatorResult.success;
    } catch (error, stackTrace) {
      state = AsyncValue<BasePaginationData<HomeArticleListItem>>.error(
              error, stackTrace)
          .copyWithPrevious(state);
      return IndicatorResult.fail;
    }
  }
}

@Riverpod(keepAlive: true)
Future<List<HomeBannerItem>> homeBannerList(Ref ref) async {
  return await ref
      .watch(homeRepositoryProvider)
      .getHomeBannerList()
      .then((value) => value.data);
}
