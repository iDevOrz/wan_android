import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/common/widgets/async_value_widget.dart';
import 'package:wan_android/feature/project/presentation/project_list_controller.dart';
import 'package:wan_android/feature/project/presentation/project_list_item_view.dart';

class ProjectListView extends ConsumerWidget {
  final int cid;

  const ProjectListView({super.key, required this.cid});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
        value: ref.watch(projectListControllerProvider.call(cid: cid)),
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (ct, index) => ProjectListItemView(data: data[index]),
          );
        });
  }
}
