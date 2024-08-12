#!/bin/bash

read -p "Дата 1 (дд.мм.гггг): " num1
read -p "Дата 2 (дд.мм.гггг): " num2

wget -O $num1.svg -A = .svg https://cdndc.img.ria.ru/dc/kay-n/2022/SOP-content/overlay/overlay-desk-$num1.svg?v=3005
wget -O $num2.svg -A = .svg https://cdndc.img.ria.ru/dc/kay-n/2022/SOP-content/overlay/overlay-desk-$num2.svg?v=3005

ksvgtopng 500 500 $num1.svg $num1.png
ksvgtopng 500 500 $num2.svg $num2.png

compare -metric AE -fuzz 6% $num1.png $num2.png rez.png

rm $num1.png $num2.png $num1.svg $num2.svg
