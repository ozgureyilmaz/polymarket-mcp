# Polymarket MCP Server
🎲 *mcp server for polymarket prediction markets*

rust-based mcp server for polymarket data. provides real-time market info, prices, and search through claude desktop.

## features
real-time market data and trending markets.
search across questions, descriptions, and categories.
current yes/no prices and statistics.
works with claude desktop + cli for terminal use.
built-in caching and auto-retry logic.

## requirements
- rust 1.70+ (install via [rustup](https://rustup.rs/))
- claude desktop (download from [claude.ai](https://claude.ai/download))

## install

#### download binary (recommended)
1. grab the latest release from [releases](https://github.com/0x79de/polymarket-mcp/releases)
2. configure claude desktop:

edit config file:
- **macos**: `~/Library/Application Support/Claude/claude_desktop_config.json`
- **windows**: `%APPDATA%\Claude\claude_desktop_config.json`
- **linux**: `~/.config/Claude/claude_desktop_config.json`

```json
{
  "mcpServers": {
    "polymarket": {
      "command": "/path/to/polymarket-mcp",
      "env": {
        "RUST_LOG": "info"
      }
    }
  }
}
```

3. restart claude desktop

#### build from source
```bash
git clone https://github.com/0x79de/polymarket-mcp
cd polymarket-mcp
cargo build --release
```

use binary at `target/release/polymarket-mcp` in your claude config.

#### install via cargo
```bash
cargo install --git https://github.com/0x79de/polymarket-mcp
```

binary installs to `~/.cargo/bin/polymarket-mcp`.

## usage

### with claude desktop
after setup, ask claude:
- "show me top 10 active prediction markets"
- "search for markets about AI"
- "what are trending markets?"
- "get details for market 12345"

### cli
```bash
# list markets
polymarket-mcp markets --limit 10

# trending by volume
polymarket-mcp trending --limit 5

# search
polymarket-mcp search "bitcoin"

# market details
polymarket-mcp market 990538

# prices
polymarket-mcp prices 990538
```

output formats: `json`, `pretty`, `table`
```bash
polymarket-mcp --output table trending --limit 5
```

## config (optional)
works out-of-box. customize via `.env` or `config.toml` if needed:

```bash
# .env example
POLYMARKET_CACHE_TTL=60
POLYMARKET_LOG_LEVEL=info
RUST_LOG=info
```

config priority: env vars > config file > defaults

## development
```bash
# run tests
cargo test

# check code
cargo check
cargo clippy --all-targets --all-features -- -D warnings
cargo fmt

# build release
cargo build --release
```

## troubleshooting
server won't start? check:
1. verify binary path exists
2. test with `./polymarket-mcp --help`
3. check config syntax is valid json
4. restart claude desktop after config changes

enable debug logging:
```json
{
  "env": {
    "RUST_LOG": "debug"
  }
}
```

## license
mit license - see [LICENSE](LICENSE) file.

## links
- [issues](https://github.com/0x79de/polymarket-mcp/issues)
- [mcp docs](https://modelcontextprotocol.io/docs)
- [polymarket api](https://docs.polymarket.com)
