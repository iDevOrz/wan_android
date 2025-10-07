import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wan_android/common/widgets/webview_screen.dart';
import 'package:wan_android/feature/home/presentation/home_screen.dart';
import 'package:wan_android/feature/media_platform/presentation/media_platform_screen.dart';
import 'package:wan_android/feature/profile/presentation/coin_detail/coin_detail_screen.dart';
import 'package:wan_android/feature/profile/presentation/login/login_screen.dart';
import 'package:wan_android/feature/profile/presentation/profile/profile_screen.dart';
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
    TypedGoRoute<MediaPlatformRouteData>(path: '/mediaPlatform'),
    TypedGoRoute<ProfileRouteData>(
      path: '/profile',
      routes: [TypedGoRoute<CoinDetailRouteData>(path: 'coin')],
    ),
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
class HomeRouteData extends GoRouteData with $HomeRouteData {
  const HomeRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: HomeScreen());
  }
}

@immutable
class ProjectRouteData extends GoRouteData with $ProjectRouteData {
  const ProjectRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: ProjectScreen());
  }
}

@immutable
class SquareRouteData extends GoRouteData with $SquareRouteData {
  const SquareRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SquareScreen());
  }
}

@immutable
class MediaPlatformRouteData extends GoRouteData with $MediaPlatformRouteData {
  const MediaPlatformRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: MediaPlatformScreen());
  }
}

@immutable
class ProfileRouteData extends GoRouteData with $ProfileRouteData {
  const ProfileRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: ProfileScreen());
  }
}

@immutable
class CoinDetailRouteData extends GoRouteData with $CoinDetailRouteData {
  const CoinDetailRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CoinDetailScreen();
  }
}

@TypedGoRoute<LoginRouteData>(path: '/login')
class LoginRouteData extends GoRouteData with $LoginRouteData {
  const LoginRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

@TypedGoRoute<WebviewRouteData>(path: '/detail')
class WebviewRouteData extends GoRouteData with $WebviewRouteData {
  const WebviewRouteData({required this.link});

  final String link;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WebviewScreen(link: link);
  }
}
