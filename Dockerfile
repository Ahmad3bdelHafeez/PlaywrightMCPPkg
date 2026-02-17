FROM mcr.microsoft.com/playwright:v1.50.0-jammy

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY playwright-mcp-config.json ./
COPY start.sh ./
RUN chmod +x start.sh

EXPOSE 10000

CMD ["./start.sh"]
