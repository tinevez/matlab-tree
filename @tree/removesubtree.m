function obj = removesubtree(obj, node)
% Removes all nodes descended from the given node
%
% obj = removesubtree(obj, node) returns the tree without the subtree descended
% from the specified node.
%
% EXAMPLE:
%
%  ex = tree.example;
%  es = ex.removesubtree(10);
%
% Rob Campbell - 2016
%
% NOTE: this seems to do the same thing as the chop method. I haven't compared the two. 
    
    [~,ind] = obj.subtree(node);
    ind = cell2mat(ind.Node);

    if length(ind)==1 %then it's a leaf
        return
    end

    obj=obj.removenode(ind(end)); %remove the last node on the list
    obj=obj.removesubtree(node); %keep calling the function (need to re-calculate the node IDs) until all children are gone


end