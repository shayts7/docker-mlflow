FROM python:2.7.12

LABEL maintainer "Shay Tsadok <shayts7@gmail.com>"

RUN mkdir /mlflow/

RUN pip install mlflow==0.9.1

USER root
RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common 
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
  
RUN apt-get update  -qq \
    && apt-get install docker-ce=17.12.1~ce-0~debian -y

EXPOSE 5000

CMD mlflow server \
    --file-store /mlflow \
    --host 0.0.0.0
