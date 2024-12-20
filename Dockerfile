# build stage
# AS build là output của build stage
FROM node:18.18-alpine AS build

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# run stage
# Để chạy được dự án frontend cần có 1 webserver nginx
# lụm được folder build từ output của bước build -> dự án vuejs sẽ build ra folder dist, reactjs sẽ build ra folder build 
# /usr/share/nginx/html là thư mục chạy mặc định của nginx
# container sẽ chạy trên port 80
FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

