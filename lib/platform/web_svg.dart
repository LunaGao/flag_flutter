import 'package:flutter/material.dart';

import 'interface_svg.dart' as Interface;

class PlatformSvg extends Interface.PlatformSvg {
  /// The flag to display.
  ///
  /// This value listed in https://github.com/LunaGao/flag_flutter/blob/master/un_members.txt.
  final String semanticLabel;

  /// If non-null, requires the child to have exactly this height.
  final double? height;

  /// If non-null, requires the child to have exactly this width.
  final double? width;

  /// How to inscribe the flag into the space allocated during layout.
  ///
  /// The default value is [BoxFit.contain].
  final BoxFit fit;

  /// Flag svg path
  final String assetName;

  PlatformSvg(
    this.assetName, {
    Key? key,
    this.semanticLabel = '',
    this.height,
    this.width,
    this.fit = BoxFit.contain,
  }) : super(assetName, key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "assets/$assetName",
      width: width,
      height: height,
      semanticLabel: semanticLabel,
      fit: fit,
    );
  }

  static Future<void> preloadFlag(
      BuildContext context, String assetName) async {
    await precacheImage(NetworkImage("assets/$assetName"), context);
  }
}
