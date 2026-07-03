FROM nginx:1.25-alpine

# Install curl for the healthcheck (wget is not included in nginx:alpine)
RUN apk add --no-cache curl

# Copy our SPA into the nginx web root
COPY src/index.html /usr/share/nginx/html/index.html

# Copy our custom nginx config (replaces the default which listens on 80)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 3000

# Healthcheck: use curl, not wget — wget is not in nginx:alpine
HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
  CMD curl -f http://localhost:3000/healthz || exit 1