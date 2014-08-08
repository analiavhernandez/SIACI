--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: siaci; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE siaci WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Argentina.1252' LC_CTYPE = 'Spanish_Argentina.1252';


ALTER DATABASE siaci OWNER TO postgres;

\connect siaci

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: siacilocal; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA siacilocal;


ALTER SCHEMA siacilocal OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = siacilocal, pg_catalog;

--
-- Name: resultado_busqueda; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE resultado_busqueda AS (
	id_beneficiario bigint,
	padron bigint,
	apellido character varying(70),
	nombre character varying(100),
	apellido_paterno character varying(70),
	nombre_paterno character varying(100),
	apellido_materno character varying(70),
	nombre_materno character varying(100),
	sexo character(1),
	f_nacimiento date,
	id_pais_nacionalidad smallint,
	c_pais_nacionalidad character varying(20),
	d_pais_nacionalidad character varying(50),
	id_estado_civil smallint,
	c_estado_civil character varying(20),
	d_estado_civil character varying(50),
	id_pais_residencia smallint,
	c_pais_residencia character varying(20),
	d_pais_residencia character varying(50),
	id_estado_beneficiario smallint,
	c_estado_beneficiario character varying(20),
	d_estado_beneficiario character varying(50),
	f_estado date,
	motivo_estado character varying(100),
	id_identificacion_persona bigint,
	id_tipo_documento smallint,
	c_tipo_documento character varying(20),
	d_tipo_documento character varying(50),
	id_pais_documento smallint,
	nro_documento character varying(20),
	f_emision_documento date,
	id_domicilio bigint,
	id_pais smallint,
	c_pais character varying(20),
	d_pais character varying(50),
	calle character varying(40),
	nro_puerta character varying(10),
	piso character varying(5),
	departamento character varying(10),
	codigo_postal character varying(10),
	localidad character varying(30),
	estado_provincia character varying(30),
	nro_telefono character varying(20),
	correo_electronico character varying(50),
	f_fallecimiento date
);


ALTER TYPE siacilocal.resultado_busqueda OWNER TO admin;

--
-- Name: resultado_busqueda_actualizacion; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE resultado_busqueda_actualizacion AS (
	id_beneficiario bigint,
	padron bigint,
	apellido character varying(70),
	nombre character varying(100),
	apellido_paterno character varying(70),
	nombre_paterno character varying(100),
	apellido_materno character varying(70),
	nombre_materno character varying(100),
	sexo character(1),
	f_nacimiento date,
	id_pais_nacionalidad smallint,
	d_pais_nacionalidad character varying(50),
	id_estado_civil smallint,
	d_estado_civil character varying(50),
	id_pais_residencia smallint,
	d_pais_residencia character varying(50),
	id_estado_beneficiario smallint,
	d_estado_beneficiario character varying(50),
	f_estado date,
	motivo_estado character varying(100),
	f_fallecimiento date,
	usuario character varying,
	id_tipo_actualizacion smallint,
	d_tipo_actualizacion character varying(50),
	registro_actual character varying,
	registro_anterior character varying,
	f_actualizacion date
);


ALTER TYPE siacilocal.resultado_busqueda_actualizacion OWNER TO admin;

--
-- Name: resultado_busqueda_aprobacionmodalidadonline; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE resultado_busqueda_aprobacionmodalidadonline AS (
	padron bigint,
	d_pais_gestor character varying(50),
	fecha_alta date,
	apellido character varying(70),
	nombre character varying(100),
	apellido_materno character varying(70),
	apellido_paterno character varying(70)
);


ALTER TYPE siacilocal.resultado_busqueda_aprobacionmodalidadonline OWNER TO admin;

--
-- Name: resultado_busqueda_beneficiarioporpadron; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE resultado_busqueda_beneficiarioporpadron AS (
	id_beneficiario bigint,
	padron bigint,
	apellido character varying(70),
	nombre character varying(100),
	apellido_paterno character varying(70),
	nombre_paterno character varying(100),
	apellido_materno character varying(70),
	nombre_materno character varying(100),
	sexo character(1),
	f_nacimiento date,
	id_pais_nacionalidad smallint,
	d_pais_nacionalidad character varying(50),
	id_estado_civil smallint,
	d_estado_civil character varying(50),
	id_pais_residencia smallint,
	d_pais_residencia character varying(50),
	id_estado_beneficiario smallint,
	d_estado_beneficiario character varying(50),
	f_estado date,
	motivo_estado character varying(100),
	f_fallecimiento date,
	id_identificacion_persona bigint,
	id_tipo_documento smallint,
	id_pais_documento smallint,
	d_pais_documento character varying(50),
	c_tipo_documento character varying(20),
	nro_documento character varying(20),
	codigo character varying(20),
	f_emision_documento date,
	id_domicilio bigint,
	calle character varying(40),
	nro_puerta character varying(10),
	piso character varying(5),
	departamento character varying(10),
	codigo_postal character varying(10),
	localidad character varying(30),
	estado_provincia character varying(30),
	nro_telefono character varying(20),
	correo_electronico character varying(50),
	id_vinculo_previsional bigint,
	id_pais_gestor smallint,
	d_pais_gestor character varying(50),
	id_pais_pagador smallint,
	d_pais_pagador character varying(50),
	f_alta date,
	id_oficina_dependencia smallint,
	id_estado_beneficio smallint,
	d_estado_beneficio character varying(50),
	f_estado_vinculo date,
	motivo_estado_vinculo character varying(100)
);


ALTER TYPE siacilocal.resultado_busqueda_beneficiarioporpadron OWNER TO admin;

--
-- Name: resultado_busqueda_estadocivil; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE resultado_busqueda_estadocivil AS (
	id_estado_civil integer,
	c_estado_civil character varying(20),
	d_estado_civil character varying(50)
);


ALTER TYPE siacilocal.resultado_busqueda_estadocivil OWNER TO admin;

--
-- Name: resultado_busqueda_padron; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE resultado_busqueda_padron AS (
	d_pais_gestor character varying(50),
	d_pais_pagador character varying(50),
	padron bigint,
	id_beneficiario bigint,
	f_alta date,
	apellido_materno character varying(70),
	apellido_paterno character varying(70),
	nombre character varying(100),
	id_pais_documento smallint,
	d_pais_documento character varying(50),
	c_tipo_documento character varying(50),
	nro_documento character varying(20),
	f_emision_documento date,
	estado_beneficio character varying(50),
	estado_beneficiario character varying(50),
	d_prestacion character varying(50),
	f_ult_liq date
);


ALTER TYPE siacilocal.resultado_busqueda_padron OWNER TO admin;

--
-- Name: resultado_busqueda_pais; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE resultado_busqueda_pais AS (
	id_pais integer,
	c_pais character varying(20),
	d_pais character varying(50)
);


ALTER TYPE siacilocal.resultado_busqueda_pais OWNER TO admin;

--
-- Name: resultado_busqueda_rol; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE resultado_busqueda_rol AS (
	id_rol integer,
	c_rol character varying(5),
	d_rol character varying(20)
);


ALTER TYPE siacilocal.resultado_busqueda_rol OWNER TO admin;

--
-- Name: resultado_busqueda_tipodocumento; Type: TYPE; Schema: siacilocal; Owner: postgres
--

CREATE TYPE resultado_busqueda_tipodocumento AS (
	id_pais smallint,
	id_tipo_documento smallint,
	c_tipo_documento character varying(20),
	gestor_obligatorio boolean,
	pagador_obligatorio boolean
);


ALTER TYPE siacilocal.resultado_busqueda_tipodocumento OWNER TO postgres;

--
-- Name: resultado_seguimineto_emp; Type: TYPE; Schema: siacilocal; Owner: postgres
--

CREATE TYPE resultado_seguimineto_emp AS (
	id_beneficiario bigint,
	nombre character varying(100),
	apellido_paterno character varying(70),
	nombre_paterno character varying(100),
	apellido_materno character varying(70),
	nombre_materno character varying(100)
);


ALTER TYPE siacilocal.resultado_seguimineto_emp OWNER TO postgres;

--
-- Name: typ_benefiaciario; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_benefiaciario AS (
	id_beneficiario bigint,
	padron bigint,
	apellido character varying(70),
	nombre character varying(100),
	apellido_paterno character varying(70),
	nombre_paterno character varying(100),
	apellido_materno character varying(70),
	nombre_materno character varying(100),
	sexo character(1),
	f_nacimiento date,
	id_pais_nacionalidad smallint,
	d_pais_nacionalidad character varying(50),
	id_estado_civil smallint,
	d_estado_civil character varying(50),
	id_pais_residencia smallint,
	d_pais_residencia character varying(50),
	id_estado_beneficiario smallint,
	d_estado_beneficiario character varying(50),
	f_estado date,
	motivo_estado character varying(100),
	f_fallecimiento date
);


ALTER TYPE siacilocal.typ_benefiaciario OWNER TO admin;

--
-- Name: typ_beneficio; Type: TYPE; Schema: siacilocal; Owner: postgres
--

CREATE TYPE typ_beneficio AS (
	id_beneficio bigint,
	id_beneficiario bigint,
	id_pais_pagador smallint,
	id_prestacion smallint,
	f_ult_liq date
);


ALTER TYPE siacilocal.typ_beneficio OWNER TO postgres;

--
-- Name: typ_usuario; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_usuario AS (
	usuario character varying(50),
	apellido character varying(100),
	nombre character varying(100),
	correo_electronico character varying(50),
	id_pais_origen smallint,
	perfil character varying(20)
);


ALTER TYPE siacilocal.typ_usuario OWNER TO admin;

--
-- Name: typ_beneficio_alta; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_beneficio_alta AS (
	beneficio typ_beneficio,
	usuario typ_usuario
);


ALTER TYPE siacilocal.typ_beneficio_alta OWNER TO admin;

--
-- Name: typ_configuracion_servidor_pais; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_configuracion_servidor_pais AS (
	id_servidor_pais smallint,
	id_pais integer,
	url character varying
);


ALTER TYPE siacilocal.typ_configuracion_servidor_pais OWNER TO admin;

--
-- Name: typ_domicilio; Type: TYPE; Schema: siacilocal; Owner: postgres
--

CREATE TYPE typ_domicilio AS (
	id_domicilio bigint,
	id_beneficiario bigint,
	id_pais_domicilio smallint,
	d_pais_domicilio character varying(50),
	calle character varying(40),
	nro_puerta character varying(10),
	piso character varying(5),
	departamento character varying(10),
	codigo_postal character varying(100),
	localidad character varying(30),
	estado_provincia character varying(30),
	nro_telefono character varying(20),
	correo_electronico character varying(50)
);


ALTER TYPE siacilocal.typ_domicilio OWNER TO postgres;

--
-- Name: typ_emp_seguimiento_domicilio; Type: TYPE; Schema: siacilocal; Owner: postgres
--

CREATE TYPE typ_emp_seguimiento_domicilio AS (
	id_seguimiento_domicilio bigint,
	id_beneficiario bigint,
	id_estado_domicilio smallint,
	fecha_estado_domicilio date,
	fecha_alta date
);


ALTER TYPE siacilocal.typ_emp_seguimiento_domicilio OWNER TO postgres;

--
-- Name: typ_emp_seguimiento_domicilio_alta; Type: TYPE; Schema: siacilocal; Owner: postgres
--

CREATE TYPE typ_emp_seguimiento_domicilio_alta AS (
	emp_seguimiento_domicilio typ_emp_seguimiento_domicilio,
	usuario typ_usuario
);


ALTER TYPE siacilocal.typ_emp_seguimiento_domicilio_alta OWNER TO postgres;

--
-- Name: typ_emp_seguimiento_empadronamiento; Type: TYPE; Schema: siacilocal; Owner: postgres
--

CREATE TYPE typ_emp_seguimiento_empadronamiento AS (
	id_seguimiento_emp bigint,
	id_beneficiario bigint,
	id_estado_emp smallint,
	fecha_estado_emp date,
	fecha_alta date
);


ALTER TYPE siacilocal.typ_emp_seguimiento_empadronamiento OWNER TO postgres;

--
-- Name: typ_emp_seguimiento_empadronamiento_alta; Type: TYPE; Schema: siacilocal; Owner: postgres
--

CREATE TYPE typ_emp_seguimiento_empadronamiento_alta AS (
	emp_seguimiento_empadronamiento typ_emp_seguimiento_empadronamiento,
	usuario typ_usuario
);


ALTER TYPE siacilocal.typ_emp_seguimiento_empadronamiento_alta OWNER TO postgres;

--
-- Name: typ_emp_seguimiento_vinculo; Type: TYPE; Schema: siacilocal; Owner: postgres
--

CREATE TYPE typ_emp_seguimiento_vinculo AS (
	id_seguimiento_vinculo bigint,
	id_vinculo_previsional bigint,
	id_estado_vinculo smallint,
	fecha_estado_vinculo date,
	fecha_alta date
);


ALTER TYPE siacilocal.typ_emp_seguimiento_vinculo OWNER TO postgres;

--
-- Name: typ_emp_seguimiento_vinculo_alta; Type: TYPE; Schema: siacilocal; Owner: postgres
--

CREATE TYPE typ_emp_seguimiento_vinculo_alta AS (
	emp_seguimiento_vinculo typ_emp_seguimiento_vinculo,
	usuario typ_usuario
);


ALTER TYPE siacilocal.typ_emp_seguimiento_vinculo_alta OWNER TO postgres;

--
-- Name: typ_ident_persona; Type: TYPE; Schema: siacilocal; Owner: postgres
--

CREATE TYPE typ_ident_persona AS (
	id_identificacion_persona bigint,
	id_beneficiario bigint,
	id_pais_documento smallint,
	d_pais_documento character varying(50),
	id_tipo_documento smallint,
	c_tipo_documento character varying(20),
	d_tipo_documento character varying(50),
	nro_documento character varying(20),
	f_emision_documento date,
	doc_elegido boolean,
	id_estado_beneficiario smallint,
	nro_inscripcion character varying(15),
	organismo_inscripcion character varying(100)
);


ALTER TYPE siacilocal.typ_ident_persona OWNER TO postgres;

--
-- Name: typ_ident_persona_alta; Type: TYPE; Schema: siacilocal; Owner: postgres
--

CREATE TYPE typ_ident_persona_alta AS (
	ident_persona typ_ident_persona,
	usuario typ_usuario
);


ALTER TYPE siacilocal.typ_ident_persona_alta OWNER TO postgres;

--
-- Name: typ_liq_liquidacion; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_liq_liquidacion AS (
	id_seguimiento_rendicion bigint,
	marca_pago text,
	fecha_pago timestamp without time zone,
	nro_padron bigint
);


ALTER TYPE siacilocal.typ_liq_liquidacion OWNER TO admin;

--
-- Name: typ_liq_liquidacion_local; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_liq_liquidacion_local AS (
	id_liquidacion_local bigint,
	pe_emision integer,
	cod_envio integer,
	id_pais_pagador integer,
	id_pais_gestor integer,
	id_tipo_prestacion integer,
	ident_prestacion bigint,
	pe_liquidado integer,
	f_inicio_credito date,
	f_fin_credito date,
	padron bigint,
	imp_bruto_mon_origen double precision,
	desc_mon_origen double precision,
	imp_neto_mon_origen double precision,
	imp_neto_mon_destino double precision,
	marca_pago character(1),
	f_pago date,
	id_seguimiento_liquidacion bigint
);


ALTER TYPE siacilocal.typ_liq_liquidacion_local OWNER TO admin;

--
-- Name: typ_liq_liquidacion_local_actu; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_liq_liquidacion_local_actu AS (
	padron bigint,
	id_pais_pagador integer,
	id_pais_gestor integer,
	cod_envio integer,
	marca_pago character(1),
	f_pago date,
	id_seguimiento_liquidacion bigint,
	id_seguimiento_rendicion bigint
);


ALTER TYPE siacilocal.typ_liq_liquidacion_local_actu OWNER TO admin;

--
-- Name: typ_liq_oiss_log_recepcion_liq; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_liq_oiss_log_recepcion_liq AS (
	id_liq_oiss_log_recepcion_liq bigint,
	pe_emision integer,
	id_pais_pagador smallint,
	f_recepcion timestamp with time zone,
	cod_envio integer,
	id_pais_gestor smallint,
	id_estado_recepcion smallint,
	motivo_estado_error character varying(512)
);


ALTER TYPE siacilocal.typ_liq_oiss_log_recepcion_liq OWNER TO admin;

--
-- Name: typ_liq_oiss_log_transaccional; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_liq_oiss_log_transaccional AS (
	id_liq_oiss_log_transaccional bigint,
	pe_emision integer,
	id_pais_pagador smallint,
	f_envio timestamp with time zone,
	cod_envio integer,
	id_pais_gestor smallint,
	f_transmision timestamp with time zone,
	hora_transmision timestamp with time zone,
	id_estado_transmision integer
);


ALTER TYPE siacilocal.typ_liq_oiss_log_transaccional OWNER TO admin;

--
-- Name: typ_liq_reporte_rendicion; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_liq_reporte_rendicion AS (
	periodo_emision integer,
	id_pais_pagador integer,
	c_pais_paispagador character varying,
	d_pais_paispagador character varying,
	cod_envio integer,
	id_pais_paisgestor integer,
	c_pais_paisgestor character varying,
	d_pais_paisgestor character varying,
	id_estado_rendicion integer,
	c_estado_rendicion character varying,
	d_estado_rendicion character varying,
	fecha_ultima_rendicion timestamp without time zone,
	cant_total_casos_impagos integer,
	cant_total_casos_pagos integer,
	f_recepcion_rendicion timestamp without time zone
);


ALTER TYPE siacilocal.typ_liq_reporte_rendicion OWNER TO admin;

--
-- Name: typ_liq_seguimiento_liquidacion; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_liq_seguimiento_liquidacion AS (
	id_seguimiento_liquidacion bigint,
	pe_emision integer,
	cod_envio integer,
	id_pais_remitente integer,
	id_pais_destino integer,
	f_envio timestamp with time zone,
	f_recepcion timestamp with time zone,
	id_estado_despacho integer,
	f_estado timestamp with time zone,
	motivo_estado_error character varying(512),
	imp_total_neto_original double precision,
	id_moneda_pagador integer,
	id_moneda_gestor integer,
	coeficiente_cambio double precision,
	imp_total_neto_destino double precision,
	m_transmitido character varying(1)
);


ALTER TYPE siacilocal.typ_liq_seguimiento_liquidacion OWNER TO admin;

--
-- Name: typ_liq_seguimiento_rendicion; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_liq_seguimiento_rendicion AS (
	id_seguimiento_rendicion bigint,
	pe_emision integer,
	cod_envio integer,
	id_pais_remitente integer,
	id_pais_destino integer,
	nro_rendicion bigint,
	f_envio_rendicion timestamp without time zone,
	f_recepcion_rendicion timestamp without time zone,
	id_estado_rendicion integer,
	f_estado timestamp without time zone,
	cant_total_casos_impagos integer,
	cant_total_casos_pagos integer
);


ALTER TYPE siacilocal.typ_liq_seguimiento_rendicion OWNER TO admin;

--
-- Name: typ_padron; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_padron AS (
	beneficiario typ_benefiaciario
);


ALTER TYPE siacilocal.typ_padron OWNER TO admin;

--
-- Name: typ_padron_actualizacion; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_padron_actualizacion AS (
	padron bigint,
	fechafallecimiento date,
	usuario typ_usuario
);


ALTER TYPE siacilocal.typ_padron_actualizacion OWNER TO admin;

--
-- Name: typ_padron_alta; Type: TYPE; Schema: siacilocal; Owner: postgres
--

CREATE TYPE typ_padron_alta AS (
	beneficiario typ_benefiaciario,
	domicilio typ_domicilio,
	usuario typ_usuario
);


ALTER TYPE siacilocal.typ_padron_alta OWNER TO postgres;

--
-- Name: typ_resultado_actualizacion_modificacion; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_resultado_actualizacion_modificacion AS (
	cant_reg_informados integer,
	cant_reg_actualizados_fecha_falle integer,
	cant_reg_actualizados_domicilio integer,
	cant_reg_fecha_falle_erro integer,
	cant_reg_domicilio_erro integer,
	cant_reg_sinactualizar integer
);


ALTER TYPE siacilocal.typ_resultado_actualizacion_modificacion OWNER TO admin;

--
-- Name: typ_resultado_actuzalizacion; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_resultado_actuzalizacion AS (
	cant_reg_procesados integer,
	cant_reg_actualizados integer,
	cant_reg_confirmados integer,
	cant_reg_rechazados integer,
	cant_reg_sinactualizar integer
);


ALTER TYPE siacilocal.typ_resultado_actuzalizacion OWNER TO admin;

--
-- Name: typ_resultado_operacion_batch; Type: TYPE; Schema: siacilocal; Owner: admin
--

CREATE TYPE typ_resultado_operacion_batch AS (
	cant_reg_procesados integer,
	cant_reg_alta integer,
	cant_reg_actualizados integer,
	cant_reg_confirmados integer,
	cant_reg_rechazados integer,
	cant_reg_sinactualizar integer,
	archivo character varying
);


ALTER TYPE siacilocal.typ_resultado_operacion_batch OWNER TO admin;

--
-- Name: typ_vinculo_previsional; Type: TYPE; Schema: siacilocal; Owner: postgres
--

CREATE TYPE typ_vinculo_previsional AS (
	id_vinculo_previsional bigint,
	id_beneficiario bigint,
	id_pais_gestor smallint,
	d_pais_gestor character varying(50),
	id_pais_pagador smallint,
	d_pais_pagador character varying(50),
	f_alta date,
	id_oficina_dependencia smallint,
	id_estado_beneficio smallint,
	d_estado_beneficio character varying(50),
	f_estado date,
	motivo_estado_vinculo character varying(100)
);


ALTER TYPE siacilocal.typ_vinculo_previsional OWNER TO postgres;

--
-- Name: typ_vinculo_previsional_alta; Type: TYPE; Schema: siacilocal; Owner: postgres
--

CREATE TYPE typ_vinculo_previsional_alta AS (
	vinculo_previsional typ_vinculo_previsional,
	usuario typ_usuario
);


ALTER TYPE siacilocal.typ_vinculo_previsional_alta OWNER TO postgres;

--
-- Name: conf_busca_configuracion_servidor_pais(); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION conf_busca_configuracion_servidor_pais() RETURNS TABLE(id_servidor_pais integer, id_pais integer, url character varying)
    LANGUAGE sql
    AS $$SELECT 
  id_servidor_pais, 
  id_pais, 
  url
FROM 
  siacilocal.configuracion_servidor_pais$$;


ALTER FUNCTION siacilocal.conf_busca_configuracion_servidor_pais() OWNER TO admin;

--
-- Name: conf_busca_configuracion_servidor_pais(smallint); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION conf_busca_configuracion_servidor_pais(smallint) RETURNS TABLE(id_servidor_pais integer, id_pais integer, url character varying)
    LANGUAGE sql
    AS $_$SELECT 
  id_servidor_pais, 
  id_pais, 
  url
FROM 
  siacilocal.configuracion_servidor_pais
  where id_pais = $1;

$_$;


ALTER FUNCTION siacilocal.conf_busca_configuracion_servidor_pais(smallint) OWNER TO admin;

--
-- Name: conf_busca_datos_pais(); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION conf_busca_datos_pais() RETURNS TABLE(id_pais integer, id_tipo_documento integer, id_moneda_transferencia integer, valida_nro_doc bit, valida_beneficio bit, beneficio_gestor bit, beneficio_pagador bit, gestor_obligatorio bit, pagador_obligatorio bit)
    LANGUAGE sql COST 1000
    AS $$
SELECT dp.id_pais, tp.id_tipo_documento, id_moneda_transferencia, CAST(CASE WHEN valida_nro_doc THEN 1 ELSE 0 END AS BIT), CAST(CASE WHEN valida_beneficio THEN 1 ELSE 0 END AS BIT),
CAST (0 AS BIT) AS beneficio_gestor, CAST(CASE WHEN beneficio_pagador THEN 1 ELSE 0 END AS BIT), CAST(CASE WHEN gestor_obligatorio THEN 1 ELSE 0 END AS BIT), CAST(CASE WHEN pagador_obligatorio THEN 1 ELSE 0 END AS BIT)
FROM  siacilocal.datos_pais dp
INNER JOIN siacilocal.tipo_documento tp ON dp.id_pais = tp.id_pais
WHERE NOT EXISTS (
    SELECT 1 FROM siacilocal.tipo_documento tp2
    WHERE tp2.id_pais = tp.id_pais
    AND tp2.id_tipo_documento < tp.id_tipo_documento
)
	
$$;


ALTER FUNCTION siacilocal.conf_busca_datos_pais() OWNER TO admin;

--
-- Name: emp_busca_estado_civil(); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION emp_busca_estado_civil() RETURNS SETOF resultado_busqueda_estadocivil
    LANGUAGE sql
    AS $$select id_estado_civil, c_estado_civil , d_estado_civil 
From siacilocal.estado_civil
 $$;


ALTER FUNCTION siacilocal.emp_busca_estado_civil() OWNER TO admin;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: estado_beneficiario; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE estado_beneficiario (
    id_estado_beneficiario integer NOT NULL,
    c_estado_beneficiario character varying(255) NOT NULL,
    d_estado_beneficiario character varying(255) NOT NULL
);


ALTER TABLE siacilocal.estado_beneficiario OWNER TO postgres;

--
-- Name: emp_busca_estadosbeneficiario(); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION emp_busca_estadosbeneficiario() RETURNS SETOF estado_beneficiario
    LANGUAGE sql
    AS $$select id_estado_beneficiario, c_estado_beneficiario, d_estado_beneficiario
From siacilocal.estado_beneficiario
 $$;


ALTER FUNCTION siacilocal.emp_busca_estadosbeneficiario() OWNER TO admin;

--
-- Name: estado_beneficio; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE estado_beneficio (
    id_estado_beneficio integer NOT NULL,
    c_estado_beneficio character varying(255) NOT NULL,
    d_estado_beneficio character varying(255) NOT NULL
);


ALTER TABLE siacilocal.estado_beneficio OWNER TO postgres;

--
-- Name: emp_busca_estadosbeneficio(); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION emp_busca_estadosbeneficio() RETURNS SETOF estado_beneficio
    LANGUAGE sql
    AS $$select id_estado_beneficio, c_estado_beneficio, d_estado_beneficio
From siacilocal.estado_beneficio$$;


