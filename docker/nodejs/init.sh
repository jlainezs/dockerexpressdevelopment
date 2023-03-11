#!/usr/bin/env bash

# installs express
# and creates the app
init_express() {
    cd $APP_NAME
    npm init --yes
    npm install express --save
    npm install express dotenv --save
}

# installs ts
init_ts() {
    npm i -D typescript @types/express @types/node
    npx tsc --init
    npm install -D concurrently nodemon
}

#installs jest
init_jest() {
    npm install --save-dev jest
}

# prepare app entry point and configures package.json
# don't want to install jq
# inspiration cames from 
# https://stackoverflow.com/a/32640163
init_scripts_section() {
    node << __SCRIPT
    const fs = require('fs');
    const filename = './package.json';
    let pck = JSON.parse(fs.readFileSync(filename, 'utf8'))
    pck.scripts.build = "npx tsc";
    pck.scripts.start = "node ./dist/index.js";
    pck.scripts.dev   = "concurrently \"npx tsc --watch\" \"nodemon -q .dist/index.js\"";
    pck.scripts.test  = "jest";

    fs.writeFileSync(filename, JSON.stringify(pck, null, 2));
__SCRIPT
}

# initializes the app 
# or installs dependencies if there's a package.json file
# in the application directory
if [ ! -e ./$APP_NAME/package.json ]; then
    init_express
    init_ts
    init_jest
    init_scripts_section
else
    cd $APP_NAME
    npm install
fi

# launches the server
npm run dev
