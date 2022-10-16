%% ////////////////////////////canal BSC/////////////////////////////////////

%probabilidad de simbolo
p =[0:0.001:1];

%entropia H (binaria)
H=-p.*log2(p)-(1-p).*log2(1-p);

%capacidad
C=1-H;

figure(1)
plot(p,C)
title("Capacidad del canal binario simetrico (BSC)")
ylabel("Capacidad (bits)")
xlabel("Probabilidad")

% para simbolos no equiprobables

Cq = [];

for q=0:0.01:1
    PY1 = p + q - 2.*q.*p;
    PY0 = 1 - p -q + 2*q*p;
    
    HY = -PY1.*log2(PY1)-PY0.*log2(PY0);
    
    cq = HY-H;
    Cq = [Cq ;cq];
end

hold on

plot(p,Cq)


%% ////////////////////////////canal BEC/////////////////////////////////////

e = [0:0.001:1];
C_ne = [];

for q=0:0.01:1
    PY1 = q.*(1-e);
    PY2 = (1-q).*(1-e);
    PYint = e;
    
    H2_e = -(1-e).*log2(1-e)-e.*log2(e);
    HY = -PY1.*log2(PY1)-PY2.*log2(PY2)-PYint.*log2(PYint);

    c_ne = HY-H2_e;
    C_ne = [C_ne;c_ne];
end


%capacidad
C = 1-e;

figure(2)
plot(e,C)
title("Capacidad del canal binario borrador (BEC)")
ylabel("Capacidad (bits)")
xlabel("e")

%no equiporbables

hold on
plot(e,C_ne)



