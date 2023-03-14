function [ ] = Iplane_imshow(U,x,y)

I = U .* conj(U); 
figure;
% subplot(1, 2, 1);
mesh(x, y, I);
axis square;
figure;
% subplot(1, 2, 2);
imagesc(x(1,:),y(:,1),I);
axis square;

figure;
% I_y0 = I(:, find(x==0));
I_y0 = I(:, size(I,1)/2);
[c,d]=findpeaks(-I_y0);
plot(x(1,:),I_y0,'linewidth',1.2);
hold on;
xlabel('x '); ylabel('Intensity');
plot(x(1,d),-c,'x','linewidth',1.2);
grid on;

end

