void main(List<String> args) {
  final grid = List.generate(args[0].length,
      (i) => List.generate(args.length, (j) => Pos(0, 0)..height = 999));

  late final Pos start;
  late final Pos end;
  for (int y = 0; y < args.length; y++) {
    final chars = args[y].split('');
    for (int x = 0; x < chars.length; x++) {
      final c = chars[x];
      if (c == 'S') {
        start = Pos(x, y)..height = 0;
      } else if (c == 'E') {
        end = Pos(x, y)..height = 26;
      }
      final height = c == 'S'
          ? 0
          : c == 'E'
              ? 26
              : c.codeUnitAt(0) - 65 - 32;
      grid[x][y] = Pos(x, y)..height = height;
    }
  }

  final positions = grid.fold<List<Pos>>([], (list, e) => list..addAll(e));

  List<Pos> neighborsOf(Pos p) {
    final List<Pos> n = [];
    if (p.x > 0) {
      n.add(positions.firstWhere((e) => e == Pos(p.x - 1, p.y)));
    }
    if (p.x < grid.length - 1) {
      n.add(positions.firstWhere((e) => e == Pos(p.x + 1, p.y)));
    }
    if (p.y > 0) {
      n.add(positions.firstWhere((e) => e == Pos(p.x, p.y - 1)));
    }
    if (p.y < grid[0].length - 1) {
      n.add(positions.firstWhere((e) => e == Pos(p.x, p.y + 1)));
    }
    return n;
  }

  end.shortestDistance = 0;
  final List<Pos> unsettledNodes = [end];
  final Set<Pos> settledNodes = {};
  while (unsettledNodes.isNotEmpty) {
    unsettledNodes
        .sort((a, b) => a.shortestDistance.compareTo(b.shortestDistance));
    final pos = unsettledNodes.first;
    unsettledNodes.remove(pos);
    final neighbors = neighborsOf(pos);
    for (final next in neighbors) {
      if (settledNodes.contains(next)) {
        continue;
      }
      if (next.height + 1 >= pos.height) {
        if (pos.shortestDistance + 1 < next.shortestDistance) {
          next.shortestDistance = pos.shortestDistance + 1;
          unsettledNodes.add(next);
        }
      }
    }
    settledNodes.add(pos);
  }
  assert(!settledNodes.any((element) => element.height > 100));

  print(settledNodes
      .where((e) => e == start)
      .map((e) => e.shortestDistance)
      .first);
}

class Pos {
  final int x;
  final int y;
  int height = 0;
  int shortestDistance = 999;

  Pos(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pos &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() {
    return 'Pos{x: $x, y: $y}';
  }

  int distance(Pos other) {
    return (x - other.x).abs() + (y - other.y).abs();
  }
}
