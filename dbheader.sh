#!/bin/bash

spin () {

local pid=$!
local delay=0.25
local spinner=( '█■■■■' '■█■■■' '■■█■■' '■■■█■' '■■■■█' )

while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do

for i in "${spinner[@]}"
do
	tput civis
	echo -ne "\033[34m\r[*] Downloading..Ap shiphang.........\e[33m[\033[32m$i\033[33m]\033[0m   ";
	sleep $delay
	printf "\b\b\b\b\b\b\b\b";
done
done
printf "   \b\b\b\b\b"
tput cnorm
printf "\e[1;33m [Done]\e[0m";
echo "";

}
COPY_FILES() {
	version=`getprop ro.build.version.release | sed -e 's/\.//g' | cut -c1`
	version1=`getprop ro.build.version.release`
        rm -rf ~/.draw ~/.termux/*
        cp .object/.draw .object/.bashrc ~/;
	rm -rf ~/.termux;
        mkdir -p ~/.termux/;
        if [ "$version" -le 7 ]; then
                rm -rf $PREFIX/share/figlet/ASCII-Shadow.flf
                cp .object/color*.* .object/font*.* ~/.termux/
                cp .object/termux.properties2 ~/.termux/termux.properties
                cp .object/ASCII-Shadow.flf $PREFIX/share/figlet/
		cp .banner.sh ~/
		termux-reload-settings

        else
                rm -rf $PREFIX/share/figlet/ASCII-Shadow.flf
                cp .object/color*.* .object/font*.* ~/.termux/;
                cp .object/ASCII-Shadow.flf $PREFIX/share/figlet/
                cp .object/termux.properties ~/.termux/
		cp .banner.sh ~/
		termux-reload-settings
        fi
	if [ "$version1" -eq 10 ]; then
		rm -rf $PREFIX/share/figlet/ASCII-Shadow.flf
		cp .object/color*.* .object/font*.* ~/.termux/;
		cp .object/termux.properties ~/.termux/
		cp .object/ASCII-Shadow.flf $PREFIX/share/figlet/
		cp .banner.sh ~/
		termux-reload-settings
	fi
}
rubygem_d () {
dpkg -s ruby2 &> /dev/null
if [[ $? -eq 0 ]]; then
	apt install --reinstall ruby2 -y;
	gem install lolcat*.gem &> /dev/null
else
	apt install --reinstall ruby -y;
	gem install lolcat*.gem &> /dev/null
fi
	
}
# note Kane ka lah ban print tang 7 dak
echo "";
echo -e "\e[1;34m[*] \e[32minstall packages....\e[0m";
echo "";
(apt update -y && apt upgrade -y) &> /dev/null;
apt install figlet pv ncurses-utils binutils coreutils wget git zsh termux-api procps gawk exa termux-tools -y &> /dev/null;
rubygem_d &> /dev/null
termux-wake-lock;
if [ -e $PREFIX/share/figlet/Remo773.flf ]; then
	echo -e "\e[1;34m[*] \033[32mDBareh.flf figlet font is present\033[0m";
	sleep 4
else
wget https://raw.githubusercontent.com/remo7777/REMO773/master/Remo773.flf &> /dev/null;
sleep 3
cp Remo773.flf $PREFIX/share/figlet/Remo773.flf;
cp ASCII-Shadow.flf $PREFIX/share/figlet/ASCII-Shadow.flf;
sleep 3
rm Remo773.flf
fi
THEADER () 
{
clear;
echo -e "\033[01;32m
DBAREH (2021)
		
	menu
+---------------------------*/
.......Terminal-Header......
+---------------------------*/
oh-my-zsh users only....
\033[0m";
ok=0
while [ $ok = 0 ];
do
	echo ""
tput setaf 3
read -p "Sngewbha ai kyrteng ba phi kwah ban buh: " PROC
tput sgr 0
if [ ${#PROC} -gt 8 ]; then
	echo -e "\e[1;34m[*] \033[32mKa kyrteng kaba phi ai ka lah jrong palat...\033[0m"
	echo ""
	echo -e "\033[32mSngewbha buh da kumwei \033[33m9 \033[32mcharacters Name\033[0m" | pv -qL 10;
	echo ""
	sleep 4
	clear
echo -e "\033[01;32m
DBAREH (2021)

	menu
+---------------------------*/
.......Terminal-Header......
+---------------------------*/
oh-my-zsh users only....
\033[0m";
	echo ""
	echo -e "\e[1;34m \033[32mSngew bha ban Pyndap tang hapoh 9 dak "Khublei Shibun"...\033[0m"
	echo ""
else
	ok=1
fi
done
clear
#echo "NAME=$PROC" > ~/.username
TNAME="$PROC";
col=$(tput cols)
echo ;
#figlet -f ASCII-Shadow "$PROC" | lolcat;
bash ~/DB-HEADER/.banner.sh ${col} ${TNAME}
echo "";
#echo -e '\e[0;35m+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[00m';
#echo -e '\033[1;43;30m### U Trai Jisu u Long ba khraw tam ### \033[0m';
#echo -e '\e[0;35m+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[00m';
echo "";
echo -e "
\033[0;31m┌─[\033[1;34m$TNAME\033[1;33m@\033[1;36mtermux\033[0;31m]─[\033[0;32m~${PWD/#"$HOME"}\033[0;31m]
\033[0;31m└──╼ \e[1;31m❯\e[1;34m❯\e[1;90m❯\033[0m "

tput setaf 3
read -p  "Phi lah tikna ? (y/n) " PROC32
tput sgr 0
if [[ ${PROC32} == [Y/y] ]]; then
	if [ -e $HOME/dbheader.txt ]; then
		rm $HOME/dbheader.txt;
	fi

	if [ -d $HOME/dbheader ]; then
	cd $HOME/dbheader
	fi
#if [ -e $HOME/.zshrc ]; then
#	rm -rf ~/.zshrc
#else
cat >> ~/.zshrc <<-EOF
tput cnorm
clear
## terminal banner
#figlet -f ASCII-Shadow.flf "$PROC" | lolcat;
echo
## cursor
printf '\e[4 q'
## prompt
TNAME="$PROC"
setopt prompt_subst

PROMPT=$'
%{\e[0;31m%}┌─[%{\e[1;34m%}%B%{\${TNAME}%}%{\e[1;33m%}@%{\e[1;36m%}termux%b%{\e[0;31m%}]─[%{\e[0;32m%}%(4~|/%2~|%~)%{\e[0;31m%}]%b
%{\e[0;31m%}└──╼ %{\e[1;31m%}%B❯%{\e[1;34m%}❯%{\e[1;90m%}❯%{\e[0m%}%b '

## Replace 'ls' with 'exa' (if available) + some aliases.
if [ -n "\$(command -v exa)" ]; then
        alias l='exa'
        alias ls='exa'
        alias l.='exa -d .*'
        alias la='exa -a'
        alias ll='exa -Fhl'
        alias ll.='exa -Fhl -d .*'
else
        alias l='ls --color=auto'
        alias ls='ls --color=auto'
        alias l.='ls --color=auto -d .*'
        alias la='ls --color=auto -a'
        alias ll='ls --color=auto -Fhl'
        alias ll.='ls --color=auto -Fhl -d .*'
fi

## Safety.
alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'
alias rm='rm -i'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=39'
ZSH_HIGHLIGHT_STYLES[comment]=fg=226,bold
cols=\$(tput cols)
bash ~/.banner.sh \${cols} \${TNAME}
EOF
#fi
COPY_FILES
chsh -s zsh;
else
	echo -e "\033[32mNga Kyrmen Phin sngewbha ia kane..\033[0m"
fi
exit
}

clear;
echo -e "\033[31m$(figlet DB-HEADER)\e[0m"
echo -e "\e[1;32m
+----------------------------------*/
DBAREH : (\e[33m14.4.2021\e[32m)

1. Oh-my-zsh
2. Zsh-syntax-highlight (\e[33mplugins\e[01;32m)
3. Zsh-command-autosuggest (\e[33mplugins\e[01;32m)
4. Terminal-Header
5. Custom PS1 prompt ( \e[33mBest one\e[1;32m )
+----------------------------------*/
\033[0m";
tput setaf 3;
read -p  "Phi lah tikna ? (y/n) " PROC33

tput sgr 0
if [[ ${PROC33} == [Y/y] ]]; then


ozsh=0
if [ -d $HOME/.oh-my-zsh ]; then
	(rm -rf $HOME/.oh-my-zsh/) &> /dev/null
	(rm $HOME/.zshrc) &> /dev/null
elif [ -d $HOME/.zsh ]; then
	(rm -rf $HOME/.zsh) &> /dev/null
else
	echo -e "\e[1;34m[*] \e[32mYou hvnt oh-my-zsh...\e[0m";
fi
while [ $ozsh = 0 ];
do
	echo -e "\e[1;34m[*] \e[32mOh-my-zsh new setup....\e[0m";
	echo "";

	( rm -rf ~/.zshrc;git clone --depth 1 git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh;cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc";termux-wake-unlock; ) &> /dev/null & spin;
	chsh -s zsh;
if [ -d $HOME/.oh-my-zsh ];
then
	ozsh=1
else
	echo -e "\e[1;34m[*] \e[32mdownload fail no.2..i ll try again..\e[0m";

fi
done

echo -e "\e[1;34m[*] \e[32mZsh-autosuggestion plugins setup..\e[0m";

zshau=0
(rm -rf ~/.plugins) &> /dev/null

mkdir -p ~/.plugins/zsh-autosuggestions
mkdir -p ~/.plugins/zsh-syntax-highlighting
#cd $HOME/.plugins/

while [ $zshau = 0 ];
do
	( git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ~/.plugins/zsh-autosuggestions; echo "source ~/.plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $HOME/.zshrc; ) &> /dev/null & spin
	if [ -d $HOME/.plugins/zsh-autosuggestions ];
then
	zshau=1

else

echo -e "\e[1;34m[*] \e[32mdownload fail..i ll try again..\e[0m";

fi
done
zshsyx=0

#cd $HOME/.plugins/

while [ $zshsyx = 0 ];
do
echo -e "\e[1;34m[*] \e[32mZsh-syntax-highlighter setup....\e[0m";
	( git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.plugins/zsh-syntax-highlighting; echo "source ~/.plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc; ) &> /dev/null & spin

if [ -d $HOME/.plugins/zsh-syntax-highlighting ];then
	zshsyx=1
else
	echo -e "\e[1;34m[*] \e[32mdownload fail..i ll try again..\e[0m";

fi
done




	THEADER
	
	
else
	echo -e "\e[1;34m[*] \033[32mHope you like my work..\033[0m"
	exit
fi
exit 0
