void main(List<String> args) {
  int sum = 0;
  for (int i = 0; i < args.length; i = i + 3) {
    final backpacks = args
        .skip(i)
        .take(3)
        .map((it) => it.runes.map((c) => c > 96 ? (c - 96) : (c - 38)));
    final common =
        backpacks.reduce((a, b) => a.where((it) => b.contains(it))).first;
    sum += common;
  }
  print(sum);
}
