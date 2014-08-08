--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: oiss; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE oiss WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Argentina.1252' LC_CTYPE = 'Spanish_Argentina.1252';


ALTER DATABASE oiss OWNER TO postgres;

\connect oiss

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: siacioiss; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA siacioiss;


ALTER SCHEMA siacioiss OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = siacioiss, pg_catalog;

--
-- Name: emp_log_transaccional_emp_base; Type: TYPE; Schema: siacioiss; Owner: admin
--

CREATE TYPE emp_log_transaccional_emp_base AS (
	id_log_transaccional bigint,
	padron bigint,
	fecha_proceso date,
	fecha_envio date,
	id_tipo_movimiento smallint,
	id_origen smallint,
	id_destino smallint,
	id_estado_beneficio smallint,
	observacion character varying(200)
);


ALTER TYPE siacioiss.emp_log_transaccional_emp_base OWNER TO admin;

--
-- Name: typ_usuario; Type: TYPE; Schema: siacioiss; Owner: admin
--

CREATE TYPE typ_usuario AS (
	usuario character varying(50),
	apellido character varying(100),
	nombre character varying(100),
	correo_electronico character varying(50),
	id_pais_origen smallint,
	perfil character varying(20)
);


ALTER TYPE siacioiss.typ_usuario OWNER TO admin;

--
-- Name: emp_log_transaccional_emp; Type: TYPE; Schema: siacioiss; Owner: admin
--

CREATE TYPE emp_log_transaccional_emp AS (
	emp_log_transaccional_emp_base emp_log_transaccional_emp_base,
	usuario typ_usuario
);


ALTER TYPE siacioiss.emp_log_transaccional_emp OWNER TO admin;

--
-- Name: typ_beneficio_base; Type: TYPE; Schema: siacioiss; Owner: admin
--

CREATE TYPE typ_beneficio_base AS (
	id_beneficio bigint,
	padron bigint,
	id_pais_pagador smallint,
	id_prestacion smallint,
	f_ult_liq date
);


ALTER TYPE siacioiss.typ_beneficio_base OWNER TO admin;

--
-- Name: typ_beneficio; Type: TYPE; Schema: siacioiss; Owner: admin
--

CREATE TYPE typ_beneficio AS (
	beneficio typ_beneficio_base,
	usuario typ_usuario
);


ALTER TYPE siacioiss.typ_beneficio OWNER TO admin;

--
-- Name: typ_emp_benefiaciario_base; Type: TYPE; Schema: siacioiss; Owner: admin
--

CREATE TYPE typ_emp_benefiaciario_base AS (
	id_beneficiario bigint,
	padron bigint,
	sexo character(1),
	f_nacimiento date,
	id_pais_nacionalidad smallint,
	id_pais_residencia smallint,
	id_estado_beneficiario smallint,
	f_estado date,
	motivo_estado character varying(100),
	f_fallecimiento date
);


ALTER TYPE siacioiss.typ_emp_benefiaciario_base OWNER TO admin;

--
-- Name: typ_emp_beneficiario; Type: TYPE; Schema: siacioiss; Owner: admin
--

CREATE TYPE typ_emp_beneficiario AS (
	beneficiario typ_emp_benefiaciario_base,
	usuario typ_usuario
);


ALTER TYPE siacioiss.typ_emp_beneficiario OWNER TO admin;

--
-- Name: typ_emp_ident_persona_base; Type: TYPE; Schema: siacioiss; Owner: admin
--

CREATE TYPE typ_emp_ident_persona_base AS (
	id_identificacion_persona bigint,
	padron bigint,
	id_pais_documento smallint,
	id_tipo_documento smallint,
	nro_documento character varying(20),
	f_emision_documento date,
	doc_elegido boolean,
	id_estado_beneficiario smallint,
	id_estado_beneficio smallint,
	nro_inscripcion character varying(15),
	organismo_inscripcion character varying(100)
);


ALTER TYPE siacioiss.typ_emp_ident_persona_base OWNER TO admin;

--
-- Name: typ_emp_ident_persona; Type: TYPE; Schema: siacioiss; Owner: admin
--

CREATE TYPE typ_emp_ident_persona AS (
	ident_persona typ_emp_ident_persona_base,
	usuario typ_usuario
);


ALTER TYPE siacioiss.typ_emp_ident_persona OWNER TO admin;

--
-- Name: typ_emp_vinculo_previsional_base; Type: TYPE; Schema: siacioiss; Owner: admin
--

CREATE TYPE typ_emp_vinculo_previsional_base AS (
	id_vinculo_previsional bigint,
	padron bigint,
	id_pais_gestor smallint,
	d_pais_gestor character varying(50),
	id_pais_pagador smallint,
	d_pais_pagador character varying(50),
	f_alta date,
	id_oficina_dependencia smallint,
	id_estado_beneficio smallint,
	c_estado_beneficio character varying(20),
	f_estado date,
	motivo_estado_vinculo character varying(100)
);


ALTER TYPE siacioiss.typ_emp_vinculo_previsional_base OWNER TO admin;

--
-- Name: typ_emp_vinculo_previsional; Type: TYPE; Schema: siacioiss; Owner: admin
--

CREATE TYPE typ_emp_vinculo_previsional AS (
	vinculo_previsional typ_emp_vinculo_previsional_base,
	usuario typ_usuario
);


ALTER TYPE siacioiss.typ_emp_vinculo_previsional OWNER TO admin;

--
-- Name: typ_log_recepcion_liq; Type: TYPE; Schema: siacioiss; Owner: postgres
--

CREATE TYPE typ_log_recepcion_liq AS (
	id_log_recepcion_liq bigint,
	pe_emision integer,
	id_pais_pagador smallint,
	f_recepcion timestamp with time zone,
	cod_envio integer,
	id_pais_gestor smallint,
	id_estado_recepcion smallint,
	motivo_estado_error character varying(512)
);


ALTER TYPE siacioiss.typ_log_recepcion_liq OWNER TO postgres;

