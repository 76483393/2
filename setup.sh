#!/bin/bash

# Setup Script for Remote Agent Environment
#
# This script installs dependencies and configures the environment for your project.
# It runs with sudo privileges when needed.
#
# Examples:
# sudo apt-get update && sudo apt-get install -y package-name
# pip install package-name
# npm install -g package-name
# export ENV_VAR=value

set -e  # Exit on any error

echo "🚀 Starting Remote Agent Environment Setup..."

# Update system packages
echo "📦 Updating system packages..."
sudo apt-get update

# Install essential system dependencies
echo "🔧 Installing essential system dependencies..."
sudo apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release

# Install Python and pip if not already installed
echo "🐍 Setting up Python environment..."
sudo apt-get install -y python3 python3-pip python3-venv python3-dev

# Install Node.js and npm (latest LTS)
echo "📦 Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Docker (optional, for containerized services)
echo "🐳 Installing Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Add current user to docker group
sudo usermod -aG docker $USER

# Install common Python packages for ML/AI projects
echo "🤖 Installing Python ML/AI packages..."
pip3 install --user --upgrade pip
pip3 install --user \
    numpy \
    pandas \
    matplotlib \
    seaborn \
    scikit-learn \
    jupyter \
    notebook \
    requests \
    flask \
    fastapi \
    uvicorn

# Install PyTorch (CPU version - adjust for GPU if needed)
echo "🔥 Installing PyTorch..."
pip3 install --user torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# Create project directory structure
echo "📁 Creating project structure..."
mkdir -p ~/projects/{src,data,models,notebooks,scripts,tests,docs}

# Set up environment variables
echo "🌍 Setting up environment variables..."
cat >> ~/.bashrc << 'EOF'

# Project Environment Variables
export PROJECT_ROOT="$HOME/projects"
export PYTHONPATH="$PROJECT_ROOT/src:$PYTHONPATH"
export PATH="$HOME/.local/bin:$PATH"

# Augment Agent Configuration
export AUGMENT_WORKSPACE="$PROJECT_ROOT"
export AUGMENT_ENV="remote"

EOF

# Create a simple requirements.txt for future use
cat > ~/projects/requirements.txt << 'EOF'
# Core dependencies
numpy>=1.21.0
pandas>=1.3.0
matplotlib>=3.4.0
seaborn>=0.11.0
scikit-learn>=1.0.0
requests>=2.25.0

# Web frameworks
flask>=2.0.0
fastapi>=0.70.0
uvicorn>=0.15.0

# ML/AI
torch>=1.9.0
torchvision>=0.10.0

# Development tools
jupyter>=1.0.0
pytest>=6.0.0
black>=21.0.0
flake8>=3.9.0

EOF

# Make the script executable
chmod +x ~/projects/setup.sh

echo "✅ Remote Agent Environment Setup Complete!"
echo ""
echo "📋 Next Steps:"
echo "1. Restart your terminal or run: source ~/.bashrc"
echo "2. Navigate to your project: cd ~/projects"
echo "3. Create a virtual environment: python3 -m venv venv"
echo "4. Activate it: source venv/bin/activate"
echo "5. Install requirements: pip install -r requirements.txt"
echo ""
echo "🎉 Your remote development environment is ready!"
