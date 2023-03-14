function [ ] = showOpticalBeat(A1,A2,w1,w2,v)
%showStandingWave 此函数动态显示驻波行进过程
%   w1,w2,derta 分别为角频率1 角频率2 速度

k1 = w1 / v;
k2 = w2 / v;
km = (k1 - k2) / 2;
wm = (w1 - w2) / 2;
%k_ave  = (k1 + k2) / 2;
%w_ave  = (w1 + w2) / 2;  

z = 0 : 0.01 : 5;

for i = 1 : 361
    %t=i * 10^-10
    E1 = A1 * cosd( k1 * z  - w1 * i * 10^-10 );              
    E2 = A2 * cosd( k2 * z  - w2 * i * 10^-10 );           
    E  = E1 + E2;
    A = 2 * cosd( km * z *  - wm * i * 10^-10 );
    I = A .* A;
    
    subplot(3,1,1);
    plot(z,E1 + 3,'r');
    grid on;
    hold on;
    plot(z,E2 - 3,'g');
    plot(z,E ,'b');
    hold off;
    xlabel('z');
    ylabel('E');
    title('光学拍');
    axis([0 5 -6 6]);
    
    subplot(3,1,2);
    plot(z,A ,'k');
    xlabel('z');
    ylabel('A');
    title('振幅');
    grid on;
    axis([0 5 -6 6]);
    
    subplot(3,1,3);
    plot(z,I ,'m');
    xlabel('z');
    ylabel('I');
    title('光强');
    grid on;
    axis([0 5 0 6]);
    
    pause(0.01);
end
end

