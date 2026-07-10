FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN apt-get update && \
    apt-get install -y \
        openssl \
        curl \
        wget \
        libxml2 \
        libxslt1.1 && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
