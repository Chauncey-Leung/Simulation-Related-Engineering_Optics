function [ ] = drawSingleCase(Ax,Ay,derta)
%drawSingleCase 
%   ͼ�����ɵĹ��̿���ƫ������˳ʱ�뻹����ʱ��
theta = 0 : 1 : 360;
figure;
 axis([-5 5 -5 5]);
    xlabel('Ex');
    ylabel('Ey');
hold on;
for i = 1 : length(theta)
    scatter(Ax * cosd( theta(i) ),Ay * cosd( theta(i) + derta),'r');
    title([num2str(i),'Ax=',num2str(Ax),'  Ay=',num2str(Ay),'  ��λ��=',num2str(derta),'��']);
    pause(0.01);
end
hold off;
end

