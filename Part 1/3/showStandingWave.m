function [ ] = showStandingWave(A1,A2,derta,k)
%showStandingWave  �˺�����̬��ʾפ���н�����
%   A1,A2,derta,k �ֱ�Ϊ��� ��� ����λ��  ��ʸ

z = 0 : 1 : 1080;              %�������� ���� ��λnm
wt = 0 : 1 : 360;
figure;

for i = 1 : 361
    Ex = A1 * cosd( k * z + wt(i) + derta );      %��-z����
    Ey = A2 * cosd( -k * z + wt(i) );             %��+z����
    E  = Ex + Ey;
    A = 
    plot(z,Ex,'r');
    grid on;
    hold on;
    plot(z,Ey,'g');
    plot(z,E ,'b');
    hold off;
    axis([-20 1100 -3.5 3.5])
    xlabel('z');
    ylabel('E');
    title('פ��');
    pause(0.01);
end
end

