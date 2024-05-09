import cv2
import numpy as np

img = np.zeros((313,417,3),np.uint8)
img = cv2.circle(img,(330,175),180,(255,255,255),-1)
img2 = cv2.imread('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/pelota-ec2.jpg')
#cv2.imshow('1',img2)
#cv2.imshow('platilla',img)

img3 = cv2.bitwise_and(img,img2)
cv2.imshow('resultado',img3)
k = cv2.waitKey()

cv2.destroyAllWindows