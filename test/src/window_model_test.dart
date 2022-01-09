import 'package:flutter_test/flutter_test.dart';
import 'package:remember_last_window/src/models/window_model_index.dart';

void main() {
  group('WindowModel', () {
    test('create empty', () {
      final window = WindowModel.empty();
      expect(window.bounds.left, 0.0);
      expect(window.bounds.top, 0.0);
      expect(window.bounds.right, 0.0);
      expect(window.bounds.bottom, 0.0);
      expect(window.maximized, false);
      expect(window.fullscreen, false);
      expect(window.alwaysOnTop, false);
      expect(
        window,
        WindowModel(
          bounds: const RectModel(top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
          maximized: false,
          fullscreen: false,
          alwaysOnTop: false,
        ),
      );
    });

    test('create with values', () {
      var window = WindowModel(
        bounds: const RectModel(left: 1.0, top: 2.0, right: 3.0, bottom: 4.0),
        maximized: true,
        fullscreen: true,
        alwaysOnTop: true,
      );
      expect(window.bounds.left, 1.0);
      expect(window.bounds.top, 2.0);
      expect(window.bounds.right, 3.0);
      expect(window.bounds.bottom, 4.0);
      expect(window.maximized, true);
      expect(window.fullscreen, true);
      expect(window.alwaysOnTop, true);
      expect(
        window,
        WindowModel(
          bounds: const RectModel(left: 1.0, top: 2.0, right: 3.0, bottom: 4.0),
          maximized: true,
          fullscreen: true,
          alwaysOnTop: true,
        ),
      );
    });

    test('fromMap', () {
      var window = WindowModel(
        bounds: const RectModel(left: 1.0, top: 2.0, right: 3.0, bottom: 4.0),
        maximized: true,
        fullscreen: true,
        alwaysOnTop: true,
      );
      window.fromMap(<String, dynamic>{
        'bounds': window.bounds.toMap(),
        'maximized': true,
        'fullscreen': true,
        'alwaysOnTop': true,
      });
      expect(
        window,
        WindowModel(
          bounds: const RectModel(left: 1.0, top: 2.0, right: 3.0, bottom: 4.0),
          maximized: true,
          fullscreen: true,
          alwaysOnTop: true,
        ),
      );
    });

    test('toMap', () {
      var window = WindowModel(
          bounds: const RectModel(left: 1.0, top: 2.0, right: 3.0, bottom: 4.0),
          maximized: true,
          fullscreen: true,
          alwaysOnTop: true);
      final windowMap = window.toMap();
      expect(windowMap, <String, dynamic>{
        'bounds': <String, dynamic>{
          'left': 1.0,
          'top': 2.0,
          'right': 3.0,
          'bottom': 4.0
        },
        'maximized': true,
        'fullscreen': true,
        'alwaysOnTop': true,
      });
    });
    test('toJson', () {
      var window = WindowModel(
        bounds: const RectModel(left: 1.0, top: 2.0, right: 3.0, bottom: 4.0),
        maximized: true,
        fullscreen: true,
        alwaysOnTop: true,
      );
      final windowJson = window.toJson();
      expect(windowJson,
          '{"bounds":{"left":1.0,"top":2.0,"right":3.0,"bottom":4.0},"maximized":true,"fullscreen":true,"alwaysOnTop":true}');
    });
    test('fromJson', () {
      final window = WindowModel.fromJson(const <String, dynamic>{
        'bounds': <String, dynamic>{
          'left': 1.0,
          'top': 2.0,
          'right': 3.0,
          'bottom': 4.0
        },
        'maximized': true,
        'fullscreen': true,
        'alwaysOnTop': true,
      });
      expect(
          window,
          WindowModel(
            bounds:
                const RectModel(left: 1.0, top: 2.0, right: 3.0, bottom: 4.0),
            maximized: true,
            fullscreen: true,
            alwaysOnTop: true,
          ));
    });

    test('equal', () {
      var window1 = WindowModel(
        bounds: const RectModel(left: 1.0, top: 2.0, right: 3.0, bottom: 4.0),
        maximized: true,
        fullscreen: true,
        alwaysOnTop: true,
      );
      var window2 = WindowModel(
        bounds: const RectModel(left: 1.0, top: 2.0, right: 3.0, bottom: 4.0),
        maximized: true,
        fullscreen: true,
        alwaysOnTop: true,
      );

      expect(window1, equals(window2));
    });

    test('not equal 1', () {
      var window1 = WindowModel(
        bounds: const RectModel(left: 1.0, top: 2.0, right: 3.0, bottom: 4.0),
        maximized: true,
        fullscreen: true,
        alwaysOnTop: true,
      );
      var window2 = WindowModel(
        bounds: const RectModel(left: 1.0, top: 2.0, right: 3.0, bottom: 4.0),
        maximized: true,
        fullscreen: false,
        alwaysOnTop: true,
      );

      expect(window1, isNot(equals(window2)));
      expect(window1 == window2, false);
    });
    test('not equal 2', () {
      var window1 = WindowModel(
        bounds: const RectModel(left: 1.0, top: 2.0, right: 3.0, bottom: 4.0),
        maximized: true,
        fullscreen: true,
        alwaysOnTop: true,
      );

      var window2 = WindowModel(
        bounds: const RectModel(left: 11.0, top: 2.0, right: 3.0, bottom: 4.0),
        maximized: true,
        fullscreen: true,
        alwaysOnTop: true,
      );

      expect(window1, isNot(equals(window2)));
      expect(window1 == window2, false);
    });

    test('stringfy', () {
      var window1 = WindowModel(
        bounds: const RectModel(left: 1.0, top: 2.0, right: 3.0, bottom: 4.0),
        maximized: true,
        fullscreen: true,
        alwaysOnTop: true,
      );

      expect(window1.toString(),
          'WindowModel(bounds: RectModel(left: 1.0, top: 2.0, right: 3.0, bottom: 4.0), maximized: true, fullscreen: true, alwaysOnTop: true)');
    });
  });
}
