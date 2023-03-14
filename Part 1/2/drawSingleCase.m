function [ ] = drawSingleCase(Ax,Ay,derta)
%drawSingleCase 
%   图像生成的过程看出偏振方向是顺时针还是逆时针
theta = 0 : 1 : 360;
figure;
 axis([-5 5 -5 5]);
    xlabel('Ex');
    ylabel('Ey');
hold on;
for i = 1 : length(theta)
    scatter(Ax * cosd( theta(i) ),Ay * cosd( theta(i) + derta),'r');
    title([num2str(i),'Ax=',num2str(Ax),'  Ay=',num2str(Ay),'  相位差=',num2str(derta),'°']);
    pause(0.01);
end
hold off;
end

