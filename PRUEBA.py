import numpy as np
import matlab.engine

eng = matlab.engine.start_matlab();

direccion = "D:\\IPN\\UPIITA\\8mo Semestre\\_NO_MATERIAS\\Hackhaton\\Visión\\Video\\Destino\\PRESENTACION_FINAL.mp4";

#Ejecución de función de MatLab en Python
RES = eng.ANALIZAR(direccion,1.5);

# 0.5 bajo

print("En el video estuviste : ",RES[0]," calmado, segun el limite establecido\n");
print("Segundos con donde estas calmado: ",RES[1],"\n");
#//////////////////////////////////////////////////////////////