import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wan_android/routers/go_router_builder.dart';

class MainTabBar extends StatefulWidget {
  final Widget child;

  const MainTabBar({super.key, required this.child});

  @override
  State<MainTabBar> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
  int _locationToTabIndex(String location) {
    final index = tabs.indexWhere(
          (t) =>
          location.startsWith(t
              .goRouteData()
              .location),
    );

    return index < 0 ? 0 : index;
  }

  int get _currentIndex =>
      _locationToTabIndex(GoRouterState
          .of(context)
          .uri
          .toString());

  final List<MainTabBarItem> tabs = <MainTabBarItem>[
    MainTabBarItem(
      icon: const Icon(Icons.home),
      activeIcon: const Icon(Icons.home),
      label: "首页",
      goRouteData: () => const HomeRouteData(),
    ),
    MainTabBarItem(
      icon: const Icon(Icons.developer_board),
      activeIcon: const Icon(Icons.developer_board),
      label: "项目",
      goRouteData: () => const ProjectRouteData(),
    ),
    MainTabBarItem(
      icon: const Icon(Icons.list_alt),
      activeIcon: const Icon(Icons.list_alt),
      label: "广场",
      goRouteData: () => const SquareRouteData(),
    ),
    MainTabBarItem(
      icon: const Icon(Icons.wechat),
      activeIcon: const Icon(Icons.wechat),
      label: "公众号",
      goRouteData: () => const MediaPlatformRouteData(),
    ),
    MainTabBarItem(
      icon: const Icon(Icons.person),
      activeIcon: const Icon(Icons.person),
      label: "我的",
      goRouteData: () => const ProfileRouteData(),
    ),
  ];

  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      tabs[tabIndex].goRouteData().go(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Expanded(child: widget.child)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: tabs,
        onTap: (index) => _onItemTapped(context, index),
        unselectedFontSize: 10,
        selectedFontSize: 10,
        type: .fixed,
        selectedItemColor: const Color(0xFF3C3A35),
      ),
    );
  }
}

class MainTabBarItem extends BottomNavigationBarItem {
  const MainTabBarItem({
    required this.goRouteData,
    required super.icon,
    required Widget super.activeIcon,
    super.label,
  });

  final GoRouteData Function() goRouteData;
}
