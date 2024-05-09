import cv2
import numpy as np

img = cv2.imread('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/chaqueta.jpg')
gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
#t,dst = cv2.threshold(gray,60,255,cv2.THRESH_BINARY) #binarizacion directa
t,dst = cv2.threshold(gray,0,255,cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU) #binarizacion inversa

t,dst = cv2.threshold(gray,70,255,cv2.THRESH_BINARY_INV)

cv2.imshow('1',img)
cv2.imshow('3',dst)
print(t)
cv2.waitKey()