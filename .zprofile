# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# claude (native install lives in ~/.local/bin)
export PATH="$HOME/.local/bin:$PATH"
