clear; 
tic
lam=600e-6;						    %����600nm
R=5; 								%����������Ƭ�뾶Ϊ3mm
f=2500; 							%����1m
ym=R;xm=R; 
theta=0:pi/100:2*pi;
x=linspace(-xm,xm,1001);            %���ó�����x��Ϊ1001�ȷ�
for n=1:1001       
    k=fix(x(n).^2./(lam.*f));  	        %�����벨����
    if mod(k,2)==0				    %�жϰ벨������ż��Ϊ������Ϳ��
       x1(:,n)=x(n)*cos(theta); 
       y1(:,n)=x(n)*sin(theta);
    end
end
       figure(1)
       plot(x1,y1,'k-')
set(gca,'xtick',[],'ytick',[]);
axis square;