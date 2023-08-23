FROM node:10-slim AS builder
WORKDIR /root
COPY package.json ./
COPY package-lock.json ./
RUN npm install --no-optional && npm cache clean --force
ENV PATH /root/node_modules/.bin/:$PATH

ENV NODE_ENV=development

COPY . .
RUN npm run build
CMD ["node", "/root/build"]