# Builder
FROM node:alpine AS builder

EXPOSE 80

WORKDIR '/opt/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Run
FROM nginx

COPY --from=builder /opt/app/build /usr/share/nginx/html
