function [ ] = fft_function(A0,k0,L)

% Analog Signal
dz = 0.00005;
z = -L:dz:L;

fz = A0 * exp( 1i * k0 * z );
%fz = A0 * exp( 1i * k0 * z ).*(z>=-L & z<=L);

% ¸µÀïÒ¶±ä»»
Wmax = 2*pi*2000;
K = 500;
k = 0:1:K;
W = k*Wmax/K;

Ak = fz * exp(-1j*z'*W) * dz;

W = [-fliplr(W), W(2:501)];
Ak = [fliplr(Ak), Ak(2:501)];
figure;
plot(W/(2*pi*1000),Ak*1000);
title(['A0= ',num2str(A0),'  k0= ',num2str(k0),'  L= ',num2str(L)]);
end

