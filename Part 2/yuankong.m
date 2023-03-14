z=zeros(1000);
r=5;
for x=0:1000
    for y=0:1000
        if (x-500)^2+(y-500)^2<=r
            z(x,y)=1;
        end
    end
end

for x=0:1000
    for y=0:1000
        if (x-550)^2+(y-450)^2<=r
            z(x,y)=1;
        end
    end
end
imshow(z)
%f=fftshift(fft2(I)); 
% imshow(log(abs(f)+1),[]);