function segments = getsegments(obj, linkSegments, nodeID, segments)
%% GETSEGMENTS  Return a cell array containing all unique segments of the tree
%
% segments = getsegments(obj, linkSegments)
%
% Options
% If linksegments is 1, then the branch node is added to each returned segement. This makes
% it possible to plot the data without gaps appearing. This is the default. 
% If linksegments is 0, then the no duplicate points are returned.
%
% Examples
% segments = myTree.getsegments %for plotting a tree without repeats
% segments = myTree.getsegments(0) %for returning segments without redundant nodes
% 
%
% Rob Campbell, Basel, 2015


if nargin<2
    linkSegments=1;
end

if nargin<3
    nodeID = 1;
    segments = {};
end

if linkSegments & nodeID>1
    thisPath = [obj.getparent(nodeID)];
else
    thisPath = [];
end

while length(nodeID)==1 %Loop until we get to a branch point
    thisPath = [thisPath,nodeID];
    nodeID = obj.getchildren(nodeID);
end

%Store our branch point. 
segments = [segments,thisPath];

%Go into the branches
for ii=1:length(nodeID)
    segments=obj.getsegments(linkSegments,nodeID(ii),segments);
end



