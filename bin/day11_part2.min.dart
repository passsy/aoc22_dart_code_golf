// Not worth golfing
void main(List<String> args) {
  List<Monkey> monkeys = [];

  for (final line in args) {
    final id = int.parse(line.substring(7, 8));
    final items = RegExp('items: (.*)')
        .firstMatch(line)!
        .group(1)!
        .split(', ')
        .map((e) => int.parse(e))
        .toList();
    final operation = () {
      try {
        final n = int.parse(
            RegExp(r'Operation:.*[\*\+]\s*(\d+)').firstMatch(line)!.group(1)!);
        return line.contains('*') ? (int it) => it * n : (int it) => it + n;
      } catch (e) {
        return line.contains('*') ? (int it) => it * it : (int it) => it + it;
      }
    }();
    final mod = int.parse(
        RegExp(r'divisible by (\d+)').firstMatch(line)!.group(1)!);
    final whenTrueTarget = int.parse(
        RegExp(r'If true:\D*(\d+)').firstMatch(line)!.group(
            1)!);
    final whenFalseTarget = int.parse(
        RegExp(r'If false:\D*(\d+)').firstMatch(line)!.group(
            1)!);
    final throwItem = (int it) =>
    it % mod == 0
        ? whenTrueTarget
        : whenFalseTarget;

    monkeys.add(Monkey(id, mod, items, operation, throwItem));
  }

  final lcm = monkeys.map((m) => m.divisor).reduce((a, b) => a * b) as int;

  for (int round = 1; round <= 10000; round++) {
    for (final monkey in monkeys) {
      while (monkey.items.isNotEmpty) {
        monkey.inspections++;
        final item = monkey.items.removeAt(0);

        final reduced = item % lcm;
        final result = monkey.operation(reduced);
        assert(result > 0, '$result is negative, indicating an overflow');
        final target = monkey.nextTarget(result);
        final targetMonkey = monkeys.firstWhere((m) => m.id == target);
        targetMonkey.items.add(result);
      }
    }
  }

  monkeys..sort((a, b) => b.inspections - a.inspections);
  print(monkeys[0].inspections * monkeys[1].inspections);
}

class Monkey {
  final int id;
  final List<int> items;
  final int Function(int) operation;
  final int Function(int) nextTarget;
  int inspections = 0;
  final divisor;

  Monkey(this.id, this.divisor, this.items, this.operation, this.nextTarget);
}