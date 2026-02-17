FROM mcr.microsoft.com/playwright/mcp:latest

EXPOSE 8931

ENTRYPOINT ["node", "cli.js", \
  "--headless", \
  "--browser", "chromium", \
  "--no-sandbox", \
  "--host", "0.0.0.0", \
  "--port", "8931"]
