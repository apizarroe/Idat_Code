import cv2
import numpy as np

img = cv2.imread('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/limon-ec2.jpg')

hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV) #BGR --> HSV
lower = np.array([16,94,134]) #minimos
upper = np.array([25,255,255]) #maximos
mask = cv2.inRange(hsv,lower,upper)
img3 = cv2.bitwise_and(img, img, mask=mask)

cv2.imshow('1',img3)
cv2.waitKey()
cv2.destroyAllWindows
