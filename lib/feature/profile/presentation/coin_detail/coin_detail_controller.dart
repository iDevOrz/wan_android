import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/profile/data/coin_item.dart';
import 'package:wan_android/feature/profile/data/profile_repository.dart';

part 'coin_detail_controller.g.dart';

@riverpod
class CoinDetailController extends _$CoinDetailController {
  @override
  FutureOr<List<CoinItem>> build() async {
    return ref
        .watch(profileRepositoryProvider)
        .getCoinDetailList()
        .then((response) => response.data.datas);
  }
}
