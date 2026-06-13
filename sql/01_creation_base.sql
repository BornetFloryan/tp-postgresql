DROP DATABASE IF EXISTS multi_lang;

CREATE DATABASE multi_lang
    WITH
    ENCODING = 'UTF8'
    TEMPLATE = template0
    LOCALE_PROVIDER = icu
    ICU_LOCALE = 'fr-FR';
