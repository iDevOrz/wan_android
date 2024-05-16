import 'dart:async';

import 'package:flutter/material.dart';
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
        ),
      ),
      orElse: () => debugPrint(
        networkException.toString(),
      ),
    );
  }
}
