%init buses
%% 
sig_def('IMU_s_ALgt_mps2','0',-1000,1000,'single',1,'mps2','longitudinal acceleration measured by IMU')
sig_def('IMU_s_ALat_mps2','0',-1000,1000,'single',1,'mps2','lateral acceleration measured by IMU')
sig_def('IMU_s_AVert_mps2','0',-1000,1000,'single',1,'mps2','vertical acceleration measured by IMU')
sig_def('IMU_s_AngRatRoll_radps','0',-1000,1000,'single',1,'radps','roll rate measured by IMU')
sig_def('IMU_s_AngRatPitch_radps','0',-1000,1000,'single',1,'radps','pitch rate measured by IMU')
sig_def('IMU_s_AngRatYaw_radps','0',-1000,1000,'single',1,'radps','yaw rate measured by IMU')

bus_def('OFD_b_IMU',{'IMU_s_ALgt_mps2'; 'IMU_s_ALat_mps2';'IMU_s_AVert_mps2';'IMU_s_AngRatRoll_radps';'IMU_s_AngRatPitch_radps';'IMU_s_AngRatYaw_radps'},'bus IMU measured');
%% 
sig_def('INP_s_ALgtOfsCmp_mps2','0',-1000,1000,'single',1,'mps2','longitudinal acceleration position compensated')
sig_def('INP_s_ALatOfsCmp_mps2','0',-1000,1000,'single',1,'mps2','lateral acceleration position compensated')
sig_def('INP_s_AVertOfsCmp_mps2','0',-1000,1000,'single',1,'mps2','vertical acceleration position compensated')
sig_def('INP_s_AngRatRollOfsCmp_radps','0',-1000,1000,'single',1,'radps','roll rate position compensated')
sig_def('INP_s_AngRatPitchOfsCmp_radps','0',-1000,1000,'single',1,'radps','pitch rate position compensated')
sig_def('INP_s_AngRatYawOfsCmp_radps','0',-1000,1000,'single',1,'radps','yaw rate position compensated')

bus_def('INP_b_IMU',{'INP_s_ALgtOfsCmp_mps2'; 'INP_s_ALatOfsCmp_mps2';'INP_s_AVertOfsCmp_mps2';'INP_s_AngRatRollOfsCmp_radps';'INP_s_AngRatPitchOfsCmp_radps';'INP_s_AngRatYawOfsCmp_radps'},'bus IMU compensatedd');
%% 
sig_def('OFD_s_VoltBat_V','0',-1000,1000,'single',1,'V','battery voltage')
sig_def('OFD_s_CurBat_A','0',-1000,1000,'single',1,'A','battery current')
sig_def('OFD_s_TempBat_degC','0',-1000,1000,'single',1,'degC','battery temperature')

bus_def('OFD_b_Bat',{'OFD_s_VoltBat_V'; 'OFD_s_CurBat_A';'OFD_s_TempBat_degC'},'bus battery');
%% 
sig_def('INP_BAT_s_VoltBat_V','0',-1000,1000,'single',1,'V','battery voltage')
sig_def('INP_BAT_s_CurBat_A','0',-1000,1000,'single',1,'A','battery current')
sig_def('INP_BAT_s_TempBat_degC','0',-1000,1000,'single',1,'degC','battery temperature')

bus_def('INP_b_Bat',{'INP_BAT_s_VoltBat_V'; 'INP_BAT_s_CurBat_A';'INP_BAT_s_TempBat_degC'},'bus battery');
%% 
sig_def('OFD_s_PresBrkFr_bar','0',-1000,1000,'single',1,'bar','brake pressure front')
sig_def('OFD_s_PresBrkRe_bar','0',-1000,1000,'single',1,'bar','brake pressure rear')

bus_def('OFD_b_TqBrkHyd',{'OFD_s_PresBrkFr_bar'; 'OFD_s_PresBrkRe_bar'},'bus brakes');
%% 
sig_def('INP_BRK_s_PresBrkFr_bar','0',-1000,1000,'single',1,'bar','brake pressure front')
sig_def('INP_BRK_s_PresBrkRe_bar','0',-1000,1000,'single',1,'bar','brake pressure rear')

