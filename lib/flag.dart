library flag;

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A Flags.
class Flags {
  /// get flag
  static Widget getFlag(
      {@required String country,
      @required double height,
      @required double width,
      BoxFit fit = BoxFit.contain}) {
    String countryName = country.toLowerCase();
    String assetName = 'packages/flag/res/flag/' + countryName + '.svg';
    return Container(
      width: width,
      height: height,
      child: SvgPicture.asset(
        assetName,
        semanticsLabel: country,
        fit: fit,
      ),
    );
  }
}
