# Asosiy tizimni o'rnatish
FROM ubuntu:latest

# Muhitni sozlash
ENV DEBIAN_FRONTEND=noninteractive

# Kerakli paketlarni o'rnatish (gperf qo'shildi!)
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

# Telegram Bot API'ni yuklash va yig'ish
# Telegram Bot API'ning tayyor versiyasini yuklash va o'rnatish
WORKDIR /app
RUN wget https://github.com/tdlib/telegram-bot-api/releases/download/v6.9.0/telegram-bot-api-linux-amd64 -O telegram-bot-api && \
    chmod +x telegram-bot-api
    

# Portni aniqlash
EXPOSE 8081

# API'ni ishga tushirish
CMD ["telegram-bot-api", "--http-port=8081", "--verbosity=3"]
