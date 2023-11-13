# import cv2
# from cv2 import INTER_AREA

# capture = cv2.VideoCapture(0)


# def rescale(frame,scale=0.5):
#     width = int(frame.shape[1]*scale)
#     height = int(frame.shape[0]*scale)
#     dimension = (width,height)
#     return cv2.resize(frame,dimension,interpolation=INTER_AREA)


# while(True):
#     isTrue, frame = capture.read()
#     frame_resize = rescale(frame)
#     cv2.imshow('Stream Resized', frame_resize)



#     if cv2.waitKey(1) == ord("q"):
#         break

# capture.release()



# script.py
def greet(name):
    print(f"Hello, {name}!")
