# puppet
Example of a first puppet module for new kids on the block. Just create the module skeleton with "puppet module generate module_name" and edit init.pp in ...modules/module_name/manifests/init.pp. Basic things, install package, install new shell, change shell on user and modify .zshrc for fancy prompt with a ticker... Because I'm cool zsh guy :-) (zeeshell me)

stest - is a simple speed test I use for each provider just to see how they stack up with others. Nothing fancy but it does the job.

```
#!/bin/bash    
curl -s  https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
```

example of .zshrc just add it at the end of your file 

```
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
```

Yeah man, you read that right, bring the fortunes back... I miss slackware :-)
Oh and also a my private alias ws (as in "wassup?") it simple shows you who/what is connected and who/what is listening, comes handy just two keystrokes, got inspired by ll from redhat :-)
