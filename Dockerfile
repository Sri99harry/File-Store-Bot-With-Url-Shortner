FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    locales build-essential curl git gnupg2 wget busybox python3-lxml pv \
    && apt-get autoclean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy ONLY requirements first to use Docker caching
COPY requirements.txt .

# Install dependencies (THIS IS WHERE IT WAS FAILING BEFORE)
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Now copy the rest of your app code
COPY . .

# Run the bot
CMD ["python3", "-u", "bot.py"]