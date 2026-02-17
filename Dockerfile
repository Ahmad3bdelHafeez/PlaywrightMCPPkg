FROM mcr.microsoft.com/playwright/mcp:latest


ENTRYPOINT ["node", "cli.js", \
  "--headless", \
  "--browser", "chromium", \
  "--no-sandbox"]
