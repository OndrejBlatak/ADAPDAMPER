% init
cal_def('CTRL_SPECCTRL_FF_RSTOP_p_VDmpRstopLim_mmps',200,-5000,50000,'single',1,'mmps','damper velocity limit to detect the bumpstop')
cal_def('CTRL_SPECCTRL_FF_RSTOP_p_DmpStrkRstopLim_mm',350,-1000,1000,'single',1,'mm','damper stroke limit to detect bumpstop')
cal_def('CTRL_SPECCTRL_FF_RSTOP_px_vDmp_mmps',[0 200 400 600],-1000,10000,'single',4,'mmps','---')
cal_def('CTRL_SPECCTRL_FF_RSTOP_py_Dmp_p100',[0 20 40 60],-100,100,'single',4,'p100','---')