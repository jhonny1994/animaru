// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'aired_model.freezed.dart';
part 'aired_model.g.dart';

@freezed
class Aired with _$Aired {
  const factory Aired({
    @JsonKey(name: 'from') required DateTime from,
    @JsonKey(name: 'to') required DateTime? to,
    @JsonKey(name: 'string') required String string,
  }) = _Aired;

  factory Aired.fromJson(Map<String, dynamic> json) => _$AiredFromJson(json);
}
