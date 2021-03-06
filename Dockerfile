FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y curl gnupg2

RUN curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list

RUN apt-get update && \
    apt-get install -y mongodb-org

CMD ["mongod", "--bind_ip_all"]