function [ ] = drawFresnelGraphic(fresnel_coefficient)

%% Reflectance, transmittance, and phase change
Rs = abs(fresnel_coefficient.rs.^2);
Rp = abs(fresnel_coefficient.rp.^2);
Rn = 0.5 * ( Rs + Rp );
Ts = 1 - Rs;
Tp = 1 - Rp;
Tn = 0.5 * ( Ts + Tp );
dertas = angle(fresnel_coefficient.rs);%Phase change of reflected light s component
dertap = angle(fresnel_coefficient.rp);%Phase change of reflected light p component

figure ;
set(gcf,'position',[100 0 500 890])

%% subfigure1
axes('Position',[0.1,0.71,0.8,0.26]);
hold on;
if(isreal(fresnel_coefficient.rs))
    plot(fresnel_coefficient.incidence_angle,fresnel_coefficient.rs,'r');
else
    plot(fresnel_coefficient.incidence_angle,abs(fresnel_coefficient.rs),'r');
end
if(isreal(fresnel_coefficient.rp))
    plot(fresnel_coefficient.incidence_angle,fresnel_coefficient.rp,'g')
else
    plot(fresnel_coefficient.incidence_angle,abs(fresnel_coefficient.rp),'g');
end
if(isreal(fresnel_coefficient.ts))
    plot(fresnel_coefficient.incidence_angle,fresnel_coefficient.ts,'b');
else
    plot(fresnel_coefficient.incidence_angle,abs(fresnel_coefficient.ts),'b');
end
if(isreal(fresnel_coefficient.tp))
    plot(fresnel_coefficient.incidence_angle,fresnel_coefficient.tp,'c');
else
    plot(fresnel_coefficient.incidence_angle,abs(fresnel_coefficient.tp),'c');
end
hold off;
xlabel('θ1');
ylabel('Amplitude');
legend('rs','rp','ts','tp');
title(['菲涅尔系数 n = ',num2str(fresnel_coefficient.relative_index)]);

%% subfigure2
axes('Position',[0.1,0.38,0.8,0.26]);
hold on;
plot(fresnel_coefficient.incidence_angle,Rs,'r');
plot(fresnel_coefficient.incidence_angle,Rp,'g');
plot(fresnel_coefficient.incidence_angle,Rn,'m');
plot(fresnel_coefficient.incidence_angle,Ts,'b');
plot(fresnel_coefficient.incidence_angle,Tp,'c');
plot(fresnel_coefficient.incidence_angle,Tn,'k');
hold off;
xlabel('θ1');
ylabel('Amplitude');
legend('Rs','Rp','Rn','Ts','Tp','Tn');
title(['强度比值 n = ',num2str(fresnel_coefficient.relative_index)]);

%% subfigure3
axes('Position',[0.1,0.05,0.8,0.26]);
hold on;

plot(fresnel_coefficient.incidence_angle,abs(dertas),'r');
plot(fresnel_coefficient.incidence_angle,abs(dertap),'g');
hold off;
xlabel('θ1');
ylabel('Amplitude');
legend('|δs|','|δp|');
title(['相位变化 n = ',num2str(fresnel_coefficient.relative_index)]);

end

