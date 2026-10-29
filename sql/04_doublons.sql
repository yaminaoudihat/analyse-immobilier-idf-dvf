-- 1. Combien de lignes sont des copies exactes d'une autre ligne ?
SELECT (SELECT COUNT(*) FROM dvf_brut) AS nb_lignes,
       (SELECT COUNT(*) FROM (SELECT DISTINCT * FROM dvf_brut) AS t) AS nb_lignes_distinctes;

-- 2. Les 10 ventes qui occupent le plus de lignes
SELECT id_mutation, COUNT(*) AS nb_lignes
FROM dvf_brut
GROUP BY id_mutation
HAVING COUNT(*) > 1
ORDER BY nb_lignes DESC
LIMIT 10;
-- 3. Composition de la plus grosse vente (4 182 lignes)
SELECT type_local,
       COUNT(*) AS nb_lignes,
       COUNT(DISTINCT valeur_fonciere) AS nb_prix_differents,
       COUNT(DISTINCT id_parcelle) AS nb_parcelles
FROM dvf_brut
WHERE id_mutation = '2024-1145082'
GROUP BY type_local
ORDER BY nb_lignes DESC;

-- 4. Combien de fois chaque ligne est-elle présente ?
SELECT nb_copies, COUNT(*) AS nb_lignes_distinctes
FROM (
    SELECT COUNT(*) AS nb_copies
    FROM dvf_brut AS t
    GROUP BY t::text
) AS x
GROUP BY nb_copies
ORDER BY nb_copies;