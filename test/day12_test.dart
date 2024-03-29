import 'dart:io';

import 'package:test/test.dart';
import '../bin/day12_part1.dart' as day12_part1;
import '../bin/day12_part1.min.dart' as day12_part1_min;
import '../bin/day12_part2.dart' as day12_part2;
import '../bin/day12_part2.min.dart' as day12_part2_min;
import 'main_tester.dart';

void main() {
  group('day 12', () {
    test('sample part 1', () {
      final output = testMain(
        day12_part1.main,
        input: File('data/day12_sample.txt').readAsStringSync(),
      );
      expect(output, '31');
    });

    test('golf part 1', () {
      final output = testMain(
        day12_part1_min.main,
        input: File('data/day12_sample.txt').readAsStringSync(),
      );
      expect(output, '31');
    });

    test('solve part 1', () {
      final output = testMain(
        day12_part1.main,
        input: File('data/day12_input.txt').readAsStringSync(),
      );
      expect(output, '420');
      print(output);
    });

    test('solve part 1 input2', () {
      final output = testMain(
        day12_part1.main,
        input: File('data/day12_input2.txt').readAsStringSync(),
      );
      expect(output, '383');
      print(output);
    });

    test('solve part 1 input3', () {
      final output = testMain(
        day12_part1.main,
        input: File('data/day12_input3.txt').readAsStringSync(),
      );
      expect(output, '352');
      print(output);
    });

    test('sample part 2', () {
      final output = testMain(
        day12_part2.main,
        input: File('data/day12_sample.txt').readAsStringSync(),
      );
      expect(output, '29');
    });

    test('golf part 2', () {
      final output = testMain(
        day12_part2_min.main,
        input: File('data/day12_sample.txt').readAsStringSync(),
      );
      expect(output, '29');
    });

    test('solve part 2', () {
      final output = testMain(
        day12_part2.main,
        input: File('data/day12_input.txt').readAsStringSync(),
      );
      expect(output, isNot('0'));
      print(output);
    });
  });
}
