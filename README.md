<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
# remember_last_window

This package saves bounds, alwaysOnTop, maximized and fullscreen properties for [Flutter desktop](https://flutter.dev/multi-platform/desktop) application main window, and set them back at application start up.

## Features

In AutoSave class, is possible to configure what kind of file will be used to save information: AsJson() or AsIni(). Optionally, is possible to define custom file name, as well as the time interval used to check and save modifications..

## Getting started

This package relies on [leanflutter/window_manager](https://github.com/leanflutter/window_manager), please, see package details.

## Usage

```dart
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
```

##### Windows

To hide initial window that will be displayed before it can be repositioned this file change is necessary. Side effects?

`windows/runner/main.cpp`

```diff
int APIENTRY wWinMain(_In_ HINSTANCE instance, _In_opt_ HINSTANCE prev,
                      _In_ wchar_t *command_line, _In_ int show_command) {
  // ...

-  Win32Window::Point origin(10, 10);
-  Win32Window::Size size(1280, 720);
+  Win32Window::Point origin(0x7f00, 0x7f00);
+  Win32Window::Size size(137, 38);

  // ...

  return EXIT_SUCCESS;
}
```
## Example

See example folder.

## Platform Support

| Linux | macOS | Windows |
| :---: | :---: | :-----: |
|   ❓   |   ❓   |    ✔️    |


## License

[MIT](./LICENSE)