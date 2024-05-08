// ignore_for_file: invalid_annotation_target, lines_longer_than_80_chars

import 'package:animaru/domain/aired_model.dart';
import 'package:animaru/domain/thumbnails_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_model.freezed.dart';
part 'anime_model.g.dart';

List<String> genresFromJson(List<dynamic> value) {
  return value.map((e) => (e as Map<String, dynamic>)['name'] as String).toList();
}

String? trailerFromJson(Map<String, dynamic>? value) {
  return value?['embed_url'] as String?;
}

@freezed
class Anime with _$Anime {
  const factory Anime({
    @JsonKey(name: 'url') required String url,
    @JsonKey(name: 'images') required Thumbnails images,
    @JsonKey(name: 'trailer', fromJson: trailerFromJson) required String? trailer,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'title_english') required String? titleEnglish,
    @JsonKey(name: 'title_japanese') required String? titleJapanese,
    required String? type,
    required String? source,
    required int? episodes,
    required String? status,
    required bool airing,
    required Aired aired,
    required String? duration,
    required String? rating,
    required double? score,
    required int? scoredBy,
    required int? rank,
    required int? popularity,
    required int? favorites,
    required String? synopsis,
    required String? background,
    required String? season,
    required int? year,
    @JsonKey(fromJson: genresFromJson) required List<String> genres,
  }) = _Anime;

  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);
}
