FROM openjdk:17

WORKDIR /app
COPY . .

# Install Node.js
RUN apt update && apt install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt install -y nodejs

RUN npm install

# Accept EULA
RUN echo "eula=true" > eula.txt
RUN chmod +x start.sh

EXPOSE 80

CMD ["node", "proxy.js"]