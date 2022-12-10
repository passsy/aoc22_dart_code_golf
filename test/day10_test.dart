import 'dart:io';

import 'package:test/test.dart';
import '../bin/day10_part1.dart' as day10_part1;
import '../bin/day10_part1.min.dart' as day10_part1_min;
import '../bin/day10_part2.dart' as day10_part2;
import '../bin/day10_part2.min.dart' as day10_part2_min;
import 'main_tester.dart';

void main() {
  group('day 10', () {
    test('sample part 1 ', () {
      final output = testMain(
        day10_part1.main,
        input: File('data/day10_sample.txt').readAsStringSync(),
      );
      expect(output, '13140');
    });

    test('golf part 1', () {
      final output = testMain(
        day10_part1_min.main,
        input: File('data/day10_sample.txt').readAsStringSync(),
      );
      expect(output, '13140');
    });

    test('solve part 1', () {
      final output = testMain(
        day10_part1.main,
        input: File('data/day10_input.txt').readAsStringSync(),
      );
      expect(output, isNot('0'));
      print(output);
    });

    test('sample part 2', () {
      final output = testMain(
        day10_part2.main,
        input: File('data/day10_sample.txt').readAsStringSync(),
      );
      expect(output, '''
##..##..##..##..##..##..##..##..##..##..
###...###...###...###...###...###...###.
####....####....####....####....####....
#####.....#####.....#####.....#####.....
######......######......######......####
#######.......#######.......#######.....''');
    });

    test('golf part 2', () {
      final output = testMain(
        day10_part2_min.main,
        input: File('data/day10_sample.txt').readAsStringSync(),
      );
      expect(output, '''
##..##..##..##..##..##..##..##..##..##..
###...###...###...###...###...###...###.
####....####....####....####....####....
#####.....#####.....#####.....#####.....
######......######......######......####
#######.......#######.......#######.....''');
    });

    test('solve part 2', () {
      final output = testMain(
        day10_part2.main,
        input: File('data/day10_input.txt').readAsStringSync(),
      );
      print(output);
      expect(output, '''
###..###..####..##..###...##..####..##..
#..#.#..#....#.#..#.#..#.#..#....#.#..#.
#..#.###....#..#....#..#.#..#...#..#..#.
###..#..#..#...#.##.###..####..#...####.
#....#..#.#....#..#.#.#..#..#.#....#..#.
#....###..####..###.#..#.#..#.####.#..#.''');
    });
  });
}
