#!/bin/bash

# acquisition des variables de .env
set -a # automatically export all variables
source ../.env
set +a

TEMPLATE_DIR="../templates"
ROOT_DIR="../"
ENVSUBST_PATH="/bin/envsubst" # le chemin de la commande envsubst (?)

render(){
  $ENVSUBST_PATH < "$1" > "$2"
}

# Fonction récursive pour parcourir les fichiers et dossiers
traverse_files() {
    local path="$1"
    local base_dir="$2"

    for entry in "$path"/*; do
        if [ -f "$entry" ]; then
            # Vérifier si le fichier a l'extension ".template"
            if [[ "$entry" == *.template ]]; then
                # On détermine les chemins (template et fichier de sortie)

                local relative_path="${entry#$base_dir/}"
                local OUTPUT_PATH="$ROOT_DIR${relative_path%.template}"
                local TEMPLATE_PATH="$base_dir/${relative_path}"

                # On 'rend' le template avec les variables d'environnement
                render "$TEMPLATE_PATH" "$OUTPUT_PATH"

            fi
        elif [ -d "$entry" ]; then
            # Appel récursif pour parcourir les sous-dossiers
            traverse_files "$entry" "$base_dir"
        fi
    done
}

# Appel de la fonction pour parcourir les fichiers et dossiers
traverse_files $TEMPLATE_DIR $TEMPLATE_DIR