import 'dart:io';

import 'package:test/test.dart';
import '../bin/day3_part1.dart' as day3_part1;
import '../bin/day3_part1.min.dart' as day3_part1_min;
import '../bin/day3_part2.dart' as day3_part2;
import '../bin/day3_part2.min.dart' as day3_part2_min;
import 'main_tester.dart';

void main() {
  group('day 3', () {
    test('sample part 1', () {
      final output = testMain(
        day3_part1.main,
        input: File('data/day3_sample.txt').readAsStringSync(),
      );
      expect(output, '157');
    });

    test('golf part 1', () {
      final output = testMain(
        day3_part1_min.main,
        input: File('data/day3_sample.txt').readAsStringSync(),
      );
      expect(output, '157');
    });

    test('solve part 1', () {
      final output = testMain(
        day3_part1.main,
        input: File('data/day3_input.txt').readAsStringSync(),
      );
      print(output);
    });

    test('sample part 2', () {
      final output = testMain(
        day3_part2.main,
        input: File('data/day3_sample.txt').readAsStringSync(),
      );
      expect(output, '70');
    });

    test('golf part 2', () {
      final output = testMain(
        day3_part2_min.main,
        input: File('data/day3_sample.txt').readAsStringSync(),
      );
      expect(output, '70');
    });

    test('solve part 2', () {
      final output = testMain(
        day3_part2.main,
        input: File('data/day3_input.txt').readAsStringSync(),
      );
      print(output);
    });
  });
}
