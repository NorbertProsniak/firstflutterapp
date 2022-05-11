import 'package:firstflutterapp/word_provider.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends ConsumerWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordPairProvider = ref.read(wordPairsNotifierProvider);
    final wordPairProviderNotifier =
        ref.read(wordPairsNotifierProvider.notifier);

    const _biggerFont = TextStyle(fontSize: 18.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          wordPairProviderNotifier.generate(10);
          return ListTile(
            title: Text(
              wordPairProvider[index].toString(),
              style: _biggerFont,
            ),
          );
        },
      ),
    );
  }
}

class WordPairNotifier extends StateNotifier<List<WordPair>> {
  WordPairNotifier() : super([]);

  void add(WordPair wordPair) {
    state = [...state, wordPair];
  }
}