ALTER FUNCTION siacilocal.emp_busca_estadosbeneficio() OWNER TO admin;

--
-- Name: emp_busca_paises(); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION emp_busca_paises() RETURNS SETOF resultado_busqueda_pais
    LANGUAGE sql ROWS 100
    AS $$select id_pais, c_pais, d_pais
From siacilocal.pais$$;


ALTER FUNCTION siacilocal.emp_busca_paises() OWNER TO admin;

--
-- Name: emp_busca_prestacion(); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION emp_busca_prestacion() RETURNS TABLE(id_prestacion integer, c_prestacion character varying, d_prestacion character varying)
    LANGUAGE sql
    AS $$

select id_prestacion, c_prestacion , d_prestacion 
From siacilocal.prestacion

$$;


ALTER FUNCTION siacilocal.emp_busca_prestacion() OWNER TO admin;

--
-- Name: emp_busca_rol(); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION emp_busca_rol() RETURNS SETOF resultado_busqueda_rol
    LANGUAGE sql ROWS 100
    AS $$select id_rol, c_rol, d_rol
From siacilocal.rol$$;


ALTER FUNCTION siacilocal.emp_busca_rol() OWNER TO admin;

--
-- Name: emp_busca_tipodocumento(); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION emp_busca_tipodocumento() RETURNS TABLE(id_pais integer, id_tipo_documento integer, c_tipo_documento character varying, gestor_obligatorio bit, pagador_obligatorio bit)
    LANGUAGE sql ROWS 100
    AS $$

select
	td.id_pais,
	td.id_tipo_documento,
        td.c_tipo_documento,
        CAST(CASE WHEN td.gestor_obligatorio THEN 1 ELSE 0 END AS BIT),
        CAST(CASE WHEN td.pagador_obligatorio THEN 1 ELSE 0 END AS BIT)
From siacilocal.tipo_documento td

$$;


ALTER FUNCTION siacilocal.emp_busca_tipodocumento() OWNER TO admin;

--
-- Name: emp_busca_tipodocumentoxpais(); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION emp_busca_tipodocumentoxpais() RETURNS TABLE(id_pais integer, id_tipo_documento integer, c_tipo_documento character varying, d_tipo_documento character varying)
    LANGUAGE sql
    AS $$

SELECT td.id_pais, td.id_tipo_documento, td.c_tipo_documento, td.d_tipo_documento
  FROM siacilocal.tipo_documento td
  
$$;


ALTER FUNCTION siacilocal.emp_busca_tipodocumentoxpais() OWNER TO admin;

--
-- Name: liq_actualiza_archivo_seguimiento_liq(integer, text); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_actualiza_archivo_seguimiento_liq(idseg integer, archivo text) RETURNS bigint
    LANGUAGE plpgsql STRICT
    AS $_$


BEGIN

	RAISE NOTICE 'ACTUALIZACION seguimiento liquidacion % ', $1;

	UPDATE siacilocal.liq_seguimiento_liquidacion
	SET 	--id_seguimiento_liquidacion=?, 
		archivo_liquidacion=$2
	WHERE id_seguimiento_liquidacion = $1;

	RETURN $1;

END;

$_$;


ALTER FUNCTION siacilocal.liq_actualiza_archivo_seguimiento_liq(idseg integer, archivo text) OWNER TO admin;

--
-- Name: liq_actualiza_oiss_log_recepcion_liq(typ_liq_oiss_log_recepcion_liq); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_actualiza_oiss_log_recepcion_liq(param typ_liq_oiss_log_recepcion_liq) RETURNS bigint
    LANGUAGE plpgsql
    AS $$

BEGIN

	UPDATE siacilocal.liq_oiss_log_recepcion_liq
	   SET --id_liq_oiss_log_recepcion_liq=?, 
		pe_emision=param.pe_emision,
		id_pais_pagador=param.id_pais_pagador,
		f_recepcion=param.f_recepcion,
		cod_envio=param.cod_envio,
		id_pais_gestor=param.id_pais_gestor,
		id_estado_recepcion=param.id_estado_recepcion,
		motivo_estado_error=param.motivo_estado_error
	 WHERE id_liq_oiss_log_recepcion_liq=param.id_liq_oiss_log_recepcion_liq;

	RETURN param.id_liq_oiss_log_recepcion_liq;

END;

$$;


ALTER FUNCTION siacilocal.liq_actualiza_oiss_log_recepcion_liq(param typ_liq_oiss_log_recepcion_liq) OWNER TO admin;

--
-- Name: liq_actualiza_oiss_log_transaccional(typ_liq_oiss_log_transaccional); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_actualiza_oiss_log_transaccional(param typ_liq_oiss_log_transaccional) RETURNS bigint
    LANGUAGE plpgsql
    AS $$

BEGIN

	UPDATE siacilocal.liq_oiss_log_transaccional
	   SET --id_liq_oiss_log_transaccional=?, 
		pe_emision=param.pe_emision, 
		id_pais_pagador=param.id_pais_pagador, 
		f_envio=param.f_envio, 
		cod_envio=param.cod_envio, 
		id_pais_gestor=param.id_pais_gestor, 
		f_transmision=param.f_transmision, 
		hora_transmision=param.hora_transmision, 
	        id_estado_transmision=param.id_estado_transmision
	 WHERE id_liq_oiss_log_transaccional=param.id_liq_oiss_log_transaccional;

	RETURN param.id_liq_oiss_log_transaccional;

END;

$$;


ALTER FUNCTION siacilocal.liq_actualiza_oiss_log_transaccional(param typ_liq_oiss_log_transaccional) OWNER TO admin;

--
-- Name: liq_actualiza_seguimiento_liq(typ_liq_seguimiento_liquidacion); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_actualiza_seguimiento_liq(param typ_liq_seguimiento_liquidacion) RETURNS bigint
    LANGUAGE plpgsql STRICT
    AS $$


BEGIN

	RAISE NOTICE 'ACTUALIZACION seguimiento liquidacion % ', param.pe_emision;

	UPDATE siacilocal.liq_seguimiento_liquidacion
	SET 	--id_seguimiento_liquidacion=?, 
		pe_emision=param.pe_emision, 
		cod_envio=param.cod_envio, 
		id_pais_remitente=param.id_pais_remitente, 
		id_pais_destino=param.id_pais_destino,
		f_envio=param.f_envio, 
		f_recepcion=param.f_recepcion, 
		id_estado_despacho=param.id_estado_despacho, 
		f_estado=CURRENT_TIMESTAMP, 
		motivo_estado_error=param.motivo_estado_error, 
		imp_total_neto_original=param.imp_total_neto_original, 
		--id_moneda_pagador=param.id_moneda_pagador, 
		--id_moneda_gestor=param.id_moneda_gestor, 
		coeficiente_cambio=param.coeficiente_cambio, 
		imp_total_neto_destino=param.imp_total_neto_destino,
		m_transmitido = param.m_transmitido
	WHERE id_seguimiento_liquidacion = param.id_seguimiento_liquidacion;

	RETURN param.id_seguimiento_liquidacion;

END;

$$;


ALTER FUNCTION siacilocal.liq_actualiza_seguimiento_liq(param typ_liq_seguimiento_liquidacion) OWNER TO admin;

--
-- Name: liq_actualiza_seguimiento_rendicion(typ_liq_seguimiento_rendicion); Type: FUNCTION; Schema: siacilocal; Owner: postgres
--

CREATE FUNCTION liq_actualiza_seguimiento_rendicion(param typ_liq_seguimiento_rendicion) RETURNS bigint
    LANGUAGE plpgsql STRICT
    AS $$

BEGIN
    RAISE NOTICE 'ACTUALIZACION seguimiento rendicion % ', param.pe_emision;

    UPDATE siacilocal.liq_seguimiento_rendicion
    SET     --id_seguimiento_rendicion=?,
        pe_emision=param.pe_emision,
        cod_envio=param.cod_envio,
        id_pais_remitente=param.id_pais_remitente,
        id_pais_destino=param.id_pais_destino,
        nro_rendicion=param.nro_rendicion,
        f_envio_rendicion=param.f_envio_rendicion,
        f_recepcion_rendicion=param.f_recepcion_rendicion,
        id_estado_rendicion=param.id_estado_rendicion,
        f_estado=param.f_estado,
        cant_total_casos_impagos=param.cant_total_casos_impagos,
        cant_total_casos_pagos=param.cant_total_casos_pagos
    WHERE id_seguimiento_rendicion = param.id_seguimiento_rendicion;

    RETURN param.id_seguimiento_rendicion;

END;

$$;


ALTER FUNCTION siacilocal.liq_actualiza_seguimiento_rendicion(param typ_liq_seguimiento_rendicion) OWNER TO postgres;

--
-- Name: liq_actualizar_liquidacion(typ_liq_liquidacion); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_actualizar_liquidacion(param typ_liq_liquidacion) RETURNS bigint
    LANGUAGE plpgsql STRICT
    AS $$


BEGIN

    RAISE NOTICE 'ACTUALIZACION seguimiento liquidacion % ', param.id_seguimiento_rendicion;
    RAISE NOTICE ' param.marca_pago% ', param.marca_pago;
    RAISE NOTICE 'param.fecha_pago % ', param.fecha_pago;
    RAISE NOTICE 'param.nro_padron% ', param.nro_padron;
    
    UPDATE siacilocal.liq_liquidacion_local
    SET   
        marca_pago = param.marca_pago, f_pago = param.fecha_pago
    WHERE id_seguimiento_liquidacion = param.id_seguimiento_rendicion and padron = param.nro_padron;

    RETURN param.id_seguimiento_rendicion;

END;

$$;


ALTER FUNCTION siacilocal.liq_actualizar_liquidacion(param typ_liq_liquidacion) OWNER TO admin;

--
-- Name: liq_actualizar_liquidacion_local(typ_liq_liquidacion_local_actu); Type: FUNCTION; Schema: siacilocal; Owner: postgres
--

CREATE FUNCTION liq_actualizar_liquidacion_local(param typ_liq_liquidacion_local_actu) RETURNS bigint
    LANGUAGE plpgsql STRICT
    AS $$


BEGIN

    RAISE NOTICE 'ACTUALIZACION seguimiento liquidacion % ', param.id_seguimiento_rendicion;
    RAISE NOTICE ' param.marca_pago% ', param.marca_pago;
    RAISE NOTICE 'param.fecha_pago % ', param.f_pago;
    RAISE NOTICE 'param.nro_padron% ', param.padron;
    RAISE NOTICE 'param.id_pais_pagador% ', param.id_pais_pagador;
    RAISE NOTICE 'param.id_pais_gestor% ', param.id_pais_gestor;
    
    UPDATE siacilocal.liq_liquidacion_local
    SET   
        marca_pago = param.marca_pago, 
        f_pago = param.f_pago,
        --id_seguimiento_liquidacion =  param.id_seguimiento_liquidacion,
        id_seguimiento_rendicion=param.id_seguimiento_rendicion
    WHERE  padron = param.padron and 
	   id_pais_pagador = param.id_pais_pagador and 
	   id_pais_gestor=param.id_pais_gestor and
	   marca_pago = 'S' and
	   cod_envio= param.cod_envio;

    RETURN param.id_seguimiento_rendicion;

END;

$$;


ALTER FUNCTION siacilocal.liq_actualizar_liquidacion_local(param typ_liq_liquidacion_local_actu) OWNER TO postgres;

--
-- Name: liq_alta_liquidacion_local(typ_liq_liquidacion_local); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_alta_liquidacion_local(param typ_liq_liquidacion_local) RETURNS bigint
    LANGUAGE plpgsql STRICT
    AS $$

BEGIN

	--RAISE NOTICE 'Alta seguimiento liquidacion % ', param.pe_emision;

	--SELECT nextval('sq_benefiaciario_padron') INTO benefPadron;
	--benefPadron := (param.beneficiario).padron;

	INSERT INTO siacilocal.liq_liquidacion_local (
		    --id_liquidacion_local, 
		    pe_emision, cod_envio, id_pais_pagador, 
		    id_pais_gestor, id_tipo_prestacion, ident_prestacion, pe_liquidado, 
		    f_inicio_credito, f_fin_credito, padron, imp_bruto_mon_origen, 
		    desc_mon_origen, imp_neto_mon_origen, imp_neto_mon_destino, marca_pago, 
		    f_pago, id_seguimiento_liquidacion)
	    VALUES (--?, 
		    param.pe_emision, param.cod_envio, param.id_pais_pagador, 
		    param.id_pais_gestor, param.id_tipo_prestacion, param.ident_prestacion, param.pe_liquidado, 
		    param.f_inicio_credito, param.f_fin_credito, param.padron, param.imp_bruto_mon_origen, 
		    param.desc_mon_origen, param.imp_neto_mon_origen, param.imp_neto_mon_destino, param.marca_pago, 
		    param.f_pago, param.id_seguimiento_liquidacion)
	RETURNING id_liquidacion_local INTO param.id_liquidacion_local;

	RETURN param.id_liquidacion_local;

END;

$$;


ALTER FUNCTION siacilocal.liq_alta_liquidacion_local(param typ_liq_liquidacion_local) OWNER TO admin;

--
-- Name: liq_alta_moneda_cambio(smallint, smallint); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_alta_moneda_cambio(idmonedaorigen smallint, idmonedadestino smallint) RETURNS bigint
    LANGUAGE plpgsql STRICT
    AS $$

DECLARE idMonedaCambio INTEGER;

BEGIN

	INSERT INTO siacilocal.liq_moneda_cambio(
		--id_moneda_cambio, 
		id_moneda_origen, id_moneda_destino)
	VALUES (idMonedaOrigen, idMonedaDestino)
	RETURNING id_moneda_cambio INTO idMonedaCambio;

	RETURN idMonedaCambio;

END;

$$;


ALTER FUNCTION siacilocal.liq_alta_moneda_cambio(idmonedaorigen smallint, idmonedadestino smallint) OWNER TO admin;

--
-- Name: liq_alta_oiss_log_recepcion_liq(typ_liq_oiss_log_recepcion_liq); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_alta_oiss_log_recepcion_liq(param typ_liq_oiss_log_recepcion_liq) RETURNS bigint
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO siacilocal.liq_oiss_log_recepcion_liq(
		    --id_liq_oiss_log_recepcion_liq, 
		    pe_emision, id_pais_pagador, f_recepcion, 
		    cod_envio, id_pais_gestor, id_estado_recepcion, motivo_estado_error)
	    VALUES (--id_liq_oiss_log_recepcion_liq, 
		    param.pe_emision, param.id_pais_pagador, param.f_recepcion, 
		    param.cod_envio, param.id_pais_gestor, param.id_estado_recepcion, param.motivo_estado_error
		    )
	RETURNING id_liq_oiss_log_recepcion_liq INTO param.id_liq_oiss_log_recepcion_liq;

	RETURN param.id_liq_oiss_log_recepcion_liq;

END;

$$;


ALTER FUNCTION siacilocal.liq_alta_oiss_log_recepcion_liq(param typ_liq_oiss_log_recepcion_liq) OWNER TO admin;

--
-- Name: liq_alta_oiss_log_transaccional(typ_liq_oiss_log_transaccional); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_alta_oiss_log_transaccional(param typ_liq_oiss_log_transaccional) RETURNS bigint
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO siacilocal.liq_oiss_log_transaccional(
		--id_liq_oiss_log_transaccional, 
		pe_emision, id_pais_pagador, f_envio, 
		cod_envio, id_pais_gestor, 
		f_transmision, hora_transmision, id_estado_transmision)
	VALUES (--?,
		param.pe_emision, param.id_pais_pagador, param.f_envio, 
		param.cod_envio, param.id_pais_gestor, 
		param.f_transmision, param.hora_transmision, param.id_estado_transmision)
	RETURNING id_liq_oiss_log_transaccional INTO param.id_liq_oiss_log_transaccional;

	RETURN param.id_liq_oiss_log_transaccional;

END;

$$;


ALTER FUNCTION siacilocal.liq_alta_oiss_log_transaccional(param typ_liq_oiss_log_transaccional) OWNER TO admin;

--
-- Name: liq_alta_seguimiento_liq(typ_liq_seguimiento_liquidacion); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_alta_seguimiento_liq(param typ_liq_seguimiento_liquidacion) RETURNS bigint
    LANGUAGE plpgsql STRICT
    AS $$


BEGIN

	--RAISE NOTICE 'Alta seguimiento liquidacion % ', param.pe_emision;

	--SELECT nextval('sq_benefiaciario_padron') INTO benefPadron;
	--benefPadron := (param.beneficiario).padron;

	INSERT INTO siacilocal.liq_seguimiento_liquidacion (
            --id_seguimiento_liquidacion, 
            pe_emision, cod_envio, id_pais_remitente, 
            id_pais_destino, f_envio, f_recepcion, id_estado_despacho, f_estado, 
            motivo_estado_error, imp_total_neto_original, id_moneda_pagador, 
            id_moneda_gestor, coeficiente_cambio, imp_total_neto_destino)
	VALUES (--id_seguimiento_liquidacion, 
	    param.pe_emision, param.cod_envio, param.id_pais_remitente, 
            param.id_pais_destino, param.f_envio, param.f_recepcion, param.id_estado_despacho, CURRENT_TIMESTAMP, 
            param.motivo_estado_error, param.imp_total_neto_original, param.id_moneda_pagador, 
            param.id_moneda_gestor, param.coeficiente_cambio, param.imp_total_neto_destino)
	RETURNING id_seguimiento_liquidacion INTO param.id_seguimiento_liquidacion;

	RETURN param.id_seguimiento_liquidacion;

END;

$$;


ALTER FUNCTION siacilocal.liq_alta_seguimiento_liq(param typ_liq_seguimiento_liquidacion) OWNER TO admin;

--
-- Name: liq_alta_seguimiento_liq(typ_liq_seguimiento_liquidacion, text); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_alta_seguimiento_liq(param typ_liq_seguimiento_liquidacion, archivo text) RETURNS bigint
    LANGUAGE plpgsql STRICT
    AS $$


BEGIN

	--RAISE NOTICE 'Alta seguimiento liquidacion % ', param.pe_emision;

	--SELECT nextval('sq_benefiaciario_padron') INTO benefPadron;
	--benefPadron := (param.beneficiario).padron;

	INSERT INTO siacilocal.liq_seguimiento_liquidacion (
            --id_seguimiento_liquidacion, 
            pe_emision, cod_envio, id_pais_remitente, 
            id_pais_destino, f_envio, f_recepcion, id_estado_despacho, f_estado, 
            motivo_estado_error, imp_total_neto_original, id_moneda_pagador, 
            id_moneda_gestor, coeficiente_cambio, imp_total_neto_destino,
            archivo_liquidacion)
	VALUES (--id_seguimiento_liquidacion, 
	    param.pe_emision, param.cod_envio, param.id_pais_remitente, 
            param.id_pais_destino, param.f_envio, param.f_recepcion, param.id_estado_despacho, CURRENT_TIMESTAMP, 
            param.motivo_estado_error, param.imp_total_neto_original, param.id_moneda_pagador, 
            param.id_moneda_gestor, param.coeficiente_cambio, param.imp_total_neto_destino,
            archivo)
	RETURNING id_seguimiento_liquidacion INTO param.id_seguimiento_liquidacion;

	RETURN param.id_seguimiento_liquidacion;

END;

$$;


ALTER FUNCTION siacilocal.liq_alta_seguimiento_liq(param typ_liq_seguimiento_liquidacion, archivo text) OWNER TO admin;

--
-- Name: liq_alta_seguimiento_rendicion(typ_liq_seguimiento_rendicion); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_alta_seguimiento_rendicion(param typ_liq_seguimiento_rendicion) RETURNS bigint
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE idSeguimientoRendicion bigint;
BEGIN
    idSeguimientoRendicion := (select id_seguimiento_rendicion  from siacilocal.liq_seguimiento_rendicion
    where  pe_emision = param.pe_emision and cod_envio =  param.cod_envio and
           id_pais_destino =  param.id_pais_destino);

   RAISE NOTICE ' id_seguimiento_rendicion% ', idSeguimientoRendicion;  
   
   if(idSeguimientoRendicion ISNULL)
   THEN
   Begin
   
    RAISE NOTICE 'ACTUALIZACION seguimiento rendicion % ', param.pe_emision;

    INSERT INTO siacilocal.liq_seguimiento_rendicion
    (
        id_seguimiento_rendicion,
        pe_emision,
        cod_envio,
        id_pais_remitente,
        id_pais_destino,
        nro_rendicion,
        f_envio_rendicion,
        f_recepcion_rendicion,
        id_estado_rendicion,
        f_estado,
        cant_total_casos_impagos,
        cant_total_casos_pagos
    )
    VALUES
    (
    (select nextval('siacilocal.sq_seguimiento_rendicion_id')),
        param.pe_emision,
        param.cod_envio,
        param.id_pais_remitente,
        param.id_pais_destino,
        param.nro_rendicion,
        param.f_envio_rendicion,
        param.f_recepcion_rendicion,
        param.id_estado_rendicion,
        param.f_estado,
        param.cant_total_casos_impagos,
        param.cant_total_casos_pagos
    );

    idSeguimientoRendicion := (select max(id_seguimiento_rendicion) from siacilocal.liq_seguimiento_rendicion); 
    --RETURN (select max(id_seguimiento_rendicion) from siacilocal.liq_seguimiento_rendicion);
    --Actualiza liq_liquidacion_local
     RAISE NOTICE 'ACTUALIZACION seguimiento Local % ', idSeguimientoRendicion;
     RAISE NOTICE 'Parametros % %', param.pe_emision,  param.cod_envio;
     
    UPDATE siacilocal.liq_liquidacion_local 
    SET id_seguimiento_rendicion  = idSeguimientoRendicion
    where (pe_emision = param.pe_emision and cod_envio =  param.cod_envio);      

    RETURN idSeguimientoRendicion;
    end;
    ELSE
    
    RETURN idSeguimientoRendicion; -- Rendicion ya fue cargada  	
    END IF;
    

END;

$$;


ALTER FUNCTION siacilocal.liq_alta_seguimiento_rendicion(param typ_liq_seguimiento_rendicion) OWNER TO admin;

--
-- Name: liq_alta_seguimiento_rendicion(typ_liq_seguimiento_rendicion, character varying); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_alta_seguimiento_rendicion(param typ_liq_seguimiento_rendicion, character varying) RETURNS bigint
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE idSeguimientoRendicion bigint;
BEGIN
    idSeguimientoRendicion := (select id_seguimiento_rendicion  from siacilocal.liq_seguimiento_rendicion
    where  pe_emision = param.pe_emision and cod_envio =  param.cod_envio and
           id_pais_destino =  param.id_pais_destino);

   RAISE NOTICE ' id_seguimiento_rendicion% ', idSeguimientoRendicion;  
   
   if(idSeguimientoRendicion ISNULL)
   THEN
   Begin
   
    RAISE NOTICE 'ACTUALIZACION seguimiento rendicion % ', param.pe_emision;

    INSERT INTO siacilocal.liq_seguimiento_rendicion
    (
        id_seguimiento_rendicion,
        pe_emision,
        cod_envio,
        id_pais_remitente,
        id_pais_destino,
        nro_rendicion,
        f_envio_rendicion,
        f_recepcion_rendicion,
        id_estado_rendicion,
        f_estado,
        cant_total_casos_impagos,
        cant_total_casos_pagos,
        archivo_rendicion
    )
    VALUES
    (
    (select nextval('siacilocal.sq_seguimiento_rendicion_id')),
        param.pe_emision,
        param.cod_envio,
        param.id_pais_remitente,
        param.id_pais_destino,
        param.nro_rendicion,
        param.f_envio_rendicion,
        param.f_recepcion_rendicion,
        param.id_estado_rendicion,
        param.f_estado,
        param.cant_total_casos_impagos,
        param.cant_total_casos_pagos,
        $2
    );

    idSeguimientoRendicion := (select max(id_seguimiento_rendicion) from siacilocal.liq_seguimiento_rendicion); 
    --RETURN (select max(id_seguimiento_rendicion) from siacilocal.liq_seguimiento_rendicion);
    --Actualiza liq_liquidacion_local
     RAISE NOTICE 'ACTUALIZACION seguimiento Local % ', idSeguimientoRendicion;
     RAISE NOTICE 'Parametros % %', param.pe_emision,  param.cod_envio;
     
    UPDATE siacilocal.liq_liquidacion_local 
    SET id_seguimiento_rendicion  = idSeguimientoRendicion
    where (pe_emision = param.pe_emision and cod_envio =  param.cod_envio);      

    RETURN idSeguimientoRendicion;
    end;
    ELSE
    
    RETURN idSeguimientoRendicion; -- Rendicion ya fue cargada  	
    END IF;
    

END;

$_$;


ALTER FUNCTION siacilocal.liq_alta_seguimiento_rendicion(param typ_liq_seguimiento_rendicion, character varying) OWNER TO admin;

--
-- Name: liq_buscar_datos_pais_xnombre(character varying); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_buscar_datos_pais_xnombre(character varying) RETURNS TABLE(id_pais integer, c_pais character varying, d_pais character varying, webservice_url character varying, entidad_gestora character varying, cod_entidad_gestora character varying)
    LANGUAGE sql STRICT
    AS $_$

 Select p.id_pais, 
	p.c_pais,
	p.d_pais,
	dp.webservice_url,
	CAST(NULL AS character varying) AS entidad_gestora,
	dp.cod_entidad_gestora
  from  siacilocal.pais p
  Join siacilocal.datos_pais dp on dp.id_pais = p.id_pais  
  where upper(p.c_pais) = upper($1) or upper(p.d_pais) = upper($1);

$_$;


ALTER FUNCTION siacilocal.liq_buscar_datos_pais_xnombre(character varying) OWNER TO admin;

--
-- Name: liq_buscar_estado(); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_buscar_estado() RETURNS TABLE(id smallint, codigo character varying, nombre character varying)
    LANGUAGE sql
    AS $$

SELECT id_estado, c_estado, d_estado
  FROM siacilocal.estado;

$$;


ALTER FUNCTION siacilocal.liq_buscar_estado() OWNER TO admin;

--
-- Name: liq_buscar_tipo_informacion(); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_buscar_tipo_informacion() RETURNS TABLE(id integer, codigo character varying, nombre character varying)
    LANGUAGE sql
    AS $$

SELECT id_tipo_informacion, c_tipo_informacion, d_tipo_informacion
  FROM siacilocal.tipo_informacion;

$$;


ALTER FUNCTION siacilocal.liq_buscar_tipo_informacion() OWNER TO admin;

