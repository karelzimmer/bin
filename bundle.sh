#!/usr/bin/bash
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
for file; do

    # Verwerk alleen reguliere bestanden.
    if [[ ! -f $file ]]; then
        continue
    fi

    file_base=$(basename $file)

    echo "cat > $file_base << 'Einde van $file_base'"
    cat $file
    echo "Einde van $file_base"
    echo "echo $file_base uitgepakt 1>&2"
done

# afsl_script
echo '# Einde bestand.'
exit 0
