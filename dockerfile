# 使用基础镜像
FROM ubuntu:latest

# 安装基础依赖
RUN apt-get update && \
    apt-get install -y curl gnupg && \
    curl -fsSL https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb -o erlang-solutions.deb && \
    dpkg -i erlang-solutions.deb && \
    apt-get update && \
    apt-get install -y esl-erlang

# 安装 Jupyter Notebook 及依赖
RUN apt-get install -y python3 python3-pip && \
    pip3 install notebook

# 安装 erlang-jupyter 内核
RUN git clone https://github.com/robbielynch/ierlang.git && \
    cd ierl && \
    make && \
    make install

# 启动 Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
