#!/bin/bash

# A simple script to deploy a Node.js application to a Linux VM by cloning a git repository.

# Set the target directory for the application
APP_DIR="/var/www/nodejsvm"
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

# Navigate into the application directory
cd "$APP_DIR"

# Install Node.js dependencies
echo "Installing Node.js dependencies..."
npm install

# deploy app
node app deploy &

echo "Deployment complete."