--
-- Name: liq_esta_cerrada(text, integer, integer); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_esta_cerrada(text, integer, integer) RETURNS bigint
    LANGUAGE sql STRICT
    AS $_$

--BEGIN
    SELECT max(seg.id_seguimiento_liquidacion)
      FROM siacilocal.liq_seguimiento_liquidacion seg
      INNER JOIN siacilocal.pais p
	  ON upper(p.c_pais) like  upper($1) or upper(p.d_pais) like upper($1)
     WHERE seg.id_estado_despacho <> 5
    AND seg.id_pais_remitente = p.id_pais
    AND seg.cod_envio = $2
    AND seg.pe_emision = $3;
--END;

$_$;


ALTER FUNCTION siacilocal.liq_esta_cerrada(text, integer, integer) OWNER TO admin;

--
-- Name: liq_existe_liq_enviada(integer, integer, character varying); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_existe_liq_enviada(integer, integer, character varying) RETURNS SETOF integer
    LANGUAGE sql STRICT
    AS $_$

--BEGIN
	
	SELECT 1
	  FROM siacilocal.liq_seguimiento_liquidacion
	  JOIN siacilocal.pais p ON p.d_pais = $3
	 WHERE --id_estado_despacho not in ( 2, 3, 4, 5, 6 ) AND 
	    pe_emision = $1
	   AND cod_envio = $2
	   AND id_pais_destino = p.id_pais;


/*
01- Liq. Pendiente Envío.
02- Liq. Enviada / (pendiente de recepcion para el gestor)
03- Liq. Recibida
04- Liq. Rechazada
05- Liq. Cerrada
*/

--END;

$_$;


ALTER FUNCTION siacilocal.liq_existe_liq_enviada(integer, integer, character varying) OWNER TO admin;

--
-- Name: liq_grabar_archivo_rendicion(integer, text); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_grabar_archivo_rendicion(idseg integer, archivo text) RETURNS bigint
    LANGUAGE plpgsql STRICT
    AS $_$


BEGIN

    RAISE NOTICE 'ACTUALIZACION archivo rendicion % ', $1;

    UPDATE siacilocal.liq_seguimiento_rendicion
    SET archivo_rendicion=$2
    WHERE id_seguimiento_rendicion = $1;

    RETURN $1;

END;

$_$;


ALTER FUNCTION siacilocal.liq_grabar_archivo_rendicion(idseg integer, archivo text) OWNER TO admin;

--
-- Name: liq_obtener_archivo_liquidacion(bigint); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_archivo_liquidacion(idseguimientoliquidacion bigint) RETURNS TABLE(id_seguimiento_liquidacion bigint, archivo_liquidacion text)
    LANGUAGE sql
    AS $_$

	SELECT id_seguimiento_liquidacion, archivo_liquidacion
	FROM siacilocal.liq_seguimiento_liquidacion
	WHERE id_seguimiento_liquidacion = $1;


$_$;


ALTER FUNCTION siacilocal.liq_obtener_archivo_liquidacion(idseguimientoliquidacion bigint) OWNER TO admin;

--
-- Name: liq_obtener_liq_gestor(smallint, integer); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_liq_gestor(smallint, integer) RETURNS TABLE(id_seguimiento_liquidacion bigint, pe_emision integer, cod_envio integer, id_pais_remitente integer, c_pais_remitente character varying, d_pais_remitente character varying, id_pais_destino integer, c_pais_destino character varying, d_pais_destino character varying, f_envio timestamp without time zone, f_recepcion timestamp without time zone, id_estado_despacho integer, f_estado timestamp without time zone, motivo_estado_error character varying, imp_total_neto_original double precision, id_moneda_pagador integer, id_moneda_gestor integer, coeficiente_cambio double precision, imp_total_neto_destino double precision)
    LANGUAGE sql STRICT
    AS $_$

--BEGIN
	--RAISE NOTICE 'periodo %', $2;

	--select $2 is null;
	
	SELECT id_seguimiento_liquidacion, pe_emision, cod_envio, 
		id_pais_remitente, pr.c_pais , pr.d_pais ,
		id_pais_destino, p.c_pais , p.d_pais , 
		f_envio, f_recepcion,
		id_estado_despacho, f_estado, motivo_estado_error,
		imp_total_neto_original, id_moneda_pagador, id_moneda_gestor, 
		coeficiente_cambio, imp_total_neto_destino
	FROM siacilocal.liq_seguimiento_liquidacion
	JOIN siacilocal.pais p ON p.id_pais = id_pais_destino
	JOIN siacilocal.pais pr ON pr.id_pais = id_pais_remitente
	WHERE id_estado_despacho not in ( 1, 2 )
	AND id_pais_destino = $1
	AND pe_emision = $2;


-- 	--IF $2 is null THEN
-- 	
-- 		SELECT id_seguimiento_liquidacion, pe_emision, cod_envio, 
-- 			id_pais_remitente, pr.c_pais , pr.d_pais ,
-- 			id_pais_destino, p.c_pais , p.d_pais , 
-- 			f_envio, f_recepcion,
-- 			id_estado_despacho, f_estado, motivo_estado_error,
-- 			imp_total_neto_original, id_moneda_pagador, id_moneda_gestor, 
-- 			coeficiente_cambio, imp_total_neto_destino
-- 		FROM siacilocal.seguimiento_liquidacion
-- 		JOIN siacilocal.pais p ON p.id_pais = id_pais_destino
-- 		JOIN siacilocal.pais pr ON pr.id_pais = id_pais_remitente
-- 		WHERE id_estado_despacho <> 1
-- 		AND id_pais_destino = $1;
-- 
-- 	--ELSE
-- 		SELECT id_seguimiento_liquidacion, pe_emision, cod_envio, 
-- 			id_pais_remitente, pr.c_pais , pr.d_pais ,
-- 			id_pais_destino, p.c_pais , p.d_pais , 
-- 			f_envio, f_recepcion,
-- 			id_estado_despacho, f_estado, motivo_estado_error,
-- 			imp_total_neto_original, id_moneda_pagador, id_moneda_gestor, 
-- 			coeficiente_cambio, imp_total_neto_destino
-- 		FROM siacilocal.seguimiento_liquidacion
-- 		JOIN siacilocal.pais p ON p.id_pais = id_pais_destino
-- 		JOIN siacilocal.pais pr ON pr.id_pais = id_pais_remitente
-- 		WHERE id_estado_despacho <> 1
-- 		AND id_pais_destino = $1
-- 		AND pe_emision = $2;
-- 	--END IF;


/*
01- Liq. Pendiente Envío.
02- Liq. Enviada / (pendiente de recepcion para el gestor)
03- Liq. Recibida
04- Liq. Rechazada
05- Liq. Cerrada
*/

--END;

$_$;


ALTER FUNCTION siacilocal.liq_obtener_liq_gestor(smallint, integer) OWNER TO admin;

--
-- Name: liq_obtener_liq_no_cerradas(smallint); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_liq_no_cerradas(idpaisdestino smallint) RETURNS TABLE(id_seguimiento_liquidacion bigint, pe_emision integer, cod_envio integer, id_pais_remitente integer, c_pais_remitente character varying, d_pais_remitente character varying, id_pais_destino integer, c_pais_destino character varying, d_pais_destino character varying, f_envio timestamp without time zone, f_recepcion timestamp without time zone, id_estado_despacho integer, f_estado timestamp without time zone, motivo_estado_error character varying, imp_total_neto_original double precision, id_moneda_pagador integer, d_moneda_pagador character varying, id_moneda_gestor integer, d_moneda_gestor character varying, coeficiente_cambio double precision, imp_total_neto_destino double precision)
    LANGUAGE sql STRICT
    AS $_$

    SELECT id_seguimiento_liquidacion, pe_emision, cod_envio,
        id_pais_remitente, pr.c_pais c_pais_remitente, pr.d_pais d_pais_remitente,
        id_pais_destino, p.c_pais c_pais_destino, p.d_pais d_pais_destino,
        f_envio, f_recepcion,
        id_estado_despacho, f_estado, motivo_estado_error,
        imp_total_neto_original,
        id_moneda_pagador, mp.d_moneda d_moneda_pagador,
        id_moneda_gestor, mg.d_moneda d_moneda_gestor,
        coeficiente_cambio, imp_total_neto_destino
    FROM siacilocal.liq_seguimiento_liquidacion
    JOIN siacilocal.pais p ON p.id_pais = id_pais_destino
    JOIN siacilocal.pais pr ON pr.id_pais = id_pais_remitente
    JOIN siacilocal.liq_moneda mp ON mp.id_moneda = id_moneda_pagador
    JOIN siacilocal.liq_moneda mg ON mg.id_moneda = id_moneda_gestor
    /*WHERE (id_estado_despacho <> 5 and id_estado_despacho <> 1)*/
    WHERE (id_estado_despacho =3)
    AND id_pais_destino = $1;

  
/*
01- Liq. Pendiente Envío.
02- Liq. Enviada
03- Liq. Recibida
04- Liq. Rechazada
05- Liq. Cerrada
*/

$_$;


ALTER FUNCTION siacilocal.liq_obtener_liq_no_cerradas(idpaisdestino smallint) OWNER TO admin;

--
-- Name: liq_obtener_liq_pendientes_envio(smallint); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_liq_pendientes_envio(idpaisremitente smallint) RETURNS TABLE(id_seguimiento_liquidacion bigint, pe_emision integer, cod_envio integer, id_pais_remitente integer, c_pais_remitente character varying, d_pais_remitente character varying, id_pais_destino integer, c_pais_destino character varying, d_pais_destino character varying, f_envio timestamp without time zone, f_recepcion timestamp without time zone, id_estado_despacho integer, f_estado timestamp without time zone, motivo_estado_error character varying, imp_total_neto_original double precision, id_moneda_pagador integer, d_moneda_pagador character varying, id_moneda_gestor integer, d_moneda_gestor character varying, coeficiente_cambio double precision, imp_total_neto_destino double precision, m_transmitido character)
    LANGUAGE sql STRICT
    AS $_$

	SELECT id_seguimiento_liquidacion, pe_emision, cod_envio, 
		id_pais_remitente, pr.c_pais c_pais_remitente, pr.d_pais d_pais_remitente,
		id_pais_destino, p.c_pais c_pais_destino, p.d_pais d_pais_destino, 
		f_envio, f_recepcion,
		id_estado_despacho, f_estado, motivo_estado_error,
		imp_total_neto_original, 
		id_moneda_pagador, mp.d_moneda d_moneda_pagador,
		id_moneda_gestor, mg.d_moneda d_moneda_gestor,
		coeficiente_cambio, imp_total_neto_destino, m_transmitido
	FROM siacilocal.liq_seguimiento_liquidacion
	JOIN siacilocal.pais p ON p.id_pais = id_pais_destino
	JOIN siacilocal.pais pr ON pr.id_pais = id_pais_remitente
	JOIN siacilocal.liq_moneda mp ON mp.id_moneda = id_moneda_pagador
	JOIN siacilocal.liq_moneda mg ON mg.id_moneda = id_moneda_gestor
	WHERE id_estado_despacho = 1
	AND id_pais_remitente = $1;

	
/*
01- Liq. Pendiente Envío.
02- Liq. Enviada
03- Liq. Recibida
04- Liq. Rechazada
05- Liq. Cerrada
*/

$_$;


ALTER FUNCTION siacilocal.liq_obtener_liq_pendientes_envio(idpaisremitente smallint) OWNER TO admin;

--
-- Name: liq_obtener_liq_pendientes_recepcion(smallint); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_liq_pendientes_recepcion(idpaisdestino smallint) RETURNS TABLE(id_seguimiento_liquidacion bigint, pe_emision integer, cod_envio integer, id_pais_remitente integer, c_pais_remitente character varying, d_pais_remitente character varying, id_pais_destino integer, c_pais_destino character varying, d_pais_destino character varying, f_envio timestamp without time zone, f_recepcion timestamp without time zone, id_estado_despacho integer, f_estado timestamp without time zone, motivo_estado_error character varying, imp_total_neto_original double precision, id_moneda_pagador integer, d_moneda_pagador character varying, id_moneda_gestor integer, d_moneda_gestor character varying, coeficiente_cambio double precision, imp_total_neto_destino double precision)
    LANGUAGE sql STRICT
    AS $_$

	SELECT id_seguimiento_liquidacion, pe_emision, cod_envio, 
		id_pais_remitente, pr.c_pais c_pais_remitente, pr.d_pais d_pais_remitente,
		id_pais_destino, p.c_pais c_pais_destino, p.d_pais d_pais_destino, 
		f_envio, f_recepcion,
		id_estado_despacho, f_estado, motivo_estado_error,
		imp_total_neto_original, 
		id_moneda_pagador, mp.d_moneda d_moneda_pagador,
		id_moneda_gestor, mg.d_moneda d_moneda_gestor,
		coeficiente_cambio, imp_total_neto_destino
	FROM siacilocal.liq_seguimiento_liquidacion
	JOIN siacilocal.pais p ON p.id_pais = id_pais_destino
	JOIN siacilocal.pais pr ON pr.id_pais = id_pais_remitente
	JOIN siacilocal.liq_moneda mp ON mp.id_moneda = id_moneda_pagador
	JOIN siacilocal.liq_moneda mg ON mg.id_moneda = id_moneda_gestor
	WHERE id_estado_despacho = 6
	AND id_pais_destino = $1;

	
/*
01- Liq. Pendiente Envío.
02- Liq. Enviada
03- Liq. Recibida
04- Liq. Rechazada
05- Liq. Cerrada
*/

$_$;


ALTER FUNCTION siacilocal.liq_obtener_liq_pendientes_recepcion(idpaisdestino smallint) OWNER TO admin;

--
-- Name: liq_obtener_liquidacion_local_by_seguimiento_rendicion(bigint); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_liquidacion_local_by_seguimiento_rendicion(idseguimientoliquidacion bigint) RETURNS TABLE(id_liquidacion_local bigint, pe_emision integer, cod_envio integer, id_pais_pagador integer, id_pais_gestor integer, id_tipo_prestacion integer, ident_prestacion bigint, pe_liquidado integer, f_inicio_credito date, f_fin_credito date, padron bigint, imp_bruto_mon_origen double precision, desc_mon_origen double precision, imp_neto_mon_origen double precision, imp_neto_mon_destino double precision, marca_pago character, f_pago date, id_seguimiento_liquidacion bigint, id_seguimiento_rendicion bigint)
    LANGUAGE sql
    AS $_$

	SELECT id_liquidacion_local, pe_emision, cod_envio, id_pais_pagador, 
	       id_pais_gestor, id_tipo_prestacion, ident_prestacion, pe_liquidado, 
	       f_inicio_credito, f_fin_credito, padron, imp_bruto_mon_origen, 
	       desc_mon_origen, imp_neto_mon_origen, imp_neto_mon_destino, marca_pago, 
	       f_pago, id_seguimiento_liquidacion, id_seguimiento_rendicion
	FROM siacilocal.liq_liquidacion_local
	WHERE id_seguimiento_rendicion = $1;


$_$;


ALTER FUNCTION siacilocal.liq_obtener_liquidacion_local_by_seguimiento_rendicion(idseguimientoliquidacion bigint) OWNER TO admin;

--
-- Name: liq_obtener_liquidaciones_locales(bigint); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_liquidaciones_locales(idseguimientoliquidacion bigint) RETURNS TABLE(id_liquidacion_local bigint, pe_emision integer, cod_envio integer, id_pais_pagador integer, id_pais_gestor integer, id_tipo_prestacion integer, ident_prestacion bigint, pe_liquidado integer, f_inicio_credito date, f_fin_credito date, padron bigint, imp_bruto_mon_origen double precision, desc_mon_origen double precision, imp_neto_mon_origen double precision, imp_neto_mon_destino double precision, marca_pago character, f_pago date, id_seguimiento_liquidacion bigint)
    LANGUAGE sql
    AS $_$

	SELECT id_liquidacion_local, pe_emision, cod_envio, id_pais_pagador, 
	       id_pais_gestor, id_tipo_prestacion, ident_prestacion, pe_liquidado, 
	       f_inicio_credito, f_fin_credito, padron, imp_bruto_mon_origen, 
	       desc_mon_origen, imp_neto_mon_origen, imp_neto_mon_destino, marca_pago, 
	       f_pago, id_seguimiento_liquidacion
	FROM siacilocal.liq_liquidacion_local
	WHERE id_seguimiento_liquidacion = $1;


$_$;


ALTER FUNCTION siacilocal.liq_obtener_liquidaciones_locales(idseguimientoliquidacion bigint) OWNER TO admin;

--
-- Name: liq_obtener_maximo_numero_de_rendicion(integer, integer); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_maximo_numero_de_rendicion(integer, integer) RETURNS bigint
    LANGUAGE sql STRICT
    AS $_$
    SELECT max(nro_rendicion) FROM siacilocal.liq_seguimiento_rendicion r
    WHERE r.id_pais_remitente = $1 AND r.id_pais_destino = $2;
$_$;


ALTER FUNCTION siacilocal.liq_obtener_maximo_numero_de_rendicion(integer, integer) OWNER TO admin;

--
-- Name: liq_obtener_monedas(); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_monedas() RETURNS TABLE(id_moneda integer, c_moneda character varying, d_moneda character varying, id_pais integer, c_pais character varying, d_pais character varying)
    LANGUAGE sql STRICT
    AS $$

	SELECT id_moneda, c_moneda, d_moneda,
		p.id_pais, p.c_pais, p.d_pais
	FROM siacilocal.liq_moneda m
	JOIN siacilocal.pais p ON p.id_pais = m.id_pais;
/*
01- Liq. Pendiente Envío.
02- Liq. Enviada
03- Liq. Recibida
04- Liq. Rechazada
05- Liq. Cerrada
*/


$$;


ALTER FUNCTION siacilocal.liq_obtener_monedas() OWNER TO admin;

--
-- Name: liq_obtener_monedas_cambio(); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_monedas_cambio() RETURNS TABLE(id_moneda_cambio integer, id_moneda_origen integer, c_moneda_origen character varying, d_moneda_origen character varying, id_moneda_destino integer, c_moneda_destino character varying, d_moneda_destino character varying)
    LANGUAGE sql STRICT
    AS $$

	SELECT id_moneda_cambio,
		id_moneda_origen, mo.c_moneda c_moneda_origen, mo.d_moneda d_moneda_origen,
		id_moneda_destino, md.c_moneda c_moneda_destino, md.d_moneda d_moneda_destino
	FROM siacilocal.liq_moneda_cambio mc
	JOIN siacilocal.liq_moneda mo ON mo.id_moneda = mc.id_moneda_origen
	JOIN siacilocal.liq_moneda md ON md.id_moneda = mc.id_moneda_destino;
/*
01- Liq. Pendiente Envío.
02- Liq. Enviada
03- Liq. Recibida
04- Liq. Rechazada
05- Liq. Cerrada
*/


$$;


ALTER FUNCTION siacilocal.liq_obtener_monedas_cambio() OWNER TO admin;

--
-- Name: liq_obtener_paises(); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_paises() RETURNS TABLE(id_pais integer, c_pais character varying, d_pais character varying)
    LANGUAGE sql
    AS $$

	SELECT id_pais, c_pais, d_pais
	  FROM siacilocal.pais;

$$;


ALTER FUNCTION siacilocal.liq_obtener_paises() OWNER TO admin;

--
-- Name: liq_obtener_rendiciones_enviadas(smallint); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_rendiciones_enviadas(idpaisremitente smallint) RETURNS TABLE(id_seguimiento_rendicion bigint, pe_emision integer, cod_envio integer, id_pais_remitente integer, c_pais_remitente character varying, d_pais_remitente character varying, id_pais_destino integer, c_pais_destino character varying, d_pais_destino character varying, nro_rendicion bigint, f_envio_rendicion timestamp without time zone, f_recepcion_rendicion timestamp without time zone, id_estado_rendicion integer, f_estado timestamp without time zone, cant_total_casos_impagos integer, cant_total_casos_pagos integer, archivo_rendicion character varying)
    LANGUAGE sql STRICT
    AS $_$

	SELECT id_seguimiento_rendicion, pe_emision, cod_envio, 
		id_pais_remitente, pr.c_pais c_pais_remitente, pr.d_pais d_pais_remitente,
		id_pais_destino, p.c_pais c_pais_destino, p.d_pais d_pais_destino, 
		nro_rendicion, f_envio_rendicion, f_recepcion_rendicion,
		id_estado_rendicion, f_estado, cant_total_casos_impagos, 
		cant_total_casos_pagos, archivo_rendicion
	FROM siacilocal.liq_seguimiento_rendicion
	JOIN siacilocal.pais p ON p.id_pais = id_pais_destino
	JOIN siacilocal.pais pr ON pr.id_pais = id_pais_remitente
	WHERE id_estado_rendicion = 1
	AND id_pais_destino = $1;

	
/*
01- ENVIADA
02- OK
03- FIRMA INVALIDA
04- INSCONSISTENTE
05- ERROR FORMATO
*/

$_$;


ALTER FUNCTION siacilocal.liq_obtener_rendiciones_enviadas(idpaisremitente smallint) OWNER TO admin;

--
-- Name: liq_obtener_rendiciones_por_estado(smallint, smallint); Type: FUNCTION; Schema: siacilocal; Owner: postgres
--

CREATE FUNCTION liq_obtener_rendiciones_por_estado(idpaisdestino smallint, idestado smallint) RETURNS TABLE(id_seguimiento_rendicion bigint, pe_emision integer, cod_envio integer, id_pais_remitente integer, c_pais_remitente character varying, d_pais_remitente character varying, id_pais_destino integer, c_pais_destino character varying, d_pais_destino character varying, nro_rendicion bigint, f_envio_rendicion timestamp without time zone, f_recepcion_rendicion timestamp without time zone, id_estado_rendicion integer, f_estado timestamp without time zone, cant_total_casos_impagos integer, cant_total_casos_pagos integer, archivo_rendicion character varying)
    LANGUAGE sql STRICT
    AS $_$

SELECT id_seguimiento_rendicion, pe_emision, cod_envio, 
		id_pais_remitente, pr.c_pais c_pais_remitente, pr.d_pais d_pais_remitente,
		id_pais_destino, p.c_pais c_pais_destino, p.d_pais d_pais_destino, 
		nro_rendicion, f_envio_rendicion, f_recepcion_rendicion,
		id_estado_rendicion, f_estado, cant_total_casos_impagos, 
		cant_total_casos_pagos, archivo_rendicion
	FROM siacilocal.liq_seguimiento_rendicion
	JOIN siacilocal.pais p ON p.id_pais = id_pais_destino
	JOIN siacilocal.pais pr ON pr.id_pais = id_pais_remitente
	WHERE id_pais_remitente = $1 AND id_estado_rendicion = $2;
	

  
/*
01- Liq. Pendiente Envío.
02- Liq. Enviada
03- Liq. Recibida
04- Liq. Rechazada
05- Liq. Cerrada
*/

$_$;


ALTER FUNCTION siacilocal.liq_obtener_rendiciones_por_estado(idpaisdestino smallint, idestado smallint) OWNER TO postgres;

--
-- Name: liq_obtener_reporte_gestor(smallint, integer, integer); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_reporte_gestor(idpaisdestino smallint, pedesde integer, pehasta integer) RETURNS TABLE(id_seguimiento_liquidacion bigint, pe_emision integer, cod_envio integer,
id_pais_remitente integer, c_pais_destino character varying, d_pais_destino character varying, f_envio timestamp without time zone, f_recepcion timestamp without time zone, id_estado_despacho integer,
c_estado_despacho character varying, d_estado_despacho character varying, f_estado timestamp without time zone, motivo_estado_error character varying)
    LANGUAGE plpgsql
    AS $$

BEGIN
-- 	RAISE NOTICE 'liq_obtener_reporte_pagador... ';
-- 	RAISE NOTICE 'periodo %', peDesde;
-- 	IF peDesde IS NULL THEN
--                 RAISE NOTICE 'peDesde IS NULL;';
--         ELSE
--                 RAISE NOTICE 'peDesde IS NOT NULL... ';
--         END IF;

	RETURN QUERY
	SELECT sl.id_seguimiento_liquidacion, sl.pe_emision, sl.cod_envio, 
		p.id_pais, p.c_pais , p.d_pais, 
		sl.f_envio, sl.f_recepcion,
		sl.id_estado_despacho, ed.c_estado_despacho, ed.d_estado_despacho,
		sl.f_estado, sl.motivo_estado_error
	  FROM siacilocal.liq_seguimiento_liquidacion sl
	  JOIN siacilocal.liq_estado_despacho ed ON ed.id_estado_despacho = sl.id_estado_despacho
	  JOIN siacilocal.pais p ON p.id_pais = sl.id_pais_remitente
	 WHERE sl.id_estado_despacho in (2,3,4)
	   AND sl.id_pais_destino = idpaisdestino /*pais gestor*/
	   AND (peDesde is null OR sl.pe_emision >= peDesde)
	   AND (peHasta is null OR sl.pe_emision <= peHasta)
	 ORDER BY sl.pe_emision, sl.id_pais_destino, sl.f_envio;

/*
01- Liq. Pendiente Envío.
02- Liq. Enviada / (pendiente de recepcion para el gestor)
03- Liq. Recibida
04- Liq. Rechazada
05- Liq. Cerrada
*/

END;

$$;


ALTER FUNCTION siacilocal.liq_obtener_reporte_gestor(idpaisdestino smallint, pedesde integer, pehasta integer) OWNER TO admin;

--
-- Name: liq_obtener_reporte_gestor_rendicion(smallint); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_reporte_gestor_rendicion(idpais smallint) RETURNS TABLE(id_seguimiento_liquidacion bigint, pe_emision integer, cod_envio integer, id_pais_remitente smallint, c_pais_remitente character varying, d_pais_remitente character varying, f_envio timestamp with time zone, f_recepcion timestamp with time zone, id_estado_despacho integer, c_estado_despacho character varying, d_estado_despacho character varying, f_estado timestamp with time zone, motivo_estado_error character varying)
    LANGUAGE plpgsql
    AS $$

