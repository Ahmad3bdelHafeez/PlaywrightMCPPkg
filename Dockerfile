FROM mcr.microsoft.com/playwright:v1.50.0-jammy

WORKDIR /app

# Install the MCP server
RUN npm init -y && npm install @playwright/mcp@latest

EXPOSE 8080

CMD ["npx", "@playwright/mcp@latest", "--port", "8080", "--host", "0.0.0.0"]
