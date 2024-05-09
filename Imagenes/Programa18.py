import cv2
import numpy as np

img = cv2.imread('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/fruta.jpg')
hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV) #BGR --> HSV

#Manzana Verde
#lower = np.array([30,50,100]) #minimos
#upper = np.array([60,255,255]) #maximos

#Manzana Roja
lower = np.array([150,50,70]) #minimos
upper = np.array([180,255,255]) #maximos

mask = cv2.inRange(hsv,lower,upper)
cv2.imshow('1',mask)
cv2.waitKey()
