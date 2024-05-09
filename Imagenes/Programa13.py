import cv2
import numpy as np

img = cv2.imread('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/monedaa.jpg')
rows,cols = img.shape[:2]
M = np.float32([[1,0,0],[0,1,50]]) #Matriz de translacion
res = cv2.warpAffine(img,M,(cols,rows))

cv2.imshow('2',res)

cv2.waitKey()