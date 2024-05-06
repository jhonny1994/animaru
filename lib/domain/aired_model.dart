import 'package:freezed_annotation/freezed_annotation.dart';

part 'aired_model.freezed.dart';
part 'aired_model.g.dart';

@freezed
class Aired with _$Aired {
  const factory Aired({
    required DateTime? from,
    required DateTime? to,
    required String? string,
  }) = _Aired;

  factory Aired.fromJson(Map<String, dynamic> json) => _$AiredFromJson(json);
}
