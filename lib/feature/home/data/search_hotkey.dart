import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_hotkey.freezed.dart';
part 'search_hotkey.g.dart';

@freezed
class SearchHotkey with _$SearchHotkey {
  const factory SearchHotkey({
    required int id,
    required String link,
    required String name,
    required int order,
    required int visible,
  }) = _SearchHotkey;

  factory SearchHotkey.fromJson(Map<String, dynamic> json) =>
      _$SearchHotkeyFromJson(json);
}
