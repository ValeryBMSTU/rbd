--
-- PostgreSQL database dump
--

-- Dumped from database version 10.16 (Ubuntu 10.16-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.16 (Ubuntu 10.16-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Agent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Agent" (
    id integer NOT NULL,
    target_function real NOT NULL,
    id_parent integer,
    id_generation integer NOT NULL,
    id_template integer
);


ALTER TABLE public."Agent" OWNER TO postgres;

--
-- Name: Agent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Agent_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Agent_id_seq" OWNER TO postgres;

--
-- Name: Agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Agent_id_seq" OWNED BY public."Agent".id;


--
-- Name: Gen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Gen" (
    id integer NOT NULL,
    "position" integer NOT NULL,
    value integer NOT NULL,
    id_agent integer NOT NULL
);


ALTER TABLE public."Gen" OWNER TO postgres;

--
-- Name: Geb_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Geb_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Geb_id_seq" OWNER TO postgres;

--
-- Name: Geb_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Geb_id_seq" OWNED BY public."Gen".id;


--
-- Name: GenTemplate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GenTemplate" (
    id integer NOT NULL,
    id_gen integer NOT NULL,
    id_template integer NOT NULL
);


ALTER TABLE public."GenTemplate" OWNER TO postgres;

--
-- Name: GenTemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."GenTemplate_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GenTemplate_id_seq" OWNER TO postgres;

--
-- Name: GenTemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."GenTemplate_id_seq" OWNED BY public."GenTemplate".id;


--
-- Name: Generation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Generation" (
    id integer NOT NULL,
    order_number integer NOT NULL,
    id_session integer NOT NULL,
    extra_params text
);


ALTER TABLE public."Generation" OWNER TO postgres;

--
-- Name: Generation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Generation_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Generation_id_seq" OWNER TO postgres;

--
-- Name: Generation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Generation_id_seq" OWNED BY public."Generation".id;


--
-- Name: GeneticAlgorithm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GeneticAlgorithm" (
    id integer NOT NULL,
    name text NOT NULL,
    create_date date NOT NULL,
    description text,
    extra_params text,
    "id_KO" integer,
    "id_SO" integer,
    "id_MO" integer
);


ALTER TABLE public."GeneticAlgorithm" OWNER TO postgres;

--
-- Name: KrossingoverOperator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KrossingoverOperator" (
    id integer NOT NULL,
    scheme text NOT NULL,
    params text
);


ALTER TABLE public."KrossingoverOperator" OWNER TO postgres;

--
-- Name: KrossingoverOperator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."KrossingoverOperator_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."KrossingoverOperator_id_seq" OWNER TO postgres;

--
-- Name: KrossingoverOperator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."KrossingoverOperator_id_seq" OWNED BY public."KrossingoverOperator".id;


--
-- Name: MutationOperator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MutationOperator" (
    id integer NOT NULL,
    scheme text NOT NULL,
    params text,
    objects_count integer NOT NULL
);


ALTER TABLE public."MutationOperator" OWNER TO postgres;

--
-- Name: MutationOperator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MutationOperator_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MutationOperator_id_seq" OWNER TO postgres;

--
-- Name: MutationOperator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MutationOperator_id_seq" OWNED BY public."MutationOperator".id;


--
-- Name: SelectOperator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SelectOperator" (
    id integer NOT NULL,
    scheme text NOT NULL,
    select_criteria text NOT NULL,
    params text
);


ALTER TABLE public."SelectOperator" OWNER TO postgres;

--
-- Name: Session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Session" (
    id integer NOT NULL,
    name text NOT NULL,
    create_date date NOT NULL,
    description text,
    "id_GA" integer
);


ALTER TABLE public."Session" OWNER TO postgres;

--
-- Name: Session_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Session_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Session_id_seq" OWNER TO postgres;

--
-- Name: Session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Session_id_seq" OWNED BY public."Session".id;


--
-- Name: Template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Template" (
    id integer NOT NULL,
    length integer NOT NULL
);


ALTER TABLE public."Template" OWNER TO postgres;

--
-- Name: Template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Template_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Template_id_seq" OWNER TO postgres;

--
-- Name: Template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Template_id_seq" OWNED BY public."Template".id;


--
-- Name: ga_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ga_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ga_id_seq OWNER TO postgres;

