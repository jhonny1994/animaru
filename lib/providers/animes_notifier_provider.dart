import 'package:animaru/domain/result_model.dart';
import 'package:animaru/infurastructure/rest_client.dart';
import 'package:animaru/providers/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animeNotifierProvider = StateNotifierProvider<AnimesNotifier, AsyncValue<Result>>((ref) {
  return AnimesNotifier(ref.read(dioProvider));
});
