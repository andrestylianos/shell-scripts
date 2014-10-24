#!/bin/bash

BASEDIR=$(dirname $0)
#sudo apt update
#sudo apt upgrade
echo $BASEDIR
echo "Habilitando apt completion. Confirma?(S/N)"
read confirm
if [[ "$confirm" == "S" || "$confirm" == "s" ]]; then
	if [ ! -f $BASEDIR/apt ]
	then
		echo "Arquivo apt completion não encontrado"
	else
		echo "Habilitando..."
		sudo cp $BASEDIR/apt /usr/share/bash-completion/completions/
	fi
fi
echo "Instalando vlc mirage guake unity-tweak-tool. Confirma?(S/N)"
read confirm
if [[ "$confirm" == "S" || "$confirm" == "s" ]]; then
	sudo apt install vlc mirage guake unity-tweak-tool
fi
echo "Instalando Java openjdk versao 7. Confirma?(S/N)"
read confirm
if [[ "$confirm" == "S" || "$confirm" == "s" ]]; then
	sudo apt install openjdk-7-jdk
fi
echo "Criando launcher para eclipse. Confirma?(S/N)"
read confirm
if [[ "$confirm" == "S" || "$confirm" == "s" ]]; then
	if [ ! -f $BASEDIR/eclipse.desktop ]
	then
		echo "Arquivo eclipse.desktop completion não encontrado"
	else
		echo "Criando launcher..."
		sudo cp $BASEDIR/eclipse.desktop /usr/share/applications/
	fi
fi
echo "Instalando ppa-purge. Confirma?(S/N)"
read confirm
if [[ "$confirm" == "S" || "$confirm" == "s" ]]; then
	sudo apt install ppa-purge
fi
echo "Instalando ambiente latex. Confirma?(S/N)"
read confirma
if [[ "$confirm" == "S" || "$confirm" == "s" ]]; then
	sudo apt install texlive-base texlive-publishers texlive-lang-portuguese texlive-latex-extra texlive-fonts-recommended texlive-extra-utils latexila
fi
echo "Adicionando repositórios e instalando Atom Editor e Popcorn Time. Confirma?(S/N)"
read confirma
if [[ "$confirm" == "S" || "$confirm" == "s" ]]; then
	sudo add-apt-repository -y ppa:webupd8team/atom
	sudo add-apt-repository -y ppa:webupd8team/popcorntime
	sudo apt update
	sudo apt install atom popcorn-time
fi