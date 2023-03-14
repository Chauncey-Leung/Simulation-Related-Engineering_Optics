clear;clf;
%%等倾干涉
%%
%设置初始值
lamda = 500e-9;
A1 = 1;
A2 = 1;
alpha = 2;
h = 0.01;
n = 1.3;
f = 0.5;

x = linspace(-10e-3,10e-3,1001);
y = linspace(-10e-3,10e-3,1001);
[x, y] = meshgrid(x, y);

theta_1N = atand(sqrt(x.^2 + y.^2)/f);
theta_2N = asind(sind(theta_1N)/n);
derta = 2 * n  * h * cosd(theta_2N) + lamda / 2; 

U1 = A1;
U2 = A2 .*exp(-1i * 2 * pi / lamda * derta);
I = abs(U1+U2).^2;
pcolor(x , y ,I);
shading flat;
colormap gray;
