% convert -size 200x200 xc:white -font Courier-New-Regular -pointsize 100 -gravity center \
  -draw 'text 0,-30 "%"' +repage 0000.png
% convert -gravity center 0000.png \( +clone -rotate 180 \) -compose multiply -composite 1800.png
% convert -gravity center 1800.png \( +clone -rotate 90 \) -compose multiply -composite 0900.png
% convert -gravity center 0900.png \( +clone -rotate 45 \) -compose multiply -composite 0450.png
% convert -gravity center 0450.png \( +clone -rotate 22.5 \) -compose multiply -composite 0225.png
