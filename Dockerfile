FROM node:22-alpine

WORKDIR /usr/src/app

COPY package.json  ./
COPY package-lock.json  ./

RUN npm install --ignore-scripts --production

COPY node_modules ./node_modules
COPY build ./build

USER nobody

EXPOSE 3000

CMD ["node", "build/index.js"]
