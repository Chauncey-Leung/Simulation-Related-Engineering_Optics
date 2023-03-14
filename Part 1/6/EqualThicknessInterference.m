clear;clf;
%%等厚干涉
%%
%设置初始值
lamda = 500e-9;
A1 = 1;
A2 = 1;
alpha = 2;
n = 1.3;
theta_i = 50;

theta_t = asin(sind(theta_i)/n);


%%
%不同的表面决定了不同的光程差，从而导致不同的干涉图案，而代码的关键就在于用函数表示出光程差
%看不同的仿真只要把其他情况注释掉就行
%1.斜面干涉
% x = linspace(0,10e-5,1001);
% y = linspace(0,10e-5,1001);
% [x, y] = meshgrid(x, y);
%derta = 2 * n * (x * tand(alpha)) * cosd(theta_t) + lamda / 2; 

%2.柱面板干涉
% h = 0.1;
% R = 0.01;
% x = linspace(-10e-5,10e-5,1001);
% y = linspace(-10e-5,10e-5,1001);
% [x, y] = meshgrid(x, y);
% derta = 2 * n  * (h + R - sqrt(R^2 - x.^2 + h) ) * cos(theta_t) + lamda / 2; 

% 3.牛顿环
% h = 0.1;
% R = 0.01;
% x = linspace(-10e-5,10e-5,1001);
% y = linspace(-10e-5,10e-5,1001);
% [x, y] = meshgrid(x, y);
% derta = 2 * n  * (R - sqrt(R^2 - x.^2 - y.^2) + h) * cos(theta_t) + lamda / 2; 

%4.不规则情况，很简单，随便写一个derta的表达式，看看条纹变啥样了
h = 0.1;
R = 0.01;
x = linspace(-10e-5,10e-5,1001);
y = linspace(-10e-5,10e-5,1001);
[x, y] = meshgrid(x, y);
derta = 2 * n  * (R - sqrt(R^2 - ((rand() * x + rand() * 0.0001).^2 + (rand() * y + rand() * 0.0001).^2) )+ h) * cos(theta_t) + lamda / 2; 

%%
%绘制图案
U1 = A1;
U2 = A2 .*exp(-1i * 2 * pi / lamda * derta);
I = abs(U1+U2).^2;
pcolor(x , y ,I);
shading flat;
colormap gray;
