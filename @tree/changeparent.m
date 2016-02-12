function obj = changeparent(obj, selectedNode, newParent)
% Assign a given node to a new parent
%
% obj = changeparent(obj, selectedNode, newParent)
%
%
% EXAMPLE:
% move node 100 to a new parent (300)
%
% myTree = myTree.graft(100,300)
%
% Rob Campbell - 2016
    

    %Get a subtree that includes selectedNode
    thisNode = obj.getparent(selectedNode);
    subTree=obj.subtree(thisNode);

    %Remove the sub-tree
    obj = obj.removesubtree(thisNode);

    %Graft the subtree to the new location
    obj = obj.graft(newParent,subTree)
    

end