#Base
FROM node:20 AS base
WORKDIR /app
COPY package*.json ./

#Stage Dev
FROM base AS development
RUN npm i
COPY . .
CMD ["npm", "run", "dev"]

#Stage Test
FROM base AS test
RUN npm i
COPY . .
CMD ["npm", "run", "test"]

#Stage builder
FROM base AS builder
RUN npm i
COPY . .
RUN npm run build

FROM node:20-alpine AS production
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/dist ./dist
RUN npm install --production
CMD ["node", "dist/server.js"]