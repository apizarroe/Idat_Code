import cv2
import numpy as np
img = cv2.imread('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/fruta.jpg')

hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

#Utilizar el programa para elegir valores de binarizacion
lower =  np.array([142,50,76])
upper =  np.array([179,255,255])

mask = cv2.inRange(hsv,lower,upper)
kernel = np.ones((7,7),np.uint8)
dilatacion = cv2.dilate(mask,kernel,iterations=5)
erosion = cv2.erode(dilatacion,kernel,iterations=5)
cv2.imshow('1',dilatacion)

cv2.waitKey()

cv2.destroyAllWindows()
