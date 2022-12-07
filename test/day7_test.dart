import 'dart:io';

import 'package:test/test.dart';
import '../bin/day7_part1.dart' as day7_part1;
import '../bin/day7_part1.min.dart' as day7_part1_min;
import '../bin/day7_part2.dart' as day7_part2;
import '../bin/day7_part2.min.dart' as day7_part2_min;
import 'main_tester.dart';

void main() {
  group('day 7', () {
    test('sample part 1', () {
      final output = testMain(
        day7_part1.main,
        input: File('data/day7_sample.txt').readAsStringSync(),
      );
      expect(output, '95437');
    });
    test('input part 1', () {
      final output = testMain(
        day7_part1.main,
        input: File('data/day7_input.txt').readAsStringSync(),
      );
      expect(output, '1723892');
    });

    test('golf part 1 sample ', () {
      final output = testMain(
        day7_part1_min.main,
        input: File('data/day7_sample.txt').readAsStringSync(),
      );
      expect(output, '95437');
    });

    test('golf part 1 input', () {
      final output = testMain(
        day7_part1_min.main,
        input: File('data/day7_input.txt').readAsStringSync(),
      );
      expect(output, '1723892');
    });

    test('solve part 1', () {
      final output = testMain(
        day7_part1.main,
        input: File('data/day7_input.txt').readAsStringSync(),
      );
      print(output);
    });

    test('sample part 2', () {
      final output = testMain(
        day7_part2.main,
        input: File('data/day7_sample.txt').readAsStringSync(),
      );
      expect(output, '24933642');
    });

    test('golf part 2', () {
      final output = testMain(
        day7_part2_min.main,
        input: File('data/day7_sample.txt').readAsStringSync(),
      );
      expect(output, '24933642');
    });

    test('solve part 2', () {
      final output = testMain(
        day7_part2.main,
        input: File('data/day7_input.txt').readAsStringSync(),
      );
      expect(output, isNot(0));
      print(output);
    });
  });
}
