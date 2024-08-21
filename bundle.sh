#!/usr/bin/env bash
###############################################################################
# SPDX-FileComment: Bundelen van bestanden tot een shell-archief  
#
# Gebruik:   ./bundle.sh <bestand>... > BESTAND                             
#            Bundelen:  $ ./bundle *.sh > scripts.shar                      
#            Uitpakken: $ bash scripts.shar                                 
#
# SPDX-FileCopyrightText: Karel Zimmer <info@karelzimmer.nl>
# SPDX-License-Identifier: CC0-1.0
###############################################################################

# init_script
echo '# Pak dit bestand uit met bash. Voorbeeld: $ bash bestand.shar'

# verwerk
for FILE; do

    # Verwerk alleen reguliere bestanden.
    if [[ ! -f $FILE ]]; then
        continue
    fi

    FILE_base=$(basename "$FILE")

    echo "cat > $FILE_base << 'Einde van $FILE_base'"
    cat "$FILE"
    echo "Einde van $FILE_base"
    echo "echo $FILE_base uitgepakt 1>&2"
done

# afsl_script
echo '# Einde bestand.'
exit 0