--
-- Name: typ_log_transaccional_liq; Type: TYPE; Schema: siacioiss; Owner: postgres
--

CREATE TYPE typ_log_transaccional_liq AS (
	id_log_transaccional_liq bigint,
	pe_emision integer,
	id_pais_pagador smallint,
	f_envio timestamp with time zone,
	cod_envio integer,
	id_pais_gestor smallint,
	f_transmision timestamp with time zone,
	hora_transmision timestamp with time zone,
	id_estado_transmision integer
);


ALTER TYPE siacioiss.typ_log_transaccional_liq OWNER TO postgres;

--
-- Name: liq_actualiza_oiss_log_recepcion_liq(typ_log_recepcion_liq); Type: FUNCTION; Schema: siacioiss; Owner: postgres
--

CREATE FUNCTION liq_actualiza_oiss_log_recepcion_liq(param typ_log_recepcion_liq) RETURNS bigint
    LANGUAGE plpgsql
    AS $$

BEGIN
	UPDATE siacioiss.liq_oiss_log_recepcion_liq
	   SET
		pe_emision=param.pe_emision,
		id_pais_pagador=param.id_pais_pagador,
		f_recepcion=param.f_recepcion,
		cod_envio=param.cod_envio,
		id_pais_gestor=param.id_pais_gestor,
		id_estado_recepcion=param.id_estado_recepcion,
		motivo_estado_error=param.motivo_estado_error
	 WHERE id_log_recepcion_liq = param.id_log_recepcion_liq;

	RETURN param.id_log_recepcion_liq;

END;

$$;


ALTER FUNCTION siacioiss.liq_actualiza_oiss_log_recepcion_liq(param typ_log_recepcion_liq) OWNER TO postgres;

--
-- Name: liq_actualiza_oiss_log_transaccional(typ_log_transaccional_liq); Type: FUNCTION; Schema: siacioiss; Owner: postgres
--

CREATE FUNCTION liq_actualiza_oiss_log_transaccional(param typ_log_transaccional_liq) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

	UPDATE siacioiss.log_transaccional_liq
	   SET 
		pe_emision = param.pe_emision,
                id_pais_pagador =param.id_pais_pagador,
                f_envio = param.f_envio,
		cod_envio = param.cod_envio,
		id_pais_gestor= param.id_pais_gestor,
		f_transmision = CURRENT_DATE,--  param.f_transmision,
		hora_transmision = param.hora_transmision,
		id_estado_transmision=param.id_estado_transmision		
		
	 WHERE id_log_transaccional_liq=param.id_log_transaccional_liq;

	RETURN param.id_log_transaccional_liq;

END;

$$;


ALTER FUNCTION siacioiss.liq_actualiza_oiss_log_transaccional(param typ_log_transaccional_liq) OWNER TO postgres;

--
-- Name: liq_alta_oiss_log_recepcion_liq(typ_log_recepcion_liq); Type: FUNCTION; Schema: siacioiss; Owner: postgres
--

CREATE FUNCTION liq_alta_oiss_log_recepcion_liq(param typ_log_recepcion_liq) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN
          
	INSERT INTO siacioiss.log_recepcion_liq( pe_emision,
	                                         id_pais_pagador,
	                                         f_recepcion, 
					         cod_envio,
					         id_pais_gestor, 
					         id_estado_recepcion,
					         motivo_estado_error
					         )
							   VALUES( 
								   param.pe_emision,
							           param.id_pais_pagador,
							           --param.f_recepcion, 
								   CURRENT_DATE,	
								   param.cod_envio,
								   param.id_pais_gestor,
								   param.id_estado_recepcion,
								   param.motivo_estado_error
								)
	RETURNING id_log_recepcion_liq INTO param.id_log_recepcion_liq;

	RETURN param.id_log_recepcion_liq;

END;

$$;


ALTER FUNCTION siacioiss.liq_alta_oiss_log_recepcion_liq(param typ_log_recepcion_liq) OWNER TO postgres;

--
-- Name: liq_alta_oiss_log_transaccional(typ_log_transaccional_liq); Type: FUNCTION; Schema: siacioiss; Owner: postgres
--

CREATE FUNCTION liq_alta_oiss_log_transaccional(param typ_log_transaccional_liq) RETURNS bigint
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO siacioiss.log_transaccional_liq(
		                        pe_emision, 
		                        id_pais_pagador,
		                        f_envio, 
					cod_envio,
				        id_pais_gestor, 
		                        f_transmision, 
		                        hora_transmision,
		                        id_estado_transmision)
 	VALUES (
		param.pe_emision, param.id_pais_pagador, param.f_envio, 
		param.cod_envio, param.id_pais_gestor, 
		param.f_transmision,
		--param.hora_transmision,
                CURRENT_DATE,
		param.id_estado_transmision)
	RETURNING id_log_transaccional_liq INTO param.id_log_transaccional_liq;

	RETURN param.id_log_transaccional_liq;

END;
$$;


ALTER FUNCTION siacioiss.liq_alta_oiss_log_transaccional(param typ_log_transaccional_liq) OWNER TO postgres;

--
-- Name: liq_valida_beneficio(integer); Type: FUNCTION; Schema: siacioiss; Owner: postgres
--

CREATE FUNCTION liq_valida_beneficio(integer) RETURNS TABLE(padron integer, c_estado_beneficiario character varying, c_estado_beneficio character varying, id_pais_gestor integer)
    LANGUAGE sql STRICT
    AS $_$

