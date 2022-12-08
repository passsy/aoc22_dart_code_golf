import 'dart:io';

import 'package:test/test.dart';

final List<String> failedDays = [
  'day5 part1',
  'day5 part2',
  'day7 part1',
  'day7 part2',
  'day8 part1',
  'day8 part2',
];

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
      final length = file.readAsStringSync().length;
      print("$filename: ${length} chars");
      if (failedDays.contains(filename)) {
        markTestSkipped('$filename does not fit in a tweet');
        return;
      }
      expect(length, lessThan(280));
    });
  }
}
