FROM node:14-alpine as builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN cd client && npm install && npm run build

FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --only=production

COPY --from=builder /app/client/build ./client/build

COPY . .

EXPOSE 9000

CMD ["npm", "start"]
