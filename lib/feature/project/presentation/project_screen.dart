import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/common/widgets/async_value_widget.dart';
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
                title: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white70,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(46), // Creates border
                      color: Colors.blueAccent),
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(12),
                  tabs: tree
                      .map(
                        (e) => Tab(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 23),
                          child: Text(e.name),
                        )),
                      )
                      .toList(),
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                ),
              ),
              body: TabBarView(
                children: tree.map((e) => ProjectListView(cid: e.id)).toList(),
              ),
            ),
          );
        });
  }
}
