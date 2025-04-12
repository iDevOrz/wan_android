import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wan_android/routers/go_router_builder.dart'
    show $LoginRouteDataExtension, LoginRouteData;
import 'package:wan_android/services/network/network_exception.dart';

class ErrorHandler {
  FutureOr call(BuildContext context, {required Object error}) {
    if (error is NetworkException) {
      return _handleNetworkException(context, networkException: error);
    }
  }

  FutureOr _handleNetworkException(BuildContext context,
      {required NetworkException networkException}) {
    switch (networkException) {
      case NetworkExceptionNeedLogin():
        showDialog(
          context: context,
          useRootNavigator: true,
          builder: (ct) => AlertDialog(
            content: Text(networkException.errorMsg ?? ""),
            actions: [
              FilledButton(
                  onPressed: () {
                    Navigator.of(ct).pop();
                    const LoginRouteData().push(context);
                  },
                  child: const Text("去登录"))
            ],
          ),
        );
      case ApiException():
        final errorSnackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: MediaQuery.of(context).viewInsets,
            content: Text(
                "${networkException.errorMsg ?? "未知异常"} code ${networkException.errorCode}"));
        ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
      case FormatException():
      case UnrecognizedException():
      case ConnectTimeoutException():
      case ReceiveTimeoutException():
      case SendTimeoutException():
      case BadCertificateException():
      case BadResponseException():
      case ConnectionErrorException():
      case CancelException():
        debugPrint(networkException.toString());
    }
  }
}
