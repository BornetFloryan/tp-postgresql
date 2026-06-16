--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: etudiants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etudiants (
    id_etudiant integer NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100) NOT NULL
);


ALTER TABLE public.etudiants OWNER TO postgres;

--
-- Name: etudiants_id_etudiant_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.etudiants_id_etudiant_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.etudiants_id_etudiant_seq OWNER TO postgres;

--
-- Name: etudiants_id_etudiant_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.etudiants_id_etudiant_seq OWNED BY public.etudiants.id_etudiant;


--
-- Name: etudiants id_etudiant; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etudiants ALTER COLUMN id_etudiant SET DEFAULT nextval('public.etudiants_id_etudiant_seq'::regclass);


--
-- Data for Name: etudiants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.etudiants (id_etudiant, nom, prenom) FROM stdin;
1	Évrard	Chloé
2	Béranger	Léo
3	Noël	Anaïs
4	Çağlar	Émile
5	Durand	Zoé
\.


--
-- Name: etudiants_id_etudiant_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.etudiants_id_etudiant_seq', 5, true);


--
-- Name: etudiants etudiants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etudiants
    ADD CONSTRAINT etudiants_pkey PRIMARY KEY (id_etudiant);


--
-- PostgreSQL database dump complete
--

