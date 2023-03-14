function  [ ] = show_SS3_InterferenceGraphic(A1,A2,d,D,lambda,state1,state2)
%show_SS_InterferenceGraphic 用来显示两个球面波面波并排放，改变其发散or会聚，观察干涉图像
%A1,A2,d,D,lambda 分别为：振幅1 振幅2 两光源间距 光源到干涉场的距离 波长
%state1=0 波1为发散波， state1=1 波1为吸收波
%state2=0 波2为发散波， state2=1 波2为吸收波
x = linspace(-0.00008,0.00008,1001);
y = linspace(-0.00008,0.00008,1001);
[x,y] = meshgrid(x,y);
r1 = sqrt(x.^2 + y.^2 + (D + d/2)^2);
r2 = sqrt(x.^2 + y.^2 + (D - d/2)^2);
spherewave_1 = A1 ./ r1 .* exp((-1)^state1 * 1i* r1 * 2 * pi/ lambda );
spherewave_2 = A2 ./ r2 .* exp((-1)^state2 * 1i* r2 * 2 * pi/ lambda );

wave = spherewave_1 + spherewave_2;
intensity = abs(wave) .^2;
figure;
pcolor(x,y,intensity);

shading flat;
colormap gray;

end

