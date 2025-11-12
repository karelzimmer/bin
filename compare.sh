#!/usr/bin/env bash
# shellcheck shell=bash
# #############################################################################
# SPDX-FileComment: Rapporteer missende bestanden in target
#
# SPDX-FileCopyrightText: Karel Zimmer <info@karelzimmer.nl>
# SPDX-License-Identifier: CC0-1.0
# #############################################################################


# #############################################################################
# Imports
# #############################################################################


# #############################################################################
# Constants
# #############################################################################


# #############################################################################
# Globals
# #############################################################################


# #############################################################################
# Functions
# #############################################################################

# This function performs initial actions.
function init() {
    # Script-hardening.
    set -o errexit
    set -o errtrace
    set -o nounset
    set -o pipefail
}


# This function performs the script actions.
function process() {
    local source=${1:-}
    local target=${2:-}
    local source_filename=''
    local source_files_missing=/tmp/source_files_missing.txt
    local source_files=/tmp/source_files.txt
    local target_files=/tmp/target_files.txt

    if [[ -z "$source" || -z "$target" ]]; then
        echo "Gebruik: $0 <source> <target>"
        exit 1
    fi

    echo "Maak lijst van bestanden in source '$source'..." |
        tee "$source_files_missing"
    find "$source" -type f > "$source_files"
    echo "Maak lijst van bestanden in target '$target'..." |
        tee --append "$source_files_missing"
    find "$target" -type f > "$target_files"

    echo "Zoek source-bestanden op in target..."
    while read -r source_file; do
        source_filename=$(basename "$source_file")
        if ! grep --fixed-strings --quiet "$source_filename" "$target_files"
        then
            echo "Bestand niet in target: $source_file" |
                tee --append "$source_files_missing"
        fi
    done < "$source_files"
    echo 'Klaar!' |
        tee --append "$source_files_missing"
    less "$source_files_missing"
    echo "Output staan in: $source_files_missing"
}


# This function controls the termination of the script.
function term() {
    exit 0
}


# #############################################################################
# Main
# #############################################################################

function main() {
    init    "$@"
    process "$@"
    term
}

main "$@"
