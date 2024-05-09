import cv2
import numpy as np
img = cv2.imread('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/limon.jpg')

hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

#Utilizar el programa para elegir valores de binarizacion
lower =  np.array([17,87,68])
upper =  np.array([26,255,255])

mask = cv2.inRange(hsv,lower,upper)
kernel = np.ones((7,7),np.uint8)
erosion = cv2.erode(mask,kernel,iterations=4)
dilatacion = cv2.dilate(erosion,kernel,iterations=4)

x,y,h,w = cv2.boundingRect(dilatacion) 
cv2.rectangle(img,(x,y),(x+w,y+h),(0,255,0),3)
font = cv2.FONT_HERSHEY_COMPLEX
cv2.putText(img,"Limon",(x,y-13),font,0.65,(0,255,0),1,cv2.LINE_AA)
x1 = x + round(w/2)
y1 = y + round(h/2)
cv2.putText(img,"("+str(x1)+","+str(y1)+")",(x1,y1),font,0.5,(0,255,0),1,cv2.LINE_AA)

cv2.imshow('1',img)
cv2.waitKey()
cv2.destroyAllWindows()
