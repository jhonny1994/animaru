// ignore_for_file: lines_longer_than_80_chars, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'thumbnails_model.freezed.dart';
part 'thumbnails_model.g.dart';

@freezed
class JpgImage with _$JpgImage {
  const factory JpgImage({
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'small_image_url') required String smallImageUrl,
    @JsonKey(name: 'large_image_url') required String largeImageUrl,
  }) = _JpgImage;

  factory JpgImage.fromJson(Map<String, dynamic> json) => _$JpgImageFromJson(json);
}

@freezed
class Thumbnails with _$Thumbnails {
  const factory Thumbnails({
    @JsonKey(name: 'jpg') required JpgImage jpg,
  }) = _Thumbnails;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => _$ThumbnailsFromJson(json);
}
