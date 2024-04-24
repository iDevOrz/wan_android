import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wan_android/feature/home/presentation/home_screen.dart';
import 'package:wan_android/feature/profile/presentation/profile_screen.dart';
import 'package:wan_android/feature/project/presentation/project_screen.dart';
import 'package:wan_android/feature/square/presentation/square_screen.dart';

import 'main_tab_bar.dart';

part 'go_router_builder.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<MainTabBarShellRouteData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRouteData>(path: '/home'),
    TypedGoRoute<ProjectRouteData>(path: '/project'),
    TypedGoRoute<SquareRouteData>(path: '/square'),
    TypedGoRoute<ProfileRouteData>(path: '/profile'),
  ],
)
class MainTabBarShellRouteData extends ShellRouteData {
  const MainTabBarShellRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MainTabBar(child: navigator);
  }
}

@immutable
class HomeRouteData extends GoRouteData {
  const HomeRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: HomeScreen());
  }
}

@immutable
class ProjectRouteData extends GoRouteData {
  const ProjectRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: ProjectScreen());
  }
}

@immutable
class SquareRouteData extends GoRouteData {
  const SquareRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SquareScreen());
  }
}

@immutable
class ProfileRouteData extends GoRouteData {
  const ProfileRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: ProfileScreen());
  }
}
