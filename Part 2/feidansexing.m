% A1 = 1;
% A2 = 1;
% theta1 = 0;
% theta2 = pi/2;
% x=linspace(-0.0001,0.0001,1001);
% y=linspace(-0.0001,0.0001,1001);
% [x,y]=meshgrid(x,y);
% I=0;
% for i=0:400
%     l=380*10.^(-9)+i*10.^(-9);
%     %i=i+1;
%     k=2*pi/l;
%     E1=A1*exp(1i*k*x*sind(theta1)+1i*k*y*cosd(theta1));
%     E2=A2*exp(1i*k*x*sind(theta2)+1i*k*y*cosd(theta2));
%     E=E1+E2;
%     I1=abs(E).^2;
%     I=I+I1;
% end
% mesh(x,y,I);
% %pcolor(x,y,I);shading flat;
% %colormap(gray);
% %title('.');

lam = linspace(0,1000,1001);
I = zeros(1,1001);
I(1,381:781) = 1;

plot(lam,I);
xlabel('lamda/nm');
ylabel('I');