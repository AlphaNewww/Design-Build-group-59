import requests
import shutil
import time

# 定义图片 URL
image_url = "http://192.168.8.1:8083/?action=snapshot"

# 指定保存文件夹和文件名前缀
save_folder = "F:\\PyProgram\\envs\\yoloV8\\images\\"
file_prefix = "snapshot"

# 设置爬取次数
num_iterations = 1000

# 循环多次执行爬取和保存
for i in range(num_iterations):
    # 发送 GET 请求获取图像数据
    response = requests.get(image_url, stream=True)

    # 检查响应状态码，200 表示请求成功
    if response.status_code == 200:
        # 构建文件名，加上迭代次数作为后缀
        file_name = f"{file_prefix}_{i}.jpg"

        # 打开本地文件，以二进制写入模式保存图像
        with open(save_folder + file_name, "wb") as image_file:
            # 将响应内容写入文件
            shutil.copyfileobj(response.raw, image_file)
        print(f"图像 {file_name} 保存成功")

    else:
        print(f"第 {i+1} 次请求失败，状态码:", response.status_code)

    # 休眠一段时间，可以根据需要调整间隔时间（秒）
    time.sleep(0.01)
