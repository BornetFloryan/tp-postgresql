\encoding UTF8 

GRANT CONNECT ON DATABASE multi_lang TO readonly_user;

GRANT USAGE ON SCHEMA public TO readonly_user;

GRANT
SELECT
    ON TABLE notes TO readonly_user;