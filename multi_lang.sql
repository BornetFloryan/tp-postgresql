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
    prenom character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    groupe character varying(20) NOT NULL
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
-- Name: matieres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matieres (
    id_matiere integer NOT NULL,
    libelle character varying(100) NOT NULL,
    coefficient numeric(3,1) NOT NULL,
    CONSTRAINT matieres_coefficient_check CHECK ((coefficient > (0)::numeric))
);


ALTER TABLE public.matieres OWNER TO postgres;

--
-- Name: matieres_id_matiere_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.matieres_id_matiere_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.matieres_id_matiere_seq OWNER TO postgres;

--
-- Name: matieres_id_matiere_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.matieres_id_matiere_seq OWNED BY public.matieres.id_matiere;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notes (
    id_note integer NOT NULL,
    id_etudiant integer NOT NULL,
    id_matiere integer NOT NULL,
    note numeric(4,2) NOT NULL,
    date_evaluation date DEFAULT CURRENT_DATE,
    CONSTRAINT notes_note_check CHECK (((note >= (0)::numeric) AND (note <= (20)::numeric)))
);


ALTER TABLE public.notes OWNER TO postgres;

--
-- Name: notes_id_note_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notes_id_note_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notes_id_note_seq OWNER TO postgres;

--
-- Name: notes_id_note_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notes_id_note_seq OWNED BY public.notes.id_note;


--
-- Name: etudiants id_etudiant; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etudiants ALTER COLUMN id_etudiant SET DEFAULT nextval('public.etudiants_id_etudiant_seq'::regclass);


--
-- Name: matieres id_matiere; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matieres ALTER COLUMN id_matiere SET DEFAULT nextval('public.matieres_id_matiere_seq'::regclass);


--
-- Name: notes id_note; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notes ALTER COLUMN id_note SET DEFAULT nextval('public.notes_id_note_seq'::regclass);


--
-- Data for Name: etudiants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.etudiants (id_etudiant, nom, prenom, email, groupe) FROM stdin;
1	Evrard	Chloe	chloe.evrard@but.fr	BUT3 A
2	Beranger	Leo	leo.beranger@but.fr	BUT3 A
3	Noel	Anais	anais.noel@but.fr	BUT3 B
4	Caglar	Emile	emile.caglar@but.fr	BUT3 B
5	Durand	Zoe	zoe.durand@but.fr	BUT3 A
\.


--
-- Data for Name: matieres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matieres (id_matiere, libelle, coefficient) FROM stdin;
1	Base de donnees avancee	2.0
2	Developpement web	3.0
3	Anglais professionnel	1.5
4	Gestion de projet	2.0
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notes (id_note, id_etudiant, id_matiere, note, date_evaluation) FROM stdin;
1	1	1	15.50	2026-06-02
2	1	2	14.00	2026-06-02
3	2	1	12.75	2026-06-02
4	3	3	16.25	2026-06-02
5	4	4	13.50	2026-06-02
6	5	1	17.00	2026-06-02
\.


--
-- Name: etudiants_id_etudiant_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.etudiants_id_etudiant_seq', 5, true);


--
-- Name: matieres_id_matiere_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.matieres_id_matiere_seq', 4, true);


--
-- Name: notes_id_note_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notes_id_note_seq', 6, true);


--
-- Name: etudiants etudiants_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etudiants
    ADD CONSTRAINT etudiants_email_key UNIQUE (email);


--
-- Name: etudiants etudiants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etudiants
    ADD CONSTRAINT etudiants_pkey PRIMARY KEY (id_etudiant);


--
-- Name: matieres matieres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matieres
    ADD CONSTRAINT matieres_pkey PRIMARY KEY (id_matiere);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id_note);


--
-- Name: notes fk_notes_etudiants; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT fk_notes_etudiants FOREIGN KEY (id_etudiant) REFERENCES public.etudiants(id_etudiant) ON DELETE CASCADE;


--
-- Name: notes fk_notes_matieres; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT fk_notes_matieres FOREIGN KEY (id_matiere) REFERENCES public.matieres(id_matiere) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO readonly_user;


--
-- Name: TABLE notes; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.notes TO readonly_user;


--
-- PostgreSQL database dump complete
--

