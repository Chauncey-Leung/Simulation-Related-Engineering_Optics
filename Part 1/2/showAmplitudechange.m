function [ ] = showAmplitudechange (derta)
%showAmplitudechange deata指定相位差
%   相位差与其中一个振幅不变的情况下（令其为2）不变的情况下
%   另一振幅变化观察偏振状态的改变
theta = 0 : 0.1 : 360;
Ax = 0 : 0.02 : 5;
for i = 1 : length(Ax)
    Ex = Ax(i) * cosd( theta );        %x分量
    Ey = 2 * cosd( theta + derta); %y分量
    plot(Ex,Ey,'r');
    axis([-5 5 -5 5]);
    xlabel('Ex');
    ylabel('Ey');
    title(['振动方向垂直叠加，Ax/Ay=',num2str(Ax(i)/2)]);
    pause(0.01);
end
end

