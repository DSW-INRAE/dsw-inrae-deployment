# dsw-inrae-deployment

## Scripts

Les scripts doivent être exécutés depuis ``/script``.

### [`load-env.sh`](scripts/load-env.sh)

Remplace les clés de tous les fichiers situés dans ```/templates```
avec kes valeurs correspondantes précisées dans ```/.env```. Les fichiers de sortie
respectent la même arborescence que dans le dossier d'origine à partir de la racine.

Doit être exécuté avant tout autre script.

### [`compose.sh`](scripts/compose.sh)

Démarre (ou redémarre les conteneurs).

### [`stop.sh`](scripts/stop.sh)

Arrête les conteneurs.

### [`clean.sh`](scripts/clean.sh)

Vide les services de stockages (base de données PostgreSQL et MinIO)

Nécessite d'avoir arrêté les conteneurs.

### [`insert.sh`](scripts/insert.sh)

Insère les données des Knowledge-Models de ```/kowledge-models``` dans l'instance DSW
en cours d'exécution.

