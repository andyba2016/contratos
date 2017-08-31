--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: areas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE areas (
    id integer NOT NULL,
    descripcion character varying(50),
    estado integer,
    fecha_baja timestamp without time zone
);


ALTER TABLE areas OWNER TO postgres;

--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE areas_id_seq OWNER TO postgres;

--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE areas_id_seq OWNED BY areas.id;


--
-- Name: contratos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contratos (
    id integer NOT NULL,
    personas_id integer,
    usuarios_id integer,
    fecha_desde timestamp with time zone,
    fecha_hasta timestamp with time zone,
    area_id integer,
    estado integer,
    cargo text,
    autoridad_id integer,
    numero integer,
    articulo integer,
    tarea text,
    tipo_contrato_id integer
);


ALTER TABLE contratos OWNER TO postgres;

--
-- Name: contratos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contratos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contratos_id_seq OWNER TO postgres;

--
-- Name: contratos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contratos_id_seq OWNED BY contratos.id;


--
-- Name: cuotas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cuotas (
    id integer NOT NULL,
    mes integer,
    horas_mensuales integer,
    horas_semanales integer,
    valor_hora double precision,
    valor_cuota double precision,
    estado integer,
    valor_letras character varying(250),
    contrato_id integer
);


ALTER TABLE cuotas OWNER TO postgres;

--
-- Name: cuotas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cuotas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cuotas_id_seq OWNER TO postgres;

--
-- Name: cuotas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cuotas_id_seq OWNED BY cuotas.id;


--
-- Name: funciones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE funciones (
    id integer NOT NULL,
    descripcion character varying(250),
    contrato_id integer
);


ALTER TABLE funciones OWNER TO postgres;

--
-- Name: funciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE funciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE funciones_id_seq OWNER TO postgres;

--
-- Name: funciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE funciones_id_seq OWNED BY funciones.id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE logs (
    id integer NOT NULL,
    accion character varying(50),
    info character varying(250),
    usuario_id integer
);


ALTER TABLE logs OWNER TO postgres;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE logs_id_seq OWNER TO postgres;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE logs_id_seq OWNED BY logs.id;


--
-- Name: perfiles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE perfiles (
    id integer NOT NULL,
    descripcion character varying(50)
);


ALTER TABLE perfiles OWNER TO postgres;

--
-- Name: perfiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE perfiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE perfiles_id_seq OWNER TO postgres;

--
-- Name: perfiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE perfiles_id_seq OWNED BY perfiles.id;


--
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personas (
    id integer NOT NULL,
    nombre character varying(50),
    apellido character varying(50),
    numero_documento character varying(10),
    cuit character varying(50),
    direccion character varying(50),
    fecha_alta timestamp without time zone,
    estado integer,
    fecha_baja timestamp without time zone
);


ALTER TABLE personas OWNER TO postgres;

--
-- Name: personas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas_id_seq OWNER TO postgres;

--
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE personas_id_seq OWNED BY personas.id;


--
-- Name: tipo_contrato; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_contrato (
    id integer NOT NULL,
    descripcion character varying(250)
);


ALTER TABLE tipo_contrato OWNER TO postgres;

--
-- Name: tipo_contrato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_contrato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_contrato_id_seq OWNER TO postgres;

--
-- Name: tipo_contrato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_contrato_id_seq OWNED BY tipo_contrato.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
    id integer NOT NULL,
    usuario character varying(10),
    password character varying(255),
    estado integer,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_baja timestamp without time zone,
    perfil_id integer,
    nombre character varying(100),
    apellido character varying(100),
    email character varying(50),
    area_id integer
);


