# Use official Playwright image - already has browsers installed!
FROM mcr.microsoft.com/playwright:v1.50.0-jammy

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of files
COPY . .

EXPOSE 8931

CMD ["npm", "start"]
