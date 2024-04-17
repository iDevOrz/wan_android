import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_pagination_data.g.dart';
part 'base_pagination_data.freezed.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class BasePaginationData<T> with _$BasePaginationData<T> {
  const factory BasePaginationData({
    required int curPage,
    required List<T> datas,
    required int offset,
    required bool over,
    required int pageCount,
    required int size,
    required int total,
  }) = _BasePaginationData<T>;

  factory BasePaginationData.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$BasePaginationDataFromJson<T>(json, fromJsonT);
  }
}
