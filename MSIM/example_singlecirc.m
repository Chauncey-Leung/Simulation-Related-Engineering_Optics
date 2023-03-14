clear all;
clc;
close all;

N = 2048;               %采样点个数
L = 5e-3;               %显示范围 [m]
delta = L / N;          %衍射面采样点间隔 [m]
lambda = 561e-9;      %波长[m]
k = 2 * pi / lambda;    %波矢
x = (-N / 2 : N / 2 - 1) * delta;
[x1, y1] = meshgrid(x);

%% 1. 模拟单个小孔
% D = 40e-6;              %小孔直径[m]
% Uin = circ(x1, y1, 0, 0, D);%这是单个孔

%% 2.模拟微透镜
D = 40e-6;%小孔直径[m] 
% f = 0.93e-3; %DMD焦距 
f = 0.93e-4; %DMD焦距
Uin = circ(x1, y1, 0, 0, D) .* exp(-1i * k / (2 * f) *(x1.^2 + y1.^2));
[Uin, x1, y1] = fresnel_prop(Uin, lambda, delta, f);%微透镜聚焦平面光到原来小孔阵列所在平面

%% 经过75mm自由空间抵达第一个透镜
delta = (x1(1,N)-x1(1,1)) / N;
[U2, x2, y2] = fresnel_prop(Uin, lambda, delta, 75e-3);

%% 1. Uf：经过75mm焦距透镜和75mm自由空间
% f = 75e-3; 
% D = 22.4e-3; %透镜直径[m]
% U2 = U2 .* exp(-1i * k / (2 * f) * (x2.^2 + y2.^2)) .* circ(x2, y2, 0, 0, D);
% delta = (x2(1,N)-x2(1,1)) / N;
% [Uf, xf, yf] = fresnel_prop(U2, lambda, delta, 75e-3);

%% 2. U3：经过75mm焦距透镜和150mm自由空间
f = 75e-3; 
D = 22.4e-3; %透镜直径[m]
U2 = U2 .* exp(-1i * k / (2 * f) * (x2.^2 + y2.^2)) .* circ(x2, y2, 0, 0, D);
delta = (x2(1,N)-x2(1,1)) / N;
[U3, x3, y3] = fresnel_prop(U2, lambda, delta, 150e-3);

%% 经过75mm焦距透镜和75mm自由空间
%此时光束抵达的位置和sample plane共轭
f = 75e-3; 
D = 22.4e-3; %透镜直径[m]
U3 = U3 .* exp(-1i * k / (2 * f) * (x3.^2 + y3.^2)) .* circ(x3, y3, 0, 0, D);
delta = (x3(1,N)-x3(1,1)) / N;
[U4, x4, y4] = fresnel_prop(U3, lambda, delta, 75e-3);

%% 绘图
% Iplane_imshow(Uin,x1,y1)
% Iplane_imshow(U2,x2,y2)
% Iplane_imshow(Uf,xf,yf)
Iplane_imshow(U4,x4,y4)