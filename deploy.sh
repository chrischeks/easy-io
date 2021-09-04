#!/bin/bash

tar czf easyio.tar.gz main.js package.json LICENSE yarn.lock public/
scp easyio.tar.gz 167.172.100.241:~
rm easyio.tar.gz

ssh 167.172.100.241 << "ENDSSH"
pm2 stop easyio
rm -rf easyio
mkdir easyio
tar xf easyio.tar.gz -C easyio
rm easyio.tar.gz
cd easyio
yarn install
pm2 start easyio
ENDSSH