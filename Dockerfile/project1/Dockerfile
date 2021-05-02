FROM ubuntu:16.04

WORKDIR /frontenddir

COPY frontend-example-docker/ .

RUN ls -la /*

RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs

RUN npm install

# RUN npm start

RUN npm run build

RUN npm install -g serve

CMD ["/bin/bash"]
# RUN serve -s -l 5000 dist