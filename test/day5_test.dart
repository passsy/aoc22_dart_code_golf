import 'dart:io';

import 'package:test/test.dart';
import '../bin/day5_part1.dart' as day5_part1;
import '../bin/day5_part1.min.dart' as day5_part1_min;
import '../bin/day5_part2.dart' as day5_part2;
import '../bin/day5_part2.min.dart' as day5_part2_min;
import 'main_tester.dart';

void main() {
  group('day 5', () {
    test('sample part 1', () {
      final output = testMain(
        day5_part1.main,
        input: File('data/day5_sample.txt').readAsStringSync(),
      );
      expect(output, 'CMZ');
    });

    test('golf part 1', () {
      final output = testMain(
        day5_part1_min.main,
        input: File('data/day5_sample.txt').readAsStringSync(),
      );
      expect(output, 'CMZ');
    });

    test('solve part 1', () {
      final output = testMain(
        day5_part1.main,
        input: File('data/day5_input.txt').readAsStringSync(),
      );
      print(output);
    });

    test('sample part 2', () {
      final output = testMain(
        day5_part2.main,
        input: File('data/day5_sample.txt').readAsStringSync(),
      );
      expect(output, '100');
    });

    test('golf part 2', () {
      final output = testMain(
        day5_part2_min.main,
        input: File('data/day5_sample.txt').readAsStringSync(),
      );
      expect(output, '100');
    });

    test('solve part 2', () {
      final output = testMain(
        day5_part2.main,
        input: File('data/day5_input.txt').readAsStringSync(),
      );
      print(output);
    });
  });
}
