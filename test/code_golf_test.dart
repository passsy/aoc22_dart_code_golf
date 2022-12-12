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
        markTestSkipped(
            '$filename: ${length - giveUpComment.length - '\n'.length} chars '
            '$giveUpComment');
        return;
      }
      print("$filename: ${length} chars");
      expect(length, lessThan(280));
    });
  }
}
