function showtree(obj, nodeFunc)
% SHOWTREE how the tree structure on screen 
%
% 	
% If the node contents is a string then the it is simply printed. 
% If the node contents is anything else, then the user must supply
% a function handle (nodeFunc) that tells dumptree how to handle
% the data. 
%
% Examples
% myTree.showtree(@(n) sprintf('%s',n.someLabel))
% myTree.showtree(@treeDumperFncInPathSomewhere)
% showtree(myTree)
%
%
% Rob Campbell, Basel, 2015


if nargin<2
    nodeFunc=[];
    if ~isstr(obj.Node{1})
        fprintf('Node data are not a string but nodeFunc was not defined.\nAborting\n\n')
        return
    end
end


looper(obj,nodeFunc,0,0)



function looper(obj,nodeFunc,id,depth)

    if id==0
        fprintf('%s',returnNode(obj.Node{1},nodeFunc))
        id=1;
    else
       fprintf('%s%s',repmat('',1,depth), returnNode(obj.Node{id},nodeFunc))
    end

    depth = depth+1;

    children = obj.getchildren(id);
    for ii = children
        looper(obj,nodeFunc,ii,depth)
    end





function out = returnNode(nodeContents,nodeFunc)
    if isempty(nodeFunc)
        out =  nodeContents;
    else
        out = nodeFunc(nodeContents);
    end

    out = fprintf('%s\n',out);