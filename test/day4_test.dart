import 'dart:io';

import 'package:test/test.dart';
import '../bin/day4_part1.dart' as day4_part1;
import '../bin/day4_part1.min.dart' as day4_part1_min;
import '../bin/day4_part2.dart' as day4_part2;
import '../bin/day4_part2.min.dart' as day4_part2_min;
import 'main_tester.dart';

void main() {
  group('day 4', () {
    test('sample part 1', () {
      final output = testMain(
        day4_part1.main,
        input: File('data/day4_sample.txt').readAsStringSync(),
      );
      expect(output, '2');
    });

    test('golf part 1', () {
      final output = testMain(
        day4_part1_min.main,
        input: File('data/day4_sample.txt').readAsStringSync(),
      );
      expect(output, '2');
    });

    test('solve part 1', () {
      final output = testMain(
        day4_part1.main,
        input: File('data/day4_input.txt').readAsStringSync(),
      );
      print(output);
    });

    test('sample part 2', () {
      final output = testMain(
        day4_part2.main,
        input: File('data/day4_sample.txt').readAsStringSync(),
      );
      expect(output, '4');
    });

    test('golf part 2', () {
      final output = testMain(
        day4_part2_min.main,
        input: File('data/day4_sample.txt').readAsStringSync(),
      );
      expect(output, '4');
    });

    test('solve part 2', () {
      final output = testMain(
        day4_part2.main,
        input: File('data/day4_input.txt').readAsStringSync(),
      );
      print(output);
    });
  });
}
