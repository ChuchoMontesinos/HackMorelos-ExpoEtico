function [F] = BIN(IMA,umbral)
    HSV = rgb2hsv(IMA);
    H = HSV(:,:,1);
    S = HSV(:,:,2);
    V = HSV(:,:,3);
    F = (S*255 > umbral);
end