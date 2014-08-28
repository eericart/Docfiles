 #CD
alias ..="cd .."
alias ...="cd ../.."
alias -="cd -"
alias ....="cd ../../.."
alias .....="cd ../../../.."

# git
alias g git
alias ga='git add .'
alias gs='git status'
alias gl="git log --graph --pretty=format:'%C(yellow)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset' --abbrev-commit --date=short"
alias gaa='git add -p '
alias gca='git commit -v -a'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'

make_completion g  'git'
make_completion gaa  'git add -p'
make_completion gb 'git branch'
make_completion gco 'git checkout'
make_completion gca 'git commit -v -a'

#rails
alias rs='rails server'
alias rc='rails console'

# ArchLinux alias
alias + "sudo -E"
alias p "+ pacman"
alias y "yaourt"
alias yup "y -Syua"
alias yupd "y -Syyua --devel"
alias yr "y -Rscd"
alias yi "y -S"
alias ys "y -Ss"
alias sd "+ shutdown -h now"
alias rb "+ reboot"
alias rmr "rm -rf"
alias srmr "+ rm -rf"
alias mkdir "mkdir -vp"
alias sc "sudo systemctl"
alias scu "systemctl --user"

make_completion + "sudo -E"
make_completion p "sudo pacman"
make_completion y "yaourt"
make_completion rmr "rm -rf"
make_completion mkdir "mkdir -vp"
make_completion sc 'systemctl'
make_completion scu 'systemctl --user'