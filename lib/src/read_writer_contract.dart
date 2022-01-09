import 'package:remember_last_window/src/models/window_model.dart';

abstract class ReadWriter {
  String get defaultFileName;
  Future<Map<String, dynamic>> load({required String filename});
  Future<void> save({required String filename, required WindowModel data});
}
