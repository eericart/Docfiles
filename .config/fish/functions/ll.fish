#See https://github.com/jsatk/dotfiles/blob/3ad8eda78d20051af716ae9aec5ffafcb21de2d2/functions/ll.fish
function ll --description 'List all files colorized in long format, including dot files.'
	ls -al $argv
end

