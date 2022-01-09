import 'dart:convert';

import 'package:remember_last_window/src/as_json.dart';
import 'package:remember_last_window/src/read_writer_contract.dart';
import 'package:remember_last_window/src/models/window_model_index.dart';
import 'package:test/test.dart';
import 'dart:io';

void main() {
  group('As json', () {
    const filename = '.test.json';
    var windowModel = WindowModel(
        bounds: const RectModel(left: 1.0, top: 2.0, right: 3.0, bottom: 4.0),
        maximized: true,
        fullscreen: true);

    test('file do not exists', () async {
      if (await File(filename).exists()) {
        await File(filename).delete();
      }

      ReadWriter fileSaver = AsJson();
      final map = await fileSaver.load(filename: filename);
      expect(map, equals({}));
    });

    test('save', () async {
      ReadWriter fileSaver = AsJson();

      await fileSaver.save(filename: filename, data: windowModel);

      final fileStr1 = await File(filename).readAsString(encoding: utf8);
      const fileStr2 =
          '"{\\"bounds\\":{\\"left\\":1.0,\\"top\\":2.0,\\"right\\":3.0,\\"bottom\\":4.0},\\"maximized\\":true,\\"fullscreen\\":true,\\"allwaysOnTop\\":false}"';

      expect(fileStr1, equals(fileStr2));
    });

    test('load', () async {
      ReadWriter fileSaver = AsJson();

      final map = await fileSaver.load(filename: filename);
      final windowModel2 = WindowModel().fromMap(map);

      expect(windowModel, equals(windowModel2));

      if (await File(filename).exists()) {
        await File(filename).delete();
      }
    });
  });
}
