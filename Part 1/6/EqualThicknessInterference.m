clear;clf;
%%�Ⱥ����
%%
%���ó�ʼֵ
lamda = 500e-9;
A1 = 1;
A2 = 1;
alpha = 2;
n = 1.3;
theta_i = 50;

theta_t = asin(sind(theta_i)/n);


%%
%��ͬ�ı�������˲�ͬ�Ĺ�̲�Ӷ����²�ͬ�ĸ���ͼ����������Ĺؼ��������ú�����ʾ����̲�
%����ͬ�ķ���ֻҪ���������ע�͵�����
%1.б�����
% x = linspace(0,10e-5,1001);
% y = linspace(0,10e-5,1001);
% [x, y] = meshgrid(x, y);
%derta = 2 * n * (x * tand(alpha)) * cosd(theta_t) + lamda / 2; 

%2.��������
% h = 0.1;
% R = 0.01;
% x = linspace(-10e-5,10e-5,1001);
% y = linspace(-10e-5,10e-5,1001);
% [x, y] = meshgrid(x, y);
% derta = 2 * n  * (h + R - sqrt(R^2 - x.^2 + h) ) * cos(theta_t) + lamda / 2; 

% 3.ţ�ٻ�
% h = 0.1;
% R = 0.01;
% x = linspace(-10e-5,10e-5,1001);
% y = linspace(-10e-5,10e-5,1001);
% [x, y] = meshgrid(x, y);
% derta = 2 * n  * (R - sqrt(R^2 - x.^2 - y.^2) + h) * cos(theta_t) + lamda / 2; 

%4.������������ܼ򵥣����дһ��derta�ı��ʽ���������Ʊ�ɶ����
h = 0.1;
R = 0.01;
x = linspace(-10e-5,10e-5,1001);
y = linspace(-10e-5,10e-5,1001);
[x, y] = meshgrid(x, y);
derta = 2 * n  * (R - sqrt(R^2 - ((rand() * x + rand() * 0.0001).^2 + (rand() * y + rand() * 0.0001).^2) )+ h) * cos(theta_t) + lamda / 2; 

%%
%����ͼ��
U1 = A1;
U2 = A2 .*exp(-1i * 2 * pi / lamda * derta);
I = abs(U1+U2).^2;
pcolor(x , y ,I);
shading flat;
colormap gray;
