FROM openjdk:17-slim

WORKDIR /app
COPY . .

# Install Node.js 18 (using apt)
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# Accept Minecraft EULA
RUN echo "eula=true" > eula.txt

RUN chmod +x start.sh

EXPOSE 80

CMD ["node", "proxy.js"]