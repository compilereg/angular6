FROM ubuntu:latest
LABEL maintainer="compiler@aast.edu"
ENV TZ=Africa/Cairo 
#RUN apt update & apt install -y ca-certificates curl gnupg
RUN apt update 
RUN apt install -y ca-certificates curl gnupg aptitude
RUN mkdir -p /etc/apt/keyrings && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key |  gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" >>  /etc/apt/sources.list.d/nodesource.list 
RUN apt update
RUN apt install -y nodejs
RUN aptitude install -y npm
RUN npm install -g @angular/cli
RUN useradd -c "Angular appllicaiton user" angular
RUN mkdir /app && chown -R angular /app
WORKDIR /app
USER angular
RUN ng new app
CMD ["ng", "serve"]