BEGIN
-- 	RAISE NOTICE 'liq_obtener_reporte_pagador... ';
-- 	RAISE NOTICE 'periodo %', peDesde;
-- 	IF peDesde IS NULL THEN
--                 RAISE NOTICE 'peDesde IS NULL;';
--         ELSE
--                 RAISE NOTICE 'peDesde IS NOT NULL... ';
--         END IF;

	RETURN QUERY
	SELECT sl.id_seguimiento_liquidacion, sl.pe_emision, sl.cod_envio, 
		p.id_pais, p.c_pais , p.d_pais, 
		sl.f_envio, sl.f_recepcion,
		sl.id_estado_despacho, ed.c_estado_despacho, ed.d_estado_despacho,
		sl.f_estado, sl.motivo_estado_error
	  FROM siacilocal.liq_seguimiento_liquidacion sl
	  JOIN siacilocal.liq_estado_despacho ed ON ed.id_estado_despacho = sl.id_estado_despacho
	  JOIN siacilocal.pais p ON p.id_pais = sl.id_pais_destino
	 WHERE sl.id_pais_destino = idpais /*pais gestor*/
	 ORDER BY sl.pe_emision, sl.id_pais_destino, sl.f_envio;

/*
01- Liq. Pendiente Envío.
02- Liq. Enviada / (pendiente de recepcion para el gestor)
03- Liq. Recibida
04- Liq. Rechazada
05- Liq. Cerrada
*/

END;

$$;


ALTER FUNCTION siacilocal.liq_obtener_reporte_gestor_rendicion(idpais smallint) OWNER TO admin;

--
-- Name: liq_obtener_reporte_gestor_segun_estado_rendicion(smallint, smallint); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_reporte_gestor_segun_estado_rendicion(idpais smallint, estado smallint) RETURNS TABLE(id_seguimiento_liquidacion bigint, pe_emision integer, cod_envio integer, id_pais_remitente smallint, c_pais_remitente character varying, d_pais_remitente character varying, f_envio timestamp with time zone, f_recepcion timestamp with time zone, id_estado_despacho integer, c_estado_despacho character varying, d_estado_despacho character varying, f_estado timestamp with time zone, motivo_estado_error character varying)
    LANGUAGE plpgsql
    AS $$

BEGIN
--     RAISE NOTICE 'liq_obtener_reporte_pagador... ';
--     RAISE NOTICE 'periodo %', peDesde;
--     IF peDesde IS NULL THEN
--                 RAISE NOTICE 'peDesde IS NULL;';
--         ELSE
--                 RAISE NOTICE 'peDesde IS NOT NULL... ';
--         END IF;

    RETURN QUERY
    SELECT sl.id_seguimiento_liquidacion, sl.pe_emision, sl.cod_envio,
        p.id_pais, p.c_pais , p.d_pais,
        sl.f_envio, sl.f_recepcion,
        sl.id_estado_despacho, ed.c_estado_despacho, ed.d_estado_despacho,
        sl.f_estado, sl.motivo_estado_error
      FROM siacilocal.liq_seguimiento_liquidacion sl
      JOIN siacilocal.liq_estado_despacho ed ON ed.id_estado_despacho = sl.id_estado_despacho
      JOIN siacilocal.pais p ON p.id_pais = sl.id_pais_destino
     WHERE id_estado_despacho = estado
        AND id_pais_destino = idpais /*pais gestor*/
     ORDER BY sl.pe_emision, sl.id_pais_destino, sl.f_envio;

/*
01- Liq. Pendiente Envío.
02- Liq. Enviada / (pendiente de recepcion para el gestor)
03- Liq. Recibida
04- Liq. Rechazada
05- Liq. Cerrada
*/

END;

$$;


ALTER FUNCTION siacilocal.liq_obtener_reporte_gestor_segun_estado_rendicion(idpais smallint, estado smallint) OWNER TO admin;

--
-- Name: liq_obtener_reporte_gestor_segun_estado_rendicion(smallint, integer); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_reporte_gestor_segun_estado_rendicion(idpais smallint, estado integer) RETURNS TABLE(id_seguimiento_liquidacion bigint, pe_emision integer, cod_envio integer, id_pais_remitente smallint, c_pais_remitente character varying, d_pais_remitente character varying, f_envio timestamp with time zone, f_recepcion timestamp with time zone, id_estado_despacho integer, c_estado_despacho character varying, d_estado_despacho character varying, f_estado timestamp with time zone, motivo_estado_error character varying)
    LANGUAGE plpgsql
    AS $$

BEGIN
--     RAISE NOTICE 'liq_obtener_reporte_pagador... ';
--     RAISE NOTICE 'periodo %', peDesde;
--     IF peDesde IS NULL THEN
--                 RAISE NOTICE 'peDesde IS NULL;';
--         ELSE
--                 RAISE NOTICE 'peDesde IS NOT NULL... ';
--         END IF;

    RETURN QUERY
    SELECT sl.id_seguimiento_liquidacion, sl.pe_emision, sl.cod_envio,
        p.id_pais, p.c_pais , p.d_pais,
        sl.f_envio, sl.f_recepcion,
        sl.id_estado_despacho, ed.c_estado_despacho, ed.d_estado_despacho,
        sl.f_estado, sl.motivo_estado_error
      FROM siacilocal.liq_seguimiento_liquidacion sl
      JOIN siacilocal.liq_estado_despacho ed ON ed.id_estado_despacho = sl.id_estado_despacho
      JOIN siacilocal.pais p ON p.id_pais = sl.id_pais_destino
     WHERE sl.id_estado_despacho = estado
        AND sl.id_pais_destino = idpais /*pais gestor*/
     ORDER BY sl.pe_emision, sl.id_pais_destino, sl.f_envio;

/*
01- Liq. Pendiente Envío.
02- Liq. Enviada / (pendiente de recepcion para el gestor)
03- Liq. Recibida
04- Liq. Rechazada
05- Liq. Cerrada
*/

END;

$$;


ALTER FUNCTION siacilocal.liq_obtener_reporte_gestor_segun_estado_rendicion(idpais smallint, estado integer) OWNER TO admin;

--
-- Name: liq_obtener_reporte_pagador(smallint, integer, integer); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_reporte_pagador(idpaisremitente smallint, pedesde integer, pehasta integer) RETURNS TABLE(id_seguimiento_liquidacion bigint, pe_emision integer, cod_envio integer, id_pais_destino integer,
c_pais_remitente character varying, d_pais_remitente character varying, f_envio timestamp without time zone, f_recepcion timestamp without time zone,
id_estado_despacho integer, c_estado_despacho character varying, d_estado_despacho character varying, f_estado timestamp without time zone, motivo_estado_error character varying)
    LANGUAGE plpgsql
    AS $$

BEGIN
-- 	RAISE NOTICE 'liq_obtener_reporte_pagador... ';
-- 	RAISE NOTICE 'periodo %', peDesde;
-- 	IF peDesde IS NULL THEN
--                 RAISE NOTICE 'peDesde IS NULL;';
--         ELSE
--                 RAISE NOTICE 'peDesde IS NOT NULL... ';
--         END IF;

	RETURN QUERY
	SELECT sl.id_seguimiento_liquidacion, sl.pe_emision, sl.cod_envio, 
		p.id_pais, p.c_pais , p.d_pais , 
		sl.f_envio, sl.f_recepcion,
		sl.id_estado_despacho, ed.c_estado_despacho, ed.d_estado_despacho,
		sl.f_estado, sl.motivo_estado_error
	  FROM siacilocal.liq_seguimiento_liquidacion sl
	  JOIN siacilocal.liq_estado_despacho ed ON ed.id_estado_despacho = sl.id_estado_despacho
	  JOIN siacilocal.pais p ON p.id_pais = sl.id_pais_destino
	 WHERE sl.id_estado_despacho in (1,2,3,4)
	   AND id_pais_remitente = idpaisremitente /*pais pagador*/
	   AND (peDesde is null OR sl.pe_emision >= peDesde)
	   AND (peHasta is null OR sl.pe_emision <= peHasta)
	 ORDER BY sl.pe_emision, sl.id_pais_remitente, sl.f_envio;

/*
01- Liq. Pendiente Envío.
02- Liq. Enviada / (pendiente de recepcion para el gestor)
03- Liq. Recibida
04- Liq. Rechazada
05- Liq. Cerrada
*/

END;

$$;


ALTER FUNCTION siacilocal.liq_obtener_reporte_pagador(idpaisremitente smallint, pedesde integer, pehasta integer) OWNER TO admin;

--
-- Name: liq_obtener_reporte_pagador_rendicion(smallint); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_reporte_pagador_rendicion(idpais smallint) RETURNS TABLE(id_seguimiento_liquidacion bigint, pe_emision integer, cod_envio integer, id_pais_remitente smallint, c_pais_remitente character varying, d_pais_remitente character varying, f_envio timestamp with time zone, f_recepcion timestamp with time zone, id_estado_despacho integer, c_estado_despacho character varying, d_estado_despacho character varying, f_estado timestamp with time zone, motivo_estado_error character varying)
    LANGUAGE plpgsql
    AS $$

BEGIN
--     RAISE NOTICE 'liq_obtener_reporte_pagador... ';
--     RAISE NOTICE 'periodo %', peDesde;
--     IF peDesde IS NULL THEN
--                 RAISE NOTICE 'peDesde IS NULL;';
--         ELSE
--                 RAISE NOTICE 'peDesde IS NOT NULL... ';
--         END IF;

    RETURN QUERY
    SELECT sl.id_seguimiento_liquidacion, sl.pe_emision, sl.cod_envio,
        p.id_pais, p.c_pais , p.d_pais,
        sl.f_envio, sl.f_recepcion,
        sl.id_estado_despacho, ed.c_estado_despacho, ed.d_estado_despacho,
        sl.f_estado, sl.motivo_estado_error
      FROM siacilocal.liq_seguimiento_liquidacion sl
      JOIN siacilocal.liq_estado_despacho ed ON ed.id_estado_despacho = sl.id_estado_despacho
      JOIN siacilocal.pais p ON p.id_pais = sl.id_pais_remitente
     WHERE sl.id_pais_remitente = idpais /*pais gestor*/
     ORDER BY sl.pe_emision, sl.id_pais_remitente, sl.f_envio;

/*
01- Liq. Pendiente Envío.
02- Liq. Enviada / (pendiente de recepcion para el gestor)
03- Liq. Recibida
04- Liq. Rechazada
05- Liq. Cerrada
*/

END;

$$;


ALTER FUNCTION siacilocal.liq_obtener_reporte_pagador_rendicion(idpais smallint) OWNER TO admin;

--
-- Name: liq_obtener_reporte_pagador_segun_estado_rendicion(smallint, smallint); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_reporte_pagador_segun_estado_rendicion(idpais smallint, estado smallint) RETURNS TABLE(id_seguimiento_liquidacion bigint, pe_emision integer, cod_envio integer, id_pais_remitente smallint, c_pais_remitente character varying, d_pais_remitente character varying, f_envio timestamp with time zone, f_recepcion timestamp with time zone, id_estado_despacho integer, c_estado_despacho character varying, d_estado_despacho character varying, f_estado timestamp with time zone, motivo_estado_error character varying)
    LANGUAGE plpgsql
    AS $$

BEGIN
--     RAISE NOTICE 'liq_obtener_reporte_pagador... ';
--     RAISE NOTICE 'periodo %', peDesde;
--     IF peDesde IS NULL THEN
--                 RAISE NOTICE 'peDesde IS NULL;';
--         ELSE
--                 RAISE NOTICE 'peDesde IS NOT NULL... ';
--         END IF;

    RETURN QUERY
    SELECT sl.id_seguimiento_liquidacion, sl.pe_emision, sl.cod_envio,
        p.id_pais, p.c_pais , p.d_pais,
        sl.f_envio, sl.f_recepcion,
        sl.id_estado_despacho, ed.c_estado_despacho, ed.d_estado_despacho,
        sl.f_estado, sl.motivo_estado_error
      FROM siacilocal.liq_seguimiento_liquidacion sl
      JOIN siacilocal.liq_estado_despacho ed ON ed.id_estado_despacho = sl.id_estado_despacho
      JOIN siacilocal.pais p ON p.id_pais = sl.id_pais_remitente
     WHERE id_estado_despacho = estado
        AND id_pais_remitente = idpais /*pais gestor*/
     ORDER BY sl.pe_emision, sl.id_pais_remitente, sl.f_envio;

/*
01- Liq. Pendiente Envío.
02- Liq. Enviada / (pendiente de recepcion para el gestor)
03- Liq. Recibida
04- Liq. Rechazada
05- Liq. Cerrada
*/

END;

$$;


ALTER FUNCTION siacilocal.liq_obtener_reporte_pagador_segun_estado_rendicion(idpais smallint, estado smallint) OWNER TO admin;

--
-- Name: liq_obtener_reporte_pagador_segun_estado_rendicion(smallint, integer); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_reporte_pagador_segun_estado_rendicion(idpais smallint, estado integer) RETURNS TABLE(id_seguimiento_liquidacion bigint, pe_emision integer, cod_envio integer, id_pais_remitente smallint, c_pais_remitente character varying, d_pais_remitente character varying, f_envio timestamp with time zone, f_recepcion timestamp with time zone, id_estado_despacho integer, c_estado_despacho character varying, d_estado_despacho character varying, f_estado timestamp with time zone, motivo_estado_error character varying)
    LANGUAGE plpgsql
    AS $$

BEGIN
--     RAISE NOTICE 'liq_obtener_reporte_pagador... ';
--     RAISE NOTICE 'periodo %', peDesde;
--     IF peDesde IS NULL THEN
--                 RAISE NOTICE 'peDesde IS NULL;';
--         ELSE
--                 RAISE NOTICE 'peDesde IS NOT NULL... ';
--         END IF;

    RETURN QUERY
    SELECT sl.id_seguimiento_liquidacion, sl.pe_emision, sl.cod_envio,
        p.id_pais, p.c_pais , p.d_pais,
        sl.f_envio, sl.f_recepcion,
        sl.id_estado_despacho, ed.c_estado_despacho, ed.d_estado_despacho,
        sl.f_estado, sl.motivo_estado_error
      FROM siacilocal.liq_seguimiento_liquidacion sl
      JOIN siacilocal.liq_estado_despacho ed ON ed.id_estado_despacho = sl.id_estado_despacho
      JOIN siacilocal.pais p ON p.id_pais = sl.id_pais_remitente
     WHERE sl.id_estado_despacho = estado
        AND sl.id_pais_remitente = idpais /*pais gestor*/
     ORDER BY sl.pe_emision, sl.id_pais_remitente, sl.f_envio;

/*
01- Liq. Pendiente Envío.
02- Liq. Enviada / (pendiente de recepcion para el gestor)
03- Liq. Recibida
04- Liq. Rechazada
05- Liq. Cerrada
*/

END;

$$;


ALTER FUNCTION siacilocal.liq_obtener_reporte_pagador_segun_estado_rendicion(idpais smallint, estado integer) OWNER TO admin;

--
-- Name: liq_obtener_reporte_rendicion(integer, integer, integer); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_reporte_rendicion(id_pais integer DEFAULT NULL::integer, id_estado_l integer DEFAULT NULL::integer, id_estado_r integer DEFAULT NULL::integer) RETURNS SETOF typ_liq_reporte_rendicion
    LANGUAGE plpgsql
    AS $_$
begin

 RETURN QUERY 
 
 SELECT
   l.pe_emision periodo_emision, 
   paispagador.id_pais  id_pais_pagador, 
   paispagador.c_pais   c_pais_paispagador, 
   paispagador.d_pais   d_pais_paispagador,  
   l.cod_envio,
   paisgestor.id_pais id_pais_paisgestor, 
   paisgestor.c_pais c_pais_paisgestor, 
   paisgestor.d_pais d_pais_paisgestor, 
   sr.id_estado_rendicion, 
   est_r.c_estado_rendicion, 
   est_r.d_estado_rendicion, 
   sr.f_recepcion_rendicion   fecha_ultima_rendicion, 
   sr.cant_total_casos_impagos, 
   sr.cant_total_casos_pagos, 
   sr.f_recepcion_rendicion
FROM  siacilocal.liq_liquidacion_local as l 
left outer join siacilocal.pais paisgestor on paisgestor.id_pais = l.id_pais_gestor
left outer join siacilocal.pais paispagador on paispagador.id_pais = l.id_pais_pagador
left outer join siacilocal.liq_seguimiento_liquidacion sl on l.id_seguimiento_liquidacion = sl.id_seguimiento_liquidacion
left outer join siacilocal.liq_seguimiento_rendicion sr  on l.id_seguimiento_rendicion = sr.id_seguimiento_rendicion  
left outer join siacilocal.liq_estado_rendicion est_r on sr.id_estado_rendicion = est_r.id_estado_rendicion

where l.id_pais_pagador = $1 --or  l.id_pais_gestor = $1 
      and  sl.id_estado_despacho = $2 or  $2 =0 
      and  sr.id_estado_rendicion = $3 or  $3 =0

GROUP BY periodo_emision, 
         paispagador.id_pais, 
         c_pais_paispagador, 
         d_pais_paispagador,  
         l.cod_envio,
         id_pais_paisgestor, 
         c_pais_paisgestor, 
         d_pais_paisgestor, 
         sr.id_estado_rendicion, 
         est_r.c_estado_rendicion, 
         est_r.d_estado_rendicion, 
         fecha_ultima_rendicion	, 
         sr.cant_total_casos_impagos, 
         sr.cant_total_casos_pagos, 
         sr.f_recepcion_rendicion

ORDER BY  periodo_emision, paispagador.id_pais,id_pais_paisgestor,l.cod_envio ASC;      

end;
$_$;


ALTER FUNCTION siacilocal.liq_obtener_reporte_rendicion(id_pais integer, id_estado_l integer, id_estado_r integer) OWNER TO admin;

--
-- Name: liq_obtener_reporte_rendicion(integer, integer, integer, character varying); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_obtener_reporte_rendicion(id_pais integer DEFAULT NULL::integer, id_estado_l integer DEFAULT NULL::integer, id_estado_r integer DEFAULT NULL::integer, rol character varying DEFAULT NULL::integer) RETURNS SETOF typ_liq_reporte_rendicion
    LANGUAGE plpgsql
    AS $_$
begin
RAISE NOTICE 'Pais :%', $1;
RAISE NOTICE 'estado Liq :%', $2;
RAISE NOTICE 'Estado Rind :%', $3;
RAISE NOTICE 'ROL :%', $4;

 RETURN QUERY 
 
 SELECT DISTINCT 
   l.pe_emision periodo_emision, 
   paispagador.id_pais  id_pais_pagador, 
   paispagador.c_pais   c_pais_paispagador, 
   paispagador.d_pais   d_pais_paispagador,  
   l.cod_envio,
   paisgestor.id_pais id_pais_paisgestor, 
   paisgestor.c_pais c_pais_paisgestor, 
   paisgestor.d_pais d_pais_paisgestor, 
   sr.id_estado_rendicion, 
   est_r.c_estado_rendicion, 
   est_r.d_estado_rendicion, 
   sr.f_recepcion_rendicion   fecha_ultima_rendicion, 
   sr.cant_total_casos_impagos, 
   sr.cant_total_casos_pagos, 
   sr.f_recepcion_rendicion
FROM  siacilocal.liq_liquidacion_local as l 
left outer join siacilocal.pais paisgestor on paisgestor.id_pais = l.id_pais_gestor
left outer join siacilocal.pais paispagador on paispagador.id_pais = l.id_pais_pagador
left outer join siacilocal.liq_seguimiento_liquidacion sl on l.id_seguimiento_liquidacion = sl.id_seguimiento_liquidacion
left outer join siacilocal.liq_seguimiento_rendicion sr  on l.id_seguimiento_rendicion = sr.id_seguimiento_rendicion  
left outer join siacilocal.liq_estado_rendicion est_r on sr.id_estado_rendicion = est_r.id_estado_rendicion

where ((upper('GESTOR') like upper($4) and paisgestor.id_pais = $1)
      or (upper('PAGADOR') like upper($4) and  paispagador.id_pais = $1)) 
      and (sl.id_estado_despacho = $2 or  $2 =0 or $2 is null) 
      and (sr.id_estado_rendicion = $3 or  $3 =0 or $3 is null)


ORDER BY  periodo_emision, paispagador.id_pais,id_pais_paisgestor,l.cod_envio ASC;      

end;
$_$;


ALTER FUNCTION siacilocal.liq_obtener_reporte_rendicion(id_pais integer, id_estado_l integer, id_estado_r integer, rol character varying) OWNER TO admin;

--
-- Name: liq_valida_beneficio(integer); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION liq_valida_beneficio(integer) RETURNS TABLE(padron bigint, c_estado_beneficiario character varying, c_estado_beneficio character varying, id_pais_gestor integer)
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
	  FROM siacilocal.beneficiario b
	  JOIN siacilocal.vinculo_previsional vp ON vp.id_beneficiario = b.id_beneficiario
	  JOIN siacilocal.estado_beneficiario eb ON eb.id_estado_beneficiario= b.id_estado_beneficiario
	  JOIN siacilocal.estado_beneficio evp ON evp.id_estado_beneficio = vp.id_estado_beneficio
	 WHERE b.padron = $1;
	   --AND eb.c_estado_beneficiario = 'C'
	   --AND evp.c_estado_beneficio = 'C'
	   --AND vp.id_pais_gestor = $2;



--END;

$_$;


ALTER FUNCTION siacilocal.liq_valida_beneficio(integer) OWNER TO admin;

--
-- Name: pagos_obtener_configuracion_sistema(); Type: FUNCTION; Schema: siacilocal; Owner: postgres
--

CREATE FUNCTION pagos_obtener_configuracion_sistema() RETURNS TABLE(id_configuraciones_sistema integer, propiedad character varying, contenido_propiedad character varying, descripcion character varying)
    LANGUAGE sql
    AS $$

SELECT CAST(ROW_NUMBER() OVER() AS INTEGER), propiedad, contenido_propiedad, descripcion
  FROM siacilocal.configuraciones_sistema;

 $$;


ALTER FUNCTION siacilocal.pagos_obtener_configuracion_sistema() OWNER TO postgres;

--
-- Name: tiene_prestaciones_pendientes_de_informar_pago(integer); Type: FUNCTION; Schema: siacilocal; Owner: admin
--

CREATE FUNCTION tiene_prestaciones_pendientes_de_informar_pago(integer) RETURNS bigint
    LANGUAGE sql STRICT
    AS $_$
    SELECT count(id_liquidacion_local) from siacilocal.liq_liquidacion_local
    WHERE id_seguimiento_liquidacion = $1 AND marca_pago = 'S';

$_$;


ALTER FUNCTION siacilocal.tiene_prestaciones_pendientes_de_informar_pago(integer) OWNER TO admin;

--
-- Name: beneficiario; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE beneficiario (
    id_beneficiario bigint NOT NULL,
    apellido_materno character varying(255),
    apellido_paterno character varying(255) NOT NULL,
    f_alta timestamp without time zone,
    f_fallecimiento date,
    f_nacimiento date NOT NULL,
    f_ultima_operacion_usuario timestamp without time zone NOT NULL,
    motivo_estado character varying(255),
    nombre character varying(255) NOT NULL,
    nombre_materno character varying(255),
    nombre_paterno character varying(255),
    padron bigint NOT NULL,
    id_estado_beneficiario integer NOT NULL,
    id_estado_civil integer NOT NULL,
    id_nacionalidad integer NOT NULL,
    id_pais_residencia integer NOT NULL,
    sexo character(1) NOT NULL,
    id_usuario bigint NOT NULL,
    apellido character varying(255),
    f_estado timestamp without time zone,
    id_pais_usuario integer,
    usuario character varying(255),
    estadobeneficiarioid bigint,
    estadocivilid bigint,
    pais1id bigint,
    pais2id bigint
);


ALTER TABLE siacilocal.beneficiario OWNER TO postgres;

--
-- Name: beneficiarioprocess; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE beneficiarioprocess (
    id bigint NOT NULL,
    id_beneficiario bigint,
    id_processinstance bigint
);


ALTER TABLE siacilocal.beneficiarioprocess OWNER TO postgres;

--
-- Name: beneficio; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE beneficio (
    id_beneficio bigint NOT NULL,
    f_ult_liq date,
    f_ultima_operacion_usuario timestamp without time zone NOT NULL,
    numero_beneficio character varying(255) NOT NULL,
    id_beneficiario bigint NOT NULL,
    id_pais_pagador integer NOT NULL,
    id_prestacion integer NOT NULL,
    id_usuario bigint NOT NULL
);


ALTER TABLE siacilocal.beneficio OWNER TO postgres;

--
-- Name: configuracion_servidor_pais; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE configuracion_servidor_pais (
    id_servidor_pais integer NOT NULL,
    url character varying(255) NOT NULL,
    id_pais integer NOT NULL
);


ALTER TABLE siacilocal.configuracion_servidor_pais OWNER TO postgres;

