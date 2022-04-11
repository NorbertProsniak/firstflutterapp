import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final wordsProvider = Provider<List<WordPair>>((ref) {
  final _suggestions = <WordPair>[];
  return _suggestions;
});

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
    final value = ref.watch(wordsProvider);
    final _biggerFont = const TextStyle(fontSize: 18.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= value.length) {
            value.addAll(generateWordPairs().take(10));
          }
          return ListTile(
            title: Text(
              value[index].asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      ),
    );
  }
}
