function [Uout, x2, y2] = fresnel_prop(Uin, lambda, delta, z)
% ģ�����������
 
% Uin : ��ʼ�ⳡ
% lambda : ����
% delta : ���������������
% z : �������루�����浽�۲��棩
% Uout : �۲���ⳡ 
% x2, y2 : �۲�������
 
    N = size(Uin, 1); 
    k = 2 * pi / lambda;
    x = (-N/2:N/2-1)*delta;
    [x1, y1] = meshgrid(x);
    %�������һ����λ����fraunhofer����Ĺؼ�����frenel�����ǽ������䣬fraunhofer��Զ�����䡣
    Uin = Uin .* exp(1i * k / (2 * z) * (x1.^2 + y1.^2));
    
    fx = (-N/2:N/2-1) / (N * delta);
    [x2, y2] = meshgrid(lambda * z * fx);
    
    clear('fx');
    Uout = exp(1i*k/(2*z)*(x2.^2+y2.^2))/ (1i*lambda*z) .* ft2(Uin,delta) .* exp(1i*k*z);