function  [ ] = show_SP_InterferenceGraphic(A_sphere,A_plane,theta,D,lambda)
%show_SS_InterferenceGraphic 用来显示球面波与平面波（直入射或者斜入射）干涉图像
%A_sphere,A_plane,theta,D,lambda 分别为：球面波振幅 平面波振幅 平面波入射角 光源到干涉场的距离 波长

x = linspace(-0.00051,0.00051,1001);
y = linspace(-0.00051,0.00051,1001);
[x,y] = meshgrid(x,y);
r = sqrt(x.^2 + y.^2 + D^2);
spherewave = A_sphere ./ r .* exp( 1i * r * 2 * pi/ lambda );
planewave = A_plane .* exp(-1i .* x * cosd(theta)  * 2 * pi/ lambda );
wave = spherewave + planewave;
intensity = abs(wave) .^2;
figure;
pcolor(x,y,intensity);

shading flat;
colormap gray;
end

