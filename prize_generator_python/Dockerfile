# python base image
FROM python

# argument to select the prize generator
# bigReward.py (generous bigger rewards)
# smallReward.py (less generous smaller rewards)
ARG REWARD=bigReward.py

# install flask to the container (flask app)
RUN pip install flask

# copy the specified prize .py file to run the prize generator
COPY "${REWARD}" app.py

# communication over port 9000
EXPOSE 9000

# run the application
ENTRYPOINT ["python", "app.py"]
