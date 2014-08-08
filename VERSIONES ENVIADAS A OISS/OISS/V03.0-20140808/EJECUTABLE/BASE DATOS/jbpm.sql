--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.4
-- Dumped by pg_dump version 9.0.4
-- Started on 2014-06-19 16:00:34

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 2158 (class 1262 OID 145347)
-- Name: jbpm; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE jbpm WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Argentina.1252' LC_CTYPE = 'Spanish_Argentina.1252';


ALTER DATABASE jbpm OWNER TO postgres;

\connect jbpm

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 393 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 1585 (class 1259 OID 145348)
-- Dependencies: 6
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 1585
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 2761, true);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1586 (class 1259 OID 145350)
-- Dependencies: 6
-- Name: jbpm_action; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_action (
    id_ bigint NOT NULL,
    class character(1) NOT NULL,
    name_ character varying(255),
    ispropagationallowed_ boolean,
    actionexpression_ character varying(255),
    isasync_ boolean,
    referencedaction_ bigint,
    actiondelegation_ bigint,
    event_ bigint,
    processdefinition_ bigint,
    expression_ character varying(4000),
    timername_ character varying(255),
    duedate_ character varying(255),
    repeat_ character varying(255),
    transitionname_ character varying(255),
    timeraction_ bigint,
    eventindex_ integer,
    exceptionhandler_ bigint,
    exceptionhandlerindex_ integer
);


ALTER TABLE public.jbpm_action OWNER TO postgres;

--
-- TOC entry 1587 (class 1259 OID 145356)
-- Dependencies: 6
-- Name: jbpm_bytearray; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_bytearray (
    id_ bigint NOT NULL,
    name_ character varying(255),
    filedefinition_ bigint
);


ALTER TABLE public.jbpm_bytearray OWNER TO postgres;

--
-- TOC entry 1588 (class 1259 OID 145359)
-- Dependencies: 6
-- Name: jbpm_byteblock; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_byteblock (
    processfile_ bigint NOT NULL,
    bytes_ bytea,
    index_ integer NOT NULL
);


ALTER TABLE public.jbpm_byteblock OWNER TO postgres;

--
-- TOC entry 1589 (class 1259 OID 145365)
-- Dependencies: 6
-- Name: jbpm_comment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_comment (
    id_ bigint NOT NULL,
    version_ integer NOT NULL,
    actorid_ character varying(255),
    time_ timestamp without time zone,
    message_ character varying(4000),
    token_ bigint,
    taskinstance_ bigint,
    tokenindex_ integer,
    taskinstanceindex_ integer
);


ALTER TABLE public.jbpm_comment OWNER TO postgres;

--
-- TOC entry 1590 (class 1259 OID 145371)
-- Dependencies: 6
-- Name: jbpm_decisionconditions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_decisionconditions (
    decision_ bigint NOT NULL,
    transitionname_ character varying(255),
    expression_ character varying(255),
    index_ integer NOT NULL
);


ALTER TABLE public.jbpm_decisionconditions OWNER TO postgres;

--
-- TOC entry 1591 (class 1259 OID 145377)
-- Dependencies: 6
-- Name: jbpm_delegation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_delegation (
    id_ bigint NOT NULL,
    classname_ character varying(4000),
    configuration_ character varying(4000),
    configtype_ character varying(255),
    processdefinition_ bigint
);


ALTER TABLE public.jbpm_delegation OWNER TO postgres;

--
-- TOC entry 1592 (class 1259 OID 145383)
-- Dependencies: 6
-- Name: jbpm_event; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_event (
    id_ bigint NOT NULL,
    eventtype_ character varying(255),
    type_ character(1),
    graphelement_ bigint,
    processdefinition_ bigint,
    node_ bigint,
    transition_ bigint,
    task_ bigint
);


ALTER TABLE public.jbpm_event OWNER TO postgres;

--
-- TOC entry 1593 (class 1259 OID 145386)
-- Dependencies: 6
-- Name: jbpm_exceptionhandler; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_exceptionhandler (
    id_ bigint NOT NULL,
    exceptionclassname_ character varying(4000),
    type_ character(1),
    graphelement_ bigint,
    processdefinition_ bigint,
    graphelementindex_ integer,
    node_ bigint,
    transition_ bigint,
    task_ bigint
);


ALTER TABLE public.jbpm_exceptionhandler OWNER TO postgres;

--
-- TOC entry 1594 (class 1259 OID 145392)
-- Dependencies: 6
-- Name: jbpm_id_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_id_group (
    id_ bigint NOT NULL,
    class_ character(1) NOT NULL,
    name_ character varying(255),
    type_ character varying(255),
    parent_ bigint
);


ALTER TABLE public.jbpm_id_group OWNER TO postgres;

--
-- TOC entry 1595 (class 1259 OID 145398)
-- Dependencies: 6
-- Name: jbpm_id_membership; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_id_membership (
    id_ bigint NOT NULL,
    class_ character(1) NOT NULL,
    name_ character varying(255),
    role_ character varying(255),
    user_ bigint,
    group_ bigint
);


ALTER TABLE public.jbpm_id_membership OWNER TO postgres;

--
-- TOC entry 1596 (class 1259 OID 145404)
-- Dependencies: 6
-- Name: jbpm_id_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_id_permissions (
    entity_ bigint NOT NULL,
    class_ character varying(255),
    name_ character varying(255),
    action_ character varying(255)
);


ALTER TABLE public.jbpm_id_permissions OWNER TO postgres;

--
-- TOC entry 1597 (class 1259 OID 145410)
-- Dependencies: 6
-- Name: jbpm_id_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_id_user (
    id_ bigint NOT NULL,
    class_ character(1) NOT NULL,
    name_ character varying(255),
    email_ character varying(255),
    password_ character varying(255)
);


ALTER TABLE public.jbpm_id_user OWNER TO postgres;

--
-- TOC entry 1598 (class 1259 OID 145416)
-- Dependencies: 6
-- Name: jbpm_job; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_job (
    id_ bigint NOT NULL,
    class_ character(1) NOT NULL,
    version_ integer NOT NULL,
    duedate_ timestamp without time zone,
    processinstance_ bigint,
    token_ bigint,
    taskinstance_ bigint,
    issuspended_ boolean,
    isexclusive_ boolean,
    lockowner_ character varying(255),
    locktime_ timestamp without time zone,
    exception_ character varying(4000),
    retries_ integer,
    name_ character varying(255),
    repeat_ character varying(255),
    transitionname_ character varying(255),
    action_ bigint,
    graphelementtype_ character varying(255),
    graphelement_ bigint,
    node_ bigint
);


ALTER TABLE public.jbpm_job OWNER TO postgres;

--
-- TOC entry 1599 (class 1259 OID 145422)
-- Dependencies: 6
-- Name: jbpm_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_log (
    id_ bigint NOT NULL,
    class_ character(1) NOT NULL,
    index_ integer,
    date_ timestamp without time zone,
    token_ bigint,
    parent_ bigint,
    message_ character varying(4000),
    exception_ character varying(4000),
    action_ bigint,
    node_ bigint,
    enter_ timestamp without time zone,
    leave_ timestamp without time zone,
    duration_ bigint,
    newlongvalue_ bigint,
    transition_ bigint,
    child_ bigint,
    sourcenode_ bigint,
    destinationnode_ bigint,
    variableinstance_ bigint,
    oldbytearray_ bigint,
    newbytearray_ bigint,
    olddatevalue_ timestamp without time zone,
    newdatevalue_ timestamp without time zone,
    olddoublevalue_ double precision,
    newdoublevalue_ double precision,
    oldlongidclass_ character varying(255),
    oldlongidvalue_ bigint,
    newlongidclass_ character varying(255),
    newlongidvalue_ bigint,
    oldstringidclass_ character varying(255),
    oldstringidvalue_ character varying(255),
    newstringidclass_ character varying(255),
    newstringidvalue_ character varying(255),
    oldlongvalue_ bigint,
    oldstringvalue_ character varying(4000),
    newstringvalue_ character varying(4000),
    taskinstance_ bigint,
    taskactorid_ character varying(255),
    taskoldactorid_ character varying(255),
    swimlaneinstance_ bigint
);


ALTER TABLE public.jbpm_log OWNER TO postgres;

--
-- TOC entry 1600 (class 1259 OID 145428)
-- Dependencies: 6
-- Name: jbpm_moduledefinition; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_moduledefinition (
    id_ bigint NOT NULL,
    class_ character(1) NOT NULL,
    name_ character varying(4000),
    processdefinition_ bigint,
    starttask_ bigint
);


ALTER TABLE public.jbpm_moduledefinition OWNER TO postgres;

--
-- TOC entry 1601 (class 1259 OID 145434)
-- Dependencies: 6
-- Name: jbpm_moduleinstance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_moduleinstance (
    id_ bigint NOT NULL,
    class_ character(1) NOT NULL,
    version_ integer NOT NULL,
    processinstance_ bigint,
    taskmgmtdefinition_ bigint,
    name_ character varying(255)
);


ALTER TABLE public.jbpm_moduleinstance OWNER TO postgres;

--
-- TOC entry 1602 (class 1259 OID 145437)
-- Dependencies: 6
-- Name: jbpm_node; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_node (
    id_ bigint NOT NULL,
    class_ character(1) NOT NULL,
    name_ character varying(255),
    description_ character varying(4000),
    processdefinition_ bigint,
    isasync_ boolean,
    isasyncexcl_ boolean,
    action_ bigint,
    superstate_ bigint,
    subprocname_ character varying(255),
    subprocessdefinition_ bigint,
    decisionexpression_ character varying(255),
    decisiondelegation bigint,
    script_ bigint,
    signal_ integer,
    createtasks_ boolean,
    endtasks_ boolean,
    nodecollectionindex_ integer
);


ALTER TABLE public.jbpm_node OWNER TO postgres;

--
-- TOC entry 1603 (class 1259 OID 145443)
-- Dependencies: 6
-- Name: jbpm_pooledactor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_pooledactor (
    id_ bigint NOT NULL,
    version_ integer NOT NULL,
    actorid_ character varying(255),
    swimlaneinstance_ bigint
);


ALTER TABLE public.jbpm_pooledactor OWNER TO postgres;

--
-- TOC entry 1604 (class 1259 OID 145446)
-- Dependencies: 6
-- Name: jbpm_processdefinition; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_processdefinition (
    id_ bigint NOT NULL,
    class_ character(1) NOT NULL,
    name_ character varying(255),
    description_ character varying(4000),
    version_ integer,
    isterminationimplicit_ boolean,
    startstate_ bigint
);


ALTER TABLE public.jbpm_processdefinition OWNER TO postgres;

--
-- TOC entry 1605 (class 1259 OID 145452)
-- Dependencies: 6
-- Name: jbpm_processinstance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_processinstance (
    id_ bigint NOT NULL,
    version_ integer NOT NULL,
    key_ character varying(255),
    start_ timestamp without time zone,
    end_ timestamp without time zone,
    issuspended_ boolean,
    processdefinition_ bigint,
    roottoken_ bigint,
    superprocesstoken_ bigint
);


ALTER TABLE public.jbpm_processinstance OWNER TO postgres;

--
-- TOC entry 1606 (class 1259 OID 145455)
-- Dependencies: 6
-- Name: jbpm_runtimeaction; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_runtimeaction (
    id_ bigint NOT NULL,
    version_ integer NOT NULL,
    eventtype_ character varying(255),
    type_ character(1),
    graphelement_ bigint,
    processinstance_ bigint,
    action_ bigint,
    processinstanceindex_ integer
);


ALTER TABLE public.jbpm_runtimeaction OWNER TO postgres;

--
-- TOC entry 1607 (class 1259 OID 145458)
-- Dependencies: 6
-- Name: jbpm_swimlane; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_swimlane (
    id_ bigint NOT NULL,
    name_ character varying(255),
    actoridexpression_ character varying(255),
    pooledactorsexpression_ character varying(255),
    assignmentdelegation_ bigint,
    taskmgmtdefinition_ bigint
);


ALTER TABLE public.jbpm_swimlane OWNER TO postgres;

--
-- TOC entry 1608 (class 1259 OID 145464)
-- Dependencies: 6
-- Name: jbpm_swimlaneinstance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_swimlaneinstance (
    id_ bigint NOT NULL,
    version_ integer NOT NULL,
    name_ character varying(255),
    actorid_ character varying(255),
    swimlane_ bigint,
    taskmgmtinstance_ bigint
);


ALTER TABLE public.jbpm_swimlaneinstance OWNER TO postgres;

--
-- TOC entry 1609 (class 1259 OID 145470)
-- Dependencies: 6
-- Name: jbpm_task; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_task (
    id_ bigint NOT NULL,
    name_ character varying(255),
    description_ character varying(4000),
    processdefinition_ bigint,
    isblocking_ boolean,
    issignalling_ boolean,
    condition_ character varying(255),
    duedate_ character varying(255),
    priority_ integer,
    actoridexpression_ character varying(255),
    pooledactorsexpression_ character varying(255),
    taskmgmtdefinition_ bigint,
    tasknode_ bigint,
    startstate_ bigint,
    assignmentdelegation_ bigint,
    swimlane_ bigint,
    taskcontroller_ bigint
);


ALTER TABLE public.jbpm_task OWNER TO postgres;

--
-- TOC entry 1610 (class 1259 OID 145476)
-- Dependencies: 6
-- Name: jbpm_taskactorpool; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_taskactorpool (
    taskinstance_ bigint NOT NULL,
    pooledactor_ bigint NOT NULL
);


ALTER TABLE public.jbpm_taskactorpool OWNER TO postgres;

--
-- TOC entry 1611 (class 1259 OID 145479)
-- Dependencies: 6
-- Name: jbpm_taskcontroller; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_taskcontroller (
    id_ bigint NOT NULL,
    taskcontrollerdelegation_ bigint
);


ALTER TABLE public.jbpm_taskcontroller OWNER TO postgres;

--
-- TOC entry 1612 (class 1259 OID 145482)
-- Dependencies: 6
-- Name: jbpm_taskinstance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_taskinstance (
    id_ bigint NOT NULL,
    class_ character(1) NOT NULL,
    version_ integer NOT NULL,
    name_ character varying(255),
    description_ character varying(4000),
    actorid_ character varying(255),
    create_ timestamp without time zone,
    start_ timestamp without time zone,
    end_ timestamp without time zone,
    duedate_ timestamp without time zone,
    priority_ integer,
    iscancelled_ boolean,
    issuspended_ boolean,
    isopen_ boolean,
    issignalling_ boolean,
    isblocking_ boolean,
    task_ bigint,
    token_ bigint,
    procinst_ bigint,
    swimlaninstance_ bigint,
    taskmgmtinstance_ bigint
);


ALTER TABLE public.jbpm_taskinstance OWNER TO postgres;

--
-- TOC entry 1613 (class 1259 OID 145488)
-- Dependencies: 6
-- Name: jbpm_token; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_token (
    id_ bigint NOT NULL,
    version_ integer NOT NULL,
    name_ character varying(255),
    start_ timestamp without time zone,
    end_ timestamp without time zone,
    nodeenter_ timestamp without time zone,
    nextlogindex_ integer,
    isabletoreactivateparent_ boolean,
    isterminationimplicit_ boolean,
    issuspended_ boolean,
    lock_ character varying(255),
    node_ bigint,
    processinstance_ bigint,
    parent_ bigint,
    subprocessinstance_ bigint
);


ALTER TABLE public.jbpm_token OWNER TO postgres;

--
-- TOC entry 1614 (class 1259 OID 145494)
-- Dependencies: 6
-- Name: jbpm_tokenvariablemap; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_tokenvariablemap (
    id_ bigint NOT NULL,
    version_ integer NOT NULL,
    token_ bigint,
    contextinstance_ bigint
);


ALTER TABLE public.jbpm_tokenvariablemap OWNER TO postgres;

--
-- TOC entry 1615 (class 1259 OID 145497)
-- Dependencies: 6
-- Name: jbpm_transition; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_transition (
    id_ bigint NOT NULL,
    name_ character varying(255),
    description_ character varying(4000),
    processdefinition_ bigint,
    from_ bigint,
    to_ bigint,
    condition_ character varying(255),
    fromindex_ integer
);


ALTER TABLE public.jbpm_transition OWNER TO postgres;

--
-- TOC entry 1616 (class 1259 OID 145503)
-- Dependencies: 6
-- Name: jbpm_variableaccess; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_variableaccess (
    id_ bigint NOT NULL,
    variablename_ character varying(255),
    access_ character varying(255),
    mappedname_ character varying(255),
    script_ bigint,
    processstate_ bigint,
    taskcontroller_ bigint,
    index_ integer
);


ALTER TABLE public.jbpm_variableaccess OWNER TO postgres;

--
-- TOC entry 1617 (class 1259 OID 145509)
-- Dependencies: 6
-- Name: jbpm_variableinstance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbpm_variableinstance (
    id_ bigint NOT NULL,
    class_ character(1) NOT NULL,
    version_ integer NOT NULL,
    name_ character varying(255),
    converter_ character(1),
    token_ bigint,
    tokenvariablemap_ bigint,
    processinstance_ bigint,
    bytearrayvalue_ bigint,
    datevalue_ timestamp without time zone,
    doublevalue_ double precision,
    longidclass_ character varying(255),
    longvalue_ bigint,
    stringidclass_ character varying(255),
    stringvalue_ character varying(4000),
    taskinstance_ bigint
);


ALTER TABLE public.jbpm_variableinstance OWNER TO postgres;

--
-- TOC entry 2124 (class 0 OID 145350)
-- Dependencies: 1586
-- Data for Name: jbpm_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_action (id_, class, name_, ispropagationallowed_, actionexpression_, isasync_, referencedaction_, actiondelegation_, event_, processdefinition_, expression_, timername_, duedate_, repeat_, transitionname_, timeraction_, eventindex_, exceptionhandler_, exceptionhandlerindex_) FROM stdin;
\.


--
-- TOC entry 2125 (class 0 OID 145356)
-- Dependencies: 1587
-- Data for Name: jbpm_bytearray; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_bytearray (id_, name_, filedefinition_) FROM stdin;
\.


--
-- TOC entry 2126 (class 0 OID 145359)
-- Dependencies: 1588
-- Data for Name: jbpm_byteblock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_byteblock (processfile_, bytes_, index_) FROM stdin;
\.


--
-- TOC entry 2127 (class 0 OID 145365)
-- Dependencies: 1589
-- Data for Name: jbpm_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_comment (id_, version_, actorid_, time_, message_, token_, taskinstance_, tokenindex_, taskinstanceindex_) FROM stdin;
\.


--
-- TOC entry 2128 (class 0 OID 145371)
-- Dependencies: 1590
-- Data for Name: jbpm_decisionconditions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_decisionconditions (decision_, transitionname_, expression_, index_) FROM stdin;
\.


--
-- TOC entry 2129 (class 0 OID 145377)
-- Dependencies: 1591
-- Data for Name: jbpm_delegation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_delegation (id_, classname_, configuration_, configtype_, processdefinition_) FROM stdin;
\.


--
-- TOC entry 2130 (class 0 OID 145383)
-- Dependencies: 1592
-- Data for Name: jbpm_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_event (id_, eventtype_, type_, graphelement_, processdefinition_, node_, transition_, task_) FROM stdin;
\.


--
-- TOC entry 2131 (class 0 OID 145386)
-- Dependencies: 1593
-- Data for Name: jbpm_exceptionhandler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_exceptionhandler (id_, exceptionclassname_, type_, graphelement_, processdefinition_, graphelementindex_, node_, transition_, task_) FROM stdin;
\.


--
-- TOC entry 2132 (class 0 OID 145392)
-- Dependencies: 1594
-- Data for Name: jbpm_id_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_id_group (id_, class_, name_, type_, parent_) FROM stdin;
\.


--
-- TOC entry 2133 (class 0 OID 145398)
-- Dependencies: 1595
-- Data for Name: jbpm_id_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_id_membership (id_, class_, name_, role_, user_, group_) FROM stdin;
\.


--
-- TOC entry 2134 (class 0 OID 145404)
-- Dependencies: 1596
-- Data for Name: jbpm_id_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_id_permissions (entity_, class_, name_, action_) FROM stdin;
\.


--
-- TOC entry 2135 (class 0 OID 145410)
-- Dependencies: 1597
-- Data for Name: jbpm_id_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_id_user (id_, class_, name_, email_, password_) FROM stdin;
\.


--
-- TOC entry 2136 (class 0 OID 145416)
-- Dependencies: 1598
-- Data for Name: jbpm_job; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_job (id_, class_, version_, duedate_, processinstance_, token_, taskinstance_, issuspended_, isexclusive_, lockowner_, locktime_, exception_, retries_, name_, repeat_, transitionname_, action_, graphelementtype_, graphelement_, node_) FROM stdin;
\.


--
-- TOC entry 2137 (class 0 OID 145422)
-- Dependencies: 1599
-- Data for Name: jbpm_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_log (id_, class_, index_, date_, token_, parent_, message_, exception_, action_, node_, enter_, leave_, duration_, newlongvalue_, transition_, child_, sourcenode_, destinationnode_, variableinstance_, oldbytearray_, newbytearray_, olddatevalue_, newdatevalue_, olddoublevalue_, newdoublevalue_, oldlongidclass_, oldlongidvalue_, newlongidclass_, newlongidvalue_, oldstringidclass_, oldstringidvalue_, newstringidclass_, newstringidvalue_, oldlongvalue_, oldstringvalue_, newstringvalue_, taskinstance_, taskactorid_, taskoldactorid_, swimlaneinstance_) FROM stdin;
\.


--
-- TOC entry 2138 (class 0 OID 145428)
-- Dependencies: 1600
-- Data for Name: jbpm_moduledefinition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_moduledefinition (id_, class_, name_, processdefinition_, starttask_) FROM stdin;
32	C	org.jbpm.context.def.ContextDefinition	1	\N
33	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1	\N
73	C	org.jbpm.context.def.ContextDefinition	42	\N
74	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	42	\N
114	C	org.jbpm.context.def.ContextDefinition	83	\N
115	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	83	\N
151	C	org.jbpm.context.def.ContextDefinition	120	\N
152	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	120	\N
184	C	org.jbpm.context.def.ContextDefinition	153	\N
185	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	153	\N
221	C	org.jbpm.context.def.ContextDefinition	190	\N
222	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	190	\N
254	C	org.jbpm.context.def.ContextDefinition	223	\N
255	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	223	\N
291	C	org.jbpm.context.def.ContextDefinition	260	\N
292	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	260	\N
328	C	org.jbpm.context.def.ContextDefinition	297	\N
329	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	297	\N
365	C	org.jbpm.context.def.ContextDefinition	334	\N
366	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	334	\N
398	C	org.jbpm.context.def.ContextDefinition	367	\N
399	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	367	\N
431	C	org.jbpm.context.def.ContextDefinition	400	\N
432	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	400	\N
464	C	org.jbpm.context.def.ContextDefinition	433	\N
465	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	433	\N
501	C	org.jbpm.context.def.ContextDefinition	470	\N
502	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	470	\N
534	C	org.jbpm.context.def.ContextDefinition	503	\N
535	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	503	\N
567	C	org.jbpm.context.def.ContextDefinition	536	\N
568	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	536	\N
600	C	org.jbpm.context.def.ContextDefinition	569	\N
601	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	569	\N
633	C	org.jbpm.context.def.ContextDefinition	602	\N
634	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	602	\N
666	C	org.jbpm.context.def.ContextDefinition	635	\N
667	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	635	\N
699	C	org.jbpm.context.def.ContextDefinition	668	\N
700	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	668	\N
732	C	org.jbpm.context.def.ContextDefinition	701	\N
733	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	701	\N
765	C	org.jbpm.context.def.ContextDefinition	734	\N
766	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	734	\N
798	C	org.jbpm.context.def.ContextDefinition	767	\N
799	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	767	\N
831	C	org.jbpm.context.def.ContextDefinition	800	\N
832	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	800	\N
864	C	org.jbpm.context.def.ContextDefinition	833	\N
865	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	833	\N
897	C	org.jbpm.context.def.ContextDefinition	866	\N
898	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	866	\N
930	C	org.jbpm.context.def.ContextDefinition	899	\N
931	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	899	\N
967	C	org.jbpm.context.def.ContextDefinition	936	\N
968	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	936	\N
1007	C	org.jbpm.context.def.ContextDefinition	976	\N
1008	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	976	\N
1044	C	org.jbpm.context.def.ContextDefinition	1013	\N
1045	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1013	\N
1077	C	org.jbpm.context.def.ContextDefinition	1046	\N
1078	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1046	\N
1110	C	org.jbpm.context.def.ContextDefinition	1079	\N
1111	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1079	\N
1143	C	org.jbpm.context.def.ContextDefinition	1112	\N
1144	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1112	\N
1176	C	org.jbpm.context.def.ContextDefinition	1145	\N
1177	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1145	\N
1209	C	org.jbpm.context.def.ContextDefinition	1178	\N
1210	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1178	\N
1242	C	org.jbpm.context.def.ContextDefinition	1211	\N
1243	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1211	\N
1275	C	org.jbpm.context.def.ContextDefinition	1244	\N
1276	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1244	\N
1308	C	org.jbpm.context.def.ContextDefinition	1277	\N
1309	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1277	\N
1341	C	org.jbpm.context.def.ContextDefinition	1310	\N
1342	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1310	\N
1374	C	org.jbpm.context.def.ContextDefinition	1343	\N
1375	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1343	\N
1407	C	org.jbpm.context.def.ContextDefinition	1376	\N
1408	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1376	\N
1440	C	org.jbpm.context.def.ContextDefinition	1409	\N
1441	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1409	\N
1473	C	org.jbpm.context.def.ContextDefinition	1442	\N
1474	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1442	\N
1506	C	org.jbpm.context.def.ContextDefinition	1475	\N
1507	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1475	\N
1539	C	org.jbpm.context.def.ContextDefinition	1508	\N
1540	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1508	\N
1572	C	org.jbpm.context.def.ContextDefinition	1541	\N
1573	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1541	\N
1605	C	org.jbpm.context.def.ContextDefinition	1574	\N
1606	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1574	\N
1638	C	org.jbpm.context.def.ContextDefinition	1607	\N
1639	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1607	\N
1671	C	org.jbpm.context.def.ContextDefinition	1640	\N
1672	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1640	\N
1704	C	org.jbpm.context.def.ContextDefinition	1673	\N
1705	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1673	\N
1737	C	org.jbpm.context.def.ContextDefinition	1706	\N
1738	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1706	\N
1770	C	org.jbpm.context.def.ContextDefinition	1739	\N
1771	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1739	\N
1803	C	org.jbpm.context.def.ContextDefinition	1772	\N
1804	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1772	\N
1836	C	org.jbpm.context.def.ContextDefinition	1805	\N
1837	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1805	\N
1869	C	org.jbpm.context.def.ContextDefinition	1838	\N
1870	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1838	\N
1902	C	org.jbpm.context.def.ContextDefinition	1871	\N
1903	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1871	\N
1935	C	org.jbpm.context.def.ContextDefinition	1904	\N
1936	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1904	\N
1968	C	org.jbpm.context.def.ContextDefinition	1937	\N
1969	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1937	\N
2001	C	org.jbpm.context.def.ContextDefinition	1970	\N
2002	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	1970	\N
2034	C	org.jbpm.context.def.ContextDefinition	2003	\N
2035	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2003	\N
2067	C	org.jbpm.context.def.ContextDefinition	2036	\N
2068	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2036	\N
2100	C	org.jbpm.context.def.ContextDefinition	2069	\N
2101	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2069	\N
2133	C	org.jbpm.context.def.ContextDefinition	2102	\N
2134	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2102	\N
2166	C	org.jbpm.context.def.ContextDefinition	2135	\N
2167	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2135	\N
2199	C	org.jbpm.context.def.ContextDefinition	2168	\N
2200	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2168	\N
2232	C	org.jbpm.context.def.ContextDefinition	2201	\N
2233	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2201	\N
2265	C	org.jbpm.context.def.ContextDefinition	2234	\N
2266	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2234	\N
2298	C	org.jbpm.context.def.ContextDefinition	2267	\N
2299	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2267	\N
2331	C	org.jbpm.context.def.ContextDefinition	2300	\N
2332	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2300	\N
2364	C	org.jbpm.context.def.ContextDefinition	2333	\N
2365	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2333	\N
2397	C	org.jbpm.context.def.ContextDefinition	2366	\N
2398	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2366	\N
2430	C	org.jbpm.context.def.ContextDefinition	2399	\N
2431	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2399	\N
2463	C	org.jbpm.context.def.ContextDefinition	2432	\N
2464	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2432	\N
2496	C	org.jbpm.context.def.ContextDefinition	2465	\N
2497	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2465	\N
2529	C	org.jbpm.context.def.ContextDefinition	2498	\N
2530	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2498	\N
2562	C	org.jbpm.context.def.ContextDefinition	2531	\N
2563	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2531	\N
2595	C	org.jbpm.context.def.ContextDefinition	2564	\N
2596	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2564	\N
2628	C	org.jbpm.context.def.ContextDefinition	2597	\N
2629	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2597	\N
2661	C	org.jbpm.context.def.ContextDefinition	2630	\N
2662	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2630	\N
2694	C	org.jbpm.context.def.ContextDefinition	2663	\N
2695	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2663	\N
2727	C	org.jbpm.context.def.ContextDefinition	2696	\N
2728	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2696	\N
2760	C	org.jbpm.context.def.ContextDefinition	2729	\N
2761	T	org.jbpm.taskmgmt.def.TaskMgmtDefinition	2729	\N
\.


