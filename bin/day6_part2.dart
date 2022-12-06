void main(List<String> args) {
  Iterable<String> chars = [];
  for (int i = 0; i < args[0].length; i++) {
    if (chars.toSet().length == 14) {
      print(i);
      return;
    }
    chars = [args[0][i], ...chars].take(14);
  }
}
