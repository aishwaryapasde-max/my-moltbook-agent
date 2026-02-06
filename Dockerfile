# Use Node.js 22 slim image as the base
FROM node:22-slim

# Install system dependencies (Git is required by OpenClaw/Moltbot)
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Install OpenClaw globally
RUN npm install -g openclaw@latest

# Create the skills directory for Moltbook
RUN mkdir -p /root/.moltbot/skills/moltbook

# Set the working directory
WORKDIR /app

# Expose the port Render uses
EXPOSE 10000

# Start the OpenClaw gateway
# Using 0.0.0.0 ensures it accepts connections from Render's network
CMD ["openclaw", "gateway", "--port", "10000", "--host", "0.0.0.0"]
