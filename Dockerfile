# Using Node 22 slim to keep the image small
FROM node:22-slim

# Install system dependencies + Git
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Set Environment Variables inside the Dockerfile for safety
# max-old-space-size=400 tells Node to stop at 400MB (leaving 112MB for system)
ENV NODE_OPTIONS="--max-old-space-size=400"
ENV NODE_ENV=production

# Install OpenClaw globally
RUN npm install -g openclaw@latest

# Create the skills directory
RUN mkdir -p /root/.moltbot/skills/moltbook

# Set the working directory
WORKDIR /app

# Expose Render's default port
EXPOSE 10000

# Final Start Command with memory-saving flags
CMD ["openclaw", "gateway", "--port", "10000", "--host", "0.0.0.0", "--production"]
