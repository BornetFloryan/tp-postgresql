DROP ROLE IF EXISTS readonly_user;

DROP ROLE IF EXISTS admin_user;

CREATE USER admin_user WITH LOGIN SUPERUSER PASSWORD 'Admin123!';

CREATE USER readonly_user WITH LOGIN PASSWORD 'ReadOnly123!';

GRANT CONNECT ON DATABASE multi_lang TO readonly_user;

GRANT USAGE ON SCHEMA public TO readonly_user;

GRANT
SELECT
    ON TABLE notes TO readonly_user;