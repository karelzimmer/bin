# shellcheck shell=bash source=/dev/null disable=SC2034
# #############################################################################
# SPDX-FileComment: Common module for personal Bash scripts
#
# SPDX-FileCopyrightText: Karel Zimmer <info@karelzimmer.nl>
# SPDX-License-Identifier: CC0-1.0
# #############################################################################

# Script-hardening.
set -o errexit
set -o errtrace
set -o nounset
set -o pipefail

# Trap exit signal.
trap 'exit $?' EXIT

# List NORMAL last here so that debugging (-vx) doesn't bork the display.
readonly BOLD='\033[1m'
readonly GREEN=$BOLD'\033[32m'
readonly RED=$BOLD'\033[31m'
readonly NORMAL='\033[0m'

# Where the the code is stored locally.
readonly ORIGIN=$HOME
