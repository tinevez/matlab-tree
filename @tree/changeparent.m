function obj = changeparent(obj, selectedNode, newParent)
% Assign a given node to a new parent
%
% obj = changeparent(obj, selectedNode, newParent)
%
%
% EXAMPLE:
% move node 100 to a new parent (300)
%
% myTree = myTree.changeparent(100,300)
%
%
% Rob Campbell - 2016
    
    % Do not proceed if newParent is a child of the selected node. 
    % Proceeding will cause this part of the tree to be deleted. 
    if any(obj.getchildren(selectedNode) == newParent)
        disp('tree.changeparent -- newParent can not be a child of selectedNode')
        return
    end

    %Get a subtree
    subTree=obj.subtree(selectedNode);

    %Graft the subtree to the new location
    modifiedTree = obj.graft(newParent,subTree);

    %Remove the sub-tree (must remove afterwards or sometimes the graft is to the wrong place)
    modifiedTree = modifiedTree.chop(selectedNode);    

    % Do not return the tree if the number of nodes has changed. 
    % This can happen if the changeparent operation breaks the tree, since the broken part just gets deleted
    if length(modifiedTree.Node) ~= length(obj.Node)
        disp('tree.changeparent -- can not perform operation: it would change the number of nodes in the tree')
    else
        obj=modifiedTree;
    end
        


end