bus_def('INP_b_TqBrkHyd',{'INP_BRK_s_PresBrkFr_bar'; 'INP_BRK_s_PresBrkRe_bar'},'bus brakes');
%% 
sig_def('OFD_s_AngStWhl_rad','0',-1000,1000,'single',1,'rad','steering wheel angle')
sig_def('OFD_s_PosThr_p100','0',-1000,1000,'single',1,'p100','throttle position')
sig_def('OFD_s_RegGear_na','0',-1000,1000,'single',1,'na','regime gear')
sig_def('OFD_s_RegDrvSplit_na','0',-1000,1000,'single',1,'na','regime drive split')

bus_def('OFD_b_Drvr',{'OFD_s_AngStWhl_rad'; 'OFD_s_PosThr_p100';'OFD_s_RegGear_na';'OFD_s_RegDrvSplit_na'},'bus driver action');
%% 
sig_def('INP_DRVR_s_AngStWhl_rad','0',-1000,1000,'single',1,'rad','steering wheel angle')
sig_def('INP_DRVR_s_PosThr_p100','0',-1000,1000,'single',1,'p100','throttle position')
sig_def('INP_DRVR_s_RegGear_na','0',-1000,1000,'single',1,'na','regime gear')
sig_def('INP_DRVR_s_RegDrvSplit_na','0',-1000,1000,'single',1,'na','regime drive split')
sig_def('INP_DRVR_s_AngStFrLe_rad','0',-1000,1000,'single',1,'rad','steer angle front left wheel')
sig_def('INP_DRVR_s_AngStFrRi_rad','0',-1000,1000,'single',1,'rad','steer angle front right wheel')
sig_def('INP_DRVR_s_AngStFr_rad','0',-1000,1000,'single',1,'rad','steer angle front wheel - single track model')

bus_def('INP_b_Drvr',{'INP_DRVR_s_AngStWhl_rad'; 'INP_DRVR_s_PosThr_p100';'INP_DRVR_s_RegGear_na';'INP_DRVR_s_RegDrvSplit_na';'INP_DRVR_s_AngStFrLe_rad';'INP_DRVR_s_AngStFrRi_rad';'INP_DRVR_s_AngStFr_rad'},'bus driver action');
%% 
sig_def('OFD_s_SpdMotFrLe_1pmin','0',-1000,1000,'single',1,'1pmin','front left electric motor speed')
sig_def('OFD_s_TqMotFrLe_Nm','0',-1000,1000,'single',1,'Nm','front left electric actual motor torque')
sig_def('OFD_s_TqMotMaxFrLe_Nm','0',-1000,1000,'single',1,'Nm','front left electric maximal motor torque')
sig_def('OFD_s_TqMotMinFrLe_Nm','0',-1000,1000,'single',1,'Nm','front left electric minimal motor torque')
sig_def('OFD_s_RegMotFrLe_na','0',-1000,1000,'single',1,'na','front left electric motor regime')
sig_def('OFD_s_DirMotFrLe_na','0',-1000,1000,'single',1,'na','front left electric motor direction of rotation')

bus_def('OFD_b_ElMotFrLe',{'OFD_s_SpdMotFrLe_1pmin'; 'OFD_s_TqMotFrLe_Nm';'OFD_s_TqMotMaxFrLe_Nm';'OFD_s_TqMotMinFrLe_Nm';'OFD_s_RegMotFrLe_na';'OFD_s_DirMotFrLe_na'},'bus electric motor front left');
%% 
sig_def('INP_EMFL_s_SpdMotFrLe_1pmin','0',-1000,1000,'single',1,'1pmin','front left electric motor speed')
sig_def('INP_EMFL_s_TqMotFrLe_Nm','0',-1000,1000,'single',1,'Nm','front left electric actual motor torque')
sig_def('INP_EMFL_s_TqMotMaxFrLe_Nm','0',-1000,1000,'single',1,'Nm','front left electric maximal motor torque')
sig_def('INP_EMFL_s_TqMotMinFrLe_Nm','0',-1000,1000,'single',1,'Nm','front left electric minimal motor torque')
sig_def('INP_EMFL_s_RegMotFrLe_na','0',-1000,1000,'single',1,'na','front left electric motor regime')
sig_def('INP_EMFL_s_DirMotFrLe_na','0',-1000,1000,'single',1,'na','front left electric motor direction of rotation')

