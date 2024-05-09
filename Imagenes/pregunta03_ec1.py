import cv2

img = cv2.imread('tenista.jpg')
#Con rectangulo
img = cv2.rectangle(img,(216,3),(269,56),(0,0,255),3)
cv2.imshow('linea',img)
#texto(imagen, texto, posicion, tipo de letra, tamaño, color, grosor, modelo)
cv2.waitKey()