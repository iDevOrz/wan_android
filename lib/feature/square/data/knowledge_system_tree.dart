import 'package:freezed_annotation/freezed_annotation.dart';

part 'knowledge_system_tree.freezed.dart';
part 'knowledge_system_tree.g.dart';

@freezed
abstract class KnowledgeSystemTree with _$KnowledgeSystemTree {
  const factory KnowledgeSystemTree({
    required List<dynamic> articleList,
    required String author,
    required List<KnowledgeSystemTree> children,
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
  }) = _KnowledgeSystemTree;

  factory KnowledgeSystemTree.fromJson(Map<String, dynamic> json) =>
      _$KnowledgeSystemTreeFromJson(json);
}