--
-- Name: configuraciones_sistema; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE configuraciones_sistema (
    propiedad character varying(255) NOT NULL,
    contenido_propiedad character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE siacilocal.configuraciones_sistema OWNER TO postgres;

--
-- Name: datos_pais; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE datos_pais (
    id_datos_pais integer NOT NULL,
    beneficio_pagador boolean NOT NULL,
    datos_maternos_oblig boolean NOT NULL,
    valida_beneficio boolean NOT NULL,
    valida_nro_doc boolean NOT NULL,
    id_moneda_transferencia integer,
    id_pais integer NOT NULL,
    webservice_url character varying(500) NOT NULL,
    cod_entidad_gestora character varying(100) NOT NULL
);


ALTER TABLE siacilocal.datos_pais OWNER TO postgres;

--
-- Name: domicilio; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE domicilio (
    id_domicilio bigint NOT NULL,
    apartamento character varying(100),
    calle character varying(100) NOT NULL,
    codigo_postal character varying(100) NOT NULL,
    correo_electronico character varying(100),
    departamento character varying(100) NOT NULL,
    f_ultima_operacion_usuario timestamp without time zone NOT NULL,
    localidad character varying(100) NOT NULL,
    nro_puerta character varying(100),
    nro_telefono character varying(100),
    piso character varying(100),
    id_beneficiario bigint NOT NULL,
    id_pais integer NOT NULL,
    id_usuario bigint NOT NULL
);


ALTER TABLE siacilocal.domicilio OWNER TO postgres;

--
-- Name: emp_estado_seguimiento_domicilio; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE emp_estado_seguimiento_domicilio (
    id_estado_domicilio integer NOT NULL,
    c_estado_domicilio character varying(255) NOT NULL,
    d_estado_domicilio character varying(255) NOT NULL,
    id_estado_siguiente integer
);


ALTER TABLE siacilocal.emp_estado_seguimiento_domicilio OWNER TO postgres;

--
-- Name: emp_estado_seguimiento_empadronamiento; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE emp_estado_seguimiento_empadronamiento (
    id_estado_emp integer NOT NULL,
    c_estado_emp character varying(255) NOT NULL,
    d_estado_emp character varying(255) NOT NULL,
    id_estado_emp_siguiente integer
);


ALTER TABLE siacilocal.emp_estado_seguimiento_empadronamiento OWNER TO postgres;

--
-- Name: emp_estado_seguimiento_vinculo; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE emp_estado_seguimiento_vinculo (
    id_estado_vinculo integer NOT NULL,
    c_estado_vinculo character varying(255) NOT NULL,
    d_estado_vinculo character varying(255) NOT NULL,
    id_estado_vinculo_siguiente integer
);


ALTER TABLE siacilocal.emp_estado_seguimiento_vinculo OWNER TO postgres;

--
-- Name: emp_seguimiento_domicilio; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE emp_seguimiento_domicilio (
    id_seguimiento_domicilio bigint NOT NULL,
    fecha_estado_domicilio timestamp without time zone NOT NULL,
    id_domicilio bigint NOT NULL,
    id_estado_domicilio integer NOT NULL,
    id_usuario bigint NOT NULL
);


ALTER TABLE siacilocal.emp_seguimiento_domicilio OWNER TO postgres;

--
-- Name: emp_seguimiento_empadronamiento; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE emp_seguimiento_empadronamiento (
    id_seguimiento_emp bigint NOT NULL,
    fecha_estado_emp timestamp without time zone NOT NULL,
    id_beneficiario bigint NOT NULL,
    id_estado_emp integer NOT NULL,
    id_usuario bigint NOT NULL
);


ALTER TABLE siacilocal.emp_seguimiento_empadronamiento OWNER TO postgres;

--
-- Name: emp_seguimiento_vinculo; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE emp_seguimiento_vinculo (
    id_seguimiento_vinculo bigint NOT NULL,
    fecha_estado_vinculo timestamp without time zone NOT NULL,
    id_estado_vinculo integer NOT NULL,
    id_usuario bigint NOT NULL,
    id_vinculo_previsional bigint NOT NULL
);


ALTER TABLE siacilocal.emp_seguimiento_vinculo OWNER TO postgres;

--
-- Name: envio_modificacion_pendiente; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE envio_modificacion_pendiente (
    id bigint NOT NULL,
    enviar_como_modificacion boolean NOT NULL,
    id_beneficiario bigint NOT NULL,
    id_pais integer NOT NULL
);


ALTER TABLE siacilocal.envio_modificacion_pendiente OWNER TO postgres;

--
-- Name: estado; Type: TABLE; Schema: siacilocal; Owner: admin; Tablespace: 
--

CREATE TABLE estado (
    id_estado smallint NOT NULL,
    c_estado character varying(20),
    d_estado character varying(50)
);


ALTER TABLE siacilocal.estado OWNER TO admin;

--
-- Name: estado_civil; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE estado_civil (
    id_estado_civil integer NOT NULL,
    c_estado_civil character varying(255) NOT NULL,
    d_estado_civil character varying(255) NOT NULL
);


ALTER TABLE siacilocal.estado_civil OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.hibernate_sequence OWNER TO postgres;

--
-- Name: historico_actualizacion; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE historico_actualizacion (
    id_historico_actualizacion bigint NOT NULL,
    f_actualizacion date NOT NULL,
    registro_actual character varying(255),
    registro_anterior character varying(255),
    id_beneficiario bigint NOT NULL,
    id_pais integer NOT NULL,
    id_rol integer NOT NULL,
    id_tipo_actualizacion integer NOT NULL,
    id_usuario bigint NOT NULL
);


ALTER TABLE siacilocal.historico_actualizacion OWNER TO postgres;

--
-- Name: identificacion_persona; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE identificacion_persona (
    id_identificacion_persona bigint NOT NULL,
    f_emision_documento date,
    f_ultima_operacion_usuario timestamp without time zone NOT NULL,
    nro_documento character varying(255) NOT NULL,
    nro_inscripcion character varying(255),
    organismo_inscripcion character varying(255),
    id_beneficiario bigint NOT NULL,
    id_tipo_documento integer NOT NULL,
    id_usuario bigint NOT NULL
);


ALTER TABLE siacilocal.identificacion_persona OWNER TO postgres;

--
-- Name: idioma; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE idioma (
    id integer NOT NULL,
    codigo character varying(255),
    descripcion character varying(255)
);


ALTER TABLE siacilocal.idioma OWNER TO postgres;

--
-- Name: liq_estado_despacho; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE liq_estado_despacho (
    id_estado_despacho integer NOT NULL,
    c_estado_despacho character varying(255) NOT NULL,
    d_estado_despacho character varying(255) NOT NULL
);


ALTER TABLE siacilocal.liq_estado_despacho OWNER TO postgres;

--
-- Name: liq_estado_rendicion; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE liq_estado_rendicion (
    id_estado_rendicion integer NOT NULL,
    c_estado_rendicion character varying(255) NOT NULL,
    d_estado_rendicion character varying(255) NOT NULL
);


ALTER TABLE siacilocal.liq_estado_rendicion OWNER TO postgres;

--
-- Name: sq_liq_liquidacion_local_id; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_liq_liquidacion_local_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_liq_liquidacion_local_id OWNER TO postgres;

--
-- Name: liq_liquidacion_local; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE liq_liquidacion_local (
    id_liquidacion_local bigint DEFAULT nextval('sq_liq_liquidacion_local_id'::regclass) NOT NULL,
    cod_envio integer,
    desc_mon_origen double precision,
    f_fin_credito date,
    f_inicio_credito date,
    f_pago date,
    id_seguimiento_liquidacion bigint,
    ident_prestacion bigint,
    imp_bruto_mon_origen double precision,
    imp_neto_mon_destino double precision,
    imp_neto_mon_origen double precision,
    marca_pago character varying(255),
    padron bigint,
    pe_emision integer,
    pe_liquidado integer,
    id_seguimiento_rendicion bigint,
    id_pais_gestor integer,
    id_pais_pagador integer,
    id_tipo_prestacion integer NOT NULL
);


ALTER TABLE siacilocal.liq_liquidacion_local OWNER TO postgres;

--
-- Name: liq_moneda; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE liq_moneda (
    id_moneda integer NOT NULL,
    c_moneda character varying(255),
    d_moneda character varying(255),
    moneda_activa boolean,
    id_pais integer
);


ALTER TABLE siacilocal.liq_moneda OWNER TO postgres;

--
-- Name: liq_moneda_cambio; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE liq_moneda_cambio (
    id_moneda_cambio integer NOT NULL,
    id_moneda_destino integer,
    id_moneda_origen integer
);


ALTER TABLE siacilocal.liq_moneda_cambio OWNER TO postgres;

--
-- Name: sq_liq_oiss_log_recepcion_liq_id; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_liq_oiss_log_recepcion_liq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_liq_oiss_log_recepcion_liq_id OWNER TO postgres;

--
-- Name: liq_oiss_log_recepcion_liq; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE liq_oiss_log_recepcion_liq (
    id_liq_oiss_log_recepcion_liq bigint DEFAULT nextval('sq_liq_oiss_log_recepcion_liq_id'::regclass) NOT NULL,
    cod_envio integer,
    f_recepcion timestamp without time zone,
    id_estado_recepcion integer,
    id_pais_gestor integer,
    id_pais_pagador integer,
    motivo_estado_error character varying(255),
    pe_emision integer
);


ALTER TABLE siacilocal.liq_oiss_log_recepcion_liq OWNER TO postgres;

--
-- Name: sq_liq_oiss_log_transaccional_id; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_liq_oiss_log_transaccional_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_liq_oiss_log_transaccional_id OWNER TO postgres;

--
-- Name: liq_oiss_log_transaccional; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE liq_oiss_log_transaccional (
    id_liq_oiss_log_transaccional bigint DEFAULT nextval('sq_liq_oiss_log_transaccional_id'::regclass) NOT NULL,
    cod_envio integer,
    f_envio timestamp without time zone,
    f_transmision timestamp without time zone,
    hora_transmision timestamp without time zone,
    id_pais_gestor integer,
    id_pais_pagador integer,
    pe_emision integer,
    id_estado_transmision integer NOT NULL
);


ALTER TABLE siacilocal.liq_oiss_log_transaccional OWNER TO postgres;

--
-- Name: sq_seguimiento_liquidacion_id_seguimiento_liquidacion; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_seguimiento_liquidacion_id_seguimiento_liquidacion
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_seguimiento_liquidacion_id_seguimiento_liquidacion OWNER TO postgres;

--
-- Name: liq_seguimiento_liquidacion; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE liq_seguimiento_liquidacion (
    id_seguimiento_liquidacion bigint DEFAULT nextval('sq_seguimiento_liquidacion_id_seguimiento_liquidacion'::regclass) NOT NULL,
    archivo_liquidacion character varying,
    cod_envio integer,
    coeficiente_cambio double precision,
    f_envio timestamp without time zone,
    f_estado timestamp without time zone,
    f_recepcion timestamp without time zone,
    imp_total_neto_destino double precision,
    imp_total_neto_original double precision,
    m_transmitido character varying(255),
    motivo_estado_error character varying(255),
    pe_emision integer,
    id_estado_despacho integer,
    id_moneda_gestor integer,
    id_moneda_pagador integer,
    id_pais_destino integer,
    id_pais_remitente integer
);


ALTER TABLE siacilocal.liq_seguimiento_liquidacion OWNER TO postgres;

--
-- Name: liq_seguimiento_rendicion; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE liq_seguimiento_rendicion (
    id_seguimiento_rendicion bigint NOT NULL,
    archivo_rendicion character varying,
    cant_total_casos_impagos integer,
    cant_total_casos_pagos integer,
    cod_envio integer,
    f_envio_rendicion timestamp without time zone,
    f_estado timestamp without time zone,
    f_recepcion_rendicion timestamp without time zone,
    nro_rendicion bigint,
    pe_emision integer,
    id_estado_rendicion integer,
    id_pais_destino integer,
    id_pais_remitente integer
);


ALTER TABLE siacilocal.liq_seguimiento_rendicion OWNER TO postgres;

--
-- Name: log_envio_pendientes; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE log_envio_pendientes (
    id integer NOT NULL,
    ultima_ejecucion timestamp without time zone
);


ALTER TABLE siacilocal.log_envio_pendientes OWNER TO postgres;

--
-- Name: nacionalidad; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE nacionalidad (
    id integer NOT NULL,
    descripcion character varying(255) NOT NULL,
    id_pais integer
);


ALTER TABLE siacilocal.nacionalidad OWNER TO postgres;

--
-- Name: pais; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE pais (
    id_pais integer NOT NULL,
    c_pais character varying(255) NOT NULL,
    d_pais character varying(255) NOT NULL
);


ALTER TABLE siacilocal.pais OWNER TO postgres;

--
-- Name: prestacion; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE prestacion (
    id_prestacion integer NOT NULL,
    c_prestacion character varying(255) NOT NULL,
    d_prestacion character varying(255) NOT NULL
);


ALTER TABLE siacilocal.prestacion OWNER TO postgres;

--
-- Name: rol; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE rol (
    id_rol integer NOT NULL,
    c_rol character varying(255) NOT NULL,
    d_rol character varying(255) NOT NULL
);


ALTER TABLE siacilocal.rol OWNER TO postgres;

--
-- Name: sexo; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE sexo (
    codigo character(1) NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE siacilocal.sexo OWNER TO postgres;

--
-- Name: sq_beneficiario_id_beneficiario; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_beneficiario_id_beneficiario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_beneficiario_id_beneficiario OWNER TO postgres;

--
-- Name: sq_beneficio_id_beneficio; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_beneficio_id_beneficio
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_beneficio_id_beneficio OWNER TO postgres;

--
-- Name: sq_domicilio_id_domicilio; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_domicilio_id_domicilio
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_domicilio_id_domicilio OWNER TO postgres;

--
-- Name: sq_emp_seguimiento_domicilio; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_emp_seguimiento_domicilio
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_emp_seguimiento_domicilio OWNER TO postgres;

--
-- Name: sq_emp_seguimiento_empadronamiento; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_emp_seguimiento_empadronamiento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_emp_seguimiento_empadronamiento OWNER TO postgres;

--
-- Name: sq_emp_seguimiento_vinculo; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_emp_seguimiento_vinculo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_emp_seguimiento_vinculo OWNER TO postgres;

--
-- Name: sq_envio_pendiente_id; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_envio_pendiente_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_envio_pendiente_id OWNER TO postgres;

--
-- Name: sq_historico_actualizacion_id_historico_actualizacion; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_historico_actualizacion_id_historico_actualizacion
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_historico_actualizacion_id_historico_actualizacion OWNER TO postgres;

--
-- Name: sq_identificacion_persona_id_identificacion_persona; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_identificacion_persona_id_identificacion_persona
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_identificacion_persona_id_identificacion_persona OWNER TO postgres;

--
-- Name: sq_moneda_cambio_id_moneda_cambio; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_moneda_cambio_id_moneda_cambio
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_moneda_cambio_id_moneda_cambio OWNER TO postgres;

--
-- Name: sq_seguimiento_rendicion_id; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_seguimiento_rendicion_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_seguimiento_rendicion_id OWNER TO postgres;

--
-- Name: sq_usuario_id; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_usuario_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_usuario_id OWNER TO postgres;

--
-- Name: sq_vinculo_previsional_id_vinculo_previsional; Type: SEQUENCE; Schema: siacilocal; Owner: postgres
--

CREATE SEQUENCE sq_vinculo_previsional_id_vinculo_previsional
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siacilocal.sq_vinculo_previsional_id_vinculo_previsional OWNER TO postgres;

--
-- Name: tipo_actualizacion; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_actualizacion (
    id_tipo_actualizacion integer NOT NULL,
    c_tipo_actualizacion character varying(255) NOT NULL,
    d_tipo_actualizacion character varying(255) NOT NULL
);


ALTER TABLE siacilocal.tipo_actualizacion OWNER TO postgres;

--
-- Name: tipo_documento; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_documento (
    id_tipo_documento integer NOT NULL,
    c_tipo_documento character varying(255) NOT NULL,
    d_tipo_documento character varying(255) NOT NULL,
    gestor_obligatorio boolean NOT NULL,
    pagador_obligatorio boolean NOT NULL,
    id_pais integer NOT NULL
);


ALTER TABLE siacilocal.tipo_documento OWNER TO postgres;

--
-- Name: tipo_envio; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_envio (
    id_tipo_envio integer NOT NULL,
    c_tipo_envio character varying(255),
    d_tipo_envio character varying(255)
);


ALTER TABLE siacilocal.tipo_envio OWNER TO postgres;

--
-- Name: tipo_informacion; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_informacion (
    id_tipo_informacion integer NOT NULL,
    c_tipo_informacion character varying(255),
    d_tipo_informacion character varying(255)
);


ALTER TABLE siacilocal.tipo_informacion OWNER TO postgres;

--
-- Name: tipo_motivo; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_motivo (
    id_tipo_motivo integer NOT NULL,
    c_tipo_motivo character varying(255) NOT NULL,
    d_tipo_motivo character varying(255) NOT NULL
);


ALTER TABLE siacilocal.tipo_motivo OWNER TO postgres;

--
-- Name: tipo_prestacion; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_prestacion (
    id_tipo_prestacion integer NOT NULL,
    c_tipo_prestacion character varying(255),
    d_tipo_prestacion character varying(255)
);


ALTER TABLE siacilocal.tipo_prestacion OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id bigint NOT NULL,
    apellido character varying(255),
    correo_electronico character varying(255),
    nombre character varying(255),
    password character varying(255) NOT NULL,
    nombre_usuario character varying(255) NOT NULL,
    id_pais_origen integer NOT NULL,
    id_rol integer NOT NULL,
    password_plain character varying NOT NULL
);


ALTER TABLE siacilocal.usuario OWNER TO postgres;

--
-- Name: vinculo_previsional; Type: TABLE; Schema: siacilocal; Owner: postgres; Tablespace: 
--

CREATE TABLE vinculo_previsional (
    id_vinculo_previsional bigint NOT NULL,
    f_alta timestamp without time zone NOT NULL,
    f_ultima_operacion_usuario timestamp without time zone NOT NULL,
    motivo_estado character varying(255),
    id_beneficiario bigint NOT NULL,
    id_estado_beneficio integer NOT NULL,
    id_pais_gestor integer NOT NULL,
    id_pais_pagador integer NOT NULL,
    id_tipo_motivo integer,
    id_usuario bigint NOT NULL
);


ALTER TABLE siacilocal.vinculo_previsional OWNER TO postgres;

--
-- Data for Name: beneficiario; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--


--
-- Data for Name: beneficiarioprocess; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--



--
-- Data for Name: beneficio; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--



--
-- Data for Name: configuracion_servidor_pais; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO configuracion_servidor_pais (id_servidor_pais, url, id_pais) VALUES (1, 'http://localhost:9080/', 1);
INSERT INTO configuracion_servidor_pais (id_servidor_pais, url, id_pais) VALUES (2, 'http://localhost:9180/', 2);
INSERT INTO configuracion_servidor_pais (id_servidor_pais, url, id_pais) VALUES (3, 'http://localhost:9280/', 3);
INSERT INTO configuracion_servidor_pais (id_servidor_pais, url, id_pais) VALUES (4, 'http://localhost:9380/', 4);


--
-- Data for Name: configuraciones_sistema; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('version', '1.2', 'VersiÃ³n del Sistema');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('appserver', 'JBOSS', 'Servidor de aplicaciones utilizado (JBOSS ou OC4J)');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('jmsQueueFactory', 'ConnectionFactory', 'FÃ¡brica de conexiones para o JMS (JBOSS = ConnectionFactory; OC4J = jms/QueueConnectionFactory)');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('jmsQueue', 'queue/filaLogMercosul', 'Cola de mensajes persistentes configurada en el servidor (JBOSS = queue/filaLogMercosul; OC4J = jms/filaLogMercosul)');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('oissUrl', 'http://localhost:8080/oiss/services/LogServices', 'Log Web Service de OISS');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('oissTimer', '1000000', 'Tiempo en milisegundos para tentativa de reenvÃ­o del log a OISS');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('oissUrlAuth', 'http://localhost:8080/oiss/services/AutorizacaoServices', 'Web Service de autenticaciÃ³n en OISS');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('tamMaxImagens', '700', 'TamaÃ±o mÃ¡ximo de las imÃ¡genes adjuntas en un proceso.');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('paisId', '1', 'ID del PaÃ­s en la tabla de dominio');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('keystoreAuthPath', 'C:/SIACI-OLD/jboss-4.2.3.GA/CDOISS/keystore/keystore.jks', 'Ruta del Keystore de certificados autorizados');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('keystoreSSLPath', 'C:/SIACI-OLD/jboss-4.2.3.GA/CDOISS/keystore/keystore.jks', 'Ruta del Keystore SSL para configuraciÃ³n de HTTPS');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('keystoreAuthPassword', '9yA45XYRp9sHsrEDXQJdlQ==', 'ContraseÃ±a para autenticaciÃ³n del Keystore de certificados autorizados');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('keystorePassword', '9yA45XYRp9sHsrEDXQJdlQ==', 'ContraseÃ±a utilizada para acceder al keystore');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('keystoreSSLPassword', '9yA45XYRp9sHsrEDXQJdlQ==', 'ContraseÃ±a para autenticaciÃ³n del Keystore SSL');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('privateKeyPassword', '9yA45XYRp9sHsrEDXQJdlQ==', 'ContraseÃ±a utilizada para acceder a la clave privada');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('privateKeyAlias', 'argentina', 'Alias utilizado para identificar la clave privada del paÃ­s');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('uri.archivosalidaxml', 'C:/Proyectos/Java/SIACI/Archivo/Salida/', 'URI Archivo salida XML');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('uri.archivohistoricoxml', 'C:/Proyectos/Java/SIACI/Archivo/Historico/', 'URI Archivo historico XML');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.empadronamientowsSinIP', 'siaci/soap/alta', 'URL Web service Empadronamiento (Sin IP)');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.actualizacionwsSinIP', 'siaci/soap/actualizacion', 'URL Web service Actualizacion (Sin IP)');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.comunicacionwsSinIP', 'pagosMercosurWS/ComunicacionWSImpl', 'URL Web service Comunicacion (Sin IP)');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.empadronamientows', 'http://localhost:8080/siaci/soap/alta', 'URL Web service Empadronamiento');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.seguimientows', 'http://localhost:8080/pagosMercosurWS/SeguimientoWSImpl', 'URL Web service Seguimiento');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.busquedaws', 'http://localhost:8080/pagosMercosurWS/BusquedaWSImpl', 'URL Web service Busqueda');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.codigoUtilws', 'http://localhost:8080/pagosMercosurWS/CodigoUtilWSImpl', 'URL Web service Codigo Util');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.actualizacionws', 'http://localhost:8080/pagosMercosurWS/ActualizacionWSImpl', 'URL Web service Actualizacion');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.xmlws', 'http://localhost:8080/pagosMercosurWS/XmlWSImpl', 'URL Web service XML');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.autorizacionws', 'http://localhost:8080/pagosMercosurWS/AutorizacionWSImpl', 'URL Web service Autorizacion');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.configuracionSistemaws', 'http://localhost:8080/pagosMercosurWS/ConfiguracionSistemaWSImpl', 'URL Web service Configuracion sistema');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.actualizacionwsOISS', 'http://localhost:10080/oissMercosurWS/ActualizacionOISSWSImpl', 'URL Web service Actualizacion OISS');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.empadronamientowsOISS', 'http://localhost:10080/oissMercosurWS/EmpadronamientoOISSWSImpl', 'URL Web service Empadronamiento OISS');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.liquidacionws', 'http://localhost:8080/pagosMercosurWS/LiquidacionWSImpl', 'URL Web service Liquidacion');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.comunws', 'http://localhost:8080/pagosMercosurWS/ComunWSImpl', 'URL Web service Comun');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.comunicacionws', 'http://localhost:8080/pagosMercosurWS/ComunicacionWSImpl', 'URL Web service Comunicacion');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.rendicionws', 'http://localhost:8080/pagosMercosurWS/RendicionWSImpl', 'URL Web service Rendicion');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('uri.esquemaempadronamientoalta', 'EsquemaEmpadronamientoAlta.xsd', 'URI Esquema Empadronamiento Alta');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('uri.esquemaempadronamientoaprobacion', 'EsquemaEmpadronamientoAprobacion.xsd', 'URI Esquema Empadronamiento Aprobacion');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('uri.esquemaempadronamientoactualizacion', 'EsquemaEmpadronamientoActualizacion.xsd', 'URI Esquema Empadronamiento Actualizacion');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('TareaPeriodo', '21600000', 'Periodo para ejecucion de procesos batch');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('uri.esquemaliquidacion', 'c:/SIACI-OLD/jboss-4.2.3.GA/server/default/data/xsd/ESQUEMALIQBEN.xsd', 'URI Esquema Liquidacion');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('uri.esquemarendicion', 'c:/SIACI-OLD/jboss-4.2.3.GA/server/default/data/xsd/EsquemaRENLIQInterno.xsd', 'URI Esquema Rendicion');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('pais', 'Argentina', 'Nombre del país');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('keystorePath', 'C:/SIACI-OLD/jboss-4.2.3.GA/CDOISS/keystore/keystore.jks', 'Ruta real para el archivo de keystore');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('trustedCertificatesPath', 'C:/SIACI-OLD/jboss-4.2.3.GA/CDOISS/trusted', 'Directorio de certificados confiables');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.validacionoissws', 'http://localhost:8080/oissMercosurWS/ValidacionWSImpl', 'URL Web service ValidacionOISS');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.logoissws', 'http://localhost:8080/oissMercosurWS/LogOISSWSImpl', 'URL Web service Log OISS');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.siaci.nuevo', 'http://localhost:8080/siaci', 'Url del Siaci nuevo');
INSERT INTO configuraciones_sistema (propiedad, contenido_propiedad, descripcion) VALUES ('url.siaci.viejo', 'http://localhost:8080/pagosMercosur', 'Url del Siaci viejo');


--
-- Data for Name: datos_pais; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO datos_pais (id_datos_pais, beneficio_pagador, datos_maternos_oblig, valida_beneficio, valida_nro_doc, id_moneda_transferencia, id_pais, webservice_url, cod_entidad_gestora) VALUES (1, false, false, false, true, NULL, 1, 'http://localhost:8080/pagosMercosurWS/ComunicacionWSImpl', 'ANSES');
INSERT INTO datos_pais (id_datos_pais, beneficio_pagador, datos_maternos_oblig, valida_beneficio, valida_nro_doc, id_moneda_transferencia, id_pais, webservice_url, cod_entidad_gestora) VALUES (2, true, true, true, true, NULL, 2, 'http://localhost:8180/pagosMercosurWS/ComunicacionWSImpl', 'BPS');
INSERT INTO datos_pais (id_datos_pais, beneficio_pagador, datos_maternos_oblig, valida_beneficio, valida_nro_doc, id_moneda_transferencia, id_pais, webservice_url, cod_entidad_gestora) VALUES (3, false, false, false, false, NULL, 3, 'http://localhost:8280/pagosMercosurWS/ComunicacionWSImpl', 'IPS');
INSERT INTO datos_pais (id_datos_pais, beneficio_pagador, datos_maternos_oblig, valida_beneficio, valida_nro_doc, id_moneda_transferencia, id_pais, webservice_url, cod_entidad_gestora) VALUES (4, false, false, false, false, NULL, 4, 'http://localhost:8380/pagosMercosurWS/ComunicacionWSImpl', 'U');


--
-- Data for Name: domicilio; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--


