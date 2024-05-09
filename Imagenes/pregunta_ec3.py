import cv2
import numpy as np
import math
import serial,time
import threading

puerto = serial.Serial('COM3',9600) #Configuramos puerto y velocidad
contador = 0
cap = cv2.VideoCapture(0)

def nothing(x):
    pass

def map_value(x, in_min, in_max, out_min, out_max):
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min

cv2.namedWindow('IDAT1')
cv2.createTrackbar('Hmin','IDAT1',0,255,nothing)
cv2.createTrackbar('Hmax','IDAT1',0,255,nothing)
cv2.createTrackbar('Smin','IDAT1',0,255,nothing)
cv2.createTrackbar('Smax','IDAT1',0,255,nothing)
cv2.createTrackbar('Vmin','IDAT1',0,255,nothing)
cv2.createTrackbar('Vmax','IDAT1',0,255,nothing)

while True:
    
    contador = contador + 1
    
    ret, frame = cap.read()
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    
    hMin = cv2.getTrackbarPos('Hmin','IDAT1')
    hMax = cv2.getTrackbarPos('Hmax','IDAT1')
    sMin = cv2.getTrackbarPos('Smin','IDAT1')
    sMax = cv2.getTrackbarPos('Smax','IDAT1')
    vMin = cv2.getTrackbarPos('Vmin','IDAT1')
    vMax = cv2.getTrackbarPos('Vmax','IDAT1')
    
    lower =  np.array([16,85,35])
    upper =  np.array([33,255,255])
    
    #lower =  np.array([hMin,sMin,vMin])
    #upper =  np.array([hMax,sMax,vMax])
    
    mask = cv2.inRange(hsv,lower,upper)
    kernel = np.ones((5,5),np.uint8)
    erosion = cv2.erode(mask,kernel,iterations=4)
    dilatacion = cv2.dilate(erosion,kernel,iterations=4)
    x,y,h,w = cv2.boundingRect(dilatacion)
    cv2.rectangle(frame,(x,y),(x+w,y+h),(0,255,0),3)
    font = cv2.FONT_HERSHEY_COMPLEX
    cv2.putText(frame,"Rueda",(x,y-13),font,0.65,(0,255,0),1,cv2.LINE_AA)
    
    cv2.line(frame,(320,0),(320,480),(0,0,255),3)
    
    x1 = x + round(w/2)
    y1 = y + round(h/2)
    
    cv2.line(frame,(320,480),(x1,y1),(0,0,255),3)
    
    x2 = x1 - 320
    y2 = 480 - y1
    
    angulo = round(math.degrees(math.atan(x2/y2)))
    mapped_value = map_value(angulo, -90, 90, 45, 140)
    final_angulo = str(round(mapped_value)).zfill(3) + '\0'
    
    if(contador == 50):
        print(final_angulo)
        puerto.write(str.encode(str(final_angulo)))
        contador = 0
    
    cv2.putText(frame,"("+str(x2)+","+str(y2)+")",(x1,y1),font,0.5,(0,255,0),1,cv2.LINE_AA)
    cv2.putText(frame, "Angulo: "+str(angulo),(442,25),font,0.65,(0,255,0),1,cv2.LINE_AA)
        
    cv2.imshow('res',frame)
    k = cv2.waitKey(1)
    if k == 27:
        break

puerto.close()
cap.release()
cv2.destroyAllWindows()
