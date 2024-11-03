# This module provides access to global constants and functions.
#
# shellcheck shell=bash source=/dev/null disable=SC2034
###############################################################################
# SPDX-FileComment: Common module for Bourne-Again shell scripts
#
# SPDX-FileCopyrightText: Karel Zimmer <info@karelzimmer.nl>
# SPDX-License-Identifier: CC0-1.0
###############################################################################
export TEXTDOMAIN=kz
export TEXTDOMAINDIR=/usr/share/locale
source /usr/bin/gettext.sh

set -o errexit
set -o nounset

# List NORMAL last here so that -x doesn't bork the display.
declare RED='\033[1;31m'
declare BOLD='\033[1m'
declare NORMAL='\033[0m'
