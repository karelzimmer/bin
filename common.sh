# This module provides access to global constants and functions.
#
# shellcheck shell=bash source=/dev/null disable=SC2034
###############################################################################
# SPDX-FileComment: Common module for Bourne-Again shell scripts
#
# SPDX-FileCopyrightText: Karel Zimmer <info@karelzimmer.nl>
# SPDX-License-Identifier: CC0-1.0
###############################################################################


###############################################################################
# Imports
###############################################################################
export TEXTDOMAIN=kz
export TEXTDOMAINDIR=/usr/share/locale
source /usr/bin/gettext.sh

set -o errexit
set -o nounset


###############################################################################
# Constants
###############################################################################

# List NORMAL last here so that -x doesn't bork the display.
readonly RED='\033[1;31m'
readonly BOLD='\033[1m'
readonly NORMAL='\033[0m'


###############################################################################
# Functions
###############################################################################

# This function performs initial actions.
function init_script() {
    trap 'exit $?' EXIT
}
