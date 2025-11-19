#!/bin/bash
# Setup script for sandbox-repo

set -e

echo "🚀 Setting up sandbox-repo..."

# Create virtual environment
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
echo "✨ Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "⬆️  Upgrading pip..."
pip install --upgrade pip > /dev/null

# Install dependencies
echo "📥 Installing dependencies..."
pip install -r requirements.txt > /dev/null

echo ""
echo "✅ Setup complete!"
echo ""
echo "To activate the virtual environment, run:"
echo "  source venv/bin/activate"
echo ""
echo "To run tests:"
echo "  pytest"
echo "  pytest --cov=calculator --cov-report=term-missing  # with coverage"
echo ""
echo "To deactivate:"
echo "  deactivate"

