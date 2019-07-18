import os
import string
import random
from flask import Flask
app = Flask(__name__)

@app.route("/text_generator")
def chars():
    text = "".join(random.sample(string.ascii_uppercase,2))
    return text

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 9000))
    app.run(host='0.0.0.0', port=port)
