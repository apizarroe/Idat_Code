import cv2
import numpy as np
img = cv2.imread('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/chaqueta1.jpg')

def nothing(x):
    pass

cv2.namedWindow('IDAT1')
cv2.createTrackbar('Hmin','IDAT1',0,255,nothing)
cv2.createTrackbar('Hmax','IDAT1',0,255,nothing)
cv2.createTrackbar('Smin','IDAT1',0,255,nothing)
cv2.createTrackbar('Smax','IDAT1',0,255,nothing)
cv2.createTrackbar('Vmin','IDAT1',0,255,nothing)
cv2.createTrackbar('Vmax','IDAT1',0,255,nothing)

while True:
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    
    hMin = cv2.getTrackbarPos('Hmin','IDAT1')
    hMax = cv2.getTrackbarPos('Hmax','IDAT1')
    sMin = cv2.getTrackbarPos('Smin','IDAT1')
    sMax = cv2.getTrackbarPos('Smax','IDAT1')
    vMin = cv2.getTrackbarPos('Vmin','IDAT1')
    vMax = cv2.getTrackbarPos('Vmax','IDAT1')
    
    lower =  np.array([hMin,sMin,vMin])
    upper =  np.array([hMax,sMax,vMax])
    
    mask = cv2.inRange(hsv,lower,upper)
    cv2.imshow('1',mask)
    
    k = cv2.waitKey(1)
    if k == 27:
        break

cv2.destroyAllWindows()
