FROM python:3.12-bookworm

# Install system packages
RUN apt-get update && apt-get install -y \
    git \
    wget \
    curl \
    unzip \
    ffmpeg \
    aria2 \
    mediainfo \
    poppler-utils \
    libssl-dev \
    python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Start Bot
CMD ["python3", "main.py"]
