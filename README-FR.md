# dsw-inrae-deployment

Installation permettant le déploiement de 
[Data Stewardship Wizard (DSW)](https://ds-wizard.org/). 
Prévu pour les unités Moisa et Cirad, mais peut être adapté à 
d'autres organisations / unités.

Le déploiement se fait avec [Docker](https://docs.docker.com/).
Il utilise les images DSW, PostgreSQL et MinIO disponible
dans la bibliothèque Docker. Il prévoit aussi l'utilisation du
service de soumission vers une instance [NextCloud](https://nextcloud.com/)
développé en parallèle.

Il est conseillé d'être familiarisé avec DSW avant de préparer
le déploiement.

## Variables d'environnement

Les seuls paramètres à renseigner pour le déploiement sont 
situées dans [`/env`](.env).

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

Insère les données des Knowledge-Models et des templates de ```/resources``` dans l'instance DSW
en cours d'exécution.

Les Knowledge-Models doivent être sous le format d'export standard
de DSW (metamodel de version 13, extension *.km*).

Les templates d'export doivent être sous le format d'empaquetage
produit par la commande ``dsw-tdk package``, veillez à bien avoir
[la dernière version de l'utilitaire](https://pypi.org/project/dsw-tdk/3.24.0/).
Ils peuvent aussi être sous le format d'export depuis DSW (metamodel de version 11).