#!/bin/bash
echo "Starting Appium server with device: $DEVICE_NAME"
appium --log /var/log/appium.log --default-capabilities "{\"deviceName\":\"$DEVICE_NAME\"}"

chmod +x entrypoint.sh
