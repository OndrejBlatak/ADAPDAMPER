function addGotoToBusSelectorOutputs(busSel)

% addGotoToBusSelectorOutputs
%
% Použití:
%   1) Klikni na Bus Selector
%   2) spusť:
%
%      addGotoToBusSelectorOutputs(gcb)
%
% Funkce:
% - projde všechny výstupy Bus Selectoru
% - zjistí jméno každého bus elementu
% - ověří, zda daný výstup vede do vstupu subsystemu
% - pokud ano, vytvoří Goto blok
% - GotoTag = název bus elementu
% - Goto připojí jako další branch stejného signálu


%% ============================================================
% 0. Vstup
% ============================================================

if nargin < 1 || isempty(busSel)
    busSel = gcb;
end

if isempty(busSel)
    error('Není vybraný žádný blok.');
end

if ~strcmp(get_param(busSel, 'BlockType'), 'BusSelector')
    error('Vybraný blok není Bus Selector.');
end


%% ============================================================
% 1. Parent model/subsystem
% ============================================================

parent = get_param(busSel, 'Parent');


%% ============================================================
% 2. Výstupní porty Bus Selectoru
% ============================================================

ph = get_param(busSel, 'PortHandles');
outPorts = ph.Outport;

nOut = numel(outPorts);


%% ============================================================
% 3. Názvy output signals z Bus Selectoru
% ============================================================

outSignals = get_param(busSel, 'OutputSignals');

sigList = strtrim(strsplit(outSignals, ','));

if numel(sigList) ~= nOut
    warning( ...
        'Počet OutputSignals (%d) neodpovídá počtu output portů (%d).', ...
        numel(sigList), nOut);
end


%% ============================================================
% 4. Projdi jednotlivé outputy
% ============================================================

for k = 1:nOut

    srcPort = outPorts(k);


    %% --------------------------------------------------------
    % Zjisti jméno signálu
    % ---------------------------------------------------------

    sigName = '';

    if k <= numel(sigList)
        sigName = sigList{k};
    end

    if isempty(sigName)
        warning('Output %d nemá známý název.', k);
        continue;
    end


    %% --------------------------------------------------------
    % Odstraň < >
    % ---------------------------------------------------------

    sigName = strtrim(sigName);

    sigName = regexprep(sigName, '^<', '');
    sigName = regexprep(sigName, '>$', '');

    sigName = strtrim(sigName);


    %% --------------------------------------------------------
    % Najdi line z output portu
    % ---------------------------------------------------------

    lineH = get_param(srcPort, 'Line');

    if lineH == -1
        fprintf('Output %d (%s) není připojen.\n', k, sigName);
        continue;
    end


    %% --------------------------------------------------------
    % Zjisti destinations
    % ---------------------------------------------------------

    dstPorts = get_param(lineH, 'DstPortHandle');

    if isempty(dstPorts) || all(dstPorts == -1)
        continue;
    end


    %% --------------------------------------------------------
    % Ověř, že alespoň jeden destination je Inport subsystemu
    % ---------------------------------------------------------

    goesToSubsystem = false;

    for d = 1:numel(dstPorts)

        if dstPorts(d) == -1
            continue;
        end

        dstBlk = get_param(dstPorts(d), 'Parent');

        dstType = get_param(dstBlk, 'BlockType');

        % typický SubSystem
        if strcmp(dstType, 'SubSystem')
            goesToSubsystem = true;
            break;
        end

    end


    if ~goesToSubsystem
        fprintf( ...
            'Output %d (%s) nevede do subsystemu -> přeskočen.\n', ...
            k, sigName);
        continue;
    end


    %% --------------------------------------------------------
    % Jméno Goto bloku
    % ---------------------------------------------------------

    safeName = sigName;

    safeName = strrep(safeName, '/', '_');
    safeName = strrep(safeName, newline, '_');

    gotoBaseName = ['Goto_' safeName];

    gotoName = gotoBaseName;
    gotoPath = [parent '/' gotoName];


    %% --------------------------------------------------------
    % Pokud Goto už existuje, přeskoč
    % ---------------------------------------------------------

    if getSimulinkBlockHandle(gotoPath) ~= -1

        fprintf( ...
            'Goto pro "%s" už existuje -> přeskočen.\n', ...
            sigName);

        continue;
    end


    %% --------------------------------------------------------
    % Pozice Goto
    % ---------------------------------------------------------

    srcPos = get_param(srcPort, 'Position');

    x = srcPos(1) + 200;
    y = srcPos(2) + 35;

    gotoPos = [ ...
        x, ...
        y-10, ...
        x+220, ...
        y+10];


    %% --------------------------------------------------------
    % Vytvoř Goto
    % ---------------------------------------------------------

    add_block( ...
        'simulink/Signal Routing/Goto', ...
        gotoPath, ...
        'GotoTag', sigName, ...
        'TagVisibility', 'local', ...
        'Position', gotoPos);


    %% --------------------------------------------------------
    % Připoj jako další branch
    % ---------------------------------------------------------

    gotoPH = get_param(gotoPath, 'PortHandles');

    try

        add_line( ...
            parent, ...
            srcPort, ...
            gotoPH.Inport, ...
            'autorouting', 'on');

    catch ME

        delete_block(gotoPath);

        warning( ...
            'Nepodařilo se připojit Goto pro "%s": %s', ...
            sigName, ME.message);

        continue;

    end


    fprintf( ...
        'Output %d -> Goto [%s]\n', ...
        k, sigName);

end


fprintf('\nHOTOVO.\n');

end