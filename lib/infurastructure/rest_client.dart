import 'package:animaru/domain/result_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rest_client.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio();
}

@riverpod
class RestClient extends _$RestClient {
  @override
  FutureOr<Result> build() async {
    // final request = await ref.read(dioProvider).get<Map<String, dynamic>>('https://api.jikan.moe/v4/seasons/now');
    await Future<void>.delayed(const Duration(seconds: 3));
    final result = Result.fromJson(dummyResult);
    return result;
  }
}
