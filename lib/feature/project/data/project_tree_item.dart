import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_tree_item.freezed.dart';
part 'project_tree_item.g.dart';

@freezed
abstract class ProjectTreeItem with _$ProjectTreeItem {
  const factory ProjectTreeItem({
    required List<dynamic> articleList,
    required String author,
    required List<dynamic> children,
    required int courseId,
    required String cover,
    required String desc,
    required int id,
    required String lisense,
    required String lisenseLink,
    required String name,
    required int order,
    required int parentChapterId,
    required int type,
    required bool userControlSetTop,
    required int visible,
  }) = _ProjectTreeItem;

  factory ProjectTreeItem.fromJson(Map<String, dynamic> json) =>
      _$ProjectTreeItemFromJson(json);
}
