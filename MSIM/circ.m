function z = circ(x, y,x0, y0, D)
% matlab code for evaluating the circ function
% x,y是网格
% x0,y0是圆心坐标
% D为直径
    r = sqrt((x - x0).^2 + (y - y0).^2);
    z = double(r < D / 2);
    z(r == D / 2) = 0.5;

%该函数也是生成类似掩模版的通