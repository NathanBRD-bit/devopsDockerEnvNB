#Stage base
FROM node:20 AS base
WORKDIR /app
COPY package*.json ./

#Stage builder
FROM base AS builder
RUN npm i
COPY . .
RUN npm run build

##Stage Dev
FROM base AS development
RUN npm i
COPY . .
EXPOSE 5173
CMD ["npm", "run", "dev"]

#Stage production
FROM nginx:alpine AS production
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]