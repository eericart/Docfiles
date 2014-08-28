#See https://github.com/jsatk/dotfiles/blob/3ad8eda78d20051af716ae9aec5ffafcb21de2d2/functions/ax.fish
function ax --description 'Make executable.'
	chmod a+x $argv
end
