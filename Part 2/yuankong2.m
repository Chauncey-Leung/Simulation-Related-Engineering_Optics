
l=500*10^(-9);
a=0.0005;
f=1;
m=300;
d=10*a;
x=linspace(-0.002,0.002,1000);
y=linspace(-0.002,0.002,1000);
N=2;
ym=4000*l*f;
ys=linspace(-ym,ym,m);
xs=ys;
n=200;
for i=1:m
    r=xs(i)^2+ys.^2;
    sinth=sqrt(r./(r+f^2));
    z=2*pi*a*sinth/l;
    I1=(2*besselj(1,z)).^2./z.^2;
    delta=2*pi*d*xs(i)/l;
    I=((2*besselj(1,z)).^2./z.^2)*((sin(N*delta/2)/sin(delta/2)).^2);
    b(:,i)=(I)'.*5000;
end
image(xs,ys,b);
colormap(gray(n));%title('‘≤ø◊∑Ú¿≈∫Õ∑——‹…‰'); 


