FROM node:12.16.3-alpine AS builder
ARG REACT_APP_API_URL
ENV REACT_APP_API_URL=${REACT_APP_API_URL:-http://localhost:8088/}
COPY ./src/react_frontend /app
WORKDIR /app
RUN npm i && npm run build

FROM node:12.16.3-alpine
COPY ./src/react_frontend/package.json /app/package.json
COPY ./src/react_frontend/package-lock.json /app/package-lock.json
COPY ./src/react_frontend/server.js /app/server.js
COPY --from=builder /app/build /app/build
WORKDIR /app
RUN npm i --only=prod
CMD ["npm", "run", "runserver"]
