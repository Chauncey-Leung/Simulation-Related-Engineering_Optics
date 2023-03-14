clear;clc;
%% �ű�˵���������ͬ����µĶ��������

%% ƽ��ƽ������������
lamda = 700e-9;        %���� ��λm
A = 1;              %���
h = 1e-5;           %ƽ����    ��λ��m
n = 1.3;                %ƽ��������
phase_cha = -10*pi:0.01:10*pi;
theta_length = length(phase_cha);
NumOfBeam=5;               %�������Ŀ
N = NumOfBeam-1;
U_refract = A;
for cnt =1:N
   U_refract = U_refract + A .*exp( 1i * phase_cha * cnt ); 
end

I = abs(U_refract).^2;

plot(phase_cha,I);
