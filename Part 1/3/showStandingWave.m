function [ ] = showStandingWave(A1,A2,derta,k)
%showStandingWave  此函数动态显示驻波行进过程
%   A1,A2,derta,k 分别为振幅 振幅 初相位差  波矢

z = 0 : 1 : 1080;              %传播方向 坐标 单位nm
wt = 0 : 1 : 360;
figure;

for i = 1 : 361
    Ex = A1 * cosd( k * z + wt(i) + derta );      %沿-z传播
    Ey = A2 * cosd( -k * z + wt(i) );             %沿+z传播
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
    title('驻波');
    pause(0.01);
end
end

