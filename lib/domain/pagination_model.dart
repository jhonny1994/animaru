// ignore_for_file: lines_longer_than_80_chars, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    @JsonKey(name: 'last_visible_page') required int lastVisiblePage,
    @JsonKey(name: 'has_next_page') required bool hasNextPage,
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'items') required Items items,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}

@freezed
class Items with _$Items {
  const factory Items({
    @JsonKey(name: 'count') required int count,
    @JsonKey(name: 'total') required int total,
    @JsonKey(name: 'per_page') required int perPage,
  }) = _Items;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
}
