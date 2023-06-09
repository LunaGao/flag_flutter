import 'package:enum_to_string/enum_to_string.dart';
import 'package:flag/flag_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A run of Flag.
class Flag extends StatelessWidget {
  /// The flag to display.
  ///
  /// This value listed in https://github.com/LunaGao/flag_flutter/blob/master/un_members.txt.
  final String country;

  /// The flag to display. Enum value for `FlagsCode`.
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

  /// This is the flag aspect ratio
  ///
  /// Default value is [FlagSize.size_4x3]
  final FlagSize flagSize;

  final double? borderRadius;

  /// FlagsCode.
  ///
  /// You can using `Flag.flagsCode.contains('YOUR_FLAG_CODE'.toLowerCase())` to
  /// check if the flag code included in the list.
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
  const Flag.fromCode(
    this.countryCode, {
    Key? key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.replacement = const SizedBox.shrink(),
    this.flagSize = FlagSize.size_4x3,
    this.borderRadius,
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
    this.flagSize = FlagSize.size_4x3,
    this.borderRadius,
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

    String assetName = 'packages/flag/res/4x3/$countryName.svg';
    if (flagSize == FlagSize.size_1x1) {
      assetName = 'packages/flag/res/1x1/$countryName.svg';
    }

    if (!flagsCode.contains(countryName)) {
      return replacement;
    }

    var returnWidget = Container(
      width: width,
      height: height,
      child: SvgPicture.asset(
        assetName,
        semanticsLabel: country,
        fit: fit,
      ),
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: returnWidget,
      );
    } else {
      return returnWidget;
    }
  }
}
