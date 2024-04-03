#!/usr/bin/bash
###############################################################################
# Maak 100 subdirs aan met ieder 26 lege bestanden
#
# Ref. The Linux Command Line, William E. Scchotts, Jr., p.226 e.v.
#
# SPDX-FileCopyrightText: Karel Zimmer <info@karelzimmer.nl>
# SPDX-License-Identifier: CC0-1.0
###############################################################################

mkdir -p playground/dir-{00{1..9},0{10..99},100}
touch playground/dir-{00{1..9},0{10..99},100}/file-{A..Z}

