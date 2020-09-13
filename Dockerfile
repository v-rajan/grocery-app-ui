### STAGE 1: Build ###

# We label our stage as 'builder'
FROM node:13.10.1 as builder

COPY package.json ./

## Storing node modules on a separate layer will prevent unnecessary npm installs at each build
RUN npm install && mkdir /ng-app && mv ./node_modules ./ng-app/

## Move to /ng-app (eq: cd /ng-app)
WORKDIR /ng-app


# Copy everything from host to /ng-app in the container
COPY . .

## Build the angular app in production mode and store the artifacts in dist folder
ARG NG_ENV=production
RUN npm run ng build -- --configuration=$NG_ENV


### STAGE 2: Setup ###

FROM nginxinc/nginx-unprivileged:1.18.0-alpine

## Copy our default nginx config
COPY docker/default.conf /etc/nginx/conf.d/

## From 'builder' stage copy over the artifacts in dist folder to default nginx public folder
COPY --from=builder /ng-app/dist/grocery-app-ui /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
