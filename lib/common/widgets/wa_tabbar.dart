import 'package:flutter/material.dart';

class WATabBar extends StatelessWidget {
  const WATabBar({super.key, required this.tabLabelList});

  final List<String> tabLabelList;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(46), // Creates border
          color: Colors.blueAccent),
      indicatorPadding: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      tabs: tabLabelList.map(_tabBuilder).toList(),
      isScrollable: true,
      tabAlignment: TabAlignment.start,
    );
  }

  Tab _tabBuilder(String label) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Text(label),
      ),
    );
  }
}
