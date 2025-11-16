# .bashrc

force_color_prompt=yes

PS1="# "
#PS1="\W > "
#PS1='\[\033[01;37m\]\w\[\033[01;37m\] \[\033[00;31m\]> \[\033[00m\]'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

#source ~/aliases

alias v='vim'
alias t='tmux'
alias l='ls -1a'
alias b='bc -q'
alias s='watch -n 1 sensors'
alias c='clear'
alias gif='sxiv -a'
alias ff='ffprobe -hide_banner'
alias xdo='xdotool selectwindow getwindowgeometry'
