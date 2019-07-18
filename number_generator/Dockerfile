# python base image
FROM python 

ARG APP_VERSION=6digit.py

# install flask to the container (flask app)
RUN pip install flask
 
# copy the specified python file to run the number generator
COPY "${APP_VERSION}" app.py 

# communication over port 9000
EXPOSE 9000

# run the application
ENTRYPOINT ["python", "app.py"]
