import 'dart:js';

/// Whether the CanvasKit renderer is being used on web.
///
/// Always returns `false` on non-web.
bool get isCanvasKit => context['flutterCanvasKit'] != null;
