import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_list_item.freezed.dart';
part 'project_list_item.g.dart';

@freezed
class ProjectListItem with _$ProjectListItem {
  const factory ProjectListItem({
    required bool adminAdd,
    required String apkLink,
    required int audit,
    required String author,
    required bool canEdit,
    required int chapterId,
    required String chapterName,
    required bool collect,
    required int courseId,
    required String desc,
    required String descMd,
    required String envelopePic,
    required bool fresh,
    required String host,
    required int id,
    required bool isAdminAdd,
    required String link,
    required String niceDate,
    required String niceShareDate,
    required String origin,
    required String prefix,
    required String projectLink,
    required int publishTime,
    required int realSuperChapterId,
    required int selfVisible,
    required int shareDate,
    required String shareUser,
    required int superChapterId,
    required String superChapterName,
    required List<ProjectTag> tags,
    required String title,
    required int type,
    required int userId,
    required int visible,
    required int zan,
  }) = _ProjectListItem;

  factory ProjectListItem.fromJson(Map<String, dynamic> json) =>
      _$ProjectListItemFromJson(json);
}

@freezed
class ProjectTag with _$ProjectTag {
  const factory ProjectTag({
    required String name,
    required String url,
  }) = _ProjectTag;

  factory ProjectTag.fromJson(Map<String, dynamic> json) =>
      _$ProjectTagFromJson(json);
}
