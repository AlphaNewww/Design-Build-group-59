import tkinter as tk
from tkinter import ttk
from PIL import Image, ImageTk
import os


class YOLOv8ImageRecognitionApp:
    def __init__(self, root):
        self.root = root
        self.root.title("YOLOv8 Image Recognition")

        # 初始化文件夹A和文件夹B的图片列表和索引
        self.folder_a_images = [os.path.join("E:\\AiTraining\\Cartest", file) for file in os.listdir("E:\\AiTraining\\Cartest")]
        self.folder_b_images = [os.path.join("F:\\PyProgram\\envs\\yoloV8\\runs\\detect\\predict4", file) for file in os.listdir("F:\\PyProgram\\envs\\yoloV8\\runs\\detect\\predict4")]
        self.current_index = 0

        # 创建左侧和右侧的Frame
        left_frame = ttk.Frame(self.root)
        left_frame.pack(side=tk.LEFT, padx=10, pady=10)
        right_frame = ttk.Frame(self.root)
        right_frame.pack(side=tk.RIGHT, padx=10, pady=10)

        # 创建左侧和右侧的标签
        self.original_label = ttk.Label(left_frame, text="Original", font=("Helvetica", 16))
        self.original_label.pack(side=tk.TOP, pady=10)
        self.recognized_label = ttk.Label(right_frame, text="Recognized", font=("Helvetica", 16))
        self.recognized_label.pack(side=tk.TOP, pady=10)

        # 创建左侧和右侧的图片显示区域
        self.left_image_label = ttk.Label(left_frame)
        self.left_image_label.pack()
        self.right_image_label = ttk.Label(right_frame)
        self.right_image_label.pack()

        # 创建左侧和右侧的Previous和Next按钮
        self.prev_button = ttk.Button(left_frame, text="Previous", command=self.show_previous_image)
        self.prev_button.pack(side=tk.BOTTOM, pady=10)
        self.next_button = ttk.Button(right_frame, text="Next", command=self.show_next_image)
        self.next_button.pack(side=tk.BOTTOM, pady=10)

        # 初始显示图片
        self.show_images()

    def show_images(self):
        if self.folder_a_images and self.folder_b_images:
            left_image_path = self.folder_a_images[self.current_index]
            right_image_path = self.folder_b_images[self.current_index]

            left_image = Image.open(left_image_path)
            right_image = Image.open(right_image_path)

            left_image = left_image.resize((300, 300), Image.ANTIALIAS)
            right_image = right_image.resize((300, 300), Image.ANTIALIAS)

            left_photo = ImageTk.PhotoImage(left_image)
            right_photo = ImageTk.PhotoImage(right_image)

            self.left_image_label.config(image=left_photo)
            self.left_image_label.image = left_photo
            self.right_image_label.config(image=right_photo)
            self.right_image_label.image = right_photo

    def show_previous_image(self):
        if self.folder_a_images and self.folder_b_images:
            self.current_index = max(0, self.current_index - 1)
            self.show_images()

    def show_next_image(self):
        if self.folder_a_images and self.folder_b_images:
            self.current_index = min(len(self.folder_a_images) - 1, self.current_index + 1)
            self.show_images()


if __name__ == "__main__":
    root = tk.Tk()
    app = YOLOv8ImageRecognitionApp(root)
    root.mainloop()
