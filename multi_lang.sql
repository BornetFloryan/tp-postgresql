--
-- PostgreSQL database dump
--

\restrict M0DOnksYh9IGW7unuOLVCEqBRMdMtSSkw81smIrO4HTKG6HYZCp5TlhhcwWieU2

-- Dumped from database version 17.10
-- Dumped by pg_dump version 17.10

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
-- Name: etudiants; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.etudiants (
    id_etudiant integer NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100) NOT NULL
);


ALTER TABLE public.etudiants OWNER TO admin_user;

--
-- Name: etudiants_id_etudiant_seq; Type: SEQUENCE; Schema: public; Owner: admin_user
--

CREATE SEQUENCE public.etudiants_id_etudiant_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.etudiants_id_etudiant_seq OWNER TO admin_user;

--
-- Name: etudiants_id_etudiant_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public.etudiants_id_etudiant_seq OWNED BY public.etudiants.id_etudiant;


--
-- Name: matieres; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.matieres (
    id_matiere integer NOT NULL,
    libelle character varying(100) NOT NULL
);


ALTER TABLE public.matieres OWNER TO admin_user;

--
-- Name: matieres_id_matiere_seq; Type: SEQUENCE; Schema: public; Owner: admin_user
--

CREATE SEQUENCE public.matieres_id_matiere_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.matieres_id_matiere_seq OWNER TO admin_user;

--
-- Name: matieres_id_matiere_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public.matieres_id_matiere_seq OWNED BY public.matieres.id_matiere;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.notes (
    id_note integer NOT NULL,
    id_etudiant integer NOT NULL,
    id_matiere integer NOT NULL,
    note numeric(4,2) NOT NULL
);


ALTER TABLE public.notes OWNER TO admin_user;

--
-- Name: notes_id_note_seq; Type: SEQUENCE; Schema: public; Owner: admin_user
--

CREATE SEQUENCE public.notes_id_note_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notes_id_note_seq OWNER TO admin_user;

--
-- Name: notes_id_note_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public.notes_id_note_seq OWNED BY public.notes.id_note;


--
-- Name: etudiants id_etudiant; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.etudiants ALTER COLUMN id_etudiant SET DEFAULT nextval('public.etudiants_id_etudiant_seq'::regclass);


--
-- Name: matieres id_matiere; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.matieres ALTER COLUMN id_matiere SET DEFAULT nextval('public.matieres_id_matiere_seq'::regclass);


--
-- Name: notes id_note; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.notes ALTER COLUMN id_note SET DEFAULT nextval('public.notes_id_note_seq'::regclass);


--
-- Data for Name: etudiants; Type: TABLE DATA; Schema: public; Owner: admin_user
--

COPY public.etudiants (id_etudiant, nom, prenom) FROM stdin;
1	Évrard	Chloé
2	Béranger	Léo
3	Noël	Anaïs
4	Çağlar	Émile
5	Durand	Zoé
\.


--
-- Data for Name: matieres; Type: TABLE DATA; Schema: public; Owner: admin_user
--

COPY public.matieres (id_matiere, libelle) FROM stdin;
1	Base de données avancée
2	Développement web
3	Anglais professionnel
4	Gestion de projet
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: admin_user
--

COPY public.notes (id_note, id_etudiant, id_matiere, note) FROM stdin;
1	1	1	15.50
2	1	2	14.00
3	2	1	12.75
4	3	3	16.25
5	4	4	13.50
6	5	1	17.00
\.


--
-- Name: etudiants_id_etudiant_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_user
--

SELECT pg_catalog.setval('public.etudiants_id_etudiant_seq', 5, true);


--
-- Name: matieres_id_matiere_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_user
--

SELECT pg_catalog.setval('public.matieres_id_matiere_seq', 4, true);


--
-- Name: notes_id_note_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_user
--

SELECT pg_catalog.setval('public.notes_id_note_seq', 6, true);


--
-- Name: etudiants etudiants_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.etudiants
    ADD CONSTRAINT etudiants_pkey PRIMARY KEY (id_etudiant);


--
-- Name: matieres matieres_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.matieres
    ADD CONSTRAINT matieres_pkey PRIMARY KEY (id_matiere);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id_note);


--
-- Name: notes fk_notes_etudiants; Type: FK CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT fk_notes_etudiants FOREIGN KEY (id_etudiant) REFERENCES public.etudiants(id_etudiant);


--
-- Name: notes fk_notes_matieres; Type: FK CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT fk_notes_matieres FOREIGN KEY (id_matiere) REFERENCES public.matieres(id_matiere);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO readonly_user;


--
-- Name: TABLE notes; Type: ACL; Schema: public; Owner: admin_user
--

GRANT SELECT ON TABLE public.notes TO readonly_user;


--
-- PostgreSQL database dump complete
--

\unrestrict M0DOnksYh9IGW7unuOLVCEqBRMdMtSSkw81smIrO4HTKG6HYZCp5TlhhcwWieU2

