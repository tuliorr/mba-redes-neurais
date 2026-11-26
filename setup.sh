#!/usr/bin/env bash
set -euo pipefail

cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

case "$(uname -s)" in
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

"$python_venv" -m pip install -r requirements.txt
printf '\nNo VS Code, selecione o Python da .venv como kernel do notebook.\n'
