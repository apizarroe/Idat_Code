import cv2
import numpy as np

img = cv2.imread('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/chaqueta1.jpg')
gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
t,dst = cv2.threshold(gray,200,255,cv2.THRESH_BINARY_INV)

cv2.imshow('3',dst)

cv2.waitKey()
cv2.destroyAllWindows