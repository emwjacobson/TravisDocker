FROM ubuntu:latest

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends python3-dev python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install -r requirements.txt

EXPOSE 5000

CMD ["flask", "run", "-h", "0.0.0.0"]