function [ ] = show_SS2_InterferenceGraphic(A1,A2,d,D,lambda)
%show_SS_InterferenceGraphic ������ʾ�������沨�沨һǰһ������ͼ��
%A1,A2,d,D,lambda �ֱ�Ϊ�����1 ���2 ����Դ��� �������泡�Ĺ�Դ����泡�ľ��� ����
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

