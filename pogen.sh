#!/bin/bash
set -o errexit
set -o nounset

# pogen.sh: generate .pot and merge with existing .po for Shell scripts

cd ~/kz-scripts/usr/bin
xgettext --language=Shell --join-existing --no-location --output=kz.pot "$1"
msgmerge --update --backup=none --previous --no-location ../share/locale/nl/LC_MESSAGES/kz.po kz.pot
