import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/common/widgets/async_value_widget.dart';
import 'package:wan_android/feature/square/presentation/question_list_controller.dart';
import 'package:wan_android/feature/square/presentation/question_list_item_view.dart';

class QuestionListView extends ConsumerWidget {
  const QuestionListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
        value: ref.watch(questionListControllerProvider),
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (ct, index) => QuestionListItemView(
              data: data[index],
            ),
          );
        });
  }
}
