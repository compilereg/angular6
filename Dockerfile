FROM ubuntu:latest
LABEL maintainer="compiler@aast.edu"
ENV TZ=Africa/Cairo 
RUN apt update 
RUN apt install -y ca-certificates curl gnupg aptitude
RUN mkdir -p /etc/apt/keyrings && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key |  gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" >>  /etc/apt/sources.list.d/nodesource.list 
RUN apt update
RUN apt install -y nodejs
RUN aptitude install -y npm
RUN npm install -g @angular/cli
RUN npm install -g typescript
RUN mkdir /app
RUN useradd -o -u 1000 -c "Angular appllicaiton user" angular -d /app -s /bin/bash
EXPOSE 4200
ADD startangular.sh /
RUN chmod a+x /startangular.sh
USER angular
WORKDIR /app
ENTRYPOINT ["/startangular.sh"]
