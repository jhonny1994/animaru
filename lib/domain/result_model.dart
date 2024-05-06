import 'package:animaru/domain/anime_model.dart';
import 'package:animaru/domain/pagination_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_model.freezed.dart';
part 'result_model.g.dart';

@freezed
class Result with _$Result {
  const factory Result({
    required Pagination pagination,
    required List<Anime> animes,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
