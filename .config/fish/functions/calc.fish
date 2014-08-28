#See https://github.com/jwiklund/fish.config/blob/07ea02357bebb67324045c69e7e44132d3194b5d/functions/calc.fish
function calc
	python -c "from math import * ; print($argv)"
end
