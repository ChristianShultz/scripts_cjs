set xtics (  "rho,proj1,p200,H1D4E2" 0 , "rho,proj1,p100,H0D4A1" 1 , "rho,proj1,p110,H1D2B1" 2 , "rho,proj1,p111,H1D3E2" 3 , "rho,proj1,p000,T1" 4 , "rho,proj1,p100,H1D4E2" 5 , "rho,proj1,p111,H0D3A1" 6 , "rho,proj1,p110,H1D2B2" 7 , "rho,proj1,p110,H0D2A1" 8 , "rho,proj1,p200,H0D4A1" 9 ) nomirror rotate by -45 font ",8"  
set style fill solid border -1 
set boxwidth 0.5 relative 
plot 'op_phase_hash_data/rho_proj1' u ($0):3:4:xtic(2) w boxerrorbars 
set xr [GPVAL_X_MIN -1 : GPVAL_X_MAX +1] 
replot 