--
-- Data for Name: emp_estado_seguimiento_domicilio; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO emp_estado_seguimiento_domicilio (id_estado_domicilio, c_estado_domicilio, d_estado_domicilio, id_estado_siguiente) VALUES (3, 'RE', 'Recibido', NULL);
INSERT INTO emp_estado_seguimiento_domicilio (id_estado_domicilio, c_estado_domicilio, d_estado_domicilio, id_estado_siguiente) VALUES (6, 'REM', 'Recibido ModificaciÃ³n', NULL);
INSERT INTO emp_estado_seguimiento_domicilio (id_estado_domicilio, c_estado_domicilio, d_estado_domicilio, id_estado_siguiente) VALUES (1, 'E', 'Edicion', 2);
INSERT INTO emp_estado_seguimiento_domicilio (id_estado_domicilio, c_estado_domicilio, d_estado_domicilio, id_estado_siguiente) VALUES (2, 'PEPA', 'Pendiente EnvÃ­o PaÃ­s Alta', 3);
INSERT INTO emp_estado_seguimiento_domicilio (id_estado_domicilio, c_estado_domicilio, d_estado_domicilio, id_estado_siguiente) VALUES (4, 'PEOM', 'Pendiente EnvÃ­o OISS ModificaciÃ³n', 5);
INSERT INTO emp_estado_seguimiento_domicilio (id_estado_domicilio, c_estado_domicilio, d_estado_domicilio, id_estado_siguiente) VALUES (5, 'PEPM', 'Pendiente EnvÃ­o PaÃ­s ModificaciÃ³n', 6);


--
-- Data for Name: emp_estado_seguimiento_empadronamiento; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO emp_estado_seguimiento_empadronamiento (id_estado_emp, c_estado_emp, d_estado_emp, id_estado_emp_siguiente) VALUES (6, 'RE', 'Recibido', NULL);
INSERT INTO emp_estado_seguimiento_empadronamiento (id_estado_emp, c_estado_emp, d_estado_emp, id_estado_emp_siguiente) VALUES (9, 'REM', 'Recibido ModificaciÃ³n', NULL);
INSERT INTO emp_estado_seguimiento_empadronamiento (id_estado_emp, c_estado_emp, d_estado_emp, id_estado_emp_siguiente) VALUES (1, 'E', 'Edicion', 2);
INSERT INTO emp_estado_seguimiento_empadronamiento (id_estado_emp, c_estado_emp, d_estado_emp, id_estado_emp_siguiente) VALUES (2, 'PEPA', 'Pendiente EnvÃ­o PaÃ­s Alta', 3);
INSERT INTO emp_estado_seguimiento_empadronamiento (id_estado_emp, c_estado_emp, d_estado_emp, id_estado_emp_siguiente) VALUES (3, 'PA', 'Pendiente Aprobacion', 4);
INSERT INTO emp_estado_seguimiento_empadronamiento (id_estado_emp, c_estado_emp, d_estado_emp, id_estado_emp_siguiente) VALUES (4, 'PEAO', 'Pendiente EnvÃ­o Aprobacion OISS', 5);
INSERT INTO emp_estado_seguimiento_empadronamiento (id_estado_emp, c_estado_emp, d_estado_emp, id_estado_emp_siguiente) VALUES (5, 'PEAP', 'Pendiente EnvÃ­o Aprobacion PaÃ­s', 6);
INSERT INTO emp_estado_seguimiento_empadronamiento (id_estado_emp, c_estado_emp, d_estado_emp, id_estado_emp_siguiente) VALUES (7, 'PEOM', 'Pendiente EnvÃ­o OISS ModificaciÃ³n', 8);
INSERT INTO emp_estado_seguimiento_empadronamiento (id_estado_emp, c_estado_emp, d_estado_emp, id_estado_emp_siguiente) VALUES (8, 'PEPM', 'Pendiente EnvÃ­o PaÃ­s ModificaciÃ³n', 9);


--
-- Data for Name: emp_estado_seguimiento_vinculo; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO emp_estado_seguimiento_vinculo (id_estado_vinculo, c_estado_vinculo, d_estado_vinculo, id_estado_vinculo_siguiente) VALUES (6, 'RE', 'Recibido', NULL);
INSERT INTO emp_estado_seguimiento_vinculo (id_estado_vinculo, c_estado_vinculo, d_estado_vinculo, id_estado_vinculo_siguiente) VALUES (9, 'REM', 'Recibido ModificaciÃ³n', NULL);
INSERT INTO emp_estado_seguimiento_vinculo (id_estado_vinculo, c_estado_vinculo, d_estado_vinculo, id_estado_vinculo_siguiente) VALUES (1, 'PEOA', 'Pendiente EnvÃ­o OISS Alta', 2);
INSERT INTO emp_estado_seguimiento_vinculo (id_estado_vinculo, c_estado_vinculo, d_estado_vinculo, id_estado_vinculo_siguiente) VALUES (2, 'PEPA', 'Pendiente EnvÃ­o PaÃ­s Alta', 3);
INSERT INTO emp_estado_seguimiento_vinculo (id_estado_vinculo, c_estado_vinculo, d_estado_vinculo, id_estado_vinculo_siguiente) VALUES (3, 'PA', 'Pendiente Aprobacion Local', 4);
INSERT INTO emp_estado_seguimiento_vinculo (id_estado_vinculo, c_estado_vinculo, d_estado_vinculo, id_estado_vinculo_siguiente) VALUES (4, 'PEAO', 'Pendiente EnvÃ­o AprobaciÃ³n OISS', 5);
INSERT INTO emp_estado_seguimiento_vinculo (id_estado_vinculo, c_estado_vinculo, d_estado_vinculo, id_estado_vinculo_siguiente) VALUES (5, 'PEAP', 'Pendiente EnvÃ­o AprobaciÃ³n PaÃ­s', 6);
INSERT INTO emp_estado_seguimiento_vinculo (id_estado_vinculo, c_estado_vinculo, d_estado_vinculo, id_estado_vinculo_siguiente) VALUES (7, 'PEOM', 'Pendiente EnvÃ­o OISS ModificaciÃ³n', 8);
INSERT INTO emp_estado_seguimiento_vinculo (id_estado_vinculo, c_estado_vinculo, d_estado_vinculo, id_estado_vinculo_siguiente) VALUES (8, 'PEPM', 'Pendiente EnvÃ­o PaÃ­s ModificaciÃ³n', 9);


--
-- Data for Name: emp_seguimiento_domicilio; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--


--
-- Data for Name: emp_seguimiento_empadronamiento; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--


--
-- Data for Name: emp_seguimiento_vinculo; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--



--
-- Data for Name: envio_modificacion_pendiente; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--



--
-- Data for Name: estado; Type: TABLE DATA; Schema: siacilocal; Owner: admin
--

INSERT INTO estado (id_estado, c_estado, d_estado) VALUES (1, 'A completar', 'A completar');
INSERT INTO estado (id_estado, c_estado, d_estado) VALUES (2, 'Pendiente val/Comp', 'Pendiente val/compl');
INSERT INTO estado (id_estado, c_estado, d_estado) VALUES (3, 'Pendiente transm/val', 'Pendiente de transmisión/validado');
INSERT INTO estado (id_estado, c_estado, d_estado) VALUES (4, 'Transmitido', 'Transmitido');
INSERT INTO estado (id_estado, c_estado, d_estado) VALUES (5, 'Recibido', 'Recibido');
INSERT INTO estado (id_estado, c_estado, d_estado) VALUES (7, 'Parcial transmitido', 'Parcialmente transmitido');
INSERT INTO estado (id_estado, c_estado, d_estado) VALUES (6, 'Listodo', 'Lido');


--
-- Data for Name: estado_beneficiario; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO estado_beneficiario (id_estado_beneficiario, c_estado_beneficiario, d_estado_beneficiario) VALUES (1, 'R', 'Rechazado');
INSERT INTO estado_beneficiario (id_estado_beneficiario, c_estado_beneficiario, d_estado_beneficiario) VALUES (2, 'P', 'Provisorio');
INSERT INTO estado_beneficiario (id_estado_beneficiario, c_estado_beneficiario, d_estado_beneficiario) VALUES (3, 'C', 'Confirmado');
INSERT INTO estado_beneficiario (id_estado_beneficiario, c_estado_beneficiario, d_estado_beneficiario) VALUES (4, 'B', 'Baja');


--
-- Data for Name: estado_beneficio; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO estado_beneficio (id_estado_beneficio, c_estado_beneficio, d_estado_beneficio) VALUES (1, 'R', 'Rechazado');
INSERT INTO estado_beneficio (id_estado_beneficio, c_estado_beneficio, d_estado_beneficio) VALUES (2, 'P', 'Provisorio');
INSERT INTO estado_beneficio (id_estado_beneficio, c_estado_beneficio, d_estado_beneficio) VALUES (3, 'C', 'Confirmado');
INSERT INTO estado_beneficio (id_estado_beneficio, c_estado_beneficio, d_estado_beneficio) VALUES (4, 'B', 'Baja');


--
-- Data for Name: estado_civil; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO estado_civil (id_estado_civil, c_estado_civil, d_estado_civil) VALUES (1, 'S', 'Soltero');
INSERT INTO estado_civil (id_estado_civil, c_estado_civil, d_estado_civil) VALUES (2, 'C', 'Casado');
INSERT INTO estado_civil (id_estado_civil, c_estado_civil, d_estado_civil) VALUES (3, 'V', 'Viudo');
INSERT INTO estado_civil (id_estado_civil, c_estado_civil, d_estado_civil) VALUES (4, 'D', 'Divorciado');
INSERT INTO estado_civil (id_estado_civil, c_estado_civil, d_estado_civil) VALUES (5, 'P', 'Conviviente Previsional');


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 1, false);


--
-- Data for Name: historico_actualizacion; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--


--
-- Data for Name: identificacion_persona; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--



--
-- Data for Name: idioma; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO idioma (id, codigo, descripcion) VALUES (1, 'ES', 'EspaÃ±ol');
INSERT INTO idioma (id, codigo, descripcion) VALUES (2, 'PT', 'PortuguÃªs');


--
-- Data for Name: liq_estado_despacho; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO liq_estado_despacho (id_estado_despacho, c_estado_despacho, d_estado_despacho) VALUES (1, 'PENDIENTE ENVIO', 'Liq. Pendiente EnvÃ­o');
INSERT INTO liq_estado_despacho (id_estado_despacho, c_estado_despacho, d_estado_despacho) VALUES (2, 'ENVIADA', 'Liq. Enviada');
INSERT INTO liq_estado_despacho (id_estado_despacho, c_estado_despacho, d_estado_despacho) VALUES (3, 'RECIBIDA', 'Liq. Recibida');
INSERT INTO liq_estado_despacho (id_estado_despacho, c_estado_despacho, d_estado_despacho) VALUES (4, 'RECHAZADA', 'Liq. Rechazada');
INSERT INTO liq_estado_despacho (id_estado_despacho, c_estado_despacho, d_estado_despacho) VALUES (5, 'CERRADA', 'Liq. Cerrada');
INSERT INTO liq_estado_despacho (id_estado_despacho, c_estado_despacho, d_estado_despacho) VALUES (6, 'PENDIENTE RECEPCION', 'Liq. Pendiente Recepcion');


--
-- Data for Name: liq_estado_rendicion; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO liq_estado_rendicion (id_estado_rendicion, c_estado_rendicion, d_estado_rendicion) VALUES (1, 'ENVIADA', 'RendiciÃ³n Enviada');
INSERT INTO liq_estado_rendicion (id_estado_rendicion, c_estado_rendicion, d_estado_rendicion) VALUES (2, 'OK', 'RendiciÃ³n OK');
INSERT INTO liq_estado_rendicion (id_estado_rendicion, c_estado_rendicion, d_estado_rendicion) VALUES (3, 'FIRMA INVALIDA', 'Firma InvÃ¡lida');
INSERT INTO liq_estado_rendicion (id_estado_rendicion, c_estado_rendicion, d_estado_rendicion) VALUES (4, 'INSCONSISTENTE', 'Inconsistencia en Archivo');
INSERT INTO liq_estado_rendicion (id_estado_rendicion, c_estado_rendicion, d_estado_rendicion) VALUES (5, 'ERROR FORMATO', 'Error de formato');
INSERT INTO liq_estado_rendicion (id_estado_rendicion, c_estado_rendicion, d_estado_rendicion) VALUES (6, 'PENDIENTE ENVIO', 'Rendicion Pendiente EnvÃ­o');


--
-- Data for Name: liq_liquidacion_local; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--


--
-- Data for Name: liq_moneda; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO liq_moneda (id_moneda, c_moneda, d_moneda, moneda_activa, id_pais) VALUES (1, 'PesoArg', 'Peso Argentino', false, 1);
INSERT INTO liq_moneda (id_moneda, c_moneda, d_moneda, moneda_activa, id_pais) VALUES (2, 'Real', 'Real', false, 2);
INSERT INTO liq_moneda (id_moneda, c_moneda, d_moneda, moneda_activa, id_pais) VALUES (3, 'PesoPara', 'Peso Paraguayo', false, 3);
INSERT INTO liq_moneda (id_moneda, c_moneda, d_moneda, moneda_activa, id_pais) VALUES (4, 'PesoUru', 'Peso Uruguayo', false, 4);


--
-- Data for Name: liq_moneda_cambio; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO liq_moneda_cambio (id_moneda_cambio, id_moneda_destino, id_moneda_origen) VALUES (1, 2, 1);
INSERT INTO liq_moneda_cambio (id_moneda_cambio, id_moneda_destino, id_moneda_origen) VALUES (2, 3, 1);
INSERT INTO liq_moneda_cambio (id_moneda_cambio, id_moneda_destino, id_moneda_origen) VALUES (3, 4, 1);
INSERT INTO liq_moneda_cambio (id_moneda_cambio, id_moneda_destino, id_moneda_origen) VALUES (4, 1, 2);
INSERT INTO liq_moneda_cambio (id_moneda_cambio, id_moneda_destino, id_moneda_origen) VALUES (5, 3, 2);
INSERT INTO liq_moneda_cambio (id_moneda_cambio, id_moneda_destino, id_moneda_origen) VALUES (6, 4, 2);
INSERT INTO liq_moneda_cambio (id_moneda_cambio, id_moneda_destino, id_moneda_origen) VALUES (7, 1, 3);
INSERT INTO liq_moneda_cambio (id_moneda_cambio, id_moneda_destino, id_moneda_origen) VALUES (8, 2, 3);
INSERT INTO liq_moneda_cambio (id_moneda_cambio, id_moneda_destino, id_moneda_origen) VALUES (9, 4, 3);
INSERT INTO liq_moneda_cambio (id_moneda_cambio, id_moneda_destino, id_moneda_origen) VALUES (10, 1, 4);
INSERT INTO liq_moneda_cambio (id_moneda_cambio, id_moneda_destino, id_moneda_origen) VALUES (11, 2, 4);
INSERT INTO liq_moneda_cambio (id_moneda_cambio, id_moneda_destino, id_moneda_origen) VALUES (12, 3, 4);
INSERT INTO liq_moneda_cambio (id_moneda_cambio, id_moneda_destino, id_moneda_origen) VALUES (74, 2, 2);
INSERT INTO liq_moneda_cambio (id_moneda_cambio, id_moneda_destino, id_moneda_origen) VALUES (80, 4, 4);
INSERT INTO liq_moneda_cambio (id_moneda_cambio, id_moneda_destino, id_moneda_origen) VALUES (83, 3, 3);


--
-- Data for Name: liq_oiss_log_recepcion_liq; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--



--
-- Data for Name: liq_oiss_log_transaccional; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--



--
-- Data for Name: liq_seguimiento_liquidacion; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--



--
-- Data for Name: liq_seguimiento_rendicion; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--



--
-- Data for Name: log_envio_pendientes; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--



--
-- Data for Name: nacionalidad; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO nacionalidad (id, descripcion, id_pais) VALUES (1, 'Argentina', 1);
INSERT INTO nacionalidad (id, descripcion, id_pais) VALUES (2, 'Brasil', 2);
INSERT INTO nacionalidad (id, descripcion, id_pais) VALUES (3, 'Paraguay', 3);
INSERT INTO nacionalidad (id, descripcion, id_pais) VALUES (4, 'Uruguay', 4);
INSERT INTO nacionalidad (id, descripcion, id_pais) VALUES (5, 'Otro', NULL);


--
-- Data for Name: pais; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO pais (id_pais, c_pais, d_pais) VALUES (1, 'ARG', 'Argentina');
INSERT INTO pais (id_pais, c_pais, d_pais) VALUES (2, 'BR', 'Brasil');
INSERT INTO pais (id_pais, c_pais, d_pais) VALUES (3, 'PR', 'Paraguay');
INSERT INTO pais (id_pais, c_pais, d_pais) VALUES (4, 'UR', 'Uruguay');


--
-- Data for Name: prestacion; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO prestacion (id_prestacion, c_prestacion, d_prestacion) VALUES (1, 'J', 'JubilaciÃ³n');
INSERT INTO prestacion (id_prestacion, c_prestacion, d_prestacion) VALUES (2, 'P', 'PensiÃ³n');
INSERT INTO prestacion (id_prestacion, c_prestacion, d_prestacion) VALUES (3, 'E', 'Ayuda Enfermedad');


--
-- Data for Name: rol; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO rol (id_rol, c_rol, d_rol) VALUES (1, 'USER_G', 'Gestor');
INSERT INTO rol (id_rol, c_rol, d_rol) VALUES (2, 'USER_P', 'Pagador');


--
-- Data for Name: sexo; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO sexo (codigo, descripcion) VALUES ('M', 'Masculino');
INSERT INTO sexo (codigo, descripcion) VALUES ('F', 'Femenino');


--
-- Name: sq_beneficiario_id_beneficiario; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_beneficiario_id_beneficiario', 1, false);


--
-- Name: sq_beneficio_id_beneficio; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_beneficio_id_beneficio', 1, false);


--
-- Name: sq_domicilio_id_domicilio; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_domicilio_id_domicilio', 1, false);


--
-- Name: sq_emp_seguimiento_domicilio; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_emp_seguimiento_domicilio', 1, false);


--
-- Name: sq_emp_seguimiento_empadronamiento; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_emp_seguimiento_empadronamiento', 1, false);


--
-- Name: sq_emp_seguimiento_vinculo; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_emp_seguimiento_vinculo', 1, false);


--
-- Name: sq_envio_pendiente_id; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_envio_pendiente_id', 1, false);


--
-- Name: sq_historico_actualizacion_id_historico_actualizacion; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_historico_actualizacion_id_historico_actualizacion', 1, false);


--
-- Name: sq_identificacion_persona_id_identificacion_persona; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_identificacion_persona_id_identificacion_persona', 1, false);


--
-- Name: sq_liq_liquidacion_local_id; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_liq_liquidacion_local_id', 3, true);


--
-- Name: sq_liq_oiss_log_recepcion_liq_id; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_liq_oiss_log_recepcion_liq_id', 1, false);


--
-- Name: sq_liq_oiss_log_transaccional_id; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_liq_oiss_log_transaccional_id', 1, false);


--
-- Name: sq_moneda_cambio_id_moneda_cambio; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_moneda_cambio_id_moneda_cambio', 1, false);


--
-- Name: sq_seguimiento_liquidacion_id_seguimiento_liquidacion; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_seguimiento_liquidacion_id_seguimiento_liquidacion', 3, true);


--
-- Name: sq_seguimiento_rendicion_id; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_seguimiento_rendicion_id', 3, true);


--
-- Name: sq_usuario_id; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuario_id', 2, true);


--
-- Name: sq_vinculo_previsional_id_vinculo_previsional; Type: SEQUENCE SET; Schema: siacilocal; Owner: postgres
--

SELECT pg_catalog.setval('sq_vinculo_previsional_id_vinculo_previsional', 1, false);


--
-- Data for Name: tipo_actualizacion; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO tipo_actualizacion (id_tipo_actualizacion, c_tipo_actualizacion, d_tipo_actualizacion) VALUES (1, 'AF', 'Fecha Fallecimiento');
INSERT INTO tipo_actualizacion (id_tipo_actualizacion, c_tipo_actualizacion, d_tipo_actualizacion) VALUES (2, 'AD', 'Domicilio');
INSERT INTO tipo_actualizacion (id_tipo_actualizacion, c_tipo_actualizacion, d_tipo_actualizacion) VALUES (3, 'AV', 'VÃ­nculo Previsional');
INSERT INTO tipo_actualizacion (id_tipo_actualizacion, c_tipo_actualizacion, d_tipo_actualizacion) VALUES (4, 'AEB', 'Estado Beneficiario');
INSERT INTO tipo_actualizacion (id_tipo_actualizacion, c_tipo_actualizacion, d_tipo_actualizacion) VALUES (5, 'AB', 'Beneficiario');
INSERT INTO tipo_actualizacion (id_tipo_actualizacion, c_tipo_actualizacion, d_tipo_actualizacion) VALUES (6, 'AP', 'IdentificaciÃ³n Persona');
INSERT INTO tipo_actualizacion (id_tipo_actualizacion, c_tipo_actualizacion, d_tipo_actualizacion) VALUES (7, 'A', 'Alta');
INSERT INTO tipo_actualizacion (id_tipo_actualizacion, c_tipo_actualizacion, d_tipo_actualizacion) VALUES (8, 'M', 'ModificaciÃ³n');


--
-- Data for Name: tipo_documento; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO tipo_documento (id_tipo_documento, c_tipo_documento, d_tipo_documento, gestor_obligatorio, pagador_obligatorio, id_pais) VALUES (1, 'DNI', 'Documento Unico', true, true, 1);
INSERT INTO tipo_documento (id_tipo_documento, c_tipo_documento, d_tipo_documento, gestor_obligatorio, pagador_obligatorio, id_pais) VALUES (2, 'CUIL', 'Clave Unica Identificacion Laboral', false, false, 1);
INSERT INTO tipo_documento (id_tipo_documento, c_tipo_documento, d_tipo_documento, gestor_obligatorio, pagador_obligatorio, id_pais) VALUES (3, 'CP', 'Cedula Paraguay', false, false, 3);
INSERT INTO tipo_documento (id_tipo_documento, c_tipo_documento, d_tipo_documento, gestor_obligatorio, pagador_obligatorio, id_pais) VALUES (4, 'CI', 'Cedula Uruguay', false, false, 4);
INSERT INTO tipo_documento (id_tipo_documento, c_tipo_documento, d_tipo_documento, gestor_obligatorio, pagador_obligatorio, id_pais) VALUES (5, 'CPF', 'Catastro Persona Fisica', false, true, 2);
INSERT INTO tipo_documento (id_tipo_documento, c_tipo_documento, d_tipo_documento, gestor_obligatorio, pagador_obligatorio, id_pais) VALUES (6, 'DOC', 'Documento', false, false, 2);


--
-- Data for Name: tipo_envio; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO tipo_envio (id_tipo_envio, c_tipo_envio, d_tipo_envio) VALUES (1, 'EnvÃ­o Inicial', 'EnvÃ­o Inicial');
INSERT INTO tipo_envio (id_tipo_envio, c_tipo_envio, d_tipo_envio) VALUES (2, 'EnvÃ­o Auxiliar', 'EnvÃ­o Auxiliar');


--
-- Data for Name: tipo_informacion; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO tipo_informacion (id_tipo_informacion, c_tipo_informacion, d_tipo_informacion) VALUES (1, 'Empadronamiento', 'Empadronamiento');
INSERT INTO tipo_informacion (id_tipo_informacion, c_tipo_informacion, d_tipo_informacion) VALUES (2, 'Transferencia Bancaria', 'Transferencia Bancaria');
INSERT INTO tipo_informacion (id_tipo_informacion, c_tipo_informacion, d_tipo_informacion) VALUES (3, 'Archivo de LiquidaciÃ³n', 'Archivo de LiquidaciÃ³n');
INSERT INTO tipo_informacion (id_tipo_informacion, c_tipo_informacion, d_tipo_informacion) VALUES (4, 'Archivo de RendiciÃ³n', 'Archivo de RendiciÃ³n');
INSERT INTO tipo_informacion (id_tipo_informacion, c_tipo_informacion, d_tipo_informacion) VALUES (5, 'Reclamos', 'Reclamos');
INSERT INTO tipo_informacion (id_tipo_informacion, c_tipo_informacion, d_tipo_informacion) VALUES (6, 'Error empadronamiento', 'Error empadronamiento');
INSERT INTO tipo_informacion (id_tipo_informacion, c_tipo_informacion, d_tipo_informacion) VALUES (7, 'Error archivo de LiquidaciÃ³n', 'Error archivo de LiquidaciÃ³n');
INSERT INTO tipo_informacion (id_tipo_informacion, c_tipo_informacion, d_tipo_informacion) VALUES (8, 'Error archivo de RendiciÃ³n', 'Error archivo de RendiciÃ³n');


--
-- Data for Name: tipo_motivo; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO tipo_motivo (id_tipo_motivo, c_tipo_motivo, d_tipo_motivo) VALUES (1, 'ID', 'No es posible identificar a la persona');
INSERT INTO tipo_motivo (id_tipo_motivo, c_tipo_motivo, d_tipo_motivo) VALUES (2, 'BV', 'La persona no tiene beneficios vigentes');
INSERT INTO tipo_motivo (id_tipo_motivo, c_tipo_motivo, d_tipo_motivo) VALUES (0, 'OT', 'Otro');


--
-- Data for Name: tipo_prestacion; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO tipo_prestacion (id_tipo_prestacion, c_tipo_prestacion, d_tipo_prestacion) VALUES (1, 'J', 'JUBILACIÃ“N');
INSERT INTO tipo_prestacion (id_tipo_prestacion, c_tipo_prestacion, d_tipo_prestacion) VALUES (2, 'P', 'PENSIÃ“N');


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--