--BEGIN
/*
estado beneficiario / beneficio
01- P - Pendiente
02- C - Confirmado
*/
	SELECT b.padron, 
		CASE eb.c_estado_beneficiario WHEN 'C' THEN 'CONFIRMADO' ELSE null END c_estado_beneficiario,
		CASE evp.c_estado_beneficio WHEN 'C' THEN 'CONFIRMADO' ELSE null END c_estado_beneficio,
		vp.id_pais_gestor
	  FROM siacioiss.emp_beneficiario b
	  JOIN siacioiss.emp_vinculo_previsional vp ON vp.padron = b.padron
	  JOIN siacioiss.estado_beneficiario eb ON eb.id_estado_beneficiario= b.id_estado_beneficiario
	  JOIN siacioiss.estado_beneficio evp ON evp.id_estado_beneficio = vp.id_estado_beneficio
	 WHERE b.padron = $1;
	   --AND eb.c_estado_beneficiario = 'C'
	   --AND evp.c_estado_beneficio = 'C'
	   --AND vp.id_pais_gestor = $2;



--END;

$_$;


ALTER FUNCTION siacioiss.liq_valida_beneficio(integer) OWNER TO postgres;

--
-- Name: log_buscar_log_gestion_pagos(character varying, character varying, smallint, smallint, smallint, smallint); Type: FUNCTION; Schema: siacioiss; Owner: admin
--

CREATE FUNCTION log_buscar_log_gestion_pagos(fdesde character varying, fhasta character varying, idpaisorigen smallint, idpaisdestino smallint, idtipoinformacion smallint, idestado smallint) RETURNS TABLE(id_log_gestion_pagos bigint, f_transmision timestamp with time zone, id_pais_origen smallint, d_pais_origen character varying, id_pais_destino smallint, d_pais_destino character varying, id_tipo_informacion smallint, d_tipo_informacion character varying, id_tipo_envio smallint, d_tipo_envio character varying, cant_registros integer, importe double precision, id_estado smallint, d_estado character varying, identificacion character varying, usuario character varying, proceso character varying)
    LANGUAGE sql
    AS $_$

SELECT id_log_gestion_pagos, f_transmision,
	id_pais_origen, po.d_pais d_pais_origen,
	id_pais_destino, pd.d_pais d_pais_destino,
        ti.id_tipo_informacion, ti.d_tipo_informacion,
        te.id_tipo_envio, te.d_tipo_envio, 
	cant_registros, importe,
	e.id_estado, e.d_estado,
	identificacion, usuario, proceso
  FROM siacioiss.log_gestion_pagos lgp
  JOIN siacioiss.pais po ON po.id_pais = lgp.id_pais_origen
  JOIN siacioiss.pais pd ON pd.id_pais = lgp.id_pais_destino
  JOIN siacioiss.tipo_informacion ti ON ti.id_tipo_informacion = lgp.id_tipo_informacion
  JOIN siacioiss.tipo_envio te ON te.id_tipo_envio = lgp.id_tipo_envio
  JOIN siacioiss.estado e ON e.id_estado = lgp.id_estado
 WHERE f_transmision > date($1) -- fDesde
   AND f_transmision < date($2) -- fHasta
   AND ($3 is null OR $3 = id_pais_origen)
   AND ($4 is null OR $4 = id_pais_destino)
   AND ($5 is null OR $5 = lgp.id_tipo_informacion)
   AND ($6 is null OR $6 = lgp.id_estado);

$_$;


ALTER FUNCTION siacioiss.log_buscar_log_gestion_pagos(fdesde character varying, fhasta character varying, idpaisorigen smallint, idpaisdestino smallint, idtipoinformacion smallint, idestado smallint) OWNER TO admin;

--
-- Name: obtener_paises(); Type: FUNCTION; Schema: siacioiss; Owner: admin
--

CREATE FUNCTION obtener_paises() RETURNS TABLE(id_pais smallint, c_pais character varying, d_pais character varying)
    LANGUAGE sql
    AS $$

	SELECT id_pais, c_pais, d_pais
	  FROM siacioiss.pais;

$$;


ALTER FUNCTION siacioiss.obtener_paises() OWNER TO admin;

--
-- Name: obtener_prestaciones(); Type: FUNCTION; Schema: siacioiss; Owner: admin
--

CREATE FUNCTION obtener_prestaciones() RETURNS TABLE(id_prestacion smallint, c_prestacion character varying, d_prestacion character varying)
    LANGUAGE sql
    AS $$

	SELECT id_prestacion, c_prestacion, d_prestacion
	  FROM siacioiss.prestacion;

$$;


ALTER FUNCTION siacioiss.obtener_prestaciones() OWNER TO admin;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: datos_estadisticos_liq; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE datos_estadisticos_liq (
    id_datos_estadisticos_liq integer NOT NULL,
    cant_impaga integer,
    cant_liquidada integer,
    cant_pagada integer,
    f_inicial_credito timestamp without time zone,
    f_final_credito timestamp without time zone,
    imp_moneda_gestor_impaga double precision,
    imp_moneda_gestor_liquidada double precision,
    imp_moneda_pagador_impaga double precision,
    imp_moneda_pagador_liquidada double precision,
    imp_moneda_pagador_pagada double precision,
    pe_emision integer,
    pe_liquidado integer,
    ultima_actualizacion timestamp without time zone,
    id_moneda_pais_gestor integer,
    id_moneda_pais_pagador integer,
    id_pais_destino integer,
    id_pais_origen integer,
    id_prestacion integer
);


ALTER TABLE siacioiss.datos_estadisticos_liq OWNER TO postgres;

--
-- Name: emp_beneficiario; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE emp_beneficiario (
    id_beneficiario integer NOT NULL,
    f_estado timestamp without time zone NOT NULL,
    f_fallecimiento timestamp without time zone,
    f_nacimiento timestamp without time zone NOT NULL,
    f_ultima_operacion_usuario timestamp without time zone,
    motivo_estado character varying(255),
    padron integer NOT NULL,
    sexo character varying(255) NOT NULL,
    usuario character varying(255),
    id_estado_beneficiario integer,
    id_pais_nacionalidad integer,
    id_pais_residencia integer,
    id_pais_usuario integer
);


ALTER TABLE siacioiss.emp_beneficiario OWNER TO postgres;

