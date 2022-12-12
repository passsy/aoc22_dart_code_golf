// Not worth golfing
void main(List<String> args) {
  final Set<Pos> visited = {};
  Pos head = Pos(0, 0);
  visited.add(head);
  List<Pos> chain = List.generate(9, (index) => Pos(0, 0));
  for (final c in args) {
    final split = c.split(' ');
    final direction = split[0];
    final distance = int.parse(split[1]);
    for (int i = 0; i < distance; i++) {
      final lastTail = Pos(chain.last.x, chain.last.y);
      // Move Head
      switch (direction) {
        case 'R':
          head = Pos(head.x + 1, head.y);
          break;
        case 'L':
          head = Pos(head.x - 1, head.y);
          break;
        case 'U':
          head = Pos(head.x, head.y + 1);
          break;
        case 'D':
          head = Pos(head.x, head.y - 1);
          break;
      }

      Pos prev = head;
      for (final e in chain) {
        if (!prev.isTouching(e)) {
          final t = e.direction(prev);
          e.x += t.x;
          e.y += t.y;
        }
        prev = e;
      }

      final copy = Pos(chain.last.x, chain.last.y);
      if (visited.add(copy)) {
        if (!lastTail.isTouching(copy)) {
          throw 'jumped from $lastTail to ${chain
              .last} during $c:\nvisited: $visited';
        }
      };
    }
  }


  print(visited.length);
}

class Pos {
  int x;
  int y;

  Pos(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Pos && runtimeType == other.runtimeType && x == other.x &&
              y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  // returns true when pos is touching horizontally or vertically, or diagonally
  bool isTouching(Pos other) {
    return this == other ||
        (x == other.x && (y == other.y + 1 || y == other.y - 1)) ||
        (y == other.y && (x == other.x + 1 || x == other.x - 1)) ||
        (x == other.x + 1 && y == other.y + 1) ||
        (x == other.x - 1 && y == other.y - 1) ||
        (x == other.x + 1 && y == other.y - 1) ||
        (x == other.x - 1 && y == other.y + 1);
  }

  Pos direction(Pos other) {
    return Pos((other.x - x).sign, (other.y - y).sign);
  }

  @override
  String toString() {
    return 'Pos{x: $x, y: $y}';
  }
}
