# 使用基础镜像
FROM ubuntu:latest

# 安装基础依赖
RUN apt-get update && \
    apt-get install -y curl gnupg && \
    apt-get update && \

# 安装 Jupyter Notebook 及依赖
RUN apt-get install -y python3 python3-pip && \
    pip3 install notebook



# 启动 Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
