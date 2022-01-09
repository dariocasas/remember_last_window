import 'dart:convert';
import 'dart:io';

import 'read_writer_contract.dart';
import 'models/window_model.dart';

class AsJson implements ReadWriter {
  @override
  String get defaultFileName => '.window.json';

  @override
  Future<Map<String, dynamic>> load({required String filename}) async {
    final file = File(filename);
    try {
      final String jsonStr = await file.readAsString(encoding: utf8);

      final String jsonValid = jsonDecode(jsonStr);
      final Map<String, dynamic> jsonMap = json.decode(jsonValid);
      return Future.value(jsonMap);
    } catch (_) {
      return Future.value({});
    }
  }

  @override
  Future<void> save(
      {required String filename, required WindowModel data}) async {
    final file = File(filename);
    try {
      await file.writeAsString(jsonEncode(data), encoding: utf8);
    } catch (_) {
      return Future.value();
    }
  }
}
