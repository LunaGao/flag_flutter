library flag;

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A run of Flag.
class Flag extends StatelessWidget {

  /// The flag to display.
  ///
  /// This value listed in https://github.com/LunaGao/flag_flutter/blob/master/un_members.txt.
  final String country;

  /// If non-null, requires the child to have exactly this height.
  final double height;

  /// If non-null, requires the child to have exactly this width.
  final double width;

  /// How to inscribe the flag into the space allocated during layout.
  ///
  /// The default value is [BoxFit.contain].
  final BoxFit fit;

  /// Creates a flag widget.
  ///
  /// If the [fit] argument is null, the text will use the [BoxFit.contain].
  ///
  /// The [country] parameter must not be null.
  Flag(
    this.country, {
    Key key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
  })  : assert(
          country != null,
          'The Country must be provided.',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
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
