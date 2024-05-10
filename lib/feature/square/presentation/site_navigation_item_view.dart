import 'package:flutter/material.dart';
import 'package:wan_android/feature/square/data/site_navigation_item.dart';

class SiteNavigationItemView extends StatelessWidget {
  const SiteNavigationItemView({super.key, required this.data});

  final SiteNavigationItem data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              data.name,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Wrap(
              spacing: 8,
              children: data.articles
                  .map((e) =>
                      FilledButton(onPressed: () {}, child: Text(e.title)))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
