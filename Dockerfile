# Asosiy tizimni o'rnatish
FROM ubuntu:latest

# Muhitni sozlash
ENV DEBIAN_FRONTEND=noninteractive

# Kerakli paketlarni o'rnatish
RUN apt-get update && \
    apt-get install -y \
    git \
    cmake \
    g++ \
    wget \
    curl \
    openssl \
    zlib1g-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libsqlite3-dev \
    gperf && \
    rm -rf /var/lib/apt/lists/*

# Ishonchlilik uchun git HTTPS-ni majburlash
RUN git config --global http.sslVerify false

# Telegram Bot API'ni yuklash va yig'ish (so‘nggi barqaror versiya)
WORKDIR /app
RUN git clone --recursive -b v6.9.1 https://github.com/tdlib/telegram-bot-api.git && \
    cd telegram-bot-api && \
    mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . --parallel 4 && \
    cmake --install .

# Portni aniqlash
EXPOSE 8081

# API'ni ishga tushirish
CMD ["telegram-bot-api", "--http-port=8081", "--max-upload-size=209715200", "--verbosity=3"]
