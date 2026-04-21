# Stage 1: Build & Dependencies
FROM node:20-slim AS builder
WORKDIR /app

# Copy package files and install ALL dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the code
COPY . .

# Stage 2: Production Run
FROM node:20-slim AS runner
WORKDIR /app

# Copy only the node_modules and app files from the builder stage
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/app.js ./app.js
COPY --from=builder /app/package*.json ./

EXPOSE 3000

# Run the app
CMD ["node", "app.js"]
