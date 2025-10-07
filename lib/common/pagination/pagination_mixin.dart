import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/common/pagination/pagination_invoker.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

mixin PaginationMixin<T> {
  @protected
  late final _paginationInvoker = PaginationInvoker<BasePaginationData<T>>(
    paginationRequest: paginationRequest,
    onLoadCombine: _onLoadCombine,
  );

  set state(AsyncValue<BasePaginationData<T>> newState);

  AsyncValue<BasePaginationData<T>> get state;

  Future<BasePaginationData<T>> onBuild() {
    return _paginationInvoker.onRefresh();
  }

  Future<IndicatorResult> onRefresh() async {
    state = await AsyncValue.guard(() => _paginationInvoker.onRefresh());
    if (!state.hasError) {
      return IndicatorResult.success;
    } else {
      return IndicatorResult.fail;
    }
  }

  Future<IndicatorResult> onLoad() async {
    try {
      final newPageData = await _paginationInvoker.onLoad();
      state = AsyncData(_paginationInvoker.state);
      return newPageData.datas.length < _paginationInvoker.pageSize
          ? IndicatorResult.noMore
          : IndicatorResult.success;
    } catch (error) {
      return IndicatorResult.fail;
    }
  }

  BasePaginationData<T> _onLoadCombine(
    BasePaginationData<T> existingData,
    BasePaginationData<T> newData,
  ) {
    return newData.copyWith(datas: [...existingData.datas, ...newData.datas]);
  }

  Future<BasePaginationData<T>> paginationRequest(int pageIndex, int pageSize);
}
