void main(List<String> args) {
  final sums = <int>[];
  var sum = 0;
  for (int i = 0; i < args.length; i++) {
    final line = args[i];
    if (line.isEmpty) {
      sums.add(sum);
      sum = 0;
      continue;
    }
    sum += int.parse(line);
  }
  print((sums..sort((a, b) => a > b ? 0 : 1)).take(3).reduce((a, b) => a + b));
}