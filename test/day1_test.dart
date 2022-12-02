import 'dart:io';

import 'package:test/test.dart';
import '../bin/day1_part1.dart' as day1_part1;
import '../bin/day1_part1.min.dart' as day1_part1_min;
import '../bin/day1_part2.dart' as day1_part2;
import '../bin/day1_part2.min.dart' as day1_part2_min;
import 'main_tester.dart';

void main() {
  group('day 1', () {
    test('sample part 1', () {
      final output = testMain(
        day1_part1.main,
        input: File('data/day1_sample.txt').readAsStringSync(),
      );
      expect(output, '24000');
    });

    test('golf part 1', () {
      final output = testMain(
        day1_part1_min.main,
        input: File('data/day1_sample.txt').readAsStringSync(),
      );
      expect(output, '24000');
    });

    test('solve part 1', () {
      final output = testMain(
        day1_part1.main,
        input: File('data/day1_sample.txt').readAsStringSync(),
      );
      print(output);
    });

    test('sample part 2', () {
      final output = testMain(
        day1_part2.main,
        input: File('data/day1_sample.txt').readAsStringSync(),
      );
      expect(output, '45000');
    });

    test('golf part 2', () {
      final output = testMain(
        day1_part2_min.main,
        input: File('data/day1_sample.txt').readAsStringSync(),
      );
      expect(output, '45000');
    });

    test('solve part 2', () {
      final output = testMain(
        day1_part2.main,
        input: File('data/day1_sample.txt').readAsStringSync(),
      );
      print(output);
    });
  });
}
