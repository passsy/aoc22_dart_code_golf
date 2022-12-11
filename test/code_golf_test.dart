import 'dart:io';

import 'package:test/test.dart';

void main() {
  final files = Directory('bin')
      .listSync()
      .whereType<File>()
      .where((file) => file.path.endsWith('min.dart'))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  for (final file in files) {
    final filename = file.path
        .split('/')
        .last
        .replaceAll('.min.dart', '')
        .split('_')
        .join(' ');

    test('$filename fits in a tweet', () {
      final content = file.readAsStringSync();
      final length = content.length;
      final giveUpComment = '// Not worth golfing';
      final givenUp = content.contains(giveUpComment);
      if (givenUp) {
        print(
            "$filename: ${length - giveUpComment.length - '\n'.length} chars");
        markTestSkipped('Not worth golfing');
        return;
      }
      print("$filename: ${length} chars");
      expect(length, lessThan(280));
    });
  }
}
