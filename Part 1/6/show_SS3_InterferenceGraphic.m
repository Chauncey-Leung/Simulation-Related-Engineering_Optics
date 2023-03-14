function  [ ] = show_SS3_InterferenceGraphic(A1,A2,d,D,lambda,state1,state2)
%show_SS_InterferenceGraphic ������ʾ�������沨�沨���ŷţ��ı��䷢ɢor��ۣ��۲����ͼ��
%A1,A2,d,D,lambda �ֱ�Ϊ�����1 ���2 ����Դ��� ��Դ�����泡�ľ��� ����
%state1=0 ��1Ϊ��ɢ���� state1=1 ��1Ϊ���ղ�
%state2=0 ��2Ϊ��ɢ���� state2=1 ��2Ϊ���ղ�
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

