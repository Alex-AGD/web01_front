FROM node:20.0.0-alpine AS builder
#Stage 1: Build the app
WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .
ARG build=null
RUN npm run build

#Stage 2: Serve the app
FROM nginx:alpine
ENV ENV=$build
COPY --from=builder /app/dist /usr/share/nginx/html
COPY ./nginx/* /etc/nginx/conf.d/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
