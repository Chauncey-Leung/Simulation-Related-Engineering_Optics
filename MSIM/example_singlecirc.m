clear all;
clc;
close all;

N = 2048;               %���������
L = 5e-3;               %��ʾ��Χ [m]
delta = L / N;          %������������� [m]
lambda = 561e-9;      %����[m]
k = 2 * pi / lambda;    %��ʸ
x = (-N / 2 : N / 2 - 1) * delta;
[x1, y1] = meshgrid(x);

%% 1. ģ�ⵥ��С��
% D = 40e-6;              %С��ֱ��[m]
% Uin = circ(x1, y1, 0, 0, D);%���ǵ�����

%% 2.ģ��΢͸��
D = 40e-6;%С��ֱ��[m] 
% f = 0.93e-3; %DMD���� 
f = 0.93e-4; %DMD����
Uin = circ(x1, y1, 0, 0, D) .* exp(-1i * k / (2 * f) *(x1.^2 + y1.^2));
[Uin, x1, y1] = fresnel_prop(Uin, lambda, delta, f);%΢͸���۽�ƽ��⵽ԭ��С����������ƽ��

%% ����75mm���ɿռ�ִ��һ��͸��
delta = (x1(1,N)-x1(1,1)) / N;
[U2, x2, y2] = fresnel_prop(Uin, lambda, delta, 75e-3);

%% 1. Uf������75mm����͸����75mm���ɿռ�
% f = 75e-3; 
% D = 22.4e-3; %͸��ֱ��[m]
% U2 = U2 .* exp(-1i * k / (2 * f) * (x2.^2 + y2.^2)) .* circ(x2, y2, 0, 0, D);
% delta = (x2(1,N)-x2(1,1)) / N;
% [Uf, xf, yf] = fresnel_prop(U2, lambda, delta, 75e-3);

%% 2. U3������75mm����͸����150mm���ɿռ�
f = 75e-3; 
D = 22.4e-3; %͸��ֱ��[m]
U2 = U2 .* exp(-1i * k / (2 * f) * (x2.^2 + y2.^2)) .* circ(x2, y2, 0, 0, D);
delta = (x2(1,N)-x2(1,1)) / N;
[U3, x3, y3] = fresnel_prop(U2, lambda, delta, 150e-3);

%% ����75mm����͸����75mm���ɿռ�
%��ʱ�����ִ��λ�ú�sample plane����
f = 75e-3; 
D = 22.4e-3; %͸��ֱ��[m]
U3 = U3 .* exp(-1i * k / (2 * f) * (x3.^2 + y3.^2)) .* circ(x3, y3, 0, 0, D);
delta = (x3(1,N)-x3(1,1)) / N;
[U4, x4, y4] = fresnel_prop(U3, lambda, delta, 75e-3);

%% ��ͼ
% Iplane_imshow(Uin,x1,y1)
% Iplane_imshow(U2,x2,y2)
% Iplane_imshow(Uf,xf,yf)
Iplane_imshow(U4,x4,y4)