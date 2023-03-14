% example_fraunhofer_circ.m
% Simulating a Fraunhofer diffraction pattern with comparison to the
% analtic result
 
close all; clear all; clc;

N = 512;                %采样点个数
L = 5e-3;               %显示范围 [m]
delta = L / N;          %衍射面采样点间隔 [m]
D = 50e-6;              %孔径直径[m]
lambda = 632.8e-9;      %波长[m]
k = 2 * pi / lambda;    %波矢
z1 = 75e-3;             %传播距离[m]
x = (-N/2:N/2-1)*delta;
[x1, y1] = meshgrid(x);

%% 平面波入射pinhole
Uin = circ(x1, y1, 0, 0, D);
[Uout, x2, y2] = fresnel_prop(Uin, lambda, delta, z1);
Iout = Uout .* conj(Uout); % Numerical intensity

%% 经过DMD再入射pinhole
f = 5e-3; %DMD焦距
D_DMD = 190e-6; %DMD直径
Uin2 = exp(-1i * k / (2 * f) * (x1.^2 + y1.^2)) .* circ(x1, y1, 0, 0, D_DMD);
[Uout2, x22, y22] = fresnel_prop(Uin2, lambda, delta, f);
[Uout22, x23, y23] = fresnel_prop(Uout2.* circ(x22, y22, 0, 0, D), lambda, delta, z1);
Iout2 = Uout22 .* conj(Uout22);

%% 绘图
U_y0 = Uout(:,find(x==0));        % Amplitude
I_y0 = Iout(:,find(x==0));        % Intensity
figure;
imagesc(x2(1,:),y2(:,1),Iout)
% axis([-0.1 0.1 -0.1 0.1]);axis square;
title('Numerical Intensity On detection plane')
figure;
[c,d]=findpeaks(-I_y0);
plot(x2(1,:)/z1,I_y0,'linewidth',1.2);
hold on;
% xlim([-0.2 0.2]);
xlabel('theta '); ylabel('Intensity');
plot(x2(1,d)/z1,-c,'x','linewidth',1.2);
grid on

U2_y0 = Uout22(:,find(x==0));        % Amplitude
I2_y0 = Iout2(:,find(x==0));        % Intensity
figure;
imagesc(x23(1,:),y23(:,1),Iout2)
% axis([-0.1 0.1 -0.1 0.1]);axis square;
title('Numerical Intensity On detection plane')
figure;
[c,d]=findpeaks(-I_y0);
plot(x23(1,:)/z1,I2_y0,'linewidth',1.2);
hold on;
% xlim([-0.2 0.2]);
xlabel('theta '); ylabel('Intensity');
plot(x2(1,d)/z1,-c,'x','linewidth',1.2);
grid on