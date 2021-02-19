library flag;

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

  /// If non-null, requires the child to have exactly this height.
  final double height;

  /// If non-null, requires the child to have exactly this width.
  final double width;

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
  static const List<String> flagsCode = [
    'ad',
    'ae',
    'af',
    'ag',
    'al',
    'am',
    'ao',
    'ar',
    'at',
    'au',
    'az',
    'ba',
    'bb',
    'bd',
    'be',
    'bf',
    'bg',
    'bh',
    'bi',
    'bj',
    'bn',
    'bo',
    'br',
    'bs',
    'bt',
    'bw',
    'by',
    'bz',
    'ca',
    'cd',
    'cf',
    'cg',
    'ch',
    'ci',
    'cl',
    'cm',
    'cn',
    'co',
    'cr',
    'cu',
    'cv',
    'cy',
    'cz',
    'de',
    'dj',
    'dk',
    'dm',
    'do',
    'dz',
    'ec',
    'ee',
    'eg',
    'eh',
    'er',
    'es',
    'et',
    'eu',
    'fi',
    'fj',
    'fm',
    'fr',
    'ga',
    'gb',
    'gd',
    'ge',
    'gh',
    'gm',
    'gn',
    'gq',
    'gr',
    'gt',
    'gw',
    'gy',
    'hk',
    'hn',
    'hr',
    'ht',
    'hu',
    'id',
    'ie',
    'il',
    'in',
    'iq',
    'ir',
    'is',
    'it',
    'jm',
    'jo',
    'jp',
    'ke',
    'kg',
    'kh',
    'ki',
    'km',
    'kn',
    'kp',
    'kr',
    'kw',
    'kz',
    'la',
    'lb',
    'lc',
    'li',
    'lk',
    'lr',
    'ls',
    'lt',
    'lu',
    'lv',
    'ly',
    'ma',
    'mc',
    'md',
    'me',
    'mg',
    'mh',
    'mk',
    'ml',
    'mm',
    'mn',
    'mo',
    'mr',
    'mt',
    'mu',
    'mv',
    'mw',
    'mx',
    'my',
    'mz',
    'na',
    'ne',
    'ng',
    'ni',
    'nl',
    'no',
    'np',
    'nr',
    'nz',
    'om',
    'pa',
    'pe',
    'pg',
    'ph',
    'pk',
    'pl',
    'ps',
    'pt',
    'pw',
    'py',
    'qa',
    'ro',
    'rs',
    'ru',
    'rw',
    'sa',
    'sb',
    'sc',
    'sd',
    'se',
    'sg',
    'si',
    'sk',
    'sl',
    'sm',
    'sn',
    'so',
    'sr',
    'ss',
    'st',
    'sv',
    'sy',
    'sz',
    'td',
    'tg',
    'th',
    'tj',
    'tl',
    'tm',
    'tn',
    'to',
    'tr',
    'tt',
    'tv',
    'tw',
    'tz',
    'ua',
    'ug',
    'us',
    'uy',
    'uz',
    'va',
    'vc',
    've',
    'vn',
    'vu',
    'ws',
    'xk',
    'ye',
    'za',
    'zm',
    'zw',
  ];

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
    this.replacement = const SizedBox.shrink(),
  })  : assert(
          country != null,
          'The Country must be provided.',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    String countryName = country.toLowerCase();

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

  static Future<void> preloadFlag(
      {BuildContext context, List<String> flagList = flagsCode}) async {
    for (final flag in flagList) {
      await PlatformSvg.preloadFlag(
          context, 'packages/flag/res/flag/$flag.svg');
    }
  }
}
