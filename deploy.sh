#!/bin/bash

# A simple script to deploy a Node.js application to a Linux VM by cloning a git repository.

# Set the target directory for the application
APP_DIR="/var/www/nodejs-app"
REPO_URL="https://github.com/DivijeshVarma/nodejsvm.git"

echo "Beginning deployment..."

# Stop the existing application instance
sudo pkill -f node

# Remove the old application directory to ensure a clean slate
echo "Removing old application directory..."
sudo rm -rf "$APP_DIR"

# Clone the repository
echo "Cloning the repository from $REPO_URL..."
git clone "$REPO_URL" "$APP_DIR"

pwd

# Navigate into the application directory
cd "$APP_DIR"

pwd

# Install Node.js dependencies
echo "Installing Node.js dependencies..."
sudo npm install

# deploy app
node app deploy &

pwd
echo "Deployment complete."
