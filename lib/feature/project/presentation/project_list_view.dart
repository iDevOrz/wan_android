import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/common/widgets/async_value_widget.dart';
import 'package:wan_android/feature/project/presentation/project_list_controller.dart';

import 'project_list_item_view.dart';

class ProjectListView extends ConsumerWidget {
  final int cid;

  const ProjectListView({super.key, required this.cid});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(projectListControllerProvider(cid: cid).notifier);
    final asyncData = ref.watch(projectListControllerProvider(cid: cid));
    return EasyRefresh(
      onRefresh: notifier.onRefresh,
      onLoad: asyncData.hasValue ? notifier.onLoad : null,
      child: AsyncValueWidget(
        value: asyncData,
        data: (data) {
          return ListView.builder(
            itemCount: data.datas.length,
            itemBuilder: (ct, index) =>
                ProjectListItemView(data: data.datas[index]),
          );
        },
      ),
    );
  }
}
