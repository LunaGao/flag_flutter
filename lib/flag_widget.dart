import 'package:enum_to_string/enum_to_string.dart';
import 'package:flag/flag_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './platform/interface_svg.dart'
    // ignore: uri_does_not_exist
    if (dart.library.io) './platform/mobile_svg.dart'
    // ignore: uri_does_not_exist
    if (dart.library.js) './platform/web_svg.dart';

/// A run of Flag.
class Flag extends StatelessWidget {
  /// The flag to display.
  ///
  /// This value listed in https://github.com/LunaGao/flag_flutter/blob/master/un_members.txt.
  final String country;

  /// The flag to display. Enum value for `FlagsCode`.
  /// If this inputed, `country` will be ingnore.
  ///
  /// This value listed in https://github.com/LunaGao/flag_flutter/blob/master/un_members.txt.
  final FlagsCode countryCode;

  /// If non-null, requires the child to have exactly this height.
  final double? height;

  /// If non-null, requires the child to have exactly this width.
  final double? width;

  /// How to inscribe the flag into the space allocated during layout.
  ///
  /// The default value is [BoxFit.contain].
  final BoxFit fit;

  /// Replacement Widget, if flag not found.
  ///
  /// The default value is [const SizedBox.shrink()].
  final Widget replacement;

  /// FlagsCode.
  ///
  /// You can using `Flag.flagsCode.contains('YOUR_FLAG_CODE'.toLowerCase())` to
  /// check if the Flagcode included in the list.
  /// Example:
  /// ```
  /// if (Flag.flagsCode.contains('AF'.toLowerCase()))
  ///            Flag(
  ///              'af',
  ///              height: 10,
  ///              width: 100,
  ///              fit: BoxFit.fill,
  ///            ),
  /// ```
  static const List<String> flagsCode = baseFlagsCode;

  /// Creates a flag widget.
  ///
  /// If the [fit] argument is null, the text will use the [BoxFit.contain].
  ///
  /// The [country] parameter must not be null.
  @Deprecated(
    '\nUse Flag.fromString / Flag.fromCode instead. \n'
    'This feature was deprecated after v6.0.0',
  )
  const Flag(
    this.country, {
    Key? key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.replacement = const SizedBox.shrink(),
  })  : assert(
          country != '',
          'A non-null Country Code String must be provided to a Flag widget.',
        ),
        this.countryCode = FlagsCode.NULL,
        super(key: key);

  /// Creates a flag widget.
  ///
  /// If the [fit] argument is null, the text will use the [BoxFit.contain].
  ///
  /// The [country] parameter must not be null.
  const Flag.fromCode(
    this.countryCode, {
    Key? key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.replacement = const SizedBox.shrink(),
  })  : assert(
          countryCode != FlagsCode.NULL,
          'A non-NULL Country Code must be provided to a Flag widget.',
        ),
        this.country = '',
        super(key: key);

  /// Creates a flag widget.
  ///
  /// If the [fit] argument is null, the text will use the [BoxFit.contain].
  ///
  /// The [country] parameter must not be null.
  const Flag.fromString(
    this.country, {
    Key? key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.replacement = const SizedBox.shrink(),
  })  : assert(
          country != '',
          'A non-null Country Code String must be provided to a Flag widget.',
        ),
        this.countryCode = FlagsCode.NULL,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    String countryName = country.toLowerCase();
    if (this.countryCode != FlagsCode.NULL) {
      countryName =
          EnumToString.convertToString(this.countryCode).toLowerCase();
    }

    return flagsCode.contains(countryName)
        ? PlatformSvg(
            'packages/flag/res/flag/$countryName.svg',
            width: width,
            height: height,
            semanticLabel: country,
            fit: fit,
          )
        : replacement;
  }

  static Future<void> preloadFlag({
    required BuildContext context,
    List<String> flagList = flagsCode,
  }) async {
    for (final flag in flagList) {
      await PlatformSvg.preloadFlag(
          context, 'packages/flag/res/flag/$flag.svg');
    }
  }
}
