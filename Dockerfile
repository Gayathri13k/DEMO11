# Dockerfile
FROM node:14
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=0 /app/build /usr/share/nginx/html

# Add version as a label
LABEL version="0.1.0"

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
