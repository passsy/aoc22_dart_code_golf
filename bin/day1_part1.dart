void main(List<String> args) {
  var best = 0;
  var sum = 0;
  for (int i = 0; i < args.length; i++) {
    final line = args[i];
    if (line.isEmpty) {
      best = best > sum ? best : sum;
      sum = 0;
      continue;
    }
    sum += int.parse(line);
  }
  print(best);
}