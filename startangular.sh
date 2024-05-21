#!/bin/bash
cd /app
if [ ! -d myapp ]
then
ng new --interactive false --style css  myapp
#npm install bootstrap@4 --save
fi
cd myapp
ng serve --host 0.0.0.0
