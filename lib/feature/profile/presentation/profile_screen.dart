import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/feature/profile/presentation/profile_controller.dart';
import 'package:wan_android/services/error_handler.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(profileControllerProvider);

    ref.listen(profileControllerProvider, (previous, next) {
      if (next.hasError) {
        ErrorHandler().call(context, error: next.error!);
      }
    });

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            userInfo.maybeWhen(
                data: (value) => value.userInfo.nickname, orElse: () => ""),
          ),
          Text(
            userInfo.maybeWhen(
                data: (value) => value.userInfo.email, orElse: () => ""),
          )
        ],
      ),
    );
  }
}
