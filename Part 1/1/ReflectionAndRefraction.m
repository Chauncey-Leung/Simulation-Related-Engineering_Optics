clc;clear;close all;
%看一下变化趋势，最后取一组极端值看看究竟如何，做个标记，写到报告里面
%修改函数里面的参数，就是改变相对折射率

%  drawFresnelGraphic(getFresnelCoefficient(1.5));
% drawFresnelGraphic(getFresnelCoefficient(1.9));
% drawFresnelGraphic(getFresnelCoefficient(2.5));
% drawFresnelGraphic(getFresnelCoefficient(100));  


%  drawFresnelGraphic(getFresnelCoefficient(0.8));
%  drawFresnelGraphic(getFresnelCoefficient(0.6));
%  drawFresnelGraphic(getFresnelCoefficient(0.2));
%  drawFresnelGraphic(getFresnelCoefficient(0.1))

%负折射率情况,很神奇，-1为临界值，做个标记，回头查查文献写进报告
for n=-5:0.5:0
    drawFresnelGraphic(getFresnelCoefficient(n));
end

% drawFresnelGraphic(getFresnelCoefficient(-1.01))
% drawFresnelGraphic(getFresnelCoefficient(-1.0001))
% drawFresnelGraphic(getFresnelCoefficient(-1.000001))
% drawFresnelGraphic(getFresnelCoefficient(-1.000001))
% drawFresnelGraphic(getFresnelCoefficient(-1))
% drawFresnelGraphic(getFresnelCoefficient(-100))

