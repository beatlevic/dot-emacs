export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export LANG=nl_NL.UTF-8
export LC_CTYPE=nl_NL.UTF-8

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] /'
}

export PS1="\h:\u \[\033[32m\]\$(parse_git_branch)\[\033[00m\]\w$ "
