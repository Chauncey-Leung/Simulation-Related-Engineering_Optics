function  [ ] = show_SP_InterferenceGraphic(A_sphere,A_plane,theta,D,lambda)
%show_SS_InterferenceGraphic ������ʾ���沨��ƽ�沨��ֱ�������б���䣩����ͼ��
%A_sphere,A_plane,theta,D,lambda �ֱ�Ϊ�����沨��� ƽ�沨��� ƽ�沨����� ��Դ�����泡�ľ��� ����

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

