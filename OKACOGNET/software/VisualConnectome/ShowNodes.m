function ShowNodes( Nodes )
global gVisConNet;
global gVisConFig;

if nargin < 1
    Nodes = 1:1:gVisConFig.NodeNum;
end

if ischar(Nodes)
    if strcmpi(Nodes, 'all')
        Nodes = 1:gVisConFig.NodeNum;
    else
        error('Wrong input argument');
    end
elseif isvector(Nodes) && isnumeric(Nodes)
    if size(Nodes,1) ~= 1
        Nodes = Nodes.';
    end
    if ~isempty(find(Nodes > gVisConFig.NodeNum, 1))
        error('Exceeding the maximum of node index');
    end
end

NodesToShow = setdiff(Nodes, intersect(Nodes, find(gVisConNet(gVisConFig.CurSubj).NodeShowed)));
for iNode = NodesToShow
    VisCon_DrawNode(iNode, gVisConNet(gVisConFig.CurSubj).NodeStyle(iNode));
    gVisConNet(gVisConFig.CurSubj).NodeShowed(iNode) = true;
end
VisCon_UpdateEdges('Add');
end

