import cv2
import numpy as np
import imutils

cap = cv2.VideoCapture('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/Proyecto/autos.mp4')

fgbg = cv2.bgsegm.createBackgroundSubtractorMOG()
kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (1, 1))
car_counter_1 = 0
car_counter_2 = 0
car_counter_3 = 0
car_counter_4 = 0
car_counter_5 = 0
car_counter_6 = 0
car_counter_7 = 0

while True:

    ret, frame = cap.read()
    if ret == False: break
    frame = imutils.resize(frame, width=640)

    # Especificamos los puntos extremos del área a analizar
    area_pts6 = np.array([[80, 10], [310, 10], [310, 56], [80, 56]])
    area_pts3 = np.array([[340, 60], [570, 60], [570, 106], [340, 106]])
    area_pts4 = np.array([[80, 112], [310, 112], [310, 158], [80, 158]])
    area_pts1 = np.array([[340, 164], [570, 164], [570, 213], [340, 213]])
    area_pts2 = np.array([[80, 219], [310, 219], [310, 262], [80, 262]])
    area_pts5 = np.array([[340, 268], [570, 268], [570, 319], [340, 319]])
    area_pts7 = np.array([[80, 325], [310, 325], [310, 357], [80, 357]])
    
    
    # Con ayuda de una imagen auxiliar, determinamos el área
    # sobre la cual actuará el detector de movimiento
    imAux = np.zeros(shape=(frame.shape[:2]), dtype=np.uint8)
    imAux = cv2.drawContours(imAux, [area_pts1,area_pts2,area_pts3,area_pts4,area_pts5,area_pts6,area_pts7], -1, (255), -1)
    image_area = cv2.bitwise_and(frame, frame, mask=imAux)    
    
    # Obtendremos la imagen binaria donde la región en blanco representa
    # la existencia de movimiento
    fgmask = fgbg.apply(image_area)
    fgmask = cv2.morphologyEx(fgmask, cv2.MORPH_OPEN, kernel)
    fgmask = cv2.morphologyEx(fgmask, cv2.MORPH_CLOSE, kernel)
    fgmask = cv2.dilate(fgmask, None, iterations=5)
    
    # Encontramos los contornos presentes de fgmask, para luego basándonos
    # en su área poder determinar si existe movimiento (autos)
    cnts = cv2.findContours(fgmask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)[0]
        
    for cnt in cnts:
        if cv2.contourArea(cnt) > 1500:
            x, y, w, h = cv2.boundingRect(cnt)
            cv2.rectangle(frame, (x,y), (x+w,y+h), (0,255,255), 1)
            
            if 190 < (x + w) < 210:
                if 0 < y <= 42:
                    car_counter_6 = car_counter_6 + 1
                    cv2.line(frame, (210, 0), (210, 57), (0, 255, 0), 3)

            if 450 < (x + w) < 470:
                if 42 < y <= 94:
                    car_counter_3 = car_counter_3 + 1
                    cv2.line(frame, (460, 57), (460, 109), (0, 255, 0), 3)
                
            if 190 < (x + w) < 210:
                if 94 < y <= 146:
                    car_counter_4 = car_counter_4 + 1
                    cv2.line(frame, (210, 109), (210, 161), (0, 255, 0), 3)
            
            # Si el auto ha cruzado entre 450 y 470 abierto, se incrementará
            # en 1 el contador de autos
            if 450 < (x + w) < 470:
                if 146 < y <= 201:
                    car_counter_1 = car_counter_1 + 1
                    cv2.line(frame, (460, 161), (460, 216), (0, 255, 0), 3)
                
            if 190 < (x + w) < 210:
                if 201 < y <= 250:
                    car_counter_2 = car_counter_2 + 1
                    cv2.line(frame, (210, 216), (210, 265), (0, 255, 0), 3)
            
            if 450 < (x + w) < 470:
                if 250 < y <= 306:
                    car_counter_5 = car_counter_5 + 1
                    cv2.line(frame, (460, 265), (460, 321), (0, 255, 0), 3)
                    
        if cv2.contourArea(cnt) > 1000:
            
            x, y, w, h = cv2.boundingRect(cnt)
            cv2.rectangle(frame, (x,y), (x+w,y+h), (0,255,255), 1)
            
            if 190 < (x + w) < 210:
                if 306 < y <= 357:
                    car_counter_7 = car_counter_7 + 1
                    cv2.line(frame, (210, 321), (210, 357), (0, 255, 0), 3)
        
    # Visualización del conteo de autos
    cv2.drawContours(frame, [area_pts1], -1, (255, 0, 255), 2)
    cv2.drawContours(frame, [area_pts2], -1, (255, 0, 255), 2)
    cv2.drawContours(frame, [area_pts3], -1, (255, 0, 255), 2)
    cv2.drawContours(frame, [area_pts4], -1, (255, 0, 255), 2)
    cv2.drawContours(frame, [area_pts5], -1, (255, 0, 255), 2)
    cv2.drawContours(frame, [area_pts6], -1, (255, 0, 255), 2)
    cv2.drawContours(frame, [area_pts7], -1, (255, 0, 255), 2)
    
    cv2.line(frame, (210, 0), (210, 57), (0, 255, 255), 1)
    cv2.line(frame, (460, 57), (460, 109), (0, 255, 255), 1)
    cv2.line(frame, (210, 109), (210, 161), (0, 255, 255), 1) #Rectangulo
    cv2.line(frame, (460, 161), (460, 216), (0, 255, 255), 1)
    cv2.line(frame, (210, 216), (210, 265), (0, 255, 255), 1)
    cv2.line(frame, (460, 265), (460, 321), (0, 255, 255), 1)
    cv2.line(frame, (210, 321), (210, 357), (0, 255, 255), 1)
    
    cv2.rectangle(frame, (frame.shape[1]-50, 0), (frame.shape[1]-5, 54), (0, 255, 0), 2)
    cv2.rectangle(frame, (frame.shape[1]-50, 54), (frame.shape[1]-5, 109), (0, 255, 0), 2)
    cv2.rectangle(frame, (frame.shape[1]-50, 109), (frame.shape[1]-5, 161), (0, 255, 0), 2)
    cv2.rectangle(frame, (frame.shape[1]-50, 161), (frame.shape[1]-5, 216), (0, 255, 0), 2)  # Nuevo rectángulo
    cv2.rectangle(frame, (frame.shape[1]-50, 216), (frame.shape[1]-5, 265), (0, 255, 0), 2)
    cv2.rectangle(frame, (frame.shape[1]-50, 265), (frame.shape[1]-5, 321), (0, 255, 0), 2)
    cv2.rectangle(frame, (frame.shape[1]-50, 321), (frame.shape[1]-5, 357), (0, 255, 0), 2)
    
    cv2.putText(frame, str(car_counter_6), (frame.shape[1]-40, 30),cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0,255,0), 2)
    cv2.putText(frame, str(car_counter_3), (frame.shape[1]-40, 85),cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0,255,0), 2)
    cv2.putText(frame, str(car_counter_4), (frame.shape[1]-40, 140),cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0,255,0), 2)
    cv2.putText(frame, str(car_counter_1), (frame.shape[1]-40, 195),cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0,255,0), 2)
    cv2.putText(frame, str(car_counter_2), (frame.shape[1]-40, 250),cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0,255,0), 2)
    cv2.putText(frame, str(car_counter_5), (frame.shape[1]-40, 305),cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0,255,0), 2)
    cv2.putText(frame, str(car_counter_7), (frame.shape[1]-40, 350),cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0,255,0), 2)
        
    cv2.imshow('frame', frame)

    # Esperar 1 milisegundo entre cuadros
    k = cv2.waitKey(1)
    if k == 27:  # 27 es el ascii para esc
        break

cap.release()
cv2.destroyAllWindows()