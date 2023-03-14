function [ ] = showDertaChange(Ax, Ay)
%showChange  Ax Ay为振幅，
%   用以体现derta从0到2pi变化时偏振变化情况
theta = 0 : 0.1 : 360;

for derta = 1 : 361
    Ex = Ax * cosd( theta );        %x分量
    Ey = Ay * cosd( theta + derta); %y分量
    plot(Ex,Ey,'r');
    axis([-5 5 -5 5]);
    xlabel('Ex');
    ylabel('Ey');
    title(['振动方向垂直叠加，相位差δ=',num2str(derta),'°']);
    pause(0.01);
end
end

