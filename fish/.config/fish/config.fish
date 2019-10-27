# Ensure the path isn't clutered in case of tty imbrication (tmux & co)
if set -q ORIGINAL_PATH
  	set PATH $ORIGINAL_PATH
else
  	set -gx ORIGINAL_PATH $PATH
end

# Use UTF8
set -x LANG en_US.UTF-8

# Use nvim for mostly anything.
set -x EDITOR nvim
set -x VISUAL nvim
set -x SUDO_EDITOR nvim
set -x FCEDIT nvim
set -x MANPAGER "nvim +'set ft=man'"

# Additions to the PATH
set -x PATH ~/.local/bin $PATH

# Ensure the fish shell doesn't fuckup with colors
set fish_term24bit 1

# Import the aliases
. (dirname (status -f))/aliases.fish

# Find and source a per-host configuraiton file
if test -e (dirname (status -f))/host.d/(hostname).fish
	. (dirname (status -f))/host.d/(hostname).fish
end
