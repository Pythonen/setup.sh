# Get sudo
sudo -v

mkdir -p ~/dev

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Enable brew
(
  echo
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
) >>/Users/aleksiputtonen/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install packages and casks with brew
echo "Installing programs with homebrew"
brew update
brew upgrade

brew install --cask raycast rectangle visual-studio-code slack alacritty brave-browser

brew install corepack deno git node tmux fzf neovim nvm

# enable automatic updates every 12 hours
echo "Enabling autoupdate for homebrew packages..."
brew tap homebrew/autoupdate
brew autoupdate start 43200 --upgrade

# xcode command line tools
xcode-select --install

# oh-my-tmux
cd ~
git clone https://github.com/Pythonen/config.git ~/dev/config
cp ~/dev/config/.tmux.conf .

# oh-my-zsh (must be last)
sh -c "$(curl -# -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# fzf
source <(fzf --zsh)

ZSHRC_LOC="$HOME/.zshrc"
if [ -f "$ZSHRC_LOC" ]; then
  echo "Backing up existing .zshrc to ~/.zshrc.backup"
  mv "$ZSHRC_LOC" "$ZSHRC_LOC.backup"
fi
ALACRIT_LOC="$HOME/.alacritty.toml"
if [ -f "$ZSHRC_LOC" ]; then
  echo "Backing up existing .alacritty.toml to ~/.alacritty.toml.backup"
  mv "$ALACRIT_LOC" "$ALACRIT_LOC.backup"
fi

cp ~/dev/config/.zshrc .zshrc
cp ~/dev/config/.alacritty.toml .alacritty.toml

# finish
source ~/.zshrc
