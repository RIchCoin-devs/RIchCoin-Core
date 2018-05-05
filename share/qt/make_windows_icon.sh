#!/bin/bash
# create multiresolution windows icon
ICON_DST=../../src/qt/res/icons/RIchCoin.ico

convert ../../src/qt/res/icons/RIchCoin-16.png ../../src/qt/res/icons/RIchCoin-32.png ../../src/qt/res/icons/RIchCoin-48.png ${ICON_DST}
