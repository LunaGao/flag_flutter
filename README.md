# flag
![Pub Version](https://img.shields.io/pub/v/flag?style=flat-square)
[![Bless](https://img.shields.io/badge/bless-God-brightgreen?style=flat-square)](http://lunagao.github.io/BlessYourCodeTag/)

A flag Flutter package for Android and iOS. Based by https://github.com/dnfield/flutter_svg

## ScreenShot
![Screenshot](./github/image.png)

## svg source
* Flag list came from UN members. [UN Web Site](https://www.un.org/en/member-states/index.html) 
* A lot of flag svg files came from wike. such as [Antigua and Barbuda](https://commons.wikimedia.org/wiki/File:Flag_of_Antigua_and_Barbuda.svg)
* Some flag svg files came from [Countryflags](https://www.countryflags.com/en/).

fetch data :python file is `fetch_data/main.py`

> Update time: 2020-04-21 23:22:58

## Marge from 2.0.X to 3
Replace `Flags.getFlag(country:` to `Flag(`.   :)

## Flag list

List is [un_members.txt](./un_members.txt)

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