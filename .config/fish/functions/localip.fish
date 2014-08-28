#See https://github.com/jsatk/dotfiles/blob/3ad8eda78d20051af716ae9aec5ffafcb21de2d2/functions/localip.fish
function localip --description 'Print local IP.'
	 ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
end
