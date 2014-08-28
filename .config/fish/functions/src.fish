#See https://github.com/jsatk/dotfiles/blob/3ad8eda78d20051af716ae9aec5ffafcb21de2d2/functions/src.fish
function src --description 'Reload your Fish config'
  source ~/.config/fish/config.fish; and clear
end
