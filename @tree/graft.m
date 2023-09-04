function obj = graft(obj, ID, othertree)
% Graft another tree at the specified node of this tree.
%
% obj = graft(obj, node, othertree) 
% Returns a new tree made of the current tree with the new tree (othertree) attached at node "ID".
%
%
% EXAMPLE:
% graft "differentTree" to "myTree" at node 200
%
% myTree = myTree.graft(200,differentTree)
%
%
% Jean-Yves Tinevez - 2013
    
    nNodes = numel(obj.Parent);

    otParents = othertree.Parent;
    
    otParents = otParents + nNodes; % Shift other parent indices
    otParents(1) = ID; % Make the other root a child of the target node
    
    % Concatenate
    newParents = [ obj.Parent ; otParents ];
    newNodes   = vertcat( obj.Node, othertree.Node );
    
    % Edit
    obj.Node = newNodes;
    obj.Parent = newParents;
    

end