--
-- TOC entry 2139 (class 0 OID 145434)
-- Dependencies: 1601
-- Data for Name: jbpm_moduleinstance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_moduleinstance (id_, class_, version_, processinstance_, taskmgmtdefinition_, name_) FROM stdin;
258	C	0	256	\N	org.jbpm.context.exe.ContextInstance
259	T	0	256	255	org.jbpm.taskmgmt.exe.TaskMgmtInstance
332	C	0	330	\N	org.jbpm.context.exe.ContextInstance
333	T	0	330	329	org.jbpm.taskmgmt.exe.TaskMgmtInstance
\.


--
-- TOC entry 2140 (class 0 OID 145437)
-- Dependencies: 1602
-- Data for Name: jbpm_node; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_node (id_, class_, name_, description_, processdefinition_, isasync_, isasyncexcl_, action_, superstate_, subprocname_, subprocessdefinition_, decisionexpression_, decisiondelegation, script_, signal_, createtasks_, endtasks_, nodecollectionindex_) FROM stdin;
2	R		\N	1	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
4	S	EdicionAlta	\N	1	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
6	S	TransfiriendoOISS	\N	1	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
10	S	PendienteEnvioPaisAlta	\N	1	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
12	S	TransfiriendoPais	\N	1	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
15	S	PendienteAprobacion	\N	1	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
17	S	PendienteAprobacionOISS	\N	1	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
19	S	TransfiriendoOISSAprobacion	\N	1	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
23	S	PendienteAprobacionPais	\N	1	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
25	S	TranferiendoAprobacionPais	\N	1	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
28	S	Recibido	\N	1	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
30	E	end1	\N	1	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
31	S	ErrorValidacionOISS	\N	1	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
43	R		\N	42	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
45	S	EdicionAlta	\N	42	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
47	S	TransfiriendoOISS	\N	42	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
51	S	PendienteEnvioPaisAlta	\N	42	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
53	S	TransfiriendoPais	\N	42	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
56	S	PendienteAprobacion	\N	42	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
58	S	PendienteAprobacionOISS	\N	42	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
60	S	TransfiriendoOISSAprobacion	\N	42	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
64	S	PendienteAprobacionPais	\N	42	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
66	S	TranferiendoAprobacionPais	\N	42	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
69	S	Recibido	\N	42	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
71	E	end1	\N	42	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
72	S	ErrorValidacionOISS	\N	42	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
84	R		\N	83	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
86	S	EdicionAlta	\N	83	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
88	S	TransfiriendoOISS	\N	83	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
92	S	PendienteEnvioPaisAlta	\N	83	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
94	S	TransfiriendoPais	\N	83	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
97	S	PendienteAprobacion	\N	83	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
99	S	PendienteAprobacionOISS	\N	83	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
101	S	TransfiriendoOISSAprobacion	\N	83	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
105	S	PendienteAprobacionPais	\N	83	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
107	S	TranferiendoAprobacionPais	\N	83	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
110	S	Recibido	\N	83	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
112	E	end1	\N	83	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
113	S	ErrorValidacionOISS	\N	83	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
121	R		\N	120	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
123	S	EdicionAlta	\N	120	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
125	S	TransfiriendoOISS	\N	120	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
129	S	PendienteEnvioPaisAlta	\N	120	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
131	S	TransfiriendoPais	\N	120	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
134	S	PendienteAprobacion	\N	120	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
136	S	PendienteAprobacionOISS	\N	120	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
138	S	TransfiriendoOISSAprobacion	\N	120	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
142	S	PendienteAprobacionPais	\N	120	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
144	S	TranferiendoAprobacionPais	\N	120	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
147	S	Recibido	\N	120	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
149	E	end1	\N	120	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
150	S	ErrorValidacionOISS	\N	120	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
154	R		\N	153	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
156	S	EdicionAlta	\N	153	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
158	S	TransfiriendoOISS	\N	153	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
162	S	PendienteEnvioPaisAlta	\N	153	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
164	S	TransfiriendoPais	\N	153	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
167	S	PendienteAprobacion	\N	153	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
169	S	PendienteAprobacionOISS	\N	153	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
171	S	TransfiriendoOISSAprobacion	\N	153	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
175	S	PendienteAprobacionPais	\N	153	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
177	S	TranferiendoAprobacionPais	\N	153	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
180	S	Recibido	\N	153	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
182	E	end1	\N	153	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
183	S	ErrorValidacionOISS	\N	153	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
191	R		\N	190	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
193	S	EdicionAlta	\N	190	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
195	S	TransfiriendoOISS	\N	190	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
199	S	PendienteEnvioPaisAlta	\N	190	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
201	S	TransfiriendoPais	\N	190	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
204	S	PendienteAprobacion	\N	190	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
206	S	PendienteAprobacionOISS	\N	190	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
208	S	TransfiriendoOISSAprobacion	\N	190	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
212	S	PendienteAprobacionPais	\N	190	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
214	S	TranferiendoAprobacionPais	\N	190	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
217	S	Recibido	\N	190	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
219	E	end1	\N	190	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
220	S	ErrorValidacionOISS	\N	190	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
224	R		\N	223	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
226	S	EdicionAlta	\N	223	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
228	S	TransfiriendoOISS	\N	223	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
232	S	PendienteEnvioPaisAlta	\N	223	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
234	S	TransfiriendoPais	\N	223	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
237	S	PendienteAprobacion	\N	223	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
239	S	PendienteAprobacionOISS	\N	223	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
241	S	TransfiriendoOISSAprobacion	\N	223	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
245	S	PendienteAprobacionPais	\N	223	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
247	S	TranferiendoAprobacionPais	\N	223	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
250	S	Recibido	\N	223	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
252	E	end1	\N	223	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
253	S	ErrorValidacionOISS	\N	223	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
261	R		\N	260	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
263	S	EdicionAlta	\N	260	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
265	S	TransfiriendoOISS	\N	260	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
269	S	PendienteEnvioPaisAlta	\N	260	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
271	S	TransfiriendoPais	\N	260	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
274	S	PendienteAprobacion	\N	260	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
276	S	PendienteAprobacionOISS	\N	260	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
278	S	TransfiriendoOISSAprobacion	\N	260	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
282	S	PendienteAprobacionPais	\N	260	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
284	S	TranferiendoAprobacionPais	\N	260	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
287	S	Recibido	\N	260	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
289	E	end1	\N	260	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
290	S	ErrorValidacionOISS	\N	260	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
298	R		\N	297	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
300	S	EdicionAlta	\N	297	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
302	S	TransfiriendoOISS	\N	297	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
306	S	PendienteEnvioPaisAlta	\N	297	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
308	S	TransfiriendoPais	\N	297	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
311	S	PendienteAprobacion	\N	297	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
313	S	PendienteAprobacionOISS	\N	297	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
315	S	TransfiriendoOISSAprobacion	\N	297	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
319	S	PendienteAprobacionPais	\N	297	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
321	S	TranferiendoAprobacionPais	\N	297	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
324	S	Recibido	\N	297	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
326	E	end1	\N	297	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
327	S	ErrorValidacionOISS	\N	297	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
335	R		\N	334	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
337	S	EdicionAlta	\N	334	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
339	S	TransfiriendoOISS	\N	334	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
343	S	PendienteEnvioPaisAlta	\N	334	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
345	S	TransfiriendoPais	\N	334	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
348	S	PendienteAprobacion	\N	334	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
350	S	PendienteAprobacionOISS	\N	334	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
352	S	TransfiriendoOISSAprobacion	\N	334	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
356	S	PendienteAprobacionPais	\N	334	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
358	S	TranferiendoAprobacionPais	\N	334	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
361	S	Recibido	\N	334	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
363	E	end1	\N	334	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
364	S	ErrorValidacionOISS	\N	334	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
368	R		\N	367	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
370	S	EdicionAlta	\N	367	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
372	S	TransfiriendoOISS	\N	367	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
376	S	PendienteEnvioPaisAlta	\N	367	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
378	S	TransfiriendoPais	\N	367	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
381	S	PendienteAprobacion	\N	367	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
383	S	PendienteAprobacionOISS	\N	367	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
385	S	TransfiriendoOISSAprobacion	\N	367	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
389	S	PendienteAprobacionPais	\N	367	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
391	S	TranferiendoAprobacionPais	\N	367	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
394	S	Recibido	\N	367	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
396	E	end1	\N	367	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
397	S	ErrorValidacionOISS	\N	367	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
401	R		\N	400	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
403	S	EdicionAlta	\N	400	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
405	S	TransfiriendoOISS	\N	400	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
409	S	PendienteEnvioPaisAlta	\N	400	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
411	S	TransfiriendoPais	\N	400	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
414	S	PendienteAprobacion	\N	400	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
416	S	PendienteAprobacionOISS	\N	400	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
418	S	TransfiriendoOISSAprobacion	\N	400	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
422	S	PendienteAprobacionPais	\N	400	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
424	S	TranferiendoAprobacionPais	\N	400	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
427	S	Recibido	\N	400	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
429	E	end1	\N	400	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
430	S	ErrorValidacionOISS	\N	400	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
434	R		\N	433	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
436	S	EdicionAlta	\N	433	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
438	S	TransfiriendoOISS	\N	433	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
442	S	PendienteEnvioPaisAlta	\N	433	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
444	S	TransfiriendoPais	\N	433	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
447	S	PendienteAprobacion	\N	433	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
449	S	PendienteAprobacionOISS	\N	433	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
451	S	TransfiriendoOISSAprobacion	\N	433	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
455	S	PendienteAprobacionPais	\N	433	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
457	S	TranferiendoAprobacionPais	\N	433	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
460	S	Recibido	\N	433	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
462	E	end1	\N	433	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
463	S	ErrorValidacionOISS	\N	433	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
471	R		\N	470	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
473	S	EdicionAlta	\N	470	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
475	S	TransfiriendoOISS	\N	470	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
479	S	PendienteEnvioPaisAlta	\N	470	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
481	S	TransfiriendoPais	\N	470	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
484	S	PendienteAprobacion	\N	470	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
486	S	PendienteAprobacionOISS	\N	470	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
488	S	TransfiriendoOISSAprobacion	\N	470	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
492	S	PendienteAprobacionPais	\N	470	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
494	S	TranferiendoAprobacionPais	\N	470	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
497	S	Recibido	\N	470	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
499	E	end1	\N	470	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
500	S	ErrorValidacionOISS	\N	470	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
504	R		\N	503	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
506	S	EdicionAlta	\N	503	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
508	S	TransfiriendoOISS	\N	503	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
512	S	PendienteEnvioPaisAlta	\N	503	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
514	S	TransfiriendoPais	\N	503	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
517	S	PendienteAprobacion	\N	503	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
519	S	PendienteAprobacionOISS	\N	503	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
521	S	TransfiriendoOISSAprobacion	\N	503	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
525	S	PendienteAprobacionPais	\N	503	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
527	S	TranferiendoAprobacionPais	\N	503	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
530	S	Recibido	\N	503	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
532	E	end1	\N	503	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
533	S	ErrorValidacionOISS	\N	503	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
537	R		\N	536	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
539	S	EdicionAlta	\N	536	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
541	S	TransfiriendoOISS	\N	536	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
545	S	PendienteEnvioPaisAlta	\N	536	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
547	S	TransfiriendoPais	\N	536	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
550	S	PendienteAprobacion	\N	536	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
552	S	PendienteAprobacionOISS	\N	536	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
554	S	TransfiriendoOISSAprobacion	\N	536	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
558	S	PendienteAprobacionPais	\N	536	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
560	S	TranferiendoAprobacionPais	\N	536	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
563	S	Recibido	\N	536	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
565	E	end1	\N	536	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
566	S	ErrorValidacionOISS	\N	536	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
570	R		\N	569	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
572	S	EdicionAlta	\N	569	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
574	S	TransfiriendoOISS	\N	569	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
578	S	PendienteEnvioPaisAlta	\N	569	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
580	S	TransfiriendoPais	\N	569	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
583	S	PendienteAprobacion	\N	569	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
585	S	PendienteAprobacionOISS	\N	569	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
587	S	TransfiriendoOISSAprobacion	\N	569	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
591	S	PendienteAprobacionPais	\N	569	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
593	S	TranferiendoAprobacionPais	\N	569	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
596	S	Recibido	\N	569	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
598	E	end1	\N	569	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
599	S	ErrorValidacionOISS	\N	569	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
603	R		\N	602	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
605	S	EdicionAlta	\N	602	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
607	S	TransfiriendoOISS	\N	602	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
611	S	PendienteEnvioPaisAlta	\N	602	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
613	S	TransfiriendoPais	\N	602	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
616	S	PendienteAprobacion	\N	602	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
618	S	PendienteAprobacionOISS	\N	602	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
620	S	TransfiriendoOISSAprobacion	\N	602	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
624	S	PendienteAprobacionPais	\N	602	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
626	S	TranferiendoAprobacionPais	\N	602	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
629	S	Recibido	\N	602	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
631	E	end1	\N	602	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
632	S	ErrorValidacionOISS	\N	602	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
636	R		\N	635	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
638	S	EdicionAlta	\N	635	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
640	S	TransfiriendoOISS	\N	635	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
644	S	PendienteEnvioPaisAlta	\N	635	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
646	S	TransfiriendoPais	\N	635	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
649	S	PendienteAprobacion	\N	635	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
651	S	PendienteAprobacionOISS	\N	635	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
653	S	TransfiriendoOISSAprobacion	\N	635	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
657	S	PendienteAprobacionPais	\N	635	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
659	S	TranferiendoAprobacionPais	\N	635	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
662	S	Recibido	\N	635	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
664	E	end1	\N	635	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
665	S	ErrorValidacionOISS	\N	635	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
669	R		\N	668	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
671	S	EdicionAlta	\N	668	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
673	S	TransfiriendoOISS	\N	668	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
677	S	PendienteEnvioPaisAlta	\N	668	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
679	S	TransfiriendoPais	\N	668	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
682	S	PendienteAprobacion	\N	668	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
684	S	PendienteAprobacionOISS	\N	668	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
686	S	TransfiriendoOISSAprobacion	\N	668	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
690	S	PendienteAprobacionPais	\N	668	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
692	S	TranferiendoAprobacionPais	\N	668	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
695	S	Recibido	\N	668	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
697	E	end1	\N	668	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
698	S	ErrorValidacionOISS	\N	668	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
702	R		\N	701	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
704	S	EdicionAlta	\N	701	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
706	S	TransfiriendoOISS	\N	701	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
710	S	PendienteEnvioPaisAlta	\N	701	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
712	S	TransfiriendoPais	\N	701	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
715	S	PendienteAprobacion	\N	701	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
717	S	PendienteAprobacionOISS	\N	701	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
719	S	TransfiriendoOISSAprobacion	\N	701	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
723	S	PendienteAprobacionPais	\N	701	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
725	S	TranferiendoAprobacionPais	\N	701	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
728	S	Recibido	\N	701	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
730	E	end1	\N	701	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
731	S	ErrorValidacionOISS	\N	701	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
735	R		\N	734	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
737	S	EdicionAlta	\N	734	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
739	S	TransfiriendoOISS	\N	734	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
743	S	PendienteEnvioPaisAlta	\N	734	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
745	S	TransfiriendoPais	\N	734	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
748	S	PendienteAprobacion	\N	734	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
750	S	PendienteAprobacionOISS	\N	734	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
752	S	TransfiriendoOISSAprobacion	\N	734	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
756	S	PendienteAprobacionPais	\N	734	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
758	S	TranferiendoAprobacionPais	\N	734	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
761	S	Recibido	\N	734	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
763	E	end1	\N	734	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
764	S	ErrorValidacionOISS	\N	734	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
768	R		\N	767	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
770	S	EdicionAlta	\N	767	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
772	S	TransfiriendoOISS	\N	767	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
776	S	PendienteEnvioPaisAlta	\N	767	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
778	S	TransfiriendoPais	\N	767	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
781	S	PendienteAprobacion	\N	767	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
783	S	PendienteAprobacionOISS	\N	767	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2103	R		\N	2102	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
785	S	TransfiriendoOISSAprobacion	\N	767	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
789	S	PendienteAprobacionPais	\N	767	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
791	S	TranferiendoAprobacionPais	\N	767	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
794	S	Recibido	\N	767	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
796	E	end1	\N	767	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
797	S	ErrorValidacionOISS	\N	767	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
801	R		\N	800	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
803	S	EdicionAlta	\N	800	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
805	S	TransfiriendoOISS	\N	800	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
809	S	PendienteEnvioPaisAlta	\N	800	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
811	S	TransfiriendoPais	\N	800	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
814	S	PendienteAprobacion	\N	800	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
816	S	PendienteAprobacionOISS	\N	800	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
818	S	TransfiriendoOISSAprobacion	\N	800	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
822	S	PendienteAprobacionPais	\N	800	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
824	S	TranferiendoAprobacionPais	\N	800	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
827	S	Recibido	\N	800	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
829	E	end1	\N	800	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
830	S	ErrorValidacionOISS	\N	800	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
834	R		\N	833	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
836	S	EdicionAlta	\N	833	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
838	S	TransfiriendoOISS	\N	833	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
842	S	PendienteEnvioPaisAlta	\N	833	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
844	S	TransfiriendoPais	\N	833	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
847	S	PendienteAprobacion	\N	833	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
849	S	PendienteAprobacionOISS	\N	833	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
851	S	TransfiriendoOISSAprobacion	\N	833	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
855	S	PendienteAprobacionPais	\N	833	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
857	S	TranferiendoAprobacionPais	\N	833	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
860	S	Recibido	\N	833	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
862	E	end1	\N	833	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
863	S	ErrorValidacionOISS	\N	833	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
867	R		\N	866	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
869	S	EdicionAlta	\N	866	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
871	S	TransfiriendoOISS	\N	866	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
875	S	PendienteEnvioPaisAlta	\N	866	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
877	S	TransfiriendoPais	\N	866	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
880	S	PendienteAprobacion	\N	866	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
882	S	PendienteAprobacionOISS	\N	866	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
884	S	TransfiriendoOISSAprobacion	\N	866	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
888	S	PendienteAprobacionPais	\N	866	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
890	S	TranferiendoAprobacionPais	\N	866	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
893	S	Recibido	\N	866	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
895	E	end1	\N	866	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
896	S	ErrorValidacionOISS	\N	866	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
900	R		\N	899	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
902	S	EdicionAlta	\N	899	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
904	S	TransfiriendoOISS	\N	899	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
908	S	PendienteEnvioPaisAlta	\N	899	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
910	S	TransfiriendoPais	\N	899	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
913	S	PendienteAprobacion	\N	899	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
915	S	PendienteAprobacionOISS	\N	899	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
917	S	TransfiriendoOISSAprobacion	\N	899	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
921	S	PendienteAprobacionPais	\N	899	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
923	S	TranferiendoAprobacionPais	\N	899	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
926	S	Recibido	\N	899	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
928	E	end1	\N	899	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
929	S	ErrorValidacionOISS	\N	899	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
937	R		\N	936	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
939	S	EdicionAlta	\N	936	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
941	S	TransfiriendoOISS	\N	936	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
945	S	PendienteEnvioPaisAlta	\N	936	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
947	S	TransfiriendoPais	\N	936	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
950	S	PendienteAprobacion	\N	936	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
952	S	PendienteAprobacionOISS	\N	936	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
954	S	TransfiriendoOISSAprobacion	\N	936	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
958	S	PendienteAprobacionPais	\N	936	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
960	S	TranferiendoAprobacionPais	\N	936	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
963	S	Recibido	\N	936	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
965	E	end1	\N	936	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
966	S	ErrorValidacionOISS	\N	936	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
977	R		\N	976	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
979	S	EdicionAlta	\N	976	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
981	S	TransfiriendoOISS	\N	976	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
985	S	PendienteEnvioPaisAlta	\N	976	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
987	S	TransfiriendoPais	\N	976	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
990	S	PendienteAprobacion	\N	976	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
992	S	PendienteAprobacionOISS	\N	976	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
994	S	TransfiriendoOISSAprobacion	\N	976	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
998	S	PendienteAprobacionPais	\N	976	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1000	S	TranferiendoAprobacionPais	\N	976	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1003	S	Recibido	\N	976	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1005	E	end1	\N	976	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1006	S	ErrorValidacionOISS	\N	976	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1014	R		\N	1013	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1016	S	EdicionAlta	\N	1013	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1018	S	TransfiriendoOISS	\N	1013	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1022	S	PendienteEnvioPaisAlta	\N	1013	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1024	S	TransfiriendoPais	\N	1013	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1027	S	PendienteAprobacion	\N	1013	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1029	S	PendienteAprobacionOISS	\N	1013	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1031	S	TransfiriendoOISSAprobacion	\N	1013	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1035	S	PendienteAprobacionPais	\N	1013	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1037	S	TranferiendoAprobacionPais	\N	1013	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1040	S	Recibido	\N	1013	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1042	E	end1	\N	1013	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1043	S	ErrorValidacionOISS	\N	1013	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1047	R		\N	1046	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1049	S	EdicionAlta	\N	1046	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1051	S	TransfiriendoOISS	\N	1046	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1055	S	PendienteEnvioPaisAlta	\N	1046	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1057	S	TransfiriendoPais	\N	1046	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1060	S	PendienteAprobacion	\N	1046	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1062	S	PendienteAprobacionOISS	\N	1046	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1064	S	TransfiriendoOISSAprobacion	\N	1046	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1068	S	PendienteAprobacionPais	\N	1046	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1070	S	TranferiendoAprobacionPais	\N	1046	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1073	S	Recibido	\N	1046	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1075	E	end1	\N	1046	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1076	S	ErrorValidacionOISS	\N	1046	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1080	R		\N	1079	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1082	S	EdicionAlta	\N	1079	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1084	S	TransfiriendoOISS	\N	1079	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1090	S	TransfiriendoPais	\N	1079	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1088	S	PendienteEnvioPaisAlta	\N	1079	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1093	S	PendienteAprobacion	\N	1079	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1095	S	PendienteAprobacionOISS	\N	1079	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1097	S	TransfiriendoOISSAprobacion	\N	1079	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1101	S	PendienteAprobacionPais	\N	1079	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1103	S	TranferiendoAprobacionPais	\N	1079	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1106	S	Recibido	\N	1079	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1108	E	end1	\N	1079	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1109	S	ErrorValidacionOISS	\N	1079	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1113	R		\N	1112	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1115	S	EdicionAlta	\N	1112	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1117	S	TransfiriendoOISS	\N	1112	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1121	S	PendienteEnvioPaisAlta	\N	1112	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1123	S	TransfiriendoPais	\N	1112	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1126	S	PendienteAprobacion	\N	1112	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1128	S	PendienteAprobacionOISS	\N	1112	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1130	S	TransfiriendoOISSAprobacion	\N	1112	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1134	S	PendienteAprobacionPais	\N	1112	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1136	S	TranferiendoAprobacionPais	\N	1112	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1139	S	Recibido	\N	1112	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1141	E	end1	\N	1112	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1142	S	ErrorValidacionOISS	\N	1112	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1146	R		\N	1145	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1148	S	EdicionAlta	\N	1145	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1150	S	TransfiriendoOISS	\N	1145	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1154	S	PendienteEnvioPaisAlta	\N	1145	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1156	S	TransfiriendoPais	\N	1145	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1159	S	PendienteAprobacion	\N	1145	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1161	S	PendienteAprobacionOISS	\N	1145	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1163	S	TransfiriendoOISSAprobacion	\N	1145	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1167	S	PendienteAprobacionPais	\N	1145	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1169	S	TranferiendoAprobacionPais	\N	1145	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1172	S	Recibido	\N	1145	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1174	E	end1	\N	1145	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1175	S	ErrorValidacionOISS	\N	1145	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1179	R		\N	1178	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1181	S	EdicionAlta	\N	1178	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1183	S	TransfiriendoOISS	\N	1178	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1187	S	PendienteEnvioPaisAlta	\N	1178	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1189	S	TransfiriendoPais	\N	1178	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1192	S	PendienteAprobacion	\N	1178	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1194	S	PendienteAprobacionOISS	\N	1178	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1196	S	TransfiriendoOISSAprobacion	\N	1178	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1200	S	PendienteAprobacionPais	\N	1178	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1202	S	TranferiendoAprobacionPais	\N	1178	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1205	S	Recibido	\N	1178	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1207	E	end1	\N	1178	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1208	S	ErrorValidacionOISS	\N	1178	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1212	R		\N	1211	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1214	S	EdicionAlta	\N	1211	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1216	S	TransfiriendoOISS	\N	1211	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1220	S	PendienteEnvioPaisAlta	\N	1211	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1222	S	TransfiriendoPais	\N	1211	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1225	S	PendienteAprobacion	\N	1211	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1227	S	PendienteAprobacionOISS	\N	1211	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1229	S	TransfiriendoOISSAprobacion	\N	1211	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1233	S	PendienteAprobacionPais	\N	1211	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1235	S	TranferiendoAprobacionPais	\N	1211	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1238	S	Recibido	\N	1211	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1240	E	end1	\N	1211	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1241	S	ErrorValidacionOISS	\N	1211	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1245	R		\N	1244	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1247	S	EdicionAlta	\N	1244	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1249	S	TransfiriendoOISS	\N	1244	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1253	S	PendienteEnvioPaisAlta	\N	1244	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1255	S	TransfiriendoPais	\N	1244	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1258	S	PendienteAprobacion	\N	1244	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1260	S	PendienteAprobacionOISS	\N	1244	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1262	S	TransfiriendoOISSAprobacion	\N	1244	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1266	S	PendienteAprobacionPais	\N	1244	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1268	S	TranferiendoAprobacionPais	\N	1244	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1271	S	Recibido	\N	1244	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1273	E	end1	\N	1244	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1274	S	ErrorValidacionOISS	\N	1244	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1278	R		\N	1277	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2725	E	end1	\N	2696	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2726	S	ErrorValidacionOISS	\N	2696	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1280	S	EdicionAlta	\N	1277	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1282	S	TransfiriendoOISS	\N	1277	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1286	S	PendienteEnvioPaisAlta	\N	1277	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1288	S	TransfiriendoPais	\N	1277	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1291	S	PendienteAprobacion	\N	1277	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1293	S	PendienteAprobacionOISS	\N	1277	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1295	S	TransfiriendoOISSAprobacion	\N	1277	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1299	S	PendienteAprobacionPais	\N	1277	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1301	S	TranferiendoAprobacionPais	\N	1277	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1304	S	Recibido	\N	1277	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1306	E	end1	\N	1277	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1307	S	ErrorValidacionOISS	\N	1277	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1311	R		\N	1310	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1313	S	EdicionAlta	\N	1310	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1315	S	TransfiriendoOISS	\N	1310	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1319	S	PendienteEnvioPaisAlta	\N	1310	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1321	S	TransfiriendoPais	\N	1310	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1324	S	PendienteAprobacion	\N	1310	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1326	S	PendienteAprobacionOISS	\N	1310	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1328	S	TransfiriendoOISSAprobacion	\N	1310	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1332	S	PendienteAprobacionPais	\N	1310	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1334	S	TranferiendoAprobacionPais	\N	1310	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1337	S	Recibido	\N	1310	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1339	E	end1	\N	1310	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1340	S	ErrorValidacionOISS	\N	1310	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1344	R		\N	1343	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1346	S	EdicionAlta	\N	1343	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1348	S	TransfiriendoOISS	\N	1343	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1352	S	PendienteEnvioPaisAlta	\N	1343	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1354	S	TransfiriendoPais	\N	1343	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1357	S	PendienteAprobacion	\N	1343	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1359	S	PendienteAprobacionOISS	\N	1343	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1361	S	TransfiriendoOISSAprobacion	\N	1343	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1365	S	PendienteAprobacionPais	\N	1343	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1367	S	TranferiendoAprobacionPais	\N	1343	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1370	S	Recibido	\N	1343	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1372	E	end1	\N	1343	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1373	S	ErrorValidacionOISS	\N	1343	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1377	R		\N	1376	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1379	S	EdicionAlta	\N	1376	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1381	S	TransfiriendoOISS	\N	1376	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1385	S	PendienteEnvioPaisAlta	\N	1376	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1387	S	TransfiriendoPais	\N	1376	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1390	S	PendienteAprobacion	\N	1376	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1392	S	PendienteAprobacionOISS	\N	1376	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1394	S	TransfiriendoOISSAprobacion	\N	1376	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1398	S	PendienteAprobacionPais	\N	1376	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1400	S	TranferiendoAprobacionPais	\N	1376	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1403	S	Recibido	\N	1376	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1405	E	end1	\N	1376	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1406	S	ErrorValidacionOISS	\N	1376	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1410	R		\N	1409	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1412	S	EdicionAlta	\N	1409	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1414	S	TransfiriendoOISS	\N	1409	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1418	S	PendienteEnvioPaisAlta	\N	1409	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1420	S	TransfiriendoPais	\N	1409	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1423	S	PendienteAprobacion	\N	1409	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1425	S	PendienteAprobacionOISS	\N	1409	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1427	S	TransfiriendoOISSAprobacion	\N	1409	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1431	S	PendienteAprobacionPais	\N	1409	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1433	S	TranferiendoAprobacionPais	\N	1409	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1436	S	Recibido	\N	1409	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1438	E	end1	\N	1409	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1439	S	ErrorValidacionOISS	\N	1409	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1443	R		\N	1442	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1445	S	EdicionAlta	\N	1442	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1447	S	TransfiriendoOISS	\N	1442	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1451	S	PendienteEnvioPaisAlta	\N	1442	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1453	S	TransfiriendoPais	\N	1442	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1456	S	PendienteAprobacion	\N	1442	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1458	S	PendienteAprobacionOISS	\N	1442	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1460	S	TransfiriendoOISSAprobacion	\N	1442	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1464	S	PendienteAprobacionPais	\N	1442	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1466	S	TranferiendoAprobacionPais	\N	1442	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1469	S	Recibido	\N	1442	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1471	E	end1	\N	1442	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1472	S	ErrorValidacionOISS	\N	1442	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1476	R		\N	1475	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1478	S	EdicionAlta	\N	1475	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1480	S	TransfiriendoOISS	\N	1475	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1484	S	PendienteEnvioPaisAlta	\N	1475	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1486	S	TransfiriendoPais	\N	1475	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1489	S	PendienteAprobacion	\N	1475	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1491	S	PendienteAprobacionOISS	\N	1475	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1493	S	TransfiriendoOISSAprobacion	\N	1475	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1497	S	PendienteAprobacionPais	\N	1475	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1499	S	TranferiendoAprobacionPais	\N	1475	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1502	S	Recibido	\N	1475	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1504	E	end1	\N	1475	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1505	S	ErrorValidacionOISS	\N	1475	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1509	R		\N	1508	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1511	S	EdicionAlta	\N	1508	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1513	S	TransfiriendoOISS	\N	1508	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1517	S	PendienteEnvioPaisAlta	\N	1508	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1519	S	TransfiriendoPais	\N	1508	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1522	S	PendienteAprobacion	\N	1508	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1524	S	PendienteAprobacionOISS	\N	1508	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1526	S	TransfiriendoOISSAprobacion	\N	1508	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1530	S	PendienteAprobacionPais	\N	1508	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1532	S	TranferiendoAprobacionPais	\N	1508	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1535	S	Recibido	\N	1508	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1537	E	end1	\N	1508	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1538	S	ErrorValidacionOISS	\N	1508	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1542	R		\N	1541	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1544	S	EdicionAlta	\N	1541	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1546	S	TransfiriendoOISS	\N	1541	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1550	S	PendienteEnvioPaisAlta	\N	1541	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1552	S	TransfiriendoPais	\N	1541	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1555	S	PendienteAprobacion	\N	1541	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1557	S	PendienteAprobacionOISS	\N	1541	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1559	S	TransfiriendoOISSAprobacion	\N	1541	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1563	S	PendienteAprobacionPais	\N	1541	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1565	S	TranferiendoAprobacionPais	\N	1541	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1568	S	Recibido	\N	1541	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1570	E	end1	\N	1541	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1571	S	ErrorValidacionOISS	\N	1541	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1575	R		\N	1574	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1577	S	EdicionAlta	\N	1574	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1579	S	TransfiriendoOISS	\N	1574	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1583	S	PendienteEnvioPaisAlta	\N	1574	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1585	S	TransfiriendoPais	\N	1574	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1588	S	PendienteAprobacion	\N	1574	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1590	S	PendienteAprobacionOISS	\N	1574	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1592	S	TransfiriendoOISSAprobacion	\N	1574	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1596	S	PendienteAprobacionPais	\N	1574	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1598	S	TranferiendoAprobacionPais	\N	1574	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1601	S	Recibido	\N	1574	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1603	E	end1	\N	1574	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1604	S	ErrorValidacionOISS	\N	1574	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1608	R		\N	1607	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1610	S	EdicionAlta	\N	1607	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1612	S	TransfiriendoOISS	\N	1607	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1616	S	PendienteEnvioPaisAlta	\N	1607	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1618	S	TransfiriendoPais	\N	1607	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1621	S	PendienteAprobacion	\N	1607	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1623	S	PendienteAprobacionOISS	\N	1607	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1625	S	TransfiriendoOISSAprobacion	\N	1607	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1629	S	PendienteAprobacionPais	\N	1607	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1631	S	TranferiendoAprobacionPais	\N	1607	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1634	S	Recibido	\N	1607	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1636	E	end1	\N	1607	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1637	S	ErrorValidacionOISS	\N	1607	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1641	R		\N	1640	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1643	S	EdicionAlta	\N	1640	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1645	S	TransfiriendoOISS	\N	1640	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1649	S	PendienteEnvioPaisAlta	\N	1640	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1651	S	TransfiriendoPais	\N	1640	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1654	S	PendienteAprobacion	\N	1640	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1656	S	PendienteAprobacionOISS	\N	1640	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1658	S	TransfiriendoOISSAprobacion	\N	1640	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1662	S	PendienteAprobacionPais	\N	1640	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1664	S	TranferiendoAprobacionPais	\N	1640	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1667	S	Recibido	\N	1640	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1669	E	end1	\N	1640	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1670	S	ErrorValidacionOISS	\N	1640	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1674	R		\N	1673	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1676	S	EdicionAlta	\N	1673	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1678	S	TransfiriendoOISS	\N	1673	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1682	S	PendienteEnvioPaisAlta	\N	1673	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1684	S	TransfiriendoPais	\N	1673	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1687	S	PendienteAprobacion	\N	1673	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1689	S	PendienteAprobacionOISS	\N	1673	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1691	S	TransfiriendoOISSAprobacion	\N	1673	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1695	S	PendienteAprobacionPais	\N	1673	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1697	S	TranferiendoAprobacionPais	\N	1673	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1700	S	Recibido	\N	1673	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1702	E	end1	\N	1673	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1703	S	ErrorValidacionOISS	\N	1673	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1707	R		\N	1706	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1709	S	EdicionAlta	\N	1706	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1711	S	TransfiriendoOISS	\N	1706	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1715	S	PendienteEnvioPaisAlta	\N	1706	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1717	S	TransfiriendoPais	\N	1706	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1720	S	PendienteAprobacion	\N	1706	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1722	S	PendienteAprobacionOISS	\N	1706	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1724	S	TransfiriendoOISSAprobacion	\N	1706	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1728	S	PendienteAprobacionPais	\N	1706	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1730	S	TranferiendoAprobacionPais	\N	1706	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1733	S	Recibido	\N	1706	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1735	E	end1	\N	1706	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1736	S	ErrorValidacionOISS	\N	1706	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1740	R		\N	1739	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1742	S	EdicionAlta	\N	1739	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1744	S	TransfiriendoOISS	\N	1739	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1748	S	PendienteEnvioPaisAlta	\N	1739	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1750	S	TransfiriendoPais	\N	1739	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1753	S	PendienteAprobacion	\N	1739	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1755	S	PendienteAprobacionOISS	\N	1739	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1757	S	TransfiriendoOISSAprobacion	\N	1739	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1761	S	PendienteAprobacionPais	\N	1739	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1763	S	TranferiendoAprobacionPais	\N	1739	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1766	S	Recibido	\N	1739	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1768	E	end1	\N	1739	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1769	S	ErrorValidacionOISS	\N	1739	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1773	R		\N	1772	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1775	S	EdicionAlta	\N	1772	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1777	S	TransfiriendoOISS	\N	1772	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1781	S	PendienteEnvioPaisAlta	\N	1772	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1783	S	TransfiriendoPais	\N	1772	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1786	S	PendienteAprobacion	\N	1772	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1788	S	PendienteAprobacionOISS	\N	1772	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1790	S	TransfiriendoOISSAprobacion	\N	1772	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1794	S	PendienteAprobacionPais	\N	1772	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1796	S	TranferiendoAprobacionPais	\N	1772	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1799	S	Recibido	\N	1772	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1801	E	end1	\N	1772	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1802	S	ErrorValidacionOISS	\N	1772	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1806	R		\N	1805	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1808	S	EdicionAlta	\N	1805	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1810	S	TransfiriendoOISS	\N	1805	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1814	S	PendienteEnvioPaisAlta	\N	1805	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1816	S	TransfiriendoPais	\N	1805	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1819	S	PendienteAprobacion	\N	1805	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1821	S	PendienteAprobacionOISS	\N	1805	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1823	S	TransfiriendoOISSAprobacion	\N	1805	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1827	S	PendienteAprobacionPais	\N	1805	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1829	S	TranferiendoAprobacionPais	\N	1805	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1832	S	Recibido	\N	1805	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1834	E	end1	\N	1805	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1835	S	ErrorValidacionOISS	\N	1805	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1839	R		\N	1838	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1841	S	EdicionAlta	\N	1838	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1843	S	TransfiriendoOISS	\N	1838	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1847	S	PendienteEnvioPaisAlta	\N	1838	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1849	S	TransfiriendoPais	\N	1838	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1852	S	PendienteAprobacion	\N	1838	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1854	S	PendienteAprobacionOISS	\N	1838	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1856	S	TransfiriendoOISSAprobacion	\N	1838	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1860	S	PendienteAprobacionPais	\N	1838	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1862	S	TranferiendoAprobacionPais	\N	1838	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1865	S	Recibido	\N	1838	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1867	E	end1	\N	1838	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1868	S	ErrorValidacionOISS	\N	1838	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1872	R		\N	1871	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1874	S	EdicionAlta	\N	1871	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1876	S	TransfiriendoOISS	\N	1871	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1880	S	PendienteEnvioPaisAlta	\N	1871	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1882	S	TransfiriendoPais	\N	1871	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1885	S	PendienteAprobacion	\N	1871	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1887	S	PendienteAprobacionOISS	\N	1871	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1889	S	TransfiriendoOISSAprobacion	\N	1871	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1893	S	PendienteAprobacionPais	\N	1871	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1895	S	TranferiendoAprobacionPais	\N	1871	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1898	S	Recibido	\N	1871	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1900	E	end1	\N	1871	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1901	S	ErrorValidacionOISS	\N	1871	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1905	R		\N	1904	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1907	S	EdicionAlta	\N	1904	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1909	S	TransfiriendoOISS	\N	1904	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1913	S	PendienteEnvioPaisAlta	\N	1904	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1915	S	TransfiriendoPais	\N	1904	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1918	S	PendienteAprobacion	\N	1904	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1920	S	PendienteAprobacionOISS	\N	1904	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1922	S	TransfiriendoOISSAprobacion	\N	1904	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1926	S	PendienteAprobacionPais	\N	1904	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1928	S	TranferiendoAprobacionPais	\N	1904	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1931	S	Recibido	\N	1904	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1933	E	end1	\N	1904	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1934	S	ErrorValidacionOISS	\N	1904	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1938	R		\N	1937	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1940	S	EdicionAlta	\N	1937	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1942	S	TransfiriendoOISS	\N	1937	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1946	S	PendienteEnvioPaisAlta	\N	1937	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1948	S	TransfiriendoPais	\N	1937	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1951	S	PendienteAprobacion	\N	1937	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1953	S	PendienteAprobacionOISS	\N	1937	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1955	S	TransfiriendoOISSAprobacion	\N	1937	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1959	S	PendienteAprobacionPais	\N	1937	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1961	S	TranferiendoAprobacionPais	\N	1937	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1964	S	Recibido	\N	1937	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1966	E	end1	\N	1937	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
1967	S	ErrorValidacionOISS	\N	1937	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
1971	R		\N	1970	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1973	S	EdicionAlta	\N	1970	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1975	S	TransfiriendoOISS	\N	1970	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
1979	S	PendienteEnvioPaisAlta	\N	1970	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
1981	S	TransfiriendoPais	\N	1970	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
1984	S	PendienteAprobacion	\N	1970	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
1986	S	PendienteAprobacionOISS	\N	1970	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
1988	S	TransfiriendoOISSAprobacion	\N	1970	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
1992	S	PendienteAprobacionPais	\N	1970	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
1994	S	TranferiendoAprobacionPais	\N	1970	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
1997	S	Recibido	\N	1970	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
1999	E	end1	\N	1970	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2000	S	ErrorValidacionOISS	\N	1970	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2004	R		\N	2003	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2006	S	EdicionAlta	\N	2003	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2008	S	TransfiriendoOISS	\N	2003	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2012	S	PendienteEnvioPaisAlta	\N	2003	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2014	S	TransfiriendoPais	\N	2003	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2017	S	PendienteAprobacion	\N	2003	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2019	S	PendienteAprobacionOISS	\N	2003	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2021	S	TransfiriendoOISSAprobacion	\N	2003	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2025	S	PendienteAprobacionPais	\N	2003	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2027	S	TranferiendoAprobacionPais	\N	2003	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2030	S	Recibido	\N	2003	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2032	E	end1	\N	2003	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2033	S	ErrorValidacionOISS	\N	2003	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2037	R		\N	2036	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2039	S	EdicionAlta	\N	2036	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2041	S	TransfiriendoOISS	\N	2036	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2045	S	PendienteEnvioPaisAlta	\N	2036	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2047	S	TransfiriendoPais	\N	2036	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2050	S	PendienteAprobacion	\N	2036	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2052	S	PendienteAprobacionOISS	\N	2036	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2054	S	TransfiriendoOISSAprobacion	\N	2036	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2058	S	PendienteAprobacionPais	\N	2036	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2060	S	TranferiendoAprobacionPais	\N	2036	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2063	S	Recibido	\N	2036	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2065	E	end1	\N	2036	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2066	S	ErrorValidacionOISS	\N	2036	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2070	R		\N	2069	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2072	S	EdicionAlta	\N	2069	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2074	S	TransfiriendoOISS	\N	2069	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2078	S	PendienteEnvioPaisAlta	\N	2069	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2080	S	TransfiriendoPais	\N	2069	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2083	S	PendienteAprobacion	\N	2069	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2085	S	PendienteAprobacionOISS	\N	2069	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2087	S	TransfiriendoOISSAprobacion	\N	2069	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2091	S	PendienteAprobacionPais	\N	2069	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2093	S	TranferiendoAprobacionPais	\N	2069	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2096	S	Recibido	\N	2069	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2098	E	end1	\N	2069	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2099	S	ErrorValidacionOISS	\N	2069	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2105	S	EdicionAlta	\N	2102	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2107	S	TransfiriendoOISS	\N	2102	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2111	S	PendienteEnvioPaisAlta	\N	2102	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2113	S	TransfiriendoPais	\N	2102	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2116	S	PendienteAprobacion	\N	2102	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2118	S	PendienteAprobacionOISS	\N	2102	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2120	S	TransfiriendoOISSAprobacion	\N	2102	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2124	S	PendienteAprobacionPais	\N	2102	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2126	S	TranferiendoAprobacionPais	\N	2102	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2129	S	Recibido	\N	2102	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2131	E	end1	\N	2102	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2132	S	ErrorValidacionOISS	\N	2102	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2136	R		\N	2135	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2138	S	EdicionAlta	\N	2135	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2140	S	TransfiriendoOISS	\N	2135	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2144	S	PendienteEnvioPaisAlta	\N	2135	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2146	S	TransfiriendoPais	\N	2135	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2149	S	PendienteAprobacion	\N	2135	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2151	S	PendienteAprobacionOISS	\N	2135	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2153	S	TransfiriendoOISSAprobacion	\N	2135	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2157	S	PendienteAprobacionPais	\N	2135	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2159	S	TranferiendoAprobacionPais	\N	2135	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2162	S	Recibido	\N	2135	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2164	E	end1	\N	2135	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2165	S	ErrorValidacionOISS	\N	2135	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2169	R		\N	2168	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2171	S	EdicionAlta	\N	2168	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2173	S	TransfiriendoOISS	\N	2168	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2177	S	PendienteEnvioPaisAlta	\N	2168	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2179	S	TransfiriendoPais	\N	2168	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2182	S	PendienteAprobacion	\N	2168	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2184	S	PendienteAprobacionOISS	\N	2168	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2186	S	TransfiriendoOISSAprobacion	\N	2168	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2190	S	PendienteAprobacionPais	\N	2168	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2192	S	TranferiendoAprobacionPais	\N	2168	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2195	S	Recibido	\N	2168	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2197	E	end1	\N	2168	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2198	S	ErrorValidacionOISS	\N	2168	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2202	R		\N	2201	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2204	S	EdicionAlta	\N	2201	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2206	S	TransfiriendoOISS	\N	2201	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2210	S	PendienteEnvioPaisAlta	\N	2201	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2212	S	TransfiriendoPais	\N	2201	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2215	S	PendienteAprobacion	\N	2201	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2217	S	PendienteAprobacionOISS	\N	2201	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2219	S	TransfiriendoOISSAprobacion	\N	2201	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2223	S	PendienteAprobacionPais	\N	2201	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2225	S	TranferiendoAprobacionPais	\N	2201	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2228	S	Recibido	\N	2201	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2230	E	end1	\N	2201	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2231	S	ErrorValidacionOISS	\N	2201	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2235	R		\N	2234	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2237	S	EdicionAlta	\N	2234	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2239	S	TransfiriendoOISS	\N	2234	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2243	S	PendienteEnvioPaisAlta	\N	2234	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2245	S	TransfiriendoPais	\N	2234	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2248	S	PendienteAprobacion	\N	2234	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2250	S	PendienteAprobacionOISS	\N	2234	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2252	S	TransfiriendoOISSAprobacion	\N	2234	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2256	S	PendienteAprobacionPais	\N	2234	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2258	S	TranferiendoAprobacionPais	\N	2234	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2261	S	Recibido	\N	2234	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2263	E	end1	\N	2234	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2264	S	ErrorValidacionOISS	\N	2234	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2268	R		\N	2267	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2270	S	EdicionAlta	\N	2267	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2272	S	TransfiriendoOISS	\N	2267	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2276	S	PendienteEnvioPaisAlta	\N	2267	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2278	S	TransfiriendoPais	\N	2267	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2281	S	PendienteAprobacion	\N	2267	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2283	S	PendienteAprobacionOISS	\N	2267	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2285	S	TransfiriendoOISSAprobacion	\N	2267	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2289	S	PendienteAprobacionPais	\N	2267	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2291	S	TranferiendoAprobacionPais	\N	2267	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2294	S	Recibido	\N	2267	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2296	E	end1	\N	2267	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2297	S	ErrorValidacionOISS	\N	2267	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2301	R		\N	2300	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2303	S	EdicionAlta	\N	2300	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2305	S	TransfiriendoOISS	\N	2300	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2309	S	PendienteEnvioPaisAlta	\N	2300	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2329	E	end1	\N	2300	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2730	R		\N	2729	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2732	S	EdicionAlta	\N	2729	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2734	S	TransfiriendoOISS	\N	2729	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2738	S	PendienteEnvioPaisAlta	\N	2729	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2740	S	TransfiriendoPais	\N	2729	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2743	S	PendienteAprobacion	\N	2729	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2745	S	PendienteAprobacionOISS	\N	2729	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2747	S	TransfiriendoOISSAprobacion	\N	2729	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2751	S	PendienteAprobacionPais	\N	2729	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2753	S	TranferiendoAprobacionPais	\N	2729	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2756	S	Recibido	\N	2729	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2758	E	end1	\N	2729	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2311	S	TransfiriendoPais	\N	2300	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2314	S	PendienteAprobacion	\N	2300	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2316	S	PendienteAprobacionOISS	\N	2300	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2318	S	TransfiriendoOISSAprobacion	\N	2300	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2322	S	PendienteAprobacionPais	\N	2300	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2324	S	TranferiendoAprobacionPais	\N	2300	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2327	S	Recibido	\N	2300	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2330	S	ErrorValidacionOISS	\N	2300	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2334	R		\N	2333	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2336	S	EdicionAlta	\N	2333	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2338	S	TransfiriendoOISS	\N	2333	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2342	S	PendienteEnvioPaisAlta	\N	2333	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2344	S	TransfiriendoPais	\N	2333	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2347	S	PendienteAprobacion	\N	2333	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2349	S	PendienteAprobacionOISS	\N	2333	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2351	S	TransfiriendoOISSAprobacion	\N	2333	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2355	S	PendienteAprobacionPais	\N	2333	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2357	S	TranferiendoAprobacionPais	\N	2333	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2360	S	Recibido	\N	2333	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2362	E	end1	\N	2333	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2363	S	ErrorValidacionOISS	\N	2333	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2367	R		\N	2366	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2369	S	EdicionAlta	\N	2366	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2371	S	TransfiriendoOISS	\N	2366	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2375	S	PendienteEnvioPaisAlta	\N	2366	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2377	S	TransfiriendoPais	\N	2366	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2380	S	PendienteAprobacion	\N	2366	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2382	S	PendienteAprobacionOISS	\N	2366	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2384	S	TransfiriendoOISSAprobacion	\N	2366	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2388	S	PendienteAprobacionPais	\N	2366	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2390	S	TranferiendoAprobacionPais	\N	2366	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2393	S	Recibido	\N	2366	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2395	E	end1	\N	2366	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2396	S	ErrorValidacionOISS	\N	2366	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2400	R		\N	2399	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2402	S	EdicionAlta	\N	2399	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2404	S	TransfiriendoOISS	\N	2399	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2408	S	PendienteEnvioPaisAlta	\N	2399	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2410	S	TransfiriendoPais	\N	2399	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2413	S	PendienteAprobacion	\N	2399	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2415	S	PendienteAprobacionOISS	\N	2399	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2417	S	TransfiriendoOISSAprobacion	\N	2399	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2421	S	PendienteAprobacionPais	\N	2399	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2423	S	TranferiendoAprobacionPais	\N	2399	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2426	S	Recibido	\N	2399	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2428	E	end1	\N	2399	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2429	S	ErrorValidacionOISS	\N	2399	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2433	R		\N	2432	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2435	S	EdicionAlta	\N	2432	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2437	S	TransfiriendoOISS	\N	2432	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2441	S	PendienteEnvioPaisAlta	\N	2432	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2443	S	TransfiriendoPais	\N	2432	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2446	S	PendienteAprobacion	\N	2432	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2448	S	PendienteAprobacionOISS	\N	2432	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2450	S	TransfiriendoOISSAprobacion	\N	2432	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2454	S	PendienteAprobacionPais	\N	2432	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2456	S	TranferiendoAprobacionPais	\N	2432	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2459	S	Recibido	\N	2432	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2461	E	end1	\N	2432	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2462	S	ErrorValidacionOISS	\N	2432	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2466	R		\N	2465	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2468	S	EdicionAlta	\N	2465	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2470	S	TransfiriendoOISS	\N	2465	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2474	S	PendienteEnvioPaisAlta	\N	2465	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2476	S	TransfiriendoPais	\N	2465	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2479	S	PendienteAprobacion	\N	2465	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2481	S	PendienteAprobacionOISS	\N	2465	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2483	S	TransfiriendoOISSAprobacion	\N	2465	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2487	S	PendienteAprobacionPais	\N	2465	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2489	S	TranferiendoAprobacionPais	\N	2465	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2492	S	Recibido	\N	2465	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2494	E	end1	\N	2465	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2495	S	ErrorValidacionOISS	\N	2465	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2499	R		\N	2498	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2501	S	EdicionAlta	\N	2498	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2503	S	TransfiriendoOISS	\N	2498	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2507	S	PendienteEnvioPaisAlta	\N	2498	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2509	S	TransfiriendoPais	\N	2498	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2512	S	PendienteAprobacion	\N	2498	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2514	S	PendienteAprobacionOISS	\N	2498	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2516	S	TransfiriendoOISSAprobacion	\N	2498	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2520	S	PendienteAprobacionPais	\N	2498	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2522	S	TranferiendoAprobacionPais	\N	2498	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2525	S	Recibido	\N	2498	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2527	E	end1	\N	2498	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2528	S	ErrorValidacionOISS	\N	2498	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2532	R		\N	2531	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2534	S	EdicionAlta	\N	2531	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2536	S	TransfiriendoOISS	\N	2531	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2540	S	PendienteEnvioPaisAlta	\N	2531	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2542	S	TransfiriendoPais	\N	2531	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2545	S	PendienteAprobacion	\N	2531	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2547	S	PendienteAprobacionOISS	\N	2531	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2549	S	TransfiriendoOISSAprobacion	\N	2531	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2553	S	PendienteAprobacionPais	\N	2531	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2555	S	TranferiendoAprobacionPais	\N	2531	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2558	S	Recibido	\N	2531	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2560	E	end1	\N	2531	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2561	S	ErrorValidacionOISS	\N	2531	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2565	R		\N	2564	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2567	S	EdicionAlta	\N	2564	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2569	S	TransfiriendoOISS	\N	2564	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2573	S	PendienteEnvioPaisAlta	\N	2564	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2575	S	TransfiriendoPais	\N	2564	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2578	S	PendienteAprobacion	\N	2564	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2580	S	PendienteAprobacionOISS	\N	2564	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2582	S	TransfiriendoOISSAprobacion	\N	2564	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2586	S	PendienteAprobacionPais	\N	2564	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2588	S	TranferiendoAprobacionPais	\N	2564	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2591	S	Recibido	\N	2564	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2593	E	end1	\N	2564	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2594	S	ErrorValidacionOISS	\N	2564	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2598	R		\N	2597	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2600	S	EdicionAlta	\N	2597	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2602	S	TransfiriendoOISS	\N	2597	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2606	S	PendienteEnvioPaisAlta	\N	2597	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2608	S	TransfiriendoPais	\N	2597	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2611	S	PendienteAprobacion	\N	2597	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2613	S	PendienteAprobacionOISS	\N	2597	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2615	S	TransfiriendoOISSAprobacion	\N	2597	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2619	S	PendienteAprobacionPais	\N	2597	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2621	S	TranferiendoAprobacionPais	\N	2597	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2624	S	Recibido	\N	2597	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2626	E	end1	\N	2597	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2627	S	ErrorValidacionOISS	\N	2597	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2631	R		\N	2630	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2633	S	EdicionAlta	\N	2630	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2635	S	TransfiriendoOISS	\N	2630	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2639	S	PendienteEnvioPaisAlta	\N	2630	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2641	S	TransfiriendoPais	\N	2630	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2644	S	PendienteAprobacion	\N	2630	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2646	S	PendienteAprobacionOISS	\N	2630	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2648	S	TransfiriendoOISSAprobacion	\N	2630	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2652	S	PendienteAprobacionPais	\N	2630	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2654	S	TranferiendoAprobacionPais	\N	2630	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2657	S	Recibido	\N	2630	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2659	E	end1	\N	2630	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2660	S	ErrorValidacionOISS	\N	2630	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2664	R		\N	2663	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2666	S	EdicionAlta	\N	2663	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2668	S	TransfiriendoOISS	\N	2663	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2672	S	PendienteEnvioPaisAlta	\N	2663	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2674	S	TransfiriendoPais	\N	2663	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2677	S	PendienteAprobacion	\N	2663	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2679	S	PendienteAprobacionOISS	\N	2663	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2681	S	TransfiriendoOISSAprobacion	\N	2663	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2685	S	PendienteAprobacionPais	\N	2663	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2687	S	TranferiendoAprobacionPais	\N	2663	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2690	S	Recibido	\N	2663	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2692	E	end1	\N	2663	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
2693	S	ErrorValidacionOISS	\N	2663	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
2697	R		\N	2696	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
2699	S	EdicionAlta	\N	2696	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2701	S	TransfiriendoOISS	\N	2696	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
2705	S	PendienteEnvioPaisAlta	\N	2696	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
2707	S	TransfiriendoPais	\N	2696	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2710	S	PendienteAprobacion	\N	2696	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
2712	S	PendienteAprobacionOISS	\N	2696	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
2714	S	TransfiriendoOISSAprobacion	\N	2696	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
2718	S	PendienteAprobacionPais	\N	2696	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
2720	S	TranferiendoAprobacionPais	\N	2696	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
2723	S	Recibido	\N	2696	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10
2759	S	ErrorValidacionOISS	\N	2729	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12
\.


