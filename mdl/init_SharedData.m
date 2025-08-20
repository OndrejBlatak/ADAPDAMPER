%init

cal_def('p_trackFr_m',1.4,0,3,'single',1,'m','front vehicle track')
cal_def('p_trackRe_m',1.45,0,3,'single',1,'m','rear vehicle track')
cal_def('p_StatLoaFr_kg',1500,0,5000,'single',1,'kg','front static mass')
cal_def('p_StatLoaRe_kg',1300,0,5000,'single',1,'kg','rear static mass')
cal_def('p_HeiCog_m',600,0,1000,'single',1,'m','vehicle cog height')
cal_def('p_JyWhl_kgm2',1,0,1000,'single',1,'m','wheel moment of inertia')
cal_def('p_RatGearFr_na',12,0,1000,'single',1,'m','front gear ratio')
cal_def('p_RatGearRe_na',12,0,1000,'single',1,'m','rear gear ratio')
cal_def('p_WhlBas_m',2.5,0,1000,'single',1,'m','wheelbase')
cal_def('p_RatStCoef1_na',1,0,1000,'single',1,'na','steering ratio coefficient1 from steering wheel to front wheels')
cal_def('p_RatStCoef2_na',1,0,1000,'single',1,'na','steering ratio coefficient2 from steering wheel to front wheels')
cal_def('p_RatStCoef3_na',1,0,1000,'single',1,'na','steering ratio coefficient3 from steering wheel to front wheels')
cal_def('p_JzVeh_kgm2',3000,0,5000,'single',1,'kgm2','yaw moment of inertia')
cal_def('p_RadWhlDynFr_m',0.375,0,1,'single',1,'kgm2','front dynamic radius')
cal_def('p_RadWhlDynRe_m',0.375,0,1,'single',1,'kgm2','rear dynamic radius')
cal_def('c_GravConst_mps2',9.80665,0,20,'single',1,'mps2','gravity constant')
cal_def('p_CrnrgStfnFr_Nprad',300000,0,1000000,'single',1,'Nprad','front cornering stiffness')
cal_def('p_CrnrgStfnRe_Nprad',300000,0,1000000,'single',1,'Nprad','rear cornering stiffness')
cal_def('p_BrkTqGainFr_Nmpbar',12,0,100,'single',1,'Nmpbar','brake torque gain front')
cal_def('p_BrkTqGainRe_Nmpbar',12,0,100,'single',1,'Nmpbar','brake torque gain rear')
cal_def('p_RatSt_na',12,0,1000,'single',1,'na','steering ratio')
cal_def('p_RatMotFr_na',1,0,10,'single',1,'na','motion ratio front')
cal_def('p_RatMotRe_na',1,0,10,'single',1,'na','motion ratio rear')


p_dt_s = 0.01;





