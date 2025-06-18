# 远程代理环境配置

这个仓库包含了配置远程开发环境的脚本和说明。

## 🚀 快速开始

### 1. 运行安装脚本

```bash
# 克隆仓库
git clone https://github.com/76483393/2.git
cd 2

# 使脚本可执行
chmod +x setup.sh

# 运行安装脚本
./setup.sh
```

### 2. 重新加载环境

```bash
# 重新加载bash配置
source ~/.bashrc

# 或者重启终端
```

### 3. 设置Python虚拟环境

```bash
# 进入项目目录
cd ~/projects

# 创建虚拟环境
python3 -m venv venv

# 激活虚拟环境
source venv/bin/activate

# 安装依赖
pip install -r requirements.txt
```

## 📦 安装的组件

### 系统依赖
- **基础工具**: curl, wget, git, build-essential
- **Python 3**: 包含pip和开发工具
- **Node.js**: 最新LTS版本
- **Docker**: 容器化支持

### Python包
- **数据科学**: numpy, pandas, matplotlib, seaborn
- **机器学习**: scikit-learn, torch, torchvision
- **Web开发**: flask, fastapi, uvicorn
- **开发工具**: jupyter, pytest, black, flake8

## 📁 项目结构

安装后会在 `~/projects` 创建以下目录结构：

```
~/projects/
├── src/           # 源代码
├── data/          # 数据文件
├── models/        # 模型文件
├── notebooks/     # Jupyter notebooks
├── scripts/       # 脚本文件
├── tests/         # 测试文件
├── docs/          # 文档
└── requirements.txt
```

## 🌍 环境变量

脚本会设置以下环境变量：

- `PROJECT_ROOT`: 项目根目录 (`~/projects`)
- `PYTHONPATH`: 包含src目录
- `AUGMENT_WORKSPACE`: Augment工作空间
- `AUGMENT_ENV`: 环境标识 (`remote`)

## 🔧 自定义配置

### 添加GPU支持

如果需要GPU支持，修改PyTorch安装命令：

```bash
# 替换setup.sh中的PyTorch安装行
pip3 install --user torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
```

### 添加其他依赖

编辑 `requirements.txt` 文件添加项目特定的依赖。

### 配置Jupyter

```bash
# 启动Jupyter Notebook
cd ~/projects/notebooks
jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser
```

## 🐳 Docker使用

如果安装了Docker，可以使用容器化服务：

```bash
# 检查Docker安装
docker --version

# 运行示例容器
docker run hello-world
```

## 🚨 故障排除

### 权限问题
如果遇到权限问题，确保用户在docker组中：
```bash
sudo usermod -aG docker $USER
# 然后重新登录
```

### Python路径问题
如果Python包导入有问题，检查PYTHONPATH：
```bash
echo $PYTHONPATH
```

### 网络问题
如果下载失败，可能需要配置代理或使用国内镜像源。

## 📞 支持

如果遇到问题，请检查：
1. 系统是否为Ubuntu/Debian
2. 是否有sudo权限
3. 网络连接是否正常

## 🔄 更新

要更新环境，重新运行setup脚本：
```bash
./setup.sh
```
