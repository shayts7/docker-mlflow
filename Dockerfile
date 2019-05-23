FROM python:2.7.12

LABEL maintainer "Shay Tsadok <shayts7@gmail.com>"

RUN mkdir /mlflow/

RUN pip install mlflow==0.9.1
RUN pip install docker

EXPOSE 5000

CMD mlflow server \
    --file-store /mlflow \
    --host 0.0.0.0