bus_def('INP_b_ElMotFrLe',{'INP_EMFL_s_SpdMotFrLe_1pmin'; 'INP_EMFL_s_TqMotFrLe_Nm';'INP_EMFL_s_TqMotMaxFrLe_Nm';'INP_EMFL_s_TqMotMinFrLe_Nm';'INP_EMFL_s_RegMotFrLe_na';'INP_EMFL_s_DirMotFrLe_na'},'bus electric motor front left');
%% %% 
sig_def('INP_EMFR_s_SpdMotFrRi_1pmin','0',-1000,1000,'single',1,'1pmin','front right electric motor speed')
sig_def('INP_EMFR_s_TqMotFrRi_Nm','0',-1000,1000,'single',1,'Nm','front right electric actual motor torque')
sig_def('INP_EMFR_s_TqMotMaxFrRi_Nm','0',-1000,1000,'single',1,'Nm','front right electric maximal motor torque')
sig_def('INP_EMFR_s_TqMotMinFrRi_Nm','0',-1000,1000,'single',1,'Nm','front right electric minimal motor torque')
sig_def('INP_EMFR_s_RegMotFrRi_na','0',-1000,1000,'single',1,'na','front right electric motor regime')
sig_def('INP_EMFR_s_DirMotFrRi_na','0',-1000,1000,'single',1,'na','front right electric motor direction of rotation')

bus_def('INP_b_ElMotFrRi',{'INP_EMFR_s_SpdMotFrRi_1pmin'; 'INP_EMFR_s_TqMotFrRi_Nm';'INP_EMFR_s_TqMotMaxFrRi_Nm';'INP_EMFR_s_TqMotMinFrRi_Nm';'INP_EMFR_s_RegMotFrRi_na';'INP_EMFR_s_DirMotFrRi_na'},'bus electric motor front right');
%% %% 
sig_def('INP_EMRL_s_SpdMotReLe_1pmin','0',-1000,1000,'single',1,'1pmin','rear left electric motor speed')
sig_def('INP_EMRL_s_TqMotReLe_Nm','0',-1000,1000,'single',1,'Nm','rear left electric actual motor torque')
sig_def('INP_EMRL_s_TqMotMaxReLe_Nm','0',-1000,1000,'single',1,'Nm','rear left electric maximal motor torque')
sig_def('INP_EMRL_s_TqMotMinReLe_Nm','0',-1000,1000,'single',1,'Nm','rear left electric minimal motor torque')
sig_def('INP_EMRL_s_RegMotReLe_na','0',-1000,1000,'single',1,'na','rear left electric motor regime')
sig_def('INP_EMRL_s_DirMotReLe_na','0',-1000,1000,'single',1,'na','rear left electric motor direction of rotation')

bus_def('INP_b_ElMotReLe',{'INP_EMRL_s_SpdMotReLe_1pmin'; 'INP_EMRL_s_TqMotReLe_Nm';'INP_EMRL_s_TqMotMaxReLe_Nm';'INP_EMRL_s_TqMotMinReLe_Nm';'INP_EMRL_s_RegMotReLe_na';'INP_EMRL_s_DirMotReLe_na'},'bus electric motor rear left');
%% 
sig_def('INP_EMRR_s_SpdMotReRi_1pmin','0',-1000,1000,'single',1,'1pmin','rear right electric motor speed')
sig_def('INP_EMRR_s_TqMotReRi_Nm','0',-1000,1000,'single',1,'Nm','rear right electric actual motor torque')
sig_def('INP_EMRR_s_TqMotMaxReRi_Nm','0',-1000,1000,'single',1,'Nm','rear right electric maximal motor torque')
sig_def('INP_EMRR_s_TqMotMinReRi_Nm','0',-1000,1000,'single',1,'Nm','rear right electric minimal motor torque')
sig_def('INP_EMRR_s_RegMotReRi_na','0',-1000,1000,'single',1,'na','rear right electric motor regime')
sig_def('INP_EMRR_s_DirMotReRi_na','0',-1000,1000,'single',1,'na','rear right electric motor direction of rotation')

