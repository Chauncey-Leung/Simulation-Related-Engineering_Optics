r = 7;
points = 10000;
lam = 0.6*10e-3;
R = 1000;%object distence
b = 200;%imagine
X = linspace(-r,r,points);
Y = linspace(-r,r,points);
A = ones(points,points);
for m = 1:points
    for n = 1:points
        if((sqrt(X(n)^2+Y(m)^2+b^2)-b)/(lam/2)<30)
            if(mod(floor((sqrt(X(n)^2+Y(m)^2+b^2)-b)/(lam/2)),2)==1)
                A(m,n) = 0;
            end
        end
    end
end
figure('color',[0,0,0]);
imagesc(A,[0,1]);
colormap(gray);
set(gca,'xtick',[],'ytick',[]);
axis square;