--
-- Name: emp_beneficio; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE emp_beneficio (
    id_beneficio bigint NOT NULL,
    f_ult_liq timestamp without time zone,
    f_ultima_operacion_usuario timestamp without time zone,
    numero_beneficio character varying(255) NOT NULL,
    padron integer NOT NULL,
    usuario character varying(20),
    id_pais_pagador integer,
    id_pais_usuario integer,
    id_prestacion integer
);


ALTER TABLE siacioiss.emp_beneficio OWNER TO postgres;

--
-- Name: emp_identificacion_persona; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE emp_identificacion_persona (
    id_identificacion_persona integer NOT NULL,
    f_emision_documento timestamp without time zone,
    f_ultima_operacion_usuario timestamp without time zone,
    nro_inscripcion character varying(15),
    nro_documento character varying(255) NOT NULL,
    organismo_inscripcion character varying(100),
    padron integer NOT NULL,
    usuario character varying(20),
    id_pais integer,
    id_pais_usuario integer,
    id_tipo_documento integer NOT NULL
);


ALTER TABLE siacioiss.emp_identificacion_persona OWNER TO postgres;

--
-- Name: emp_vinculo_previsional; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE emp_vinculo_previsional (
    id_vinculo_previsional integer NOT NULL,
    f_alta timestamp without time zone NOT NULL,
    f_estado timestamp without time zone NOT NULL,
    f_ultima_operacion_usuario timestamp without time zone,
    id_oficina_dependencia integer,
    motivo_estado character varying(255),
    padron integer NOT NULL,
    usuario character varying(20),
    id_estado_beneficio integer,
    id_pais_gestor integer,
    id_pais_pagador integer,
    id_pais_usuario integer
);


ALTER TABLE siacioiss.emp_vinculo_previsional OWNER TO postgres;

--
-- Name: estado; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE estado (
    id_estado integer NOT NULL,
    c_estado character varying(20),
    d_estado character varying(50)
);


ALTER TABLE siacioiss.estado OWNER TO postgres;

--
-- Name: estado_beneficiario; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE estado_beneficiario (
    id_estado_beneficiario integer NOT NULL,
    c_estado_beneficiario character varying(20),
    d_estado_beneficiario character varying(50)
);


ALTER TABLE siacioiss.estado_beneficiario OWNER TO postgres;

--
-- Name: estado_beneficio; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE estado_beneficio (
    id_estado_beneficio integer NOT NULL,
    c_estado_beneficio character varying(20),
    d_estado_beneficio character varying(50)
);


ALTER TABLE siacioiss.estado_beneficio OWNER TO postgres;

--
-- Name: log_gestion_pagos; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE log_gestion_pagos (
    id_log_gestion_pagos bigint NOT NULL,
    cant_registros integer,
    f_transmision timestamp without time zone,
    id_estado smallint,
    id_pais_destino smallint,
    id_pais_origen smallint,
    id_tipo_envio smallint,
    id_tipo_informacion smallint,
    identificacion character varying(100),
    importe double precision,
    proceso character varying(20),
    usuario character varying(50)
);


ALTER TABLE siacioiss.log_gestion_pagos OWNER TO postgres;

--
-- Name: sq_liq_log_recepcion_liq_id_log_recepcion; Type: SEQUENCE; Schema: siacioiss; Owner: postgres
--

CREATE SEQUENCE sq_liq_log_recepcion_liq_id_log_recepcion
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacioiss.sq_liq_log_recepcion_liq_id_log_recepcion OWNER TO postgres;

--
-- Name: log_recepcion_liq; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE log_recepcion_liq (
    id_log_recepcion_liq bigint DEFAULT nextval('sq_liq_log_recepcion_liq_id_log_recepcion'::regclass) NOT NULL,
    cod_envio integer,
    f_recepcion timestamp without time zone,
    id_estado_recepcion smallint,
    id_pais_gestor smallint,
    id_pais_pagador smallint,
    motivo_estado_error character varying(512),
    pe_emision integer
);


ALTER TABLE siacioiss.log_recepcion_liq OWNER TO postgres;

--
-- Name: log_transaccional_emp; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE log_transaccional_emp (
    id_log_transaccional bigint NOT NULL,
    f_ultima_operacion_usuario date,
    fecha_envio date NOT NULL,
    fecha_proceso date NOT NULL,
    id_destino smallint,
    id_estado_beneficio smallint,
    id_origen smallint,
    id_pais_usuario smallint,
    id_tipo_movimiento smallint,
    observacion character varying(200),
    padron bigint NOT NULL,
    usuario character varying(20)
);


ALTER TABLE siacioiss.log_transaccional_emp OWNER TO postgres;

--
-- Name: sq_liq_log_transaccional_liq_id_log_transaccional; Type: SEQUENCE; Schema: siacioiss; Owner: postgres
--

CREATE SEQUENCE sq_liq_log_transaccional_liq_id_log_transaccional
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacioiss.sq_liq_log_transaccional_liq_id_log_transaccional OWNER TO postgres;

--
-- Name: log_transaccional_liq; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE log_transaccional_liq (
    id_log_transaccional_liq bigint DEFAULT nextval('sq_liq_log_transaccional_liq_id_log_transaccional'::regclass) NOT NULL,
    cod_envio integer,
    f_envio timestamp without time zone,
    f_transmision timestamp without time zone,
    hora_transmision date,
    id_estado_transmision integer,
    id_pais_gestor smallint,
    id_pais_pagador smallint,
    pe_emision integer
);


ALTER TABLE siacioiss.log_transaccional_liq OWNER TO postgres;

--
-- Name: moneda; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE moneda (
    id_moneda integer NOT NULL,
    c_moneda character varying(255),
    d_moneda character varying(255),
    id_pais integer
);


ALTER TABLE siacioiss.moneda OWNER TO postgres;

--
-- Name: pais; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE pais (
    id_pais integer NOT NULL,
    d_pais character varying(50),
    c_pais character varying(20)
);


ALTER TABLE siacioiss.pais OWNER TO postgres;

