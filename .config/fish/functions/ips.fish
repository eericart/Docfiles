#See https://github.com/jsatk/dotfiles/blob/3ad8eda78d20051af716ae9aec5ffafcb21de2d2/functions/ips.fish
function ips --description 'List IP addresses.'
	ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'
end
