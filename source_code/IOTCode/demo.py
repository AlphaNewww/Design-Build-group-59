from ultralytics import YOLO
#from ultralytics.yolo.utils.benchmarks import benchmark
#import cv2

# Load a model
#model = YOLO("yolov8n.yaml")  # build a new model from scratch
model = YOLO("F:\PyCode\DaB\last2.0.pt")  # load a pretrained model (recommended for training)
#内部为最新模型路径，模型在文件夹内，是.pt文件

# Use the model
# model.train(data="coco128.yaml", epochs=3,workers=0)  # train the model,workers=0 if windows
# metrics = model.val()  # evaluate model performance on the validation set

#results = model("bus.jpg")  # predict on an image
#print(results)

img_path = "E:\AiTraining\Cartest"
#内部为要预测的图片路径
# results = model.predict(img_path,save=True,conf=0.5) # device=0 by default, conf:置信度阈值
results = model.predict(img_path,save=True,save_txt=True,classes=[0,1,2],conf=0.6) # i.e. classes=0,classes=[0,3,4]

