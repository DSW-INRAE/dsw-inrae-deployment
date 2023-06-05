# dsw-inrae-deployment

## Scripts

The scripts should be executed from the `/script` directory.

### [`load-env.sh`](scripts/load-env.sh)

Replaces the keys in all files located in `/templates`
with the corresponding values specified in [`/.env`](.env). The output files
maintain the same directory structure as in the original folder starting from the root.

This script needs to be executed before any other script.

### [`compose.sh`](scripts/compose.sh)

Starts (or restarts) the containers.

### [`stop.sh`](scripts/stop.sh)

Stops the containers.

### [`clean.sh`](scripts/clean.sh)

Clears the storage services (PostgreSQL database and MinIO).

Requires the containers to be stopped.

### [`insert.sh`](scripts/insert.sh)

Inserts the data from the Knowledge Models in `/knowledge-models` into the running DSW instance.
