# Directorio
python3 --version
mkdir Download/dhl
cd dhl

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh
uv --version


# Inicializando entorno
uv init
uv venv .venv

# add dependencies
uv add --pre langgraph langchain langchain-openai
uv add --pre langchain-anthropic
uv add "fastapi[standard]"

# add dev dependencies
uv add "langgraph-cli[inmem]" --dev
uv add ipykernel --dev
uv add grandalf --dev

# run the agent
uv run langgraph dev

# add pryproyect.toml (1)
[tool.setuptools.packages.find]
where = ["src"]
include = ["*"]

# add pryproyect.toml (2)
uv pip install -e .


# github
# …or create a new repository on the command line
echo "# dhl" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/kadoperu/dhl.git
git push -u origin main

# …or push an existing repository from the command line
git remote add origin https://github.com/kadoperu/dhl.git
git branch -M main
git push -u origin main

# Estructura



cd workdir
mkdir notebooks
mkdir src
    touch src/__init__.py
mkdir -p src/agents/
    touch src/agents/__init__.py
mkdir -p src/agents/bills
    touch src/agents/bills/__init__.py
mkdir -p src/agents/bills/nodes
    touch src/agents/bills/nodes/__init__.py
mkdir -p src/agents/bills/nodes/serial
    touch src/agents/bills/nodes/serial/__init__.py

mkdir -p src/agents/bills/nodes/batch_read
    touch src/agents/bills/nodes/serial/__init__.py

mkdir -p src/agents/bills/routes
    touch src/agents/bills/routes/__init__.py