import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainTabBar extends StatefulWidget {
  final Widget child;

  const MainTabBar({super.key, required this.child});

  @override
  State<MainTabBar> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
  int _locationToTabIndex(String location) {
    final index = tabs.indexWhere((t) => location.startsWith(t.routerPath));

    return index < 0 ? 0 : index;
  }

  int get _currentIndex =>
      _locationToTabIndex(GoRouterState.of(context).uri.toString());

  final List<MainTabBarItem> tabs = <MainTabBarItem>[
    const MainTabBarItem(
      icon: Icon(Icons.home),
      activeIcon: Icon(Icons.home),
      label: "首页",
      routerPath: '/home',
    ),
    const MainTabBarItem(
      icon: Icon(Icons.developer_board),
      activeIcon: Icon(Icons.developer_board),
      label: "项目",
      routerPath: '/project',
    ),
    const MainTabBarItem(
      icon: Icon(Icons.list_alt),
      activeIcon: Icon(Icons.list_alt),
      label: "广场",
      routerPath: '/square',
    ),
    const MainTabBarItem(
      icon: Icon(Icons.person),
      activeIcon: Icon(Icons.person),
      label: "我的",
      routerPath: '/profile',
    ),
  ];

  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      context.go(tabs[tabIndex].routerPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: widget.child),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: tabs,
        onTap: (index) => _onItemTapped(context, index),
        unselectedFontSize: 10,
        selectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF3C3A35),
      ),
    );
  }
}

class MainTabBarItem extends BottomNavigationBarItem {
  const MainTabBarItem(
      {required this.routerPath,
      required super.icon,
      required Widget super.activeIcon,
      super.label});

  final String routerPath;
}
