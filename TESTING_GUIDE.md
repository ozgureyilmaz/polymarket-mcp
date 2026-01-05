# Testing Guide for Polymarket MCP Server

This guide provides multiple ways to verify that the Polymarket MCP server is functioning correctly.

## 1. Automated Tests

The codebase includes a comprehensive test suite. Run it to verify core functionality:

```bash
# Run all unit and integration tests
cargo test
```

Expected output: `test result: ok. 11 passed; 0 failed;`

## 2. Manual Protocol Test (Quick Check)

You can verify the server implementation of the MCP protocol by sending a raw JSON-RPC handshake message. This confirms the server starts, reads input, and writes the correct output.

Run this command in your terminal:

```bash
echo '{"jsonrpc":"2.0","method":"initialize","params":{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"test","version":"1.0.0"}},"id":0}' | cargo run
```

**Expected Output:**
You should see a JSON response starting with `{"jsonrpc":"2.0","id":0,"result":{...}}` containing the server capabilities and version `0.1.0`.

## 3. Using MCP Inspector

The [MCP Inspector](https://github.com/modelcontextprotocol/inspector) is an interactive developer tool to test MCP servers.

**Prerequisites:** Node.js installed (`npx` command available).

Run the inspector:

```bash
npx @modelcontextprotocol/inspector cargo run --release
```

This will open a web interface where you can:
- List available tools and resources.
- Execute tools like `get_active_markets`.
- View resource content.
- Test prompts.

## 4. Claude Desktop Integration

To test end-to-end with the AI:

1. Build the release binary:
   ```bash
   cargo build --release
   ```

2. Configure Claude Desktop (`~/Library/Application Support/Claude/claude_desktop_config.json` on macOS):
   ```json
   {
     "mcpServers": {
       "polymarket": {
         "command": "/ABSOLUTE/PATH/TO/polymarket-mcp/target/release/polymarket-mcp",
         "env": {
           "RUST_LOG": "info"
         }
       }
     }
   }
   ```
   *Replace `/ABSOLUTE/PATH/TO/...` with your actual path.*

3. Restart Claude Desktop.
4. Ask Claude: "Show me the top active prediction markets."

## Troubleshooting

- **Server crashes immediately**: Check `RUST_LOG=debug cargo run` for error details.
- **Connection refused**: Ensure no other process is using the stdio locks (rare).
- **Compilation errors**: Ensure you are on the `feat/upgrade-sdk-0.12.0` branch and have run `cargo check`.
