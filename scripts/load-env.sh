set -a # automatically export all variables
source ../.env
set +a

envsubst < ../config/application.yml.template > ../config/application.yml