function G = ft2(g, delta)
% function G = ft2(g, delta)
    G = fftshift(fft2(fftshift(g))) * delta^2;
    %matlab在计算傅里叶变换的时候，是将一个连续的函数离散化，再用离散的数值去计算
    %在推导公式当中，1D的情况下它是有一个系数delta的
    %而matlab执行fft的时候，他内置的计算操作是忽略了这个delta
    %matlab执行fft2,则忽略了delta_x*delta_y
    %如果你需要严格地考虑傅里叶变换后的能量分布，需要把这个系数考虑进去
