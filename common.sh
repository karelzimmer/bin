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


###############################################################################
# Functions
###############################################################################

# This function performs initial actions.
function init_script() {

    # Script-hardening.
    set -o errexit
    set -o errtrace
    set -o nounset
    set -o pipefail

    # Trap exit signal.
    trap 'exit $?' EXIT
}
