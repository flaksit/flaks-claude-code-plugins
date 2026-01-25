# Claude Code Plugins

A marketplace for Claude Code plugins.

## About

This repository serves as a plugin marketplace for [Claude Code](https://github.com/anthropics/claude-code), providing Language Server Protocol (LSP) integrations and other plugins to enhance Claude's development capabilities.

## Available Plugins

### basedpyright-lsp

Python language server based on [basedpyright](https://github.com/DetachHead/basedpyright), a community fork of pyright with additional features and improvements.

**Features:**
- LSP operations: goToDefinition, findReferences, hover, documentSymbol, workspaceSymbol, goToImplementation, and call hierarchy
- Real-time error and warning detection
- Automatic installation via uv (preferred) or pip
- Support for `.py` and `.pyi` files

## Getting Started

### 1. Add the Marketplace

To add this plugin marketplace to Claude Code, run:

```text
/plugin marketplace add flaksit/claude-plugins
```

### 2. Install Plugins

Install the basedpyright-lsp plugin:

```text
/plugin install basedpyright-lsp@flaksit-claude-plugins
```

Or browse and install interactively:

```text
/plugin
```

#### Manual Installation of basedpyright

The plugin will automatically install basedpyright on first use. If auto-install fails, you can install manually:

Via uv (recommended):
```bash
uv tool install basedpyright
```

Via pip:
```bash
pip install basedpyright
```

## Acknowledgments

The plugin structure and implementation is inspired by the excellent work from [boostvolt/claude-code-lsps](https://github.com/boostvolt/claude-code-lsps) by Jan Kott and contributors. Thank you for pioneering LSP integration examples for Claude Code!

## License

MIT
