function [ ] = show_SS2_InterferenceGraphic(A1,A2,d,D,lambda)
%show_SS_InterferenceGraphic 用来显示两个球面波面波一前一后干涉的图像
%A1,A2,d,D,lambda 分别为：振幅1 振幅2 两光源间距 靠近干涉场的光源与干涉场的距离 波长
x = linspace(-0.002,0.002,1001);
y = linspace(-0.002,0.002,1001);
[x,y] = meshgrid(x,y);
r1 = sqrt(x.^2 + y.^2 + (D + d)^2);
r2 = sqrt(x.^2 + y.^2 + D^2);
spherewave_1 = A1 ./ r1 .* exp(1i* r1 * 2 * pi/ lambda );
spherewave_2 = A2 ./ r2 .* exp(1i* r2 * 2 * pi/ lambda );

wave = spherewave_1 + spherewave_2;
intensity = abs(wave) .^2;
figure;
pcolor(x,y,intensity);

shading flat;
colormap gray;
end

