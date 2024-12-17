#!/bin/bash
# Start a Python HTTP server to serve the camera stream HTML file.

echo "Starting Python HTTP server on port 8000..."
python3 -m http.server 8000
