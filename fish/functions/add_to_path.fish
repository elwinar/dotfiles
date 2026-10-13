function add_to_path
	if test -e $argv
		set -x PATH $argv $PATH
	end
end
