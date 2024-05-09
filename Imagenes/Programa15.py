import cv2

cap = cv2.VideoCapture(0)

while True: #Bucle infinito
    ret, frame = cap.read() #Leer camara
    rows,cols = frame.shape[:2]
    
    frame = cv2.cvtColor(frame,cv2.COLOR_BGR2GRAY)
    t,dst = cv2.threshold(frame,130,255,cv2.THRESH_BINARY_INV)
    
    cv2.imshow('1', dst) #Mostramos camara
    k = cv2.waitKey(1) #Espera 1 seg
    
    if k == 27: #Si tecla 'esc'
        break
    
cv2.destroyAllWindows() #Destruye las ventanas