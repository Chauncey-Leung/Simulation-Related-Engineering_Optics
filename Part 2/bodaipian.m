clear; 
tic
lam=600e-6;						    %波长600nm
R=5; 								%菲涅尔波带片半径为3mm
f=2500; 							%焦距1m
ym=R;xm=R; 
theta=0:pi/100:2*pi;
x=linspace(-xm,xm,1001);            %设置程序中x分为1001等分
for n=1:1001       
    k=fix(x(n).^2./(lam.*f));  	        %求各点半波点数
    if mod(k,2)==0				    %判断半波带数奇偶，为奇数则涂黑
       x1(:,n)=x(n)*cos(theta); 
       y1(:,n)=x(n)*sin(theta);
    end
end
       figure(1)
       plot(x1,y1,'k-')
set(gca,'xtick',[],'ytick',[]);
axis square;