import cv2
import numpy as np
cap = cv2.VideoCapture(0)

def nothing(x):
    pass

cv2.namedWindow('IDAT1')
cv2.createTrackbar('Hmin','IDAT1',0,255,nothing)
cv2.createTrackbar('Hmax','IDAT1',0,255,nothing)
cv2.createTrackbar('Smin','IDAT1',0,255,nothing)
cv2.createTrackbar('Smax','IDAT1',0,255,nothing)
cv2.createTrackbar('Vmin','IDAT1',0,255,nothing)
cv2.createTrackbar('Vmax','IDAT1',0,255,nothing)

while True:
    
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
    #Dibuja de manera imaginaria un rectangulo al rededor de un objeto,
    #Devuelve las cordenada de inicio, tambien el ancho y altura
    x,y,h,w = cv2.boundingRect(dilatacion) 
    #Dibujamos un rectangulo, verde de ancho 3 pixeles
    cv2.rectangle(frame,(x,y),(x+w,y+h),(0,255,0),3)
    #Dibujamos un texto descriptivo al costado del objeto
    font = cv2.FONT_HERSHEY_COMPLEX
    cv2.putText(frame,"Rueda",(x,y-13),font,0.65,(0,255,0),1,cv2.LINE_AA)
    #Se calcula el centor del objeto
    x1 = x + round(w/2)
    y1 = y + round(h/2)
    #Se coloca el texto con el calculo de coordenadas del centro del objeto
    cv2.putText(frame,"("+str(x1)+","+str(y1)+")",(x1,y1),font,0.5,(0,255,0),1,cv2.LINE_AA)
    
    #Se muestra todo sobre la captura de la camara
    cv2.imshow('res',frame)
    k = cv2.waitKey(1)
    if k == 27:
        break

cap.release()
cv2.destroyAllWindows()
