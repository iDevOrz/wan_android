import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/common/widgets/async_value_widget.dart';
import 'package:wan_android/common/widgets/wa_tabbar.dart';
import 'package:wan_android/feature/project/presentation/project_controller.dart';
import 'package:wan_android/feature/project/presentation/project_list_view.dart';

class ProjectScreen extends ConsumerWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
        value: ref.watch(projectControllerProvider),
        data: (tree) {
          return DefaultTabController(
            length: tree.length,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                title: WATabBar(tabLabelList: tree.map((e) => e.name).toList()),
              ),
              body: TabBarView(
                children: tree.map((e) => ProjectListView(cid: e.id)).toList(),
              ),
            ),
          );
        });
  }
}