--
-- Name: prestacion; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE prestacion (
    id_prestacion integer NOT NULL,
    d_prestacion character varying(50),
    c_prestacion character varying(20)
);


ALTER TABLE siacioiss.prestacion OWNER TO postgres;

--
-- Name: sq_emp_benefiaciario_padron; Type: SEQUENCE; Schema: siacioiss; Owner: postgres
--

CREATE SEQUENCE sq_emp_benefiaciario_padron
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacioiss.sq_emp_benefiaciario_padron OWNER TO postgres;

--
-- Name: sq_emp_beneficio_id_beneficio; Type: SEQUENCE; Schema: siacioiss; Owner: postgres
--

CREATE SEQUENCE sq_emp_beneficio_id_beneficio
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacioiss.sq_emp_beneficio_id_beneficio OWNER TO postgres;

--
-- Name: sq_emp_identificacion_persona_id_identificacion_persona; Type: SEQUENCE; Schema: siacioiss; Owner: postgres
--

CREATE SEQUENCE sq_emp_identificacion_persona_id_identificacion_persona
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacioiss.sq_emp_identificacion_persona_id_identificacion_persona OWNER TO postgres;

--
-- Name: sq_emp_log_transaccional_emp_id_log_transaccional; Type: SEQUENCE; Schema: siacioiss; Owner: postgres
--

CREATE SEQUENCE sq_emp_log_transaccional_emp_id_log_transaccional
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacioiss.sq_emp_log_transaccional_emp_id_log_transaccional OWNER TO postgres;

--
-- Name: sq_emp_vinculo_previsional_id_vinculo_previsional; Type: SEQUENCE; Schema: siacioiss; Owner: postgres
--

CREATE SEQUENCE sq_emp_vinculo_previsional_id_vinculo_previsional
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacioiss.sq_emp_vinculo_previsional_id_vinculo_previsional OWNER TO postgres;

--
-- Name: tipo_documento; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_documento (
    id_tipo_documento integer NOT NULL,
    c_tipo_documento character varying(20),
    gestor_obligatorio boolean,
    d_tipo_documento character varying(50),
    pagador_obligatorio boolean,
    id_pais integer NOT NULL
);


ALTER TABLE siacioiss.tipo_documento OWNER TO postgres;

--
-- Name: tipo_envio; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_envio (
    id_tipo_envio integer NOT NULL,
    c_tipo_envio character varying(20),
    d_tipo_envio character varying(50)
);


ALTER TABLE siacioiss.tipo_envio OWNER TO postgres;

--
-- Name: tipo_informacion; Type: TABLE; Schema: siacioiss; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_informacion (
    id_tipo_informacion integer NOT NULL,
    c_tipo_informacion character varying(20),
    d_tipo_informacion character varying(50)
);


ALTER TABLE siacioiss.tipo_informacion OWNER TO postgres;

--
-- Data for Name: datos_estadisticos_liq; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--



--
-- Data for Name: emp_beneficiario; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--


--
-- Data for Name: emp_beneficio; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--



--
-- Data for Name: emp_identificacion_persona; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--

--
-- Data for Name: emp_vinculo_previsional; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--


--
-- Data for Name: estado; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--

INSERT INTO estado (id_estado, c_estado, d_estado) VALUES (1, 'A completar', 'A completar');
INSERT INTO estado (id_estado, c_estado, d_estado) VALUES (2, 'Pendiente val/Comp', 'Pendiente val/compl');
INSERT INTO estado (id_estado, c_estado, d_estado) VALUES (3, 'Pendiente transm/val', 'Pendiente de transmisiÃ³n/validado');
INSERT INTO estado (id_estado, c_estado, d_estado) VALUES (4, 'Transmitido', 'Transmitido');
INSERT INTO estado (id_estado, c_estado, d_estado) VALUES (5, 'Recibido', 'Recibido');
INSERT INTO estado (id_estado, c_estado, d_estado) VALUES (7, 'Parcial transmitido', 'Parcialmente transmitido');
INSERT INTO estado (id_estado, c_estado, d_estado) VALUES (6, 'Listado', 'Lido');


--
-- Data for Name: estado_beneficiario; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--

INSERT INTO estado_beneficiario (id_estado_beneficiario, c_estado_beneficiario, d_estado_beneficiario) VALUES (1, 'R', 'Rechazado');
INSERT INTO estado_beneficiario (id_estado_beneficiario, c_estado_beneficiario, d_estado_beneficiario) VALUES (2, 'P', 'Provisorio');
INSERT INTO estado_beneficiario (id_estado_beneficiario, c_estado_beneficiario, d_estado_beneficiario) VALUES (3, 'C', 'Confirmado');
INSERT INTO estado_beneficiario (id_estado_beneficiario, c_estado_beneficiario, d_estado_beneficiario) VALUES (4, 'B', 'Baja');


--
-- Data for Name: estado_beneficio; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--

INSERT INTO estado_beneficio (id_estado_beneficio, c_estado_beneficio, d_estado_beneficio) VALUES (1, 'R', 'Rechazado');
INSERT INTO estado_beneficio (id_estado_beneficio, c_estado_beneficio, d_estado_beneficio) VALUES (2, 'P', 'Provisorio');
INSERT INTO estado_beneficio (id_estado_beneficio, c_estado_beneficio, d_estado_beneficio) VALUES (3, 'C', 'Confirmado');
INSERT INTO estado_beneficio (id_estado_beneficio, c_estado_beneficio, d_estado_beneficio) VALUES (4, 'B', 'Baja');


--
-- Data for Name: log_gestion_pagos; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--



--
-- Data for Name: log_recepcion_liq; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--


--
-- Data for Name: log_transaccional_emp; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--



--
-- Data for Name: log_transaccional_liq; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--


--
-- Data for Name: moneda; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--

