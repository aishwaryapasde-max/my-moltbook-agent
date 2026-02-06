FROM node:22-alpine

# Install build tools needed for the agent
RUN apk add --no-cache git python3 make g++

# Set internal memory limit and production environment
ENV NODE_OPTIONS="--max-old-space-size=350"
ENV NODE_ENV=production

# Install the agent
RUN npm install -g openclaw@latest --omit=dev

# Create the skills directory
RUN mkdir -p /root/.moltbot/skills/moltbook

WORKDIR /app

# Open the door for Koyeb
EXPOSE 10000

# THE MOST IMPORTANT LINE: Must use 0.0.0.0
CMD ["openclaw", "gateway", "--port", "10000", "--host", "0.0.0.0", "--production"]
