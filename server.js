import { createServer } from '@playwright/mcp';

const PORT = process.env.PORT || 8931;

const server = createServer({
  browser: {
    type: 'chromium',
    launchOptions: {
      executablePath: process.env.PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH,
      args: [
        '--no-sandbox',
        '--disable-setuid-sandbox',
        '--disable-dev-shm-usage',
        '--disable-gpu',
        '--single-process',      // important for Render
        '--no-zygote',           // important for Render
        '--headless=new'
      ]
    }
  }
});

server.listen(PORT, '0.0.0.0', () => {
  console.log(`✅ Playwright MCP running on port ${PORT}`);
});
