void main(List<String> args) {
  final found = args.where((pair) {
    int arg(l) => int.parse(pair.split(RegExp(r'(\D)'))[l]!);
    return arg(0) <= arg(2) && arg(1) >= arg(2) ||
        arg(2) <= arg(0) && arg(3) >= arg(0);
  });
  print(found.length);
}