FROM mcr.microsoft.com/playwright/mcp:latest

EXPOSE 8931

CMD ["node", "cli.js", \
     "--headless", \
     "--browser", "chromium", \
     "--no-sandbox", \
     "--port", "8931", \
     "--allowed-hosts", "*"]