--
-- TOC entry 2141 (class 0 OID 145443)
-- Dependencies: 1603
-- Data for Name: jbpm_pooledactor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_pooledactor (id_, version_, actorid_, swimlaneinstance_) FROM stdin;
\.


--
-- TOC entry 2142 (class 0 OID 145446)
-- Dependencies: 1604
-- Data for Name: jbpm_processdefinition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_processdefinition (id_, class_, name_, description_, version_, isterminationimplicit_, startstate_) FROM stdin;
1	P	AltaEmpadronamiento	\N	1	f	2
42	P	AltaEmpadronamiento	\N	2	f	43
83	P	AltaEmpadronamiento	\N	3	f	84
120	P	AltaEmpadronamiento	\N	4	f	121
153	P	AltaEmpadronamiento	\N	5	f	154
190	P	AltaEmpadronamiento	\N	6	f	191
223	P	AltaEmpadronamiento	\N	7	f	224
260	P	AltaEmpadronamiento	\N	8	f	261
297	P	AltaEmpadronamiento	\N	9	f	298
334	P	AltaEmpadronamiento	\N	10	f	335
367	P	AltaEmpadronamiento	\N	11	f	368
400	P	AltaEmpadronamiento	\N	12	f	401
433	P	AltaEmpadronamiento	\N	13	f	434
470	P	AltaEmpadronamiento	\N	14	f	471
503	P	AltaEmpadronamiento	\N	15	f	504
536	P	AltaEmpadronamiento	\N	16	f	537
569	P	AltaEmpadronamiento	\N	17	f	570
602	P	AltaEmpadronamiento	\N	18	f	603
635	P	AltaEmpadronamiento	\N	19	f	636
668	P	AltaEmpadronamiento	\N	20	f	669
701	P	AltaEmpadronamiento	\N	21	f	702
734	P	AltaEmpadronamiento	\N	22	f	735
767	P	AltaEmpadronamiento	\N	23	f	768
800	P	AltaEmpadronamiento	\N	24	f	801
833	P	AltaEmpadronamiento	\N	25	f	834
866	P	AltaEmpadronamiento	\N	26	f	867
899	P	AltaEmpadronamiento	\N	27	f	900
936	P	AltaEmpadronamiento	\N	28	f	937
976	P	AltaEmpadronamiento	\N	29	f	977
1013	P	AltaEmpadronamiento	\N	30	f	1014
1046	P	AltaEmpadronamiento	\N	31	f	1047
1079	P	AltaEmpadronamiento	\N	32	f	1080
1112	P	AltaEmpadronamiento	\N	33	f	1113
1145	P	AltaEmpadronamiento	\N	34	f	1146
1178	P	AltaEmpadronamiento	\N	35	f	1179
1211	P	AltaEmpadronamiento	\N	36	f	1212
1244	P	AltaEmpadronamiento	\N	37	f	1245
1277	P	AltaEmpadronamiento	\N	38	f	1278
1310	P	AltaEmpadronamiento	\N	39	f	1311
1343	P	AltaEmpadronamiento	\N	40	f	1344
1376	P	AltaEmpadronamiento	\N	41	f	1377
1409	P	AltaEmpadronamiento	\N	42	f	1410
1442	P	AltaEmpadronamiento	\N	43	f	1443
1475	P	AltaEmpadronamiento	\N	44	f	1476
1508	P	AltaEmpadronamiento	\N	45	f	1509
1541	P	AltaEmpadronamiento	\N	46	f	1542
1574	P	AltaEmpadronamiento	\N	47	f	1575
1607	P	AltaEmpadronamiento	\N	48	f	1608
1640	P	AltaEmpadronamiento	\N	49	f	1641
1673	P	AltaEmpadronamiento	\N	50	f	1674
1706	P	AltaEmpadronamiento	\N	51	f	1707
1739	P	AltaEmpadronamiento	\N	52	f	1740
1772	P	AltaEmpadronamiento	\N	53	f	1773
1805	P	AltaEmpadronamiento	\N	54	f	1806
1838	P	AltaEmpadronamiento	\N	55	f	1839
1871	P	AltaEmpadronamiento	\N	56	f	1872
1904	P	AltaEmpadronamiento	\N	57	f	1905
1937	P	AltaEmpadronamiento	\N	58	f	1938
1970	P	AltaEmpadronamiento	\N	59	f	1971
2003	P	AltaEmpadronamiento	\N	60	f	2004
2036	P	AltaEmpadronamiento	\N	61	f	2037
2069	P	AltaEmpadronamiento	\N	62	f	2070
2102	P	AltaEmpadronamiento	\N	63	f	2103
2135	P	AltaEmpadronamiento	\N	64	f	2136
2168	P	AltaEmpadronamiento	\N	65	f	2169
2201	P	AltaEmpadronamiento	\N	66	f	2202
2234	P	AltaEmpadronamiento	\N	67	f	2235
2267	P	AltaEmpadronamiento	\N	68	f	2268
2300	P	AltaEmpadronamiento	\N	69	f	2301
2333	P	AltaEmpadronamiento	\N	70	f	2334
2366	P	AltaEmpadronamiento	\N	71	f	2367
2399	P	AltaEmpadronamiento	\N	72	f	2400
2432	P	AltaEmpadronamiento	\N	73	f	2433
2465	P	AltaEmpadronamiento	\N	74	f	2466
2498	P	AltaEmpadronamiento	\N	75	f	2499
2531	P	AltaEmpadronamiento	\N	76	f	2532
2564	P	AltaEmpadronamiento	\N	77	f	2565
2597	P	AltaEmpadronamiento	\N	78	f	2598
2630	P	AltaEmpadronamiento	\N	79	f	2631
2663	P	AltaEmpadronamiento	\N	80	f	2664
2696	P	AltaEmpadronamiento	\N	81	f	2697
2729	P	AltaEmpadronamiento	\N	82	f	2730
\.


