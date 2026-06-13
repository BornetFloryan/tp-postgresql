# TP PostgreSQL - Base multilingue

Ce projet démontre la création et l'administration d'une base PostgreSQL
multilingue : encodage UTF-8, tri français avec ICU, contraintes, utilisateurs,
privilèges, sauvegardes et restaurations.

## Contenu

- `sql/01_creation_base.sql` : création de la base `multi_lang` en UTF-8 avec
  une collation française ICU par défaut.
- `sql/02_tables_insertions.sql` : tables, contraintes, collation ICU et données
  comportant des caractères français, chinois et arabes.
- `sql/03_utilisateurs_privileges.sql` : création rejouable des utilisateurs et
  attribution des droits.
- `sql/04_verifications.sql` : contrôle de l'encodage, du tri et des privilèges.
- `backup/commandes_sauvegarde_restauration.txt` : sauvegardes et restaurations
  complètes et partielles.
- `schema/schema.dbml` : représentation du schéma relationnel.
- `docs/compte_rendu.md` : synthèse des choix techniques et de la validation.
- `presentation/plan_presentation.txt` : plan de démonstration orale.

## Exécution

Depuis la racine du projet, exécuter les commandes de `sql/commandes.txt`.
Le compte PostgreSQL utilisé doit pouvoir créer une base et des rôles.
Sous PowerShell, `chcp 65001` et `PGCLIENTENCODING=UTF8` évitent que `psql`
interprète les données multilingues avec l'encodage Windows-1252.

Les mots de passe présents dans les scripts sont uniquement destinés au TP et
doivent être remplacés dans un environnement réel.

## Résultats attendus

- La base utilise l'encodage UTF-8 et la collation française ICU `fr-FR`.
- Les sept étudiants incluent des caractères non ASCII.
- Le tri `COLLATE tri_francais` traite correctement les noms accentués.
- `readonly_user` peut lire `notes`, mais ne peut ni les modifier ni lire les
  autres tables.
- La restauration complète récupère toutes les tables.
- La restauration partielle récupère `etudiants`, sa séquence et ses contraintes.
