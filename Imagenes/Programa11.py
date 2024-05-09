import cv2

cap = cv2.VideoCapture("C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/VID_20160617_211751985.mp4") #Archivo Video

while True: #Bucle infinito
    ret, frame = cap.read() #Leer camara
    rows,cols = frame.shape[:2]
    
    frame = cv2.resize(frame,None,fx=0.5,fy=0.4,
                       interpolation=cv2.INTER_CUBIC)
    
    cv2.imshow('1', frame) #Mostramos camara
    k = cv2.waitKey(1) #Espera 1 seg
    
    if k == 27: #Si tecla 'esc'
        break
    
cv2.destroyAllWindows() #Destruye las ventanas