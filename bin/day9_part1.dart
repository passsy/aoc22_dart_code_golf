void main(List<String> args) {
  final Set<Pos> visited = {};
  Pos head = Pos(0, 0);
  Pos tail = Pos(0, 0);
  visited.add(tail);
  for(final c in args) {
    final split = c.split(' ');
    final direction = split[0];
    final distance = int.parse(split[1]);
    for(int i = 0; i < distance; i++) {
      // Move Head
      switch(direction) {
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

      // Move tail accordingly
      if(!head.isTouching(tail)) {
        switch(direction) {
          case 'R':
            tail = Pos(head.x - 1, head.y);
            break;
          case 'L':
            tail = Pos(head.x + 1, head.y);
            break;
          case 'U':
            tail = Pos(head.x, head.y - 1);
            break;
          case 'D':
            tail = Pos(head.x, head.y + 1);
            break;
        }
      }

      visited.add(tail);
    }
  }


  print(visited.length);
}

class Pos {
  final int x;
  final int y;
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
    return this == other || (x == other.x && (y == other.y + 1 || y == other.y - 1)) ||
        (y == other.y && (x == other.x + 1 || x == other.x - 1)) ||
        (x == other.x + 1 && y == other.y + 1) ||
        (x == other.x - 1 && y == other.y - 1) ||
        (x == other.x + 1 && y == other.y - 1) ||
        (x == other.x - 1 && y == other.y + 1);
  }

  @override
  String toString() {
    return 'Pos{x: $x, y: $y}';
  }
}
