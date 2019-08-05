# flag

A flag Flutter package for Android and iOS.

## svg source
* Mini flag svg came from : https://github.com/madebybowtie/FlagKit/tree/master/Assets/SVG
* Full flag svg came from : https://github.com/hjnilsson/country-flags/tree/master/svg

## Flag list

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