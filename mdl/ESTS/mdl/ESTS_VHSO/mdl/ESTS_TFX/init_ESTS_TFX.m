cal_def('ESTS_TFX_p_AngRatYawThd_radps',0.1,0,1,'single',1,'radps','yaw rate threshold detecting left right turn')
cal_def('ESTS_TFX_p1_SpdRefVehXLim_kmph',[0,50,100,150,200,250],0,1000,'single',6,'kmph','velocity for lookuptable of limit for difference of wheel speeds')
cal_def('ESTS_TFX_p1_SpdWhlDifLim_radps',[10,10,10,10,10,10],0,1000,'single',6,'radps','limit of wheel speeds difference for differential')
cal_def('ESTS_TFX_p_TauFiltDif_s',0.1,0,1,'single',1,'s','Tau for filter')
cal_def('ESTS_TFX_c_TiSample_s',0.01,0,1,'single',1,'s','sample time')
cal_def('ESTS_TFX_p1_TqWhlFrX_Nm',[-1000,-240,0,500,1000],-10000,10000,'single',5,'Nm','input front LSD')
cal_def('ESTS_TFX_py_TqWhlDifFr_Nm',[830,200,200,200,400],-10000,10000,'single',5,'Nm','differential moment front')
cal_def('ESTS_TFX_p1_TqWhlReX_Nm',[-1000,-240,0,500,1000],-10000,10000,'single',5,'Nm','input rear LSD')
cal_def('ESTS_TFX_py_TqWhlDifRe_Nm',[830,200,200,200,400],-10000,10000,'single',5,'Nm','differential moment rear')


