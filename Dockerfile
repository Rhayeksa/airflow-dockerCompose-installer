FROM apache/airflow:3.0.4
# FROM apache/airflow:slim-3.0.4-python3.12

# Switch ke root untuk install dependencies
USER root

# Install system packages
RUN apt update && \
    apt install tesseract-ocr tesseract-ocr-ind -y

# Switch kembali ke airflow user
USER airflow

# Copy requirements.txt jika ada
COPY requirements.txt /requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r /requirements.txt
