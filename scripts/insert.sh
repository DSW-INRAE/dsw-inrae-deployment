# insertion des KM dans l'application
dossierKM="../resources/knowledge-models"
dossierTemplates="../resources/document-templates"

source ../.env
DSW_USERNAME=albert.einstein@example.com
DSW_PASSWORD=password

#récupération du token d'identification
URL_TOKEN=http://localhost:$API_PORT/tokens
BODY_TOKEN=\{\"email\":\"$DSW_USERNAME\",\"password\":\"$DSW_PASSWORD\"\}
TOKEN=$(curl --request POST -sL \
     --url $URL_TOKEN\
     -H "Content-Type: application/json"\
     -d $BODY_TOKEN\
      | jq '.token')
TOKEN=Bearer\ "${TOKEN//\"}"

# import des KM
for fichier in "$dossierKM"/*; do
    if [[ -f "$fichier" && "$fichier" == *.km ]]; then
      # j'importe le KM
      URL_IMPORT=http://localhost:$API_PORT/packages
      curl --request POST -sL \
           --url "$URL_IMPORT"\
           -H "Content-Type: application/json"\
           -H "Authorization: $TOKEN"\
           -d @"$fichier" > /dev/null
    fi
done

# import des templates
for fichier in "$dossierTemplates"/*; do
    if [[ -f "$fichier" && "$fichier" == *.zip ]]; then
      # j'importe le template
      URL_IMPORT=http://localhost:$API_PORT/document-templates/bundle
      curl --request POST -sL \
           --url "$URL_IMPORT"\
           -H "Content-Type: multipart/form-data"\
           -H "Authorization: $TOKEN"\
           -F "file=@\"$fichier\""\
           --compressed > /dev/null
    fi
done
