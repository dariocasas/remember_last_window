import 'dart:convert';
import 'dart:ui';

class RectModel {
  final double left;
  final double top;
  final double right;
  final double bottom;

  const RectModel({
    left,
    top,
    right,
    bottom,
  })  : left = left ?? 0.0,
        top = top ?? 0.0,
        right = right ?? 0.0,
        bottom = bottom ?? 0.0,
        super();

  @override
  String toString() {
    return 'RectModel(left: $left, top: $top, right: $right, bottom: $bottom)';
  }

  @override
  bool operator ==(Object other) {
    if (other is RectModel && other.runtimeType == runtimeType) {
      if ((other.left == left) &&
          (other.top == top) &&
          (other.right == right) &&
          (other.bottom == bottom)) {
        return true;
      }
    }
    return false;
  }

  @override
  int get hashCode =>
      left.hashCode ^ top.hashCode ^ right.hashCode ^ bottom.hashCode;

  factory RectModel.empty() {
    return const RectModel();
  }

  RectModel copyWithRectModel(RectModel rect) {
    return RectModel(
      left: rect.left,
      top: rect.top,
      right: rect.right,
      bottom: rect.bottom,
    );
  }

  RectModel copyWithRect(Rect rect) {
    return RectModel(
      left: rect.left,
      top: rect.top,
      right: rect.right,
      bottom: rect.bottom,
    );
  }

  RectModel copyWith({left, top, right, bottom}) {
    return RectModel(
      left: left = left ?? this.left,
      top: top = top ?? this.top,
      right: right = right ?? this.right,
      bottom: bottom = bottom ?? this.bottom,
    );
  }

  Rect asRect() {
    return Rect.fromLTRB(left, top, right, bottom);
  }

  Map<String, dynamic> toMap() {
    return {
      'left': left,
      'top': top,
      'right': right,
      'bottom': bottom,
    };
  }

  RectModel fromMap(Map<String, dynamic> m) {
    return RectModel(
      left: m['left'] ?? 0.0,
      top: m['top'] ?? 0.0,
      right: m['right'] ?? 0.0,
      bottom: m['bottom'] ?? 0.0,
    );
  }

  factory RectModel.fromJson(Map<String, dynamic> data) {
    return RectModel(
      left: data['left'] ?? 0.0,
      top: data['top'] ?? 0.0,
      right: data['right'] ?? 0.0,
      bottom: data['bottom'] ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());
}
