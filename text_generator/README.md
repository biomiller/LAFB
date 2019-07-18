# Text Generator

### Implementations
* **2char.py** generates a 3 char String of lowercase letters.
* **3char.py** generates a 2 char String of uppercase letters.

_Default = 3char.py_

### Building the image

Use one of the following commands to build the docker image:

`docker build --tag text --no-cache --build-arg APP_VERSION=2char.py .`

`docker build --tag text --no-cache --build-arg APP_VERSION=3char.py .`

### DockerHub images

The images can found in their DockerHub [repository](https://cloud.docker.com/u/teamdeadweight/repository/docker/teamdeadweight/text_generator).
