import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/common/pagination/pagination_invoker.dart'
    show PaginationInvoker;

mixin CustomPaginationMixin<T> {
  @protected
  late final _paginationInvoker = PaginationInvoker<T>(
    paginationRequest: paginationRequest,
    onLoadCombine: onLoadCombine,
  );

  set state(AsyncValue<T> newState);

  AsyncValue<T> get state;

  Future<T> onBuild() {
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
      return newDataLength(newPageData) < _paginationInvoker.pageSize
          ? IndicatorResult.noMore
          : IndicatorResult.success;
    } catch (error) {
      return IndicatorResult.fail;
    }
  }

  /// [data] 的数据长度
  ///
  ///  e.g implementation: int newDataLength(SettlementMonthlyRecord data) => data.data.length
  int newDataLength(T data);

  T onLoadCombine(T existingData, T newData);

  Future<T> paginationRequest(int pageIndex, int pageSize);
}
