import 'package:remember_last_window/src/models/rect_model.dart';

abstract class RememberLastWindowContract {
  Future<void> loadLastWindowBounds();
  Future<void> saveLastWindowBounds();
  set bounds(RectModel value);
  RectModel get bounds;
  set maximized(bool value);
  bool get maximized;
  set fullscrean(bool value);
  bool get fullscrean;
  set allwaysOnTop(bool value);
  bool get allwaysOnTop;
}
