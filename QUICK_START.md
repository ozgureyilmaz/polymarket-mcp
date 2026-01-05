# Quick Start Guide - Polymarket MCP

## ✅ What Was Fixed

- **Deserialization errors** - No more "expected array, got string" errors
- **Missing fields** - All optional fields handled gracefully  
- **API compatibility** - Works with all Polymarket API response formats
- **Error messages** - Better debugging with API response preview
- **Simplified** - No API key needed or supported

## 🚀 Quick Setup (3 Steps)

### 1. Build the Fixed Version

```bash
cd /Users/0x79de/dev/polymarket-mcp
cargo build --release
# Should complete with zero warnings
```

### 2. Configure Claude Desktop

Edit: `~/Library/Application Support/Claude/claude_desktop_config.json`

```json
{
  "mcpServers": {
    "polymarket": {
      "command": "/Users/0x79de/dev/polymarket-mcp/target/release/polymarket-mcp",
      "env": {
        "RUST_LOG": "info"
      }
    }
  }
}
```

**Important**: Use the FULL absolute path shown above!

### 3. Restart Claude Desktop

```bash
# Quit completely (Cmd+Q on Mac), then relaunch
```

## 🧪 Test It Works

Try these in Claude Desktop:

1. **"Show me the top 5 trending markets"**
2. **"Search for markets about AI"**
3. **"Get active prediction markets"**

You should get market data without errors!

## 📋 Commands Reference

### Build & Test
```bash
# Build release version
cargo build --release

# Run all tests (should pass 11/11)
cargo test --release

# Check for warnings (should be zero)
cargo clippy
```

### Debug Issues
```bash
# Test API directly
curl "https://gamma-api.polymarket.com/markets?limit=1"

# Test MCP server manually
echo '{"jsonrpc":"2.0","method":"tools/list","id":1}' | ./target/release/polymarket-mcp

# Check Claude logs
tail -f ~/Library/Logs/Claude/mcp.log

# Run with debug output
RUST_LOG=debug ./target/release/polymarket-mcp
```

### Commit Changes
```bash
# Stage all files
git add .

# Commit with message
git commit -m "fix: resolve API deserialization errors and improve error handling"

# Push to GitHub
git push origin fix/api-deserialization
```

## 📚 Documentation

- **[TESTING_GUIDE.md](TESTING_GUIDE.md)** - Step-by-step testing with Claude Desktop
- **[TROUBLESHOOTING.md](TROUBLESHOOTING.md)** - Detailed troubleshooting
- **[README.md](README.md)** - Main documentation

## 🔑 API Key (Optional)

**You DON'T need an API key!** The public API works fine.

The server no longer supports API key configuration - it's been removed for simplicity since Polymarket's public API doesn't require authentication.

## ❓ Common Issues

### "Server not found in Claude"
- Check the path is absolute (starts with `/Users/...`)
- Restart Claude completely (Cmd+Q)
- Check logs: `tail ~/Library/Logs/Claude/mcp.log`

### "Deserialization error" (still getting it?)
- Make sure you built the latest code: `git pull && cargo build --release`
- Check you're on the right branch: `git branch` (should show `* fix/api-deserialization`)
- Enable debug: `RUST_LOG=debug` in Claude config

### "Can't connect to API"
- Test API: `curl "https://gamma-api.polymarket.com/markets?limit=1"`
- Check internet connection
- Check firewall settings

## ✨ What's New

### Code Changes
- ✅ Flexible deserializers for all field types
- ✅ Support for 50+ Polymarket API fields
- ✅ Better error messages with API preview
- ✅ Removed API key support (not needed)
- ✅ Cleaned up dead code and comments
- ✅ All tests passing (11/11)
- ✅ Zero compilation warnings

### Documentation
- ✅ Simplified and consolidated docs
- ✅ Removed redundant API key guides
- ✅ Updated README for clarity
- ✅ Streamlined troubleshooting

## 🎯 Success Checklist

- [ ] Code builds without errors: `cargo build --release`
- [ ] All tests pass: `cargo test --release` (11/11)
- [ ] Claude Desktop config updated with absolute path
- [ ] Claude Desktop restarted (Cmd+Q, not just close)
- [ ] Test query works: "Show me trending markets"
- [ ] No errors in Claude Desktop
- [ ] (Optional) Changes committed to git

## 📞 Need Help?

1. Check [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
2. Check [API_SETUP.md](API_SETUP.md)
3. Check Claude logs: `tail -f ~/Library/Logs/Claude/mcp.log`
4. Open issue: https://github.com/0x79de/polymarket-mcp/issues

## 🎉 You're All Set!

The Polymarket MCP server should now work perfectly with Claude Desktop. Enjoy exploring prediction markets! 🚀

---

**Branch**: `fix/api-deserialization`  
**Status**: ✅ All fixes complete, ready for testing  
**Tests**: ✅ 11/11 passing  
**Warnings**: ✅ Zero
