import cv2
import numpy as np

img = cv2.imread('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/monedas-ec2.jpg')

hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV) #BGR --> HSV
lower = np.array([0,0,40]) #minimos
upper = np.array([78,255,255]) #maximos
mask = cv2.inRange(hsv,lower,upper)

cv2.imshow('monedas',mask)
cv2.waitKey()
cv2.destroyAllWindows
