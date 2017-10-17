FROM node:8.4.0-wheezy

ENV http_proxy http://proxy.pershing.com:8080
ENV https_proxy http://proxy.pershing.com:8080
ENV no_proxy localhost,127.0.0.1,example.com,bnymellon.net

WORKDIR /app/marbles

COPY package.json .

RUN npm install

COPY . .

RUN npm install gulp
RUN npm install

RUN mkdir /root/.hfc-key-store/

# Ensure that the fabric setup is up and running before install and instantiate chaincode is ran using the below two commands
#RUN node scripts/install_chaincode.js
#RUN node scripts/instantiate_chaincode.js

ENV PATH=$PATH:/app/marbles/node_modules/.bin
ENV http_proxy ""
ENV https_proxy ""

#CMD ["gulp","marbles_local"] #node_modules/.bin/gulp marbles_local
#CMD ["gulp","marbles_local"] 
CMD ["/bin/bash"]
