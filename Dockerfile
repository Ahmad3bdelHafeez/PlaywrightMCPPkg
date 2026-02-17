FROM node:20-slim

# RUN apt-get update && apt-get install -y \
#     chromium \
#     fonts-liberation \
#     libasound2 \
#     libatk-bridge2.0-0 \
#     libatk1.0-0 \
#     libcups2 \
#     libdbus-1-3 \
#     libdrm2 \
#     libgbm1 \
#     libgtk-3-0 \
#     libnspr4 \
#     libnss3 \
#     libx11-xcb1 \
#     libxcomposite1 \
#     libxdamage1 \
#     libxfixes3 \
#     libxrandr2 \
#     libxss1 \
#     xdg-utils \
#     --no-install-recommends \
#     && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libxss1 \
    xdg-utils \
    xvfb \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g @playwright/mcp@latest

ENV PLAYWRIGHT_BROWSERS_PATH=0
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1

EXPOSE 8931

# CMD ["playwright-mcp", \
#      "--port", "8931", \
#      "--host", "0.0.0.0", \
#      "--allowed-hosts", "*", \
#      "--browser", "chromium", \
#      "--executable-path", "/usr/bin/chromium", \
#      "--no-sandbox", \
#      "--headless", \
#      "--isolated"]


CMD Xvfb :99 -screen 0 1280x720x24 & \
    DISPLAY=:99 playwright-mcp --port 8931 --host 0.0.0.0 \
    --allowed-hosts "*" --browser chromium \
    --executable-path /usr/bin/chromium --no-sandbox
