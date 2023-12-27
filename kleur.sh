#! /usr/bin/env bash

RED="31"
GREEN="32"
BOLDGREEN="\e[1;${GREEN}m"
ITALICRED="\e[3;${RED}m"
ENDCOLOR="\e[0m"

echo -e "${BOLDGREEN}Behold! Bold, green text.${ENDCOLOR}"
echo -e "${ITALICRED}Italian italics${ENDCOLOR}"
echo -e "${ITALICRED}\e[4mItalian italics underlined${ENDCOLOR}"
echo -e "${ITALICRED}\e[4mItalian italics underlined${ENDCOLOR}"
echo -e "${ITALICRED}\e[2mItalian italics faint${ENDCOLOR}"
echo -e "${ITALICRED}\e[5mItalian italics blink${ENDCOLOR}"
echo -e "${ITALICRED}\e[7mItalian italics reverse${ENDCOLOR}"
echo -e "${ITALICRED}\e[8mItalian italics hidden${ENDCOLOR}"
