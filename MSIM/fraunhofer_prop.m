function [Uout, x2, y2] = fraunhofer_prop(Uin, lambda, delta, z)
% 模拟夫琅禾夫衍射
 
% Uin : 初始光场
% lambda : 波长
% delta : 衍射怕屏网格点间隔
% z : 传播距离（衍射面到观察面）
% Uout : 观察面光场 
% x2, y2 : 观察面坐标
 
    N = size(Uin, 1); 
    k = 2 * pi / lambda;
    fx = (-N/2:N/2-1) / (N * delta);
    
    [x2, y2] = meshgrid(lambda * z * fx);
    clear('fx');
    Uout = exp(1i*k/(2*z)*(x2.^2+y2.^2)) / (1i*lambda*z) .* ft2(Uin,delta) .* exp(1i*k*z);