import 'dart:async';

import 'read_writer_contract.dart';
import 'remember_last_window_contract.dart';
import 'models/window_model_index.dart';

const defaultAutoSaveIntervalMillieconds = 750;
const defaultAutoSave = true;

class AutoSave implements RememberLastWindowContract {
  AutoSave({
    required ReadWriter readWriter,
    String? filename,
    bool? autoSave,
    int? autoSaveIntervalMillieconds,
  })  : _fileSaver = readWriter,
        _filename = filename ?? readWriter.defaultFileName,
        _autoSave = autoSave ?? defaultAutoSave,
        _autoSaveIntervalMillieconds =
            autoSaveIntervalMillieconds ?? defaultAutoSaveIntervalMillieconds,
        super() {
    Timer.periodic(Duration(milliseconds: _autoSaveIntervalMillieconds),
        (timer) {
      if ((_autoSave) && (_dirty)) {
        _fileSaver.save(filename: _filename, data: _window);
        _dirty = false;
      }
    });
  }

  final String _filename;
  final bool _autoSave;
  final int _autoSaveIntervalMillieconds;

  final ReadWriter _fileSaver;

  WindowModel _window = WindowModel();
  bool _dirty = false;

  @override
  Future<void> loadLastWindowBounds() async {
    final Map<String, dynamic> lastWindow =
        await _fileSaver.load(filename: _filename);
    _dirty = false;
    if (lastWindow.isNotEmpty) {
      _window = WindowModel.fromJson(lastWindow);
    }
    return Future.value();
  }

  @override
  Future<void> saveLastWindowBounds() async {
    await _fileSaver.save(filename: _filename, data: _window);
    _dirty = false;
  }

  @override
  set bounds(RectModel value) {
    final lastW = _window;
    _window = _window.copyWith(
      bounds: _window.bounds.copyWithRectModel(value),
    );

    if (lastW != _window) {
      _dirty = true;
    }

    _window = _window.copyWith(
      bounds: _window.bounds.copyWithRectModel(value),
    );
  }

  @override
  RectModel get bounds => _window.bounds;

  @override
  set maximized(bool value) {
    _dirty = true;
    _window.maximized = value;
  }

  @override
  bool get maximized => _window.maximized;

  @override
  set fullscrean(bool value) {
    _dirty = true;
    _window.fullscreen = value;
  }

  @override
  bool get fullscrean => _window.fullscreen;

  @override
  set alwaysOnTop(bool value) {
    _dirty = true;
    _window.alwaysOnTop = value;
  }

  @override
  bool get alwaysOnTop => _window.alwaysOnTop;
}
