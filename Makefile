.PHONY: help build build-release check fmt lint test test-release audit ci clean install

# Default target
help:
	@echo "Available targets:"
	@echo "  make build          - Build debug binary"
	@echo "  make build-release  - Build release binary"
	@echo "  make check          - Check code without building"
	@echo "  make fmt            - Format code"
	@echo "  make lint           - Run clippy linter"
	@echo "  make test           - Run tests"
	@echo "  make test-release   - Run tests in release mode"
	@echo "  make audit          - Security audit"
	@echo "  make ci             - Run all CI checks"
	@echo "  make clean          - Clean build artifacts"
	@echo "  make install        - Install to ~/.cargo/bin"
	@echo ""
	@echo "Quick commands:"
	@echo "  make && make test   - Build and test"
	@echo "  make ci             - Run full CI suite locally"

# Build targets
build:
	cargo build

build-release:
	cargo build --release

# Check without building
check:
	cargo check

# Format code
fmt:
	cargo fmt --all

# Lint with clippy
lint:
	cargo clippy --all-targets --all-features -- -D warnings -A clippy::pedantic

# Test targets
test:
	cargo test --verbose

test-release:
	cargo test --release --verbose

# Security audit
audit:
	cargo audit

# Run all CI checks
ci: fmt lint test build-release
	@echo "✅ All CI checks passed!"

# Clean build artifacts
clean:
	cargo clean

# Install to ~/.cargo/bin
install:
	cargo install --path .
	@echo "✅ Installed to ~/.cargo/bin/polymarket-mcp"
	@echo "You can now use: polymarket-mcp <command>"
