# Enable colors and change prompt:
 autoload -U colors && colors	# Load colors
 PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
 setopt autocd		# Automatically cd into typed directory.
 stty stop undef		# Disable ctrl-s to freeze terminal.
 setopt interactive_comments

# History in cache directory:
 HISTSIZE=10000000
 SAVEHIST=10000000
 HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# Basic auto/tab complete:
 autoload -U compinit
 zstyle ':completion:*' menu select
 zmodload zsh/complist
 compinit
 _comp_options+=(globdots)		# Include hidden files.

 bindkey -v
 export KEYTIMEOUT=1

 # Use vim keys in tab complete menu:
 bindkey -M menuselect 'h' vi-backward-char
 bindkey -M menuselect 'k' vi-up-line-or-history
 bindkey -M menuselect 'l' vi-forward-char
 bindkey -M menuselect 'j' vi-down-line-or-history
 bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
 function zle-keymap-select () {
     case $KEYMAP in
             vicmd) echo -ne '\e[1 q';;      # block
                     viins|main) echo -ne '\e[5 q';; # beam
                         esac
                         }
                         zle -N zle-keymap-select
                         zle-line-init() {
                             zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
                                 echo -ne "\e[5 q"
                                 }
                                 zle -N zle-line-init
                                 echo -ne '\e[5 q' # Use beam shape cursor on startup.
                                 preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.
#echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

#Aliases
alias up='sudo nala update && sudo nala upgrade -y'
alias v='vim'
alias nv='nvim'
alias gc='git clone'
export PATH=$PATH:/home/kimp/.spicetify
source /home/kimp/.config/st/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

pfetch
