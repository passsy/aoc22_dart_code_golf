void main(List<String> args) {
  final map = [...args.map((e) => [...e.split('').map((e) => int.parse(e))])];
  int peaks = 0;
  List<int> row(int n) => map[n];
  List<int> col(int n) => map.map((e) => e[n]).toList();

  for (int y = 1; y < map.length - 1; y++) {
    for (int x = 1; x < map[0].length - 1; x++) {
      final t = map[y][x];
      if (row(y).sublist(0, x).every((e) => e < t) ||
          row(y).sublist(x + 1).every((e) => e < t) ||
          col(x).sublist(0, y).every((e) => e < t) ||
          col(x).sublist(y + 1).every((e) => e < t)) {
        peaks++;
      }
    }
  }
  print(peaks + row(0).length*2 + args.length*2 - 4);
}
