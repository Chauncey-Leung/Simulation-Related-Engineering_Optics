clear;clf;

lamda = [660,610,570,550,460,440,410] * 1e-9;
RGB = [1,0,0;1,0.5,0;1,1,0;0,1,0;0,1,1;0,0,1;0.67,0,1];
d = 4e-5;
b = 8e-6;

I_rgb=zeros(100,1048,3);
Iw=zeros(100,1048,3);
for coulor_code = 1:7
    theta=linspace (-0.015*pi,0.015*pi,1048);%衍射角度的变化范围
    phase = 2 * pi * d * sin(theta) / lamda(coulor_code);
    alpha = pi * b * sin(theta) / lamda(coulor_code);
    Idf = (sinc(alpha)) .^ 2;%单缝衍射的相对光强
    Idgs=(sin(phase/2)./(phase/2)).^2;%多光束干涉的相对光强
    I=Idf;%.*Idgs;%光栅衍射的相对光强
    for i = 1:100
        Iw(i, : ,1) = I*RGB(coulor_code,1);
        Iw(i, : ,2) = I*RGB(coulor_code,2);
        Iw(i, : ,3) = I*RGB(coulor_code,3);
    end
    I_rgb = I_rgb + Iw;
    Iw = [];
end

II=I_rgb * 20 /max(max(max(I_rgb)));
imshow(II);%显示仿真结果