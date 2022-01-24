# Step 1: Build Phase
FROM node:16-alpine as builder



WORKDIR '/app'

COPY package*.json ./
RUN npm install

COPY  . .

RUN npm run build



# Step 2: Run Phase
# (just by setting a second 'FROM' statement, the first step is considered as complete) 
FROM nginx
EXPOSE 80
COPY --from=builder /app/build/ /user/share/nginx/html
# nginx starts by starting the nginx container, no additional command needed here