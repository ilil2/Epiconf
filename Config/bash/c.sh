#!/bin/sh

alias gcw="gcc -std=c99 -pedantic -Werror -Wall -Wextra -Wvla"
alias cf="clang-format -i"
alias cfe='function _cfe() {
	here=$(pwd)
	cd $(git rev-parse --show-toplevel)
	cp ~/afs/.confs/epiconf/.clang-format ./
	clang-format-epita
	rm .clang-format
	cd $here
}; _cfe'

alias lc='_lc() {
mkdir -p coverage
gcc -std=c99 -pedantic -Werror -Wall -Wextra -Wvla $@ -fPIC -coverage -lgcov -lcriterion
./a.out
lcov --capture --directory ./ --output-file coverage.info --ignore-errors empty --ignore-errors inconsistent
genhtml coverage.info --output-directory coverage
rm *.gcno *.gcda coverage.info a.out
firefox coverage/index.html
}; _lc'
