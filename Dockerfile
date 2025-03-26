FROM ubuntu:latest

RUN apt-get update && apt-get install -y git cmake g++ build-essential

# Telegram Bot API'ni yuklash va yig'ish
RUN git clone https://github.com/tdlib/telegram-bot-api.git && \
    cd telegram-bot-api && \
    mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . --parallel 4
