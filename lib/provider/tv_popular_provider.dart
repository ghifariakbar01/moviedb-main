import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb/model/tv/tv_mod_popular.dart';
import 'package:omdb/utils/api.helper.dart';

final tvPopularProvider = FutureProvider.autoDispose((ref) async {
  final result = await API.getPopularTv();
  return result ?? TVPopular();
});
