export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/var/lib/flatpak/exports/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin:/var/lib/snapd/snap/bin:/var/lib/snapd/snap/bin:/var/lib/snapd/snap/bin
export JAVA_HOME=/opt/jdk-XX.X.X
export PATH=$JAVA_HOME/bin:$PATH
export PATH="/usr/share/dotnet:$PATH"

alias update='source ~/.bashrc'
alias backup='~/backup.sh'

alias cd='z'
alias cdi='zi'

alias md="mkdir"
alias ls="lsd"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias home='cd ~'
alias back='cd -'

alias ll='ls -lh'
alias la='ls -lha'
alias l='ls -CF'
alias tree='ls -R | grep ":$" | sed -e "s/:$//" -e "s/[^-][^\/]*\//|   /g" -e "s/| *\([^| ]\)/+--- \1/"'

alias mkdir='mkdir -p'  # Create parent directories as needed

alias df='df -h'
alias du='du -h --max-depth=1'

alias ping='ping -c 5'
alias ports='netstat -tulanp'
alias myip='curl ifconfig.me'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias :q='exit'
alias :qa='exit'

fastfetch

eval "$(starship init bash)"
eval "$(zoxide init bash)"

