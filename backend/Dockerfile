# Use lightweight Node.js Alpine image
FROM node:20-alpine

# Create a non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copy package files first to leverage Docker layer caching.
# If package.json doesn't change, npm install won't re-run on rebuild.
COPY package*.json ./
RUN npm install --only=production && npm cache clean --force

# Copy source code
COPY src/ ./src/

# Switch to non-root user
USER appuser

EXPOSE 4000

# Healthcheck: Docker will ping this endpoint every 30s.
# If it fails 3 times in a row, the container is marked "unhealthy".
HEALTHCHECK --interval=30s --timeout=10s --start-period=15s --retries=3 \
  CMD wget -qO- http://localhost:4000/api/health || exit 1

CMD ["node", "src/index.js"]