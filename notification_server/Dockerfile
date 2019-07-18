# python base image
FROM python:alpine

# install flask to the container (flask app)
RUN pip install flask

# copy the required files to run the notification server
COPY app.py /app.py
COPY prizes.txt /prizes.txt

# communication over port 9000
EXPOSE 9000

# run the application
ENTRYPOINT ["python", "app.py"]
