function indices = findbranchpoints(obj, varargin)
%FIND   Find indices of nodes with more than one child.
%   I = FINDBRANCHPOINTS(T) returns the linear indices corresponding to the
%   nonzero entries of the tree T.

      indices = find( ...
          arrayfun(@(x) numel(obj.getchildren(x)), ...
          obj.nodeorderiterator(), ...
          'UniformOutput', true) > 1); 

end