library flag;

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A Flags.
class Flags {
  /// get mini flag
  static Widget getMiniFlag(String country, double height, double width) {
    String assetName = 'packages/flag/res/svg1/' + country + '.svg';
    Widget svg = new SvgPicture.asset(
      assetName,
      semanticsLabel: country,
      height: height,
      width: width,
    );
    return svg;
  }

  /// get full flag
  static Widget getFullFlag(String country, double height, double width) {
    String assetName =
        'packages/flag/res/svg2/' + country.toLowerCase() + '.svg';
    Widget svg = new SvgPicture.asset(
      assetName,
      semanticsLabel: country.toLowerCase(),
      height: height,
      width: width,
    );
    return svg;
  }
}
