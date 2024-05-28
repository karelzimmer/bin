# This module provides global variables and functions.
#
# shellcheck shell=bash source=/dev/null disable=SC2034
###############################################################################
# SPDX-FileComment: Common module for bin Bourne-Again shell scripts
#
# SPDX-FileCopyrightText: Karel Zimmer <info@karelzimmer.nl>
# SPDX-License-Identifier: CC0-1.0
###############################################################################
set -o errexit
set -o nounset

readonly NORMAL='\033[0m'
readonly GREEN='\033[1;32m'
readonly BOLD='\033[1m'
