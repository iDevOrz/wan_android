import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_article_list_item.freezed.dart';
part 'home_article_list_item.g.dart';

@freezed
class HomeArticleListItem with _$HomeArticleListItem {
  const factory HomeArticleListItem({
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
    required List<ArticleTag> tags,
    required String title,
    required int type,
    required int userId,
    required int visible,
    required int zan,
  }) = _HomeArticleListItem;

  factory HomeArticleListItem.fromJson(Map<String, dynamic> json) =>
      _$HomeArticleListItemFromJson(json);
}

@freezed
class ArticleTag with _$ArticleTag {
  const factory ArticleTag({
    required String name,
    required String url,
  }) = _ArticleTag;

  factory ArticleTag.fromJson(Map<String, dynamic> json) =>
      _$ArticleTagFromJson(json);
}
