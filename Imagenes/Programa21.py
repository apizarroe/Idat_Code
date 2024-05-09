import cv2
import numpy as np

img = cv2.imread('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/pelota1.jpg')
kernel = np.ones((7,7),np.uint8)
erosion = cv2.erode(img,kernel,iterations=1)

cv2.imshow('1',img)
cv2.imshow('2',erosion)
cv2.waitKey()
