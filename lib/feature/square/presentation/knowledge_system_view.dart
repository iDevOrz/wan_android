import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/common/widgets/async_value_widget.dart';
import 'package:wan_android/feature/square/presentation/knowledge_system_controller.dart';

import 'knowledge_system_item_view.dart';

class KnowledgeSystemView extends ConsumerWidget {
  const KnowledgeSystemView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
        value: ref.watch(knowledgeSystemControllerProvider),
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (ct, index) => KnowledgeSystemListItemView(
              data: data[index],
            ),
          );
        });
  }
}
