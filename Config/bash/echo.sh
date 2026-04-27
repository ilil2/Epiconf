#!/bin/sh

if [ "$EPICONF_ASCII" == "enable" ] || [ ! -f "$FLAG_FILE" ]; then
	echo ''
	echo -e '\e[0;34m  /$$$$$$$$           /$$  /$$$$$$                       /$$$$$$ '
	echo ' | $$_____/          |__/ /$$__  $$                     /$$__  $$'
	echo ' | $$        /$$$$$$  /$$| $$  \__/  /$$$$$$  /$$$$$$$ | $$  \__/'
	echo ' | $$$$$    /$$__  $$| $$| $$       /$$__  $$| $$__  $$| $$$$    '
	echo ' | $$__/   | $$  \ $$| $$| $$      | $$  \ $$| $$  \ $$| $$_/    '
	echo ' | $$      | $$  | $$| $$| $$    $$| $$  | $$| $$  | $$| $$      '
	echo ' | $$$$$$$$| $$$$$$$/| $$|  $$$$$$/|  $$$$$$/| $$  | $$| $$      '
	echo ' |________/| $$____/ |__/ \______/  \______/ |__/  |__/|__/      '
	echo '           | $$                                                  '
	echo '           | $$                                                  '
	echo '           |__/                                                  '
	echo ''
	echo -e ' by \e]8;;https://github.com/Darkrentin\e\\\e[4mDarkrentin\e[0m\e]8;;\e\\\e[0;34m, \e]8;;https://github.com/ilil2\e\\\e[4milil2\e[0m\e]8;;\e\\\e[0;34m, \e]8;;https://github.com/Narth42\e\\\e[4mNarth42\e[0m\e]8;;\e\\\e[0;34m, \e]8;;https://github.com/Otto303\e\\\e[4mOtto303\e[0m\e]8;;\e\\'
	echo ''
fi

if [ ! -f "$FLAG_FILE" ]; then
	echo -e ' \033[31mWrite "epiconf" for config help\033[0m'
	echo ''
	touch $FLAG_FILE
fi
