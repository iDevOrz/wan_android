import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/common/widgets/async_value_widget.dart';
import 'package:wan_android/feature/square/presentation/site_navigation_controller.dart';

import 'site_navigation_item_view.dart';

class SiteNavigationView extends ConsumerWidget {
  const SiteNavigationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
        value: ref.watch(siteNavigationControllerProvider),
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (ct, index) => SiteNavigationItemView(
              data: data[index],
            ),
          );
        });
  }
}
