import cv2
import numpy as np

x = eval(input("Ingrese el valor de X: "))
y = eval(input("Ingrese el valor de Y: "))
x1 = eval(input("Ingrese el valor de X1: "))
y1 = eval(input("Ingrese el valor de Y1: "))

img = np.zeros((512,512,3),np.uint8) 
img1 = cv2.line(img,(x,y),(x1,y1),(255,0,0),3) 

font = cv2.FONT_HERSHEY_SIMPLEX
cv2.putText(img1, "(X:"+str(x)+", Y:"+str(y)+")",(x,y-10),font,0.5,(0,0,255),1,cv2.LINE_AA)
cv2.putText(img1, "(X1:"+str(x1)+", Y1:"+str(y1)+")",(x1,y1+20),font,0.5,(0,0,255),1,cv2.LINE_AA)

cv2.imshow('linea',img1)
#Para la version python que uso me obliga a usar esta función
cv2.waitKey() 
