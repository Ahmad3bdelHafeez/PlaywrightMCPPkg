FROM mcr.microsoft.com/playwright:v1.41.2-jammy



COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "server.js"]
