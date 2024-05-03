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
RUN mkdir /app
WORKDIR /app
RUN ng new --interactive false --style css  app
RUN npm install bootstrap@4 --save
RUN useradd -c "Angular appllicaiton user" angular
RUN chown -R angular /app
EXPOSE 4200
WORKDIR /app/app
USER angular
ENTRYPOINT ["ng"]
CMD ["serve","--host","0.0.0.0"]
