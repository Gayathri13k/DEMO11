# step 1 : specify a base image 
FROM node:18-alpine

# step 2 : set working directory inside the container 
WORKDIR /app

# step 3 : copy the package.json and package-lock.json files to install dependencies
COPY package*.json ./

# step 4 : install dependencies
RUN npm build

# step 5 : copy the rest of your code
COPY . .

# step 6 : Build the React application 
RUN npm run build

# step 7 : set up a command to run the app using a lightweight HTTP server
RUN npm install -g serve
CMD [ "serve","-s","build" ]

#Optional : Expose the port your application runs on 
EXPOSE 3000
