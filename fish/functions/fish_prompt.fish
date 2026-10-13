function fish_prompt
	set -l path "$PWD"
	set -l path (string replace "$HOME" "~" "$PWD")
	set -l path (string replace -ar '([^/])[^/]*/' '$1/' "$path")
	echo -n "$path"

	if [ (whoami) = 'root' ]
		echo ' # '
	else
		echo ' $ '
	end
end
