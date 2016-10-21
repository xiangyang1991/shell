# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin



export GOROOT=/home/golang/.go
goPATH=/home/golang/golang
GOPATH=$goPATH/project
GOPATH=$GOPATH:$goPATH/project1
GOPATH=$GOPATH:$goPATH/project2


export GOPATH




PATH=$PATH:$GOROOT/bin:$GOPATH
export PATH
