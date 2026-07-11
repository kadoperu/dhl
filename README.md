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
uv add langgraph langchain langchain-openai
uv add langchain-anthropic
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
bash structure.sh



