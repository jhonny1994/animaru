// ignore_for_file: invalid_annotation_target, lines_longer_than_80_chars

import 'package:animaru/domain/aired_model.dart';
import 'package:animaru/domain/thumbnails_model.dart';
import 'package:animaru/domain/titles_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_model.freezed.dart';
part 'anime_model.g.dart';

List<String> genresFromJson(List<Map<String, dynamic>> value) {
  return value.map((e) => e['name'] as String).toList();
}

String? trailerFromJson(Map<String, dynamic>? value) {
  return value?['url'] as String?;
}

@freezed
class Anime with _$Anime {
  const factory Anime({
    required String url,
    required Thumbnails images,
    @JsonKey(fromJson: trailerFromJson) required String? trailer,
    required Titles titles,
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
