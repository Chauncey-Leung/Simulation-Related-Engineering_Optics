function [ ] = showAmplitudechange (derta)
%showAmplitudechange deataָ����λ��
%   ��λ��������һ��������������£�����Ϊ2������������
%   ��һ����仯�۲�ƫ��״̬�ĸı�
theta = 0 : 0.1 : 360;
Ax = 0 : 0.02 : 5;
for i = 1 : length(Ax)
    Ex = Ax(i) * cosd( theta );        %x����
    Ey = 2 * cosd( theta + derta); %y����
    plot(Ex,Ey,'r');
    axis([-5 5 -5 5]);
    xlabel('Ex');
    ylabel('Ey');
    title(['�񶯷���ֱ���ӣ�Ax/Ay=',num2str(Ax(i)/2)]);
    pause(0.01);
end
end

