import 'package:english_words/english_words.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WordPairNotifier extends StateNotifier<List<WordPair>> {
  WordPairNotifier() : super([]);

  void add(WordPair wordPair) {
    state = [...state, wordPair];
  }

  void generate(int howMuch) {
    state = state..addAll(generateWordPairs().take(howMuch));
  }
}

final wordPairsNotifierProvider =
    StateNotifierProvider<WordPairNotifier, List>((ref) {
  return WordPairNotifier();
});
