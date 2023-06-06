import 'package:enum_to_string/enum_to_string.dart';
import 'package:flag/flag_enum.dart';
import 'package:flag/flags_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A run of Flag.
class Flags extends StatelessWidget {
  /// The flag to display.
  ///
  /// This value listed in https://github.com/LunaGao/flag_flutter/blob/master/un_members.txt.
  final List<String> counties;

  /// The flag to display. Enum value for `FlagsCode`.
  ///
  /// This value listed in https://github.com/LunaGao/flag_flutter/blob/master/un_members.txt.
  final List<FlagsCode> countryCodes;

  /// Requires the child to have exactly this height.
  ///
  /// Default is 300
  final double height;

  /// Requires the child to have exactly this width.
  ///
  /// Default is 400
  final double width;

  /// Replacement Widget, if flag not found.
  ///
  /// The default value is [const SizedBox.shrink()].
  final Widget replacement;

  /// This is the each flag aspect ratio
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
  const Flags.fromCode(
    this.countryCodes, {
    Key? key,
    this.height = 300,
    this.width = 400,
    this.replacement = const SizedBox.shrink(),
    this.flagSize = FlagSize.size_4x3,
    this.borderRadius,
  })  : assert(
          countryCodes.length == 2,
          'countiyCodes count must be 2.',
        ),
        this.counties = const [],
        super(key: key);

  /// Creates a flag widget.
  ///
  /// If the [fit] argument is null, the text will use the [BoxFit.contain].
  ///
  /// The [country] parameter must not be null.
  const Flags.fromString(
    this.counties, {
    Key? key,
    this.height = 300,
    this.width = 400,
    this.replacement = const SizedBox.shrink(),
    this.flagSize = FlagSize.size_4x3,
    this.borderRadius,
  })  : assert(
          counties.length == 2,
          'counties count must be 2.',
        ),
        this.countryCodes = const [],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> countryNames =
        this.counties.map((e) => e.toLowerCase()).toList();
    if (this.countryCodes.isNotEmpty) {
      countryNames = this
          .countryCodes
          .map((e) => EnumToString.convertToString(e).toLowerCase())
          .toList();
    }

    List<Widget> flagWidgets = [];
    for (int i = 0; i < countryNames.length; i++) {
      var countryName = countryNames[i];
      String assetName = 'packages/flag/res/4x3/$countryName.svg';
      if (flagSize == FlagSize.size_1x1) {
        assetName = 'packages/flag/res/1x1/$countryName.svg';
      }

      if (!flagsCode.contains(countryName)) {
        flagWidgets.add(replacement);
      } else {
        if (i == 0) {
          flagWidgets.add(
            Container(
              width: width,
              height: height,
              child: SvgPicture.asset(
                assetName,
                fit: BoxFit.fill,
              ),
            ),
          );
        } else {
          flagWidgets.add(
            Container(
              width: width,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(),
                child: ClipPath(
                  clipper: FlagsClipper(),
                  child: SvgPicture.asset(
                    assetName,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          );
        }
      }
    }

    Widget buildChild() => Stack(children: flagWidgets);

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: buildChild(),
      );
    } else {
      return buildChild();
    }
  }
}
