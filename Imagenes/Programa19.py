import cv2
import numpy as np

cap = cv2.VideoCapture(0)
while True:
    ret, frame = cap.read()
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV) #BGR --> HSV

    #Manzana Roja
    lower = np.array([30,50,50]) #minimos
    upper = np.array([100,255,255]) #maximos

    mask = cv2.inRange(hsv,lower,upper)
    cv2.imshow('1',mask)
    
    k = cv2.waitKey(1)
    if k == 27:
        break

cap.release()
cv2.destroyAllWindows()