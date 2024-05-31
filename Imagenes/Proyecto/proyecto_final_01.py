import cv2

# Cargar el clasificador de Haar para detección de carros
car_cascade = cv2.CascadeClassifier('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/Proyecto/haarcascade_car.xml')  # Asegúrate de tener este archivo xml en tu sistema

# Leer la imagen o video
# Para imagen:
# img = cv2.imread('imagen.jpg')

# Para video:
cap = cv2.VideoCapture('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/Proyecto/autos.avi')  # Cambia 'video.mp4' por el nombre de tu archivo de video

# Bucle para procesar cada fotograma
while cap.isOpened():
    ret, frame = cap.read()
    if not ret:
        break

    # Convertir la imagen a escala de grises para mejorar la detección
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Detectar carros en la imagen
    cars = car_cascade.detectMultiScale(gray, 1.1, 3)

    # Dibujar rectángulos alrededor de los carros detectados
    for (x, y, w, h) in cars:
        cv2.rectangle(frame, (x, y), (x+w, y+h), (0, 0, 255), 2)

    # Mostrar la imagen con los carros detectados
    cv2.imshow('Traffic Detection', frame)

    # Salir del bucle si se presiona la tecla 'q'
    if cv2.waitKey(25) & 0xFF == ord('q'):
        break

# Liberar la captura de video y cerrar todas las ventanas
cap.release()
cv2.destroyAllWindows()