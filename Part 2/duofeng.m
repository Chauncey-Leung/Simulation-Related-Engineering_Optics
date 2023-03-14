clear;clf;



%设置初始值
lamda = 700e-9;
A1 = 1;
A2 = 1;
h = 0.01;

n = 1.3;
theta_i = 50;
theta_t = asind(sind(theta_i)/n);
x = linspace(0,10e-6,1001);
y = linspace(0,10e-6,1001);
[x, y] = meshgrid(x, y);
derta = 2 * n * h * cosd(theta_t);

phase_cha =  2 * pi / lamda * derta;
N=10;%多光束数目-1
U = A1;
for rnm =1:N
   U = U + A1 .*exp(-1i * derta * rnm); 
end

I = abs(U).^2;


plot(derta,I(1,:));
% pcolor(x , y ,I);
shading flat;
colormap gray;


