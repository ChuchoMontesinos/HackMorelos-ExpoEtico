function RES = ANALIZAR(direccion,umbral)

v = VideoReader(direccion);
i = 0;
C = 1;
while hasFrame(v)
    if i == uint16(v.Duration-0.5)
        break;
    end

    i = i + 1;

    IMAA = readFrame(v);
    FA = BIN(IMAA,50);

    pause(1);

    IMAD = readFrame(v);
    FD = BIN(IMAD,50);

    CAMB(i) = CORR2D(FA, FD);

    % imshow(FA)
    % drawnow
    % title(num2str(CAMB(i)));
end

CONT = 1;
for i=2:length(CAMB)
    VAR(i) = abs(100*CAMB(i-1) - 100*CAMB(i));
    if VAR(i) < umbral
        ERR(CONT) = i;
        CONT = CONT + 1;
    end
end

POR = num2str(100*(length(ERR)/v.Duration)) + "%";

TRANQUILO = "[";
for i=1:length(ERR)
    if i == length(ERR)
        TRANQUILO = TRANQUILO + num2str(ERR(i));
    else
        TRANQUILO = TRANQUILO + num2str(ERR(i)) + ",";
    end
end
TRANQUILO = TRANQUILO + "]";

RES = [POR,TRANQUILO];

% CONT = 0;
% PAUSAS = 0;
% 
% for i=1:length(ERR)-1
% 
%     if ERR(i) == (ERR(i+1)-1)
%         if CONT == 0
%             inicio = num2str(ERR(i));
%         end
%         CONT = CONT + 1;
%     else
%         CONT = 0;
%     end
% 
%     if CONT == 2
%         final = num2str(ERR(i));
%         PAUSAS = PAUSAS + 1;
%         NUMP(PAUSAS) = inicio + "-" + final; 
%     end
% end

end