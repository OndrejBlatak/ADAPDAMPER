function sig_def(pName,pVal,pMin,pMax,pType,pDim,pUnit,pDesc)
%% Choose Signal type

SignalType = 'Simulink';


%% Signal setup

switch SignalType
    case 'Simulink'
        sigObj = Simulink.Signal;
        sigObj.CoderInfo.StorageClass = 'ExportedGlobal';
        
    case 'PE'
        sigObj = Simulink.Signal;
        sigObj.CoderInfo.StorageClass = 'Auto';
        
    otherwise
        error(['Unknown Signal type - ' SignalType])
end
%% 

sigObj.Min = pMin;
sigObj.Max = pMax;
sigObj.InitialValue = pVal;
sigObj.DataType = pType;
sigObj.DocUnits = pUnit;
sigObj.Description = pDesc;
sigObj.Dimensions = pDim;

%% 

assignin('base',pName,sigObj)
%% 
end
