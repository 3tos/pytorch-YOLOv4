FROM python:3.7
COPY ./requirements.txt /home
WORKDIR /home

RUN apt-get update &&  apt-get install -y libgl1-mesa-dev
RUN pip install -r requirements.txt