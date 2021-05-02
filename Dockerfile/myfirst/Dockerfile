FROM ubuntu:16.04

RUN apt-get update && apt-get install -y wget

#WORKDIR /mydir
#RUN touch hello.txt
#COPY local.txt .

COPY frontend-example-docker/ .

RUN ls -la /*

RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs

#RUN wget http://example.com/index.html

CMD ["/bin/bash"]

