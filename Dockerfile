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

# ... (all your existing RUN commands above)

COPY . /app
WORKDIR /app

# Ensure requirements are installed BEFORE copying the app files 
# to optimize the build (caching)
RUN python3 -c "import pyrogram; print('Pyrogram is installed correctly')"

# This is the line that actually runs your bot
CMD ["python3", "-u", "bot.py"]