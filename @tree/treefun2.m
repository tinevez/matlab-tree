function varargout = treefun2(obj, val, fun)
%%TREEFUN2  Two-arguments function on trees, with scalar expansion.
    if ~isa(fun, 'function_handle')
        error('MATLAB:tree:treefun', ...
            'Second argument, fun, must be a function handle. Got a %s.', ...
            class(fun));
    end
    nargoutchk(0,abs(nargout(fun)));    % validate # output args
    
    [obj, val] = permuteIfNeeded(obj, val);

    % if nargout = 0, set it to 1 so that `ans` is assigned 
    % (see comment in `treefun.m`)
    if ~nargout, n_out = 1; else n_out = nargout; end
    
    if isa(val, 'tree')
        
        [content{1:n_out}] = cellfun(fun, obj.Node, val.Node,...
                                     'UniformOutput',false);
    
    else
        
        [content{1:n_out}] = cellfun(@(x) fun(x, val), obj.Node, ...
                                     'UniformOutput', false);
        
    end
    
    for k = 1:n_out
        varargout{k} = tree(obj,'clear');
        varargout{k}.Node = content{k};
    end
end