export WORKON_HOME=${HOME}/.VirtualEnv/
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
elif [ -f /usr/bin/virtualenvwrapper.sh ]; then
    source /usr/bin/virtualenvwrapper.sh
fi

# Add nano as default editor
export EDITOR=nano

alias ls='ls --color=auto'
[ ! "$UID" = "0" ] && archey3 -c blue
[  "$UID" = "0" ] &&  archey3 -c red
# Alias

alias instalar='yaourt -S'
alias actualizar='yaourt -Syyua --devel'
alias remover='sudo pacman -Rns'
alias matar='sudo killall'
alias heroku='/usr/bin/heroku'
alias rcc="rcc-qt4"
export CLASSPATH="/usr/share/java/antlr4/antlr-4.1-complete.jar:$CLASSPATH"


export CDPATH=/media/ernest/Datos
alias heroku=/usr/local/heroku/bin/heroku

#Funtion PS1
function empty
{
    local var="$1"

    # Return true if:
    # 1.    var is a null string ("" as empty string)
    # 2.    a non set variable is passed
    # 3.    a declared variable or array but without a value is passed
    # 4.    an empty array is passed
    if test -z "$var"
    then
        [[ $( echo "1" ) ]]
        return

    # Return true if var is zero (0 as an integer or "0" as a string)
    elif [ "$var" == 0 2> /dev/null ]
    then
        [[ $( echo "1" ) ]]
        return

    # Return true if var is 0.0 (0 as a float)
    elif [ "$var" == 0.0 2> /dev/null ]
    then
        [[ $( echo "1" ) ]]
        return
    fi

    [[ $( echo "" ) ]]
}

function columns
{
	var=66

	if empty "${COLUMNS}"
    then
		s=$(printf "%*s" $var)
	else
	  s=$(printf "%*s" $(expr $COLUMNS - 20 ) )
	fi
	echo ${s// /―}
	return		
}


function git_status_branch {
    
	local git_status="$(git status 2> /dev/null)"

    if ! [[ "$git_status" == "" ]]; then
		if [[ "$git_status" =~ "Changes to be committed" ]]; then
	      local status+="\[\e[01;32m\]*\[\e[0m\]"
        fi
	    if [[ "$git_status" =~ "Changes not staged for commit" ]]; then
	      local status+="\[\e[00;33m\]+\[\e[0m\]"
        fi
	    if [[ "$git_status" =~ "Untracked files" ]]; then
	      local status+="\[\e[01;31m\]-\[\e[0m\]"
        fi
	local branch="`git describe --all --contains --abbrev=4 HEAD 2> /dev/null`"
	 echo '['"$branch""$status"']'
      fi

    
}


#PS1="\[\e[00;34m\]┌─[\[\e[01;34m\u\e[00;34m\]]──[\[\e[01;34m\]${HOSTNAME%%.*}\[\e[00;34m\]]:\w$\[\e[01;34m\]\n\[\e[01;34m\]└──\[\e[00;34m\]>>\[\e[0m\]"
function gi() { curl http://www.gitignore.io/api/$@ ;}
function _prompt_command() {
 PS1="\[\e[00;34m\][\[\e[0m\]\[\e[01;37m\] \u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[01;37m\]\h\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[01;37m\]]\[\e[0m\]\[\e[00;37m\]\[\e[0m\]\[\e[00;34m\]\$(columns)\n\[\e[0m\]\[\e[01;37m\][\w\[\e[0m\] ""`git_status_branch`"" \[\e[00;34m\]]\[\e[00;37m\]\\$\[\e[0m\]\[\e[00;34m\]>\[\e[0m\]" 

}
PROMPT_COMMAND=_prompt_command





export PATH="$PATH:$HOME/.rvm/bin" #
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

