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
    zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

# Telegram Bot API'ni yuklash va yig'ish
WORKDIR /app
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git && \
    cd telegram-bot-api && \
    mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . --parallel 1 && \
    cmake --install .

# Portni aniqlash
EXPOSE 8081

# API'ni ishga tushirish
CMD ["telegram-bot-api", "--http-port=8081", "--verbosity=3"]
