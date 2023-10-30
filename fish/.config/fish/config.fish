# Ensure the path isn't clutered in case of tty imbrication (tmux & co)
if set -q ORIGINAL_PATH
  	set PATH $ORIGINAL_PATH
else
  	set -gx ORIGINAL_PATH $PATH
end

# Import the aliases
. (dirname (status -f))/aliases.fish

# Find and source a per-host configuraiton file
if test -e (dirname (status -f))/host.d/(hostname).fish
	. (dirname (status -f))/host.d/(hostname).fish
end
