import cv2

cap =  cv2.VideoCapture(0)

ret, frame = cap.read()
rows, cols = frame.shape[:2]
print(cols, rows)

cap.release()
