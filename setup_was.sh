#!/bin/bash

# 1. Configuration
SERVICE_NAME="myapp"
SERVICE_PATH="/etc/systemd/system/$SERVICE_NAME.service"
APP_DIR="/home/ubuntu/labfiles"
BINARY_PATH="/home/ubuntu/labfiles/myapp"
LOG_PATH="/home/ubuntu/labfiles/app.log"

# 기본 DB IP 
DB_IP="172.25.1.21"

echo ">>> Starting registration for Go service: $SERVICE_NAME..."

# 2. Cleanup 
echo ">>> Cleaning up existing service and configuration..."
sudo systemctl stop $SERVICE_NAME 2>/dev/null
sudo systemctl disable $SERVICE_NAME 2>/dev/null
sudo rm -f $SERVICE_PATH
sudo systemctl daemon-reload

# 3. Create systemd service file
echo ">>> Generating service file at: $SERVICE_PATH"
sudo tee $SERVICE_PATH > /dev/null <<EOF
[Unit]
Description=My Application (myapp)
After=network.target

[Service]
User=ubuntu
Group=ubuntu
WorkingDirectory=$APP_DIR
Environment="DB_HOST=$DB_IP"
ExecStart=$BINARY_PATH
Restart=always
StandardOutput=append:$LOG_PATH
StandardError=append:$LOG_PATH

[Install]
WantedBy=multi-user.target
EOF

# 4. Apply systemd changes and start service
echo ">>> Reloading systemd daemon and enabling $SERVICE_NAME..."
sudo systemctl daemon-reload
sudo systemctl enable $SERVICE_NAME
sudo systemctl restart $SERVICE_NAME

# 5. Verify the result
echo ">>> Setup complete! Displaying current service status..."
sudo systemctl status $SERVICE_NAME --no-pager


