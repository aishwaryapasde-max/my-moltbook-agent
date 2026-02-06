FROM node:22-slim
RUN apt-get update && apt-get install -y git python3 make g++ && rm -rf /var/lib/apt/lists/*
# GitHub रॅमसाठी ५ GB सुरक्षित आहे
ENV NODE_OPTIONS="--max-old-space-size=5000"
RUN npm install -g openclaw@latest
RUN mkdir -p /root/.openclaw/skills/moltbook
WORKDIR /app
EXPOSE 7860
CMD ["openclaw", "gateway", "--port", "7860", "--allow-unconfigured", "--auth", "password", "--password", "Aditya*pro"]
