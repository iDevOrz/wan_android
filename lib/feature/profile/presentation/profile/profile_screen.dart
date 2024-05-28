import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/feature/profile/presentation/profile/profile_controller.dart';
import 'package:wan_android/routers/go_router_builder.dart';
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
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 60),
            const CircleAvatar(
              radius: 80,
              child: FlutterLogo(size: 80),
            ),
            const SizedBox(height: 12),
            Text(
              textAlign: TextAlign.center,
              userInfo.maybeWhen(
                  data: (value) => value.userInfo.nickname, orElse: () => ""),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userInfo.maybeWhen(
                      data: (value) => "等级：${value.coinInfo.level.toString()}",
                      orElse: () => ""),
                ),
                const SizedBox(width: 8),
                Text(
                  userInfo.maybeWhen(
                      data: (value) => "排名：${value.coinInfo.rank.toString()}",
                      orElse: () => ""),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _listItemRowBuilder(
              context,
              icon: const Icon(Icons.paid_outlined),
              title: "我的积分",
              value: userInfo.maybeWhen(
                  data: (value) => value.coinInfo.coinCount.toString(),
                  orElse: () => ""),
              onTap: () {
                const CoinDetailRouteData().push(context);
              },
            ),
            _listItemRowBuilder(
              context,
              icon: const Icon(Icons.favorite_border),
              title: "我的收藏",
              onTap: () {},
            ),
            _listItemRowBuilder(
              context,
              icon: const Icon(Icons.share_outlined),
              title: "我的分享",
              onTap: () {},
            ),
            _listItemRowBuilder(
              context,
              icon: const Icon(Icons.today_outlined),
              title: "TODO",
              onTap: () {},
            ),
            _listItemRowBuilder(
              context,
              icon: const Icon(Icons.settings_suggest_outlined),
              title: "系统设置",
              onTap: () {},
            ),
            _listItemRowBuilder(
              context,
              icon: const Icon(Icons.login_outlined),
              title: "退出登录",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _listItemRowBuilder(BuildContext context,
      {required Widget icon,
      required String title,
      String? value,
      required GestureTapCallback onTap}) {
    return Hero(
      tag: title,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 6),
              Expanded(child: Text(title)),
              if (value != null) Text(value)
            ],
          ),
        ),
      ),
    );
  }
}
