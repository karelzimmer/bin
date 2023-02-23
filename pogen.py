#!/bin/bash
set -o errexit
set -o nounset

# pogen.py: generate .pot and merge with existing .po for Python scripts

cd ~/kz-scripts/usr/bin
xgettext --language=Python --join-existing --no-location --output=kz.pot "$1"
msgmerge --update --backup=none --previous --no-location ../share/locale/nl/LC_MESSAGES/kz.po kz.pot
