\encoding UTF8 

CREATE TABLE etudiants (
    id_etudiant SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL
);

CREATE TABLE matieres (
    id_matiere SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);

CREATE TABLE notes (
    id_note SERIAL PRIMARY KEY,
    id_etudiant INT NOT NULL REFERENCES etudiants(id_etudiant),
    id_matiere INT NOT NULL REFERENCES matieres(id_matiere),
    note NUMERIC(4, 2) NOT NULL
);

INSERT INTO
    etudiants (nom, prenom)
VALUES
    ('Évrard', 'Chloé'),
    ('Béranger', 'Léo'),
    ('Noël', 'Anaïs'),
    ('Çağlar', 'Émile'),
    ('Durand', 'Zoé');

INSERT INTO
    matieres (libelle)
VALUES
    ('Base de données avancée'),
    ('Développement web'),
    ('Anglais professionnel'),
    ('Gestion de projet');

INSERT INTO
    notes (id_etudiant, id_matiere, note)
VALUES
    (1, 1, 15.50),
    (1, 2, 14.00),
    (2, 1, 12.75),
    (3, 3, 16.25),
    (4, 4, 13.50),
    (5, 1, 17.00);

SELECT
    nom,
    prenom
FROM
    etudiants
ORDER BY
    nom;