import cv2
import numpy as np
import math

cap = cv2.VideoCapture(0)

while True:
    
    ret, frame = cap.read()
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    
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
    #Se calcula la nueva coordenada (coordenada relativa en base a un nuevo centro)
    x2 = x1 - 320
    y2 = 480 - y1
    #Se realiza el calculo del angulo en base a las coordenadas del centro
    angulo = round(math.degrees(math.atan(x2/y2)))
    
    cv2.putText(frame,"("+str(x2)+","+str(y2)+")",(x1,y1),font,0.5,(0,255,0),1,cv2.LINE_AA)
    #Se pinta un texto descriptivo del angulo    
    cv2.putText(frame, "Angulo: "+str(angulo),(442,25),font,0.65,(0,255,0),1,cv2.LINE_AA)
    
    cv2.imshow('res',frame)
    k = cv2.waitKey(1)
    if k == 27:
        break

cap.release()
cv2.destroyAllWindows()
