# puppet
Example of a first puppet module for new kids on the block. Basic things, install package, install new shell, change shell on user and modify .zshrc for fancy prompt with a ticker... Because I'm cool :-)

stest - is a simple speed test I use for each provider just to see how they stack up with others. Notheing fancy but it does the job.

<code>
#!/bin/bash    
curl -s  https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
</code>

example of .zshrc just add it at the end of your file 

<code>
setopt PROMPT_SUBST
PROMPT='[%n@%m%f%F{yellow}(%D{%k:%M:%S})%f]:${${(%):-%~}}$ %b'
TMOUT=1

TRAPALRM() {
    zle reset-prompt
}

case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%m \a"}
        ;;
esac

alias ws='sudo netstat -pant4'

echo
fortune -a
echo
</code>

Yeah man, you read that right, bring the fortunes back... I miss slackware :-)
