import { createServer } from '@playwright/mcp';
import { chromium } from 'playwright';

const PORT = process.env.PORT || 8931;

const server = createServer({
  browser: {
    type: 'chromium',
    launchOptions: {
      args: [
        '--no-sandbox',
        '--disable-setuid-sandbox',
        '--disable-dev-shm-usage',  // critical for Render/Docker
        '--disable-gpu',
        '--headless=new'
      ]
    }
  }
});

server.listen(PORT, '0.0.0.0', () => {
  console.log(`Playwright MCP server running on port ${PORT}`);
});
