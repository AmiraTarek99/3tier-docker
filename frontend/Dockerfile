# Use lightweight Nginx Alpine to serve static files
FROM nginx:1.25-alpine
 
# Copy our SPA into the nginx web root
COPY src/index.html /usr/share/nginx/html/index.html
 
# Write a minimal nginx config to serve on port 3000
RUN printf 'server {\n\
    listen 3000;\n\
    root /usr/share/nginx/html;\n\
    index index.html;\n\
\n\
    # Serve the SPA - fallback to index.html for client-side routing\n\
    location / {\n\
        try_files $uri $uri/ /index.html;\n\
    }\n\
\n\
    # Lightweight health check endpoint for Docker\n\
    location /healthz {\n\
        access_log off;\n\
        return 200 "ok";\n\
        add_header Content-Type text/plain;\n\
    }\n\
}\n' > /etc/nginx/conf.d/default.conf
 
EXPOSE 3000
 
# Healthcheck: Docker pings /healthz every 30s
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget -qO- http://localhost:3000/healthz || exit 1