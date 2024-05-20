import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wan_android/routers/go_router_builder.dart';
import 'package:wan_android/services/network/network_exception.dart';

class ErrorHandler {
  FutureOr call(BuildContext context, {required Object error}) {
    if (error is NetworkException) {
      return _handleNetworkException(context, networkException: error);
    }
  }

  FutureOr _handleNetworkException(BuildContext context,
      {required NetworkException networkException}) {
    networkException.maybeWhen(
      needLogin: (errorMsg) => showDialog(
        context: context,
        useRootNavigator: true,
        builder: (_) => AlertDialog(
          content: Text(errorMsg ?? ""),
          actions: [
            FilledButton(
                onPressed: () {
                  const LoginRouteData().replace(context);
                },
                child: const Text("去登录"))
          ],
        ),
      ),
      orElse: () => debugPrint(
        networkException.toString(),
      ),
    );
  }
}
