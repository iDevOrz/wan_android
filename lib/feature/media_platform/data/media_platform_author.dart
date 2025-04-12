import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_platform_author.freezed.dart';
part 'media_platform_author.g.dart';

@freezed
abstract class MediaPlatformAuthor with _$MediaPlatformAuthor {
  const factory MediaPlatformAuthor({
    required int id,
    required String name,
  }) = _MediaPlatformAuthor;

  factory MediaPlatformAuthor.fromJson(Map<String, dynamic> json) =>
      _$MediaPlatformAuthorFromJson(json);
}
