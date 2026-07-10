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
    "src/agents/bills/transfer/agent.py"
    "src/agents/bills/transfer/state.py"
    "src/agents/bills/transfer/tools.py"

    "src/agents/bills/OCR/agent.py"
    "src/agents/bills/OCR/state.py"
    "src/agents/bills/OCR/tools.py"

    "src/agents/bills/LLM/agent.py"
    "src/agents/bills/LLM/state.py"
    "src/agents/bills/LLM/tools.py"

    "src/agents/bills/check_integrity_bill/agent.py"
    "src/agents/bills/check_integrity_bill/state.py"
    "src/agents/bills/check_integrity_bill/tools.py"

    "src/agents/bills/VLM/agent.py"
    "src/agents/bills/VLM/state.py"
    "src/agents/bills/VLM/tools.py"

    "src/agents/bills/parsing/agent.py"
    "src/agents/bills/parsing/state.py"
    "src/agents/bills/parsing/tools.py"

    "src/agents/bills/routes/intent/agent.py"
)

echo "Creando estructura del proyecto: ${pwd}"
exit

for directory in "${directories[@]}"; do
    mkdir -p "{pwd}$directory"
done

for file in "{pwd}/${files[@]}"; do
    touch "$file"
done

# Crear __init__.py en src y en todos sus subdirectorios.
find "{pwd}/src" -type d -exec touch {}/__init__.py \;

echo
echo "Estructura creada correctamente:"
echo