#stage-1 build
FROM node:25-alpine AS builder

WORKDIR /app 

COPY package*.json /app

RUN npm install

COPY . .

RUN npm run build


#stage-2 nginx

FROM nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]

