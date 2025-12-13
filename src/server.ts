/**
 * BlackRoad OS Master Service
 * Minimal health check server
 */

import { serve } from '@hono/node-server';
import { Hono } from 'hono';
import { cors } from 'hono/cors';

const app = new Hono();

// CORS
app.use('*', cors());

// Health check
app.get('/health', (c) => {
  return c.json({
    status: 'ok',
    service: 'blackroad-os-master',
    timestamp: new Date().toISOString(),
  });
});

// Version info
app.get('/version', (c) => {
  return c.json({
    service: 'blackroad-os-master',
    version: '1.0.0',
    environment: process.env.NODE_ENV || 'production',
  });
});

// Root
app.get('/', (c) => {
  return c.json({
    service: 'blackroad-os-master',
    status: 'operational',
    endpoints: ['/health', '/version'],
  });
});

// Start server
const port = parseInt(process.env.PORT || '8000', 10);
console.log(`🖤 BlackRoad OS Master Service`);
console.log(`   Running on http://localhost:${port}`);
console.log(`   Health check: GET /health\n`);

serve({
  fetch: app.fetch,
  port,
});
