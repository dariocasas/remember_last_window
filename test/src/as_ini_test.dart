import 'dart:convert';
import 'package:remember_last_window/src/as_ini.dart';
import 'package:remember_last_window/src/read_writer_contract.dart';
import 'package:remember_last_window/src/models/window_model_index.dart';
import 'package:test/test.dart';
import 'dart:io';

void main() {
  group('As ini', () {
    const filename = '.test.ini';
    var windowModel = WindowModel(
        bounds: const RectModel(left: 1.0, top: 2.0, right: 3.0, bottom: 4.0),
        alwaysOnTop: true,
        maximized: true,
        fullscreen: true);

    test('file do not exists', () async {
      if (await File(filename).exists()) {
        await File(filename).delete();
      }

      ReadWriter fileSaver = AsIni();
      final map = await fileSaver.load(filename: filename);
      expect(map, equals({}));
    });

    test('save', () async {
      ReadWriter fileSaver = AsIni();

      await fileSaver.save(filename: filename, data: windowModel);

      final fileStr1 = await File(filename).readAsString(encoding: utf8);

      const fileStr2 = '''

[window]
bounds.left = 1.0
bounds.top = 2.0
bounds.right = 3.0
bounds.bottom = 4.0
alwaysOnTop = true
fullscreen = true
maximized = true
''';

      expect(fileStr1, equals(fileStr2));
    });

    test('load', () async {
      ReadWriter fileSaver = AsIni();

      final Map<String, dynamic> map = await fileSaver.load(filename: filename);

      var windowModel2 = WindowModel();
      windowModel2 = windowModel2.fromMap(map);

      expect(windowModel, equals(windowModel2));

      if (await File(filename).exists()) {
        await File(filename).delete();
      }
    });
  });
}
