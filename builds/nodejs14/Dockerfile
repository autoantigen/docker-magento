FROM node:14

RUN mkdir -p /home/node/app

RUN chown -R node:node /home/node/app

VOLUME /home/autoantigen/Projects/repos/react-firebase-authentication /home/node/app

WORKDIR /home/node/app

RUN ls -lha

RUN rm -rf node_modules

USER node

RUN npm install

EXPOSE 8080

CMD [ "npm", "run", "start" ]
