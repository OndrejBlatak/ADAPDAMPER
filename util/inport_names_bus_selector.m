function renameLibraryInportsFromBusSelector(libInst)

% renameLibraryInportsFromBusSelector
%
% Použití:
%   1) Klikni na instanci library subsystemu v modelu
%   2) Spusť:
%
%      renameLibraryInportsFromBusSelector(gcb)
%
% Funkce:
% - zjistí názvy signálů přivedených do vstupů library instance
% - pokud signál přichází z Bus Selector, použije název bus elementu
% - odstraní zobrazovací znaky < >
% - najde zdrojový blok v originální library
% - přejmenuje odpovídající Inport bloky v library
% - uloží library


%% ============================================================
% 0. Vstup
% ============================================================

if nargin < 1 || isempty(libInst)
    libInst = gcb;
end

if isempty(libInst)
    error('Není vybraný žádný blok.');
end


%% ============================================================
% 1. Zjisti zdrojový blok v Library
% ============================================================

refBlock = get_param(libInst, 'ReferenceBlock');

if isempty(refBlock)
    error('Vybraný blok není linked Library Block.');
end

fprintf('\nLibrary source:\n%s\n\n', refBlock);


%% ============================================================
% 2. Získej názvy signálů přivedených do instance
% ============================================================

instPH = get_param(libInst, 'PortHandles');

nIn = numel(instPH.Inport);

sigNames = cell(1, nIn);


for k = 1:nIn

    dstPort = instPH.Inport(k);

    % Čára vedoucí do vstupu instance
    lineH = get_param(dstPort, 'Line');

    if lineH == -1
        warning('Input port %d není připojen.', k);
        sigNames{k} = '';
        continue;
    end


    %% --------------------------------------------------------
    % Najdi source port
    % ---------------------------------------------------------

    srcPort = get_param(lineH, 'SrcPortHandle');

    sigName = '';


    %% --------------------------------------------------------
    % Preferuj Bus Selector
    % ---------------------------------------------------------

    if srcPort ~= -1

        srcBlk = get_param(srcPort, 'Parent');

        srcType = get_param(srcBlk, 'BlockType');

        if strcmp(srcType, 'BusSelector')

            % Číslo output portu Bus Selectoru
            portNum = get_param(srcPort, 'PortNumber');

            % Seznam vybraných signálů
            outSignals = get_param(srcBlk, 'OutputSignals');

            % OutputSignals bývá comma-separated string
            sigList = strtrim(strsplit(outSignals, ','));

            if portNum <= numel(sigList)

                sigName = sigList{portNum};

            end

        end

    end


    %% --------------------------------------------------------
    % Fallback: název signal line
    % ---------------------------------------------------------

    if isempty(sigName)

        sigName = get_param(lineH, 'Name');

    end


    %% --------------------------------------------------------
    % Sanitizace názvu
    % ---------------------------------------------------------

    if ~isempty(sigName)

        sigName = strtrim(sigName);

        % Simulink může bus element zobrazovat jako:
        % <SignalName>
        %
        % < > nejsou součástí názvu
        sigName = regexprep(sigName, '^<', '');
        sigName = regexprep(sigName, '>$', '');

        sigName = strtrim(sigName);

    end


    sigNames{k} = sigName;

    fprintf('Input port %d -> %s\n', k, sigName);

end


%% ============================================================
% 3. Načti Library
% ============================================================

tokens = strsplit(refBlock, '/');

libRoot = tokens{1};

load_system(libRoot);

% Library musí být odemčená
set_param(libRoot, 'Lock', 'off');


%% ============================================================
% 4. Najdi Inport bloky ve zdrojové Library
%
% Používáme HANDLES, ne textové cesty.
% ============================================================

inportHandles = find_system( ...
    refBlock, ...
    'SearchDepth', 1, ...
    'FindAll', 'on', ...
    'Type', 'Block', ...
    'BlockType', 'Inport');


%% ============================================================
% 5. Přejmenuj Inporty podle čísla portu
% ============================================================

for k = 1:nIn

    newName = sigNames{k};


    %% --------------------------------------------------------
    % Neznámý název -> přeskoč
    % ---------------------------------------------------------

    if isempty(newName)

        fprintf('Port %d přeskočen - název signálu není znám.\n', k);

        continue;

    end


    %% --------------------------------------------------------
    % Najdi Inport s Port = k
    % ---------------------------------------------------------

    targetH = -1;

    for j = 1:numel(inportHandles)

        portNumber = str2double( ...
            get_param(inportHandles(j), 'Port'));

        if portNumber == k

            targetH = inportHandles(j);

            break;

        end

    end


    if targetH == -1

        warning('Inport číslo %d nebyl v library nalezen.', k);

        continue;

    end


    %% --------------------------------------------------------
    % Sanitizace názvu bloku
    % ---------------------------------------------------------

    newName = strtrim(newName);

    % "/" není povolený v názvu Simulink bloku
    newName = strrep(newName, '/', '_');

    % případně newline
    newName = strrep(newName, newline, '_');


    %% --------------------------------------------------------
    % Rename
    % ---------------------------------------------------------

    oldName = get_param(targetH, 'Name');

    fprintf( ...
        'Port %d: %s  -->  %s\n', ...
        k, oldName, newName);

    % Handle zůstává platný i po rename
    set_param(targetH, 'Name', newName);

end


%% ============================================================
% 6. Ulož Library
% ============================================================

save_system(libRoot);

fprintf('\nLibrary "%s" uložena.\n', libRoot);


%% ============================================================
% 7. Aktualizace modelu
% ============================================================

mdl = bdroot(libInst);

% Library samotnou nelze "SimulationCommand update"
if ~strcmp(get_param(mdl, 'BlockDiagramType'), 'library')

    try
        set_param(mdl, 'SimulationCommand', 'update');

        fprintf('Model "%s" aktualizován.\n', mdl);

    catch ME

        warning( ...
            'Model se nepodařilo automaticky aktualizovat: %s', ...
            ME.message);

    end

else

    fprintf( ...
        'Instance je uvnitř library "%s" - model update přeskočen.\n', ...
        mdl);

end


fprintf('\nHOTOVO.\n');

end