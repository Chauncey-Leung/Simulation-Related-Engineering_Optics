clear;clc;
%% Fresnel Diffraction

%% 基本参数定义
lamda = 632.8e-9;%波长m
k = 2 * pi / lamda;%波数
d = 50e-6;         %单位m 圆孔直径
Ep = 1;%平面波

%% 定义衍射屏 圆孔
M = 5e-3;%显示范围
Num = 4001;%采样点个数
x1 = linspace(-M, M, Num);
y1 = linspace(-M, M, Num);
[X1, Y1] = meshgrid(linspace(-M, M, Num));
A = zeros(length(x1));
D = ((X1-0).^2 + (Y1-0).^2).^(1/2);
i = find(D <= d/2);
A(i) = 1;
Ep = Ep .* A;

%% fft求Fresnel衍射
z1 = 200e-3;
M1 = 5e-3;
x = linspace(-M1, M1, Num) * (lamda * z1);
y = linspace(-M1, M1, Num) * (lamda * z1);
[X , Y] = meshgrid(x); %衍射屏

A1 = Ep .* exp(1i * k / (2 * z1) * (X1.^2 + Y1.^2));
A_fft = fftshift(fft2(A1));
A_t = 1 / (1i * lamda * z1) * exp(1i * k * z1) * exp(1i * k/(2*z1) * (X.^2+Y.^2) ) .* A_fft;
I = A_t .* conj(A_t);
I_norm = (I - min(min(I))) / (max(max(I))-min(min(I)));%归一化

figure;
[i,]=size(I_norm);
plot(x/lamda,I_norm((i+1)/2,:),'b');

%% 直接积分硬算
% M1 = 1e-3;
% x = linspace(-M1, M1, Num);
% y = linspace(-M1, M1, Num);
% I2 = zeros(length(x1));
% for x_index = 1:Num
%     for y_index = 1:Num
%         f = @(m, n) Ep_wave(m,n,0.5e-5) .* exp(1i * k / (2 * z1) .* ((x(x_index)-m).^2 + (y(y_index)-n).^2));
%         f_index = quad2d(f,-M,M,-M,M);
%         A_t2 = exp(1i * k * z1) ./ (1i * lamda * z1) .* f_index;
%         I2(x_index,y_index) = A_t2 .* conj(A_t2);
%     end
% end
% I2_norm = (I2 - min(min(I2))) / (max(max(I2))-min(min(I2)));
% figure;
% imshow(I2_norm, []);


%%
% figure(4)
% [i,]=size(I2_norm);
% plot(x1,I2_norm((i+1)/2,:),'k-');

%%
% figure(5)       %绘制圆孔
% imshow(Ep,[])
% title("圆孔");

% z1 = [70e-3, 200e-3, 80e-3, 85e-3, 90e-3];
% z_index = 2;
% x = linspace(-M1, M1, Num);
% y = linspace(-M1, M1, Num);
% [X , Y] = meshgrid(linspace(-M1,M1,Num));
% h = exp(1j * k * z1(z_index)) * exp((1j * k * (X.^2 + Y.^2)) / (2 * z1(z_index))) / (1j * lamda * z1(z_index));
% % U = conv2(h,Ep,'same');
% H = fftshift(fft2(h));
% B = fftshift(fft2(Ep));
% G = H.*B;       %频域乘积
% U = fftshift(ifft2(G));
% I = U .* conj(U);
% % Br = U/max(U);
% I_norm = (I - min(min(I))) / (max(max(I))-min(min(I)));%归一化
% [i,]=size(I_norm);
% hold on;
% plot(x/z1(z_index),I_norm((i+1)/2,:));