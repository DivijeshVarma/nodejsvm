#!/bin/bash

# A simple script to deploy a Node.js application to a Linux VM by cloning a git repository.

# Set the target directory for the application
APP_DIR="/var/www/nodejs-app"
REPO_URL="https://github.com/DivijeshVarma/nodejs.git"

echo "Beginning deployment..."

# Stop the existing application instance
pm2 stop nodejs-app || true

# Remove the old application directory to ensure a clean slate
echo "Removing old application directory..."
rm -rf "$APP_DIR"

# Clone the repository
echo "Cloning the repository from $REPO_URL..."
git clone "$REPO_URL" "$APP_DIR"

# Navigate into the application directory
cd "$APP_DIR"

# Install production dependencies
echo "Installing dependencies..."
npm install --production

# Start the application with PM2
echo "Starting the application with PM2..."
pm2 start app.js --name "nodejs-app"

# Save the PM2 process list to ensure it restarts on boot
pm2 save

echo "Deployment complete."
