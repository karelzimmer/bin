#!/bin/bash


# Gemini AI:
# Hoe het werkt:
# De sed-magie: De opdracht sed -i -E 's/^(# SPDX-FileComment:.*)\.$/\1/' zoekt
# pecifiek naar regels die beginnen met # SPDX-FileComment: en eindigen op een
# punt (\.$).
# Hij vervangt die hele regel door alles behalve die laatste punt (\1).
# Veilig: Als een regel al geen punt aan het einde heeft, verandert sed
# helemaal niets.
# In-place: De vlag -i zorgt ervoor dat het bestand direct wordt aangepast
# (overschreven) zonder dat er tijdelijke bestanden nodig zijn.

# Controleer of er een bestand is meegegeven
if [ -z "$1" ]; then
    echo "Gebruik: $0 <bestandsnaam> of $0 ."
    exit 1
fi

# Functie om de punt te verwijderen in een specifiek bestand
remove_dot() {
    local file="$1"
    # sed zoekt naar de regel die begint met '# SPDX-FileComment:' en eindigt
    # op een punt.
    # De punt net voor het einde van de regel ($) wordt verwijderd.
    # sed -i -E 's/^(# SPDX-FileComment:.*)\.$/\1/' "$file"
    # Voor man-pagina's:
    sed -i -E 's/^(.\\"# SPDX-FileComment:.*)\.$/\1/' "$file"
}

# Als het argument een map of '.' is, verwerk dan alle bestanden
if [ "$1" == "." ]; then
    # Zoekt naar alle reguliere bestanden in de huidige map en submappen
    find . -type f | while read -r file; do
        remove_dot "$file"
    done
    echo "Punt verwijderd uit de SPDX-FileComment regels in alle bestanden."
else
    # Verwerk één specifiek bestand
    if [ -f "$1" ]; then
        remove_dot "$1"
        echo "Punt verwijderd uit $1."
    else
        echo "Fout: Bestand '$1' bestaat niet."
        exit 1
    fi
fi
