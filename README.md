# flag

A flag Flutter package for Android and iOS.

## ScreenShot
![Screenshot](./github/image.png)

## svg source
* Flag list came from UN members. [UN Web Site](https://www.un.org/en/member-states/index.html) 
* Flag svg files came from wike. such as [Antigua and Barbuda](https://commons.wikimedia.org/wiki/File:Flag_of_Antigua_and_Barbuda.svg)

fetch data :python file is `fetch_data/main.py`

> Update time: 2020-04-21 23:22:58

## Flag list

List is [un_members.txt](./un_members.txt)

Organisations
* `eu` European Union. Modify by [art-decor for European Union](https://www.art-decor.org/mediawiki/index.php?title=File:Flag_eu.svg)

## How to use

`Flags.getFlag(country: COUNTRY_CODE, height: HEIGHT, width: WIDTH),`

Such as
* `Flags.getFlag(country: 'AD', height: 100, width: null)`
* `Flags.getFlag(country: 'AD', height: null, width: null)`
* `Flags.getFlag(country: 'AD', height: 10, width: 100, fit: BoxFit.fill)`

## Bugs
* `brazilian` (br) flag, you can see that the letters are still a bit abnormal.