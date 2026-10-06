function output_to_bus_creator(subsys)

% output_to_bus_creator
%
% Použití:
%   1) označ právě jednu instanci library subsystemu
%   2) spusť:
%
%      output_to_bus_creator
%
% Funkce:
% - zjistí source block v library
% - načte Outporty z originální library
% - seřadí je podle Port
% - ze jmen Outportů vytvoří sig_def(...)
% - jednotku bere z poslední části názvu
% - vyskočí dialog pro název busu
% - vytvoří bus_def(...)
% - výsledek vypíše a zkopíruje do clipboardu


%% ============================================================
% 0. Najdi označený blok
% ============================================================

if nargin < 1 || isempty(subsys)

    sys = gcs;

    selected = find_system( ...
        sys, ...
        'SearchDepth', 1, ...
        'Selected', 'on');

    selected = selected(~strcmp(selected,sys));

    if numel(selected) ~= 1
        error('Označ právě jeden library subsystem a spusť skript znovu.');
    end

    subsys = selected{1};
end


%% ============================================================
% 1. Ověř, že jde o linked library block
% ============================================================

refBlock = get_param(subsys,'ReferenceBlock');

if isempty(refBlock)
    error('Vybraný blok není linked Library Block.');
end

fprintf('\nVybraná instance:\n%s\n',subsys);
fprintf('\nLibrary source:\n%s\n',refBlock);


%% ============================================================
% 2. Načti library
% ============================================================

tokens = strsplit(refBlock,'/');
libRoot = tokens{1};

load_system(libRoot);


%% ============================================================
% 3. Najdi Outporty v originální library
% ============================================================

outports = find_system( ...
    refBlock, ...
    'SearchDepth', 1, ...
    'LookUnderMasks', 'all', ...
    'FollowLinks', 'on', ...
    'BlockType', 'Outport');

if isempty(outports)
    error('V library source "%s" nebyly nalezeny žádné Outporty.',refBlock);
end


%% ============================================================
% 4. Seřadit Outporty podle čísla portu
% ============================================================

portNums = zeros(size(outports));

for k = 1:numel(outports)
    portNums(k) = str2double(get_param(outports{k},'Port'));
end

[~,idx] = sort(portNums);
outports = outports(idx);


fprintf('\nNalezené Outporty:\n');

for k = 1:numel(outports)
    fprintf('  Port %s : %s\n', ...
        get_param(outports{k},'Port'), ...
        get_param(outports{k},'Name'));
end


%% ============================================================
% 5. Dialog pro Bus Name
% ============================================================

subsysName = get_param(subsys,'Name');

defaultBusName = [subsysName '_b_Out'];

answer = inputdlg( ...
    {'Zadej název busu:'}, ...
    'Bus definition', ...
    [1 60], ...
    {defaultBusName});

if isempty(answer)
    fprintf('\nGenerování zrušeno uživatelem.\n');
    return;
end

busName = strtrim(answer{1});

if isempty(busName)
    error('Název busu nesmí být prázdný.');
end


%% ============================================================
% 6. Default parametry sig_def
% ============================================================

initValue = '0';
minValue  = -1000;
maxValue  = 1000;
dataType  = 'single';
dimension = 1;


%% ============================================================
% 7. Generování sig_def(...)
% ============================================================

lines = {};
signalNames = cell(1,numel(outports));

for k = 1:numel(outports)

    sigName = get_param(outports{k},'Name');
    sigName = strtrim(sigName);

    signalNames{k} = sigName;


    % Jednotka = poslední část názvu
    tokens = strsplit(sigName,'_');

    if numel(tokens) >= 2
        unit = tokens{end};
    else
        unit = 'na';
    end


    description = '';


    lineTxt = sprintf( ...
        'sig_def(''%s'',''%s'',%g,%g,''%s'',%d,''%s'',''%s'');', ...
        sigName, ...
        initValue, ...
        minValue, ...
        maxValue, ...
        dataType, ...
        dimension, ...
        unit, ...
        description);

    lines{end+1} = lineTxt;

end


%% ============================================================
% 8. Prázdný řádek
% ============================================================

lines{end+1} = '';


%% ============================================================
% 9. Generování bus_def(...)
% ============================================================

lines{end+1} = sprintf( ...
    'bus_def(''%s'',{...', ...
    busName);

for k = 1:numel(signalNames)

    if k < numel(signalNames)

        lines{end+1} = sprintf( ...
            '    ''%s'';...', ...
            signalNames{k});

    else

        lines{end+1} = sprintf( ...
            '    ''%s''},''bus %s'');', ...
            signalNames{k}, ...
            busName);

    end

end


%% ============================================================
% 10. Spoj výstup
% ============================================================

result = strjoin(lines,newline);


%% ============================================================
% 11. Výpis
% ============================================================

fprintf('\n');
fprintf('========================================\n');
fprintf('GENERATED SIGNAL / BUS DEFINITIONS\n');
fprintf('========================================\n\n');

fprintf('%s\n\n',result);


%% ============================================================
% 12. Clipboard
% ============================================================

clipboard('copy',result);

fprintf('========================================\n');
fprintf('Kód byl zkopírován do clipboardu.\n');
fprintf('Bus: %s\n',busName);
fprintf('Počet signálů: %d\n',numel(signalNames));
fprintf('Library source: %s\n',refBlock);
fprintf('========================================\n');

end