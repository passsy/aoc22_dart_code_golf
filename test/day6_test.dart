import 'dart:io';

import 'package:test/test.dart';
import '../bin/day6_part1.dart' as day6_part1;
import '../bin/day6_part1.min.dart' as day6_part1_min;
import '../bin/day6_part2.dart' as day6_part2;
import '../bin/day6_part2.min.dart' as day6_part2_min;
import 'main_tester.dart';

void main() {
  group('day 6', () {
    test('sample 1 part 1', () {
      final output = testMain(
        day6_part1.main,
        input: 'bvwbjplbgvbhsrlpgdmjqwftvncz',
      );
      expect(output, '5');
    });
    test('sample 2 part 1', () {
      final output = testMain(
        day6_part1.main,
        input: 'nppdvjthqldpwncqszvftbrmjlhg',
      );
      expect(output, '6');
    });
    test('sample 3 part 1', () {
      final output = testMain(
        day6_part1.main,
        input: 'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg',
      );
      expect(output, '10');
    });
    test('sample 4 part 1', () {
      final output = testMain(
        day6_part1.main,
        input: 'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw',
      );
      expect(output, '11');
    });

    test('golf part 1', () {
      final output = testMain(
        day6_part1_min.main,
        input: File('data/day6_input.txt').readAsStringSync(),
      );
      expect(output, '1100');
    });

    test('solve part 1', () {
      final output = testMain(
        day6_part1.main,
        input: File('data/day6_input.txt').readAsStringSync(),
      );
      print(output);
    });

    test('sample 0 part 1', () {
      final output = testMain(
        day6_part2.main,
        input: 'mjqjpqmgbljsphdztnvjfqwrcgsmlb',
      );
      expect(output, '19');
    });
    test('sample 1 part 1', () {
      final output = testMain(
        day6_part2.main,
        input: 'bvwbjplbgvbhsrlpgdmjqwftvncz',
      );
      expect(output, '23');
    });
    test('sample 2 part 1', () {
      final output = testMain(
        day6_part2.main,
        input: 'nppdvjthqldpwncqszvftbrmjlhg',
      );
      expect(output, '23');
    });
    test('sample 3 part 1', () {
      final output = testMain(
        day6_part2.main,
        input: 'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg',
      );
      expect(output, '29');
    });
    test('sample 4 part 1', () {
      final output = testMain(
        day6_part2.main,
        input: 'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw',
      );
      expect(output, '26');
    });

    test('golf part 2', () {
      final output = testMain(
        day6_part2_min.main,
        input: File('data/day6_input.txt').readAsStringSync(),
      );
      expect(output, '2421');
    });

    test('solve part 2', () {
      final output = testMain(
        day6_part2.main,
        input: File('data/day6_input.txt').readAsStringSync(),
      );
      print(output);
    });
  });
}
