import cv2
import numpy as np
img = cv2.imread('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/limon.jpg')

hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

#Utilizar el programa para elegir valores de binarizacion
lower =  np.array([17,87,68])
upper =  np.array([26,255,255])

mask = cv2.inRange(hsv,lower,upper)
kernel = np.ones((7,7),np.uint8)
erosion = cv2.erode(mask,kernel,iterations=3)
dilatacion = cv2.dilate(erosion,kernel,iterations=3)
cv2.imshow('1',dilatacion)

cv2.waitKey()

cv2.destroyAllWindows()
