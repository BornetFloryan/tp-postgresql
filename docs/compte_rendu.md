# Compte rendu

## Objectif

Le projet met en place une base PostgreSQL multilingue destinée à gérer des
étudiants, des matières et leurs notes.

## Choix techniques

- La base `multi_lang` utilise l'encodage UTF-8 et la collation française ICU
  `fr-FR` par défaut.
- La collation ICU `tri_francais` permet un tri adapté aux noms français.
- Les données incluent des caractères accentués, chinois et arabes.
- Les clés étrangères utilisent `ON DELETE CASCADE`.
- Les contraintes `CHECK` garantissent un coefficient positif et une note
  comprise entre 0 et 20.

## Sécurité

- `admin_user` possède les droits d'administration demandés pour le TP.
- `readonly_user` peut uniquement se connecter à la base et lire `notes`.
- Les scripts utilisent des mots de passe de démonstration, à ne pas conserver
  dans un environnement réel.

## Sauvegarde

- `multi_lang.sql` permet une restauration SQL complète.
- `multi_lang.dump` est une sauvegarde complète au format custom.
- `multi_lang_etudiants.dump` contient uniquement la table `etudiants` avec sa
  séquence, ses données et ses contraintes.
- Les dumps utilisent `--no-owner --no-acl` pour pouvoir être restaurés sans
  dépendre des rôles présents sur le serveur d'origine.

## Validation

Les scripts ont été exécutés avec PostgreSQL 17. Les créations, contraintes,
permissions, sauvegardes et restaurations complète et partielle ont été testées.