bus_def('INP_b_ElMotReRi',{'INP_EMRR_s_SpdMotReRi_1pmin'; 'INP_EMRR_s_TqMotReRi_Nm';'INP_EMRR_s_TqMotMaxReRi_Nm';'INP_EMRR_s_TqMotMinReRi_Nm';'INP_EMRR_s_RegMotReRi_na';'INP_EMRR_s_DirMotReRi_na'},'bus electric motor rear right');
%% 
sig_def('OFD_s_SpdMotFrRi_1pmin','0',-1000,1000,'single',1,'1pmin','front right electric motor speed')
sig_def('OFD_s_TqMotFrRi_Nm','0',-1000,1000,'single',1,'Nm','front right electric actual motor torque')
sig_def('OFD_s_TqMotMaxFrRi_Nm','0',-1000,1000,'single',1,'Nm','front right electric maximal motor torque')
sig_def('OFD_s_TqMotMinFrRi_Nm','0',-1000,1000,'single',1,'Nm','front right electric minimal motor torque')
sig_def('OFD_s_RegMotFrRi_na','0',-1000,1000,'single',1,'na','front right electric motor regime')
sig_def('OFD_s_FirMotFrRi_na','0',-1000,1000,'single',1,'na','front right electric motor direction of rotation')

bus_def('OFD_b_ElMotFrRi',{'OFD_s_SpdMotFrRi_1pmin'; 'OFD_s_TqMotFrRi_Nm';'OFD_s_TqMotMaxFrRi_Nm';'OFD_s_TqMotMinFrRi_Nm';'OFD_s_RegMotFrRi_na';'OFD_s_FirMotFrRi_na'},'bus electric motor front right');
%% 
sig_def('OFD_s_SpdMotReLe_1pmin','0',-1000,1000,'single',1,'1pmin','rear left electric motor speed')
sig_def('OFD_s_TqMotReLe_Nm','0',-1000,1000,'single',1,'Nm','rear left electric actual motor torque')
sig_def('OFD_s_TqMotMaxReLe_Nm','0',-1000,1000,'single',1,'Nm','rear left electric maximal motor torque')
sig_def('OFD_s_TqMotMinReLe_Nm','0',-1000,1000,'single',1,'Nm','rear left electric minimal motor torque')
sig_def('OFD_s_RegMotReLe_na','0',-1000,1000,'single',1,'na','rear left electric motor regime')
sig_def('OFD_s_FirMotReLe_na','0',-1000,1000,'single',1,'na','rear left electric motor direction of rotation')

bus_def('OFD_b_ElMotReLe',{'OFD_s_SpdMotReLe_1pmin'; 'OFD_s_TqMotReLe_Nm';'OFD_s_TqMotMaxReLe_Nm';'OFD_s_TqMotMinReLe_Nm';'OFD_s_RegMotReLe_na';'OFD_s_FirMotReLe_na'},'bus electric motor rear left');
%% 
sig_def('OFD_s_SpdMotReRi_1pmin','0',-1000,1000,'single',1,'1pmin','rear right electric motor speed')
sig_def('OFD_s_TqMotReRi_Nm','0',-1000,1000,'single',1,'Nm','rear right electric actual motor torque')
sig_def('OFD_s_TqMotMaxReRi_Nm','0',-1000,1000,'single',1,'Nm','rear right electric maximal motor torque')
sig_def('OFD_s_TqMotMinReRi_Nm','0',-1000,1000,'single',1,'Nm','rear right electric minimal motor torque')
sig_def('OFD_s_RegMotReRi_na','0',-1000,1000,'single',1,'na','rear right electric motor regime')
sig_def('OFD_s_FirMotReRi_na','0',-1000,1000,'single',1,'na','rear right electric motor direction of rotation')

