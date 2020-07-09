FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y python3-dev python3-pip

WORKDIR /app

COPY . /app

RUN pip3 install -r requirements.txt

CMD ["flask", "run"]