INSERT INTO moneda (id_moneda, c_moneda, d_moneda, id_pais) VALUES (1, 'PesoArg', 'Peso Argentino', 1);
INSERT INTO moneda (id_moneda, c_moneda, d_moneda, id_pais) VALUES (2, 'Real', 'Real', 2);
INSERT INTO moneda (id_moneda, c_moneda, d_moneda, id_pais) VALUES (5, 'Dolar', 'Dolar', 5);
INSERT INTO moneda (id_moneda, c_moneda, d_moneda, id_pais) VALUES (4, 'PesoUru', 'Peso Uruguayo', 4);
INSERT INTO moneda (id_moneda, c_moneda, d_moneda, id_pais) VALUES (3, 'PesoPara', 'Peso Paraguayo', 3);


--
-- Data for Name: pais; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--

INSERT INTO pais (id_pais, d_pais, c_pais) VALUES (1, 'Argentina', 'ARG');
INSERT INTO pais (id_pais, d_pais, c_pais) VALUES (2, 'Brasil', 'BR');
INSERT INTO pais (id_pais, d_pais, c_pais) VALUES (3, 'Paraguay', 'PR');
INSERT INTO pais (id_pais, d_pais, c_pais) VALUES (4, 'Uruguay', 'UR');
INSERT INTO pais (id_pais, d_pais, c_pais) VALUES (5, 'Otro', 'O');


--
-- Data for Name: prestacion; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--

INSERT INTO prestacion (id_prestacion, d_prestacion, c_prestacion) VALUES (1, 'JubilaciÃ³n', 'J');
INSERT INTO prestacion (id_prestacion, d_prestacion, c_prestacion) VALUES (2, 'PensiÃ³n', 'P');
INSERT INTO prestacion (id_prestacion, d_prestacion, c_prestacion) VALUES (3, 'Ayuda Enfermedad', 'E');


--
-- Name: sq_emp_benefiaciario_padron; Type: SEQUENCE SET; Schema: siacioiss; Owner: postgres
--

SELECT pg_catalog.setval('sq_emp_benefiaciario_padron', 1, false);


--
-- Name: sq_emp_beneficio_id_beneficio; Type: SEQUENCE SET; Schema: siacioiss; Owner: postgres
--

SELECT pg_catalog.setval('sq_emp_beneficio_id_beneficio', 1, false);


--
-- Name: sq_emp_identificacion_persona_id_identificacion_persona; Type: SEQUENCE SET; Schema: siacioiss; Owner: postgres
--

SELECT pg_catalog.setval('sq_emp_identificacion_persona_id_identificacion_persona', 1, false);


--
-- Name: sq_emp_log_transaccional_emp_id_log_transaccional; Type: SEQUENCE SET; Schema: siacioiss; Owner: postgres
--

SELECT pg_catalog.setval('sq_emp_log_transaccional_emp_id_log_transaccional', 1, false);


--
-- Name: sq_emp_vinculo_previsional_id_vinculo_previsional; Type: SEQUENCE SET; Schema: siacioiss; Owner: postgres
--

SELECT pg_catalog.setval('sq_emp_vinculo_previsional_id_vinculo_previsional', 1, false);


--
-- Name: sq_liq_log_recepcion_liq_id_log_recepcion; Type: SEQUENCE SET; Schema: siacioiss; Owner: postgres
--

SELECT pg_catalog.setval('sq_liq_log_recepcion_liq_id_log_recepcion', 4, true);


--
-- Name: sq_liq_log_transaccional_liq_id_log_transaccional; Type: SEQUENCE SET; Schema: siacioiss; Owner: postgres
--

SELECT pg_catalog.setval('sq_liq_log_transaccional_liq_id_log_transaccional', 5, true);


--
-- Data for Name: tipo_documento; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--

INSERT INTO tipo_documento (id_tipo_documento, c_tipo_documento, gestor_obligatorio, d_tipo_documento, pagador_obligatorio, id_pais) VALUES (1, 'DNI', true, 'Documento Unico', true, 1);
INSERT INTO tipo_documento (id_tipo_documento, c_tipo_documento, gestor_obligatorio, d_tipo_documento, pagador_obligatorio, id_pais) VALUES (2, 'CUIL', false, 'Clave Unica Identificacion Laboral', false, 1);
INSERT INTO tipo_documento (id_tipo_documento, c_tipo_documento, gestor_obligatorio, d_tipo_documento, pagador_obligatorio, id_pais) VALUES (3, 'CP', false, 'Cedula Paraguay', false, 3);
INSERT INTO tipo_documento (id_tipo_documento, c_tipo_documento, gestor_obligatorio, d_tipo_documento, pagador_obligatorio, id_pais) VALUES (4, 'CI', false, 'Cedula Uruguay', false, 4);
INSERT INTO tipo_documento (id_tipo_documento, c_tipo_documento, gestor_obligatorio, d_tipo_documento, pagador_obligatorio, id_pais) VALUES (5, 'CPF', false, 'Catastro Persona Fisica', true, 2);
INSERT INTO tipo_documento (id_tipo_documento, c_tipo_documento, gestor_obligatorio, d_tipo_documento, pagador_obligatorio, id_pais) VALUES (6, 'DOC', false, 'Documento', false, 2);


--
-- Data for Name: tipo_envio; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--

INSERT INTO tipo_envio (id_tipo_envio, c_tipo_envio, d_tipo_envio) VALUES (1, 'EnvÃ­o Inicial', 'EnvÃ­o Inicial');
INSERT INTO tipo_envio (id_tipo_envio, c_tipo_envio, d_tipo_envio) VALUES (2, 'EnvÃ­o Auxiliar', 'EnvÃ­o Auxiliar');


--
-- Data for Name: tipo_informacion; Type: TABLE DATA; Schema: siacioiss; Owner: postgres
--

INSERT INTO tipo_informacion (id_tipo_informacion, c_tipo_informacion, d_tipo_informacion) VALUES (1, 'Empadronamiento', 'Empadronamiento');


