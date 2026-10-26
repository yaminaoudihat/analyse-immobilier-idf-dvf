#!/bin/bash
# Importe data/dvf_2024_idf.csv dans la table dvf_brut (base dvf_idf).
# À lancer depuis la racine du projet, après 01_creation_table_brute.sql.
PSQL=/Applications/Postgres.app/Contents/Versions/latest/bin/psql
$PSQL -d dvf_idf -c "\copy dvf_brut FROM 'data/dvf_2024_idf.csv' WITH (FORMAT csv, HEADER true)"
