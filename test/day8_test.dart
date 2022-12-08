import 'dart:io';

import 'package:test/test.dart';
import '../bin/day8_part1.dart' as day8_part1;
import '../bin/day8_part1.min.dart' as day8_part1_min;
import '../bin/day8_part2.dart' as day8_part2;
import '../bin/day8_part2.min.dart' as day8_part2_min;
import 'main_tester.dart';

void main() {
  group('day 8', () {
    test('sample part 1', () {
      final output = testMain(
        day8_part1.main,
        input: File('data/day8_sample.txt').readAsStringSync(),
      );
      expect(output, '21');
    });

    test('golf part 1', () {
      final output = testMain(
        day8_part1_min.main,
        input: File('data/day8_sample.txt').readAsStringSync(),
      );
      expect(output, '21');
    });

    test('solve part 1', () {
      final output = testMain(
        day8_part1.main,
        input: File('data/day8_input.txt').readAsStringSync(),
      );
      expect(output, '1785');
      print(output);
    });

    test('sample part 2', () {
      final output = testMain(
        day8_part2.main,
        input: File('data/day8_sample.txt').readAsStringSync(),
      );
      expect(output, '8');
    });

    test('golf part 2', () {
      final output = testMain(
        day8_part2_min.main,
        input: File('data/day8_sample.txt').readAsStringSync(),
      );
      expect(output, '8');
    });

    test('solve part 2', () {
      final output = testMain(
        day8_part2.main,
        input: File('data/day8_input.txt').readAsStringSync(),
      );
      expect(output, isNot('0'));
      print(output);
    });
  });
}
