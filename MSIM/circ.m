function z = circ(x, y,x0, y0, D)
% matlab code for evaluating the circ function
% x,y������
% x0,y0��Բ������
% DΪֱ��
    r = sqrt((x - x0).^2 + (y - y0).^2);
    z = double(r < D / 2);
    z(r == D / 2) = 0.5;

%�ú���Ҳ������������ģ���ͨ