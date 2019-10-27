function fish_prompt
	set_color E5C07B
	echo -n (date +"%T ")

	if [ (whoami) = 'root' ]
		set_color E06C75
	else
		set_color 98C379
	end

	set -l path "$PWD"
	set -l path (string replace "$HOME" "~" "$PWD")
	set -l path (string replace -ar '([^/])[^/]*/' '$1/' "$path")
	echo -n "$path"

	set_color 61AFEF
	echo -n ' $ '
	set_color normal
end
