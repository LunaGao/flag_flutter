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

  static const List<String> flagsCode = [
    'af',
    'al',
    'dz',
    'ad',
    'ao',
    'ag',
    'ar',
    'am',
    'au',
    'at',
    'az',
    'bs',
    'bh',
    'bd',
    'bb',
    'by',
    'be',
    'bz',
    'bj',
    'bt',
    'bo',
    'ba',
    'bw',
    'br',
    'bn',
    'bg',
    'bf',
    'bi',
    'cv',
    'kh',
    'cm',
    'ca',
    'cf',
    'td',
    'cl',
    'cn',
    'co',
    'km',
    'cg',
    'cr',
    'ci',
    'hr',
    'cu',
    'cy',
    'cz',
    'kp',
    'cd',
    'dk',
    'dj',
    'dm',
    'do',
    'ec',
    'eg',
    'sv',
    'gq',
    'er',
    'ee',
    'sz',
    'et',
    'fj',
    'fi',
    'fr',
    'ga',
    'gm',
    'ge',
    'de',
    'gh',
    'gr',
    'gd',
    'gt',
    'gn',
    'gw',
    'gy',
    'ht',
    'hn',
    'hu',
    'is',
    'in',
    'id',
    'ir',
    'iq',
    'ie',
    'il',
    'it',
    'jm',
    'jp',
    'jo',
    'kz',
    'ke',
    'ki',
    'kw',
    'kg',
    'la',
    'lv',
    'lb',
    'ls',
    'lr',
    'ly',
    'li',
    'lt',
    'lu',
    'mg',
    'mw',
    'my',
    'mv',
    'ml',
    'mt',
    'mh',
    'mr',
    'mu',
    'mx',
    'fm',
    'mc',
    'mn',
    'me',
    'ma',
    'mz',
    'mm',
    'na',
    'nr',
    'np',
    'nl',
    'nz',
    'ni',
    'ne',
    'ng',
    'mk',
    'no',
    'om',
    'pk',
    'pw',
    'pa',
    'pg',
    'py',
    'pe',
    'ph',
    'pl',
    'pt',
    'qa',
    'kr',
    'md',
    'ro',
    'ru',
    'rw',
    'kn',
    'lc',
    'vc',
    'ws',
    'sm',
    'st',
    'sa',
    'sn',
    'rs',
    'sc',
    'sl',
    'sg',
    'sk',
    'si',
    'sb',
    'so',
    'za',
    'ss',
    'es',
    'lk',
    'sd',
    'sr',
    'se',
    'ch',
    'sy',
    'tj',
    'th',
    'tl',
    'tg',
    'to',
    'tt',
    'tn',
    'tr',
    'tm',
    'tv',
    'ug',
    'ua',
    'ae',
    'gb',
    'tz',
    'us',
    'uy',
    'uz',
    'vu',
    've',
    'vn',
    'ye',
    'zm',
    'zw'
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
