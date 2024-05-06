// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'titles_model.freezed.dart';
part 'titles_model.g.dart';

String titleEnglishFromJson(List<Map<String, dynamic>> value) {
  return value[3]['title'] as String;
}

String titleFromJson(List<Map<String, dynamic>> value) {
  return value[0]['title'] as String;
}

String titleJapaneseFromJson(List<Map<String, dynamic>> value) {
  return value[2]['url'] as String;
}

@freezed
class Titles with _$Titles {
  const factory Titles({
    @JsonKey(fromJson: titleFromJson) required String defaultTitle,
    @JsonKey(fromJson: titleEnglishFromJson) required String englishTitle,
    @JsonKey(fromJson: titleJapaneseFromJson) required String japaneaseTitle,
  }) = _Titles;

  factory Titles.fromJson(Map<String, dynamic> json) => _$TitlesFromJson(json);
}
