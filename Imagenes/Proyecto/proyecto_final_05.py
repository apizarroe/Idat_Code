import cv2
import numpy as np

cap = cv2.VideoCapture('C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloV/ProcesamientoImg/Proyecto/autos.mp4')

fgbg = cv2.bgsegm.createBackgroundSubtractorMOG()
kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (3, 3))
car_counter_1 = 0
car_counter_2 = 0

# Definir las líneas y áreas de interés
lines = [{'start': (460, 162), 'end': (460, 215), 'counter': 'car_counter_1'},
         {'start': (190, 216), 'end': (190, 271), 'counter': 'car_counter_2'}]

while True:
    ret, frame = cap.read()
    if not ret:
        break

    frame = cv2.resize(frame, (640, frame.shape[0] * 640 // frame.shape[1]))

    fgmask = fgbg.apply(frame)
    fgmask = cv2.morphologyEx(fgmask, cv2.MORPH_OPEN, kernel)
    fgmask = cv2.dilate(fgmask, None, iterations=5)

    contours, _ = cv2.findContours(fgmask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    for cnt in contours:
        if cv2.contourArea(cnt) > 1500:
            x, y, w, h = cv2.boundingRect(cnt)
            cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 255), 1)
            for line in lines:
                if line['start'][0] < x + w < line['end'][0]:
                    exec(line['counter'] + ' += 1')
                    cv2.line(frame, line['start'], line['end'], (0, 255, 0), 3)

    for line in lines:
        cv2.line(frame, line['start'], line['end'], (0, 255, 255), 1)
        cv2.rectangle(frame, (frame.shape[1] - 70, line['start'][1]), (frame.shape[1] - 5, line['end'][1]), (0, 255, 0), 2)
        cv2.putText(frame, str(eval(line['counter'])), (frame.shape[1] - 55, (line['start'][1] + line['end'][1]) // 2),
                    cv2.FONT_HERSHEY_SIMPLEX, 1.2, (0, 255, 0), 2)

    cv2.imshow('frame', frame)

    k = cv2.waitKey(1)
    if k == 27:
        break

cap.release()
cv2.destroyAllWindows()
