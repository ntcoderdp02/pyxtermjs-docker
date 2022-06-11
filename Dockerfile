#Create a ubuntu base image with python 3 installed.
FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
RUN pip3 install pyxtermjs uwsgi gevent gevent-websocket
ADD pyxtermjs.ini entry.py /
WORKDIR /
EXPOSE 5000

CMD ["uwsgi", "--ini", "/pyxtermjs.ini"]
