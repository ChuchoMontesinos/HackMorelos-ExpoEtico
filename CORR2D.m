function [R] = CORR2D(F1,F2)
[filas, columnas] = size(F1);

G1 = zeros(columnas,1);
G2 = zeros(columnas,1);
R = zeros(filas,1);

for j=1:filas
    for i=1:columnas
        G1(i) = F1(j,i);
        G2(i) = F2(j,i);
    end
    VR(j) = CORR(G1,G2);
end

R = sum(VR)/filas;