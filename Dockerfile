# Start from an official Node.js 16 image, which already includes Node and npm
FROM node:16

# Set the folder inside the container where the app will live
WORKDIR /app

# Copy only package files first so Docker can cache the install step
COPY package*.json ./

# Install the app's dependencies inside the container
RUN npm install

# Copy the rest of the application files into the container
COPY . .

# Document that the app listens on port 3000
EXPOSE 3000

# Start the application when the container runs
CMD ["npm", "start"]
