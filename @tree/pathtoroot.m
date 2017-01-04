function path = pathtoroot(obj, n)
%% PATHTOROOT  Path from node "n" to the tree root. 
%
% This is a special case of findpath(), which simply needs to follow a tree back 
% by looking at node's parent. Since a node can only have one parent, this is 
% trivial. It's about 50 times faster than calling findpath(1,myNode), since we don't need 
% to exhaustively search the tree for the fastest path.
%



    if n == 1
        
        path = n;
        return
        
    else
        
        p=obj.Parent(n);
        path=[n,p];
        while p ~= 1
            p=obj.Parent(p);
            path(end+1)=p; % For very large trees it might hekp to pre-allocate then prune back. But right now it doesn't seem worth it.
        end

        

    end
    
    
