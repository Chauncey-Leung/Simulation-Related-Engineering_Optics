function [Uout, x2, y2] = fresnel_prop(Uin, lambda, delta, z)
% 模拟菲涅尔衍射
 
% Uin : 初始光场
% lambda : 波长
% delta : 衍射怕屏网格点间隔
% z : 传播距离（衍射面到观察面）
% Uout : 观察面光场 
% x2, y2 : 观察面坐标
 
    N = size(Uin, 1); 
    k = 2 * pi / lambda;
    x = (-N/2:N/2-1)*delta;
    [x1, y1] = meshgrid(x);
    %这里乘了一个相位是与fraunhofer衍射的关键区别，frenel衍射是近场衍射，fraunhofer是远场衍射。
    Uin = Uin .* exp(1i * k / (2 * z) * (x1.^2 + y1.^2));
    
    fx = (-N/2:N/2-1) / (N * delta);
    [x2, y2] = meshgrid(lambda * z * fx);
    
    clear('fx');
    Uout = exp(1i*k/(2*z)*(x2.^2+y2.^2))/ (1i*lambda*z) .* ft2(Uin,delta) .* exp(1i*k*z);