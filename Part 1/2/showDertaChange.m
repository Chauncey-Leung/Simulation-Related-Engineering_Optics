function [ ] = showDertaChange(Ax, Ay)
%showChange  Ax AyΪ�����
%   ��������derta��0��2pi�仯ʱƫ��仯���
theta = 0 : 0.1 : 360;

for derta = 1 : 361
    Ex = Ax * cosd( theta );        %x����
    Ey = Ay * cosd( theta + derta); %y����
    plot(Ex,Ey,'r');
    axis([-5 5 -5 5]);
    xlabel('Ex');
    ylabel('Ey');
    title(['�񶯷���ֱ���ӣ���λ���=',num2str(derta),'��']);
    pause(0.01);
end
end

