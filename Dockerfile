FROM python:2.7.12

LABEL maintainer "Shay Tsadok <shayts7@gmail.com>"

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apt-get update

RUN mkdir /mlflow/
RUN pip install mlflow==0.9.1

RUN apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

RUN apt-get update
RUN apt-get -y install docker-ce

EXPOSE 5000

CMD mlflow server \
    --file-store /mlflow \
    --host 0.0.0.0