--
-- Name: ga_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ga_id_seq OWNED BY public."GeneticAlgorithm".id;


--
-- Name: so_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.so_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.so_id_seq OWNER TO postgres;

--
-- Name: so_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.so_id_seq OWNED BY public."SelectOperator".id;


--
-- Name: Agent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agent" ALTER COLUMN id SET DEFAULT nextval('public."Agent_id_seq"'::regclass);


--
-- Name: Gen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gen" ALTER COLUMN id SET DEFAULT nextval('public."Geb_id_seq"'::regclass);


--
-- Name: GenTemplate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GenTemplate" ALTER COLUMN id SET DEFAULT nextval('public."GenTemplate_id_seq"'::regclass);


--
-- Name: Generation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Generation" ALTER COLUMN id SET DEFAULT nextval('public."Generation_id_seq"'::regclass);


--
-- Name: GeneticAlgorithm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GeneticAlgorithm" ALTER COLUMN id SET DEFAULT nextval('public.ga_id_seq'::regclass);


--
-- Name: KrossingoverOperator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KrossingoverOperator" ALTER COLUMN id SET DEFAULT nextval('public."KrossingoverOperator_id_seq"'::regclass);


--
-- Name: MutationOperator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MutationOperator" ALTER COLUMN id SET DEFAULT nextval('public."MutationOperator_id_seq"'::regclass);


--
-- Name: SelectOperator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SelectOperator" ALTER COLUMN id SET DEFAULT nextval('public.so_id_seq'::regclass);


--
-- Name: Session id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Session" ALTER COLUMN id SET DEFAULT nextval('public."Session_id_seq"'::regclass);


--
-- Name: Template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Template" ALTER COLUMN id SET DEFAULT nextval('public."Template_id_seq"'::regclass);


--
-- Data for Name: Agent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Agent" (id, target_function, id_parent, id_generation, id_template) FROM stdin;
\.


--
-- Data for Name: Gen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Gen" (id, "position", value, id_agent) FROM stdin;
\.


--
-- Data for Name: GenTemplate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."GenTemplate" (id, id_gen, id_template) FROM stdin;
\.


--
-- Data for Name: Generation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Generation" (id, order_number, id_session, extra_params) FROM stdin;
\.


--
-- Data for Name: GeneticAlgorithm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."GeneticAlgorithm" (id, name, create_date, description, extra_params, "id_KO", "id_SO", "id_MO") FROM stdin;
\.


--
-- Data for Name: KrossingoverOperator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."KrossingoverOperator" (id, scheme, params) FROM stdin;
\.


--
-- Data for Name: MutationOperator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MutationOperator" (id, scheme, params, objects_count) FROM stdin;
\.


--
-- Data for Name: SelectOperator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SelectOperator" (id, scheme, select_criteria, params) FROM stdin;
\.


--
-- Data for Name: Session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Session" (id, name, create_date, description, "id_GA") FROM stdin;
\.


--
-- Data for Name: Template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Template" (id, length) FROM stdin;
\.


--
-- Name: Agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Agent_id_seq"', 1, false);


--
-- Name: Geb_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Geb_id_seq"', 1, false);


--
-- Name: GenTemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."GenTemplate_id_seq"', 1, false);


--
-- Name: Generation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Generation_id_seq"', 1, false);


--
-- Name: KrossingoverOperator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."KrossingoverOperator_id_seq"', 1, false);


--
-- Name: MutationOperator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MutationOperator_id_seq"', 1, false);


--
-- Name: Session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Session_id_seq"', 1, false);


--
-- Name: Template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Template_id_seq"', 1, false);


--
-- Name: ga_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ga_id_seq', 1, false);


--
-- Name: so_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.so_id_seq', 1, false);


--
-- Name: Agent agent_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agent"
    ADD CONSTRAINT agent_pk PRIMARY KEY (id);


--
-- Name: GeneticAlgorithm ga_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GeneticAlgorithm"
    ADD CONSTRAINT ga_pk PRIMARY KEY (id);


--
-- Name: Gen geb_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gen"
    ADD CONSTRAINT geb_pk PRIMARY KEY (id);


--
-- Name: Generation generation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Generation"
    ADD CONSTRAINT generation_pk PRIMARY KEY (id);


--
-- Name: GenTemplate gentemplate_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GenTemplate"
    ADD CONSTRAINT gentemplate_pk PRIMARY KEY (id);


