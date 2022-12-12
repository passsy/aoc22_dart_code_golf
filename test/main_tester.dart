import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:test/fake.dart';
import 'package:test/scaffolding.dart';

/// Calls a main function with input as arguments (splitted by line) and returns the output (stdout) of the program as full String
String testMain(void Function(List<String>) main,
    {String? input, String split = '\n'}) {
  final stdout = FakeStdoutStream();

  runZoned(
    () => IOOverrides.runZoned(
      () => main(input?.split(split) ?? []),
      stdout: () => stdout,
    ),
    zoneSpecification: ZoneSpecification(
      print: (self, parent, zone, line) {
        final override = IOOverrides.current;
        override?.stdout.writeln(line);
      },
    ),
  );
  return stdout.lines.join('\n');
}

class FakeStdoutStream with Fake implements Stdout {
  final List<List<int>> _writes = <List<int>>[];

  List<String> get lines => _writes.map(utf8.decode).toList();

  @override
  void add(List<int> bytes) {
    _writes.add(bytes);
  }

  @override
  void writeln([Object? object = ""]) {
    _writes.add(utf8.encode('$object'));
  }

  @override
  void write(Object? object) {
    _writes.add(utf8.encode('$object'));
  }

  @override
  void writeAll(Iterable objects, [String sep = ""]) {
    _writes.add(utf8.encode(objects.join(sep)));
  }

  @override
  void writeCharCode(int charCode) {
    _writes.add(utf8.encode(String.fromCharCode(charCode)));
  }
}
