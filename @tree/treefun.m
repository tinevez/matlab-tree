function varargout = treefun(obj, fun)
%% TREEFUN  Create a new tree by applying function handle to each node of the source tree.
    if ~isa(fun, 'function_handle')
        error('MATLAB:tree:treefun', ...
            'Second argument, fun, must be a function handle. Got a %s.', ...
            class(fun));
    end
    % validate number of output arguments is <= # outputs of `fun`
    nargoutchk(0,abs(nargout(fun)));
    
    % if called interactively, nargout=0, which causes problems in `cellfun`
    % given: 
    % >> t
    % t = ...
    %   Node: {3x1 cell}
    % e.g. if this isn't done...
    % >> t.treefun(@(x) x+1)
    % >>
    % but by setting output number to 1, `ans` will be assigned
    % >> t.treefun(@(x) x+1);
    % ans = ...
    %   Node: {3x1 cell}
    if ~nargout
        n_out = 1;                      % need new variable b/c can't
                                        % reassign nargout
    else
        n_out = nargout;
    end
    
    % cellfun call collects output into n_outx1 cell array
    [nodes{1:n_out}] = cellfun(fun,obj.Node,'UniformOutput',false);
    for k = 1:n_out                     % copy each output to its own tree
        varargout{k} = tree(obj,'clear');
        varargout{k}.Node = nodes{k};
    end
end