CREATE TABLE etudiants (
    id_etudiant SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    groupe VARCHAR(20) NOT NULL
);

CREATE TABLE matieres (
    id_matiere SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL,
    coefficient NUMERIC(3, 1) NOT NULL CHECK (coefficient > 0)
);

CREATE TABLE notes (
    id_note SERIAL PRIMARY KEY,
    id_etudiant INT NOT NULL,
    id_matiere INT NOT NULL,
    note NUMERIC(4, 2) NOT NULL CHECK (
        note >= 0
        AND note <= 20
    ),
    date_evaluation DATE DEFAULT CURRENT_DATE,
    CONSTRAINT fk_notes_etudiants FOREIGN KEY (id_etudiant) REFERENCES etudiants(id_etudiant) ON DELETE CASCADE,
    CONSTRAINT fk_notes_matieres FOREIGN KEY (id_matiere) REFERENCES matieres(id_matiere) ON DELETE CASCADE
);

INSERT INTO
    etudiants (nom, prenom, email, groupe)
VALUES
    (
        'Évrard',
        'Chloé',
        'chloe.evrard@but.fr',
        'BUT3 A'
    ),
    (
        'Béranger',
        'Léo',
        'leo.beranger@but.fr',
        'BUT3 A'
    ),
    ('Noël', 'Anaïs', 'anais.noel@but.fr', 'BUT3 B'),
    (
        'Çağlar',
        'Émile',
        'emile.caglar@but.fr',
        'BUT3 B'
    ),
    ('Dùrand', 'Zoé', 'zoe.durand@but.fr', 'BUT3 A');

INSERT INTO
    matieres (libelle, coefficient)
VALUES
    ('Base de données avancée', 2.0),
    ('Développement web', 3.0),
    ('Anglais professionnel', 1.5),
    ('Gestion de projet', 2.0);

INSERT INTO
    notes (id_etudiant, id_matiere, note)
VALUES
    (1, 1, 15.50),
    (1, 2, 14.00),
    (2, 1, 12.75),
    (3, 3, 16.25),
    (4, 4, 13.50),
    (5, 1, 17.00);