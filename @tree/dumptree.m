function str = dumptree(obj, nodeFunc)
%% DUMPTREE  Dump the contents of the tree to a string.
%
% Each line of the string (lines terminated by newline) is one node.
% Each line is in the format:
% node_index , node_parent , node_contents
%
% If node_contents is a string then the it is simply printed. 
% If node_contents is anything else, then the use must supply
% a function handle (nodeFunc) that tells dumptree how to handle
% the data. 
%
% examples
% myTree.dumptree(@(n) sprintf('%d,%d,%d',n.xVoxel,n.yVoxel,n.zVoxel))
% myTree.dumptree(@treeDumperInPathSomewhere)
%
% Rob Campbell, Basel, 2015


if nargin<2
    nodeFunc=[];
    if ~isstr(obj.Node{1})
        fprintf('Node data are not a string but nodeFunc was not defined.\nAborting\n\n')
        return
    end
end


str= '';
for ii=1:length(obj.Node)
    if isempty(nodeFunc)
        nodeData =  obj.Node{ii};
    else
        nodeData = nodeFunc(obj.Node{ii});
    end

    str = [str,sprintf('%d,%d,%s\n',ii,obj.Parent(ii),nodeData)];
end
