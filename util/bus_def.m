function bus_def(pName,signalList,pDesc)

if (isempty(signalList)) ||  ~iscell(signalList)
    error(['incorrect signalList setup for Bus <' pName '> definition'])
elseif ~(isequal(sort(unique(signalList)),sort(signalList)))
    error(['names in signalList setup for Bus <' pName '> are not unique'])
else
    busObj = Simulink.Bus;
    busObj.HeaderFile = 'commonBus_def';
    busObj.DataScope = 'Exported';
    busObj.Description = pDesc;
    busObj.Alignment = -1;

    for el = 1:length(signalList)
        if ~evalin('base',['exist(''' signalList{el} ''')'])
            error (['unknown signal <' signalList{el} '> definition for Bus <' pName '>'])
        else
            elems(el) = Simulink.BusElement;
            elems(el).Name = signalList{el};
            elems(el).Complexity = 'real';
            elems(el).DimensionsMode = 'Fixed';
            elems(el).SampleTime = -1;
            elems(el).Min = evalin('base',[signalList{el} '.Min']);
            elems(el).Max = evalin('base',[signalList{el} '.Max']);
            elems(el).DataType = evalin('base',[signalList{el} '.DataType']);
            elems(el).Dimensions = evalin('base',[signalList{el} '.Dimensions']);
            elems(el).DocUnits = evalin('base',[signalList{el} '.Unit']);
            elems(el).Description = evalin('base',[signalList{el} '.Description']);
        end
    end

    busObj.Elements = elems;
    %% 
    assignin('base' ,pName,busObj)
end

end