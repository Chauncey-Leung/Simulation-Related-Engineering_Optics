function fresnel_coefficient = getFresnelCoefficient(relative_index)
%According to the relative refractive index, 
%four Fresnel coefficients and the phase change of the reflected light are obtained
%relative_index n = n2/n1
theta1 = 0 : 0.1 : 90;                               %Incident angle theta1
theta2 = asind( sind(theta1) / relative_index );     %Refraction angle theta2


fresnel_coefficient.incidence_angle = theta1;
fresnel_coefficient.relative_index = relative_index;

% ·ÆÄù¶û¹«Ê½
fresnel_coefficient.rs = -sind(theta1 - theta2) ./ sind(theta1 + theta2);
fresnel_coefficient.rp =  tand(theta1 - theta2) ./ tand(theta1 + theta2);
fresnel_coefficient.ts = 2 * sind(theta2) .* cosd( theta1 ) ./ sind(theta1 + theta2);
fresnel_coefficient.tp = 2 * sind(theta2) .* cosd( theta1 ) ./ (sind(theta1 + theta2) .* cosd(theta1 - theta2));


fresnel_coefficient.dertas = angle(fresnel_coefficient.rs);%Phase change of reflected light s component
fresnel_coefficient.dertap = angle(fresnel_coefficient.rp);%Phase change of reflected light p component
end

