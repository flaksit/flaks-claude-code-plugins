#!/bin/bash

# Check if basedpyright-langserver is installed and available in PATH
# Based on the pyright plugin from boostvolt/claude-code-lsps
# https://github.com/boostvolt/claude-code-lsps - Thank you Jan Kott and contributors!

if command -v basedpyright-langserver &> /dev/null; then
    exit 0
fi

# Check if uv is available (preferred installation method)
if command -v uv &> /dev/null; then
    echo "[basedpyright-lsp] Installing basedpyright via uv..."
    uv tool install basedpyright
    
    if command -v basedpyright-langserver &> /dev/null; then
        echo "[basedpyright-lsp] Installed successfully via uv"
        exit 0
    else
        echo "[basedpyright-lsp] Failed to install via uv. Please run manually:"
        echo "                   uv tool install basedpyright"
        exit 0
    fi
fi

# Use pip only if uv is not available
if ! command -v pip &> /dev/null; then
    echo "[basedpyright-lsp] Neither uv nor pip is installed. Please install Python first."
    echo "                   Then run: pip install basedpyright"
    echo "                   Or with uv: uv tool install basedpyright"
    exit 0
fi

# Install via pip
echo "[basedpyright-lsp] Installing basedpyright via pip..."
pip install basedpyright

if command -v basedpyright-langserver &> /dev/null; then
    echo "[basedpyright-lsp] Installed successfully via pip"
else
    echo "[basedpyright-lsp] Failed to install. Please run manually:"
    echo "                   pip install basedpyright"
    echo "                   Or with uv: uv tool install basedpyright"
fi

exit 0
