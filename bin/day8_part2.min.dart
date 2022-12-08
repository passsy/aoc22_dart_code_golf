void main(List<String> args) {
  final map = [...args.map((e) => [...e.split('').map((e) => int.parse(e))])];
  int max = 0;
  List<int> row(int n) => map[n];
  List<int> col(int n) => map.map((e) => e[n]).toList();

  for (int y = 1; y < map.length - 1; y++) {
    for (int x = 1; x < map[0].length - 1; x++) {
      final t = map[y][x];
      final left = row(y)
          .sublist(0, x)
          .reversed;
      final right = row(y).sublist(x + 1);
      final top = col(x)
          .sublist(0, y)
          .reversed;
      final bottom = col(x).sublist(y + 1);
      int score = 0;
      final lscore = left
          .takeWhile((i) => i < t)
          .length;
      final rscore = right
          .takeWhile((i) => i < t)
          .length;
      final tscore = top
          .takeWhile((i) => i < t)
          .length;
      final bscore = bottom
          .takeWhile((i) => i < t)
          .length;
      final lscore2 = lscore + (lscore == left.length ? 0 : 1);
      final rscore2 = rscore + (rscore == right.length ? 0 : 1);
      final tscore2 = tscore + (tscore == top.length ? 0 : 1);
      final bscore2 = bscore + (bscore == bottom.length ? 0 : 1);
      score = lscore2 * rscore2 * tscore2 * bscore2;

      max = max > score ? max : score;
    }
  }
  print(max);
}
