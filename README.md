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