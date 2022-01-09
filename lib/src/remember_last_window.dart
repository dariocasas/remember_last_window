// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:ui';

import 'package:window_manager/window_manager.dart';

import 'remember_last_window_contract.dart';
import 'models/window_model_index.dart';

class RememberLastWindow extends WindowListener {
  final RememberLastWindowContract rememberLastWindowContract;

  RememberLastWindow(
    this.rememberLastWindowContract,
  ) {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      timer.cancel();
      _runOnce();
    });
  }

  void _runOnce() async {
    await rememberLastWindowContract.loadLastWindowBounds();
    final RectModel loadLastWindowBounds =
        RectModel.empty().copyWithRectModel(rememberLastWindowContract.bounds);
    if (loadLastWindowBounds == RectModel.empty()) {
      await windowManager
          .setBounds(const Rect.fromLTWH(10.0, 10.0, 1280.0, 720.0));
    } else {
      await windowManager.setBounds(loadLastWindowBounds.asRect());
      await windowManager.setFullScreen(rememberLastWindowContract.fullscrean);
      await windowManager
          .setAlwaysOnTop(rememberLastWindowContract.allwaysOnTop);
      if (rememberLastWindowContract.maximized) {
        await windowManager.maximize();
      }
    }
  }

  @override
  void onWindowEvent(String eventName) {
    //print('wl EVENT: $eventName');
  }

  @override
  void onWindowFocus() {
    //print('wr: onWindowFocus');
  }

  @override
  void onWindowBlur() {
    //print('wr: onWindowBlur');
  }

  @override
  void onWindowMaximize() {
    //print('wr: onWindowMaximize');
    rememberLastWindowContract.maximized = true;
  }

  @override
  void onWindowUnmaximize() {
    //print('wr: onWindowUnmaximize');
    rememberLastWindowContract.maximized = false;
  }

  @override
  void onWindowMinimize() {
    //print('wr: onWindowMinimize');
    rememberLastWindowContract.maximized = false;
  }

  @override
  void onWindowRestore() {
    //print('wr: onWindowRestore');
    rememberLastWindowContract.maximized = false;
  }

  @override
  void onWindowResize() {
    //print('wr: onWindowResize');
    windowManager.getBounds().then((Rect rect) {
      rememberLastWindowContract.bounds =
          rememberLastWindowContract.bounds.copyWithRect(rect);
    });
  }

  @override
  Future<void> onWindowMove() async {
    //print('wr: onWindowMove');
    windowManager.getBounds().then((Rect rect) {
      rememberLastWindowContract.bounds =
          rememberLastWindowContract.bounds.copyWithRect(rect);
    });
  }

  @override
  void onWindowEnterFullScreen() {
    //print('wr: onWindowEnterFullScreen');
    rememberLastWindowContract.fullscrean = true;
  }

  @override
  void onWindowLeaveFullScreen() {
    //print('wr: onWindowLeaveFullScreen');
    rememberLastWindowContract.fullscrean = false;
  }
}