INSERT INTO usuario (id, apellido, correo_electronico, nombre, password, nombre_usuario, id_pais_origen, id_rol, password_plain) VALUES (1, '', 'admin@admin', 'Administrador', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin', 1, 1, 'admin');
INSERT INTO usuario (id, apellido, correo_electronico, nombre, password, nombre_usuario, id_pais_origen, id_rol, password_plain) VALUES (2, '', 'pagador@pagador', 'Pagador', 'c7078675aad3b97beb88cdf4ffc0ef3546cd1fa8', 'pagador', 1, 2, 'pagador');


--
-- Data for Name: vinculo_previsional; Type: TABLE DATA; Schema: siacilocal; Owner: postgres
--


--
-- Name: beneficiario_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY beneficiario
    ADD CONSTRAINT beneficiario_pkey PRIMARY KEY (id_beneficiario);


--
-- Name: beneficiarioprocess_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY beneficiarioprocess
    ADD CONSTRAINT beneficiarioprocess_pkey PRIMARY KEY (id);


--
-- Name: beneficio_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY beneficio
    ADD CONSTRAINT beneficio_pkey PRIMARY KEY (id_beneficio);


--
-- Name: configuracion_servidor_pais_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuracion_servidor_pais
    ADD CONSTRAINT configuracion_servidor_pais_pkey PRIMARY KEY (id_servidor_pais);


--
-- Name: configuraciones_sistema_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuraciones_sistema
    ADD CONSTRAINT configuraciones_sistema_pkey PRIMARY KEY (propiedad);


--
-- Name: datos_pais_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY datos_pais
    ADD CONSTRAINT datos_pais_pkey PRIMARY KEY (id_datos_pais);


--
-- Name: domicilio_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY domicilio
    ADD CONSTRAINT domicilio_pkey PRIMARY KEY (id_domicilio);


--
-- Name: emp_estado_seguimiento_domicilio_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY emp_estado_seguimiento_domicilio
    ADD CONSTRAINT emp_estado_seguimiento_domicilio_pkey PRIMARY KEY (id_estado_domicilio);


--
-- Name: emp_estado_seguimiento_empadronamiento_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY emp_estado_seguimiento_empadronamiento
    ADD CONSTRAINT emp_estado_seguimiento_empadronamiento_pkey PRIMARY KEY (id_estado_emp);


--
-- Name: emp_estado_seguimiento_vinculo_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY emp_estado_seguimiento_vinculo
    ADD CONSTRAINT emp_estado_seguimiento_vinculo_pkey PRIMARY KEY (id_estado_vinculo);


--
-- Name: emp_seguimiento_domicilio_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY emp_seguimiento_domicilio
    ADD CONSTRAINT emp_seguimiento_domicilio_pkey PRIMARY KEY (id_seguimiento_domicilio);


--
-- Name: emp_seguimiento_empadronamiento_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY emp_seguimiento_empadronamiento
    ADD CONSTRAINT emp_seguimiento_empadronamiento_pkey PRIMARY KEY (id_seguimiento_emp);


--
-- Name: emp_seguimiento_vinculo_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY emp_seguimiento_vinculo
    ADD CONSTRAINT emp_seguimiento_vinculo_pkey PRIMARY KEY (id_seguimiento_vinculo);


--
-- Name: envio_modificacion_pendiente_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY envio_modificacion_pendiente
    ADD CONSTRAINT envio_modificacion_pendiente_pkey PRIMARY KEY (id);


--
-- Name: estado_beneficiario_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado_beneficiario
    ADD CONSTRAINT estado_beneficiario_pkey PRIMARY KEY (id_estado_beneficiario);


--
-- Name: estado_beneficio_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado_beneficio
    ADD CONSTRAINT estado_beneficio_pkey PRIMARY KEY (id_estado_beneficio);


--
-- Name: estado_civil_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado_civil
    ADD CONSTRAINT estado_civil_pkey PRIMARY KEY (id_estado_civil);


--
-- Name: historico_actualizacion_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY historico_actualizacion
    ADD CONSTRAINT historico_actualizacion_pkey PRIMARY KEY (id_historico_actualizacion);


--
-- Name: identificacion_persona_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY identificacion_persona
    ADD CONSTRAINT identificacion_persona_pkey PRIMARY KEY (id_identificacion_persona);


--
-- Name: idioma_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY idioma
    ADD CONSTRAINT idioma_pkey PRIMARY KEY (id);


--
-- Name: liq_estado_despacho_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY liq_estado_despacho
    ADD CONSTRAINT liq_estado_despacho_pkey PRIMARY KEY (id_estado_despacho);


--
-- Name: liq_estado_rendicion_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY liq_estado_rendicion
    ADD CONSTRAINT liq_estado_rendicion_pkey PRIMARY KEY (id_estado_rendicion);


--
-- Name: liq_liquidacion_local_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY liq_liquidacion_local
    ADD CONSTRAINT liq_liquidacion_local_pkey PRIMARY KEY (id_liquidacion_local);


--
-- Name: liq_moneda_cambio_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY liq_moneda_cambio
    ADD CONSTRAINT liq_moneda_cambio_pkey PRIMARY KEY (id_moneda_cambio);


--
-- Name: liq_moneda_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY liq_moneda
    ADD CONSTRAINT liq_moneda_pkey PRIMARY KEY (id_moneda);


--
-- Name: liq_oiss_log_recepcion_liq_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY liq_oiss_log_recepcion_liq
    ADD CONSTRAINT liq_oiss_log_recepcion_liq_pkey PRIMARY KEY (id_liq_oiss_log_recepcion_liq);


--
-- Name: liq_oiss_log_transaccional_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY liq_oiss_log_transaccional
    ADD CONSTRAINT liq_oiss_log_transaccional_pkey PRIMARY KEY (id_liq_oiss_log_transaccional);


--
-- Name: liq_seguimiento_liquidacion_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY liq_seguimiento_liquidacion
    ADD CONSTRAINT liq_seguimiento_liquidacion_pkey PRIMARY KEY (id_seguimiento_liquidacion);


--
-- Name: liq_seguimiento_rendicion_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY liq_seguimiento_rendicion
    ADD CONSTRAINT liq_seguimiento_rendicion_pkey PRIMARY KEY (id_seguimiento_rendicion);


--
-- Name: log_envio_pendientes_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY log_envio_pendientes
    ADD CONSTRAINT log_envio_pendientes_pkey PRIMARY KEY (id);


--
-- Name: nacionalidad_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nacionalidad
    ADD CONSTRAINT nacionalidad_pkey PRIMARY KEY (id);


--
-- Name: pais_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id_pais);


--
-- Name: pk_estado; Type: CONSTRAINT; Schema: siacilocal; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT pk_estado PRIMARY KEY (id_estado);


--
-- Name: prestacion_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY prestacion
    ADD CONSTRAINT prestacion_pkey PRIMARY KEY (id_prestacion);


--
-- Name: rol_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);


--
-- Name: sexo_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sexo
    ADD CONSTRAINT sexo_pkey PRIMARY KEY (codigo);


--
-- Name: tipo_actualizacion_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_actualizacion
    ADD CONSTRAINT tipo_actualizacion_pkey PRIMARY KEY (id_tipo_actualizacion);


--
-- Name: tipo_documento_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_documento
    ADD CONSTRAINT tipo_documento_pkey PRIMARY KEY (id_tipo_documento);


--
-- Name: tipo_envio_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_envio
    ADD CONSTRAINT tipo_envio_pkey PRIMARY KEY (id_tipo_envio);


--
-- Name: tipo_informacion_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_informacion
    ADD CONSTRAINT tipo_informacion_pkey PRIMARY KEY (id_tipo_informacion);


--
-- Name: tipo_motivo_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_motivo
    ADD CONSTRAINT tipo_motivo_pkey PRIMARY KEY (id_tipo_motivo);


--
-- Name: tipo_prestacion_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_prestacion
    ADD CONSTRAINT tipo_prestacion_pkey PRIMARY KEY (id_tipo_prestacion);


--
-- Name: uk_1kgxar2gg525ty0kac2q1t1xe; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY envio_modificacion_pendiente
    ADD CONSTRAINT uk_1kgxar2gg525ty0kac2q1t1xe UNIQUE (id_beneficiario, id_pais);


--
-- Name: uk_1wijm9i1obrjnk1nc7i05tysl; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT uk_1wijm9i1obrjnk1nc7i05tysl UNIQUE (nombre_usuario, id_pais_origen);


--
-- Name: uk_5jmij65b2cn74kbxvi6wheb3r; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado_civil
    ADD CONSTRAINT uk_5jmij65b2cn74kbxvi6wheb3r UNIQUE (c_estado_civil);


--
-- Name: uk_ayivvwkynkfwp7nykfks85ahx; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY idioma
    ADD CONSTRAINT uk_ayivvwkynkfwp7nykfks85ahx UNIQUE (codigo);


--
-- Name: uk_b2584avhd8y8vkb3dbkqeq3q3; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT uk_b2584avhd8y8vkb3dbkqeq3q3 UNIQUE (c_rol);


--
-- Name: uk_cb0asqhr2brcrjowv8djqgv8y; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY liq_estado_despacho
    ADD CONSTRAINT uk_cb0asqhr2brcrjowv8djqgv8y UNIQUE (c_estado_despacho);


--
-- Name: uk_djn0dk3rd6qyyhgxxqyl7wu44; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY beneficio
    ADD CONSTRAINT uk_djn0dk3rd6qyyhgxxqyl7wu44 UNIQUE (id_pais_pagador, numero_beneficio);


--
-- Name: uk_dqabwdsrdarg6mt5vrh4xlwnq; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY domicilio
    ADD CONSTRAINT uk_dqabwdsrdarg6mt5vrh4xlwnq UNIQUE (id_beneficiario);


--
-- Name: uk_fiuonkn0ybtto0a2y9hyf0w2h; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuracion_servidor_pais
    ADD CONSTRAINT uk_fiuonkn0ybtto0a2y9hyf0w2h UNIQUE (id_pais);


--
-- Name: uk_i5pkxii8rr6ahusq2g7isfc92; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_actualizacion
    ADD CONSTRAINT uk_i5pkxii8rr6ahusq2g7isfc92 UNIQUE (c_tipo_actualizacion);


--
-- Name: uk_jvvovkllgqxwfj19yyvsfjapx; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_documento
    ADD CONSTRAINT uk_jvvovkllgqxwfj19yyvsfjapx UNIQUE (c_tipo_documento);


--
-- Name: uk_kt0m087jkfpk4fx9ku7eoq0p5; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_motivo
    ADD CONSTRAINT uk_kt0m087jkfpk4fx9ku7eoq0p5 UNIQUE (c_tipo_motivo);


--
-- Name: uk_kxpcn3qdvg91ekkjthnwib5up; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT uk_kxpcn3qdvg91ekkjthnwib5up UNIQUE (c_pais);


--
-- Name: uk_nkijq0c7vbkv0w77icbtnfw3p; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY prestacion
    ADD CONSTRAINT uk_nkijq0c7vbkv0w77icbtnfw3p UNIQUE (c_prestacion);


--
-- Name: uk_nqhmc2r6jixul1mjg2xqcitd4; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY emp_estado_seguimiento_empadronamiento
    ADD CONSTRAINT uk_nqhmc2r6jixul1mjg2xqcitd4 UNIQUE (c_estado_emp);


--
-- Name: uk_od5rmmm9ndaku9qr6em4hx5o1; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY liq_estado_rendicion
    ADD CONSTRAINT uk_od5rmmm9ndaku9qr6em4hx5o1 UNIQUE (c_estado_rendicion);


--
-- Name: uk_otmrlw158cnkx0vufyvvuhk33; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado_beneficiario
    ADD CONSTRAINT uk_otmrlw158cnkx0vufyvvuhk33 UNIQUE (c_estado_beneficiario);


--
-- Name: uk_pyv3aihtq3g4gag7nl9f7yt2s; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado_beneficio
    ADD CONSTRAINT uk_pyv3aihtq3g4gag7nl9f7yt2s UNIQUE (c_estado_beneficio);


--
-- Name: uk_qef7hn1h8am7lpq2giprchdl6; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT uk_qef7hn1h8am7lpq2giprchdl6 UNIQUE (d_pais);


--
-- Name: uk_r2m98il2gn17genefwy36fs5e; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY datos_pais
    ADD CONSTRAINT uk_r2m98il2gn17genefwy36fs5e UNIQUE (id_pais);


--
-- Name: uk_t4o96u4lxc9i9whyg0m5c8x8k; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY emp_estado_seguimiento_domicilio
    ADD CONSTRAINT uk_t4o96u4lxc9i9whyg0m5c8x8k UNIQUE (c_estado_domicilio);


--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: vinculo_previsional_pkey; Type: CONSTRAINT; Schema: siacilocal; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vinculo_previsional
    ADD CONSTRAINT vinculo_previsional_pkey PRIMARY KEY (id_vinculo_previsional);


--
-- Name: fk_1lievqs0bvi4axur1lpfa7fmr; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY emp_seguimiento_empadronamiento
    ADD CONSTRAINT fk_1lievqs0bvi4axur1lpfa7fmr FOREIGN KEY (id_estado_emp) REFERENCES emp_estado_seguimiento_empadronamiento(id_estado_emp);


--
-- Name: fk_1qwmagbwg8c4ahimnim5ykx4x; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY liq_seguimiento_liquidacion
    ADD CONSTRAINT fk_1qwmagbwg8c4ahimnim5ykx4x FOREIGN KEY (id_pais_remitente) REFERENCES pais(id_pais);


--
-- Name: fk_1rloam2tx9nqdexnhm4xt6irc; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY beneficio
    ADD CONSTRAINT fk_1rloam2tx9nqdexnhm4xt6irc FOREIGN KEY (id_prestacion) REFERENCES prestacion(id_prestacion);


--
-- Name: fk_1snnw9ydto8vft7q69qxi2ws4; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY liq_liquidacion_local
    ADD CONSTRAINT fk_1snnw9ydto8vft7q69qxi2ws4 FOREIGN KEY (id_tipo_prestacion) REFERENCES tipo_prestacion(id_tipo_prestacion);


--
-- Name: fk_2r6giowlv8sest2tlsj54bb7u; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY liq_liquidacion_local
    ADD CONSTRAINT fk_2r6giowlv8sest2tlsj54bb7u FOREIGN KEY (id_pais_gestor) REFERENCES pais(id_pais);


--
-- Name: fk_343p6divxaxwjrotlmwlxletl; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY beneficiario
    ADD CONSTRAINT fk_343p6divxaxwjrotlmwlxletl FOREIGN KEY (id_nacionalidad) REFERENCES nacionalidad(id);


--
-- Name: fk_41aiju6dr598oux27xqv6n6na; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY emp_seguimiento_vinculo
    ADD CONSTRAINT fk_41aiju6dr598oux27xqv6n6na FOREIGN KEY (id_vinculo_previsional) REFERENCES vinculo_previsional(id_vinculo_previsional);


--
-- Name: fk_4luxerxukcualuv0euxaljwec; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY liq_seguimiento_liquidacion
    ADD CONSTRAINT fk_4luxerxukcualuv0euxaljwec FOREIGN KEY (id_moneda_pagador) REFERENCES liq_moneda(id_moneda);


--
-- Name: fk_52mq73fexidwp4v7tdtqkcddk; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY liq_liquidacion_local
    ADD CONSTRAINT fk_52mq73fexidwp4v7tdtqkcddk FOREIGN KEY (id_pais_pagador) REFERENCES pais(id_pais);


--
-- Name: fk_56gb5u5d47pfmyplh8md5hyvp; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY vinculo_previsional
    ADD CONSTRAINT fk_56gb5u5d47pfmyplh8md5hyvp FOREIGN KEY (id_tipo_motivo) REFERENCES tipo_motivo(id_tipo_motivo);


--
-- Name: fk_5kcn6kqb6hufau856ojbrrpd5; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY historico_actualizacion
    ADD CONSTRAINT fk_5kcn6kqb6hufau856ojbrrpd5 FOREIGN KEY (id_tipo_actualizacion) REFERENCES tipo_actualizacion(id_tipo_actualizacion);


--
-- Name: fk_689v56smbc11q90j02mwb5sov; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY beneficiario
    ADD CONSTRAINT fk_689v56smbc11q90j02mwb5sov FOREIGN KEY (id_estado_beneficiario) REFERENCES estado_beneficiario(id_estado_beneficiario);


--
-- Name: fk_6l2ruayrj57gmu6tfgulqfk9v; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY emp_seguimiento_empadronamiento
    ADD CONSTRAINT fk_6l2ruayrj57gmu6tfgulqfk9v FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: fk_78vat62duwc820vlq50vsdq11; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY beneficiario
    ADD CONSTRAINT fk_78vat62duwc820vlq50vsdq11 FOREIGN KEY (sexo) REFERENCES sexo(codigo);


--
-- Name: fk_8i3l8d6j0lysf0xtykavef491; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY emp_seguimiento_domicilio
    ADD CONSTRAINT fk_8i3l8d6j0lysf0xtykavef491 FOREIGN KEY (id_domicilio) REFERENCES domicilio(id_domicilio);


--
-- Name: fk_8qmjljereb45y9duv1f3j699i; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY vinculo_previsional
    ADD CONSTRAINT fk_8qmjljereb45y9duv1f3j699i FOREIGN KEY (id_pais_gestor) REFERENCES pais(id_pais);


--
-- Name: fk_978appuem3opuwc9t6yykfn45; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY nacionalidad
    ADD CONSTRAINT fk_978appuem3opuwc9t6yykfn45 FOREIGN KEY (id_pais) REFERENCES pais(id_pais);


--
-- Name: fk_97qm1lepdn8y4m6ai0a9flhkg; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY liq_seguimiento_rendicion
    ADD CONSTRAINT fk_97qm1lepdn8y4m6ai0a9flhkg FOREIGN KEY (id_pais_remitente) REFERENCES pais(id_pais);


--
-- Name: fk_bmp3rp66ervxoksrbiaxdscqh; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY envio_modificacion_pendiente
    ADD CONSTRAINT fk_bmp3rp66ervxoksrbiaxdscqh FOREIGN KEY (id_pais) REFERENCES pais(id_pais);


--
-- Name: fk_br43tncak9h491keah1sed553; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY emp_seguimiento_vinculo
    ADD CONSTRAINT fk_br43tncak9h491keah1sed553 FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: fk_c5g2nd8frdjce6s2p7fywpwxt; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY liq_liquidacion_local
    ADD CONSTRAINT fk_c5g2nd8frdjce6s2p7fywpwxt FOREIGN KEY (id_seguimiento_rendicion) REFERENCES liq_seguimiento_rendicion(id_seguimiento_rendicion);


--
-- Name: fk_c6wogjrast66bo08eynl07usw; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY vinculo_previsional
    ADD CONSTRAINT fk_c6wogjrast66bo08eynl07usw FOREIGN KEY (id_estado_beneficio) REFERENCES estado_beneficio(id_estado_beneficio);


--
-- Name: fk_c9qlbunaxo52bpnpmw9fl0wfj; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY beneficio
    ADD CONSTRAINT fk_c9qlbunaxo52bpnpmw9fl0wfj FOREIGN KEY (id_beneficiario) REFERENCES beneficiario(id_beneficiario);


--
-- Name: fk_cahdrs0uj47yb0enmh5whmb0u; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY liq_seguimiento_rendicion
    ADD CONSTRAINT fk_cahdrs0uj47yb0enmh5whmb0u FOREIGN KEY (id_pais_destino) REFERENCES pais(id_pais);


--
-- Name: fk_ci3bn92t56smoukm7numl1amw; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY liq_moneda_cambio
    ADD CONSTRAINT fk_ci3bn92t56smoukm7numl1amw FOREIGN KEY (id_moneda_origen) REFERENCES liq_moneda(id_moneda);


--
-- Name: fk_cjvagmm5kpfw6xppf5c35d81l; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY liq_seguimiento_liquidacion
    ADD CONSTRAINT fk_cjvagmm5kpfw6xppf5c35d81l FOREIGN KEY (id_moneda_gestor) REFERENCES liq_moneda(id_moneda);


--
-- Name: fk_clr6wo29pks1rnx8skx04o4cw; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY liq_moneda_cambio
    ADD CONSTRAINT fk_clr6wo29pks1rnx8skx04o4cw FOREIGN KEY (id_moneda_destino) REFERENCES liq_moneda(id_moneda);


--
-- Name: fk_d4m74h4ck3trrqfmkg4hpjn3j; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_d4m74h4ck3trrqfmkg4hpjn3j FOREIGN KEY (id_pais_origen) REFERENCES pais(id_pais);


--
-- Name: fk_d7biltqgcpucf5ej5u921txlt; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY emp_estado_seguimiento_vinculo
    ADD CONSTRAINT fk_d7biltqgcpucf5ej5u921txlt FOREIGN KEY (id_estado_vinculo_siguiente) REFERENCES emp_estado_seguimiento_vinculo(id_estado_vinculo);


--
-- Name: fk_da3cflcxkhgxvxv6reoeke6j4; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY beneficio
    ADD CONSTRAINT fk_da3cflcxkhgxvxv6reoeke6j4 FOREIGN KEY (id_pais_pagador) REFERENCES pais(id_pais);


--
-- Name: fk_dd4ojg7sudpewmhs7ddltcyfx; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY beneficiario
    ADD CONSTRAINT fk_dd4ojg7sudpewmhs7ddltcyfx FOREIGN KEY (id_pais_residencia) REFERENCES pais(id_pais);


--
-- Name: fk_dqabwdsrdarg6mt5vrh4xlwnq; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY domicilio
    ADD CONSTRAINT fk_dqabwdsrdarg6mt5vrh4xlwnq FOREIGN KEY (id_beneficiario) REFERENCES beneficiario(id_beneficiario);


--
-- Name: fk_drv6pvyqq3r6x9unqyrk1prcm; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY historico_actualizacion
    ADD CONSTRAINT fk_drv6pvyqq3r6x9unqyrk1prcm FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: fk_e3gb1a59s9l9g0f3mncnxq86a; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY vinculo_previsional
    ADD CONSTRAINT fk_e3gb1a59s9l9g0f3mncnxq86a FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: fk_ea8mev0x03nhmsi2n3nnf2jlv; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY domicilio
    ADD CONSTRAINT fk_ea8mev0x03nhmsi2n3nnf2jlv FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: fk_epv8hh713nbqfrtfkoxisywqu; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY identificacion_persona
    ADD CONSTRAINT fk_epv8hh713nbqfrtfkoxisywqu FOREIGN KEY (id_tipo_documento) REFERENCES tipo_documento(id_tipo_documento);


--
-- Name: fk_fcl0agauc7cr92stgm4ho8keh; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY tipo_documento
    ADD CONSTRAINT fk_fcl0agauc7cr92stgm4ho8keh FOREIGN KEY (id_pais) REFERENCES pais(id_pais);


--
-- Name: fk_fgc015i1vgeig6c7t8xs8clmn; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY liq_seguimiento_liquidacion
    ADD CONSTRAINT fk_fgc015i1vgeig6c7t8xs8clmn FOREIGN KEY (id_pais_destino) REFERENCES pais(id_pais);


--
-- Name: fk_fiuonkn0ybtto0a2y9hyf0w2h; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY configuracion_servidor_pais
    ADD CONSTRAINT fk_fiuonkn0ybtto0a2y9hyf0w2h FOREIGN KEY (id_pais) REFERENCES pais(id_pais);


--
-- Name: fk_fjn17nyg94qyjgwsrkugvha6t; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY emp_seguimiento_domicilio
    ADD CONSTRAINT fk_fjn17nyg94qyjgwsrkugvha6t FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: fk_g6vurkxoobb6njchi2wbi6k7b; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY liq_seguimiento_rendicion
    ADD CONSTRAINT fk_g6vurkxoobb6njchi2wbi6k7b FOREIGN KEY (id_estado_rendicion) REFERENCES liq_estado_rendicion(id_estado_rendicion);


--
-- Name: fk_gdfsnq9xv927lg9ytqf3ajhp3; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY beneficiario
    ADD CONSTRAINT fk_gdfsnq9xv927lg9ytqf3ajhp3 FOREIGN KEY (id_estado_civil) REFERENCES estado_civil(id_estado_civil);


--
-- Name: fk_glrh9pfwhgx38rb5c42tlu7fo; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY emp_seguimiento_vinculo
    ADD CONSTRAINT fk_glrh9pfwhgx38rb5c42tlu7fo FOREIGN KEY (id_estado_vinculo) REFERENCES emp_estado_seguimiento_vinculo(id_estado_vinculo);


--
-- Name: fk_gwum1qr39eumx3jhhs3j77a8w; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY historico_actualizacion
    ADD CONSTRAINT fk_gwum1qr39eumx3jhhs3j77a8w FOREIGN KEY (id_beneficiario) REFERENCES beneficiario(id_beneficiario);


--
-- Name: fk_h1satx58ts7x0w2tb9gnib93u; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY beneficiario
    ADD CONSTRAINT fk_h1satx58ts7x0w2tb9gnib93u FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: fk_hcnkisorek0o4jid3iwnqdj1c; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY emp_seguimiento_empadronamiento
    ADD CONSTRAINT fk_hcnkisorek0o4jid3iwnqdj1c FOREIGN KEY (id_beneficiario) REFERENCES beneficiario(id_beneficiario);


--
-- Name: fk_hp2ebh1n9g1v980l1u40vst51; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_hp2ebh1n9g1v980l1u40vst51 FOREIGN KEY (id_rol) REFERENCES rol(id_rol);


--
-- Name: fk_ie0x4rn3iu5g82awwysvg4p0e; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY emp_estado_seguimiento_empadronamiento
    ADD CONSTRAINT fk_ie0x4rn3iu5g82awwysvg4p0e FOREIGN KEY (id_estado_emp_siguiente) REFERENCES emp_estado_seguimiento_empadronamiento(id_estado_emp);


--
-- Name: fk_jgm2usj6eahwa04415ng0t7r1; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY identificacion_persona
    ADD CONSTRAINT fk_jgm2usj6eahwa04415ng0t7r1 FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: fk_kabrj51lq87n1lril3ktilehp; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY historico_actualizacion
    ADD CONSTRAINT fk_kabrj51lq87n1lril3ktilehp FOREIGN KEY (id_rol) REFERENCES rol(id_rol);


--
-- Name: fk_khfc3g3ynrl4ahu0b0pafx9ql; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY liq_seguimiento_liquidacion
    ADD CONSTRAINT fk_khfc3g3ynrl4ahu0b0pafx9ql FOREIGN KEY (id_estado_despacho) REFERENCES liq_estado_despacho(id_estado_despacho);


--
-- Name: fk_ktv4bwskwqiuoy258nm7ebdaj; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY datos_pais
    ADD CONSTRAINT fk_ktv4bwskwqiuoy258nm7ebdaj FOREIGN KEY (id_moneda_transferencia) REFERENCES liq_moneda(id_moneda);


--
-- Name: fk_kyehfnxt4q9h2lxbwoofnkjxn; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY emp_estado_seguimiento_domicilio
    ADD CONSTRAINT fk_kyehfnxt4q9h2lxbwoofnkjxn FOREIGN KEY (id_estado_siguiente) REFERENCES emp_estado_seguimiento_domicilio(id_estado_domicilio);


--
-- Name: fk_lp7h2yc94ndw6fw0qdvorgchd; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY liq_moneda
    ADD CONSTRAINT fk_lp7h2yc94ndw6fw0qdvorgchd FOREIGN KEY (id_pais) REFERENCES pais(id_pais);


