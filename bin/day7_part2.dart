void main(List<String> args) {
  final root = Node.dir('/', null);
  Node cwd = root;
  final tree = <Node>[];
  for (String c in args) {
    if (c.startsWith('\$ cd')) {
      if (c.endsWith('..')) {
        cwd = cwd.parent!;
      } else {
        final old = cwd;
        cwd = Node.dir('${cwd.name}/${c.substring(5)}', old);
        old.children.add(cwd);
        tree.add(cwd);
      }
      continue;
    }
    if (c.startsWith('\$ ls')) {
      // ignore
      continue;
    }
    if (c.startsWith('dir')) {
      // subfolder = c.substring(4);
      continue;
    }

    // fileSize name
    final parts = c.split(' ');
    cwd.children.add(Node.file(parts[1], int.parse(parts[0])));
    // print('Unhandled: $c');
  }

  final freeSpace = 70000000 - root.size;
  final sorted = tree.where((a) => a.size > 30000000 - freeSpace).toList()
    ..sort((a, b) => a.size.compareTo(b.size));

  print(sorted[0].size);
}

class Node {
  final String name;
  final List<Node> children = [];
  final int? fileSize;
  final Node? parent;

  Node.file(this.name, this.fileSize) : parent = null;

  Node.dir(String name, this.parent)
      : name = name.replaceAll('///', '/').replaceAll('//', '/'),
        fileSize = null;

  int get size => fileSize ?? children.fold(0, (a, b) => a + b.size);

  @override
  String toString() {
    return 'Node{name: $name}';
  }
}
