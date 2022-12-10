void main(List<String> args) {
  int x = 1;

  String line = "";

  int c = 0;
  void cycle() {
    c++;
    final pos = (c - 1) % 40;
    if (x >= pos - 1 && x <= pos + 1) {
      line += "#";
    } else {
      line += ".";
    }
    if (pos == 39) {
      print('$line');
      line = "";
    }
  }

  for (final instruction in args) {
    if (instruction == 'noop') {
      cycle();
    } else if (instruction.startsWith('addx')) {
      cycle();
      cycle();
      x += int.parse(instruction.substring(5));
    } else {
      print(instruction);
    }
  }
}
