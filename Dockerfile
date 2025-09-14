FROM node:18-alpine

WORKDIR /usr/src/app

# Copy package.json 
COPY package.json ./

# Install only production dependencies
RUN npm install --production

# Copy application source code
COPY . .

# Expose port 3001
EXPOSE 3001

# Create non-root user for security
RUN addgroup -g 1001 -S nodejs
RUN adduser -S nodejs -u 1001
RUN chown -R nodejs:nodejs /usr/src/app
USER nodejs

# Start the application
CMD ["npm", "run", "start:doc"]