ALTER TABLE usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY areas ALTER COLUMN id SET DEFAULT nextval('areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratos ALTER COLUMN id SET DEFAULT nextval('contratos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cuotas ALTER COLUMN id SET DEFAULT nextval('cuotas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funciones ALTER COLUMN id SET DEFAULT nextval('funciones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY logs ALTER COLUMN id SET DEFAULT nextval('logs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfiles ALTER COLUMN id SET DEFAULT nextval('perfiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas ALTER COLUMN id SET DEFAULT nextval('personas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_contrato ALTER COLUMN id SET DEFAULT nextval('tipo_contrato_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY areas (id, descripcion, estado, fecha_baja) FROM stdin;
1	prueba	1	\N
2	\N	0	\N
3	Decanato	1	\N
4	fsadfsa	0	\N
5	test	1	\N
6	454	1	\N
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('areas_id_seq', 6, true);


--
-- Data for Name: contratos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratos (id, personas_id, usuarios_id, fecha_desde, fecha_hasta, area_id, estado, cargo, autoridad_id, numero, articulo, tarea, tipo_contrato_id) FROM stdin;
6	1	1	2017-08-29 00:00:00-03	2018-08-29 00:00:00-03	1	1	Jefe	1	1	1	Ser jefe	1
\.


--
-- Name: contratos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratos_id_seq', 6, true);


--
-- Data for Name: cuotas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cuotas (id, mes, horas_mensuales, horas_semanales, valor_hora, valor_cuota, estado, valor_letras, contrato_id) FROM stdin;
\.


--
-- Name: cuotas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cuotas_id_seq', 1, false);


--
-- Data for Name: funciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funciones (id, descripcion, contrato_id) FROM stdin;
\.


--
-- Name: funciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('funciones_id_seq', 1, false);


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY logs (id, accion, info, usuario_id) FROM stdin;
\.


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('logs_id_seq', 1, false);


--
-- Data for Name: perfiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY perfiles (id, descripcion) FROM stdin;
2	usuario
1	admin
\.


--
-- Name: perfiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('perfiles_id_seq', 1, false);


--
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY personas (id, nombre, apellido, numero_documento, cuit, direccion, fecha_alta, estado, fecha_baja) FROM stdin;
7	3	2	2	2	2	\N	0	\N
8	2	2	2	2	2	2017-08-16 00:06:50.603661	0	2017-08-16 00:09:08.977779
9	Mariano	Corbalan	32444444	2032444444	las rosas 11221	2017-08-24 23:30:25.066897	1	\N
1	Jose	Garcia	3333333	333333	lala lala	\N	1	\N
\.


--
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personas_id_seq', 9, true);


--
-- Data for Name: tipo_contrato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_contrato (id, descripcion) FROM stdin;
1	Locacion ed obra
2	Locacion de Servicio
\.


--
-- Name: tipo_contrato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_contrato_id_seq', 2, true);


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuarios (id, usuario, password, estado, fecha_alta, fecha_baja, perfil_id, nombre, apellido, email, area_id) FROM stdin;
8	prueba	52bb988c721aabbed61f817cbf83c1df7906a7dc213da63e0f72b4b9daa3fc71	0	\N	2017-07-20 23:38:08.804257	1	Prueba	Prueba	prueba@prueba.com	3
3	mcorbalan	e42aa9f8fc68623374785d2c131a77d7236bcb1097f60430f8205eaf4c639615	1	2017-06-27 00:00:00	\N	1	Mariano	Corbalan	mcorbalan@frgp.utn.edu.ar	1
1	admin	471c134ef75cea04d4ba5701dd01b10224613052121b1a95691f7f61fa967afe	1	2017-06-27 00:00:00	\N	1	Admin	Istrador	atarrio@frgp.utn.edu.ar	1
4	rcrivi	471c134ef75cea04d4ba5701dd01b10224613052121b1a95691f7f61fa967afe	1	2017-06-27 00:00:00	\N	2	Ricardo	Crivicich	rcrivi@frgp.utn.edu.ar	1
2	atarrio	471c134ef75cea04d4ba5701dd01b10224613052121b1a95691f7f61fa967afe	1	2017-06-27 00:00:00	\N	1	Andrés	Tarrío	atarrio@frgp.utn.edu.ar	1
5	jlgarcia	471c134ef75cea04d4ba5701dd01b10224613052121b1a95691f7f61fa967afe	1	2017-06-27 00:00:00	\N	1	José Luis	García	jlgarcia@red.frgp.utn.edu.ar	3
\.


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_id_seq', 11, true);


--
-- Name: areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: contratos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contratos
    ADD CONSTRAINT contratos_pkey PRIMARY KEY (id);


--
-- Name: cuotas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cuotas
    ADD CONSTRAINT cuotas_pkey PRIMARY KEY (id);


--
-- Name: funciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY funciones
    ADD CONSTRAINT funciones_pkey PRIMARY KEY (id);


--
-- Name: logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: perfiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY perfiles
    ADD CONSTRAINT perfiles_pkey PRIMARY KEY (id);


--
-- Name: personas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- Name: tipo_contrato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_contrato
    ADD CONSTRAINT tipo_contrato_pkey PRIMARY KEY (id);


--
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: usuarios_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);


--
-- Name: usuarios_usuario_key1; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_usuario_key1 UNIQUE (usuario);


--
-- Name: contratos_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratos
    ADD CONSTRAINT contratos_area_id_fkey FOREIGN KEY (area_id) REFERENCES areas(id);


--
-- Name: contratos_autoridad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratos
    ADD CONSTRAINT contratos_autoridad_id_fkey FOREIGN KEY (autoridad_id) REFERENCES personas(id);


--
-- Name: contratos_personas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratos
    ADD CONSTRAINT contratos_personas_id_fkey FOREIGN KEY (personas_id) REFERENCES personas(id);


--
-- Name: contratos_tipo_contrato_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratos
    ADD CONSTRAINT contratos_tipo_contrato_id_fkey FOREIGN KEY (tipo_contrato_id) REFERENCES tipo_contrato(id);


--
-- Name: contratos_usuarios_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratos
    ADD CONSTRAINT contratos_usuarios_id_fkey FOREIGN KEY (usuarios_id) REFERENCES usuarios(id);


--
-- Name: cuotas_contrato_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cuotas
    ADD CONSTRAINT cuotas_contrato_id_fkey FOREIGN KEY (contrato_id) REFERENCES contratos(id);


--
-- Name: funciones_contrato_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funciones
    ADD CONSTRAINT funciones_contrato_id_fkey FOREIGN KEY (contrato_id) REFERENCES contratos(id);


--
-- Name: logs_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY logs
    ADD CONSTRAINT logs_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuarios(id);


--
-- Name: usuarios_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_area_id_fkey FOREIGN KEY (area_id) REFERENCES areas(id);


--
-- Name: usuarios_perfile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_perfile_id_fkey FOREIGN KEY (perfil_id) REFERENCES perfiles(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

