clc;clear;close all;
%��һ�±仯���ƣ����ȡһ�鼫��ֵ����������Σ�������ǣ�д����������
%�޸ĺ�������Ĳ��������Ǹı����������

%  drawFresnelGraphic(getFresnelCoefficient(1.5));
% drawFresnelGraphic(getFresnelCoefficient(1.9));
% drawFresnelGraphic(getFresnelCoefficient(2.5));
% drawFresnelGraphic(getFresnelCoefficient(100));  


%  drawFresnelGraphic(getFresnelCoefficient(0.8));
%  drawFresnelGraphic(getFresnelCoefficient(0.6));
%  drawFresnelGraphic(getFresnelCoefficient(0.2));
%  drawFresnelGraphic(getFresnelCoefficient(0.1))

%�����������,�����棬-1Ϊ�ٽ�ֵ��������ǣ���ͷ�������д������
for n=-5:0.5:0
    drawFresnelGraphic(getFresnelCoefficient(n));
end

% drawFresnelGraphic(getFresnelCoefficient(-1.01))
% drawFresnelGraphic(getFresnelCoefficient(-1.0001))
% drawFresnelGraphic(getFresnelCoefficient(-1.000001))
% drawFresnelGraphic(getFresnelCoefficient(-1.000001))
% drawFresnelGraphic(getFresnelCoefficient(-1))
% drawFresnelGraphic(getFresnelCoefficient(-100))

