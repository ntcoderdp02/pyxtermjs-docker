#Create a ubuntu base image with python 3 installed.
FROM python:3.8

#Set the working directory
WORKDIR /


#Install the dependencies
RUN apt-get -y update
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install pyxtermjs uwsgi gevent gevent-websocket
ADD pyxtermjs.ini entry.py /

EXPOSE 5000

CMD ["uwsgi", "--ini", "/pyxtermjs.ini"]
