import 'dart:io';

void main(List<String> args) {
  final day = args[0];
  final part1File = File('bin/day${day}_part1.dart')
    ..createSync()
    ..writeAsStringSync('''
void main(List<String> args) {
  print(0);
}
''');
  final part1MinFile = File('bin/day${day}_part1.min.dart')
    ..createSync()
    ..writeAsStringSync('''
main(a, {i}) {
  print(0);
}
''');

  final part2File = File('bin/day${day}_part2.dart')
    ..createSync()
    ..writeAsStringSync('''
void main(List<String> args) {
  print(0);
}
''');
  final part2MinFile = File('bin/day${day}_part2.min.dart')
    ..createSync()
    ..writeAsStringSync('''
main(a, {i}) {
  print(0);
}
''');

  final sampleFile = File('data/day${day}_sample.txt')..createSync();
  final input = File('data/day${day}_input.txt')..createSync();

  final testFile = File('test/day${day}_test.dart')
    ..createSync()
    ..writeAsStringSync('''
import 'dart:io';

import 'package:test/test.dart';
import '../bin/day${day}_part1.dart' as day${day}_part1;
import '../bin/day${day}_part1.min.dart' as day${day}_part1_min;
import '../bin/day${day}_part2.dart' as day${day}_part2;
import '../bin/day${day}_part2.min.dart' as day${day}_part2_min;
import 'main_tester.dart';

void main() {
  group('day ${day}', () {
    test('sample part 1', () {
      final output = testMain(
        day${day}_part1.main,
        input: File('data/day${day}_sample.txt').readAsStringSync(),
      );
      expect(output, '100');
    });

    test('golf part 1', () {
      final output = testMain(
        day${day}_part1_min.main,
        input: File('data/day${day}_sample.txt').readAsStringSync(),
      );
      expect(output, '100');
    });

    test('solve part 1', () {
      final output = testMain(
        day${day}_part1.main,
        input: File('data/day${day}_input.txt').readAsStringSync(),
      );
      expect(output, isNot('0'));
      print(output);
    });

    test('sample part 2', () {
      final output = testMain(
        day${day}_part2.main,
        input: File('data/day${day}_sample.txt').readAsStringSync(),
      );
      expect(output, '100');
    });

    test('golf part 2', () {
      final output = testMain(
        day${day}_part2_min.main,
        input: File('data/day${day}_sample.txt').readAsStringSync(),
      );
      expect(output, '100');
    });

    test('solve part 2', () {
      final output = testMain(
        day${day}_part2.main,
        input: File('data/day${day}_input.txt').readAsStringSync(),
      );
      expect(output, isNot('0'));
      print(output);
    });
  });
}
''');

  assert(part1File.existsSync());
  assert(part1MinFile.existsSync());
  assert(part2File.existsSync());
  assert(part2MinFile.existsSync());
  assert(testFile.existsSync());
  assert(sampleFile.existsSync());
  assert(input.existsSync());
}
