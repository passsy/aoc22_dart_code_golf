import 'dart:io';

import 'package:test/test.dart';
import '../bin/day2_part1.dart' as day2_part1;
import '../bin/day2_part1.min.dart' as day2_part1_min;
import '../bin/day2_part2.dart' as day2_part2;
import '../bin/day2_part2.min.dart' as day2_part2_min;
import 'main_tester.dart';

void main() {
  group('day 2', () {
    test('sample part 1', () {
      final output = testMain(
        day2_part1.main,
        input: File('data/day2_sample.txt').readAsStringSync(),
      );
      expect(output, '15');
    });

    test('golf part 1', () {
      final output = testMain(
        day2_part1.main,
        input: File('data/day2_sample.txt').readAsStringSync(),
      );
      print(output);
    });

    test('solve part 1', () {
      final output = testMain(
        day2_part1.main,
        input: File('data/day2_input.txt').readAsStringSync(),
      );
      print(output);
    });

    test('sample part 2', () {
      final output = testMain(
        day2_part2.main,
        input: File('data/day2_sample.txt').readAsStringSync(),
      );
      expect(output, '12');
    });

    test('golf part 2', () {
      final output = testMain(
        day2_part2.main,
        input: File('data/day2_sample.txt').readAsStringSync(),
      );
      expect(output, '12');
    });

    test('solve part 2', () {
      final output = testMain(
        day2_part2.main,
        input: File('data/day2_input.txt').readAsStringSync(),
      );
      print(output);
    });
  });
}
