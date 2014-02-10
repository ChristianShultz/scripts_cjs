set xtics nomirror rotate by -45 font ",8" 
set key outside 
set style data histogram 
set style fill solid border -1 
set title "pion_proj0_p200_H0D4A2" 
unset key 
set rmargin at screen 0.85 
set yrange [0:1.05] 
set object 1 rect from screen 0.90,0.85 to screen 0.95,0.90 fc lt 0 
set object 2 rect from screen 0.90,0.75 to screen 0.95,0.80 fc lt 1 
set object 3 rect from screen 0.90,0.65 to screen 0.95,0.70 fc lt 2 
set object 4 rect from screen 0.90,0.55 to screen 0.95,0.60 fc lt 3 
set object 5 rect from screen 0.90,0.45 to screen 0.95,0.50 fc lt 4 
set label 1 at screen 0.915,0.87 "J0" front 
set label 2 at screen 0.915,0.77 "J1" front 
set label 3 at screen 0.915,0.67 "J2" front 
set label 4 at screen 0.915,0.57 "J3" front 
set label 5 at screen 0.915,0.47 "J4" front 
plot "tmp/pion_proj0_p200_H0D4A2_51_.dat" u (column(0)):2:(0.5):($3):xtic(1) w boxes lc variable, \
"tmp/pion_proj0_p200_H0D4A2_51_.dat" u (column(0)):($2 + 0.02):4 with labels
set terminal postscript eps 
set output "pion_proj0_p200_H0D4A2.eps" 
replot