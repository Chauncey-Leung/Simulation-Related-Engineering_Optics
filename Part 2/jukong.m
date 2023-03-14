f=1;%1m
b=0.0001;
a=0.0001;%1mm
d=0.0006;
lamda = 500e-9;%632.8nm
N = 3;

xmax = 0.05;
ymax = xmax;
def=0.0001;
x = -xmax:def:xmax;
y = -ymax:def:ymax;
lenm=length(x);
lenn=length(y);
gansheyinzi = zeros(1001,1001);
yansheyinzi = zeros(1001,1001);
for m=1:lenm
    for n=1:lenn
        alpha=pi*x(m)*a/(lamda*f);
        beta=pi*y(n)*b/(lamda*f);
        derta_x=2*pi/lamda*x(m)/f;
        derta_y=2*pi/lamda*y(n)/f;
        I(m,n)=((sin(alpha))/(alpha))^2*((sin(beta))/(beta))^2*(sin(N/2*derta_x)/sin(derta_x/2))^2*(sin(N/2*derta_y)/sin(derta_y/2))^2;
    end
end
% for m=1:lenm
%     for n=1:lenn
%         alpha=pi*x(n)*a/(lamda*f);
%         %beta=pi*y(m)*a/(lamda*f);
%         derta_x=2*pi*d/lamda*x(n)/f;
%         %derta_y=2*pi/lamda*y(m)/f;
%         I(m,n)=((sin(alpha))/(alpha))^2*(sin(N/2*derta_x)/sin(derta_x/2))^2;
%     end
% 
% end
I=I/(max(max(I)));
[X,Y]=meshgrid(x,y);

figure;
mesh(X,Y,I);
xlabel('x');
ylabel('y');
zlabel('光强');

figure;
imshow(255*I);
xlabel('x');
ylabel('y');

figure;
plot(x,I(500,:),'LineWidth',2);
xlabel('x');
ylabel('光强');