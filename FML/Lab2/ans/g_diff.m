function [ res ] = g_diff( x )
    k=3;
    res =k*g(x)*(1-g(x));

end

