import cv2
import numpy as np

cap = cv2.VideoCapture('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/aeropuerto.mp4')
fgbg = cv2.bgsegm.createBackgroundSubtractorMOG()
color = (0,255,0)

while True:
    ret,frame = cap.read()
    rows,cols = frame.shape[:2]
    frame = cv2.resize(frame, None, fx=0.5, fy=0.4, interpolation=cv2.INTER_CUBIC)
    area_pts = np.array([[340,320],[600,320],[850,frame.shape[0]],[140,frame.shape[0]]])
    frame = cv2.drawContours(frame,[area_pts],-1,color,3)
    color = (0,255,0)
    imAux = np.zeros(shape=(frame.shape[:2]),dtype=np.uint8)
    imAux = cv2.drawContours(imAux,[area_pts],-1,(255,255,255),-1)
    gray = cv2.cvtColor(frame,cv2.COLOR_BGR2GRAY)
    imAux = cv2.bitwise_and(gray,gray,mask=imAux)
    imAux = fgbg.apply(imAux)
    kernel = np.ones((5,5),np.uint8)
    erosion = cv2.erode(imAux,kernel,iterations=1)
    dilatacion = cv2.dilate(erosion,kernel,iterations=2)
    cnts,_ = cv2.findContours(dilatacion,cv2.RETR_EXTERNAL,cv2.CHAIN_APPROX_SIMPLE)
    for cnt in cnts:
        if cv2.contourArea(cnt)>500:
            x,y,w,h = cv2.boundingRect(cnt)
            cv2.rectangle(frame,(x,y),(x+w,y+h),(0,255,0),2)
            color = (0,0,255)
    cv2.imshow('1',frame)
    k = cv2.waitKey(1)
    if k == 27:
        break
cv2.destroyAllWindows()