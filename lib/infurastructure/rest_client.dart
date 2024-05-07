import 'package:animaru/domain/result_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimesNotifier extends StateNotifier<AsyncValue<Result>> {
  AnimesNotifier(this.dio) : super(const AsyncValue.loading()) {
    getSeasonAnimes();
  }

  final Dio dio;

  Future<void> getSeasonAnimes() async {
    state = const AsyncValue.loading();
    try {
      final request = await dio.get<Map<String, dynamic>>('https://api.jikan.moe/v4/seasons/now?sfw=false');
      final result = Result.fromJson(request.data!);
      state = AsyncValue.data(result);
    } on DioException catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> getTopAnimes() async {
    state = const AsyncValue.loading();
    try {
      final request = await dio.get<Map<String, dynamic>>('https://api.jikan.moe/v4/seasons/now?sfw=false');
      final result = Result.fromJson(request.data!);
      state = AsyncValue.data(result);
    } on DioException catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
