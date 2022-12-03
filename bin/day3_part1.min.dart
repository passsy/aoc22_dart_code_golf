void main(List<String> args) {
  final ints = args.map((it) {
    final value = it.runes.map((c) => c > 96 ? (c - 96) : (c - 38));
    final half = value.length ~/ 2;
    final a = value.take(half).toList();
    final b = value.skip(half).toList();
    final same = a.where((it) => b.contains(it)).toList();
    return same.toSet().first;
  });
  print(ints.reduce((a, b) => a + b));
}
