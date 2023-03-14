function [ ] = show_PP_InterferenceGraphic(A1,A2,theta1,theta2,lambda)
%showInterferenceGraphic 用来显示两个平面波干涉的图像
%A1,A2,theta1,theta2,lambda 分别为：振幅1 振幅2 方位角1 方位角2 波长
x = linspace(-0.000002,0.000002,1001);
y = linspace(-0.000002,0.000002,1001);
[x,y] = meshgrid(x,y);
planewave_1 = A1 .* exp(1i* x * sind(theta1)  * 2 * pi/ lambda );
planewave_2 = A2 .* exp(1i* x * sind(theta2)  * 2 * pi/ lambda );
wave = planewave_1 + planewave_2;
intensity = abs(wave) .^2;
figure;
pcolor(x,y,intensity);

shading flat;
colormap gray;

end

