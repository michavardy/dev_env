# base image
FROM ubuntu:20.04 

# update apt
RUN apt-get update

# install python
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y

# install vim
RUN apt-get install vim -y

# set the working directory in the container
WORKDIR /home/michav/dev

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip3 install -r requirements.txt

COPY . . 

# run init.py
RUN python3 init.py

# command to run on container start
CMD [ "/bin/bash"]