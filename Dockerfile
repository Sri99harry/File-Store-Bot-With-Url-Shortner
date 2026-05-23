# Don't Remove Credit Tg - @VJ_Bots
# Subscribe YouTube Channel For Amazing Bot @Tech_VJ
# Ask Doubt on telegram @KingVJ01

FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    locales \
    build-essential \
    curl \
    git \
    gnupg2 \
    wget \
    busybox \
    python3-lxml \
    pv \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN dpkg-reconfigure locales
RUN pip install --no-cache-dir setuptools wheel yarl multidict
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . /app
WORKDIR /app

CMD ["python3", "bot.py"]
