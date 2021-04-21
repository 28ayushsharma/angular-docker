FROM node:15.14.0-alpine3.10 as builder

# RUN apk add chromium
WORKDIR '/app'
# ENV CHROME_BIN=/usr/bin/chromium-browser

COPY package.json .
RUN npm install
# RUN npm install -g @angular/cli

COPY . .

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/dist/frontend /usr/share/nginx/html