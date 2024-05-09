import cv2
import numpy as np

moneda = 0.0

img = cv2.imread('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/moneda3.jpg')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
t,dst = cv2.threshold(gray,143,255,cv2.THRESH_BINARY)

kernel = np.ones((3,3),np.uint8)
erosion = cv2.erode(dst,kernel,iterations=1)
dilatacion = cv2.erode(erosion,kernel,iterations=1)

contours,_ = cv2.findContours(dilatacion,cv2.RETR_TREE,cv2.CHAIN_APPROX_SIMPLE)

for c in contours:
    area = cv2.contourArea(c)
    print(area)
    if area > 5000:
        cv2.drawContours(img, [c], 0, (0,255,0), 2, cv2.LINE_AA)
        if area <= 10000:
            moneda =  moneda + 0.1
        if area > 10000 and area <= 11500:
            moneda =  moneda + 0.2
        if area > 11500 and area <= 13000:
            moneda =  moneda + 5.0
        if area > 13000:
            moneda =  moneda + 1.0
            
font = cv2.FONT_HERSHEY_COMPLEX
cv2.putText(img,"Valor: "+str(round(moneda,2)),(621,23),font,0.8,(0,255,0),2,cv2.LINE_AA)
cv2.imshow('1',img)
cv2.waitKey()