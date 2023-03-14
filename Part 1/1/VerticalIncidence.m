%VerticalIncidence.m
%The script is aimed at avoiding too much calculation instead write function then call it separately.
clc;clear;close all;

n = 0.5:0.05:10;
rs = -(n - 1) ./ (n + 1);
R = rs.^2;
%% figure
figure;
hold on;
plot(n,R,'r');
hold off;
axis auto;
xlabel('n');
ylabel('Amplitude');
legend('R');
title(['��ֱ���䷴�����������ʱ仯']);

%n = -2:0.05:-0.05;%����������Ϊ����