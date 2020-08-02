library flag;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './platform/interface_svg.dart'
    // ignore: uri_does_not_exist
    if (dart.library.io) './platform/mobile_svg.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) './platform/web_svg.dart';

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
    return PlatformSvg(
      assetName,
      width: width,
      height: height,
      semanticLabel: country,
      fit: fit,
    );
  }
}
