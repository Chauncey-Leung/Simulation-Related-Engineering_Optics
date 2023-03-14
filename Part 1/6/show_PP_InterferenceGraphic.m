function [ ] = show_PP_InterferenceGraphic(A1,A2,theta1,theta2,lambda)
%showInterferenceGraphic ������ʾ����ƽ�沨�����ͼ��
%A1,A2,theta1,theta2,lambda �ֱ�Ϊ�����1 ���2 ��λ��1 ��λ��2 ����
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

