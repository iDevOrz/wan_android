import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_banner_item.freezed.dart';
part 'home_banner_item.g.dart';

/// 首页 Banner
/// https://www.wanandroid.com/banner/json
@freezed
class HomeBannerItem with _$HomeBannerItem {
  const factory HomeBannerItem({
    required String desc,
    required int id,
    required String imagePath,
    required int isVisible,
    required int order,
    required String title,
    required int type,
    required String url,
  }) = _HomeBannerItem;

  factory HomeBannerItem.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerItemFromJson(json);
}
