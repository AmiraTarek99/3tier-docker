-- Create the main items table
CREATE TABLE IF NOT EXISTS items (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    description TEXT         NOT NULL DEFAULT '',
    created_at  TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

-- Index for fast ordering by creation time
CREATE INDEX IF NOT EXISTS idx_items_created_at ON items (created_at DESC);

-- Seed with sample data so the app looks alive on first run
INSERT INTO items (name, description) VALUES
    ('Hello Docker',      'First item seeded automatically on startup'),
    ('Docker Compose',    'Tool that orchestrates this entire multi-container stack'),
    ('PostgreSQL',        'Relational database with persistent volume storage'),
    ('Node.js API',       'Backend that handles all read/write operations'),
    ('Nginx Proxy',       'Reverse proxy that routes traffic to frontend and backend'),
    ('Prometheus',        'Metrics collection and time-series database'),
    ('Grafana',           'Dashboard and visualization layer for monitoring'),
    ('cAdvisor',          'Exports per-container resource usage metrics');

-- Convenience view to check database stats
CREATE VIEW items_stats AS
    SELECT
        COUNT(*)       AS total_items,
        MIN(created_at) AS oldest_item,
        MAX(created_at) AS newest_item
    FROM items;