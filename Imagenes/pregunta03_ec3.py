import cv2
import numpy as np
cap = cv2.VideoCapture(0)

while True:
    
    ret, frame = cap.read()
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    
    lower =  np.array([21,114,85])
    upper =  np.array([28,255,255])
    mask = cv2.inRange(hsv,lower,upper)
    kernel = np.ones((5,5),np.uint8)
    erosion = cv2.erode(mask,kernel,iterations=1)
    dilatacion = cv2.dilate(erosion,kernel,iterations=1)

    x,y,h,w = cv2.boundingRect(dilatacion) 
    cv2.rectangle(frame,(x,y),(x+w,y+h),(0,255,0),3)
    font = cv2.FONT_HERSHEY_COMPLEX
    cv2.putText(frame,"Rueda",(x,y-13),font,0.65,(0,255,0),1,cv2.LINE_AA)
    x1 = x + round(w/2)
    y1 = y + round(h/2)
    cv2.putText(frame,"("+str(x1)+","+str(y1)+")",(x1,y1),font,0.5,(0,255,0),1,cv2.LINE_AA)
    
    cv2.imshow('res',frame)
    k = cv2.waitKey(1)
    if k == 27:
        break

cap.release()
cv2.destroyAllWindows()
