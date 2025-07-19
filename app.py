from flask import Flask, send_file
import pytesseract
from PIL import Image

app = Flask(__name__)

@app.route("/")
def read_image():
    img_path = "data/image.png"
    img = Image.open(img_path)
    text = pytesseract.image_to_string(img)
    return f"<h2>Extracted Text:</h2><pre>{text}</pre>"
    return f"Hellow world"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
