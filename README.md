![Logo](./.github/flag.png)

# flag
[![Pub Version](https://img.shields.io/pub/v/flag?style=flat-square)](https://pub.dev/packages/flag)
[![Bless](https://img.shields.io/badge/bless-God-brightgreen?style=flat-square)](https://lunagao.github.io/BlessYourCodeTag/)

A flag Flutter package for `Android` / `iOS` / `Web`. Based by https://github.com/dnfield/flutter_svg .

## Screenshot
![Screenshot](./github/image.png)
![Screenshot](./github/image_web.jpg)

## Svg sources
* All flags came from https://github.com/lipis/flag-icons/releases/tag/v4.1.4

Thanks the great project [flag-icons](https://github.com/lipis/flag-icons).

## Flag list

ISO 3166-1-alpha-2 Flags

Note: 

Organisations
* `eu` European Union. Modify by [art-decor for European Union](https://www.art-decor.org/mediawiki/index.php?title=File:Flag_eu.svg)

Disputed territories
* `hk` Hong Kong. Special Administrative Region of China.
* `mo` Macau. Special Administrative Region of China.
* `eh` Western Sahara. Claimed by Morocco.
* `tw` Taiwan. Claimed by China.

Undisputed territories which are non-UN state
* `va` Vatican City. Govern by the Holy See.

## How to use

`Flag.fromCode(FlagsCode.COUNTRY_CODE, height: HEIGHT, width: WIDTH),`
`Flag.fromString(COUNTRY_CODE, height: HEIGHT, width: WIDTH),`

Such as
* `Flag.fromCode(FlagsCode.AD, height: 100, width: null)`
* `Flag.fromString('AD', height: null, width: null)`
* `Flag.fromString('AD', height: 10, width: 100, fit: BoxFit.fill)`

## Web Error

If you got an `ImageCodecException` issue on web, maybe [this issue](https://github.com/LunaGao/flag_flutter/issues/49) can solve your problem.

## Bugs
* `brazilian` (br) flag, you can see that the letters are still a bit abnormal.
