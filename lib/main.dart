import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wan_android/route_name_log_navigator_observer.dart';
import 'package:wan_android/routers/go_router_builder.dart';

import 'services/storage/storage_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageConfig.init();
  runApp(ProviderScope(child: const MyApp(), retry: (_, _) => null));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// https://github.com/flutter/flutter/issues/113323#issuecomment-1277744429
  late final GoRouter _router;

  @override
  void initState() {
    _router = GoRouter(
      initialLocation: "/home",
      routes: $appRoutes,
      navigatorKey: rootNavigatorKey,
      observers: [RouteNameLogNavigatorObserver()],
    );
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
    );
  }
}
