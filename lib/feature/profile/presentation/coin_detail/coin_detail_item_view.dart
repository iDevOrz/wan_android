import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/feature/profile/data/coin_item.dart';

class CoinDetailItemView extends StatelessWidget {
  const CoinDetailItemView({super.key, required this.data});

  final CoinItem data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                data.reason,
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Text(
                data.desc,
                style: TextStyle(color: theme.colorScheme.secondary),
              )
            ],
          )),
          Text(
            (data.coinCount > 0 ? "+" : "") + data.coinCount.toString(),
            style: theme.textTheme.titleMedium
                ?.copyWith(color: theme.primaryColor),
          ),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<CoinItem>('data', data));
  }
}
