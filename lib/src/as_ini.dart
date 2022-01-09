import 'dart:convert';
import 'dart:io';
import 'package:ini/ini.dart';

import 'read_writer_contract.dart';
import 'models/window_model.dart';

class AsIni implements ReadWriter {
  @override
  String get defaultFileName => '.window.ini';

  @override
  Future<Map<String, dynamic>> load({required String filename}) async {
    final file = File(filename);
    try {
      final config = Config.fromStrings(
        await file.readAsLines(encoding: utf8),
      );
      if (config.hasSection('window')) {
        final Map<String, dynamic> result = {};
        final Map<String, dynamic> bounds = {};
        final values = config.items('window');
        if (values != null) {
          if (values.isNotEmpty) {
            bounds['left'] = double.parse(config.get('window', 'bounds.left')!);
            bounds['top'] = double.parse(config.get('window', 'bounds.top')!);
            bounds['right'] =
                double.parse(config.get('window', 'bounds.right')!);
            bounds['bottom'] =
                double.parse(config.get('window', 'bounds.bottom')!);
            result['bounds'] = bounds;
            result['alwaysOnTop'] =
                config.get('window', 'alwaysOnTop') == 'true';
            result['fullscreen'] = config.get('window', 'fullscreen') == 'true';
            result['maximized'] = config.get('window', 'maximized') == 'true';
          }
        }
        return Future.value(result);
      }
      return Future.value({});
    } catch (_) {
      return Future.value({});
    }
  }

  @override
  Future<void> save(
      {required String filename, required WindowModel data}) async {
    try {
      final Config config = Config();
      config.addSection('window');
      config.set('window', 'bounds.left', data.bounds.left.toString());
      config.set('window', 'bounds.top', data.bounds.top.toString());
      config.set('window', 'bounds.right', data.bounds.right.toString());
      config.set('window', 'bounds.bottom', data.bounds.bottom.toString());
      config.set('window', 'alwaysOnTop', data.alwaysOnTop.toString());
      config.set('window', 'fullscreen', data.fullscreen.toString());
      config.set('window', 'maximized', data.maximized.toString());
      final file = File(filename);
      await file.writeAsString(config.toString(), encoding: utf8);
    } catch (_) {
      return Future.value();
    }
  }
}
