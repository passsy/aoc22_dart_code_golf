void main(List<String> args) {
  final stacks = List.generate(10, (i) => []);
  bool created = false;
  int skip = 0;
  for (final l in args) {
    if (skip-- > 0) {
      continue;
    }
    if (l.startsWith(' 1')) {
      created = true;
      skip = 1;
      continue;
    }
    if (!created) {
      for (int j = 0; j < l.length; j++) {
        final char = l[j];
        final crate = j ~/ 4;
        if (RegExp(r'\w').hasMatch(char)) {
          stacks[crate].add(char);
        }
      }
    } else {
      final split = l.split(RegExp(r'(\D+)'));
      final amount = int.parse(split[1]);
      final from = int.parse(split[2]);
      final to = int.parse(split[3]);
      final fromStack = stacks[from -1];
      final moved = fromStack.sublist(0, amount);
      fromStack.removeRange(0, amount);
      stacks[to-1].insertAll(0, moved);
    }
  }

  print(stacks.map((e) => e.isEmpty ? '':e[0]).join());
}
