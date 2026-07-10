#!/usr/bin/env bash

set -Eeuo pipefail

# Esta script crea la estructura de un proyecto de IA para framework LangChain
# Se debe ejecutar con permisos de administrador y dentro de la carpeta del proyecto

# Validar que previamente se instalo uv las instancias init y venv
# Valida que pyproject.toml exista y tenga las dependencias necesarias
if [ ! -f "pyproject.toml" ]; then
    echo "Error: pyproject.toml no existe"
    echo "{$(date +%Y-%m-%d\ %H:%M:%S)} - Error no se inicializo el proyecto con uv init" >> log
    exit 1
fi

# Validar que se haya creado la instancia venv
if [ ! -f ".venv/bin/activate" ]; then
    echo "Error: .venv/bin/activate no existe"
    echo "{$(date +%Y-%m-%d\ %H:%M:%S)} - Error no se creo el entorno virtual con uv env" >> log
    exit 1
fi



directories=(
    "notebooks"
    "pdf_ingesta"
    "pdf_human"
    "src/agents/bills/nodes/transfer"
    "src/agents/bills/nodes/OCR"
    "src/agents/bills/nodes/LLM"
    "src/agents/bills/nodes/check_integrity_bill"
    "src/agents/bills/nodes/VLM"
    "src/agents/bills/nodes/parsing"
    "src/agents/bills/routes/intent"
    "src/api"
)

files=(
    "log"
    "log_human"

    "src/agents/bills/state.py"
    "src/agents/bills/agent.py"

    "src/agents/bills/nodes/transfer/nodo.py"
    "src/agents/bills/nodes/transfer/prompt.py"
    "src/agents/bills/nodes/transfer/tools.py"

    "src/agents/bills/nodes/OCR/nodo.py"
    "src/agents/bills/nodes/OCR/prompt.py"
    "src/agents/bills/nodes/OCR/tools.py"

    "src/agents/bills/nodes/LLM/nodo.py"
    "src/agents/bills/nodes/LLM/prompt.py"
    "src/agents/bills/nodes/LLM/tools.py"

    "src/agents/bills/nodes/check_integrity_bill/nodo.py"
    "src/agents/bills/nodes/check_integrity_bill/prompt.py"
    "src/agents/bills/nodes/check_integrity_bill/tools.py"

    "src/agents/bills/nodes/VLM/nodo.py"
    "src/agents/bills/nodes/VLM/prompt.py"
    "src/agents/bills/nodes/VLM/tools.py"

    "src/agents/bills/nodes/parsing/nodo.py"
    "src/agents/bills/nodes/parsing/prompt.py"
    "src/agents/bills/nodes/parsing/tools.py"

    "src/agents/bills/routes/intent/route.py"
)

echo "Creando estructura del proyecto: $(pwd)"


for directory in "${directories[@]}"; do
    mkdir -p "$(pwd)/$directory"
done

for file in "${files[@]}"; do
    touch "$(pwd)/$file"
done

# Crear __init__.py en src y en todos sus subdirectorios.
find "$(pwd)/src" -type d -exec touch {}/__init__.py \;

echo
echo "Estructura creada correctamente:"
echo