FROM mcr.microsoft.com/playwright:v1.50.0-jammy

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY playwright-mcp-config.json ./

EXPOSE 10000

CMD ["npx", "@playwright/mcp@latest", \
     "--port", "10000", \
     "--host", "0.0.0.0", \
     "--allowed-origins", "*", \
     "--config", "playwright-mcp-config.json"]
