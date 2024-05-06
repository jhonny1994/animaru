// ignore_for_file: lines_longer_than_80_chars

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    required int lastVisiblePage,
    required bool hasNextPage,
    required int currentPage,
    required int total,
    required int perPage,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}
