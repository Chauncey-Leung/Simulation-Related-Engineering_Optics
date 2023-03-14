clear;clc;
%% 脚本说明：菲涅尔圆孔衍射

%% 基本参数定义
lamda=633*10^(-7);  %波长
k=2*pi/lamda;       %波数
p=1e-3;            
z=4e-2;         %单位m 衍射屏与孔距离
fu=sqrt(-1);
d=1e-4;         %单位m 圆孔直径
x=-p:0.000005:p;
[X,Y]=meshgrid(x,x);

%% 定义衍射屏 圆孔
A = zeros(length(X));
A1 = zeros(length(X));
for i=1:size(X,1)       %定义圆孔
    for j=1:size(Y,1)
        if X(i,j)^2+Y(i,j)^2<=(d/2)^2
            A(i,j)=1;
        else
            A(i,j)=0;
        end 
    end
end

%% fft求Fresnel衍射
for i=1:size(X,1)
    for j=1:size(Y,1)
            %电矢量
            A1(i,j)=A(i,j)*exp(fu*k/(2*z)*(X(i,j).^2+Y(i,j).^2));
    end
end
%A1=A*exp(j*k/(2*z)*)
afft=fft2(A1);      %傅里叶变换
% aabs=afft;  
aabs=abs(afft);  
aabss1=fftshift(aabs);
aabss2=aabss1.*exp(fu*k*z)/(fu*lamda*z);
% aabss=aabss2;
aabss=abs(aabss2);


%% 绘图
figure(1)       %绘制圆孔
subplot(2,2,1);
imshow(A,[])
title("圆孔");

subplot(2,2,2);
imshow(aabss,[])
colormap(gray);
title("衍射图样");

subplot(2,2,3);
[i,]=size(aabss);
plot(x,aabss((i+1)/2,:),'b')
title("衍射强度");

%%
% 
% subplot(2,2,4);
% plot(x,aabss2((i+1)/2,:))
% 
% figure;
% subplot(2,2,1);
% plot(x,aabss((i+1)/2,:));
% subplot(2,2,2);
% plot(x,aabss((i+1)/2,:));
% subplot(2,2,3);
% plot(x,aabss((i+1)/2,:));
% subplot(2,2,4);
% plot(x,aabss((i+1)/2,:));
% figure;
% plot(x,aabss((i+1)/2,:));
% 
% figure;
% plot(x,afft);
% title("afft");
% 
% figure;
% plot(x,aabs);
% title("aabs");
% 
% figure;
% plot(x,aabss1);
% title("aabss1");
% figure;
% plot(x,aabss2);
% title("aabss2");
% 
% figure;
% plot(x,aabss);
% title("aabss");