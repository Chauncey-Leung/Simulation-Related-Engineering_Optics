function G = ft2(g, delta)
% function G = ft2(g, delta)
    G = fftshift(fft2(fftshift(g))) * delta^2;
    %matlab�ڼ��㸵��Ҷ�任��ʱ���ǽ�һ�������ĺ�����ɢ����������ɢ����ֵȥ����
    %���Ƶ���ʽ���У�1D�������������һ��ϵ��delta��
    %��matlabִ��fft��ʱ�������õļ�������Ǻ��������delta
    %matlabִ��fft2,�������delta_x*delta_y
    %�������Ҫ�ϸ�ؿ��Ǹ���Ҷ�任��������ֲ�����Ҫ�����ϵ�����ǽ�ȥ
