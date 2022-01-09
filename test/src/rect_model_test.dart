import 'package:flutter_test/flutter_test.dart';
import 'package:remember_last_window/src/models/rect_model.dart';

void main() {
  group('RectModel', () {
    test('create empty', () {
      const rect = RectModel();
      expect(rect.left, 0.0);
      expect(rect.top, 0.0);
      expect(rect.right, 0.0);
      expect(rect.bottom, 0.0);
    });

    test('create with values', () {
      const rect = RectModel(left: 1.0, top: 4.0, right: 3.0, bottom: 2.0);
      expect(rect.left, 1.0);
      expect(rect.top, 4.0);
      expect(rect.right, 3.0);
      expect(rect.bottom, 2.0);
    });

    test('fromMap', () {
      final rect = const RectModel().fromMap(<String, dynamic>{
        'left': 1.0,
        'top': 4.0,
        'right': 3.0,
        'bottom': 2.0
      });
      expect(
          rect, const RectModel(left: 1.0, top: 4.0, right: 3.0, bottom: 2.0));
    });

    test('toMap', () {
      const rect = RectModel(left: 1.0, top: 4.0, right: 3.0, bottom: 2.0);
      final rectMap = rect.toMap();
      expect(rectMap, <String, dynamic>{
        'left': 1.0,
        'top': 4.0,
        'right': 3.0,
        'bottom': 2.0
      });
    });
    test('toJson', () {
      const rect = RectModel(left: 1.0, top: 4.0, right: 3.0, bottom: 2.0);
      final rectJson = rect.toJson();
      expect(rectJson, '{"left":1.0,"top":4.0,"right":3.0,"bottom":2.0}');
    });
    test('fromJson', () {
      final rect = RectModel.fromJson(const <String, dynamic>{
        'left': 1.0,
        'top': 4.0,
        'right': 3.0,
        'bottom': 2.0
      });
      expect(
          rect, const RectModel(left: 1.0, top: 4.0, right: 3.0, bottom: 2.0));
    });

    test('equal', () {
      const rect1 = RectModel(left: 1.0, top: 4.0, right: 3.0, bottom: 2.0);
      const rect2 = RectModel(left: 1.0, top: 4.0, right: 3.0, bottom: 2.0);

      expect(rect1, equals(rect2));
      expect(rect1 == rect2, true);
    });

    test('not equal', () {
      const rect1 = RectModel(left: 1.0, top: 4.0, right: 3.0, bottom: 2.0);
      const rect2 = RectModel(left: 0.0, top: 4.0, right: 3.0, bottom: 2.0);

      expect(rect1, isNot(equals(rect2)));
      expect(rect1 == rect2, false);
    });

    test('stringfy', () {
      const rect1 = RectModel(left: 1.0, top: 4.0, right: 3.0, bottom: 2.0);
      expect(rect1.toString(),
          'RectModel(left: 1.0, top: 4.0, right: 3.0, bottom: 2.0)');
    });
  });
}
