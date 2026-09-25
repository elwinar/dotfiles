# Import the aliases
. (dirname (status -f))/aliases.fish

# Find and source a per-host configuraiton file
if test -e (dirname (status -f))/host.fish
    . (dirname (status -f))/host.fish
end
