function [Uout, x2, y2] = fraunhofer_prop(Uin, lambda, delta, z)
% ģ����ź̷�����
 
% Uin : ��ʼ�ⳡ
% lambda : ����
% delta : ���������������
% z : �������루�����浽�۲��棩
% Uout : �۲���ⳡ 
% x2, y2 : �۲�������
 
    N = size(Uin, 1); 
    k = 2 * pi / lambda;
    fx = (-N/2:N/2-1) / (N * delta);
    
    [x2, y2] = meshgrid(lambda * z * fx);
    clear('fx');
    Uout = exp(1i*k/(2*z)*(x2.^2+y2.^2)) / (1i*lambda*z) .* ft2(Uin,delta) .* exp(1i*k*z);