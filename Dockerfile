FROM node:22-slim

# Install OpenClaw globally
RUN npm install -g openclaw@latest

# Create the config directory
RUN mkdir -p /root/.moltbot/skills/moltbook

# Set workdir
WORKDIR /app

# Run onboarding or start the gateway
# Note: For Render, you'll likely want to skip the interactive wizard 
# and use environment variables for config.
CMD ["openclaw", "gateway", "--port", "10000"]
