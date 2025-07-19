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

# Expose port (Render needs this but real port is passed via ENV)
EXPOSE 5000

# Start the app
CMD ["python", "app.py"]
