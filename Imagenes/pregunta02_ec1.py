import cv2 #libreria de imagenes

cap = cv2.VideoCapture("D:/Aldo Pizarro/Personal/CELULAR/2019-03-10/Camera/VID_20210823_114024.mp4") #Archivo Video
cont = 0

while True: #Bucle infinito
    ret, frame = cap.read() #Leer camara
    cv2.imshow('video', frame) #Mostramos camara
    k = cv2.waitKey(1) #Espera 1 seg
    
    if k == 27: #Si tecla 'esc'
        break
    if k == ord('K'): #Si tecla 's'
        cont =cont + 1
        cv2.imwrite("C:/Users/Aldo Pizarro/Desktop/Idat_Clases/cap/cap"+str(cont)+".jpg", frame) #Toma captura
    
cap.release() #Apaga la camara
cv2.destroyAllWindows() #Destruye las ventanas