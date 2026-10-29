# Frontend React (Vite) compilado a partir do repositório frontend, na versão fixada em versoes.env,
# servido pelo nginx, que também repassa /dentalflow-api para o backend (mesma origem, sem CORS).
FROM node:22-alpine AS build
WORKDIR /app
COPY --from=source package.json package-lock.json ./
RUN npm ci --no-audit --no-fund
COPY --from=source . .
RUN npm run build

FROM nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
