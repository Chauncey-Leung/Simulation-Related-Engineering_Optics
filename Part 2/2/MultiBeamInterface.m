clear;clc;
%% �ű�˵�������Ƿ����ʵ�ƽ��ƽ��Ķ��������

%% ���ó�ʼֵ
A = 1;                  %���
phase_cha = -10*pi:0.01:10*pi;
theta_length = length(phase_cha);
N=100-1;                %������Ŀ�ܶࣨ���ڡޣ�
r = 0.9;                %����������ϵ��
rou = r^2;              %������
tao = 1 - rou;          %͸����

%% ������������
A_transmission = A * tao;
U_transmission = A_transmission * ones(1,theta_length);
A_reflect = A / r * tao;
U_reflect = -A * r * ones(1,theta_length);      %��һ���ֵ�����ֱ���ڴ˻����Ͻ�������
% U_reflect = 0;        %���Ե�һ��
for cnt =1:N            %���������
   U_transmission = U_transmission + A_transmission .* exp( 1i * phase_cha * cnt ) * rou^cnt;
   U_reflect = U_reflect + A_reflect .* exp( 1i * phase_cha * cnt ) * rou^cnt;
end

I_transmission = abs(U_transmission).^2;
I_reflect = abs(U_reflect).^2;

%��һ�� ���԰����仯��0-1֮�䣬���ڹ۲�
I_transmission = I_transmission/max(I_transmission);
I_reflect = I_reflect/max(I_reflect);

%% ��ͼ
figure;
hold on 
plot(phase_cha,I_transmission);
plot(phase_cha,I_reflect);
hold off
legend('͸��','����')

