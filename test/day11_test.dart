import 'dart:io';

import 'package:test/test.dart';
import '../bin/day11_part1.dart' as day11_part1;
import '../bin/day11_part1.min.dart' as day11_part1_min;
import '../bin/day11_part2.dart' as day11_part2;
import '../bin/day11_part2.min.dart' as day11_part2_min;
import 'main_tester.dart';

void main() {
  group('day 11', () {
    test('sample part 1', () {
      final output = testMain(
        day11_part1.main,
        input: File('data/day11_sample.txt').readAsStringSync(),
        split: '\n\n',
      );
      expect(output, '10605');
    });

    test('golf part 1', () {
      final output = testMain(
        day11_part1_min.main,
        input: File('data/day11_sample.txt').readAsStringSync(),
        split: '\n\n',
      );
      expect(output, '10605');
    });

    test('solve part 1', () {
      final output = testMain(
        day11_part1.main,
        input: File('data/day11_input.txt').readAsStringSync(),
        split: '\n\n',
      );
      expect(output, isNot('0'));
      // 295815 too high
      expect(output, isNot('295815'));
      print(output);
    });

    test('sample part 2', () {
      final output = testMain(
        day11_part2.main,
        input: File('data/day11_sample.txt').readAsStringSync(),
        split: '\n\n',
      );
      print(output);
      expect(output, '2713310158');
    });

    test('golf part 2', () {
      final output = testMain(
        day11_part2_min.main,
        input: File('data/day11_sample.txt').readAsStringSync(),
        split: '\n\n',
      );
      expect(output, '2713310158');
    });

    test('solve part 2', () {
      final output = testMain(
        day11_part2.main,
        input: File('data/day11_input.txt').readAsStringSync(),
        split: '\n\n',
      );
      expect(output, isNot('0'));
      print(output);
    });
  });
}