bus_def('OFD_b_ElMotReRi',{'OFD_s_SpdMotReRi_1pmin'; 'OFD_s_TqMotReRi_Nm';'OFD_s_TqMotMaxReRi_Nm';'OFD_s_TqMotMinReRi_Nm';'OFD_s_RegMotReRi_na';'OFD_s_FirMotReRi_na'},'bus electric motor rear right');
%% 
sig_def('OFD_s_ModDrv_na','0',-1000,1000,'single',1,'na','driver mode')
sig_def('OFD_s_ModFric_na','0',-1000,1000,'single',1,'na','friction mode')

bus_def('OFD_b_KeyBoa',{'OFD_s_ModDrv_na'; 'OFD_s_ModFric_na'},'bus vehicle modes');
%% 
sig_def('INP_KEY_s_ModDrv_na','0',-1000,1000,'single',1,'na','driver mode')
sig_def('INP_KEY_s_ModFric_na','0',-1000,1000,'single',1,'na','friction mode')

bus_def('INP_b_KeyBoa',{'INP_KEY_s_ModDrv_na'; 'INP_KEY_s_ModFric_na'},'bus vehicle modes');
%% 
sig_def('ESTS_VMGP_s_trackFr_m','1.4',0,3,'single',1,'m','front vehicle track')
sig_def('ESTS_VMGP_s_trackRe_m','1.45',0,3,'single',1,'m','rear vehicle track')
sig_def('ESTS_VMGP_s_WhlBas_m','2.85',0,5,'single',1,'m','vehicle wheelbase')
sig_def('ESTS_VMGP_s_StatLoaFr_kg','1400',0,5000,'single',1,'kg','front axle static load')
sig_def('ESTS_VMGP_s_StatLoaRe_kg','1450',0,5000,'single',1,'kg','rear axle static load')
sig_def('ESTS_VMGP_s_VehMas_kg','2850',0,10000,'single',1,'kg','vehicle total mass')
sig_def('ESTS_VMGP_s_HeiCog_m','0.6',0,1,'single',1,'m','wheel cog height')
sig_def('ESTS_VMGP_s_DistCogAxlFr_m','1.4',0,1,'single',1,'m','distance from cog to front axle')
sig_def('ESTS_VMGP_s_DistCogAxlRe_m','1',0,1,'single',1,'m','distance from cog to rear axle')

bus_def('ESTS_VMGP_b_VehMass',{'ESTS_VMGP_s_trackFr_m'; 'ESTS_VMGP_s_trackRe_m';...
    'ESTS_VMGP_s_WhlBas_m';'ESTS_VMGP_s_StatLoaFr_kg';'ESTS_VMGP_s_StatLoaRe_kg';'ESTS_VMGP_s_VehMas_kg';...
    'ESTS_VMGP_s_HeiCog_m';'ESTS_VMGP_s_DistCogAxlFr_m';'ESTS_VMGP_s_DistCogAxlRe_m'},'bus vehicle mass parameters');