--
-- TOC entry 2143 (class 0 OID 145452)
-- Dependencies: 1605
-- Data for Name: jbpm_processinstance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_processinstance (id_, version_, key_, start_, end_, issuspended_, processdefinition_, roottoken_, superprocesstoken_) FROM stdin;
256	1	\N	2013-10-17 16:18:50.587	\N	f	223	257	\N
330	1	\N	2013-10-17 16:40:27.2	\N	f	297	331	\N
\.


--
-- TOC entry 2144 (class 0 OID 145455)
-- Dependencies: 1606
-- Data for Name: jbpm_runtimeaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_runtimeaction (id_, version_, eventtype_, type_, graphelement_, processinstance_, action_, processinstanceindex_) FROM stdin;
\.


--
-- TOC entry 2145 (class 0 OID 145458)
-- Dependencies: 1607
-- Data for Name: jbpm_swimlane; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_swimlane (id_, name_, actoridexpression_, pooledactorsexpression_, assignmentdelegation_, taskmgmtdefinition_) FROM stdin;
\.


--
-- TOC entry 2146 (class 0 OID 145464)
-- Dependencies: 1608
-- Data for Name: jbpm_swimlaneinstance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_swimlaneinstance (id_, version_, name_, actorid_, swimlane_, taskmgmtinstance_) FROM stdin;
\.


--
-- TOC entry 2147 (class 0 OID 145470)
-- Dependencies: 1609
-- Data for Name: jbpm_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_task (id_, name_, description_, processdefinition_, isblocking_, issignalling_, condition_, duedate_, priority_, actoridexpression_, pooledactorsexpression_, taskmgmtdefinition_, tasknode_, startstate_, assignmentdelegation_, swimlane_, taskcontroller_) FROM stdin;
\.


--
-- TOC entry 2148 (class 0 OID 145476)
-- Dependencies: 1610
-- Data for Name: jbpm_taskactorpool; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_taskactorpool (taskinstance_, pooledactor_) FROM stdin;
\.


--
-- TOC entry 2149 (class 0 OID 145479)
-- Dependencies: 1611
-- Data for Name: jbpm_taskcontroller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_taskcontroller (id_, taskcontrollerdelegation_) FROM stdin;
\.


--
-- TOC entry 2150 (class 0 OID 145482)
-- Dependencies: 1612
-- Data for Name: jbpm_taskinstance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_taskinstance (id_, class_, version_, name_, description_, actorid_, create_, start_, end_, duedate_, priority_, iscancelled_, issuspended_, isopen_, issignalling_, isblocking_, task_, token_, procinst_, swimlaninstance_, taskmgmtinstance_) FROM stdin;
\.


--
-- TOC entry 2151 (class 0 OID 145488)
-- Dependencies: 1613
-- Data for Name: jbpm_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_token (id_, version_, name_, start_, end_, nodeenter_, nextlogindex_, isabletoreactivateparent_, isterminationimplicit_, issuspended_, lock_, node_, processinstance_, parent_, subprocessinstance_) FROM stdin;
257	2	\N	2013-10-17 16:18:50.553	\N	2013-10-17 16:18:50.709	3	t	f	f	\N	226	256	\N	\N
331	2	\N	2013-10-17 16:40:26.735	\N	2013-10-17 16:40:28.272	3	t	f	f	\N	300	330	\N	\N
\.


--
-- TOC entry 2152 (class 0 OID 145494)
-- Dependencies: 1614
-- Data for Name: jbpm_tokenvariablemap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_tokenvariablemap (id_, version_, token_, contextinstance_) FROM stdin;
\.


