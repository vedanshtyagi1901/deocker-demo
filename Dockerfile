FROM python:3.10-slim

# Install tesseract OCR and dependencies
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && apt-get clean

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 5000

# Run app
CMD ["python", "app.py"]
