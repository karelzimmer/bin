#!/usr/bin/env bash
# shellcheck shell=bash
# #############################################################################
# SPDX-FileComment: Rapporteer bestanden wel in source maar niet in target
#
# SPDX-FileCopyrightText: Karel Zimmer <info@karelzimmer.nl>
# SPDX-License-Identifier: CC0-1.0
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
    local source_files_missing=$HOME/source_files_missing.txt
    local source_files=$HOME/source_files.txt
    local target_files=$HOME/target_files.txt

    if ! [[ -n "$source" && -n "$target" ]]; then
        echo "Gebruik: $0 <source> <target>"
        exit 1
    elif ! [[ -d "$source" && -d "$target" ]]; then
        [[ -d "$source" ]] || echo "Source '$source' is geen map."
        [[ -d "$target" ]] || echo "Target '$target' is geen map."
        exit 1
    fi

    echo "Maak lijst van bestanden in source '$source'..."
    find "$source" -type f > "$source_files"
    echo "Maak lijst van bestanden in target '$target'..."
    find "$target" -type f > "$target_files"

    echo "Source: $source"  >  "$source_files_missing"
    echo "Target: $target"  >> "$source_files_missing"
    echo ''                 >> "$source_files_missing"

    echo "Zoek source-bestanden op in target..."
    while read -r source_file; do
        source_filename=$(basename "$source_file")
        if ! grep --fixed-strings --quiet "$source_filename" "$target_files"
        then
            echo "Bestand niet in target: $source_file" |
                tee --append "$source_files_missing"
        fi
    done < "$source_files"
    less "$source_files_missing"
    echo "Output staan in: $source_files_missing"
    echo 'Klaar!'
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
