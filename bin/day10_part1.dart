void main(List<String> args) {
  List<int> strengths = [];
  int x = 1;

  int c = 0;
  void cycle() {
    c++;
    if ((c + 20) % 40 == 0) {
      // print("c: $c => x: $x");
      strengths.add(x * c);
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

  print(strengths.reduce((a, b) => a + b));
}
