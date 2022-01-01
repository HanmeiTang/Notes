# begin .bash_profile

# Path for Python applications
export PATH="/Users/hanmeiTang/miniconda3/bin:${PATH}"
export PATH=/Users/hanmeiTang/bin/mongodb/bin:$PATH
export PATH=/Users/hanmeiTang/bin:$PATH
export PATH=/Users/hanmeiTang/bin/intltool-0.50.2/bin:$PATH
export PATH=/Users/hanmeiTang/.local/bin:$PATH

# Add a customer python package to PYTHONPATH
export PYTHONPATH=/Users/hanmeiTang/repos/some_repo/some_package:$PYTHONPATH

# System variables
export HISTSIZE=2000                       # Default 500
export HISTFILESIZE=2000                   # Default 500
export HISTTIMEFORMAT='%b %d %I:%M %p '    # Using strftime format
export HISTCONTROL=ignoreboth              # Ignoredups:ignorespace
export HISTIGNORE="history:pwd:exit:df:ls:ls:ls -la:ll"
#export GREP_COLOR="31;47"

# A trick to fix jupyter notebook error
export BROWSER=open

# Set color for system alias
alias grep='grep --color=auto'  # always, auto, never
alias zgrep='zgrep --color=auto' # always, auto, never
alias gerp='grep'
alias grpe='grep'
alias ls="ls -G"
alias ll='ls -alhG'
alias la='ls -A'
alias l='ls -CF'
alias sl='ls -G'
alias mkdir='mkdir -p'
alias unmute="osascript -e 'set volume output muted false'"
alias mute="osascript -e 'set volume output muted true'"
alias ..='cd ..'
alias ...='cd ../..'
alias dir='ls -l'
alias iv='vi'

# Git auto-completion and prompt modification
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
    # Modify prompt string, which needs git bash.
    parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    }

    export PS1="[Mac] \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
fi

# end .bash_profile
