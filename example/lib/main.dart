import 'app.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:remember_last_window/remember_last_window.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  windowManager.addListener(
    RememberLastWindow(
      AutoSave(
        readWriter: AsJson(),
        autoSave: true,
      ),
    ),
  );

  runApp(
    const App(),
  );
}
