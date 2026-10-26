-- 1. Aperçu des 10 premières lignes
SELECT * FROM dvf_brut LIMIT 10;

-- 2. Nombre de lignes et nombre de ventes distinctes
SELECT COUNT(*) AS nb_lignes,
       COUNT(DISTINCT id_mutation) AS nb_ventes
FROM dvf_brut;

-- 3. Nombre de lignes par département
SELECT code_departement, COUNT(*) AS nb_lignes
FROM dvf_brut
GROUP BY code_departement
ORDER BY nb_lignes DESC;

-- 4. Nombre de lignes par type de bien
SELECT type_local, COUNT(*) AS nb_lignes
FROM dvf_brut
GROUP BY type_local
ORDER BY nb_lignes DESC;

-- 5. Lignes d'appartements à Paris
SELECT COUNT(*) AS nb_appartements_paris
FROM dvf_brut
WHERE type_local = 'Appartement'
  AND code_departement = '75';

-- 6. Lignes sans prix
SELECT COUNT(*) AS nb_sans_prix
FROM dvf_brut
WHERE valeur_fonciere IS NULL;