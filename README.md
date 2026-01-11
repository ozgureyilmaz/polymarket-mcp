# polymarket-mcp

🎲 *prediction markets at your fingertips*

mcp server and cli for polymarket. get real-time market data, prices, and search through claude desktop or terminal.

[![CI](https://github.com/ozgureyilmaz/polymarket-mcp/workflows/CI/badge.svg)](https://github.com/ozgureyilmaz/polymarket-mcp/actions)
[![Release](https://img.shields.io/github/v/release/ozgureyilmaz/polymarket-mcp)](https://github.com/ozgureyilmaz/polymarket-mcp/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/ozgureyilmaz/polymarket-mcp)

## features

real-time data: active markets, trending by volume, current prices.

search: find markets by keyword across questions and descriptions.

multiple interfaces: claude desktop integration + standalone cli.

output formats: json, pretty-printed, or clean tables.

caching: built-in smart caching with auto-retry logic.

## requirements

rust 1.70+ (`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`)

claude desktop for mcp integration ([download](https://claude.ai/download))

## install

```bash
cargo install --git https://github.com/ozgureyilmaz/polymarket-mcp
```

binary installs to `~/.cargo/bin/polymarket-mcp`.

## setup

configure claude desktop:

edit `~/Library/Application Support/Claude/claude_desktop_config.json` (macos):

```json
{
  "mcpServers": {
    "polymarket": {
      "command": "polymarket-mcp"
    }
  }
}
```

restart claude desktop.

## usage

### cli

```bash
# trending markets
polymarket-mcp --output table trending --limit 5

# active markets
polymarket-mcp --output table markets --limit 10

# search
polymarket-mcp --output table search "fed" --limit 5

# market details
polymarket-mcp market 601700

# prices
polymarket-mcp prices 601700
```

### with claude

after setup, ask claude:
- "show me trending prediction markets"
- "search for markets about trump"
- "what's the current price on the fed decision market?"

## development

```bash
cargo test
cargo build --release
```

## links

- [issues](https://github.com/ozgureyilmaz/polymarket-mcp/issues)
- [mcp docs](https://modelcontextprotocol.io/docs)
- [polymarket-mcp docs](https://deepwiki.com/ozgureyilmaz/polymarket-mcp)
- [polymarket api](https://docs.polymarket.com)
