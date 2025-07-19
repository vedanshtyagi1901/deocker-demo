from flask import Flask
import pytesseract
from PIL import Image
import os

app = Flask(__name__)

@app.route("/")
def read_image():
    try:
        img_path = "data/image.png"
        img = Image.open(img_path)
        text = pytesseract.image_to_string(img)
        return f"<h2>Extracted Text:</h2><pre>{text}</pre>"
    except Exception as e:
        return f"Error reading image: {e}"

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))  # Use Render's port
    app.run(host="0.0.0.0", port=port)
