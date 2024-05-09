import cv2
import numpy as np

img = cv2.imread('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/nadal.png')
hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV) #BGR --> HSV

lower = np.array([25,50,50]) #minimos
upper = np.array([67,255,255]) #maximos

mask = cv2.inRange(hsv,lower,upper)
cv2.imshow('1',mask)
cv2.waitKey()