--
-- Name: datos_estadisticos_liq_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY datos_estadisticos_liq
    ADD CONSTRAINT datos_estadisticos_liq_pkey PRIMARY KEY (id_datos_estadisticos_liq);


--
-- Name: emp_beneficiario_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY emp_beneficiario
    ADD CONSTRAINT emp_beneficiario_pkey PRIMARY KEY (id_beneficiario);


--
-- Name: emp_beneficio_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY emp_beneficio
    ADD CONSTRAINT emp_beneficio_pkey PRIMARY KEY (id_beneficio);


--
-- Name: emp_identificacion_persona_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY emp_identificacion_persona
    ADD CONSTRAINT emp_identificacion_persona_pkey PRIMARY KEY (id_identificacion_persona);


--
-- Name: emp_vinculo_previsional_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY emp_vinculo_previsional
    ADD CONSTRAINT emp_vinculo_previsional_pkey PRIMARY KEY (id_vinculo_previsional);


--
-- Name: estado_beneficiario_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado_beneficiario
    ADD CONSTRAINT estado_beneficiario_pkey PRIMARY KEY (id_estado_beneficiario);


--
-- Name: estado_beneficio_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado_beneficio
    ADD CONSTRAINT estado_beneficio_pkey PRIMARY KEY (id_estado_beneficio);


--
-- Name: estado_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id_estado);


--
-- Name: log_gestion_pagos_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY log_gestion_pagos
    ADD CONSTRAINT log_gestion_pagos_pkey PRIMARY KEY (id_log_gestion_pagos);


--
-- Name: log_recepcion_liq_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY log_recepcion_liq
    ADD CONSTRAINT log_recepcion_liq_pkey PRIMARY KEY (id_log_recepcion_liq);


--
-- Name: log_transaccional_emp_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY log_transaccional_emp
    ADD CONSTRAINT log_transaccional_emp_pkey PRIMARY KEY (id_log_transaccional);


--
-- Name: log_transaccional_liq_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY log_transaccional_liq
    ADD CONSTRAINT log_transaccional_liq_pkey PRIMARY KEY (id_log_transaccional_liq);


--
-- Name: moneda_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY moneda
    ADD CONSTRAINT moneda_pkey PRIMARY KEY (id_moneda);


--
-- Name: pais_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id_pais);


--
-- Name: prestacion_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY prestacion
    ADD CONSTRAINT prestacion_pkey PRIMARY KEY (id_prestacion);


--
-- Name: tipo_documento_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_documento
    ADD CONSTRAINT tipo_documento_pkey PRIMARY KEY (id_tipo_documento);


--
-- Name: tipo_envio_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_envio
    ADD CONSTRAINT tipo_envio_pkey PRIMARY KEY (id_tipo_envio);


--
-- Name: tipo_informacion_pkey; Type: CONSTRAINT; Schema: siacioiss; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_informacion
    ADD CONSTRAINT tipo_informacion_pkey PRIMARY KEY (id_tipo_informacion);


--
-- Name: fk_5249sd3ju56ykrug8jbclbgx6; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY emp_beneficio
    ADD CONSTRAINT fk_5249sd3ju56ykrug8jbclbgx6 FOREIGN KEY (id_pais_usuario) REFERENCES pais(id_pais);


--
-- Name: fk_55x7bupsa92wkq58txrku0bbf; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY datos_estadisticos_liq
    ADD CONSTRAINT fk_55x7bupsa92wkq58txrku0bbf FOREIGN KEY (id_moneda_pais_pagador) REFERENCES moneda(id_moneda);


--
-- Name: fk_5ca8xachbdt5saiep43m407nb; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY datos_estadisticos_liq
    ADD CONSTRAINT fk_5ca8xachbdt5saiep43m407nb FOREIGN KEY (id_pais_destino) REFERENCES pais(id_pais);


--
-- Name: fk_7673ajgsyd7pp7q5g5rxkjahh; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY moneda
    ADD CONSTRAINT fk_7673ajgsyd7pp7q5g5rxkjahh FOREIGN KEY (id_pais) REFERENCES pais(id_pais);


--
-- Name: fk_9agq1modr9b1xtbhmrdotuca2; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY emp_identificacion_persona
    ADD CONSTRAINT fk_9agq1modr9b1xtbhmrdotuca2 FOREIGN KEY (id_pais) REFERENCES pais(id_pais);


--
-- Name: fk_ag4mibagubr7es3pkg3vjh810; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY datos_estadisticos_liq
    ADD CONSTRAINT fk_ag4mibagubr7es3pkg3vjh810 FOREIGN KEY (id_prestacion) REFERENCES prestacion(id_prestacion);


--
-- Name: fk_bpmtoq6sqmtq8vc6pev85y5a9; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY datos_estadisticos_liq
    ADD CONSTRAINT fk_bpmtoq6sqmtq8vc6pev85y5a9 FOREIGN KEY (id_pais_origen) REFERENCES pais(id_pais);


--
-- Name: fk_dnkxwotlrih4bbra78br1hbuk; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY emp_vinculo_previsional
    ADD CONSTRAINT fk_dnkxwotlrih4bbra78br1hbuk FOREIGN KEY (id_estado_beneficio) REFERENCES estado_beneficio(id_estado_beneficio);


--
-- Name: fk_fcl0agauc7cr92stgm4ho8keh; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY tipo_documento
    ADD CONSTRAINT fk_fcl0agauc7cr92stgm4ho8keh FOREIGN KEY (id_pais) REFERENCES pais(id_pais);


--
-- Name: fk_g9auc1wb9bxennfmw5baxr3qx; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY emp_identificacion_persona
    ADD CONSTRAINT fk_g9auc1wb9bxennfmw5baxr3qx FOREIGN KEY (id_tipo_documento) REFERENCES tipo_documento(id_tipo_documento);


