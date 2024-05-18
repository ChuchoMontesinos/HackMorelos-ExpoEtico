function [R] = CORR(GRAF1,GRAF2)

LREF = length(GRAF2);
LFIR = length(GRAF1);

FIRP = sum(GRAF1)/LFIR;
ADJP = sum(GRAF2)/LREF;

if FIRP == 0 || ADJP == 0
    R = 0;
else
    E1 = sum((GRAF2 - ADJP).*(GRAF1 - FIRP));
    E2 = sqrt(sum((GRAF2 - ADJP).^2));
    E3 = sqrt(sum((GRAF1 - FIRP).^2));

    R = E1/(E2*E3);
end



end

