import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_item.freezed.dart';
part 'coin_item.g.dart';

@freezed
class CoinItem with _$CoinItem {
  const factory CoinItem({
    required int coinCount,
    required int date,
    required String desc,
    required int id,
    required String reason,
    required int type,
    required int userId,
    required String userName,
  }) = _CoinItem;

  factory CoinItem.fromJson(Map<String, dynamic> json) =>
      _$CoinItemFromJson(json);
}
