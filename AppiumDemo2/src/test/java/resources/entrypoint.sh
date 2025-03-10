#!/bin/bash

# Start the Appium server
appium --allow-cors &

# Wait for Appium to start
sleep 5

# Run tests (adjust command based on your framework)
npm test  # If using Node.js

chmod +x entrypoint.sh