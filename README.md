# Analyse du marché immobilier francilien (DVF)

Projet personnel (2026) : analyse des transactions immobilières en Île-de-France à partir des données DVF (Demandes de valeurs foncières, data.gouv.fr).

## Objectif

Charger les données DVF dans PostgreSQL, les nettoyer (doublons, valeurs aberrantes), répondre à des questions métier en SQL, puis présenter les résultats dans un dashboard Power BI.

## Technologies

PostgreSQL, SQL, Python, Power BI

## Statut

En cours.

## Données

- **Source** : DVF géolocalisées (Etalab, d'après les Demandes de valeurs foncières de la DGFiP), data.gouv.fr. Licence Ouverte 2.0.
- **Périmètre** : transactions de l'année 2024, départements d'Île-de-France (75, 77, 78, 91, 92, 93, 94, 95).
- **Date de téléchargement** : 23 octobre 2026. Chaque mise à jour du jeu de données remplace les fichiers précédents.
- **Format** : un fichier CSV compressé par département, séparateur virgule, point décimal.

### Télécharger les données

```bash
mkdir -p data && cd data
for d in 75 77 78 91 92 93 94 95; do curl -fL -o dvf_2024_$d.csv.gz https://files.data.gouv.fr/geo-dvf/latest/csv/2024/departements/$d.csv.gz; done
```

Les fichiers ne sont pas versionnés dans Git (trop volumineux).
