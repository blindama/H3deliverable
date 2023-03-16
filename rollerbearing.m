% Input parameters
fr = 5000; % Radial load (N)
fa = 2000; % Thrust load (N)
f = 2; % Factor of safety
appfact = 1;
RPM = 200;
lr = 10^6;
ld = RPM * 10 * 365 * 24 * 60; %number of turns
xd = ld/lr;
v = 1; %1.2 for outer ring rotates 1 for inner
xo = .02;
b = 1.483;
sigma = 4.459;
a = 3;
Rd=.99;

 
% Calculation
c_10_bearing = bearing_table(i, c_10_col);
c_0_bearing = bearing_table(i, c_0_col);

repeat =True;
while repeat == True

%calculate fa_c0

fa_c0 = fa/c_0_bearing;

[miniumm, position] = min(abs(Fa_co - a(:,1)));


Fa_v_fr = Fa/v/fr;

e = a(position,2);

if Fa_v_fr <=e
    x2_col = 3;
    y2_col = 4;
else
    x2_col = 5;
    y2_col = 6;

end
x = a(position,x2_col);
y = a(position,y2_col);

%calculate F effective
fd=x*v*fr+Y*fa;

%calculate C10_calc
C10_calc=appfact*fd*(xd/(xo+(sigma-xo)*(ln(1/Rd)^(1/b))))^(1/a);

if c10_calc < c_10_bearing 
    repeat = false;
end
i = i+1;
%retrieve new C_10 and c_0 values from table(i+1);
c_10_bearing = bearing_table(i, c_10_col);
c_0_bearing = bearing_table(i, c_0_col);

end


