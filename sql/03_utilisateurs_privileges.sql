\encoding UTF8

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'admin_user') THEN
        CREATE ROLE admin_user WITH LOGIN SUPERUSER PASSWORD 'Admin123!';
    ELSE
        ALTER ROLE admin_user WITH LOGIN SUPERUSER PASSWORD 'Admin123!';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'readonly_user') THEN
        CREATE ROLE readonly_user WITH LOGIN NOSUPERUSER PASSWORD 'ReadOnly123!';
    ELSE
        ALTER ROLE readonly_user WITH LOGIN NOSUPERUSER PASSWORD 'ReadOnly123!';
    END IF;
END
$$;

GRANT CONNECT ON DATABASE multi_lang TO readonly_user;

GRANT USAGE ON SCHEMA public TO readonly_user;

REVOKE ALL ON TABLE etudiants, matieres, notes FROM readonly_user;

GRANT SELECT ON TABLE notes TO readonly_user;
