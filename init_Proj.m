
disp('  ')
disp('===================================================================')
disp('Project_initalization')

%% project path

projPath = fileparts(which(mfilename));

cd(projPath)
addpath(projPath)

addpath(genpath([projPath,'\util\']))
addpath(genpath([projPath,'\mdl\']))
addpath(genpath([projPath,'\integ\']))
addpath(genpath([projPath,'\libs\']))
addpath(genpath([projPath,'\cal\']))

% %% init project configuration
% init_ProjCfg
% 
% %% load models configuration 
% init_ModuleCfgs

%% init project variables
init_ProjVars

