FROM ubuntu:14.04


# Install dependencies
RUN echo "Setting up machine"
RUN apt-get update
RUN apt-get upgrade -y

RUN echo "Installing requirements"
RUN apt-get install -y nodejs
RUN apt-get install -y npm

RUN ln -s /usr/bin/nodejs /usr/bin/node

# Setup stuff to serve
ADD . srv/

# Setup supervisord
RUN apt-get install -y supervisor
COPY supervisord.conf /etc/supervisor/supervisord.conf

# Weather port
EXPOSE 8084
