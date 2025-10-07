class PaginationInvoker<T> {
  static const defaultPageSize = 10;

  int get pageIndex => _pageIndex;

  int _pageIndex = 1;

  T get state => _state!;

  T? _state;

  final int pageSize;

  final Future<T> Function(int pageIndex, int pageSize) paginationRequest;

  /// 下拉加载更多合并数据处理方法
  ///
  /// [existingData] 已有数据，[newData] 新数据
  ///
  /// 返回合并后的数据
  final T Function(T existingData, T newData) onLoadCombine;

  PaginationInvoker({
    this.pageSize = defaultPageSize,
    required this.paginationRequest,
    required this.onLoadCombine,
  });

  /// 下拉刷新
  ///
  /// 更新State
  ///
  /// 返回本次刷新获得的数据
  Future<T> onRefresh() async {
    final result = await paginationRequest(1, pageSize);
    _pageIndex = 1;
    _state = result;
    return result;
  }

  /// 上拉加载更新
  ///
  /// 更新State
  ///
  /// 返回本次加载获得的数据
  Future<T> onLoad() async {
    final result = await paginationRequest(_pageIndex + 1, pageSize);
    _pageIndex = _pageIndex + 1;
    _state = onLoadCombine.call(_state as T, result);
    return result;
  }
}
