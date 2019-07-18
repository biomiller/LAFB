import os
import random
from flask import Flask
app = Flask(__name__)

@app.route("/prize")
def prize():
	x = random.randint(1,101)
	if x <= 50:
		return("£0")
	else:
		return("£50")
	
	
if __name__ == "__main__":
    port = int(os.environ.get("PORT", 9000))
    app.run(host='0.0.0.0', port=port)
