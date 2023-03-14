z=linspace(0,1000);
t=linspace(0,10);
delta=pi/3;
a=1;
a1=a;
a2=a;
lam=380*10^(-9);

E1=a1*cosd((2*pi/lam)*z);
E2=a2*cosd((2*pi/lam)*z+delta);
E=2*a*cosd((2*pi/lam)*z)*cosd(-0.5*delta);
plot(z,E1,z,E2,z,E,'--')