import os
import random
from random import randint
from flask import Flask
app = Flask(__name__)

@app.route("/number-generator")
def number():
	num = randint(100000, 999999)
	return num

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 9000))
    app.run(host='0.0.0.0', port=port)
