# dsw-inrae-deployment

Installation allowing the deployment of [Data Stewardship Wizard (DSW)](https://ds-wizard.org/). Intended for the Moisa and Cirad units but can be adapted to other organizations/units.

The deployment is done using [Docker](https://docs.docker.com/). It uses DSW, PostgreSQL, and MinIO images available in the Docker library. It also includes the use of a parallel-developed submission service to a [NextCloud](https://nextcloud.com/) instance.

It is recommended to be familiar with DSW before preparing the deployment.

## Environment Variables

The only parameters to be configured for the deployment are located in [`/env`](.env).

## Scripts

The scripts should be executed from `/script`.

### `load-env.sh`

Replaces the keys in all files located in `/templates` with the corresponding values specified in `/.env`. The output files retain the same directory structure as in the original folder starting from the root.

This script must be executed before any other script.

### `compose.sh`

Starts (or restarts) the containers.

### `stop.sh`

Stops the containers.

### `clean.sh`

Empties the storage services (PostgreSQL database and MinIO).

Requires the containers to be stopped.

### `insert.sh`

Inserts the data from the Knowledge Models and templates in `/resources` into the running DSW instance.

The Knowledge Models must be in the standard export format of DSW (metamodel version 13, *.km* extension).

The exported templates should be in the packaging format produced by the `dsw-tdk package` command, make sure to have [the latest version of the utility](https://pypi.org/project/dsw-tdk/3.24.0/). They can also be in the export format from DSW (metamodel version 11).
