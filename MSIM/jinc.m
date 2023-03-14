function y = jinc(x)
% function y = jinc(x)
% code for evaluating the jinc function
 
    y = ones(size(x));
    idx = x ~= 0;
    y(idx) = 2.0*besselj(1, pi*x(idx)) ./ (pi*x(idx));