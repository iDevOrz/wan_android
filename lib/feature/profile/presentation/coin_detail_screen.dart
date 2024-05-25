import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/feature/profile/presentation/profile_controller.dart';

class CoinDetailScreen extends ConsumerWidget {
  const CoinDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(profileControllerProvider);
    final theme = Theme.of(context);
    const title = "我的积分";
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Hero(
                tag: title,
                child: Container(
                  alignment: Alignment.center,
                  color: theme.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Text(
                    userInfo.maybeWhen(
                        data: (value) => value.coinInfo.coinCount.toString(),
                        orElse: () => ""),
                    style: theme.textTheme.headlineLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            )
          ];
        },
        body: ListView(),
      ),
    );
  }
}