--
-- TOC entry 2153 (class 0 OID 145497)
-- Dependencies: 1615
-- Data for Name: jbpm_transition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_transition (id_, name_, description_, processdefinition_, from_, to_, condition_, fromindex_) FROM stdin;
773		\N	767	772	770	\N	0
641		\N	635	640	638	\N	0
476		\N	470	475	473	\N	0
483	tr2	\N	470	481	479	\N	1
340		\N	334	339	337	\N	0
347	tr2	\N	334	345	343	\N	1
229		\N	223	228	226	\N	0
236	tr2	\N	223	234	232	\N	1
243	tr3	\N	223	241	239	\N	1
3		\N	1	2	4	\N	0
5	tr2	\N	1	4	6	\N	0
7		\N	1	6	4	\N	0
8	tr2	\N	1	6	10	\N	1
9	tr3	\N	1	6	31	\N	2
11		\N	1	10	12	\N	0
13		\N	1	12	15	\N	0
14	tr2	\N	1	12	10	\N	1
16		\N	1	15	17	\N	0
18		\N	1	17	19	\N	0
20		\N	1	19	23	\N	0
21	tr3	\N	1	19	17	\N	1
22	tr2	\N	1	19	31	\N	2
24		\N	1	23	25	\N	0
26		\N	1	25	28	\N	0
27	tr2	\N	1	25	23	\N	1
29		\N	1	28	30	\N	0
85		\N	83	84	86	\N	0
87	tr2	\N	83	86	88	\N	0
89		\N	83	88	86	\N	0
90	tr2	\N	83	88	92	\N	1
91	tr3	\N	83	88	113	\N	2
93		\N	83	92	94	\N	0
95		\N	83	94	97	\N	0
96	tr2	\N	83	94	92	\N	1
98		\N	83	97	99	\N	0
100		\N	83	99	101	\N	0
102		\N	83	101	105	\N	0
103	tr3	\N	83	101	99	\N	1
104	tr2	\N	83	101	113	\N	2
106		\N	83	105	107	\N	0
108		\N	83	107	110	\N	0
109	tr2	\N	83	107	105	\N	1
111		\N	83	110	112	\N	0
155		\N	153	154	156	\N	0
157	tr2	\N	153	156	158	\N	0
159		\N	153	158	156	\N	0
160	tr2	\N	153	158	162	\N	1
161	tr3	\N	153	158	183	\N	2
163		\N	153	162	164	\N	0
165		\N	153	164	167	\N	0
166	tr2	\N	153	164	162	\N	1
168		\N	153	167	169	\N	0
170		\N	153	169	171	\N	0
172		\N	153	171	175	\N	0
173	tr3	\N	153	171	169	\N	1
174	tr2	\N	153	171	183	\N	2
44		\N	42	43	45	\N	0
46	tr2	\N	42	45	47	\N	0
48		\N	42	47	45	\N	0
49	tr2	\N	42	47	51	\N	1
50	tr3	\N	42	47	72	\N	2
52		\N	42	51	53	\N	0
54		\N	42	53	56	\N	0
55	tr2	\N	42	53	51	\N	1
57		\N	42	56	58	\N	0
59		\N	42	58	60	\N	0
61		\N	42	60	64	\N	0
62	tr3	\N	42	60	58	\N	1
63	tr2	\N	42	60	72	\N	2
65		\N	42	64	66	\N	0
67		\N	42	66	69	\N	0
68	tr2	\N	42	66	64	\N	1
70		\N	42	69	71	\N	0
176		\N	153	175	177	\N	0
178		\N	153	177	180	\N	0
179	tr2	\N	153	177	175	\N	1
181		\N	153	180	182	\N	0
122		\N	120	121	123	\N	0
124	tr2	\N	120	123	125	\N	0
126		\N	120	125	123	\N	0
127	tr2	\N	120	125	129	\N	1
128	tr3	\N	120	125	150	\N	2
130		\N	120	129	131	\N	0
132		\N	120	131	134	\N	0
133	tr2	\N	120	131	129	\N	1
135		\N	120	134	136	\N	0
137		\N	120	136	138	\N	0
139		\N	120	138	142	\N	0
140	tr3	\N	120	138	136	\N	1
141	tr2	\N	120	138	150	\N	2
143		\N	120	142	144	\N	0
145		\N	120	144	147	\N	0
146	tr2	\N	120	144	142	\N	1
148		\N	120	147	149	\N	0
192		\N	190	191	193	\N	0
194	tr2	\N	190	193	195	\N	0
196		\N	190	195	193	\N	0
197	tr2	\N	190	195	199	\N	1
198	tr3	\N	190	195	220	\N	2
200		\N	190	199	201	\N	0
202		\N	190	201	204	\N	0
203	tr2	\N	190	201	199	\N	1
216	tr2	\N	190	214	212	\N	1
205		\N	190	204	206	\N	0
207		\N	190	206	208	\N	0
209		\N	190	208	212	\N	0
210	tr3	\N	190	208	206	\N	1
211	tr2	\N	190	208	220	\N	2
213		\N	190	212	214	\N	0
215		\N	190	214	217	\N	0
218		\N	190	217	219	\N	0
942		\N	936	941	939	\N	0
780	tr2	\N	767	778	776	\N	1
648	tr2	\N	635	646	644	\N	1
472		\N	470	471	473	\N	0
490	tr3	\N	470	488	486	\N	1
496	tr2	\N	470	494	492	\N	1
225		\N	223	224	226	\N	0
227	tr2	\N	223	226	228	\N	0
230	tr2	\N	223	228	232	\N	1
231	tr3	\N	223	228	253	\N	2
233		\N	223	232	234	\N	0
235		\N	223	234	237	\N	0
238		\N	223	237	239	\N	0
240		\N	223	239	241	\N	0
242		\N	223	241	245	\N	0
244	tr2	\N	223	241	253	\N	2
246		\N	223	245	247	\N	0
248		\N	223	247	250	\N	0
249	tr2	\N	223	247	245	\N	1
251		\N	223	250	252	\N	0
336		\N	334	335	337	\N	0
338	tr2	\N	334	337	339	\N	0
341	tr2	\N	334	339	343	\N	1
342	tr3	\N	334	339	364	\N	2
344		\N	334	343	345	\N	0
346		\N	334	345	348	\N	0
349		\N	334	348	350	\N	0
351		\N	334	350	352	\N	0
353		\N	334	352	356	\N	0
354	tr3	\N	334	352	350	\N	1
355	tr2	\N	334	352	364	\N	2
357		\N	334	356	358	\N	0
359		\N	334	358	361	\N	0
360	tr2	\N	334	358	356	\N	1
362		\N	334	361	363	\N	0
262		\N	260	261	263	\N	0
264	tr2	\N	260	263	265	\N	0
266		\N	260	265	263	\N	0
267	tr2	\N	260	265	269	\N	1
268	tr3	\N	260	265	290	\N	2
270		\N	260	269	271	\N	0
272		\N	260	271	274	\N	0
273	tr2	\N	260	271	269	\N	1
275		\N	260	274	276	\N	0
277		\N	260	276	278	\N	0
279		\N	260	278	282	\N	0
280	tr3	\N	260	278	276	\N	1
281	tr2	\N	260	278	290	\N	2
283		\N	260	282	284	\N	0
285		\N	260	284	287	\N	0
286	tr2	\N	260	284	282	\N	1
288		\N	260	287	289	\N	0
369		\N	367	368	370	\N	0
371	tr2	\N	367	370	372	\N	0
373		\N	367	372	370	\N	0
374	tr2	\N	367	372	376	\N	1
375	tr3	\N	367	372	397	\N	2
377		\N	367	376	378	\N	0
379		\N	367	378	381	\N	0
380	tr2	\N	367	378	376	\N	1
382		\N	367	381	383	\N	0
384		\N	367	383	385	\N	0
386		\N	367	385	389	\N	0
299		\N	297	298	300	\N	0
301	tr2	\N	297	300	302	\N	0
303		\N	297	302	300	\N	0
304	tr2	\N	297	302	306	\N	1
305	tr3	\N	297	302	327	\N	2
307		\N	297	306	308	\N	0
309		\N	297	308	311	\N	0
310	tr2	\N	297	308	306	\N	1
312		\N	297	311	313	\N	0
314		\N	297	313	315	\N	0
316		\N	297	315	319	\N	0
317	tr3	\N	297	315	313	\N	1
318	tr2	\N	297	315	327	\N	2
320		\N	297	319	321	\N	0
322		\N	297	321	324	\N	0
323	tr2	\N	297	321	319	\N	1
325		\N	297	324	326	\N	0
387	tr3	\N	367	385	383	\N	1
388	tr2	\N	367	385	397	\N	2
390		\N	367	389	391	\N	0
392		\N	367	391	394	\N	0
393	tr2	\N	367	391	389	\N	1
395		\N	367	394	396	\N	0
402		\N	400	401	403	\N	0
404	tr2	\N	400	403	405	\N	0
406		\N	400	405	403	\N	0
407	tr2	\N	400	405	409	\N	1
408	tr3	\N	400	405	430	\N	2
410		\N	400	409	411	\N	0
412		\N	400	411	414	\N	0
413	tr2	\N	400	411	409	\N	1
426	tr2	\N	400	424	422	\N	1
949	tr2	\N	936	947	945	\N	1
415		\N	400	414	416	\N	0
417		\N	400	416	418	\N	0
419		\N	400	418	422	\N	0
420	tr3	\N	400	418	416	\N	1
421	tr2	\N	400	418	430	\N	2
423		\N	400	422	424	\N	0
425		\N	400	424	427	\N	0
428		\N	400	427	429	\N	0
474	tr2	\N	470	473	475	\N	0
477	tr2	\N	470	475	479	\N	1
478	tr3	\N	470	475	500	\N	2
480		\N	470	479	481	\N	0
482		\N	470	481	484	\N	0
485		\N	470	484	486	\N	0
487		\N	470	486	488	\N	0
489		\N	470	488	492	\N	0
491	tr2	\N	470	488	500	\N	2
493		\N	470	492	494	\N	0
495		\N	470	494	497	\N	0
498		\N	470	497	499	\N	0
769		\N	767	768	770	\N	0
771	tr2	\N	767	770	772	\N	0
774	tr2	\N	767	772	776	\N	1
775	tr3	\N	767	772	797	\N	2
787	tr3	\N	767	785	783	\N	1
793	tr2	\N	767	791	789	\N	1
637		\N	635	636	638	\N	0
639	tr2	\N	635	638	640	\N	0
642	tr2	\N	635	640	644	\N	1
643	tr3	\N	635	640	665	\N	2
661	tr2	\N	635	659	657	\N	1
435		\N	433	434	436	\N	0
437	tr2	\N	433	436	438	\N	0
439		\N	433	438	436	\N	0
440	tr2	\N	433	438	442	\N	1
441	tr3	\N	433	438	463	\N	2
443		\N	433	442	444	\N	0
445		\N	433	444	447	\N	0
446	tr2	\N	433	444	442	\N	1
448		\N	433	447	449	\N	0
450		\N	433	449	451	\N	0
452		\N	433	451	455	\N	0
453	tr3	\N	433	451	449	\N	1
454	tr2	\N	433	451	463	\N	2
456		\N	433	455	457	\N	0
458		\N	433	457	460	\N	0
459	tr2	\N	433	457	455	\N	1
461		\N	433	460	462	\N	0
663		\N	635	662	664	\N	0
505		\N	503	504	506	\N	0
507	tr2	\N	503	506	508	\N	0
509		\N	503	508	506	\N	0
510	tr2	\N	503	508	512	\N	1
511	tr3	\N	503	508	533	\N	2
513		\N	503	512	514	\N	0
515		\N	503	514	517	\N	0
516	tr2	\N	503	514	512	\N	1
518		\N	503	517	519	\N	0
520		\N	503	519	521	\N	0
522		\N	503	521	525	\N	0
523	tr3	\N	503	521	519	\N	1
524	tr2	\N	503	521	533	\N	2
526		\N	503	525	527	\N	0
528		\N	503	527	530	\N	0
529	tr2	\N	503	527	525	\N	1
531		\N	503	530	532	\N	0
538		\N	536	537	539	\N	0
540	tr2	\N	536	539	541	\N	0
542		\N	536	541	539	\N	0
543	tr2	\N	536	541	545	\N	1
544	tr3	\N	536	541	566	\N	2
546		\N	536	545	547	\N	0
548		\N	536	547	550	\N	0
549	tr2	\N	536	547	545	\N	1
551		\N	536	550	552	\N	0
553		\N	536	552	554	\N	0
555		\N	536	554	558	\N	0
556	tr3	\N	536	554	552	\N	1
557	tr2	\N	536	554	566	\N	2
559		\N	536	558	560	\N	0
561		\N	536	560	563	\N	0
562	tr2	\N	536	560	558	\N	1
564		\N	536	563	565	\N	0
571		\N	569	570	572	\N	0
573	tr2	\N	569	572	574	\N	0
575		\N	569	574	572	\N	0
576	tr2	\N	569	574	578	\N	1
577	tr3	\N	569	574	599	\N	2
579		\N	569	578	580	\N	0
581		\N	569	580	583	\N	0
582	tr2	\N	569	580	578	\N	1
584		\N	569	583	585	\N	0
586		\N	569	585	587	\N	0
588		\N	569	587	591	\N	0
589	tr3	\N	569	587	585	\N	1
590	tr2	\N	569	587	599	\N	2
592		\N	569	591	593	\N	0
594		\N	569	593	596	\N	0
595	tr2	\N	569	593	591	\N	1
645		\N	635	644	646	\N	0
647		\N	635	646	649	\N	0
597		\N	569	596	598	\N	0
650		\N	635	649	651	\N	0
652		\N	635	651	653	\N	0
654		\N	635	653	657	\N	0
655	tr3	\N	635	653	651	\N	1
656	tr2	\N	635	653	665	\N	2
658		\N	635	657	659	\N	0
660		\N	635	659	662	\N	0
777		\N	767	776	778	\N	0
779		\N	767	778	781	\N	0
782		\N	767	781	783	\N	0
784		\N	767	783	785	\N	0
786		\N	767	785	789	\N	0
788	tr2	\N	767	785	797	\N	2
790		\N	767	789	791	\N	0
792		\N	767	791	794	\N	0
795		\N	767	794	796	\N	0
956	tr3	\N	936	954	952	\N	1
962	tr2	\N	936	960	958	\N	1
1158	tr2	\N	1145	1156	1154	\N	1
1165	tr3	\N	1145	1163	1161	\N	1
604		\N	602	603	605	\N	0
606	tr2	\N	602	605	607	\N	0
608		\N	602	607	605	\N	0
609	tr2	\N	602	607	611	\N	1
610	tr3	\N	602	607	632	\N	2
612		\N	602	611	613	\N	0
614		\N	602	613	616	\N	0
615	tr2	\N	602	613	611	\N	1
617		\N	602	616	618	\N	0
619		\N	602	618	620	\N	0
621		\N	602	620	624	\N	0
622	tr3	\N	602	620	618	\N	1
623	tr2	\N	602	620	632	\N	2
625		\N	602	624	626	\N	0
627		\N	602	626	629	\N	0
628	tr2	\N	602	626	624	\N	1
630		\N	602	629	631	\N	0
670		\N	668	669	671	\N	0
672	tr2	\N	668	671	673	\N	0
674		\N	668	673	671	\N	0
675	tr2	\N	668	673	677	\N	1
676	tr3	\N	668	673	698	\N	2
678		\N	668	677	679	\N	0
680		\N	668	679	682	\N	0
681	tr2	\N	668	679	677	\N	1
683		\N	668	682	684	\N	0
685		\N	668	684	686	\N	0
687		\N	668	686	690	\N	0
688	tr3	\N	668	686	684	\N	1
689	tr2	\N	668	686	698	\N	2
691		\N	668	690	692	\N	0
693		\N	668	692	695	\N	0
694	tr2	\N	668	692	690	\N	1
696		\N	668	695	697	\N	0
802		\N	800	801	803	\N	0
804	tr2	\N	800	803	805	\N	0
806		\N	800	805	803	\N	0
807	tr2	\N	800	805	809	\N	1
808	tr3	\N	800	805	830	\N	2
810		\N	800	809	811	\N	0
812		\N	800	811	814	\N	0
813	tr2	\N	800	811	809	\N	1
820	tr3	\N	800	818	816	\N	1
826	tr2	\N	800	824	822	\N	1
703		\N	701	702	704	\N	0
705	tr2	\N	701	704	706	\N	0
707		\N	701	706	704	\N	0
708	tr2	\N	701	706	710	\N	1
709	tr3	\N	701	706	731	\N	2
711		\N	701	710	712	\N	0
713		\N	701	712	715	\N	0
714	tr2	\N	701	712	710	\N	1
716		\N	701	715	717	\N	0
718		\N	701	717	719	\N	0
720		\N	701	719	723	\N	0
721	tr3	\N	701	719	717	\N	1
722	tr2	\N	701	719	731	\N	2
724		\N	701	723	725	\N	0
726		\N	701	725	728	\N	0
727	tr2	\N	701	725	723	\N	1
729		\N	701	728	730	\N	0
736		\N	734	735	737	\N	0
738	tr2	\N	734	737	739	\N	0
740		\N	734	739	737	\N	0
741	tr2	\N	734	739	743	\N	1
742	tr3	\N	734	739	764	\N	2
744		\N	734	743	745	\N	0
746		\N	734	745	748	\N	0
747	tr2	\N	734	745	743	\N	1
749		\N	734	748	750	\N	0
751		\N	734	750	752	\N	0
753		\N	734	752	756	\N	0
754	tr3	\N	734	752	750	\N	1
755	tr2	\N	734	752	764	\N	2
757		\N	734	756	758	\N	0
759		\N	734	758	761	\N	0
760	tr2	\N	734	758	756	\N	1
762		\N	734	761	763	\N	0
815		\N	800	814	816	\N	0
817		\N	800	816	818	\N	0
819		\N	800	818	822	\N	0
821	tr2	\N	800	818	830	\N	2
823		\N	800	822	824	\N	0
825		\N	800	824	827	\N	0
828		\N	800	827	829	\N	0
944	tr3	\N	936	941	966	\N	2
957	tr2	\N	936	954	966	\N	2
938		\N	936	937	939	\N	0
940	tr2	\N	936	939	941	\N	0
943	tr2	\N	936	941	945	\N	1
946		\N	936	945	947	\N	0
948		\N	936	947	950	\N	0
951		\N	936	950	952	\N	0
953		\N	936	952	954	\N	0
955		\N	936	954	958	\N	0
1147		\N	1145	1146	1148	\N	0
959		\N	936	958	960	\N	0
1171	tr2	\N	1145	1169	1167	\N	1
961		\N	936	960	963	\N	0
964		\N	936	963	965	\N	0
835		\N	833	834	836	\N	0
837	tr2	\N	833	836	838	\N	0
839		\N	833	838	836	\N	0
840	tr2	\N	833	838	842	\N	1
841	tr3	\N	833	838	863	\N	2
843		\N	833	842	844	\N	0
845		\N	833	844	847	\N	0
846	tr2	\N	833	844	842	\N	1
848		\N	833	847	849	\N	0
850		\N	833	849	851	\N	0
852		\N	833	851	855	\N	0
853	tr3	\N	833	851	849	\N	1
854	tr2	\N	833	851	863	\N	2
856		\N	833	855	857	\N	0
858		\N	833	857	860	\N	0
859	tr2	\N	833	857	855	\N	1
861		\N	833	860	862	\N	0
978		\N	976	977	979	\N	0
980	tr2	\N	976	979	981	\N	0
982		\N	976	981	979	\N	0
983	tr2	\N	976	981	985	\N	1
984	tr3	\N	976	981	1006	\N	2
986		\N	976	985	987	\N	0
988		\N	976	987	990	\N	0
989	tr2	\N	976	987	985	\N	1
991		\N	976	990	992	\N	0
993		\N	976	992	994	\N	0
995		\N	976	994	998	\N	0
868		\N	866	867	869	\N	0
870	tr2	\N	866	869	871	\N	0
872		\N	866	871	869	\N	0
873	tr2	\N	866	871	875	\N	1
874	tr3	\N	866	871	896	\N	2
876		\N	866	875	877	\N	0
878		\N	866	877	880	\N	0
879	tr2	\N	866	877	875	\N	1
881		\N	866	880	882	\N	0
883		\N	866	882	884	\N	0
885		\N	866	884	888	\N	0
886	tr3	\N	866	884	882	\N	1
887	tr2	\N	866	884	896	\N	2
889		\N	866	888	890	\N	0
891		\N	866	890	893	\N	0
892	tr2	\N	866	890	888	\N	1
894		\N	866	893	895	\N	0
996	tr3	\N	976	994	992	\N	1
997	tr2	\N	976	994	1006	\N	2
999		\N	976	998	1000	\N	0
1001		\N	976	1000	1003	\N	0
1002	tr2	\N	976	1000	998	\N	1
1004		\N	976	1003	1005	\N	0
1015		\N	1013	1014	1016	\N	0
901		\N	899	900	902	\N	0
903	tr2	\N	899	902	904	\N	0
905		\N	899	904	902	\N	0
906	tr2	\N	899	904	908	\N	1
907	tr3	\N	899	904	929	\N	2
909		\N	899	908	910	\N	0
911		\N	899	910	913	\N	0
912	tr2	\N	899	910	908	\N	1
914		\N	899	913	915	\N	0
916		\N	899	915	917	\N	0
918		\N	899	917	921	\N	0
919	tr3	\N	899	917	915	\N	1
920	tr2	\N	899	917	929	\N	2
922		\N	899	921	923	\N	0
924		\N	899	923	926	\N	0
925	tr2	\N	899	923	921	\N	1
927		\N	899	926	928	\N	0
1017	tr2	\N	1013	1016	1018	\N	0
1019		\N	1013	1018	1016	\N	0
1020	tr2	\N	1013	1018	1022	\N	1
1021	tr3	\N	1013	1018	1043	\N	2
1023		\N	1013	1022	1024	\N	0
1025		\N	1013	1024	1027	\N	0
1026	tr2	\N	1013	1024	1022	\N	1
1039	tr2	\N	1013	1037	1035	\N	1
1028		\N	1013	1027	1029	\N	0
1030		\N	1013	1029	1031	\N	0
1032		\N	1013	1031	1035	\N	0
1033	tr3	\N	1013	1031	1029	\N	1
1034	tr2	\N	1013	1031	1043	\N	2
1036		\N	1013	1035	1037	\N	0
1038		\N	1013	1037	1040	\N	0
1041		\N	1013	1040	1042	\N	0
1149	tr2	\N	1145	1148	1150	\N	0
1151		\N	1145	1150	1148	\N	0
1152	tr2	\N	1145	1150	1154	\N	1
1153	tr3	\N	1145	1150	1175	\N	2
1155		\N	1145	1154	1156	\N	0
1157		\N	1145	1156	1159	\N	0
1160		\N	1145	1159	1161	\N	0
1162		\N	1145	1161	1163	\N	0
1164		\N	1145	1163	1167	\N	0
1166	tr2	\N	1145	1163	1175	\N	2
1168		\N	1145	1167	1169	\N	0
1170		\N	1145	1169	1172	\N	0
1173		\N	1145	1172	1174	\N	0
1048		\N	1046	1047	1049	\N	0
1050	tr2	\N	1046	1049	1051	\N	0
1052		\N	1046	1051	1049	\N	0
1053	tr2	\N	1046	1051	1055	\N	1
1054	tr3	\N	1046	1051	1076	\N	2
1056		\N	1046	1055	1057	\N	0
1058		\N	1046	1057	1060	\N	0
1059	tr2	\N	1046	1057	1055	\N	1
1061		\N	1046	1060	1062	\N	0
1063		\N	1046	1062	1064	\N	0
1065		\N	1046	1064	1068	\N	0
1066	tr3	\N	1046	1064	1062	\N	1
1067	tr2	\N	1046	1064	1076	\N	2
1069		\N	1046	1068	1070	\N	0
1071		\N	1046	1070	1073	\N	0
1072	tr2	\N	1046	1070	1068	\N	1
1074		\N	1046	1073	1075	\N	0
1180		\N	1178	1179	1181	\N	0
1182	tr2	\N	1178	1181	1183	\N	0
1184		\N	1178	1183	1181	\N	0
1185	tr2	\N	1178	1183	1187	\N	1
1186	tr3	\N	1178	1183	1208	\N	2
1188		\N	1178	1187	1189	\N	0
1190		\N	1178	1189	1192	\N	0
1191	tr2	\N	1178	1189	1187	\N	1
1193		\N	1178	1192	1194	\N	0
1195		\N	1178	1194	1196	\N	0
1197		\N	1178	1196	1200	\N	0
1198	tr3	\N	1178	1196	1194	\N	1
1199	tr2	\N	1178	1196	1208	\N	2
1201		\N	1178	1200	1202	\N	0
1203		\N	1178	1202	1205	\N	0
1204	tr2	\N	1178	1202	1200	\N	1
1206		\N	1178	1205	1207	\N	0
1081		\N	1079	1080	1082	\N	0
1083	tr2	\N	1079	1082	1084	\N	0
1085		\N	1079	1084	1082	\N	0
1086	tr2	\N	1079	1084	1088	\N	1
1087	tr3	\N	1079	1084	1109	\N	2
1089		\N	1079	1088	1090	\N	0
1091		\N	1079	1090	1093	\N	0
1092	tr2	\N	1079	1090	1088	\N	1
1094		\N	1079	1093	1095	\N	0
1096		\N	1079	1095	1097	\N	0
1098		\N	1079	1097	1101	\N	0
1099	tr3	\N	1079	1097	1095	\N	1
1100	tr2	\N	1079	1097	1109	\N	2
1102		\N	1079	1101	1103	\N	0
1104		\N	1079	1103	1106	\N	0
1105	tr2	\N	1079	1103	1101	\N	1
1107		\N	1079	1106	1108	\N	0
1213		\N	1211	1212	1214	\N	0
1215	tr2	\N	1211	1214	1216	\N	0
1217		\N	1211	1216	1214	\N	0
1218	tr2	\N	1211	1216	1220	\N	1
1219	tr3	\N	1211	1216	1241	\N	2
1221		\N	1211	1220	1222	\N	0
1224	tr2	\N	1211	1222	1220	\N	1
1231	tr3	\N	1211	1229	1227	\N	1
1114		\N	1112	1113	1115	\N	0
1116	tr2	\N	1112	1115	1117	\N	0
1118		\N	1112	1117	1115	\N	0
1119	tr2	\N	1112	1117	1121	\N	1
1120	tr3	\N	1112	1117	1142	\N	2
1122		\N	1112	1121	1123	\N	0
1124		\N	1112	1123	1126	\N	0
1125	tr2	\N	1112	1123	1121	\N	1
1127		\N	1112	1126	1128	\N	0
1129		\N	1112	1128	1130	\N	0
1131		\N	1112	1130	1134	\N	0
1132	tr3	\N	1112	1130	1128	\N	1
1133	tr2	\N	1112	1130	1142	\N	2
1135		\N	1112	1134	1136	\N	0
1137		\N	1112	1136	1139	\N	0
1138	tr2	\N	1112	1136	1134	\N	1
1140		\N	1112	1139	1141	\N	0
1237	tr2	\N	1211	1235	1233	\N	1
1223		\N	1211	1222	1225	\N	0
1226		\N	1211	1225	1227	\N	0
1228		\N	1211	1227	1229	\N	0
1230		\N	1211	1229	1233	\N	0
1232	tr2	\N	1211	1229	1241	\N	2
1234		\N	1211	1233	1235	\N	0
1236		\N	1211	1235	1238	\N	0
1239		\N	1211	1238	1240	\N	0
1246		\N	1244	1245	1247	\N	0
1248	tr2	\N	1244	1247	1249	\N	0
1250		\N	1244	1249	1247	\N	0
1251	tr2	\N	1244	1249	1253	\N	1
1252	tr3	\N	1244	1249	1274	\N	2
1254		\N	1244	1253	1255	\N	0
1256		\N	1244	1255	1258	\N	0
1257	tr2	\N	1244	1255	1253	\N	1
1259		\N	1244	1258	1260	\N	0
1261		\N	1244	1260	1262	\N	0
1263		\N	1244	1262	1266	\N	0
1264	tr3	\N	1244	1262	1260	\N	1
1265	tr2	\N	1244	1262	1274	\N	2
1267		\N	1244	1266	1268	\N	0
1269		\N	1244	1268	1271	\N	0
1270	tr2	\N	1244	1268	1266	\N	1
1272		\N	1244	1271	1273	\N	0
2471		\N	2465	2470	2468	\N	0
2075		\N	2069	2074	2072	\N	0
1778		\N	1772	1777	1775	\N	0
1785	tr2	\N	1772	1783	1781	\N	1
1514		\N	1508	1513	1511	\N	0
1521	tr2	\N	1508	1519	1517	\N	1
1279		\N	1277	1278	1280	\N	0
1283		\N	1277	1282	1280	\N	0
1290	tr2	\N	1277	1288	1286	\N	1
1297	tr3	\N	1277	1295	1293	\N	1
1303	tr2	\N	1277	1301	1299	\N	1
2478	tr2	\N	2465	2476	2474	\N	1
2082	tr2	\N	2069	2080	2078	\N	1
1774		\N	1772	1773	1775	\N	0
1792	tr3	\N	1772	1790	1788	\N	1
1281	tr2	\N	1277	1280	1282	\N	0
1284	tr2	\N	1277	1282	1286	\N	1
1285	tr3	\N	1277	1282	1307	\N	2
1287		\N	1277	1286	1288	\N	0
1289		\N	1277	1288	1291	\N	0
1292		\N	1277	1291	1293	\N	0
1294		\N	1277	1293	1295	\N	0
1296		\N	1277	1295	1299	\N	0
1298	tr2	\N	1277	1295	1307	\N	2
1300		\N	1277	1299	1301	\N	0
1302		\N	1277	1301	1304	\N	0
1305		\N	1277	1304	1306	\N	0
1798	tr2	\N	1772	1796	1794	\N	1
1510		\N	1508	1509	1511	\N	0
1512	tr2	\N	1508	1511	1513	\N	0
1534	tr2	\N	1508	1532	1530	\N	1
1312		\N	1310	1311	1313	\N	0
1314	tr2	\N	1310	1313	1315	\N	0
1316		\N	1310	1315	1313	\N	0
1317	tr2	\N	1310	1315	1319	\N	1
1318	tr3	\N	1310	1315	1340	\N	2
1320		\N	1310	1319	1321	\N	0
1322		\N	1310	1321	1324	\N	0
1323	tr2	\N	1310	1321	1319	\N	1
1325		\N	1310	1324	1326	\N	0
1327		\N	1310	1326	1328	\N	0
1329		\N	1310	1328	1332	\N	0
1330	tr3	\N	1310	1328	1326	\N	1
1331	tr2	\N	1310	1328	1340	\N	2
1333		\N	1310	1332	1334	\N	0
1335		\N	1310	1334	1337	\N	0
1336	tr2	\N	1310	1334	1332	\N	1
1338		\N	1310	1337	1339	\N	0
1345		\N	1343	1344	1346	\N	0
1347	tr2	\N	1343	1346	1348	\N	0
1349		\N	1343	1348	1346	\N	0
1350	tr2	\N	1343	1348	1352	\N	1
1351	tr3	\N	1343	1348	1373	\N	2
1353		\N	1343	1352	1354	\N	0
1355		\N	1343	1354	1357	\N	0
1356	tr2	\N	1343	1354	1352	\N	1
1358		\N	1343	1357	1359	\N	0
1360		\N	1343	1359	1361	\N	0
1362		\N	1343	1361	1365	\N	0
1363	tr3	\N	1343	1361	1359	\N	1
1364	tr2	\N	1343	1361	1373	\N	2
1366		\N	1343	1365	1367	\N	0
1368		\N	1343	1367	1370	\N	0
1369	tr2	\N	1343	1367	1365	\N	1
1371		\N	1343	1370	1372	\N	0
1378		\N	1376	1377	1379	\N	0
1380	tr2	\N	1376	1379	1381	\N	0
1382		\N	1376	1381	1379	\N	0
1383	tr2	\N	1376	1381	1385	\N	1
1384	tr3	\N	1376	1381	1406	\N	2
1386		\N	1376	1385	1387	\N	0
1388		\N	1376	1387	1390	\N	0
1389	tr2	\N	1376	1387	1385	\N	1
1391		\N	1376	1390	1392	\N	0
1393		\N	1376	1392	1394	\N	0
1395		\N	1376	1394	1398	\N	0
1396	tr3	\N	1376	1394	1392	\N	1
1397	tr2	\N	1376	1394	1406	\N	2
1399		\N	1376	1398	1400	\N	0
1401		\N	1376	1400	1403	\N	0
1402	tr2	\N	1376	1400	1398	\N	1
1404		\N	1376	1403	1405	\N	0
1411		\N	1409	1410	1412	\N	0
1413	tr2	\N	1409	1412	1414	\N	0
1415		\N	1409	1414	1412	\N	0
1416	tr2	\N	1409	1414	1418	\N	1
1417	tr3	\N	1409	1414	1439	\N	2
1419		\N	1409	1418	1420	\N	0
1421		\N	1409	1420	1423	\N	0
1422	tr2	\N	1409	1420	1418	\N	1
1424		\N	1409	1423	1425	\N	0
1426		\N	1409	1425	1427	\N	0
1428		\N	1409	1427	1431	\N	0
1429	tr3	\N	1409	1427	1425	\N	1
1430	tr2	\N	1409	1427	1439	\N	2
1432		\N	1409	1431	1433	\N	0
1434		\N	1409	1433	1436	\N	0
1435	tr2	\N	1409	1433	1431	\N	1
1437		\N	1409	1436	1438	\N	0
1444		\N	1442	1443	1445	\N	0
1446	tr2	\N	1442	1445	1447	\N	0
1448		\N	1442	1447	1445	\N	0
1449	tr2	\N	1442	1447	1451	\N	1
1450	tr3	\N	1442	1447	1472	\N	2
1452		\N	1442	1451	1453	\N	0
1454		\N	1442	1453	1456	\N	0
1455	tr2	\N	1442	1453	1451	\N	1
1468	tr2	\N	1442	1466	1464	\N	1
1457		\N	1442	1456	1458	\N	0
1459		\N	1442	1458	1460	\N	0
1461		\N	1442	1460	1464	\N	0
1462	tr3	\N	1442	1460	1458	\N	1
1463	tr2	\N	1442	1460	1472	\N	2
1465		\N	1442	1464	1466	\N	0
1467		\N	1442	1466	1469	\N	0
1470		\N	1442	1469	1471	\N	0
1515	tr2	\N	1508	1513	1517	\N	1
1516	tr3	\N	1508	1513	1538	\N	2
1518		\N	1508	1517	1519	\N	0
1520		\N	1508	1519	1522	\N	0
1523		\N	1508	1522	1524	\N	0
1525		\N	1508	1524	1526	\N	0
1527		\N	1508	1526	1530	\N	0
1528	tr3	\N	1508	1526	1524	\N	1
1529	tr2	\N	1508	1526	1538	\N	2
1531		\N	1508	1530	1532	\N	0
1533		\N	1508	1532	1535	\N	0
1536		\N	1508	1535	1537	\N	0
2485	tr3	\N	2465	2483	2481	\N	1
2071		\N	2069	2070	2072	\N	0
2073	tr2	\N	2069	2072	2074	\N	0
2095	tr2	\N	2069	2093	2091	\N	1
1477		\N	1475	1476	1478	\N	0
1479	tr2	\N	1475	1478	1480	\N	0
1481		\N	1475	1480	1478	\N	0
1482	tr2	\N	1475	1480	1484	\N	1
1483	tr3	\N	1475	1480	1505	\N	2
1485		\N	1475	1484	1486	\N	0
1487		\N	1475	1486	1489	\N	0
1488	tr2	\N	1475	1486	1484	\N	1
1490		\N	1475	1489	1491	\N	0
1492		\N	1475	1491	1493	\N	0
1494		\N	1475	1493	1497	\N	0
1495	tr3	\N	1475	1493	1491	\N	1
1496	tr2	\N	1475	1493	1505	\N	2
1498		\N	1475	1497	1499	\N	0
1500		\N	1475	1499	1502	\N	0
1501	tr2	\N	1475	1499	1497	\N	1
1503		\N	1475	1502	1504	\N	0
1543		\N	1541	1542	1544	\N	0
1545	tr2	\N	1541	1544	1546	\N	0
1547		\N	1541	1546	1544	\N	0
1548	tr2	\N	1541	1546	1550	\N	1
1549	tr3	\N	1541	1546	1571	\N	2
1551		\N	1541	1550	1552	\N	0
1553		\N	1541	1552	1555	\N	0
1554	tr2	\N	1541	1552	1550	\N	1
1556		\N	1541	1555	1557	\N	0
1558		\N	1541	1557	1559	\N	0
1560		\N	1541	1559	1563	\N	0
1561	tr3	\N	1541	1559	1557	\N	1
1562	tr2	\N	1541	1559	1571	\N	2
1564		\N	1541	1563	1565	\N	0
1566		\N	1541	1565	1568	\N	0
1567	tr2	\N	1541	1565	1563	\N	1
1569		\N	1541	1568	1570	\N	0
1576		\N	1574	1575	1577	\N	0
1578	tr2	\N	1574	1577	1579	\N	0
1580		\N	1574	1579	1577	\N	0
1581	tr2	\N	1574	1579	1583	\N	1
1582	tr3	\N	1574	1579	1604	\N	2
1584		\N	1574	1583	1585	\N	0
1586		\N	1574	1585	1588	\N	0
1587	tr2	\N	1574	1585	1583	\N	1
1589		\N	1574	1588	1590	\N	0
1591		\N	1574	1590	1592	\N	0
1593		\N	1574	1592	1596	\N	0
1594	tr3	\N	1574	1592	1590	\N	1
1595	tr2	\N	1574	1592	1604	\N	2
1597		\N	1574	1596	1598	\N	0
1599		\N	1574	1598	1601	\N	0
1600	tr2	\N	1574	1598	1596	\N	1
1602		\N	1574	1601	1603	\N	0
1609		\N	1607	1608	1610	\N	0
1611	tr2	\N	1607	1610	1612	\N	0
1613		\N	1607	1612	1610	\N	0
1614	tr2	\N	1607	1612	1616	\N	1
1615	tr3	\N	1607	1612	1637	\N	2
1617		\N	1607	1616	1618	\N	0
1619		\N	1607	1618	1621	\N	0
1620	tr2	\N	1607	1618	1616	\N	1
1622		\N	1607	1621	1623	\N	0
1624		\N	1607	1623	1625	\N	0
1626		\N	1607	1625	1629	\N	0
1627	tr3	\N	1607	1625	1623	\N	1
1628	tr2	\N	1607	1625	1637	\N	2
1630		\N	1607	1629	1631	\N	0
1632		\N	1607	1631	1634	\N	0
1633	tr2	\N	1607	1631	1629	\N	1
1635		\N	1607	1634	1636	\N	0
1642		\N	1640	1641	1643	\N	0
1644	tr2	\N	1640	1643	1645	\N	0
1646		\N	1640	1645	1643	\N	0
1647	tr2	\N	1640	1645	1649	\N	1
1653	tr2	\N	1640	1651	1649	\N	1
1660	tr3	\N	1640	1658	1656	\N	1
1666	tr2	\N	1640	1664	1662	\N	1
1776	tr2	\N	1772	1775	1777	\N	0
1779	tr2	\N	1772	1777	1781	\N	1
1780	tr3	\N	1772	1777	1802	\N	2
1782		\N	1772	1781	1783	\N	0
1784		\N	1772	1783	1786	\N	0
1787		\N	1772	1786	1788	\N	0
1648	tr3	\N	1640	1645	1670	\N	2
1650		\N	1640	1649	1651	\N	0
1652		\N	1640	1651	1654	\N	0
1655		\N	1640	1654	1656	\N	0
1657		\N	1640	1656	1658	\N	0
1659		\N	1640	1658	1662	\N	0
1661	tr2	\N	1640	1658	1670	\N	2
1663		\N	1640	1662	1664	\N	0
1665		\N	1640	1664	1667	\N	0
1668		\N	1640	1667	1669	\N	0
1789		\N	1772	1788	1790	\N	0
1791		\N	1772	1790	1794	\N	0
1793	tr2	\N	1772	1790	1802	\N	2
1795		\N	1772	1794	1796	\N	0
1797		\N	1772	1796	1799	\N	0
1800		\N	1772	1799	1801	\N	0
2467		\N	2465	2466	2468	\N	0
2491	tr2	\N	2465	2489	2487	\N	1
1675		\N	1673	1674	1676	\N	0
1677	tr2	\N	1673	1676	1678	\N	0
1679		\N	1673	1678	1676	\N	0
1680	tr2	\N	1673	1678	1682	\N	1
1681	tr3	\N	1673	1678	1703	\N	2
1683		\N	1673	1682	1684	\N	0
1685		\N	1673	1684	1687	\N	0
1686	tr2	\N	1673	1684	1682	\N	1
1688		\N	1673	1687	1689	\N	0
1690		\N	1673	1689	1691	\N	0
1692		\N	1673	1691	1695	\N	0
1693	tr3	\N	1673	1691	1689	\N	1
1694	tr2	\N	1673	1691	1703	\N	2
1696		\N	1673	1695	1697	\N	0
1698		\N	1673	1697	1700	\N	0
1699	tr2	\N	1673	1697	1695	\N	1
1701		\N	1673	1700	1702	\N	0
1840		\N	1838	1839	1841	\N	0
1842	tr2	\N	1838	1841	1843	\N	0
1844		\N	1838	1843	1841	\N	0
1845	tr2	\N	1838	1843	1847	\N	1
1846	tr3	\N	1838	1843	1868	\N	2
1848		\N	1838	1847	1849	\N	0
1850		\N	1838	1849	1852	\N	0
1851	tr2	\N	1838	1849	1847	\N	1
1853		\N	1838	1852	1854	\N	0
1855		\N	1838	1854	1856	\N	0
1857		\N	1838	1856	1860	\N	0
1858	tr3	\N	1838	1856	1854	\N	1
1859	tr2	\N	1838	1856	1868	\N	2
1861		\N	1838	1860	1862	\N	0
1863		\N	1838	1862	1865	\N	0
1864	tr2	\N	1838	1862	1860	\N	1
1866		\N	1838	1865	1867	\N	0
1708		\N	1706	1707	1709	\N	0
1710	tr2	\N	1706	1709	1711	\N	0
1712		\N	1706	1711	1709	\N	0
1713	tr2	\N	1706	1711	1715	\N	1
1714	tr3	\N	1706	1711	1736	\N	2
1716		\N	1706	1715	1717	\N	0
1718		\N	1706	1717	1720	\N	0
1719	tr2	\N	1706	1717	1715	\N	1
1721		\N	1706	1720	1722	\N	0
1723		\N	1706	1722	1724	\N	0
1725		\N	1706	1724	1728	\N	0
1726	tr3	\N	1706	1724	1722	\N	1
1727	tr2	\N	1706	1724	1736	\N	2
1729		\N	1706	1728	1730	\N	0
1731		\N	1706	1730	1733	\N	0
1732	tr2	\N	1706	1730	1728	\N	1
1734		\N	1706	1733	1735	\N	0
1939		\N	1937	1938	1940	\N	0
1941	tr2	\N	1937	1940	1942	\N	0
1943		\N	1937	1942	1940	\N	0
1944	tr2	\N	1937	1942	1946	\N	1
1945	tr3	\N	1937	1942	1967	\N	2
1947		\N	1937	1946	1948	\N	0
1949		\N	1937	1948	1951	\N	0
1950	tr2	\N	1937	1948	1946	\N	1
1963	tr2	\N	1937	1961	1959	\N	1
1741		\N	1739	1740	1742	\N	0
1743	tr2	\N	1739	1742	1744	\N	0
1745		\N	1739	1744	1742	\N	0
1746	tr2	\N	1739	1744	1748	\N	1
1747	tr3	\N	1739	1744	1769	\N	2
1749		\N	1739	1748	1750	\N	0
1751		\N	1739	1750	1753	\N	0
1752	tr2	\N	1739	1750	1748	\N	1
1754		\N	1739	1753	1755	\N	0
1756		\N	1739	1755	1757	\N	0
1758		\N	1739	1757	1761	\N	0
1759	tr3	\N	1739	1757	1755	\N	1
1760	tr2	\N	1739	1757	1769	\N	2
1762		\N	1739	1761	1763	\N	0
1764		\N	1739	1763	1766	\N	0
2076	tr2	\N	2069	2074	2078	\N	1
2077	tr3	\N	2069	2074	2099	\N	2
1765	tr2	\N	1739	1763	1761	\N	1
1767		\N	1739	1766	1768	\N	0
2079		\N	2069	2078	2080	\N	0
2081		\N	2069	2080	2083	\N	0
2084		\N	2069	2083	2085	\N	0
2086		\N	2069	2085	2087	\N	0
2088		\N	2069	2087	2091	\N	0
2089	tr3	\N	2069	2087	2085	\N	1
2090	tr2	\N	2069	2087	2099	\N	2
2092		\N	2069	2091	2093	\N	0
1807		\N	1805	1806	1808	\N	0
1809	tr2	\N	1805	1808	1810	\N	0
1811		\N	1805	1810	1808	\N	0
1812	tr2	\N	1805	1810	1814	\N	1
1813	tr3	\N	1805	1810	1835	\N	2
1815		\N	1805	1814	1816	\N	0
1817		\N	1805	1816	1819	\N	0
1818	tr2	\N	1805	1816	1814	\N	1
1820		\N	1805	1819	1821	\N	0
1822		\N	1805	1821	1823	\N	0
1824		\N	1805	1823	1827	\N	0
1825	tr3	\N	1805	1823	1821	\N	1
1826	tr2	\N	1805	1823	1835	\N	2
1828		\N	1805	1827	1829	\N	0
1830		\N	1805	1829	1832	\N	0
1831	tr2	\N	1805	1829	1827	\N	1
1833		\N	1805	1832	1834	\N	0
1873		\N	1871	1872	1874	\N	0
1875	tr2	\N	1871	1874	1876	\N	0
1877		\N	1871	1876	1874	\N	0
1878	tr2	\N	1871	1876	1880	\N	1
1879	tr3	\N	1871	1876	1901	\N	2
1881		\N	1871	1880	1882	\N	0
1883		\N	1871	1882	1885	\N	0
1884	tr2	\N	1871	1882	1880	\N	1
1886		\N	1871	1885	1887	\N	0
1888		\N	1871	1887	1889	\N	0
1890		\N	1871	1889	1893	\N	0
1891	tr3	\N	1871	1889	1887	\N	1
1892	tr2	\N	1871	1889	1901	\N	2
1894		\N	1871	1893	1895	\N	0
1896		\N	1871	1895	1898	\N	0
1897	tr2	\N	1871	1895	1893	\N	1
1899		\N	1871	1898	1900	\N	0
1906		\N	1904	1905	1907	\N	0
1908	tr2	\N	1904	1907	1909	\N	0
1910		\N	1904	1909	1907	\N	0
1911	tr2	\N	1904	1909	1913	\N	1
1912	tr3	\N	1904	1909	1934	\N	2
1914		\N	1904	1913	1915	\N	0
1916		\N	1904	1915	1918	\N	0
1917	tr2	\N	1904	1915	1913	\N	1
1919		\N	1904	1918	1920	\N	0
1921		\N	1904	1920	1922	\N	0
1923		\N	1904	1922	1926	\N	0
1924	tr3	\N	1904	1922	1920	\N	1
1925	tr2	\N	1904	1922	1934	\N	2
1927		\N	1904	1926	1928	\N	0
1929		\N	1904	1928	1931	\N	0
1930	tr2	\N	1904	1928	1926	\N	1
1932		\N	1904	1931	1933	\N	0
1952		\N	1937	1951	1953	\N	0
1954		\N	1937	1953	1955	\N	0
1956		\N	1937	1955	1959	\N	0
1957	tr3	\N	1937	1955	1953	\N	1
1958	tr2	\N	1937	1955	1967	\N	2
1960		\N	1937	1959	1961	\N	0
1962		\N	1937	1961	1964	\N	0
1965		\N	1937	1964	1966	\N	0
1972		\N	1970	1971	1973	\N	0
1974	tr2	\N	1970	1973	1975	\N	0
1976		\N	1970	1975	1973	\N	0
1977	tr2	\N	1970	1975	1979	\N	1
1978	tr3	\N	1970	1975	2000	\N	2
1980		\N	1970	1979	1981	\N	0
1982		\N	1970	1981	1984	\N	0
1983	tr2	\N	1970	1981	1979	\N	1
1985		\N	1970	1984	1986	\N	0
1987		\N	1970	1986	1988	\N	0
1989		\N	1970	1988	1992	\N	0
1990	tr3	\N	1970	1988	1986	\N	1
1991	tr2	\N	1970	1988	2000	\N	2
1993		\N	1970	1992	1994	\N	0
1995		\N	1970	1994	1997	\N	0
1996	tr2	\N	1970	1994	1992	\N	1
1998		\N	1970	1997	1999	\N	0
2005		\N	2003	2004	2006	\N	0
2007	tr2	\N	2003	2006	2008	\N	0
2009		\N	2003	2008	2006	\N	0
2010	tr2	\N	2003	2008	2012	\N	1
2011	tr3	\N	2003	2008	2033	\N	2
2013		\N	2003	2012	2014	\N	0
2015		\N	2003	2014	2017	\N	0
2016	tr2	\N	2003	2014	2012	\N	1
2018		\N	2003	2017	2019	\N	0
2020		\N	2003	2019	2021	\N	0
2022		\N	2003	2021	2025	\N	0
2094		\N	2069	2093	2096	\N	0
2097		\N	2069	2096	2098	\N	0
2023	tr3	\N	2003	2021	2019	\N	1
2024	tr2	\N	2003	2021	2033	\N	2
2026		\N	2003	2025	2027	\N	0
2028		\N	2003	2027	2030	\N	0
2029	tr2	\N	2003	2027	2025	\N	1
2031		\N	2003	2030	2032	\N	0
2469	tr2	\N	2465	2468	2470	\N	0
2472	tr2	\N	2465	2470	2474	\N	1
2473	tr3	\N	2465	2470	2495	\N	2
2475		\N	2465	2474	2476	\N	0
2477		\N	2465	2476	2479	\N	0
2480		\N	2465	2479	2481	\N	0
2482		\N	2465	2481	2483	\N	0
2493		\N	2465	2492	2494	\N	0
2104		\N	2102	2103	2105	\N	0
2106	tr2	\N	2102	2105	2107	\N	0
2108		\N	2102	2107	2105	\N	0
2038		\N	2036	2037	2039	\N	0
2040	tr2	\N	2036	2039	2041	\N	0
2042		\N	2036	2041	2039	\N	0
2043	tr2	\N	2036	2041	2045	\N	1
2044	tr3	\N	2036	2041	2066	\N	2
2046		\N	2036	2045	2047	\N	0
2048		\N	2036	2047	2050	\N	0
2049	tr2	\N	2036	2047	2045	\N	1
2051		\N	2036	2050	2052	\N	0
2053		\N	2036	2052	2054	\N	0
2055		\N	2036	2054	2058	\N	0
2056	tr3	\N	2036	2054	2052	\N	1
2057	tr2	\N	2036	2054	2066	\N	2
2059		\N	2036	2058	2060	\N	0
2061		\N	2036	2060	2063	\N	0
2062	tr2	\N	2036	2060	2058	\N	1
2064		\N	2036	2063	2065	\N	0
2109	tr2	\N	2102	2107	2111	\N	1
2110	tr3	\N	2102	2107	2132	\N	2
2112		\N	2102	2111	2113	\N	0
2114		\N	2102	2113	2116	\N	0
2115	tr2	\N	2102	2113	2111	\N	1
2117		\N	2102	2116	2118	\N	0
2119		\N	2102	2118	2120	\N	0
2121		\N	2102	2120	2124	\N	0
2122	tr3	\N	2102	2120	2118	\N	1
2123	tr2	\N	2102	2120	2132	\N	2
2125		\N	2102	2124	2126	\N	0
2127		\N	2102	2126	2129	\N	0
2128	tr2	\N	2102	2126	2124	\N	1
2130		\N	2102	2129	2131	\N	0
2137		\N	2135	2136	2138	\N	0
2139	tr2	\N	2135	2138	2140	\N	0
2141		\N	2135	2140	2138	\N	0
2142	tr2	\N	2135	2140	2144	\N	1
2143	tr3	\N	2135	2140	2165	\N	2
2145		\N	2135	2144	2146	\N	0
2147		\N	2135	2146	2149	\N	0
2148	tr2	\N	2135	2146	2144	\N	1
2150		\N	2135	2149	2151	\N	0
2152		\N	2135	2151	2153	\N	0
2154		\N	2135	2153	2157	\N	0
2155	tr3	\N	2135	2153	2151	\N	1
2156	tr2	\N	2135	2153	2165	\N	2
2158		\N	2135	2157	2159	\N	0
2160		\N	2135	2159	2162	\N	0
2161	tr2	\N	2135	2159	2157	\N	1
2163		\N	2135	2162	2164	\N	0
2170		\N	2168	2169	2171	\N	0
2172	tr2	\N	2168	2171	2173	\N	0
2174		\N	2168	2173	2171	\N	0
2175	tr2	\N	2168	2173	2177	\N	1
2176	tr3	\N	2168	2173	2198	\N	2
2178		\N	2168	2177	2179	\N	0
2180		\N	2168	2179	2182	\N	0
2181	tr2	\N	2168	2179	2177	\N	1
2183		\N	2168	2182	2184	\N	0
2185		\N	2168	2184	2186	\N	0
2187		\N	2168	2186	2190	\N	0
2188	tr3	\N	2168	2186	2184	\N	1
2189	tr2	\N	2168	2186	2198	\N	2
2191		\N	2168	2190	2192	\N	0
2193		\N	2168	2192	2195	\N	0
2194	tr2	\N	2168	2192	2190	\N	1
2196		\N	2168	2195	2197	\N	0
2203		\N	2201	2202	2204	\N	0
2205	tr2	\N	2201	2204	2206	\N	0
2207		\N	2201	2206	2204	\N	0
2208	tr2	\N	2201	2206	2210	\N	1
2209	tr3	\N	2201	2206	2231	\N	2
2211		\N	2201	2210	2212	\N	0
2213		\N	2201	2212	2215	\N	0
2214	tr2	\N	2201	2212	2210	\N	1
2216		\N	2201	2215	2217	\N	0
2218		\N	2201	2217	2219	\N	0
2220		\N	2201	2219	2223	\N	0
2221	tr3	\N	2201	2219	2217	\N	1
2227	tr2	\N	2201	2225	2223	\N	1
2229		\N	2201	2228	2230	\N	0
2222	tr2	\N	2201	2219	2231	\N	2
2224		\N	2201	2223	2225	\N	0
2226		\N	2201	2225	2228	\N	0
2484		\N	2465	2483	2487	\N	0
2486	tr2	\N	2465	2483	2495	\N	2
2488		\N	2465	2487	2489	\N	0
2490		\N	2465	2489	2492	\N	0
2236		\N	2234	2235	2237	\N	0
2238	tr2	\N	2234	2237	2239	\N	0
2240		\N	2234	2239	2237	\N	0
2241	tr2	\N	2234	2239	2243	\N	1
2242	tr3	\N	2234	2239	2264	\N	2
2244		\N	2234	2243	2245	\N	0
2246		\N	2234	2245	2248	\N	0
2247	tr2	\N	2234	2245	2243	\N	1
2249		\N	2234	2248	2250	\N	0
2251		\N	2234	2250	2252	\N	0
2253		\N	2234	2252	2256	\N	0
2254	tr3	\N	2234	2252	2250	\N	1
2255	tr2	\N	2234	2252	2264	\N	2
2257		\N	2234	2256	2258	\N	0
2259		\N	2234	2258	2261	\N	0
2260	tr2	\N	2234	2258	2256	\N	1
2262		\N	2234	2261	2263	\N	0
2269		\N	2267	2268	2270	\N	0
2271	tr2	\N	2267	2270	2272	\N	0
2273		\N	2267	2272	2270	\N	0
2274	tr2	\N	2267	2272	2276	\N	1
2275	tr3	\N	2267	2272	2297	\N	2
2277		\N	2267	2276	2278	\N	0
2279		\N	2267	2278	2281	\N	0
2280	tr2	\N	2267	2278	2276	\N	1
2282		\N	2267	2281	2283	\N	0
2284		\N	2267	2283	2285	\N	0
2286		\N	2267	2285	2289	\N	0
2287	tr3	\N	2267	2285	2283	\N	1
2288	tr2	\N	2267	2285	2297	\N	2
2290		\N	2267	2289	2291	\N	0
2292		\N	2267	2291	2294	\N	0
2293	tr2	\N	2267	2291	2289	\N	1
2295		\N	2267	2294	2296	\N	0
2302		\N	2300	2301	2303	\N	0
2304	tr2	\N	2300	2303	2305	\N	0
2306		\N	2300	2305	2303	\N	0
2307	tr2	\N	2300	2305	2309	\N	1
2308	tr3	\N	2300	2305	2330	\N	2
2310		\N	2300	2309	2311	\N	0
2312		\N	2300	2311	2314	\N	0
2313	tr2	\N	2300	2311	2309	\N	1
2315		\N	2300	2314	2316	\N	0
2317		\N	2300	2316	2318	\N	0
2319		\N	2300	2318	2322	\N	0
2320	tr3	\N	2300	2318	2316	\N	1
2321	tr2	\N	2300	2318	2330	\N	2
2323		\N	2300	2322	2324	\N	0
2325		\N	2300	2324	2327	\N	0
2326	tr2	\N	2300	2324	2322	\N	1
2328		\N	2300	2327	2329	\N	0
2335		\N	2333	2334	2336	\N	0
2337	tr2	\N	2333	2336	2338	\N	0
2339		\N	2333	2338	2336	\N	0
2340	tr2	\N	2333	2338	2342	\N	1
2341	tr3	\N	2333	2338	2363	\N	2
2343		\N	2333	2342	2344	\N	0
2345		\N	2333	2344	2347	\N	0
2346	tr2	\N	2333	2344	2342	\N	1
2348		\N	2333	2347	2349	\N	0
2350		\N	2333	2349	2351	\N	0
2352		\N	2333	2351	2355	\N	0
2353	tr3	\N	2333	2351	2349	\N	1
2354	tr2	\N	2333	2351	2363	\N	2
2356		\N	2333	2355	2357	\N	0
2358		\N	2333	2357	2360	\N	0
2359	tr2	\N	2333	2357	2355	\N	1
2361		\N	2333	2360	2362	\N	0
2368		\N	2366	2367	2369	\N	0
2370	tr2	\N	2366	2369	2371	\N	0
2372		\N	2366	2371	2369	\N	0
2373	tr2	\N	2366	2371	2375	\N	1
2374	tr3	\N	2366	2371	2396	\N	2
2376		\N	2366	2375	2377	\N	0
2378		\N	2366	2377	2380	\N	0
2379	tr2	\N	2366	2377	2375	\N	1
2381		\N	2366	2380	2382	\N	0
2383		\N	2366	2382	2384	\N	0
2385		\N	2366	2384	2388	\N	0
2386	tr3	\N	2366	2384	2382	\N	1
2387	tr2	\N	2366	2384	2396	\N	2
2389		\N	2366	2388	2390	\N	0
2391		\N	2366	2390	2393	\N	0
2392	tr2	\N	2366	2390	2388	\N	1
2394		\N	2366	2393	2395	\N	0
2401		\N	2399	2400	2402	\N	0
2403	tr2	\N	2399	2402	2404	\N	0
2405		\N	2399	2404	2402	\N	0
2412	tr2	\N	2399	2410	2408	\N	1
2419	tr3	\N	2399	2417	2415	\N	1
2406	tr2	\N	2399	2404	2408	\N	1
2407	tr3	\N	2399	2404	2429	\N	2
2409		\N	2399	2408	2410	\N	0
2411		\N	2399	2410	2413	\N	0
2414		\N	2399	2413	2415	\N	0
2416		\N	2399	2415	2417	\N	0
2418		\N	2399	2417	2421	\N	0
2420	tr2	\N	2399	2417	2429	\N	2
2422		\N	2399	2421	2423	\N	0
2424		\N	2399	2423	2426	\N	0
2425	tr2	\N	2399	2423	2421	\N	1
2427		\N	2399	2426	2428	\N	0
2500		\N	2498	2499	2501	\N	0
2502	tr2	\N	2498	2501	2503	\N	0
2504		\N	2498	2503	2501	\N	0
2505	tr2	\N	2498	2503	2507	\N	1
2506	tr3	\N	2498	2503	2528	\N	2
2508		\N	2498	2507	2509	\N	0
2510		\N	2498	2509	2512	\N	0
2511	tr2	\N	2498	2509	2507	\N	1
2513		\N	2498	2512	2514	\N	0
2515		\N	2498	2514	2516	\N	0
2517		\N	2498	2516	2520	\N	0
2518	tr3	\N	2498	2516	2514	\N	1
2519	tr2	\N	2498	2516	2528	\N	2
2521		\N	2498	2520	2522	\N	0
2434		\N	2432	2433	2435	\N	0
2436	tr2	\N	2432	2435	2437	\N	0
2438		\N	2432	2437	2435	\N	0
2439	tr2	\N	2432	2437	2441	\N	1
2440	tr3	\N	2432	2437	2462	\N	2
2442		\N	2432	2441	2443	\N	0
2444		\N	2432	2443	2446	\N	0
2445	tr2	\N	2432	2443	2441	\N	1
2447		\N	2432	2446	2448	\N	0
2449		\N	2432	2448	2450	\N	0
2451		\N	2432	2450	2454	\N	0
2452	tr3	\N	2432	2450	2448	\N	1
2453	tr2	\N	2432	2450	2462	\N	2
2455		\N	2432	2454	2456	\N	0
2457		\N	2432	2456	2459	\N	0
2458	tr2	\N	2432	2456	2454	\N	1
2460		\N	2432	2459	2461	\N	0
2523		\N	2498	2522	2525	\N	0
2524	tr2	\N	2498	2522	2520	\N	1
2526		\N	2498	2525	2527	\N	0
2533		\N	2531	2532	2534	\N	0
2535	tr2	\N	2531	2534	2536	\N	0
2537		\N	2531	2536	2534	\N	0
2538	tr2	\N	2531	2536	2540	\N	1
2539	tr3	\N	2531	2536	2561	\N	2
2541		\N	2531	2540	2542	\N	0
2543		\N	2531	2542	2545	\N	0
2544	tr2	\N	2531	2542	2540	\N	1
2546		\N	2531	2545	2547	\N	0
2548		\N	2531	2547	2549	\N	0
2550		\N	2531	2549	2553	\N	0
2551	tr3	\N	2531	2549	2547	\N	1
2552	tr2	\N	2531	2549	2561	\N	2
2554		\N	2531	2553	2555	\N	0
2556		\N	2531	2555	2558	\N	0
2557	tr2	\N	2531	2555	2553	\N	1
2559		\N	2531	2558	2560	\N	0
2566		\N	2564	2565	2567	\N	0
2568	tr2	\N	2564	2567	2569	\N	0
2570		\N	2564	2569	2567	\N	0
2571	tr2	\N	2564	2569	2573	\N	1
2572	tr3	\N	2564	2569	2594	\N	2
2574		\N	2564	2573	2575	\N	0
2576		\N	2564	2575	2578	\N	0
2577	tr2	\N	2564	2575	2573	\N	1
2579		\N	2564	2578	2580	\N	0
2581		\N	2564	2580	2582	\N	0
2583		\N	2564	2582	2586	\N	0
2584	tr3	\N	2564	2582	2580	\N	1
2585	tr2	\N	2564	2582	2594	\N	2
2587		\N	2564	2586	2588	\N	0
2589		\N	2564	2588	2591	\N	0
2590	tr2	\N	2564	2588	2586	\N	1
2592		\N	2564	2591	2593	\N	0
2599		\N	2597	2598	2600	\N	0
2601	tr2	\N	2597	2600	2602	\N	0
2603		\N	2597	2602	2600	\N	0
2604	tr2	\N	2597	2602	2606	\N	1
2605	tr3	\N	2597	2602	2627	\N	2
2607		\N	2597	2606	2608	\N	0
2609		\N	2597	2608	2611	\N	0
2610	tr2	\N	2597	2608	2606	\N	1
2612		\N	2597	2611	2613	\N	0
2614		\N	2597	2613	2615	\N	0
2616		\N	2597	2615	2619	\N	0
2617	tr3	\N	2597	2615	2613	\N	1
2618	tr2	\N	2597	2615	2627	\N	2
2620		\N	2597	2619	2621	\N	0
2622		\N	2597	2621	2624	\N	0
2623	tr2	\N	2597	2621	2619	\N	1
2625		\N	2597	2624	2626	\N	0
2632		\N	2630	2631	2633	\N	0
2634	tr2	\N	2630	2633	2635	\N	0
2636		\N	2630	2635	2633	\N	0
2637	tr2	\N	2630	2635	2639	\N	1
2638	tr3	\N	2630	2635	2660	\N	2
2640		\N	2630	2639	2641	\N	0
2642		\N	2630	2641	2644	\N	0
2643	tr2	\N	2630	2641	2639	\N	1
2645		\N	2630	2644	2646	\N	0
2647		\N	2630	2646	2648	\N	0
2649		\N	2630	2648	2652	\N	0
2650	tr3	\N	2630	2648	2646	\N	1
2651	tr2	\N	2630	2648	2660	\N	2
2653		\N	2630	2652	2654	\N	0
2655		\N	2630	2654	2657	\N	0
2656	tr2	\N	2630	2654	2652	\N	1
2658		\N	2630	2657	2659	\N	0
2665		\N	2663	2664	2666	\N	0
2667	tr2	\N	2663	2666	2668	\N	0
2669		\N	2663	2668	2666	\N	0
2670	tr2	\N	2663	2668	2672	\N	1
2671	tr3	\N	2663	2668	2693	\N	2
2673		\N	2663	2672	2674	\N	0
2675		\N	2663	2674	2677	\N	0
2676	tr2	\N	2663	2674	2672	\N	1
2678		\N	2663	2677	2679	\N	0
2680		\N	2663	2679	2681	\N	0
2682		\N	2663	2681	2685	\N	0
2683	tr3	\N	2663	2681	2679	\N	1
2684	tr2	\N	2663	2681	2693	\N	2
2686		\N	2663	2685	2687	\N	0
2688		\N	2663	2687	2690	\N	0
2689	tr2	\N	2663	2687	2685	\N	1
2691		\N	2663	2690	2692	\N	0
2698		\N	2696	2697	2699	\N	0
2700	tr2	\N	2696	2699	2701	\N	0
2702		\N	2696	2701	2699	\N	0
2703	tr2	\N	2696	2701	2705	\N	1
2704	tr3	\N	2696	2701	2726	\N	2
2706		\N	2696	2705	2707	\N	0
2708		\N	2696	2707	2710	\N	0
2709	tr2	\N	2696	2707	2705	\N	1
2711		\N	2696	2710	2712	\N	0
2713		\N	2696	2712	2714	\N	0
2715		\N	2696	2714	2718	\N	0
2716	tr3	\N	2696	2714	2712	\N	1
2717	tr2	\N	2696	2714	2726	\N	2
2719		\N	2696	2718	2720	\N	0
2721		\N	2696	2720	2723	\N	0
2722	tr2	\N	2696	2720	2718	\N	1
2724		\N	2696	2723	2725	\N	0
2731		\N	2729	2730	2732	\N	0
2733	tr2	\N	2729	2732	2734	\N	0
2735		\N	2729	2734	2732	\N	0
2736	tr2	\N	2729	2734	2738	\N	1
2737	tr3	\N	2729	2734	2759	\N	2
2739		\N	2729	2738	2740	\N	0
2741		\N	2729	2740	2743	\N	0
2742	tr2	\N	2729	2740	2738	\N	1
2744		\N	2729	2743	2745	\N	0
2746		\N	2729	2745	2747	\N	0
2748		\N	2729	2747	2751	\N	0
2749	tr3	\N	2729	2747	2745	\N	1
2750	tr2	\N	2729	2747	2759	\N	2
2752		\N	2729	2751	2753	\N	0
2754		\N	2729	2753	2756	\N	0
2755	tr2	\N	2729	2753	2751	\N	1
2757		\N	2729	2756	2758	\N	0
\.


