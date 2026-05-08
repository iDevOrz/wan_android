import 'package:flutter/material.dart';

class RouteNameLogNavigatorObserver extends NavigatorObserver {
  @override
  void didChangeTop(Route topRoute, Route? previousTopRoute) {
    debugPrint(
      "didChangeTop name:${topRoute.settings.name} name:${topRoute.settings}",
    );
    super.didChangeTop(topRoute, previousTopRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint("didPush ${route.settings.name}");
    super.didPush(route, previousRoute);
  }
}
