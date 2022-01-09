// https://stackoverflow.com/questions/63207658/how-to-detect-flutter-web-canvaskit-or-html-renderer
export 'canvas_kit_stub.dart' if (dart.library.html) 'canvas_kit_web.dart';