--
-- TOC entry 2154 (class 0 OID 145503)
-- Dependencies: 1616
-- Data for Name: jbpm_variableaccess; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_variableaccess (id_, variablename_, access_, mappedname_, script_, processstate_, taskcontroller_, index_) FROM stdin;
\.


--
-- TOC entry 2155 (class 0 OID 145509)
-- Dependencies: 1617
-- Data for Name: jbpm_variableinstance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbpm_variableinstance (id_, class_, version_, name_, converter_, token_, tokenvariablemap_, processinstance_, bytearrayvalue_, datevalue_, doublevalue_, longidclass_, longvalue_, stringidclass_, stringvalue_, taskinstance_) FROM stdin;
\.


--
-- TOC entry 1901 (class 2606 OID 145516)
-- Dependencies: 1586 1586
-- Name: jbpm_action_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_action
    ADD CONSTRAINT jbpm_action_pkey PRIMARY KEY (id_);


--
-- TOC entry 1903 (class 2606 OID 145518)
-- Dependencies: 1587 1587
-- Name: jbpm_bytearray_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_bytearray
    ADD CONSTRAINT jbpm_bytearray_pkey PRIMARY KEY (id_);


--
-- TOC entry 1905 (class 2606 OID 145520)
-- Dependencies: 1588 1588 1588
-- Name: jbpm_byteblock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_byteblock
    ADD CONSTRAINT jbpm_byteblock_pkey PRIMARY KEY (processfile_, index_);


