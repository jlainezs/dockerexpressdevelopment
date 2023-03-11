#!/usr/bin/env bash
if [ ! -e ./$APP_NAME/package.json ]; then
    nest new $APP_NAME --skip-git --package-manager npm --language TS
    cd $APP_NAME
    npm install @types/express --save
else
    cd $APP_NAME
    npm install
fi

npm run start:dev