# ベースイメージの指定
FROM nvidia/cudagl:11.1.1-devel-ubuntu20.04

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    git \
    curl \
    python3 \
    python3-pip

# 必要なPythonライブラリのインストール
RUN pip3 install jupyter

RUN pip3 install torch==1.10.1+cu111 torchvision==0.11.2+cu111 torchaudio==0.10.1 -f https://download.pytorch.org/whl/cu111/torch_stable.html

# Jupyter Notebookの設定
RUN jupyter notebook --generate-config --allow-root

# ポートの設定
EXPOSE 5656
WORKDIR /root/workspace/

# コンテナの起動時に実行するコマンド
CMD ["bin/bash"]
