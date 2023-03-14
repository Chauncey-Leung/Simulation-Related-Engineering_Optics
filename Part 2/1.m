f=1;
b=0.0001;
a=0.0001;
lmda=632.8e-9;
xmax=0.05;
ymax=xmax;
def=0.0001;
x=-xmax:def:xmax;
y=-ymax:def:ymax;
lenm=length(x);
lenn=length(y);
for m=1:lenm
    for n=1:lenn
        alpha=pi*x(m)*a/(lmda*f);
        beta=pi*y(n)*a/(lmda*f);
        I(m,n)=((sin(alpha))/(alpha))^2*((sin(beta))/(beta))^2;
    end
end
I=I/(max(max(I)));
[X,Y]=meshgrid(x,y);
% figure;
% mesh(X,Y,I);
% xlabel('x');
% ylabel('y');
% zlabel('π‚«ø');
% rotate 3D hold on
figure;
imshow(255*I);
xlabel('x');
ylabel('y');