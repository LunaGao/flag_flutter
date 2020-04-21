# flag

A flag Flutter package for Android and iOS.

## ScreenShot
![Screenshot](./github/image.png)

## svg source
* Flag svg came from UN members. [UN Web Site](https://www.un.org/en/member-states/index.html) 

fetch data python file is `fetch_data/main.py`
> Update time: 2020-04-21 23:22:58
* Mini flag svg came from : https://github.com/madebybowtie/FlagKit/tree/master/Assets/SVG
* Full flag svg came from : https://github.com/hjnilsson/country-flags/tree/master/svg

## Flag list

List is [un_members.txt](./un_members.txt)

You can check this link: https://github.com/madebybowtie/FlagKit/blob/master/Assets/Flags.md

## How to use

`Flags.getFullFlag(COUNTRY_CODE, HEIGHT, WIDTH)`

`Flags.getMiniFlag(COUNTRY_CODE, HEIGHT, WIDTH)`

Such as
* `Flags.getFullFlag('AD', 100, null),`
* `Flags.getFullFlag('AD', null, 100),`
* `Flags.getFullFlag('AD', null, null),`
* `Flags.getMiniFlag('AD', 100, null),`
* `Flags.getMiniFlag('AD', null, 100),`
* `Flags.getMiniFlag('AD', null, null),`

MiniFlag usually using for small flag, such as list icon or something else.