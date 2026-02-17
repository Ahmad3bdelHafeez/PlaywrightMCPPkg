FROM mcr.microsoft.com/playwright:v1.50.0-jammy

WORKDIR /app

COPY package*.json ./

# Install specific version
RUN npm install @playwright/mcp@0.0.14

COPY playwright-mcp-config.json ./

EXPOSE 10000

CMD ["node", "node_modules/@playwright/mcp/cli.js", \
     "--port", "10000", \
     "--host", "0.0.0.0", \
     "--config", "playwright-mcp-config.json"]
