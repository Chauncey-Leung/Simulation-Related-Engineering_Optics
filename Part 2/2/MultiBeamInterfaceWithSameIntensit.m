clear;clc;
%% 脚本说明：振幅相同情况下的多光束干涉

%% 平行平板干涉参数设置
lamda = 700e-9;        %波长 单位m
A = 1;              %振幅
h = 1e-5;           %平板厚度    单位：m
n = 1.3;                %平板折射率
phase_cha = -10*pi:0.01:10*pi;
theta_length = length(phase_cha);
NumOfBeam=5;               %多光束数目
N = NumOfBeam-1;
U_refract = A;
for cnt =1:N
   U_refract = U_refract + A .*exp( 1i * phase_cha * cnt ); 
end

I = abs(U_refract).^2;

plot(phase_cha,I);
