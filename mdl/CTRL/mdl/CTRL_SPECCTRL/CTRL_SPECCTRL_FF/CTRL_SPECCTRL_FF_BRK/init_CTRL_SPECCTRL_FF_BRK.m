% init

cal_def('CTRL_SPECCTRL_FF_BRK_p_FirmTimerRate_s',1,-5000,50000,'single',1,'s','---')
cal_def('CTRL_SPECCTRL_FF_BRK_p_RegSpCoef_na',1,-1000,1000,'single',1,'na','---')
cal_def('CTRL_SPECCTRL_FF_BRK_p_RegBaseCoef_na',1,-1000,1000,'single',1,'na','---')
cal_def('CTRL_SPECCTRL_FF_BRK_p_RegComCoef_na',1,-1000,1000,'single',1,'na','---')
cal_def('CTRL_SPECCTRL_FF_BRK_p_DmpUpLim_p100',100,-1000,1000,'single',1,'p100','---')
cal_def('CTRL_SPECCTRL_FF_BRK_p_DmpLoLim_p100',-100,-1000,1000,'single',1,'p100','---')
cal_def('CTRL_SPECCTRL_FF_BRK_px_BrkPrs_bar',[0 20 40 60],-100,100,'single',4,'bar','---')
cal_def('CTRL_SPECCTRL_FF_BRK_py_RefSped_mps',[0 100 200],-500,500,'single',4,'mps','---')
cal_def('CTRL_SPECCTRL_FF_BRK_pxy_Dmp_p100',[0 0 0;25 30 35;30 35 40;35 40 45],-100,100,'single',12,'p100','---')
cal_def('CTRL_SPECCTRL_FF_BRK_p_PrsBrkLim_bar',10,-1000,1000,'single',1,'bar','---')
