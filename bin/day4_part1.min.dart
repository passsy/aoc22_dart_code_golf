void main(List<String> args) {
  print(args.where((pair) {
    int a = int.parse(pair.split('-')[0]);
    int b = int.parse(pair.split(',')[0].split('-')[1]);
    int x = int.parse(pair.split(',')[1].split('-')[0]);
    int y = int.parse(pair.split('-').last);
    return a <= x && b >= y || a >= x && b <= y;
  }).length);
}
