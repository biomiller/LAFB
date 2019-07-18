import os
import random
from flask import Flask,request
import requests 

app = Flask(__name__)

@app.route("/prize", methods=['GET','POST'])
def prize():
	x = random.randint(1,101)
	if x <= 50:
		reward = "£50"		
		requests.get("http://notification_server:9000/notify") #.content
	
	data = request.get_json(force=True)
	data["prize"] = reward
	
	requests.post("http://db_connector:5001/account/createAccount", data)
	
	return "OK"

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 9000))
    app.run(host='0.0.0.0', port=port)
