# python base image
FROM python 

# argument to change implementation of text_generator
# 2char.py (2 char String of uppercase letters)
# 3char.py (3 char String of lowercase letters)
ARG APP_VERSION=3char.py

# install flask to the container (flask app)
RUN pip install flask
 
# copy the specified python file to run the text generator
COPY "${APP_VERSION}" app.py 

# communication over port 9000
EXPOSE 9000

# run the application
ENTRYPOINT ["python", "app.py"]