--
-- TOC entry 1909 (class 2606 OID 145522)
-- Dependencies: 1589 1589
-- Name: jbpm_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_comment
    ADD CONSTRAINT jbpm_comment_pkey PRIMARY KEY (id_);


--
-- TOC entry 1911 (class 2606 OID 145524)
-- Dependencies: 1590 1590 1590
-- Name: jbpm_decisionconditions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_decisionconditions
    ADD CONSTRAINT jbpm_decisionconditions_pkey PRIMARY KEY (decision_, index_);


--
-- TOC entry 1914 (class 2606 OID 145526)
-- Dependencies: 1591 1591
-- Name: jbpm_delegation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_delegation
    ADD CONSTRAINT jbpm_delegation_pkey PRIMARY KEY (id_);


--
-- TOC entry 1916 (class 2606 OID 145528)
-- Dependencies: 1592 1592
-- Name: jbpm_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_event
    ADD CONSTRAINT jbpm_event_pkey PRIMARY KEY (id_);


--
-- TOC entry 1918 (class 2606 OID 145530)
-- Dependencies: 1593 1593
-- Name: jbpm_exceptionhandler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_exceptionhandler
    ADD CONSTRAINT jbpm_exceptionhandler_pkey PRIMARY KEY (id_);


--
-- TOC entry 1920 (class 2606 OID 145532)
-- Dependencies: 1594 1594
-- Name: jbpm_id_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_id_group
    ADD CONSTRAINT jbpm_id_group_pkey PRIMARY KEY (id_);


--
-- TOC entry 1922 (class 2606 OID 145534)
-- Dependencies: 1595 1595
-- Name: jbpm_id_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_id_membership
    ADD CONSTRAINT jbpm_id_membership_pkey PRIMARY KEY (id_);


--
-- TOC entry 1924 (class 2606 OID 145536)
-- Dependencies: 1597 1597
-- Name: jbpm_id_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_id_user
    ADD CONSTRAINT jbpm_id_user_pkey PRIMARY KEY (id_);


--
-- TOC entry 1932 (class 2606 OID 145538)
-- Dependencies: 1598 1598
-- Name: jbpm_job_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_job
    ADD CONSTRAINT jbpm_job_pkey PRIMARY KEY (id_);


--
-- TOC entry 1947 (class 2606 OID 145540)
-- Dependencies: 1599 1599
-- Name: jbpm_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_log
    ADD CONSTRAINT jbpm_log_pkey PRIMARY KEY (id_);


--
-- TOC entry 1951 (class 2606 OID 145542)
-- Dependencies: 1600 1600
-- Name: jbpm_moduledefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_moduledefinition
    ADD CONSTRAINT jbpm_moduledefinition_pkey PRIMARY KEY (id_);


--
-- TOC entry 1955 (class 2606 OID 145544)
-- Dependencies: 1601 1601
-- Name: jbpm_moduleinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_moduleinstance
    ADD CONSTRAINT jbpm_moduleinstance_pkey PRIMARY KEY (id_);


--
-- TOC entry 1963 (class 2606 OID 145546)
-- Dependencies: 1602 1602
-- Name: jbpm_node_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_node
    ADD CONSTRAINT jbpm_node_pkey PRIMARY KEY (id_);


--
-- TOC entry 1967 (class 2606 OID 145548)
-- Dependencies: 1603 1603
-- Name: jbpm_pooledactor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_pooledactor
    ADD CONSTRAINT jbpm_pooledactor_pkey PRIMARY KEY (id_);


--
-- TOC entry 1970 (class 2606 OID 145550)
-- Dependencies: 1604 1604
-- Name: jbpm_processdefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_processdefinition
    ADD CONSTRAINT jbpm_processdefinition_pkey PRIMARY KEY (id_);


--
-- TOC entry 1976 (class 2606 OID 145552)
-- Dependencies: 1605 1605
-- Name: jbpm_processinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_processinstance
    ADD CONSTRAINT jbpm_processinstance_pkey PRIMARY KEY (id_);


--
-- TOC entry 1980 (class 2606 OID 145554)
-- Dependencies: 1606 1606
-- Name: jbpm_runtimeaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_runtimeaction
    ADD CONSTRAINT jbpm_runtimeaction_pkey PRIMARY KEY (id_);


--
-- TOC entry 1984 (class 2606 OID 145556)
-- Dependencies: 1607 1607
-- Name: jbpm_swimlane_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_swimlane
    ADD CONSTRAINT jbpm_swimlane_pkey PRIMARY KEY (id_);


--
-- TOC entry 1988 (class 2606 OID 145558)
-- Dependencies: 1608 1608
-- Name: jbpm_swimlaneinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_swimlaneinstance
    ADD CONSTRAINT jbpm_swimlaneinstance_pkey PRIMARY KEY (id_);


--
-- TOC entry 1997 (class 2606 OID 145560)
-- Dependencies: 1609 1609
-- Name: jbpm_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT jbpm_task_pkey PRIMARY KEY (id_);


--
-- TOC entry 1999 (class 2606 OID 145562)
-- Dependencies: 1610 1610 1610
-- Name: jbpm_taskactorpool_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_taskactorpool
    ADD CONSTRAINT jbpm_taskactorpool_pkey PRIMARY KEY (taskinstance_, pooledactor_);


--
-- TOC entry 2002 (class 2606 OID 145564)
-- Dependencies: 1611 1611
-- Name: jbpm_taskcontroller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_taskcontroller
    ADD CONSTRAINT jbpm_taskcontroller_pkey PRIMARY KEY (id_);


--
-- TOC entry 2010 (class 2606 OID 145566)
-- Dependencies: 1612 1612
-- Name: jbpm_taskinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_taskinstance
    ADD CONSTRAINT jbpm_taskinstance_pkey PRIMARY KEY (id_);


--
-- TOC entry 2016 (class 2606 OID 145568)
-- Dependencies: 1613 1613
-- Name: jbpm_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_token
    ADD CONSTRAINT jbpm_token_pkey PRIMARY KEY (id_);


--
-- TOC entry 2020 (class 2606 OID 145570)
-- Dependencies: 1614 1614
-- Name: jbpm_tokenvariablemap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_tokenvariablemap
    ADD CONSTRAINT jbpm_tokenvariablemap_pkey PRIMARY KEY (id_);


--
-- TOC entry 2025 (class 2606 OID 145572)
-- Dependencies: 1615 1615
-- Name: jbpm_transition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_transition
    ADD CONSTRAINT jbpm_transition_pkey PRIMARY KEY (id_);


--
-- TOC entry 2027 (class 2606 OID 145574)
-- Dependencies: 1616 1616
-- Name: jbpm_variableaccess_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_variableaccess
    ADD CONSTRAINT jbpm_variableaccess_pkey PRIMARY KEY (id_);


--
-- TOC entry 2033 (class 2606 OID 145576)
-- Dependencies: 1617 1617
-- Name: jbpm_variableinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbpm_variableinstance
    ADD CONSTRAINT jbpm_variableinstance_pkey PRIMARY KEY (id_);


--
-- TOC entry 1895 (class 1259 OID 145577)
-- Dependencies: 1586
-- Name: idx_action_actndl; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_action_actndl ON jbpm_action USING btree (actiondelegation_);


--
-- TOC entry 1896 (class 1259 OID 145578)
-- Dependencies: 1586
-- Name: idx_action_event; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_action_event ON jbpm_action USING btree (event_);


--
-- TOC entry 1897 (class 1259 OID 145579)
-- Dependencies: 1586
-- Name: idx_action_procdf; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_action_procdf ON jbpm_action USING btree (processdefinition_);


--
-- TOC entry 1898 (class 1259 OID 145580)
-- Dependencies: 1586
-- Name: idx_action_refact; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_action_refact ON jbpm_action USING btree (referencedaction_);


--
-- TOC entry 2028 (class 1259 OID 145581)
-- Dependencies: 1617
-- Name: idx_byteinst_array; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_byteinst_array ON jbpm_variableinstance USING btree (bytearrayvalue_);


--
-- TOC entry 1906 (class 1259 OID 145582)
-- Dependencies: 1589
-- Name: idx_comment_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_comment_token ON jbpm_comment USING btree (token_);


--
-- TOC entry 1907 (class 1259 OID 145583)
-- Dependencies: 1589
-- Name: idx_comment_tsk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_comment_tsk ON jbpm_comment USING btree (taskinstance_);


--
-- TOC entry 1899 (class 1259 OID 145584)
-- Dependencies: 1586
-- Name: idx_crtetimeract_ta; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_crtetimeract_ta ON jbpm_action USING btree (timeraction_);


--
-- TOC entry 1956 (class 1259 OID 145585)
-- Dependencies: 1602
-- Name: idx_decision_deleg; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_decision_deleg ON jbpm_node USING btree (decisiondelegation);


--
-- TOC entry 1912 (class 1259 OID 145586)
-- Dependencies: 1591
-- Name: idx_deleg_prcd; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_deleg_prcd ON jbpm_delegation USING btree (processdefinition_);


--
-- TOC entry 1925 (class 1259 OID 145587)
-- Dependencies: 1598
-- Name: idx_job_action; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_job_action ON jbpm_job USING btree (action_);


--
-- TOC entry 1926 (class 1259 OID 145588)
-- Dependencies: 1598
-- Name: idx_job_duedate; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_job_duedate ON jbpm_job USING btree (duedate_);


--
-- TOC entry 1927 (class 1259 OID 145589)
-- Dependencies: 1598
-- Name: idx_job_node; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_job_node ON jbpm_job USING btree (node_);


--
-- TOC entry 1928 (class 1259 OID 145590)
-- Dependencies: 1598
-- Name: idx_job_prinst; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_job_prinst ON jbpm_job USING btree (processinstance_);


--
-- TOC entry 1929 (class 1259 OID 145591)
-- Dependencies: 1598
-- Name: idx_job_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_job_token ON jbpm_job USING btree (token_);


--
-- TOC entry 1930 (class 1259 OID 145592)
-- Dependencies: 1598
-- Name: idx_job_tskinst; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_job_tskinst ON jbpm_job USING btree (taskinstance_);


--
-- TOC entry 1933 (class 1259 OID 145593)
-- Dependencies: 1599
-- Name: idx_log_action; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_log_action ON jbpm_log USING btree (action_);


--
-- TOC entry 1934 (class 1259 OID 145594)
-- Dependencies: 1599
-- Name: idx_log_childtoken; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_log_childtoken ON jbpm_log USING btree (child_);


--
-- TOC entry 1935 (class 1259 OID 145595)
-- Dependencies: 1599
-- Name: idx_log_destnode; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_log_destnode ON jbpm_log USING btree (destinationnode_);


--
-- TOC entry 1936 (class 1259 OID 145596)
-- Dependencies: 1599
-- Name: idx_log_newbytes; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_log_newbytes ON jbpm_log USING btree (newbytearray_);


--
-- TOC entry 1937 (class 1259 OID 145597)
-- Dependencies: 1599
-- Name: idx_log_node; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_log_node ON jbpm_log USING btree (node_);


--
-- TOC entry 1938 (class 1259 OID 145598)
-- Dependencies: 1599
-- Name: idx_log_oldbytes; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_log_oldbytes ON jbpm_log USING btree (oldbytearray_);


--
-- TOC entry 1939 (class 1259 OID 145599)
-- Dependencies: 1599
-- Name: idx_log_parent; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_log_parent ON jbpm_log USING btree (parent_);


--
-- TOC entry 1940 (class 1259 OID 145600)
-- Dependencies: 1599
-- Name: idx_log_sourcenode; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_log_sourcenode ON jbpm_log USING btree (sourcenode_);


--
-- TOC entry 1941 (class 1259 OID 145601)
-- Dependencies: 1599
-- Name: idx_log_swiminst; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_log_swiminst ON jbpm_log USING btree (swimlaneinstance_);


--
-- TOC entry 1942 (class 1259 OID 145602)
-- Dependencies: 1599
-- Name: idx_log_taskinst; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_log_taskinst ON jbpm_log USING btree (taskinstance_);


--
-- TOC entry 1943 (class 1259 OID 145603)
-- Dependencies: 1599
-- Name: idx_log_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_log_token ON jbpm_log USING btree (token_);


--
-- TOC entry 1944 (class 1259 OID 145604)
-- Dependencies: 1599
-- Name: idx_log_transition; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_log_transition ON jbpm_log USING btree (transition_);


--
-- TOC entry 1945 (class 1259 OID 145605)
-- Dependencies: 1599
-- Name: idx_log_varinst; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_log_varinst ON jbpm_log USING btree (variableinstance_);


--
-- TOC entry 1948 (class 1259 OID 145606)
-- Dependencies: 1600
-- Name: idx_moddef_procdf; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_moddef_procdf ON jbpm_moduledefinition USING btree (processdefinition_);


--
-- TOC entry 1952 (class 1259 OID 145607)
-- Dependencies: 1601
-- Name: idx_modinst_prinst; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_modinst_prinst ON jbpm_moduleinstance USING btree (processinstance_);


--
-- TOC entry 1957 (class 1259 OID 145608)
-- Dependencies: 1602
-- Name: idx_node_action; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_node_action ON jbpm_node USING btree (action_);


--
-- TOC entry 1958 (class 1259 OID 145609)
-- Dependencies: 1602
-- Name: idx_node_procdef; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_node_procdef ON jbpm_node USING btree (processdefinition_);


--
-- TOC entry 1959 (class 1259 OID 145610)
-- Dependencies: 1602
-- Name: idx_node_script; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_node_script ON jbpm_node USING btree (script_);


--
-- TOC entry 1960 (class 1259 OID 145611)
-- Dependencies: 1602
-- Name: idx_node_suprstate; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_node_suprstate ON jbpm_node USING btree (superstate_);


--
-- TOC entry 1964 (class 1259 OID 145612)
-- Dependencies: 1603
-- Name: idx_pldactr_actid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_pldactr_actid ON jbpm_pooledactor USING btree (actorid_);


--
-- TOC entry 1968 (class 1259 OID 145613)
-- Dependencies: 1604
-- Name: idx_procdef_strtst; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_procdef_strtst ON jbpm_processdefinition USING btree (startstate_);


--
-- TOC entry 1971 (class 1259 OID 145614)
-- Dependencies: 1605
-- Name: idx_procin_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_procin_key ON jbpm_processinstance USING btree (key_);


--
-- TOC entry 1972 (class 1259 OID 145616)
-- Dependencies: 1605
-- Name: idx_procin_procdef; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_procin_procdef ON jbpm_processinstance USING btree (processdefinition_);


--
-- TOC entry 1973 (class 1259 OID 145617)
-- Dependencies: 1605
-- Name: idx_procin_roottk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_procin_roottk ON jbpm_processinstance USING btree (roottoken_);


--
-- TOC entry 1974 (class 1259 OID 145618)
-- Dependencies: 1605
-- Name: idx_procin_sproctk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_procin_sproctk ON jbpm_processinstance USING btree (superprocesstoken_);


--
-- TOC entry 1961 (class 1259 OID 145619)
-- Dependencies: 1602
-- Name: idx_pstate_sbprcdef; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_pstate_sbprcdef ON jbpm_node USING btree (subprocessdefinition_);


--
-- TOC entry 1977 (class 1259 OID 145620)
-- Dependencies: 1606
-- Name: idx_rtactn_action; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_rtactn_action ON jbpm_runtimeaction USING btree (action_);


--
-- TOC entry 1978 (class 1259 OID 145621)
-- Dependencies: 1606
-- Name: idx_rtactn_prcinst; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_rtactn_prcinst ON jbpm_runtimeaction USING btree (processinstance_);


--
-- TOC entry 1985 (class 1259 OID 145622)
-- Dependencies: 1608
-- Name: idx_swimlaneinst_tm; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_swimlaneinst_tm ON jbpm_swimlaneinstance USING btree (taskmgmtinstance_);


--
-- TOC entry 1986 (class 1259 OID 145623)
-- Dependencies: 1608
-- Name: idx_swimlinst_sl; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_swimlinst_sl ON jbpm_swimlaneinstance USING btree (swimlane_);


--
-- TOC entry 1981 (class 1259 OID 145624)
-- Dependencies: 1607
-- Name: idx_swl_assdel; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_swl_assdel ON jbpm_swimlane USING btree (assignmentdelegation_);


--
-- TOC entry 1982 (class 1259 OID 145625)
-- Dependencies: 1607
-- Name: idx_swl_tskmgmtdef; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_swl_tskmgmtdef ON jbpm_swimlane USING btree (taskmgmtdefinition_);


--
-- TOC entry 2003 (class 1259 OID 145626)
-- Dependencies: 1612
-- Name: idx_task_actorid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_task_actorid ON jbpm_taskinstance USING btree (actorid_);


--
-- TOC entry 1989 (class 1259 OID 145627)
-- Dependencies: 1609
-- Name: idx_task_assdel; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_task_assdel ON jbpm_task USING btree (assignmentdelegation_);


--
-- TOC entry 1990 (class 1259 OID 145628)
-- Dependencies: 1609
-- Name: idx_task_procdef; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_task_procdef ON jbpm_task USING btree (processdefinition_);


--
-- TOC entry 1991 (class 1259 OID 145629)
-- Dependencies: 1609
-- Name: idx_task_startst; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_task_startst ON jbpm_task USING btree (startstate_);


--
-- TOC entry 1992 (class 1259 OID 145630)
-- Dependencies: 1609
-- Name: idx_task_swimlane; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_task_swimlane ON jbpm_task USING btree (swimlane_);


--
-- TOC entry 1993 (class 1259 OID 145631)
-- Dependencies: 1609
-- Name: idx_task_taskmgtdf; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_task_taskmgtdf ON jbpm_task USING btree (taskmgmtdefinition_);


--
-- TOC entry 1994 (class 1259 OID 145632)
-- Dependencies: 1609
-- Name: idx_task_tsknode; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_task_tsknode ON jbpm_task USING btree (tasknode_);


--
-- TOC entry 2004 (class 1259 OID 145633)
-- Dependencies: 1612
-- Name: idx_taskinst_prcins; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_taskinst_prcins ON jbpm_taskinstance USING btree (procinst_);


--
-- TOC entry 2005 (class 1259 OID 145634)
-- Dependencies: 1612
-- Name: idx_taskinst_tokn; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_taskinst_tokn ON jbpm_taskinstance USING btree (token_);


--
-- TOC entry 2006 (class 1259 OID 145635)
-- Dependencies: 1612 1612
-- Name: idx_taskinst_tsk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_taskinst_tsk ON jbpm_taskinstance USING btree (task_, procinst_);


--
-- TOC entry 1953 (class 1259 OID 145636)
-- Dependencies: 1601
-- Name: idx_taskmgtinst_tmd; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_taskmgtinst_tmd ON jbpm_moduleinstance USING btree (taskmgmtdefinition_);


--
-- TOC entry 2017 (class 1259 OID 145637)
-- Dependencies: 1614
-- Name: idx_tkvarmap_ctxt; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_tkvarmap_ctxt ON jbpm_tokenvariablemap USING btree (contextinstance_);


--
-- TOC entry 2018 (class 1259 OID 145638)
-- Dependencies: 1614
-- Name: idx_tkvvarmp_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_tkvvarmp_token ON jbpm_tokenvariablemap USING btree (token_);


--
-- TOC entry 2011 (class 1259 OID 145639)
-- Dependencies: 1613
-- Name: idx_token_node; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_token_node ON jbpm_token USING btree (node_);


--
-- TOC entry 2012 (class 1259 OID 145640)
-- Dependencies: 1613
-- Name: idx_token_parent; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_token_parent ON jbpm_token USING btree (parent_);


--
-- TOC entry 2013 (class 1259 OID 145641)
-- Dependencies: 1613
-- Name: idx_token_procin; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_token_procin ON jbpm_token USING btree (processinstance_);


--
-- TOC entry 2014 (class 1259 OID 145642)
-- Dependencies: 1613
-- Name: idx_token_subpi; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_token_subpi ON jbpm_token USING btree (subprocessinstance_);


--
-- TOC entry 2021 (class 1259 OID 145643)
-- Dependencies: 1615
-- Name: idx_trans_procdef; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_trans_procdef ON jbpm_transition USING btree (processdefinition_);


--
-- TOC entry 2022 (class 1259 OID 145644)
-- Dependencies: 1615
-- Name: idx_transit_from; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_transit_from ON jbpm_transition USING btree (from_);


--
-- TOC entry 2023 (class 1259 OID 145645)
-- Dependencies: 1615
-- Name: idx_transit_to; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_transit_to ON jbpm_transition USING btree (to_);


--
-- TOC entry 1995 (class 1259 OID 145646)
-- Dependencies: 1609
-- Name: idx_tsk_tskctrl; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_tsk_tskctrl ON jbpm_task USING btree (taskcontroller_);


--
-- TOC entry 2000 (class 1259 OID 145647)
-- Dependencies: 1611
-- Name: idx_tskctrl_deleg; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_tskctrl_deleg ON jbpm_taskcontroller USING btree (taskcontrollerdelegation_);


--
-- TOC entry 1949 (class 1259 OID 145648)
-- Dependencies: 1600
-- Name: idx_tskdef_start; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_tskdef_start ON jbpm_moduledefinition USING btree (starttask_);


--
-- TOC entry 2007 (class 1259 OID 145649)
-- Dependencies: 1612
-- Name: idx_tskinst_slinst; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_tskinst_slinst ON jbpm_taskinstance USING btree (swimlaninstance_);


--
-- TOC entry 1965 (class 1259 OID 145650)
-- Dependencies: 1603
-- Name: idx_tskinst_swlane; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_tskinst_swlane ON jbpm_pooledactor USING btree (swimlaneinstance_);


--
-- TOC entry 2008 (class 1259 OID 145651)
-- Dependencies: 1612
-- Name: idx_tskinst_tminst; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_tskinst_tminst ON jbpm_taskinstance USING btree (taskmgmtinstance_);


--
-- TOC entry 2029 (class 1259 OID 145652)
-- Dependencies: 1617
-- Name: idx_varinst_prcins; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_varinst_prcins ON jbpm_variableinstance USING btree (processinstance_);


