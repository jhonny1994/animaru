// ignore_for_file: lines_longer_than_80_chars

import 'package:freezed_annotation/freezed_annotation.dart';

part 'thumbnails_model.freezed.dart';
part 'thumbnails_model.g.dart';

@freezed
class Thumbnails with _$Thumbnails {
  const factory Thumbnails({
    required String? imageUrl,
    required String? smallImageUrl,
    required String? largeImageUrl,
  }) = _Thumbnails;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => _$ThumbnailsFromJson(json);
}
