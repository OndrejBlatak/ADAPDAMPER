
initFiles = dir([projPath '\mdl\**\init_*.m']);
disp(' ')
disp('======================================================')
disp('Initializing implementation models')

for i = 1:length(initFiles)

    run(initFiles(i).name)

end

disp('==========================================================')

clear initFiles i