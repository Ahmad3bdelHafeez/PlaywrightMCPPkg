#!/bin/bash
export PLAYWRIGHT_MCP_ALLOWED_ORIGINS="*"
export PLAYWRIGHT_MCP_HOST="0.0.0.0"
exec npx @playwright/mcp@latest \
  --port 10000 \
  --host 0.0.0.0 \
  --allowed-origins "*" \
  --config playwright-mcp-config.json
