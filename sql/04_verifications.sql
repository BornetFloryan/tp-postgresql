\encoding UTF8

SELECT
    current_database() AS base,
    pg_encoding_to_char(encoding) AS encodage,
    datlocprovider AS fournisseur_collation,
    datlocale AS collation_icu
FROM pg_database
WHERE datname = current_database();

SELECT
    nom,
    prenom
FROM etudiants
ORDER BY nom COLLATE tri_francais;

SELECT
    COUNT(*) AS nombre_etudiants,
    COUNT(*) FILTER (
        WHERE nom ~ '[^[:ascii:]]'
           OR prenom ~ '[^[:ascii:]]'
    ) AS etudiants_avec_caracteres_non_ascii
FROM etudiants;

SELECT
    has_database_privilege('readonly_user', 'multi_lang', 'CONNECT')
        AS readonly_peut_se_connecter,
    has_table_privilege('readonly_user', 'notes', 'SELECT')
        AS readonly_peut_lire_notes,
    has_table_privilege('readonly_user', 'notes', 'INSERT')
        AS readonly_peut_inserer_notes,
    has_table_privilege('readonly_user', 'etudiants', 'SELECT')
        AS readonly_peut_lire_etudiants;

\dp notes
