clear;clc;
%% �����Fresnel����

%% ������������
lamda = 632.8e-9;%����m
k = 2 * pi / lamda;%����
d = 50e-6;         %��λm Բ��ֱ��
Ep = 1;%ƽ�沨

%% ���������� Բ��
M = 5e-3;%��ʾ��Χ
Num = 4001;%���������
x1 = linspace(-M, M, Num);
y1 = linspace(-M, M, Num);
[X1, Y1] = meshgrid(linspace(-M, M, Num));
A = zeros(length(x1));
D = ((X1-0).^2 + (Y1-0).^2).^(1/2);
i = find(D <= d/2);
A(i) = 1;

A_DMD = zeros(length(x1));
i = find(D <= 100e-6);
A_DMD(i) = 1;
% Ep = Ep .* A;



[X , Y] = meshgrid(linspace(-M,M,Num));
z1 = [75e-3, 100e-3, 120e-3, 140e-3];%��λm ��������׾���
figure(1);
hold on;
Ep = Ep .* A;
for z_index = 1:length(z1)
    h = exp(1j * k * z1(z_index)) * exp((1j * k * (X.^2 + Y.^2)) / (2 * z1(z_index))) / (1j * lamda * z1(z_index));
    % U = conv2(h,Ep,'same');
    H = fftshift(fft2(h));
    B = fftshift(fft2(Ep));
    G = H.*B;       %Ƶ��˻�
    U = fftshift(ifft2(G));
    I = U .* conj(U);
    % Br = U/max(U);
    I_norm = (I - min(min(I))) / (max(max(I))-min(min(I)));%��һ��
    [i,]=size(I_norm);
%     plot(x1,I_norm((i+1)/2,:));
   plot(x1/z1(z_index),I_norm((i+1)/2,:));
end

% %figure;
% f = 200e-3;%΢͸������
% t = exp(-1i * k / (2 * f) * (X1.^2 + Y1.^2));
% % ph = - k / (2 * f) * (X1.^2 + Y1.^2);
% % ph = angle(t);
% % figure,surfl(ph),shading interp,colormap(gray);
% Ep = t .* A_DMD;
% h = exp(1j * k * f) * exp((1j * k * (X.^2 + Y.^2)) / (2 * f)) / (1j * lamda * f);
% H = fftshift(fft2(h));
% B = fftshift(fft2(Ep));
% G = H .* B;
% U = fftshift(ifft2(G));
% U = U .* A;
% % I1 = U .* conj(U);
% % I1_norm = (I1 - min(min(I1))) / (max(max(I1))-min(min(I1)));%��һ��
% % figure;imshow(I1_norm,[]);
% % [i,]=size(I1_norm);
% % figure;
% % plot(x1,I1_norm((i+1)/2,:));
% 
% % U = 1 / f * exp(-1i * k * f) * exp(-1i * k / (2 * f) * (X.^2 + Y.^2)) .* A;
% z1 = 75e-3;
% h2 = exp(1j * k * z1) * exp((1j * k * (X.^2 + Y.^2)) / (2 * z1)) / (1j * lamda * z1);
% H2 = fftshift(fft2(h2));
% B2 = fftshift(fft2(U));
% G2 = H2.*B2;       %Ƶ��˻�
% U2 = fftshift(ifft2(G2));
% I2 = U2 .* conj(U2);
% I2_norm = (I2 - min(min(I2))) / (max(max(I2))-min(min(I2)));%��һ��
% [i,]=size(I2_norm);
% % figure;
% % imshow(I2_norm);
% hold on;
% plot(x1/z1,I2_norm((i+1)/2,:));