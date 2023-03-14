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
space = 222e-6;
%% 模拟小孔阵列 9x9的微孔阵列，微孔直径40微米，间距222微米
% D = 40e-6 ;              %小孔直径[m]
% Uin1 = circ(x1, y1, 0, 0, D);%这是单个孔
% Uin2 = circ(x1, y1, -space, 0, D);
% Uin3 = circ(x1, y1, space, 0, D);
% Uin4 = circ(x1, y1, space, space, D);
% Uin5 = circ(x1, y1, 0, space, D);
% Uin6 = circ(x1, y1, -space, space, D);
% Uin7 = circ(x1, y1, space, -space, D);
% Uin8 = circ(x1, y1, 0, -space, D);
% Uin9 = circ(x1, y1, -space, -space, D);
% Uin =double(Uin1|Uin2|Uin3|Uin4|Uin5|Uin6|Uin7|Uin8|Uin9);
%% 模拟小孔阵列 4x4的微孔阵列，微孔直径40微米，间距222微米
% Uin1 = circ(x1, y1, 111e-6, 111e-6, D);%这是单个孔
% Uin2 = circ(x1, y1, 111e-6, -111e-6, D);
% Uin3 = circ(x1, y1, -111e-6, 111e-6, D);
% Uin4 = circ(x1, y1, -111e-6, -111e-6, D);
% Uin =Uin1|Uin2|Uin3|Uin4;
% imshow(Uin,[]);

%% 3X3 with DMD
D = 40e-6 ;              %小孔直径[m]
f = 0.93e-4; %DMD焦距 
Uin1 = circ(x1, y1, 0, 0, D) .* exp(-1i * k / (2 * f) *(x1.^2 + y1.^2));
Uin2 = circ(x1, y1, -space, 0, D) .* exp(-1i * k / (2 * f) *((x1+space).^2 + y1.^2));
Uin3 = circ(x1, y1, space, 0, D) .* exp(-1i * k / (2 * f) *((x1-space).^2 + y1.^2));
Uin4 = circ(x1, y1, space, space, D) .* exp(-1i * k / (2 * f) *((x1-space).^2 + (y1-space).^2));
Uin5 = circ(x1, y1, 0, space, D) .* exp(-1i * k / (2 * f) *(x1.^2 + (y1-space).^2));
Uin6 = circ(x1, y1, -space, space, D) .* exp(-1i * k / (2 * f) *((x1+space).^2 + (y1-space).^2));
Uin7 = circ(x1, y1, space, -space, D) .* exp(-1i * k / (2 * f) *((x1-space).^2 + (y1+space).^2));
Uin8 = circ(x1, y1, 0, -space, D) .* exp(-1i * k / (2 * f) *(x1.^2 + (y1+space).^2));
Uin9 = circ(x1, y1, -space, -space, D) .* exp(-1i * k / (2 * f) *((x1+space).^2 + (y1+space).^2));
Uin =Uin1+Uin2+Uin3+Uin4+Uin5+Uin6+Uin7+Uin8+Uin9;
[Uin, x1, y1] = fresnel_prop(Uin, lambda, delta, f);%微透镜聚焦平面光到原来小孔阵列所在平面
%% 通过小孔经过75mm自由空间抵达第一个透镜
delta = (x1(1,N)-x1(1,1)) / N;
[U2, x2, y2] = fresnel_prop(Uin, lambda, delta, 75e-3);
%% 经过75mm焦距透镜和75mm自由空间到达傅里叶面
f = 75e-3; 
D = 22.4e-3; %透镜直径[m]
U2 = U2 .* exp(-1i * k / (2 * f) * (x2.^2 + y2.^2)) .* circ(x2, y2, 0, 0, D);
% clear Uin Uin1 Uin2 Uin3 Uin4 Uin5 Uin6 Uin7 Uin8 Uin9 x1 y1;
% Iplane_imshow(U2,x2,y2)
delta = (x2(1,N)-x2(1,1)) / N;
[Uf, xf, yf] = fresnel_prop(U2, lambda, delta, 75e-3);
clear U2 x2 y2;


%% 经过75mm焦距透镜和150mm自由空间
% f = 75e-3; 
% D = 22.4e-3; %透镜直径[m]
% U2 = U2 .* exp(-1i * k / (2 * f) * (x2.^2 + y2.^2)) .* circ(x2, y2, 0, 0, D);
% clear Uin Uin1 Uin2 Uin3 Uin4 Uin5 Uin6 Uin7 Uin8 Uin9 x1 y1;
% % Iplane_imshow(U2,x2,y2)
% delta = (x2(1,N)-x2(1,1)) / N;
% [U3, x3, y3] = fresnel_prop(U2, lambda, delta, 150e-3);
% clear U2 x2 y2;
% Iplane_imshow(U3,x3,y3)
%% 经过75mm焦距透镜和75mm自由空间
% 此时光束抵达的位置和sample plane共轭
% f = 75e-3; 
% D = 22.4e-3; %透镜直径[m]
% U3 = U3 .* exp(-1i * k / (2 * f) * (x3.^2 + y3.^2)) .* circ(x3, y3, 0, 0, D);
% delta = (x3(1,N)-x3(1,1)) / N;
% [U4, x4, y4] = fresnel_prop(U3, lambda, delta, 75e-3);
% clear U3 x3 y3;

%% 绘图
% Iplane_imshow(Uin,x1,y1);
% Iplane_imshow(U2,x2,y2);
Iplane_imshow(Uf,xf,yf);
% Iplane_imshow(U3,x3,y3);
% Iplane_imshow(U4,x4,y4);

