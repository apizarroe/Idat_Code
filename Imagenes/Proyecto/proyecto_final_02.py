import cv2
import numpy as np

# Leer el video
cap = cv2.VideoCapture('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/Proyecto/video_trafico_1.mp4')  # Cambia 'video.mp4' por el nombre de tu archivo de video

while cap.isOpened():
    ret, frame = cap.read()
    if not ret:
        break

    # Convertir la imagen a escala de grises
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Aplicar umbralización
    _, thresh = cv2.threshold(gray, 100, 255, cv2.THRESH_BINARY)

    # Aplicar transformaciones morfológicas para eliminar el ruido
    kernel = np.ones((5,5),np.uint8)
    opening = cv2.morphologyEx(thresh, cv2.MORPH_OPEN, kernel)

    # Encontrar contornos de vehículos
    contours, _ = cv2.findContours(opening, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    # Dibujar rectángulos alrededor de los vehículos detectados
    for contour in contours:
        if cv2.contourArea(contour) > 150:  # Ajusta el umbral del área del contorno según sea necesario
            x, y, w, h = cv2.boundingRect(contour)
            cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)

    # Mostrar el fotograma procesado
    cv2.imshow('Traffic Detection', frame)

    # Salir del bucle si se presiona la tecla 'q'
    if cv2.waitKey(25) & 0xFF == ord('q'):
        break

# Liberar la captura de video y cerrar todas las ventanas
cap.release()
cv2.destroyAllWindows()
