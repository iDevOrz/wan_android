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
        builder: (ct) => AlertDialog(
          content: Text(errorMsg ?? ""),
          actions: [
            FilledButton(
                onPressed: () {
                  Navigator.of(ct).pop();
                  const LoginRouteData().push(context);
                },
                child: const Text("去登录"))
          ],
        ),
      ),
      apiException: (int errorCode, String? errorMsg) {
        final errorSnackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: MediaQuery.of(context).viewInsets,
            content: Text("${errorMsg ?? "未知异常"} code $errorCode"));
        ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
      },
      orElse: () => debugPrint(
        networkException.toString(),
      ),
    );
  }
}
