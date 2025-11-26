#!/bin/bash
cd "$(dirname "$0")"
echo "🚀 Starting Mortgage Inequality Dashboard..."
echo "📍 Opening: http://localhost:8888"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""
python3 -m http.server 8888