%% 
sig_def('ESTS_HVSO_s_SpdRefVeh_mps','0',0,3,'single',1,'mps','reference vehicle speed')
sig_def('ESTS_HVSO_s_VLatCog_mps','0',0,3,'single',1,'mps','lateral velocity in cog')
sig_def('ESTS_HVSO_s_VLgtCog_mps','0',0,5,'single',1,'mps','longitudinal velocity in cog')
sig_def('ESTS_HVSO_s1_FLatXxYy_N','[0,0,0,0]',-100000,100000,'single',4,'N','lateral tire forces')
sig_def('ESTS_HVSO_s1_FLgtXxYy_N','[0,0,0,0]',-100000,100000,'single',4,'N','longitudinal tire forces')
sig_def('ESTS_HVSO_s1_SlipWhl_p1','[0,0,0,0]',0,10000,'single',4,'p1','wheel longitudinal slip')
sig_def('ESTS_HVSO_s_SlipAngCog_deg','0',0,1,'single',1,'deg','slip angle in cog')
sig_def('ESTS_HVSO_s_AngRoadBnk_deg','0',0,10000,'single',1,'deg','road bank angle')
sig_def('ESTS_HVSO_s_AngRoadSlop_deg','0',0,1,'single',1,'deg','road slope angle')
sig_def('ESTS_HVSO_s_SlipAngVelRe_radps','0',0,1,'single',1,'radps','slip angle velocity on the rear axle')

bus_def('ESTS_VHSO_b_Horizontal',{'ESTS_HVSO_s_SpdRefVeh_mps'; 'ESTS_HVSO_s_VLatCog_mps';...
    'ESTS_HVSO_s_VLgtCog_mps';'ESTS_HVSO_s1_FLatXxYy_N';'ESTS_HVSO_s1_FLgtXxYy_N';'ESTS_HVSO_s1_SlipWhl_p1';...
    'ESTS_HVSO_s_SlipAngCog_deg';'ESTS_HVSO_s_AngRoadBnk_deg';'ESTS_HVSO_s_AngRoadSlop_deg';...
    'ESTS_HVSO_s_SlipAngVelRe_radps'},'bus horizontal observer');
%% 
sig_def('ESTS_FRIC_SLIP_s_FriCoe_na','0',0,3,'single',1,'na','f1')
sig_def('ESTS_FRIC_SLIP_s_FriCoeActFrLe_na','0',0,3,'single',1,'na','fFL')
sig_def('ESTS_FRIC_SLIP_s_FriCoeActFrRi_na','0',0,5,'single',1,'na','fFR')
sig_def('ESTS_FRIC_SLIP_s_FriCoeActReLe_na','0',0,5,'single',1,'na','fRL')
sig_def('ESTS_FRIC_SLIP_s_FriCoeActReRi_na','0',0,5,'single',1,'na','fRR')
sig_def('ESTS_FRIC_SLIP_s_FriCoeAvg_na','0',0,5,'single',1,'na','fAvg')
sig_def('ESTS_FRIC_SLIP_s_FriCoeAvgMovAvg_na','0',0,1,'single',1,'na','fSMA')
sig_def('ESTS_FRIC_HILO_STATE_s_FlgLowMue','0',0,1,'boolean',1,'na','flaf of low mue')

bus_def('ESTS_FRIC_b_friCoe',{'ESTS_FRIC_SLIP_s_FriCoe_na'; 'ESTS_FRIC_SLIP_s_FriCoeActFrLe_na';...
    'ESTS_FRIC_SLIP_s_FriCoeActFrRi_na';'ESTS_FRIC_SLIP_s_FriCoeActReLe_na';'ESTS_FRIC_SLIP_s_FriCoeActReRi_na';...
    'ESTS_FRIC_SLIP_s_FriCoeAvg_na';'ESTS_FRIC_SLIP_s_FriCoeAvgMovAvg_na';'ESTS_FRIC_HILO_STATE_s_FlgLowMue'},'bus friction observer');

%% 
sig_def('ESTS_VVSO_s1_FVertXxYy_N','[0,0,0,0]',-100000,100000,'single',4,'N','vertical wheel force')
sig_def('ESTS_VVSO_PitchAngle_rad','0',0,3,'single',1,'rad','pitch angle')
sig_def('ESTS_VVSO_RollAngle_rad','0',0,5,'single',1,'rad','roll angle')

bus_def('ESTS_VVSO_b_Forces',{'ESTS_VVSO_s1_FVertXxYy_N'; 'ESTS_VVSO_PitchAngle_rad';...
    'ESTS_VVSO_RollAngle_rad'},'bus verical vehicle state observer');