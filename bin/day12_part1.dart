void main(List<String> args) {
  final grid = List.generate(
      args[0].length, (i) => List.generate(args.length, (j) => Pos(0, 0)));

  late final Pos start;
  late final Pos end;
  for (int y = 0; y < args.length; y++) {
    final chars = args[y].split('');
    for (int x = 0; x < chars.length; x++) {
      final c = chars[x];
      if (c == 'S') {
        start = Pos(x, y);
      } else if (c == 'E') {
        end = Pos(x, y);
      }
      final height = c == 'S'
          ? 0
          : c == 'E'
              ? 26
              : c.codeUnitAt(0) - 65 - 32;
      grid[x][y] = Pos(x, y)..height = height;
    }
  }

  final positions = grid.fold([], (list, e) => list..addAll(e));

  List<Pos> neighbors(Pos p) {
    final List<Pos> n = [];
    if (p.x > 0) {
      n.add(positions.firstWhere((e) => e == Pos(p.x - 1, p.y)) as Pos);
    }
    if (p.x < grid.length - 1) {
      n.add(positions.firstWhere((e) => e == Pos(p.x + 1, p.y)) as Pos);
    }
    if (p.y > 0) {
      n.add(positions.firstWhere((e) => e == Pos(p.x, p.y - 1)) as Pos);
    }
    if (p.y < grid[0].length - 1) {
      n.add(positions.firstWhere((e) => e == Pos(p.x, p.y + 1)) as Pos);
    }
    return n;
  }

  // int bestPath = grid.length * grid[0].length;
  // Iterable<List<Pos>> allPaths(List<Pos> path) sync* {
  //   final last = path.last;
  //   final possibilities = neighbors(last)
  //       .where((p) => p.height == last.height + 1 || p.height == last.height)
  //       .where((p) => !path.contains(p))
  //       .toList();
  //   possibilities..sort((a, b) => a.distance(end) - b.distance(end));
  //
  //   for (final position in possibilities) {
  //     final distance = position.distance(end);
  //     // printPathOnGrid(path, grid);
  //     if (path.length >= bestPath) {
  //       continue;
  //     }
  //     if (path.contains(position)) {
  //       // touching myself
  //       continue;
  //     }
  //
  //     if (position == end) {
  //       bestPath = path.length < bestPath ? path.length : bestPath;
  //       yield [...path, end];
  //     }
  //     // print(path.length);
  //     yield* allPaths([...path, position]);
  //   }
  //   // no further paths, did not find end
  // }

  int bestPath = grid.length * grid[0].length;
  List<List<Pos>> allPaths(Pos start) {
    final List<List<Pos>> stack = [
      [start]
    ];
    final List<List<Pos>> completedPaths = [];

    while (stack.isNotEmpty) {
      stack.sort((a, b) {
        final factorA = a.last.distance(end) ~/ a.length;
        final factorB = b.last.distance(end) ~/ b.length;
        return factorB - factorA;
      });

      final path = stack.removeAt(0);
      final last = path.last;

      final possibilities = neighbors(last)
          .where((p) => p.height == last.height + 1 || p.height == last.height)
          .where((p) => !path.contains(p))
          .toList();

      for (final position in possibilities) {
        if (path.length >= bestPath) {
          continue;
        }
        if (path.contains(position)) {
          // touching myself
          continue;
        }
        print(path.length);

        if (position == end) {
          bestPath = path.length < bestPath ? path.length : bestPath;
          completedPaths.add([...path, end]);
        }
        stack.add([...path, position]);
      }
    }

    return completedPaths;
  }

  final all = allPaths(start).toList();
  all.sort((a, b) => a.length - b.length);
  print(all.first.length - 1);
}

void printPathOnGrid(List<Pos> path, List<List<Pos>> grid) {
  final gridCopy = List.generate(
      grid.length, (i) => List.generate(grid[0].length, (j) => '.'));
  for (int y = 0; y < grid.length; y++) {
    for (int x = 0; x < grid[0].length; x++) {
      gridCopy[y][x] = '.';
    }
  }
  for (final p in path) {
    gridCopy[p.x][p.y] = 'X';
  }
  print(''.padLeft(grid.length, '-'));
  print(gridCopy.fold<String>(
      '', (String s, List<String> e) => s + e.join('') + '\n'));
  print(''.padLeft(grid.length, '-'));
}

class Pos {
  final int x;
  final int y;
  int height = 0;

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
