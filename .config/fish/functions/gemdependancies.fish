#See https://github.com/jsatk/dotfiles/blob/3ad8eda78d20051af716ae9aec5ffafcb21de2d2/functions/gemdependancies.fish
function gemdependancies --description Lists\ every\ gem\ installed\'s\ dependancies
	gem list | egrep '^.*[ ]' -o | gem dependency
end
