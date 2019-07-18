import os
import random
from flask import Flask,request
import requests 

app = Flask(__name__)

@app.route("/prize", methods=['GET','POST'])
def prize():
	x = random.randint(1,101)
	#if x <= 50:
	reward = "£50"		
	r = requests.get("http://localhost:9000/notify")

	print(r.text)
	
	payload = request.get_json(force=True)
	print(payload)
	return(payload)
	
	

	
	# requests.post("http://db_connector:9000/account/createAccount", data=data)

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 9000))
    app.run(host='0.0.0.0', port=port)
