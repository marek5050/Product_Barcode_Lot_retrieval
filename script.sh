#!/usr/bin/env bash
#convert IMG_3631.jpeg -posterize 2 -blur 0x02 -colorspace gray -threshold 95% -type #bilevel -morphology open disk:5  -contrast-stretch 15x0%%  -unsharp 0x9 result.png


# convert -> ImageMagick
#zbarimg 

zbarimg 2BlueBarcode.JPG BlackBarcode.JPG BlueBarcode.JPG 2BlackBarLot.JPG
#EAN-13:0037466026916
#EAN-13:7640154067257
#EAN-13:7630039679972
#EAN-13:0031290114962
#scanned 4 barcode symbols from 4 images in 4.5 seconds

#blue image
convert BlueLot.JPG -blur 0x2 -colorspace gray -threshold 40% -type bilevel -morphology close disk:5  -contrast-stretch 15x0%%  -unsharp 0x3 result.png
tesseract result.png out --psm 11 --oem 2
cat out.txt | grep 7100714901

#black image
convert BlackLot.JPG -blur 0x2 -colorspace gray -threshold 55% -type bilevel -morphology close disk:5  -contrast-stretch 15x0%%  -unsharp 0x3 result.png
tesseract result.png out --psm 11 --oem 2
cat out.txt | grep 1263714901


# 2Blue image
convert 2BlueLot.JPG -blur 0x1 -colorspace gray -threshold 30% -type bilevel -morphology close disk:5  -contrast-stretch 15x0%%  -unsharp 0x3 result.png
tesseract result.png out --psm 11 --oem 2
cat out.txt | grep L1797
# 05/31/2018 L1797


# 2Black image
convert 2BlackBarLot.JPG -blur 0x2 -colorspace gray -threshold 80%  -morphology open disk:5  -contrast-stretch 20x0%%  result.png
tesseract result.png out --psm 11 --oem 2
cat out.txt | grep LOT18861
#2 LOT18861
