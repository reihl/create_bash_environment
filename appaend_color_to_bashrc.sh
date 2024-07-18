FILENAME=${HOME}/.bashrc
if [ -f $FILENAME ]; then
	if ! grep -Fq 'color generate by script' $FILENAME; then
		echo "## color generate by script ##">> $FILENAME
                echo '_RED=$(tput setaf 1)'>> $FILENAME
		echo '_GREEN=$(tput setaf 2)'>> $FILENAME 
                echo '_YELLOW=$(tput setaf 3)'>> $FILENAME
                echo '_BLUE=$(tput setaf 4)'>> $FILENAME
                echo '_MAGENTA=$(tput setaf 5)'>> $FILENAME
                echo '_CYAN=$(tput setaf 6)'>> $FILENAME
                echo '_RESET=$(tput sgr0)'>> $FILENAME
                echo '_BOLD=$(tput bold)'>> $FILENAME
                echo 'export PS1="[${_RED}\u${_CYAN}@${_BLUE}\h${_MAGENTA} \W${_RESET}]${_BOLD}#${_RESET}"'>> $FILENAME
	        echo 'export GPG_TTY=$(tty)'>> $FILENAME
	fi
fi
