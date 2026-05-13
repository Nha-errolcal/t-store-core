# Base image
FROM node:20-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source
COPY . .

# Build Vue app
RUN npm run build

# Install serve to run static files
RUN npm install -g serve

# Expose port
EXPOSE 4173

# Serve dist folder
CMD ["serve", "-s", "dist", "-l", "4173"]