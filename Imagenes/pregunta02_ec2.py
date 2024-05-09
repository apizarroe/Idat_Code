import cv2
import numpy as np

img = cv2.imread('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/tenista-ec2.jpg')

hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV) #BGR --> HSV
lower = np.array([23,45,59]) #minimos
upper = np.array([56,255,255]) #maximos
mask = cv2.inRange(hsv,lower,upper)
img3 = cv2.bitwise_and(img, img, mask=mask)

cv2.imshow('tenis',img3)
cv2.waitKey()
cv2.destroyAllWindows
