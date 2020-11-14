![Logo](./.github/flag.png)

# flag
![Pub Version](https://img.shields.io/pub/v/flag?style=flat-square)
[![Bless](https://img.shields.io/badge/bless-God-brightgreen?style=flat-square)](https://lunagao.github.io/BlessYourCodeTag/)

A flag Flutter package for `Android` / `iOS` / `Web`. Mobile Based by https://github.com/dnfield/flutter_svg , Web Based by `Image.network`

## ScreenShot
![Screenshot](./github/image.png)
![Screenshot](./github/image_web.jpg)

## svg source
* Flag list came from UN members. [UN Web Site](https://www.un.org/en/member-states/index.html) 
* A lot of flag svg files came from wike. such as [Antigua and Barbuda](https://commons.wikimedia.org/wiki/File:Flag_of_Antigua_and_Barbuda.svg)
* Some flag svg files came from [Countryflags](https://www.countryflags.com/en/).

fetch data :python file is `fetch_data/main.py`

> Update time: 2020-04-21 23:22:58

## Marge from 2.0.X to 3
Replace `Flags.getFlag(country:` to `Flag(`.   :)

## Flag list

[Flag List](https://github.com/LunaGao/flag_flutter/wiki/UN-numbers-list)

Organisations
* `eu` European Union. Modify by [art-decor for European Union](https://www.art-decor.org/mediawiki/index.php?title=File:Flag_eu.svg)

## How to use

`Flag(COUNTRY_CODE, height: HEIGHT, width: WIDTH),`

Such as
* `Flag('AD', height: 100, width: null)`
* `Flag('AD', height: null, width: null)`
* `Flag('AD', height: 10, width: 100, fit: BoxFit.fill)`

## Bugs
* `brazilian` (br) flag, you can see that the letters are still a bit abnormal.

## Branch & version
switch Flutter SDK channel
[Flutter-build-release-channels](https://github.com/flutter/flutter/wiki/Flutter-build-release-channels)
```
flutter channel
flutter channel <channel-name>
```
* `develop` --> develop
* `stable` --> verison X.Y.Z  (using latest `stable` channel Flutter SDK)
```
Channel stable, 1.22.2
```
* `master` --> verison X.Y.Z-pre  (using latest `bate` channel Flutter SDK)
```
Channel beta, 1.20.0-7.3.pre
```
