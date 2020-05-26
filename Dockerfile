FROM node:alpine as builder 

WORKDIR '/app/react'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx

COPY --from=builder /app/react/build /usr/share/nginx/html