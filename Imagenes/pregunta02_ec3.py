import cv2
import numpy as np

img = cv2.imread('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/monedas-ec2.jpg')

rows,cols = img.shape[:2]
M = np.float32([[1,0,0],[0,1,50]]) #Matriz de translacion
res = cv2.warpAffine(img,M,(cols,rows))
M = np.float32([[1,0,0],[0,1,-50]])
res1 = cv2.warpAffine(res,M,(cols,rows))

gray = cv2.cvtColor(res1, cv2.COLOR_BGR2GRAY)
t,dst = cv2.threshold(gray,110,255,cv2.THRESH_BINARY)

kernel = np.ones((5,5),np.uint8)
erosion = cv2.erode(dst,kernel,iterations=1)
dilatacion = cv2.dilate(erosion,kernel,iterations=1)


cv2.imshow('3',dilatacion)

cv2.waitKey()
cv2.destroyAllWindows