--
-- TOC entry 2030 (class 1259 OID 145653)
-- Dependencies: 1617
-- Name: idx_varinst_tk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_varinst_tk ON jbpm_variableinstance USING btree (token_);


--
-- TOC entry 2031 (class 1259 OID 145654)
-- Dependencies: 1617
-- Name: idx_varinst_tkvarmp; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_varinst_tkvarmp ON jbpm_variableinstance USING btree (tokenvariablemap_);


--
-- TOC entry 2034 (class 2606 OID 145655)
-- Dependencies: 1591 1586 1913
-- Name: fk_action_actndel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_action
    ADD CONSTRAINT fk_action_actndel FOREIGN KEY (actiondelegation_) REFERENCES jbpm_delegation(id_);


--
-- TOC entry 2035 (class 2606 OID 145660)
-- Dependencies: 1586 1915 1592
-- Name: fk_action_event; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_action
    ADD CONSTRAINT fk_action_event FOREIGN KEY (event_) REFERENCES jbpm_event(id_);


--
-- TOC entry 2036 (class 2606 OID 145665)
-- Dependencies: 1917 1593 1586
-- Name: fk_action_expthdl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_action
    ADD CONSTRAINT fk_action_expthdl FOREIGN KEY (exceptionhandler_) REFERENCES jbpm_exceptionhandler(id_);


--
-- TOC entry 2037 (class 2606 OID 145670)
-- Dependencies: 1586 1604 1969
-- Name: fk_action_procdef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_action
    ADD CONSTRAINT fk_action_procdef FOREIGN KEY (processdefinition_) REFERENCES jbpm_processdefinition(id_);


--
-- TOC entry 2038 (class 2606 OID 145675)
-- Dependencies: 1900 1586 1586
-- Name: fk_action_refact; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_action
    ADD CONSTRAINT fk_action_refact FOREIGN KEY (referencedaction_) REFERENCES jbpm_action(id_);


--
-- TOC entry 2040 (class 2606 OID 145680)
-- Dependencies: 1600 1950 1587
-- Name: fk_bytearr_fildef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_bytearray
    ADD CONSTRAINT fk_bytearr_fildef FOREIGN KEY (filedefinition_) REFERENCES jbpm_moduledefinition(id_);


--
-- TOC entry 2041 (class 2606 OID 145685)
-- Dependencies: 1902 1587 1588
-- Name: fk_byteblock_file; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_byteblock
    ADD CONSTRAINT fk_byteblock_file FOREIGN KEY (processfile_) REFERENCES jbpm_bytearray(id_);


--
-- TOC entry 2119 (class 2606 OID 145690)
-- Dependencies: 1587 1902 1617
-- Name: fk_byteinst_array; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_variableinstance
    ADD CONSTRAINT fk_byteinst_array FOREIGN KEY (bytearrayvalue_) REFERENCES jbpm_bytearray(id_);


--
-- TOC entry 2042 (class 2606 OID 145695)
-- Dependencies: 1589 1613 2015
-- Name: fk_comment_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_comment
    ADD CONSTRAINT fk_comment_token FOREIGN KEY (token_) REFERENCES jbpm_token(id_);


--
-- TOC entry 2043 (class 2606 OID 145700)
-- Dependencies: 1589 1612 2009
-- Name: fk_comment_tsk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_comment
    ADD CONSTRAINT fk_comment_tsk FOREIGN KEY (taskinstance_) REFERENCES jbpm_taskinstance(id_);


--
-- TOC entry 2039 (class 2606 OID 145705)
-- Dependencies: 1586 1586 1900
-- Name: fk_crtetimeract_ta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_action
    ADD CONSTRAINT fk_crtetimeract_ta FOREIGN KEY (timeraction_) REFERENCES jbpm_action(id_);


--
-- TOC entry 2044 (class 2606 OID 145710)
-- Dependencies: 1590 1602 1962
-- Name: fk_deccond_dec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_decisionconditions
    ADD CONSTRAINT fk_deccond_dec FOREIGN KEY (decision_) REFERENCES jbpm_node(id_);


--
-- TOC entry 2075 (class 2606 OID 145715)
-- Dependencies: 1602 1591 1913
-- Name: fk_decision_deleg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_node
    ADD CONSTRAINT fk_decision_deleg FOREIGN KEY (decisiondelegation) REFERENCES jbpm_delegation(id_);


--
-- TOC entry 2045 (class 2606 OID 145720)
-- Dependencies: 1591 1604 1969
-- Name: fk_delegation_prcd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_delegation
    ADD CONSTRAINT fk_delegation_prcd FOREIGN KEY (processdefinition_) REFERENCES jbpm_processdefinition(id_);


--
-- TOC entry 2046 (class 2606 OID 145725)
-- Dependencies: 1592 1962 1602
-- Name: fk_event_node; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_event
    ADD CONSTRAINT fk_event_node FOREIGN KEY (node_) REFERENCES jbpm_node(id_);


--
-- TOC entry 2047 (class 2606 OID 145730)
-- Dependencies: 1592 1604 1969
-- Name: fk_event_procdef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_event
    ADD CONSTRAINT fk_event_procdef FOREIGN KEY (processdefinition_) REFERENCES jbpm_processdefinition(id_);


--
-- TOC entry 2048 (class 2606 OID 145735)
-- Dependencies: 1996 1592 1609
-- Name: fk_event_task; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_event
    ADD CONSTRAINT fk_event_task FOREIGN KEY (task_) REFERENCES jbpm_task(id_);


--
-- TOC entry 2049 (class 2606 OID 145740)
-- Dependencies: 1615 1592 2024
-- Name: fk_event_trans; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_event
    ADD CONSTRAINT fk_event_trans FOREIGN KEY (transition_) REFERENCES jbpm_transition(id_);


--
-- TOC entry 2050 (class 2606 OID 145745)
-- Dependencies: 1594 1594 1919
-- Name: fk_id_grp_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_id_group
    ADD CONSTRAINT fk_id_grp_parent FOREIGN KEY (parent_) REFERENCES jbpm_id_group(id_);


--
-- TOC entry 2051 (class 2606 OID 145750)
-- Dependencies: 1594 1595 1919
-- Name: fk_id_memship_grp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_id_membership
    ADD CONSTRAINT fk_id_memship_grp FOREIGN KEY (group_) REFERENCES jbpm_id_group(id_);


--
-- TOC entry 2052 (class 2606 OID 145755)
-- Dependencies: 1595 1597 1923
-- Name: fk_id_memship_usr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_id_membership
    ADD CONSTRAINT fk_id_memship_usr FOREIGN KEY (user_) REFERENCES jbpm_id_user(id_);


--
-- TOC entry 2053 (class 2606 OID 145760)
-- Dependencies: 1598 1586 1900
-- Name: fk_job_action; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_job
    ADD CONSTRAINT fk_job_action FOREIGN KEY (action_) REFERENCES jbpm_action(id_);


--
-- TOC entry 2054 (class 2606 OID 145765)
-- Dependencies: 1962 1598 1602
-- Name: fk_job_node; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_job
    ADD CONSTRAINT fk_job_node FOREIGN KEY (node_) REFERENCES jbpm_node(id_);


--
-- TOC entry 2055 (class 2606 OID 145770)
-- Dependencies: 1605 1598 1975
-- Name: fk_job_prinst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_job
    ADD CONSTRAINT fk_job_prinst FOREIGN KEY (processinstance_) REFERENCES jbpm_processinstance(id_);


--
-- TOC entry 2056 (class 2606 OID 145775)
-- Dependencies: 1613 1598 2015
-- Name: fk_job_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_job
    ADD CONSTRAINT fk_job_token FOREIGN KEY (token_) REFERENCES jbpm_token(id_);


--
-- TOC entry 2057 (class 2606 OID 145780)
-- Dependencies: 1598 2009 1612
-- Name: fk_job_tskinst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_job
    ADD CONSTRAINT fk_job_tskinst FOREIGN KEY (taskinstance_) REFERENCES jbpm_taskinstance(id_);


--
-- TOC entry 2058 (class 2606 OID 145785)
-- Dependencies: 1586 1599 1900
-- Name: fk_log_action; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_log
    ADD CONSTRAINT fk_log_action FOREIGN KEY (action_) REFERENCES jbpm_action(id_);


--
-- TOC entry 2059 (class 2606 OID 145790)
-- Dependencies: 1599 1613 2015
-- Name: fk_log_childtoken; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_log
    ADD CONSTRAINT fk_log_childtoken FOREIGN KEY (child_) REFERENCES jbpm_token(id_);


--
-- TOC entry 2060 (class 2606 OID 145795)
-- Dependencies: 1599 1602 1962
-- Name: fk_log_destnode; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_log
    ADD CONSTRAINT fk_log_destnode FOREIGN KEY (destinationnode_) REFERENCES jbpm_node(id_);


--
-- TOC entry 2061 (class 2606 OID 145800)
-- Dependencies: 1902 1599 1587
-- Name: fk_log_newbytes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_log
    ADD CONSTRAINT fk_log_newbytes FOREIGN KEY (newbytearray_) REFERENCES jbpm_bytearray(id_);


--
-- TOC entry 2062 (class 2606 OID 145805)
-- Dependencies: 1962 1602 1599
-- Name: fk_log_node; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_log
    ADD CONSTRAINT fk_log_node FOREIGN KEY (node_) REFERENCES jbpm_node(id_);


--
-- TOC entry 2063 (class 2606 OID 145810)
-- Dependencies: 1587 1599 1902
-- Name: fk_log_oldbytes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_log
    ADD CONSTRAINT fk_log_oldbytes FOREIGN KEY (oldbytearray_) REFERENCES jbpm_bytearray(id_);


--
-- TOC entry 2064 (class 2606 OID 145815)
-- Dependencies: 1599 1946 1599
-- Name: fk_log_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_log
    ADD CONSTRAINT fk_log_parent FOREIGN KEY (parent_) REFERENCES jbpm_log(id_);


--
-- TOC entry 2065 (class 2606 OID 145820)
-- Dependencies: 1962 1602 1599
-- Name: fk_log_sourcenode; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_log
    ADD CONSTRAINT fk_log_sourcenode FOREIGN KEY (sourcenode_) REFERENCES jbpm_node(id_);


--
-- TOC entry 2066 (class 2606 OID 145825)
-- Dependencies: 1608 1599 1987
-- Name: fk_log_swiminst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_log
    ADD CONSTRAINT fk_log_swiminst FOREIGN KEY (swimlaneinstance_) REFERENCES jbpm_swimlaneinstance(id_);


--
-- TOC entry 2067 (class 2606 OID 145830)
-- Dependencies: 1599 1612 2009
-- Name: fk_log_taskinst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_log
    ADD CONSTRAINT fk_log_taskinst FOREIGN KEY (taskinstance_) REFERENCES jbpm_taskinstance(id_);


--
-- TOC entry 2068 (class 2606 OID 145835)
-- Dependencies: 1613 2015 1599
-- Name: fk_log_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_log
    ADD CONSTRAINT fk_log_token FOREIGN KEY (token_) REFERENCES jbpm_token(id_);


--
-- TOC entry 2069 (class 2606 OID 145840)
-- Dependencies: 1599 2024 1615
-- Name: fk_log_transition; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_log
    ADD CONSTRAINT fk_log_transition FOREIGN KEY (transition_) REFERENCES jbpm_transition(id_);


--
-- TOC entry 2070 (class 2606 OID 145845)
-- Dependencies: 1617 1599 2032
-- Name: fk_log_varinst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_log
    ADD CONSTRAINT fk_log_varinst FOREIGN KEY (variableinstance_) REFERENCES jbpm_variableinstance(id_);


--
-- TOC entry 2071 (class 2606 OID 145850)
-- Dependencies: 1600 1604 1969
-- Name: fk_moddef_procdef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_moduledefinition
    ADD CONSTRAINT fk_moddef_procdef FOREIGN KEY (processdefinition_) REFERENCES jbpm_processdefinition(id_);


--
-- TOC entry 2073 (class 2606 OID 145855)
-- Dependencies: 1601 1605 1975
-- Name: fk_modinst_prcinst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_moduleinstance
    ADD CONSTRAINT fk_modinst_prcinst FOREIGN KEY (processinstance_) REFERENCES jbpm_processinstance(id_);


--
-- TOC entry 2076 (class 2606 OID 145860)
-- Dependencies: 1602 1586 1900
-- Name: fk_node_action; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_node
    ADD CONSTRAINT fk_node_action FOREIGN KEY (action_) REFERENCES jbpm_action(id_);


--
-- TOC entry 2077 (class 2606 OID 145865)
-- Dependencies: 1602 1604 1969
-- Name: fk_node_procdef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_node
    ADD CONSTRAINT fk_node_procdef FOREIGN KEY (processdefinition_) REFERENCES jbpm_processdefinition(id_);


--
-- TOC entry 2078 (class 2606 OID 145870)
-- Dependencies: 1586 1900 1602
-- Name: fk_node_script; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_node
    ADD CONSTRAINT fk_node_script FOREIGN KEY (script_) REFERENCES jbpm_action(id_);


--
-- TOC entry 2079 (class 2606 OID 145875)
-- Dependencies: 1602 1962 1602
-- Name: fk_node_superstate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_node
    ADD CONSTRAINT fk_node_superstate FOREIGN KEY (superstate_) REFERENCES jbpm_node(id_);


--
-- TOC entry 2081 (class 2606 OID 145880)
-- Dependencies: 1603 1987 1608
-- Name: fk_pooledactor_sli; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_pooledactor
    ADD CONSTRAINT fk_pooledactor_sli FOREIGN KEY (swimlaneinstance_) REFERENCES jbpm_swimlaneinstance(id_);


--
-- TOC entry 2082 (class 2606 OID 145885)
-- Dependencies: 1962 1604 1602
-- Name: fk_procdef_strtsta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_processdefinition
    ADD CONSTRAINT fk_procdef_strtsta FOREIGN KEY (startstate_) REFERENCES jbpm_node(id_);


--
-- TOC entry 2083 (class 2606 OID 145890)
-- Dependencies: 1605 1969 1604
-- Name: fk_procin_procdef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_processinstance
    ADD CONSTRAINT fk_procin_procdef FOREIGN KEY (processdefinition_) REFERENCES jbpm_processdefinition(id_);


--
-- TOC entry 2084 (class 2606 OID 145895)
-- Dependencies: 1605 2015 1613
-- Name: fk_procin_roottkn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_processinstance
    ADD CONSTRAINT fk_procin_roottkn FOREIGN KEY (roottoken_) REFERENCES jbpm_token(id_);


--
-- TOC entry 2085 (class 2606 OID 145900)
-- Dependencies: 1605 1613 2015
-- Name: fk_procin_sproctkn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_processinstance
    ADD CONSTRAINT fk_procin_sproctkn FOREIGN KEY (superprocesstoken_) REFERENCES jbpm_token(id_);


--
-- TOC entry 2080 (class 2606 OID 145905)
-- Dependencies: 1969 1602 1604
-- Name: fk_procst_sbprcdef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_node
    ADD CONSTRAINT fk_procst_sbprcdef FOREIGN KEY (subprocessdefinition_) REFERENCES jbpm_processdefinition(id_);


--
-- TOC entry 2086 (class 2606 OID 145910)
-- Dependencies: 1606 1586 1900
-- Name: fk_rtactn_action; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_runtimeaction
    ADD CONSTRAINT fk_rtactn_action FOREIGN KEY (action_) REFERENCES jbpm_action(id_);


--
-- TOC entry 2087 (class 2606 OID 145915)
-- Dependencies: 1606 1975 1605
-- Name: fk_rtactn_procinst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_runtimeaction
    ADD CONSTRAINT fk_rtactn_procinst FOREIGN KEY (processinstance_) REFERENCES jbpm_processinstance(id_);


--
-- TOC entry 2090 (class 2606 OID 145920)
-- Dependencies: 1983 1608 1607
-- Name: fk_swimlaneinst_sl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_swimlaneinstance
    ADD CONSTRAINT fk_swimlaneinst_sl FOREIGN KEY (swimlane_) REFERENCES jbpm_swimlane(id_);


--
-- TOC entry 2091 (class 2606 OID 145925)
-- Dependencies: 1954 1608 1601
-- Name: fk_swimlaneinst_tm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_swimlaneinstance
    ADD CONSTRAINT fk_swimlaneinst_tm FOREIGN KEY (taskmgmtinstance_) REFERENCES jbpm_moduleinstance(id_);


--
-- TOC entry 2088 (class 2606 OID 145930)
-- Dependencies: 1591 1913 1607
-- Name: fk_swl_assdel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_swimlane
    ADD CONSTRAINT fk_swl_assdel FOREIGN KEY (assignmentdelegation_) REFERENCES jbpm_delegation(id_);


--
-- TOC entry 2089 (class 2606 OID 145935)
-- Dependencies: 1600 1607 1950
-- Name: fk_swl_tskmgmtdef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_swimlane
    ADD CONSTRAINT fk_swl_tskmgmtdef FOREIGN KEY (taskmgmtdefinition_) REFERENCES jbpm_moduledefinition(id_);


--
-- TOC entry 2092 (class 2606 OID 145940)
-- Dependencies: 1913 1591 1609
-- Name: fk_task_assdel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fk_task_assdel FOREIGN KEY (assignmentdelegation_) REFERENCES jbpm_delegation(id_);


--
-- TOC entry 2093 (class 2606 OID 145945)
-- Dependencies: 1969 1609 1604
-- Name: fk_task_procdef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fk_task_procdef FOREIGN KEY (processdefinition_) REFERENCES jbpm_processdefinition(id_);


--
-- TOC entry 2094 (class 2606 OID 145950)
-- Dependencies: 1602 1609 1962
-- Name: fk_task_startst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fk_task_startst FOREIGN KEY (startstate_) REFERENCES jbpm_node(id_);


--
-- TOC entry 2095 (class 2606 OID 145955)
-- Dependencies: 1983 1607 1609
-- Name: fk_task_swimlane; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fk_task_swimlane FOREIGN KEY (swimlane_) REFERENCES jbpm_swimlane(id_);


--
-- TOC entry 2096 (class 2606 OID 145960)
-- Dependencies: 1600 1609 1950
-- Name: fk_task_taskmgtdef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fk_task_taskmgtdef FOREIGN KEY (taskmgmtdefinition_) REFERENCES jbpm_moduledefinition(id_);


--
-- TOC entry 2097 (class 2606 OID 145965)
-- Dependencies: 1609 1962 1602
-- Name: fk_task_tasknode; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fk_task_tasknode FOREIGN KEY (tasknode_) REFERENCES jbpm_node(id_);


--
-- TOC entry 2099 (class 2606 OID 145970)
-- Dependencies: 1612 1610 2009
-- Name: fk_taskactpl_tski; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_taskactorpool
    ADD CONSTRAINT fk_taskactpl_tski FOREIGN KEY (taskinstance_) REFERENCES jbpm_taskinstance(id_);


--
-- TOC entry 2102 (class 2606 OID 145975)
-- Dependencies: 1987 1608 1612
-- Name: fk_taskinst_slinst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_taskinstance
    ADD CONSTRAINT fk_taskinst_slinst FOREIGN KEY (swimlaninstance_) REFERENCES jbpm_swimlaneinstance(id_);


--
-- TOC entry 2103 (class 2606 OID 145980)
-- Dependencies: 1612 1996 1609
-- Name: fk_taskinst_task; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_taskinstance
    ADD CONSTRAINT fk_taskinst_task FOREIGN KEY (task_) REFERENCES jbpm_task(id_);


--
-- TOC entry 2104 (class 2606 OID 145985)
-- Dependencies: 1612 1601 1954
-- Name: fk_taskinst_tminst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_taskinstance
    ADD CONSTRAINT fk_taskinst_tminst FOREIGN KEY (taskmgmtinstance_) REFERENCES jbpm_moduleinstance(id_);


--
-- TOC entry 2105 (class 2606 OID 145990)
-- Dependencies: 1612 1613 2015
-- Name: fk_taskinst_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_taskinstance
    ADD CONSTRAINT fk_taskinst_token FOREIGN KEY (token_) REFERENCES jbpm_token(id_);


--
-- TOC entry 2074 (class 2606 OID 145995)
-- Dependencies: 1601 1600 1950
-- Name: fk_taskmgtinst_tmd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_moduleinstance
    ADD CONSTRAINT fk_taskmgtinst_tmd FOREIGN KEY (taskmgmtdefinition_) REFERENCES jbpm_moduledefinition(id_);


--
-- TOC entry 2111 (class 2606 OID 146000)
-- Dependencies: 1614 1601 1954
-- Name: fk_tkvarmap_ctxt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_tokenvariablemap
    ADD CONSTRAINT fk_tkvarmap_ctxt FOREIGN KEY (contextinstance_) REFERENCES jbpm_moduleinstance(id_);


--
-- TOC entry 2112 (class 2606 OID 146005)
-- Dependencies: 1614 1613 2015
-- Name: fk_tkvarmap_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_tokenvariablemap
    ADD CONSTRAINT fk_tkvarmap_token FOREIGN KEY (token_) REFERENCES jbpm_token(id_);


--
-- TOC entry 2107 (class 2606 OID 146010)
-- Dependencies: 1962 1613 1602
-- Name: fk_token_node; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_token
    ADD CONSTRAINT fk_token_node FOREIGN KEY (node_) REFERENCES jbpm_node(id_);


--
-- TOC entry 2108 (class 2606 OID 146015)
-- Dependencies: 1613 2015 1613
-- Name: fk_token_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_token
    ADD CONSTRAINT fk_token_parent FOREIGN KEY (parent_) REFERENCES jbpm_token(id_);


--
-- TOC entry 2109 (class 2606 OID 146020)
-- Dependencies: 1975 1605 1613
-- Name: fk_token_procinst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_token
    ADD CONSTRAINT fk_token_procinst FOREIGN KEY (processinstance_) REFERENCES jbpm_processinstance(id_);


--
-- TOC entry 2110 (class 2606 OID 146025)
-- Dependencies: 1613 1605 1975
-- Name: fk_token_subpi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_token
    ADD CONSTRAINT fk_token_subpi FOREIGN KEY (subprocessinstance_) REFERENCES jbpm_processinstance(id_);


--
-- TOC entry 2113 (class 2606 OID 146030)
-- Dependencies: 1969 1615 1604
-- Name: fk_trans_procdef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_transition
    ADD CONSTRAINT fk_trans_procdef FOREIGN KEY (processdefinition_) REFERENCES jbpm_processdefinition(id_);


--
-- TOC entry 2114 (class 2606 OID 146035)
-- Dependencies: 1602 1615 1962
-- Name: fk_transition_from; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_transition
    ADD CONSTRAINT fk_transition_from FOREIGN KEY (from_) REFERENCES jbpm_node(id_);


--
-- TOC entry 2115 (class 2606 OID 146040)
-- Dependencies: 1602 1615 1962
-- Name: fk_transition_to; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_transition
    ADD CONSTRAINT fk_transition_to FOREIGN KEY (to_) REFERENCES jbpm_node(id_);


--
-- TOC entry 2098 (class 2606 OID 146045)
-- Dependencies: 1609 1611 2001
-- Name: fk_tsk_tskctrl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_task
    ADD CONSTRAINT fk_tsk_tskctrl FOREIGN KEY (taskcontroller_) REFERENCES jbpm_taskcontroller(id_);


--
-- TOC entry 2100 (class 2606 OID 146050)
-- Dependencies: 1610 1966 1603
-- Name: fk_tskactpol_plact; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_taskactorpool
    ADD CONSTRAINT fk_tskactpol_plact FOREIGN KEY (pooledactor_) REFERENCES jbpm_pooledactor(id_);


--
-- TOC entry 2101 (class 2606 OID 146055)
-- Dependencies: 1611 1591 1913
-- Name: fk_tskctrl_deleg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_taskcontroller
    ADD CONSTRAINT fk_tskctrl_deleg FOREIGN KEY (taskcontrollerdelegation_) REFERENCES jbpm_delegation(id_);


--
-- TOC entry 2072 (class 2606 OID 146060)
-- Dependencies: 1609 1600 1996
-- Name: fk_tskdef_start; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_moduledefinition
    ADD CONSTRAINT fk_tskdef_start FOREIGN KEY (starttask_) REFERENCES jbpm_task(id_);


--
-- TOC entry 2106 (class 2606 OID 146065)
-- Dependencies: 1605 1612 1975
-- Name: fk_tskins_prcins; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_taskinstance
    ADD CONSTRAINT fk_tskins_prcins FOREIGN KEY (procinst_) REFERENCES jbpm_processinstance(id_);


--
-- TOC entry 2120 (class 2606 OID 146070)
-- Dependencies: 1617 2009 1612
-- Name: fk_var_tskinst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_variableinstance
    ADD CONSTRAINT fk_var_tskinst FOREIGN KEY (taskinstance_) REFERENCES jbpm_taskinstance(id_);


--
-- TOC entry 2116 (class 2606 OID 146075)
-- Dependencies: 1616 1962 1602
-- Name: fk_varacc_procst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_variableaccess
    ADD CONSTRAINT fk_varacc_procst FOREIGN KEY (processstate_) REFERENCES jbpm_node(id_);


--
-- TOC entry 2117 (class 2606 OID 146080)
-- Dependencies: 1616 1900 1586
-- Name: fk_varacc_script; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_variableaccess
    ADD CONSTRAINT fk_varacc_script FOREIGN KEY (script_) REFERENCES jbpm_action(id_);


--
-- TOC entry 2118 (class 2606 OID 146085)
-- Dependencies: 2001 1616 1611
-- Name: fk_varacc_tskctrl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_variableaccess
    ADD CONSTRAINT fk_varacc_tskctrl FOREIGN KEY (taskcontroller_) REFERENCES jbpm_taskcontroller(id_);


--
-- TOC entry 2121 (class 2606 OID 146090)
-- Dependencies: 1605 1975 1617
-- Name: fk_varinst_prcinst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_variableinstance
    ADD CONSTRAINT fk_varinst_prcinst FOREIGN KEY (processinstance_) REFERENCES jbpm_processinstance(id_);


--
-- TOC entry 2122 (class 2606 OID 146095)
-- Dependencies: 1617 2015 1613
-- Name: fk_varinst_tk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_variableinstance
    ADD CONSTRAINT fk_varinst_tk FOREIGN KEY (token_) REFERENCES jbpm_token(id_);


--
-- TOC entry 2123 (class 2606 OID 146100)
-- Dependencies: 2019 1617 1614
-- Name: fk_varinst_tkvarmp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jbpm_variableinstance
    ADD CONSTRAINT fk_varinst_tkvarmp FOREIGN KEY (tokenvariablemap_) REFERENCES jbpm_tokenvariablemap(id_);


--
-- TOC entry 2160 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-06-19 16:00:35

--
-- PostgreSQL database dump complete
--

