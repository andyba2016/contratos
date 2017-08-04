-- Table: areas

-- DROP TABLE areas;

CREATE TABLE areas
(
  id serial NOT NULL,
  descripcion character varying(50),
  estado integer,
  fecha_baja timestamp without time zone,
  CONSTRAINT areas_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE areas OWNER TO postgres;


-- Table: logs

-- DROP TABLE logs;

CREATE TABLE logs
(
  id serial NOT NULL,
  accion character varying(50),
  info character varying(250),
  usuario_id integer,
  CONSTRAINT logs_pkey PRIMARY KEY (id),
  CONSTRAINT logs_usuario_id_fkey FOREIGN KEY (usuario_id)
      REFERENCES usuarios (id) MATCH Unknown
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE logs OWNER TO postgres;


-- Table: perfiles

-- DROP TABLE perfiles;

CREATE TABLE perfiles
(
  id serial NOT NULL,
  descripcion character varying(50),
  CONSTRAINT perfiles_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE perfiles OWNER TO postgres;

-- Table: personas

-- DROP TABLE personas;

CREATE TABLE personas
(
  id serial NOT NULL,
  nombre character varying(50),
  apellido character varying(50),
  numero_documento character varying(10),
  cuit character varying(50),
  direccion character varying(50),
  fecha_alta timestamp without time zone,
  estado integer,
  fecha_baja timestamp without time zone,
  CONSTRAINT personas_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE personas OWNER TO postgres;

-- Table: usuarios

-- DROP TABLE usuarios;

CREATE TABLE usuarios
(
  id serial NOT NULL,
  usuario character varying(10),
  "password" character varying(255),
  estado integer,
  fecha_alta timestamp without time zone DEFAULT now(),
  fecha_baja timestamp without time zone,
  perfil_id integer,
  nombre character varying(100),
  apellido character varying(100),
  email character varying(50),
  area_id integer,
  CONSTRAINT usuarios_pkey PRIMARY KEY (id),
  CONSTRAINT usuarios_area_id_fkey FOREIGN KEY (area_id)
      REFERENCES areas (id) MATCH Unknown
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuarios_perfile_id_fkey FOREIGN KEY (perfil_id)
      REFERENCES perfiles (id) MATCH Unknown
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuarios_usuario_key UNIQUE (usuario),
  CONSTRAINT usuarios_usuario_key1 UNIQUE (usuario)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE usuarios OWNER TO postgres;

