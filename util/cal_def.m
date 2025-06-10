function cal_def(pName,pVal,pMin,pMax,pType,pDim,pUnit,pDesc)

parameterType = 'Simulink';

%% 
switch parameterType
    case 'Simulink'
        param = Simulink.Parameter;

        %chybi radek sigObj.CoderInfo.StorageClass
    case 'PE'
        param = PE.Parameter;
        param.CoderInfo.StorageClass = 'Custom';
        param.CoderInfo.CustomStorageClass = 'Volatile';
        
        if negate
            param.CoderInfo.CustomAttributes.DefinitionFile = 'ASW_CAL';
            param.CoderInfo.CustomAttributes.HeaderFile = 'ASW_CAL';
            param.CoderInfo.CustomAttributes.Owner = 'ASW_CAL';
        end
    otherwise
        error('error')
end
%% 

param.Min = pMin;
param.Max = pMax;
param.Value = pVal;
param.DataType = pType;
param.DocUnits = pUnit;
param.Description = pDesc;

%% 

assignin('base',pName,param)
%% 
end