--
-- Name: fk_ihsi5nvyhkfn3w1asj0j0hkw; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY emp_vinculo_previsional
    ADD CONSTRAINT fk_ihsi5nvyhkfn3w1asj0j0hkw FOREIGN KEY (id_pais_gestor) REFERENCES pais(id_pais);


--
-- Name: fk_jlbf46ambbmi038moumohn6nc; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY datos_estadisticos_liq
    ADD CONSTRAINT fk_jlbf46ambbmi038moumohn6nc FOREIGN KEY (id_moneda_pais_gestor) REFERENCES moneda(id_moneda);


--
-- Name: fk_m140slxepa5uxlhir8tkqoe2l; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY emp_beneficio
    ADD CONSTRAINT fk_m140slxepa5uxlhir8tkqoe2l FOREIGN KEY (id_pais_pagador) REFERENCES pais(id_pais);


--
-- Name: fk_o8sab51srs5mqb8s59bro4cp1; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY emp_beneficiario
    ADD CONSTRAINT fk_o8sab51srs5mqb8s59bro4cp1 FOREIGN KEY (id_pais_usuario) REFERENCES pais(id_pais);


--
-- Name: fk_oy4qeqs7yi6xcb993c9ri930m; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY emp_beneficiario
    ADD CONSTRAINT fk_oy4qeqs7yi6xcb993c9ri930m FOREIGN KEY (id_estado_beneficiario) REFERENCES estado_beneficiario(id_estado_beneficiario);


--
-- Name: fk_p4clrkkcj1nxoegxdctjfns0y; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY emp_beneficiario
    ADD CONSTRAINT fk_p4clrkkcj1nxoegxdctjfns0y FOREIGN KEY (id_pais_nacionalidad) REFERENCES pais(id_pais);


--
-- Name: fk_q2e40v4w32nnvqwurpvjl4ken; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY emp_beneficiario
    ADD CONSTRAINT fk_q2e40v4w32nnvqwurpvjl4ken FOREIGN KEY (id_pais_residencia) REFERENCES pais(id_pais);


--
-- Name: fk_r16td8kt9fyrobijt66bywek5; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY emp_beneficio
    ADD CONSTRAINT fk_r16td8kt9fyrobijt66bywek5 FOREIGN KEY (id_prestacion) REFERENCES prestacion(id_prestacion);


--
-- Name: fk_ric95ytain1fr20g2j9uf4jfo; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY emp_vinculo_previsional
    ADD CONSTRAINT fk_ric95ytain1fr20g2j9uf4jfo FOREIGN KEY (id_pais_usuario) REFERENCES pais(id_pais);


--
-- Name: fk_smg1aqaogeabjeefw05mouxvg; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY emp_identificacion_persona
    ADD CONSTRAINT fk_smg1aqaogeabjeefw05mouxvg FOREIGN KEY (id_pais_usuario) REFERENCES pais(id_pais);


--
-- Name: fk_t46n2wtkryn4nkytqh7juns0q; Type: FK CONSTRAINT; Schema: siacioiss; Owner: postgres
--

ALTER TABLE ONLY emp_vinculo_previsional
    ADD CONSTRAINT fk_t46n2wtkryn4nkytqh7juns0q FOREIGN KEY (id_pais_pagador) REFERENCES pais(id_pais);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: siacioiss; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA siacioiss FROM PUBLIC;
REVOKE ALL ON SCHEMA siacioiss FROM postgres;
GRANT ALL ON SCHEMA siacioiss TO postgres;
GRANT ALL ON SCHEMA siacioiss TO admin;


--
-- Name: log_buscar_log_gestion_pagos(character varying, character varying, smallint, smallint, smallint, smallint); Type: ACL; Schema: siacioiss; Owner: admin
--

REVOKE ALL ON FUNCTION log_buscar_log_gestion_pagos(fdesde character varying, fhasta character varying, idpaisorigen smallint, idpaisdestino smallint, idtipoinformacion smallint, idestado smallint) FROM PUBLIC;
REVOKE ALL ON FUNCTION log_buscar_log_gestion_pagos(fdesde character varying, fhasta character varying, idpaisorigen smallint, idpaisdestino smallint, idtipoinformacion smallint, idestado smallint) FROM admin;
GRANT ALL ON FUNCTION log_buscar_log_gestion_pagos(fdesde character varying, fhasta character varying, idpaisorigen smallint, idpaisdestino smallint, idtipoinformacion smallint, idestado smallint) TO admin;
GRANT ALL ON FUNCTION log_buscar_log_gestion_pagos(fdesde character varying, fhasta character varying, idpaisorigen smallint, idpaisdestino smallint, idtipoinformacion smallint, idestado smallint) TO PUBLIC;


--
-- Name: obtener_paises(); Type: ACL; Schema: siacioiss; Owner: admin
--

REVOKE ALL ON FUNCTION obtener_paises() FROM PUBLIC;
REVOKE ALL ON FUNCTION obtener_paises() FROM admin;
GRANT ALL ON FUNCTION obtener_paises() TO admin;
GRANT ALL ON FUNCTION obtener_paises() TO PUBLIC;


--
-- Name: obtener_prestaciones(); Type: ACL; Schema: siacioiss; Owner: admin
--

REVOKE ALL ON FUNCTION obtener_prestaciones() FROM PUBLIC;
REVOKE ALL ON FUNCTION obtener_prestaciones() FROM admin;
GRANT ALL ON FUNCTION obtener_prestaciones() TO admin;
GRANT ALL ON FUNCTION obtener_prestaciones() TO PUBLIC;


--
-- Name: emp_vinculo_previsional; Type: ACL; Schema: siacioiss; Owner: postgres
--

REVOKE ALL ON TABLE emp_vinculo_previsional FROM PUBLIC;
REVOKE ALL ON TABLE emp_vinculo_previsional FROM postgres;
GRANT ALL ON TABLE emp_vinculo_previsional TO postgres;
GRANT ALL ON TABLE emp_vinculo_previsional TO PUBLIC;


--
-- PostgreSQL database dump complete
--

