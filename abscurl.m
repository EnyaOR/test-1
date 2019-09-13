function [Curl] = abscurl(y, alpha, beta)

% Fuction to find the curl of wind stress using resting ocean approximation

% Parameter Values
rhoa = (10^9)*1.225; % kg/km^3
Cd = 1.5e-3; % Kara 2007

for i = 1:length(y)
    for j = 1:length(y)      
        Curl(i,j) = -(10^-6)*rhoa*Cd*alpha*( ((alpha*y(i,j)+beta)^2)/(abs(alpha*y(i,j)+beta))+abs(alpha*y(i,j)+beta));
    end
end

end

