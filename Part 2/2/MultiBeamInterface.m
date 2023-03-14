clear;clc;
%% 脚本说明：考虑反射率的平行平板的多光束干涉

%% 设置初始值
A = 1;                  %振幅
phase_cha = -10*pi:0.01:10*pi;
theta_length = length(phase_cha);
N=100-1;                %光束数目很多（趋于∞）
r = 0.9;                %菲涅尔反射系数
rou = r^2;              %反射率
tao = 1 - rou;          %透射率

%% 多光束干涉叠加
A_transmission = A * tao;
U_transmission = A_transmission * ones(1,theta_length);
A_reflect = A / r * tao;
U_reflect = -A * r * ones(1,theta_length);      %第一项的值，后边直接在此基础上进行运算
% U_reflect = 0;        %忽略第一项
for cnt =1:N            %多光束叠加
   U_transmission = U_transmission + A_transmission .* exp( 1i * phase_cha * cnt ) * rou^cnt;
   U_reflect = U_reflect + A_reflect .* exp( 1i * phase_cha * cnt ) * rou^cnt;
end

I_transmission = abs(U_transmission).^2;
I_reflect = abs(U_reflect).^2;

%归一化 可以把区间化到0-1之间，便于观察
I_transmission = I_transmission/max(I_transmission);
I_reflect = I_reflect/max(I_reflect);

%% 绘图
figure;
hold on 
plot(phase_cha,I_transmission);
plot(phase_cha,I_reflect);
hold off
legend('透射','反射')