--
-- Name: fk_mw154ibk787aqaqkg2cf1iuun; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY liq_oiss_log_transaccional
    ADD CONSTRAINT fk_mw154ibk787aqaqkg2cf1iuun FOREIGN KEY (id_estado_transmision) REFERENCES liq_estado_despacho(id_estado_despacho);


--
-- Name: fk_nkhjoef0cfomv53g40a07sulk; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY historico_actualizacion
    ADD CONSTRAINT fk_nkhjoef0cfomv53g40a07sulk FOREIGN KEY (id_pais) REFERENCES pais(id_pais);


--
-- Name: fk_pqapujymlv36vsga6wfi7iylq; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY envio_modificacion_pendiente
    ADD CONSTRAINT fk_pqapujymlv36vsga6wfi7iylq FOREIGN KEY (id_beneficiario) REFERENCES beneficiario(id_beneficiario);


--
-- Name: fk_pww68ntqdip2b9rwgjjgi4hg0; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY domicilio
    ADD CONSTRAINT fk_pww68ntqdip2b9rwgjjgi4hg0 FOREIGN KEY (id_pais) REFERENCES pais(id_pais);


--
-- Name: fk_qk324m17i4dcd8ywmadkh41t4; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY beneficio
    ADD CONSTRAINT fk_qk324m17i4dcd8ywmadkh41t4 FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: fk_r2m98il2gn17genefwy36fs5e; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY datos_pais
    ADD CONSTRAINT fk_r2m98il2gn17genefwy36fs5e FOREIGN KEY (id_pais) REFERENCES pais(id_pais);


--
-- Name: fk_rtaga9ktyg467wpvwfd5ndvfn; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY vinculo_previsional
    ADD CONSTRAINT fk_rtaga9ktyg467wpvwfd5ndvfn FOREIGN KEY (id_pais_pagador) REFERENCES pais(id_pais);


--
-- Name: fk_rvemubsknx3vw60xmla5xskqv; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY emp_seguimiento_domicilio
    ADD CONSTRAINT fk_rvemubsknx3vw60xmla5xskqv FOREIGN KEY (id_estado_domicilio) REFERENCES emp_estado_seguimiento_domicilio(id_estado_domicilio);


--
-- Name: fk_sd8naey2gmhd2mbofb0y25utg; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY vinculo_previsional
    ADD CONSTRAINT fk_sd8naey2gmhd2mbofb0y25utg FOREIGN KEY (id_beneficiario) REFERENCES beneficiario(id_beneficiario);


--
-- Name: fk_ss2d9pkbc7tbcikpghyrlxbt5; Type: FK CONSTRAINT; Schema: siacilocal; Owner: postgres
--

ALTER TABLE ONLY identificacion_persona
    ADD CONSTRAINT fk_ss2d9pkbc7tbcikpghyrlxbt5 FOREIGN KEY (id_beneficiario) REFERENCES beneficiario(id_beneficiario);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: conf_busca_configuracion_servidor_pais(); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION conf_busca_configuracion_servidor_pais() FROM PUBLIC;
REVOKE ALL ON FUNCTION conf_busca_configuracion_servidor_pais() FROM admin;
GRANT ALL ON FUNCTION conf_busca_configuracion_servidor_pais() TO admin;
GRANT ALL ON FUNCTION conf_busca_configuracion_servidor_pais() TO PUBLIC;


--
-- Name: conf_busca_configuracion_servidor_pais(smallint); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION conf_busca_configuracion_servidor_pais(smallint) FROM PUBLIC;
REVOKE ALL ON FUNCTION conf_busca_configuracion_servidor_pais(smallint) FROM admin;
GRANT ALL ON FUNCTION conf_busca_configuracion_servidor_pais(smallint) TO admin;
GRANT ALL ON FUNCTION conf_busca_configuracion_servidor_pais(smallint) TO PUBLIC;


--
-- Name: conf_busca_datos_pais(); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION conf_busca_datos_pais() FROM PUBLIC;
REVOKE ALL ON FUNCTION conf_busca_datos_pais() FROM admin;
GRANT ALL ON FUNCTION conf_busca_datos_pais() TO admin;
GRANT ALL ON FUNCTION conf_busca_datos_pais() TO PUBLIC;


--
-- Name: liq_actualiza_archivo_seguimiento_liq(integer, text); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_actualiza_archivo_seguimiento_liq(idseg integer, archivo text) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_actualiza_archivo_seguimiento_liq(idseg integer, archivo text) FROM admin;
GRANT ALL ON FUNCTION liq_actualiza_archivo_seguimiento_liq(idseg integer, archivo text) TO admin;
GRANT ALL ON FUNCTION liq_actualiza_archivo_seguimiento_liq(idseg integer, archivo text) TO PUBLIC;


--
-- Name: liq_actualiza_oiss_log_recepcion_liq(typ_liq_oiss_log_recepcion_liq); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_actualiza_oiss_log_recepcion_liq(param typ_liq_oiss_log_recepcion_liq) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_actualiza_oiss_log_recepcion_liq(param typ_liq_oiss_log_recepcion_liq) FROM admin;
GRANT ALL ON FUNCTION liq_actualiza_oiss_log_recepcion_liq(param typ_liq_oiss_log_recepcion_liq) TO admin;
GRANT ALL ON FUNCTION liq_actualiza_oiss_log_recepcion_liq(param typ_liq_oiss_log_recepcion_liq) TO PUBLIC;


--
-- Name: liq_actualiza_oiss_log_transaccional(typ_liq_oiss_log_transaccional); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_actualiza_oiss_log_transaccional(param typ_liq_oiss_log_transaccional) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_actualiza_oiss_log_transaccional(param typ_liq_oiss_log_transaccional) FROM admin;
GRANT ALL ON FUNCTION liq_actualiza_oiss_log_transaccional(param typ_liq_oiss_log_transaccional) TO admin;
GRANT ALL ON FUNCTION liq_actualiza_oiss_log_transaccional(param typ_liq_oiss_log_transaccional) TO PUBLIC;


--
-- Name: liq_actualiza_seguimiento_liq(typ_liq_seguimiento_liquidacion); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_actualiza_seguimiento_liq(param typ_liq_seguimiento_liquidacion) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_actualiza_seguimiento_liq(param typ_liq_seguimiento_liquidacion) FROM admin;
GRANT ALL ON FUNCTION liq_actualiza_seguimiento_liq(param typ_liq_seguimiento_liquidacion) TO admin;
GRANT ALL ON FUNCTION liq_actualiza_seguimiento_liq(param typ_liq_seguimiento_liquidacion) TO PUBLIC;


--
-- Name: liq_actualiza_seguimiento_rendicion(typ_liq_seguimiento_rendicion); Type: ACL; Schema: siacilocal; Owner: postgres
--

REVOKE ALL ON FUNCTION liq_actualiza_seguimiento_rendicion(param typ_liq_seguimiento_rendicion) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_actualiza_seguimiento_rendicion(param typ_liq_seguimiento_rendicion) FROM postgres;
GRANT ALL ON FUNCTION liq_actualiza_seguimiento_rendicion(param typ_liq_seguimiento_rendicion) TO postgres;
GRANT ALL ON FUNCTION liq_actualiza_seguimiento_rendicion(param typ_liq_seguimiento_rendicion) TO PUBLIC;
GRANT ALL ON FUNCTION liq_actualiza_seguimiento_rendicion(param typ_liq_seguimiento_rendicion) TO admin;


--
-- Name: liq_actualizar_liquidacion(typ_liq_liquidacion); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_actualizar_liquidacion(param typ_liq_liquidacion) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_actualizar_liquidacion(param typ_liq_liquidacion) FROM admin;
GRANT ALL ON FUNCTION liq_actualizar_liquidacion(param typ_liq_liquidacion) TO admin;
GRANT ALL ON FUNCTION liq_actualizar_liquidacion(param typ_liq_liquidacion) TO PUBLIC;


--
-- Name: liq_actualizar_liquidacion_local(typ_liq_liquidacion_local_actu); Type: ACL; Schema: siacilocal; Owner: postgres
--

REVOKE ALL ON FUNCTION liq_actualizar_liquidacion_local(param typ_liq_liquidacion_local_actu) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_actualizar_liquidacion_local(param typ_liq_liquidacion_local_actu) FROM postgres;
GRANT ALL ON FUNCTION liq_actualizar_liquidacion_local(param typ_liq_liquidacion_local_actu) TO postgres;
GRANT ALL ON FUNCTION liq_actualizar_liquidacion_local(param typ_liq_liquidacion_local_actu) TO PUBLIC;
GRANT ALL ON FUNCTION liq_actualizar_liquidacion_local(param typ_liq_liquidacion_local_actu) TO admin;


--
-- Name: liq_alta_liquidacion_local(typ_liq_liquidacion_local); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_alta_liquidacion_local(param typ_liq_liquidacion_local) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_alta_liquidacion_local(param typ_liq_liquidacion_local) FROM admin;
GRANT ALL ON FUNCTION liq_alta_liquidacion_local(param typ_liq_liquidacion_local) TO admin;
GRANT ALL ON FUNCTION liq_alta_liquidacion_local(param typ_liq_liquidacion_local) TO PUBLIC;


--
-- Name: liq_alta_moneda_cambio(smallint, smallint); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_alta_moneda_cambio(idmonedaorigen smallint, idmonedadestino smallint) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_alta_moneda_cambio(idmonedaorigen smallint, idmonedadestino smallint) FROM admin;
GRANT ALL ON FUNCTION liq_alta_moneda_cambio(idmonedaorigen smallint, idmonedadestino smallint) TO admin;
GRANT ALL ON FUNCTION liq_alta_moneda_cambio(idmonedaorigen smallint, idmonedadestino smallint) TO PUBLIC;


--
-- Name: liq_alta_oiss_log_recepcion_liq(typ_liq_oiss_log_recepcion_liq); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_alta_oiss_log_recepcion_liq(param typ_liq_oiss_log_recepcion_liq) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_alta_oiss_log_recepcion_liq(param typ_liq_oiss_log_recepcion_liq) FROM admin;
GRANT ALL ON FUNCTION liq_alta_oiss_log_recepcion_liq(param typ_liq_oiss_log_recepcion_liq) TO admin;
GRANT ALL ON FUNCTION liq_alta_oiss_log_recepcion_liq(param typ_liq_oiss_log_recepcion_liq) TO PUBLIC;


--
-- Name: liq_alta_oiss_log_transaccional(typ_liq_oiss_log_transaccional); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_alta_oiss_log_transaccional(param typ_liq_oiss_log_transaccional) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_alta_oiss_log_transaccional(param typ_liq_oiss_log_transaccional) FROM admin;
GRANT ALL ON FUNCTION liq_alta_oiss_log_transaccional(param typ_liq_oiss_log_transaccional) TO admin;
GRANT ALL ON FUNCTION liq_alta_oiss_log_transaccional(param typ_liq_oiss_log_transaccional) TO PUBLIC;


--
-- Name: liq_alta_seguimiento_liq(typ_liq_seguimiento_liquidacion); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_alta_seguimiento_liq(param typ_liq_seguimiento_liquidacion) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_alta_seguimiento_liq(param typ_liq_seguimiento_liquidacion) FROM admin;
GRANT ALL ON FUNCTION liq_alta_seguimiento_liq(param typ_liq_seguimiento_liquidacion) TO admin;
GRANT ALL ON FUNCTION liq_alta_seguimiento_liq(param typ_liq_seguimiento_liquidacion) TO PUBLIC;


--
-- Name: liq_alta_seguimiento_liq(typ_liq_seguimiento_liquidacion, text); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_alta_seguimiento_liq(param typ_liq_seguimiento_liquidacion, archivo text) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_alta_seguimiento_liq(param typ_liq_seguimiento_liquidacion, archivo text) FROM admin;
GRANT ALL ON FUNCTION liq_alta_seguimiento_liq(param typ_liq_seguimiento_liquidacion, archivo text) TO admin;
GRANT ALL ON FUNCTION liq_alta_seguimiento_liq(param typ_liq_seguimiento_liquidacion, archivo text) TO PUBLIC;


--
-- Name: liq_alta_seguimiento_rendicion(typ_liq_seguimiento_rendicion); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_alta_seguimiento_rendicion(param typ_liq_seguimiento_rendicion) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_alta_seguimiento_rendicion(param typ_liq_seguimiento_rendicion) FROM admin;
GRANT ALL ON FUNCTION liq_alta_seguimiento_rendicion(param typ_liq_seguimiento_rendicion) TO admin;
GRANT ALL ON FUNCTION liq_alta_seguimiento_rendicion(param typ_liq_seguimiento_rendicion) TO PUBLIC;


--
-- Name: liq_alta_seguimiento_rendicion(typ_liq_seguimiento_rendicion, character varying); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_alta_seguimiento_rendicion(param typ_liq_seguimiento_rendicion, character varying) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_alta_seguimiento_rendicion(param typ_liq_seguimiento_rendicion, character varying) FROM admin;
GRANT ALL ON FUNCTION liq_alta_seguimiento_rendicion(param typ_liq_seguimiento_rendicion, character varying) TO admin;
GRANT ALL ON FUNCTION liq_alta_seguimiento_rendicion(param typ_liq_seguimiento_rendicion, character varying) TO PUBLIC;


--
-- Name: liq_buscar_datos_pais_xnombre(character varying); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_buscar_datos_pais_xnombre(character varying) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_buscar_datos_pais_xnombre(character varying) FROM admin;
GRANT ALL ON FUNCTION liq_buscar_datos_pais_xnombre(character varying) TO admin;
GRANT ALL ON FUNCTION liq_buscar_datos_pais_xnombre(character varying) TO PUBLIC;


--
-- Name: liq_buscar_estado(); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_buscar_estado() FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_buscar_estado() FROM admin;
GRANT ALL ON FUNCTION liq_buscar_estado() TO admin;
GRANT ALL ON FUNCTION liq_buscar_estado() TO PUBLIC;


--
-- Name: liq_buscar_tipo_informacion(); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_buscar_tipo_informacion() FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_buscar_tipo_informacion() FROM admin;
GRANT ALL ON FUNCTION liq_buscar_tipo_informacion() TO admin;
GRANT ALL ON FUNCTION liq_buscar_tipo_informacion() TO PUBLIC;


--
-- Name: liq_esta_cerrada(text, integer, integer); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_esta_cerrada(text, integer, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_esta_cerrada(text, integer, integer) FROM admin;
GRANT ALL ON FUNCTION liq_esta_cerrada(text, integer, integer) TO admin;
GRANT ALL ON FUNCTION liq_esta_cerrada(text, integer, integer) TO PUBLIC;


--
-- Name: liq_existe_liq_enviada(integer, integer, character varying); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_existe_liq_enviada(integer, integer, character varying) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_existe_liq_enviada(integer, integer, character varying) FROM admin;
GRANT ALL ON FUNCTION liq_existe_liq_enviada(integer, integer, character varying) TO admin;
GRANT ALL ON FUNCTION liq_existe_liq_enviada(integer, integer, character varying) TO PUBLIC;


--
-- Name: liq_grabar_archivo_rendicion(integer, text); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_grabar_archivo_rendicion(idseg integer, archivo text) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_grabar_archivo_rendicion(idseg integer, archivo text) FROM admin;
GRANT ALL ON FUNCTION liq_grabar_archivo_rendicion(idseg integer, archivo text) TO admin;
GRANT ALL ON FUNCTION liq_grabar_archivo_rendicion(idseg integer, archivo text) TO PUBLIC;


--
-- Name: liq_obtener_archivo_liquidacion(bigint); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_archivo_liquidacion(idseguimientoliquidacion bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_archivo_liquidacion(idseguimientoliquidacion bigint) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_archivo_liquidacion(idseguimientoliquidacion bigint) TO admin;
GRANT ALL ON FUNCTION liq_obtener_archivo_liquidacion(idseguimientoliquidacion bigint) TO PUBLIC;


--
-- Name: liq_obtener_liq_gestor(smallint, integer); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_liq_gestor(smallint, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_liq_gestor(smallint, integer) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_liq_gestor(smallint, integer) TO admin;
GRANT ALL ON FUNCTION liq_obtener_liq_gestor(smallint, integer) TO PUBLIC;


--
-- Name: liq_obtener_liq_no_cerradas(smallint); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_liq_no_cerradas(idpaisdestino smallint) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_liq_no_cerradas(idpaisdestino smallint) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_liq_no_cerradas(idpaisdestino smallint) TO admin;
GRANT ALL ON FUNCTION liq_obtener_liq_no_cerradas(idpaisdestino smallint) TO PUBLIC;


--
-- Name: liq_obtener_liq_pendientes_envio(smallint); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_liq_pendientes_envio(idpaisremitente smallint) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_liq_pendientes_envio(idpaisremitente smallint) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_liq_pendientes_envio(idpaisremitente smallint) TO admin;
GRANT ALL ON FUNCTION liq_obtener_liq_pendientes_envio(idpaisremitente smallint) TO PUBLIC;


--
-- Name: liq_obtener_liq_pendientes_recepcion(smallint); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_liq_pendientes_recepcion(idpaisdestino smallint) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_liq_pendientes_recepcion(idpaisdestino smallint) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_liq_pendientes_recepcion(idpaisdestino smallint) TO admin;
GRANT ALL ON FUNCTION liq_obtener_liq_pendientes_recepcion(idpaisdestino smallint) TO PUBLIC;


--
-- Name: liq_obtener_liquidacion_local_by_seguimiento_rendicion(bigint); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_liquidacion_local_by_seguimiento_rendicion(idseguimientoliquidacion bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_liquidacion_local_by_seguimiento_rendicion(idseguimientoliquidacion bigint) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_liquidacion_local_by_seguimiento_rendicion(idseguimientoliquidacion bigint) TO admin;
GRANT ALL ON FUNCTION liq_obtener_liquidacion_local_by_seguimiento_rendicion(idseguimientoliquidacion bigint) TO PUBLIC;


--
-- Name: liq_obtener_liquidaciones_locales(bigint); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_liquidaciones_locales(idseguimientoliquidacion bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_liquidaciones_locales(idseguimientoliquidacion bigint) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_liquidaciones_locales(idseguimientoliquidacion bigint) TO admin;
GRANT ALL ON FUNCTION liq_obtener_liquidaciones_locales(idseguimientoliquidacion bigint) TO PUBLIC;


--
-- Name: liq_obtener_maximo_numero_de_rendicion(integer, integer); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_maximo_numero_de_rendicion(integer, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_maximo_numero_de_rendicion(integer, integer) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_maximo_numero_de_rendicion(integer, integer) TO admin;
GRANT ALL ON FUNCTION liq_obtener_maximo_numero_de_rendicion(integer, integer) TO PUBLIC;


--
-- Name: liq_obtener_monedas(); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_monedas() FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_monedas() FROM admin;
GRANT ALL ON FUNCTION liq_obtener_monedas() TO admin;
GRANT ALL ON FUNCTION liq_obtener_monedas() TO PUBLIC;


--
-- Name: liq_obtener_monedas_cambio(); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_monedas_cambio() FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_monedas_cambio() FROM admin;
GRANT ALL ON FUNCTION liq_obtener_monedas_cambio() TO admin;
GRANT ALL ON FUNCTION liq_obtener_monedas_cambio() TO PUBLIC;


--
-- Name: liq_obtener_paises(); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_paises() FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_paises() FROM admin;
GRANT ALL ON FUNCTION liq_obtener_paises() TO admin;
GRANT ALL ON FUNCTION liq_obtener_paises() TO PUBLIC;


--
-- Name: liq_obtener_rendiciones_enviadas(smallint); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_rendiciones_enviadas(idpaisremitente smallint) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_rendiciones_enviadas(idpaisremitente smallint) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_rendiciones_enviadas(idpaisremitente smallint) TO admin;
GRANT ALL ON FUNCTION liq_obtener_rendiciones_enviadas(idpaisremitente smallint) TO PUBLIC;


--
-- Name: liq_obtener_rendiciones_por_estado(smallint, smallint); Type: ACL; Schema: siacilocal; Owner: postgres
--

REVOKE ALL ON FUNCTION liq_obtener_rendiciones_por_estado(idpaisdestino smallint, idestado smallint) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_rendiciones_por_estado(idpaisdestino smallint, idestado smallint) FROM postgres;
GRANT ALL ON FUNCTION liq_obtener_rendiciones_por_estado(idpaisdestino smallint, idestado smallint) TO postgres;
GRANT ALL ON FUNCTION liq_obtener_rendiciones_por_estado(idpaisdestino smallint, idestado smallint) TO PUBLIC;
GRANT ALL ON FUNCTION liq_obtener_rendiciones_por_estado(idpaisdestino smallint, idestado smallint) TO admin;


--
-- Name: liq_obtener_reporte_gestor(smallint, integer, integer); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_reporte_gestor(idpaisdestino smallint, pedesde integer, pehasta integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_reporte_gestor(idpaisdestino smallint, pedesde integer, pehasta integer) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_gestor(idpaisdestino smallint, pedesde integer, pehasta integer) TO admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_gestor(idpaisdestino smallint, pedesde integer, pehasta integer) TO PUBLIC;


--
-- Name: liq_obtener_reporte_gestor_rendicion(smallint); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_reporte_gestor_rendicion(idpais smallint) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_reporte_gestor_rendicion(idpais smallint) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_gestor_rendicion(idpais smallint) TO admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_gestor_rendicion(idpais smallint) TO PUBLIC;


--
-- Name: liq_obtener_reporte_gestor_segun_estado_rendicion(smallint, smallint); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_reporte_gestor_segun_estado_rendicion(idpais smallint, estado smallint) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_reporte_gestor_segun_estado_rendicion(idpais smallint, estado smallint) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_gestor_segun_estado_rendicion(idpais smallint, estado smallint) TO admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_gestor_segun_estado_rendicion(idpais smallint, estado smallint) TO PUBLIC;


--
-- Name: liq_obtener_reporte_gestor_segun_estado_rendicion(smallint, integer); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_reporte_gestor_segun_estado_rendicion(idpais smallint, estado integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_reporte_gestor_segun_estado_rendicion(idpais smallint, estado integer) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_gestor_segun_estado_rendicion(idpais smallint, estado integer) TO admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_gestor_segun_estado_rendicion(idpais smallint, estado integer) TO PUBLIC;


--
-- Name: liq_obtener_reporte_pagador(smallint, integer, integer); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_reporte_pagador(idpaisremitente smallint, pedesde integer, pehasta integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_reporte_pagador(idpaisremitente smallint, pedesde integer, pehasta integer) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_pagador(idpaisremitente smallint, pedesde integer, pehasta integer) TO admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_pagador(idpaisremitente smallint, pedesde integer, pehasta integer) TO PUBLIC;


--
-- Name: liq_obtener_reporte_pagador_rendicion(smallint); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_reporte_pagador_rendicion(idpais smallint) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_reporte_pagador_rendicion(idpais smallint) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_pagador_rendicion(idpais smallint) TO admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_pagador_rendicion(idpais smallint) TO PUBLIC;


--
-- Name: liq_obtener_reporte_pagador_segun_estado_rendicion(smallint, smallint); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_reporte_pagador_segun_estado_rendicion(idpais smallint, estado smallint) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_reporte_pagador_segun_estado_rendicion(idpais smallint, estado smallint) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_pagador_segun_estado_rendicion(idpais smallint, estado smallint) TO admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_pagador_segun_estado_rendicion(idpais smallint, estado smallint) TO PUBLIC;


--
-- Name: liq_obtener_reporte_pagador_segun_estado_rendicion(smallint, integer); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_reporte_pagador_segun_estado_rendicion(idpais smallint, estado integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_reporte_pagador_segun_estado_rendicion(idpais smallint, estado integer) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_pagador_segun_estado_rendicion(idpais smallint, estado integer) TO admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_pagador_segun_estado_rendicion(idpais smallint, estado integer) TO PUBLIC;


--
-- Name: liq_obtener_reporte_rendicion(integer, integer, integer); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_reporte_rendicion(id_pais integer, id_estado_l integer, id_estado_r integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_reporte_rendicion(id_pais integer, id_estado_l integer, id_estado_r integer) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_rendicion(id_pais integer, id_estado_l integer, id_estado_r integer) TO admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_rendicion(id_pais integer, id_estado_l integer, id_estado_r integer) TO PUBLIC;


--
-- Name: liq_obtener_reporte_rendicion(integer, integer, integer, character varying); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_obtener_reporte_rendicion(id_pais integer, id_estado_l integer, id_estado_r integer, rol character varying) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_obtener_reporte_rendicion(id_pais integer, id_estado_l integer, id_estado_r integer, rol character varying) FROM admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_rendicion(id_pais integer, id_estado_l integer, id_estado_r integer, rol character varying) TO admin;
GRANT ALL ON FUNCTION liq_obtener_reporte_rendicion(id_pais integer, id_estado_l integer, id_estado_r integer, rol character varying) TO PUBLIC;


--
-- Name: liq_valida_beneficio(integer); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION liq_valida_beneficio(integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION liq_valida_beneficio(integer) FROM admin;
GRANT ALL ON FUNCTION liq_valida_beneficio(integer) TO admin;
GRANT ALL ON FUNCTION liq_valida_beneficio(integer) TO PUBLIC;


--
-- Name: pagos_obtener_configuracion_sistema(); Type: ACL; Schema: siacilocal; Owner: postgres
--

REVOKE ALL ON FUNCTION pagos_obtener_configuracion_sistema() FROM PUBLIC;
REVOKE ALL ON FUNCTION pagos_obtener_configuracion_sistema() FROM postgres;
GRANT ALL ON FUNCTION pagos_obtener_configuracion_sistema() TO postgres;
GRANT ALL ON FUNCTION pagos_obtener_configuracion_sistema() TO PUBLIC;
GRANT ALL ON FUNCTION pagos_obtener_configuracion_sistema() TO admin;


--
-- Name: tiene_prestaciones_pendientes_de_informar_pago(integer); Type: ACL; Schema: siacilocal; Owner: admin
--

REVOKE ALL ON FUNCTION tiene_prestaciones_pendientes_de_informar_pago(integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION tiene_prestaciones_pendientes_de_informar_pago(integer) FROM admin;
GRANT ALL ON FUNCTION tiene_prestaciones_pendientes_de_informar_pago(integer) TO admin;
GRANT ALL ON FUNCTION tiene_prestaciones_pendientes_de_informar_pago(integer) TO PUBLIC;


--
-- PostgreSQL database dump complete
--

