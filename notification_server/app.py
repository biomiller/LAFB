import os
import datetime
from flask import Flask
app = Flask(__name__)

@app.route("/notify")
def notify():
    now = datetime.datetime.now()
    outF = open("prizes.txt", "a")
    outF.write("A prize of has been issued at : " + str(now))
    outF.write("\n")
    return "A Notification has been sent to management"

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 9000))
    app.run(host='0.0.0.0', port=port)
