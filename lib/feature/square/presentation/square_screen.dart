import 'package:flutter/material.dart';
import 'package:wan_android/common/widgets/wa_tabbar.dart';
import 'package:wan_android/feature/square/presentation/knowledge_system_view.dart';
import 'package:wan_android/feature/square/presentation/question_list_view.dart';
import 'package:wan_android/feature/square/presentation/site_navigation_view.dart';
import 'package:wan_android/feature/square/presentation/square_list_view.dart';

class SquareScreen extends StatelessWidget {
  const SquareScreen({super.key});

  static const _tabLabelList = ["广场", "每日一问", "体系", "导航"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabLabelList.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const WATabBar(tabLabelList: _tabLabelList),
        ),
        body: const TabBarView(children: [
          SquareListView(),
          QuestionListView(),
          KnowledgeSystemView(),
          SiteNavigationView()
        ]),
      ),
    );
  }
}
