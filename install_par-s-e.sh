#!/usr/bin/env bash

# =========================
# Brew-like installer for par-s-e
# =========================

# --- Colors ---
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
CYAN="\033[0;36m"
YELLOW_BOLD="\033[1;33m"
BRIGHT_MAGENTA_BOLD="\033[1;95m"
NC="\033[0m"

REPO_DIR="$(pwd)"
BIN_DIR="${HOME}/.par-s-e/bin"
COMPLETION_DIR="${HOME}/.par-s-e/completions"

mkdir -p "$BIN_DIR" "$COMPLETION_DIR"

echo -e "${BRIGHT_MAGENTA_BOLD}══════════════════ Installing par-s-e ══════════════════${NC}"
echo

# Check PATH
if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    echo -e "${YELLOW}‼  Warning:${NC} $BIN_DIR is not in your PATH."
    echo -e "↳ Add this line to your shell config (~/.bashrc, ~/.zshrc, etc.):"
    echo -e "   export PATH=\"$BIN_DIR:\$PATH\""
    echo
fi

# Symlink par-s-e
PARSE_BIN_LINK="$BIN_DIR/par-s-e"
if [ -L "$PARSE_BIN_LINK" ] || [ -f "$PARSE_BIN_LINK" ]; then
    echo -e "${YELLOW}●${NC} Replacing existing par-s-e in $BIN_DIR..."
    rm -f "$PARSE_BIN_LINK"
fi
ln -s "$REPO_DIR/par-s-e" "$PARSE_BIN_LINK"
echo -e "${GREEN}●${NC} Symlink created: $PARSE_BIN_LINK -> $REPO_DIR/par-s-e"

# Install completion
cp "$REPO_DIR/completions/par-s-e-completion.sh" "$COMPLETION_DIR/"
echo -e "${GREEN}●${NC} Completion script installed to $COMPLETION_DIR"

# Add sourcing line if not present
for rcfile in "$HOME/.bashrc" "$HOME/.zshrc"; do
    if [ -f "$rcfile" ]; then
        if ! grep -q 'par-s-e-completion.sh' "$rcfile"; then
            echo "source \"$COMPLETION_DIR/par-s-e-completion.sh\"" >> "$rcfile"
            echo -e "${GREEN}●${NC} Added completion sourcing to $rcfile"
        fi
    fi
done

echo
echo -e "${BRIGHT_MAGENTA_BOLD}Installation complete!${NC}"
echo
echo -e "Restart your shell or run:"
echo -e "  source \"$COMPLETION_DIR/par-s-e-completion.sh\""
echo -e "to enable autocompletion now."
