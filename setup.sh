#!/usr/bin/env bash
set -euo pipefail

cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

case "$*" in
    ""|--gpu) ;;
    *)
        printf 'Uso: bash setup.sh [--gpu]\n' >&2
        exit 2
        ;;
esac

sistema="$(uname -s)"
if [[ "${1:-}" == --gpu && "$sistema" != Linux ]]; then
    printf 'Execute a opção --gpu no Linux ou no Ubuntu via WSL2.\n' >&2
    exit 2
fi

case "$sistema" in
    MINGW*|MSYS*|CYGWIN*)
        python_comando=python
        python_venv=.venv/Scripts/python.exe
        ;;
    *)
        python_comando=python3
        python_venv=.venv/bin/python
        ;;
esac

if [[ ! -x "$python_venv" ]]; then
    "$python_comando" -m venv .venv
fi

if [[ "${1:-}" == --gpu ]]; then
    "$python_venv" -m pip install \
        -r requirements.txt \
        --extra-index-url https://download.pytorch.org/whl/cu126 \
        'tensorflow[and-cuda]==2.20.0' \
        'torch==2.8.0+cu126'
else
    "$python_venv" -m pip install -r requirements.txt
fi
printf '\nNo VS Code, selecione o Python da .venv como kernel do notebook.\n'
