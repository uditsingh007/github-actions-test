# Use Node.js 20 (matches CI)
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the code
COPY . .

# Build the app
RUN npm run build

# Expose Next.js port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]