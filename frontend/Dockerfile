# Use lightweight Nginx Alpine to serve static files
FROM nginx:1.25-alpine

# Copy our SPA into the nginx web root
COPY src/index.html /usr/share/nginx/html/index.html

# Copy our custom nginx config (replaces the default which listens on 80)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 3000

# Healthcheck: Docker pings /healthz every 30s
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget -qO- http://localhost:3000/healthz || exit 1