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

# shellcheck disable=SC2089
# shellcheck disable=SC2016
BODY='{
  "affiliation": "submission-service",
  "email": "'$NSS_DSW_USER'",
  "firstName": "submission",
  "lastName": "service",
  "password": "'$NSS_DSW_PASSWORD'",
  "role": "admin"
}'

URL_USER=http://localhost:$API_PORT/users
curl --request POST -sL \
           --url "$URL_USER"\
           -H "Content-Type: application/json"\
           -H "Authorization: $TOKEN"\
           -d $BODY > /dev/null