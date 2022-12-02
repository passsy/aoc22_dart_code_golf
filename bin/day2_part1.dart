void main(List<String> args) {
  print(args.map((line) =>
  {
    'A X': 1 + 3, // rock vs. rock
    'A Y': 2 + 6, // rock vs. paper
    'A Z': 3 + 0, // rock vs. scissors
    'B X': 1 + 0, // paper vs. rock
    'B Y': 2 + 3, // paper vs. paper
    'B Z': 3 + 6, // paper vs. scissors
    'C X': 1 + 6, // scissors vs. rock
    'C Y': 2 + 0, // scissors vs. paper
    'C Z': 3 + 3, // scissors vs. scissors
  }[line]!
  ).reduce((a, b) => a + b));
}