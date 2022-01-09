import 'dart:convert';
import 'rect_model.dart';

class WindowModel {
  bool maximized;
  bool fullscreen;
  bool alwaysOnTop;
  final RectModel bounds;

  WindowModel({
    RectModel? bounds,
    maximized,
    fullscreen,
    alwaysOnTop,
  })  : bounds = bounds ?? const RectModel(),
        maximized = maximized ?? false,
        fullscreen = fullscreen ?? false,
        alwaysOnTop = alwaysOnTop ?? false,
        super();

  @override
  bool operator ==(Object other) {
    if (other is WindowModel && other.runtimeType == runtimeType) {
      if ((other.bounds == bounds) &&
          (other.maximized == maximized) &&
          (other.fullscreen == fullscreen) &&
          (other.alwaysOnTop == alwaysOnTop)) {
        return true;
      }
    }
    return false;
  }

  @override
  String toString() {
    return 'WindowModel(bounds: $bounds, maximized: $maximized, fullscreen: $fullscreen, alwaysOnTop: $alwaysOnTop)';
  }

  @override
  int get hashCode =>
      bounds.hashCode ^ maximized.hashCode ^ fullscreen.hashCode;

  copyWith({
    RectModel? bounds,
    maximized,
    fullscreen,
    alwaysOnTop,
  }) {
    return WindowModel(
      bounds: bounds =
          this.bounds.copyWithRectModel(bounds ?? const RectModel()),
      maximized: maximized = maximized ?? this.maximized,
      fullscreen: fullscreen = fullscreen ?? this.fullscreen,
      alwaysOnTop: alwaysOnTop = alwaysOnTop ?? this.alwaysOnTop,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bounds': bounds.toMap(),
      'maximized': maximized,
      'fullscreen': fullscreen,
      'alwaysOnTop': alwaysOnTop,
    };
  }

  WindowModel fromMap(Map<String, dynamic> m) {
    return WindowModel(
      bounds: bounds.fromMap(m['bounds']),
      maximized: m['maximized'] ?? false,
      fullscreen: m['fullscreen'] ?? false,
      alwaysOnTop: m['alwaysOnTop'] ?? false,
    );
  }

  factory WindowModel.fromJson(Map<String, dynamic> data) {
    return WindowModel(
      bounds: const RectModel().fromMap(data['bounds']),
      maximized: data['maximized'] ?? false,
      fullscreen: data['fullscreen'] ?? false,
      alwaysOnTop: data['alwaysOnTop'] ?? false,
    );
  }

  factory WindowModel.empty() {
    return WindowModel(
      bounds: const RectModel(),
      maximized: false,
      fullscreen: false,
      alwaysOnTop: false,
    );
  }

  String toJson() => json.encode(toMap());
}
