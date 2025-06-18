#!/bin/bash

# 启动脚本 - 用于快速启动开发环境

set -e

echo "🚀 启动远程代理环境..."

# 检查是否在虚拟环境中
if [[ "$VIRTUAL_ENV" == "" ]]; then
    echo "⚠️  建议在虚拟环境中运行"
    echo "运行以下命令创建并激活虚拟环境："
    echo "  python3 -m venv venv"
    echo "  source venv/bin/activate"
    echo ""
    read -p "是否继续？(y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# 检查依赖是否安装
echo "📦 检查依赖..."
if ! python3 -c "import torch, numpy, pandas" 2>/dev/null; then
    echo "⚠️  缺少必要的Python包"
    echo "运行以下命令安装："
    echo "  pip install -r requirements.txt"
    exit 1
fi

# 创建必要的目录
echo "📁 创建项目目录..."
mkdir -p {src,data,models,notebooks,scripts,tests,docs}

# 设置环境变量
export PYTHONPATH="$(pwd)/src:$PYTHONPATH"
export PROJECT_ROOT="$(pwd)"

echo "✅ 环境准备完成！"
echo ""
echo "📋 可用命令："
echo "  启动Jupyter: jupyter notebook --ip=0.0.0.0 --port=8888"
echo "  运行测试: pytest tests/"
echo "  代码格式化: black src/"
echo "  代码检查: flake8 src/"
echo ""
echo "🎉 开始编码吧！"
