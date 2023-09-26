#            `osssssssssssssssssssso`          
#           .osssssssssssssssssssssso.         
#          .+oooooooooooooooooooooooo+.        
#                                              
#                                              
#      `::::::::::::::::::::::.         .:`    
#     `+ssssssssssssssssss+:.`     `.:+ssso`   
#    .ossssssssssssssso/.       `-+ossssssso.  
#    ssssssssssssso/-`      `-/osssssssssssss  
#    .ossssssso/-`      .-/ossssssssssssssso.  
#     `+sss+:.      `.:+ssssssssssssssssss+`   
#      `:.         .::::::::::::::::::::::`    
#                                              
#                                              
#          .+oooooooooooooooooooooooo+.        
#           -osssssssssssssssssssssso-         
#            `osssssssssssssssssssso`          

setopt autocd                # change directory just by typing its name
setopt interactivecomments   # allow comments in interactive mode
setopt magicequalsubst       # enable filename expansion for arguments of the form ‘anything=expression’
setopt notify                # report the status of background jobs immediately
setopt numericglobsort       # sort filenames numerically when it makes sense
setopt promptsubst           # enable command substitution in prompt
setopt hist_ignore_all_dups  # don't save duplicate commands in the ~/.zsh_history

WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

# hide EOL sign ('%')
PROMPT_EOL_MARK=""

# auto/tab completion features
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Configure key keybindings
bindkey -v                      # vim key bindings # -e for emacs
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shapes(pipe and block) for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# override default virtualenv indicator in prompt
VIRTUAL_ENV_DISABLE_PROMPT=1
venv_info() {
    [ $VIRTUAL_ENV ] && echo "(%B%F{reset}$(basename $VIRTUAL_ENV)%b%F{%(#.blue.green)})"
}

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PROMPT=$'\n%F{%(#.blue.green)}┌──$(git_branch)$(venv_info)(%B%F{%(#.red.blue)}%n%(#.💀.㉿)%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
RPROMPT=$'%(?.. %? %F{red}%B⨯%b%F{reset})%(1j. %j %F{yellow}%B⚙%b%F{reset}.)'

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    TERM_TITLE=$'\e]0;%n@%m: %~\a'
    ;;
*)
    ;;
esac

precmd() {
    # below code automatically stores the nessesery flags for c/c++ files to compile according to the current folder
    # so that whenever i run a c++ file i only have to do; `g++ ./file.cc `echo $FLAGS_TO_USE``; # so i don't have to worry about passing the nessesory flags.
    if [[ "$PWD" == "$cvdir/OpenCV CC" ]]; then
        export FLAGS_TO_USE="$(pkg-config --cflags --libs opencv4 mylib)"
    elif [[ "$PWD" == "~/Desktop/Coding/GTK/C++" ]]; then
        export FLAGS_TO_USE="$(pkg-config --cflags --libs gtkmm-3.0)"
    else
        export FLAGS_TO_USE=""
    fi

    # update the terminal title
    print -Pnr -- "$TERM_TITLE";
}

export TF_CPP_MIN_LOG_LEVEL="3" # to not show the tensorflow import logs
export LD_LIBRARY_PATH="/usr/lib/mylib/lib:$LD_LIBRARY_PATH"

# https://github.com/hashbang/shell-etc/blob/master/zsh_command_not_found
source ~/.zsh/zsh_command_not_found

# https://github.com/zsh-users/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'

# https://github.com/zsh-users/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
# ZSH_HIGHLIGHT_STYLES[global-alias]=fg=magenta
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[path]=underline
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[command-substitution]=none
# ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta
ZSH_HIGHLIGHT_STYLES[process-substitution]=none
# ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta
# ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=magenta
# ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=magenta
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
# ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
# ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta
# ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta
# ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta
ZSH_HIGHLIGHT_STYLES[assign]=none
ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
ZSH_HIGHLIGHT_STYLES[named-fd]=none
ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
# ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout


# i installed nvm by
# >>> curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
# which was to update the nodejs version, i did that by
# >>> nvm install 16.18.0
# >>> nvm use 16.18.0

# to uninstall nvm do the following
# >>> nvm use system
# >>> npm uninstall -g a_module

# below codes is for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# some aliases
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

alias history="history 0"
alias ll='ls -al'
alias la='ls -A'
alias l='ls -CF'

alias nv=nvim
alias rm=trash
alias cls=clear

alias configzsh='nvim ~/.zshrc'
alias confignv='nvim ~/.config/nvim/init.vim'


export pydir='/home/rohit/Desktop/Coding/PYTHON'
alias pydir='$pydir'
export mldir='/home/rohit/Desktop/Machine_Learning'
alias mldir='$mldir'
export cvdir='/home/rohit/Desktop/Machine_Learning/Computer_Vision'
alias cvdir='$cvdir'
export cdir='/home/rohit/Desktop/Coding/C'
alias cdir='$cdir'
export ccdir='/home/rohit/Desktop/Coding/CC'
alias ccdir='$ccdir'
export ccmylibdir='/usr/lib/mylib'
alias ccmylibdir='$ccmylibdir'
export pymylibdir='/home/rohit/Desktop/Coding/PYTHON/MyLib'
alias pymylibdir='$pymylibdir'

