import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
abstract class UserInfo with _$UserInfo {
  const factory UserInfo({
    required CoinInfo coinInfo,
    required UserInfoClass userInfo,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

@freezed
abstract class CoinInfo with _$CoinInfo {
  const factory CoinInfo({
    required int coinCount,
    required int level,
    required String nickname,
    required String rank,
    required int userId,
    required String username,
  }) = _CoinInfo;

  factory CoinInfo.fromJson(Map<String, dynamic> json) =>
      _$CoinInfoFromJson(json);
}

@freezed
abstract class UserInfoClass with _$UserInfoClass {
  const factory UserInfoClass({
    required bool admin,
    required List<dynamic> chapterTops,
    required int coinCount,
    required List<dynamic> collectIds,
    required String email,
    required String icon,
    required int id,
    required String nickname,
    required String password,
    required String publicName,
    required String token,
    required int type,
    required String username,
  }) = _UserInfoClass;

  factory UserInfoClass.fromJson(Map<String, dynamic> json) =>
      _$UserInfoClassFromJson(json);
}
