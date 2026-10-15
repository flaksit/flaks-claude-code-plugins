#!/bin/bash

# Check if basedpyright-langserver is installed and available in PATH
# Based on the pyright plugin from boostvolt/claude-code-lsps
# https://github.com/boostvolt/claude-code-lsps - Thank you Jan Kott and contributors!

if command -v basedpyright-langserver &> /dev/null; then
    exit 0
fi

# Auto-install only via uv (isolated tool env on PATH). No pip fallback: bare
# `pip install` fails on PEP 668 externally-managed Pythons (Debian/Ubuntu,
# Homebrew) or pollutes whichever Python is active.
if command -v uv &> /dev/null; then
    echo "[basedpyright-lsp] Installing basedpyright via uv..."
    uv tool install basedpyright

    if command -v basedpyright-langserver &> /dev/null; then
        echo "[basedpyright-lsp] Installed successfully via uv"
        exit 0
    fi
    echo "[basedpyright-lsp] Failed to install via uv."
fi

echo "[basedpyright-lsp] basedpyright-langserver not found. Install it with one of:"
echo "                   uv tool install basedpyright"
echo "                   pipx install basedpyright"
exit 0
