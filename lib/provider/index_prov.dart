import 'package:riverpod/riverpod.dart';

// using riverpod
final cardIndexStateNotifierProvider =
    StateNotifierProvider<IndexCarousell, int>((ref) {
  return IndexCarousell();
});

class IndexCarousell extends StateNotifier<int> {
  IndexCarousell() : super(0);

  get currentIndex => super.state;

  void changeIndex(int index) {
    state = index;
  }
}