--
-- Name: KrossingoverOperator krossingoveroperator_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KrossingoverOperator"
    ADD CONSTRAINT krossingoveroperator_pk PRIMARY KEY (id);


--
-- Name: MutationOperator mutationoperator_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MutationOperator"
    ADD CONSTRAINT mutationoperator_pk PRIMARY KEY (id);


--
-- Name: Session session_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT session_pk PRIMARY KEY (id);


--
-- Name: SelectOperator so_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SelectOperator"
    ADD CONSTRAINT so_pk PRIMARY KEY (id);


--
-- Name: Template template_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Template"
    ADD CONSTRAINT template_pk PRIMARY KEY (id);


--
-- Name: ga_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ga_id_uindex ON public."GeneticAlgorithm" USING btree (id);


--
-- Name: ga_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ga_name_uindex ON public."GeneticAlgorithm" USING btree (name);


--
-- Name: geb_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX geb_id_uindex ON public."Gen" USING btree (id);


--
-- Name: generation_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX generation_id_uindex ON public."Generation" USING btree (id);


--
-- Name: gentemplate_id_gen_id_template_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX gentemplate_id_gen_id_template_uindex ON public."GenTemplate" USING btree (id_gen, id_template);


--
-- Name: gentemplate_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX gentemplate_id_uindex ON public."GenTemplate" USING btree (id);


--
-- Name: krossingoveroperator_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX krossingoveroperator_id_uindex ON public."KrossingoverOperator" USING btree (id);


--
-- Name: mutationoperator_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX mutationoperator_id_uindex ON public."MutationOperator" USING btree (id);


--
-- Name: session_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX session_id_uindex ON public."Session" USING btree (id);


--
-- Name: so_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX so_id_uindex ON public."SelectOperator" USING btree (id);


--
-- Name: template_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX template_id_uindex ON public."Template" USING btree (id);


--
-- Name: Agent agent_agent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agent"
    ADD CONSTRAINT agent_agent_id_fk FOREIGN KEY (id_parent) REFERENCES public."Agent"(id);


--
-- Name: Agent agent_generation_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agent"
    ADD CONSTRAINT agent_generation_id_fk FOREIGN KEY (id_generation) REFERENCES public."Generation"(id);


--
-- Name: Agent agent_template_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agent"
    ADD CONSTRAINT agent_template_id_fk FOREIGN KEY (id_template) REFERENCES public."Template"(id);


--
-- Name: Gen gen_agent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gen"
    ADD CONSTRAINT gen_agent_id_fk FOREIGN KEY (id_agent) REFERENCES public."Agent"(id);


--
-- Name: Generation generation_session_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Generation"
    ADD CONSTRAINT generation_session_id_fk FOREIGN KEY (id_session) REFERENCES public."Session"(id);


--
-- Name: GeneticAlgorithm geneticalgorithm_krossingoveroperator_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GeneticAlgorithm"
    ADD CONSTRAINT geneticalgorithm_krossingoveroperator_id_fk FOREIGN KEY ("id_KO") REFERENCES public."KrossingoverOperator"(id);


--
-- Name: GeneticAlgorithm geneticalgorithm_mutationoperator_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GeneticAlgorithm"
    ADD CONSTRAINT geneticalgorithm_mutationoperator_id_fk FOREIGN KEY ("id_MO") REFERENCES public."MutationOperator"(id);


--
-- Name: GeneticAlgorithm geneticalgorithm_selectoperator_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GeneticAlgorithm"
    ADD CONSTRAINT geneticalgorithm_selectoperator_id_fk FOREIGN KEY ("id_SO") REFERENCES public."SelectOperator"(id);


--
-- Name: GenTemplate gentemplate_gen_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GenTemplate"
    ADD CONSTRAINT gentemplate_gen_id_fk FOREIGN KEY (id_gen) REFERENCES public."Gen"(id);


--
-- Name: GenTemplate gentemplate_template_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GenTemplate"
    ADD CONSTRAINT gentemplate_template_id_fk FOREIGN KEY (id_template) REFERENCES public."Template"(id);


--
-- Name: Session session_geneticalgorithm_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT session_geneticalgorithm_id_fk FOREIGN KEY ("id_GA") REFERENCES public."GeneticAlgorithm"(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

