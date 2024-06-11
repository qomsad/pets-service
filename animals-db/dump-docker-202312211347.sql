--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 15.3

-- Started on 2023-12-21 13:47:08

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

--
-- TOC entry 5 (class 2615 OID 17611)
-- Name: pets; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA pets;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 17790)
-- Name: catch_act; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.catch_act (
    id bigint NOT NULL,
    organization_id bigint NOT NULL,
    municipality_id bigint NOT NULL,
    capture_date date NOT NULL,
    contract_id bigint NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 17788)
-- Name: act_id_seq; Type: SEQUENCE; Schema: pets; Owner: -
--

CREATE SEQUENCE pets.act_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3148 (class 0 OID 0)
-- Dependencies: 218
-- Name: act_id_seq; Type: SEQUENCE OWNED BY; Schema: pets; Owner: -
--

ALTER SEQUENCE pets.act_id_seq OWNED BY pets.catch_act.id;


--
-- TOC entry 211 (class 1259 OID 17707)
-- Name: auth_privileges; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.auth_privileges (
    id bigint NOT NULL,
    entity text NOT NULL,
    possibility text NOT NULL,
    restriction text NOT NULL,
    role_id bigint NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 17705)
-- Name: auth_privileges_id_seq; Type: SEQUENCE; Schema: pets; Owner: -
--

CREATE SEQUENCE pets.auth_privileges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3149 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_privileges_id_seq; Type: SEQUENCE OWNED BY; Schema: pets; Owner: -
--

ALTER SEQUENCE pets.auth_privileges_id_seq OWNED BY pets.auth_privileges.id;


--
-- TOC entry 209 (class 1259 OID 17693)
-- Name: auth_role; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.auth_role (
    id bigint NOT NULL,
    role_name text NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 17691)
-- Name: auth_role_id_seq; Type: SEQUENCE; Schema: pets; Owner: -
--

CREATE SEQUENCE pets.auth_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3150 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_role_id_seq; Type: SEQUENCE OWNED BY; Schema: pets; Owner: -
--

ALTER SEQUENCE pets.auth_role_id_seq OWNED BY pets.auth_role.id;


--
-- TOC entry 229 (class 1259 OID 17891)
-- Name: auth_role_privileges; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.auth_role_privileges (
    role_id bigint NOT NULL,
    privileges_id bigint NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 17723)
-- Name: auth_user; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.auth_user (
    id bigint NOT NULL,
    first_name text NOT NULL,
    middle_name text,
    last_name text NOT NULL,
    email text,
    login text NOT NULL,
    password character varying(64) NOT NULL,
    organization_id bigint,
    municipality_id bigint,
    role_id bigint NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 17721)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: pets; Owner: -
--

CREATE SEQUENCE pets.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3151 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: pets; Owner: -
--

ALTER SEQUENCE pets.auth_user_id_seq OWNED BY pets.auth_user.id;


--
-- TOC entry 221 (class 1259 OID 17813)
-- Name: catch_act_card; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.catch_act_card (
    id bigint NOT NULL,
    category text NOT NULL,
    sex text,
    breed text,
    size text,
    wool text,
    color text,
    ears text,
    tail text,
    special_signs text,
    tag text,
    chip_number text,
    act_id bigint NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 17811)
-- Name: catch_act_card_id_seq; Type: SEQUENCE; Schema: pets; Owner: -
--

CREATE SEQUENCE pets.catch_act_card_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 220
-- Name: catch_act_card_id_seq; Type: SEQUENCE OWNED BY; Schema: pets; Owner: -
--

ALTER SEQUENCE pets.catch_act_card_id_seq OWNED BY pets.catch_act_card.id;


--
-- TOC entry 225 (class 1259 OID 17841)
-- Name: catch_schedule; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.catch_schedule (
    id bigint NOT NULL,
    month integer NOT NULL,
    year integer NOT NULL,
    status_id bigint NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 17839)
-- Name: catch_schedule_id_seq; Type: SEQUENCE; Schema: pets; Owner: -
--

CREATE SEQUENCE pets.catch_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3153 (class 0 OID 0)
-- Dependencies: 224
-- Name: catch_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: pets; Owner: -
--

ALTER SEQUENCE pets.catch_schedule_id_seq OWNED BY pets.catch_schedule.id;


--
-- TOC entry 223 (class 1259 OID 17830)
-- Name: catch_schedule_status; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.catch_schedule_status (
    id bigint NOT NULL,
    status_name text NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 17828)
-- Name: catch_schedule_status_id_seq; Type: SEQUENCE; Schema: pets; Owner: -
--

CREATE SEQUENCE pets.catch_schedule_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3154 (class 0 OID 0)
-- Dependencies: 222
-- Name: catch_schedule_status_id_seq; Type: SEQUENCE OWNED BY; Schema: pets; Owner: -
--

ALTER SEQUENCE pets.catch_schedule_status_id_seq OWNED BY pets.catch_schedule_status.id;


--
-- TOC entry 215 (class 1259 OID 17736)
-- Name: contract; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.contract (
    id bigint NOT NULL,
    num character varying(255) NOT NULL,
    conclusion_date date NOT NULL,
    completion_date date NOT NULL,
    customer_id bigint NOT NULL,
    contractor_id bigint NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 17756)
-- Name: contract_cost; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.contract_cost (
    id bigint NOT NULL,
    price double precision NOT NULL,
    contract_id bigint NOT NULL,
    municipality_id bigint NOT NULL,
    CONSTRAINT catch_is_positive_or_zero CHECK ((price >= (0)::double precision))
);


--
-- TOC entry 216 (class 1259 OID 17754)
-- Name: contract_cost_id_seq; Type: SEQUENCE; Schema: pets; Owner: -
--

CREATE SEQUENCE pets.contract_cost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3155 (class 0 OID 0)
-- Dependencies: 216
-- Name: contract_cost_id_seq; Type: SEQUENCE OWNED BY; Schema: pets; Owner: -
--

ALTER SEQUENCE pets.contract_cost_id_seq OWNED BY pets.contract_cost.id;


--
-- TOC entry 214 (class 1259 OID 17734)
-- Name: contract_id_seq; Type: SEQUENCE; Schema: pets; Owner: -
--

CREATE SEQUENCE pets.contract_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3156 (class 0 OID 0)
-- Dependencies: 214
-- Name: contract_id_seq; Type: SEQUENCE OWNED BY; Schema: pets; Owner: -
--

ALTER SEQUENCE pets.contract_id_seq OWNED BY pets.contract.id;


--
-- TOC entry 203 (class 1259 OID 17624)
-- Name: dic_legal_type; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.dic_legal_type (
    id bigint NOT NULL,
    record_name character varying(255) NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 17622)
-- Name: dic_legal_type_id_seq; Type: SEQUENCE; Schema: pets; Owner: -
--

CREATE SEQUENCE pets.dic_legal_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3157 (class 0 OID 0)
-- Dependencies: 202
-- Name: dic_legal_type_id_seq; Type: SEQUENCE OWNED BY; Schema: pets; Owner: -
--

ALTER SEQUENCE pets.dic_legal_type_id_seq OWNED BY pets.dic_legal_type.id;


--
-- TOC entry 201 (class 1259 OID 17614)
-- Name: dic_municipality; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.dic_municipality (
    id bigint NOT NULL,
    record_name character varying(255) NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 17612)
-- Name: dic_municipality_id_seq; Type: SEQUENCE; Schema: pets; Owner: -
--

CREATE SEQUENCE pets.dic_municipality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3158 (class 0 OID 0)
-- Dependencies: 200
-- Name: dic_municipality_id_seq; Type: SEQUENCE OWNED BY; Schema: pets; Owner: -
--

ALTER SEQUENCE pets.dic_municipality_id_seq OWNED BY pets.dic_municipality.id;


--
-- TOC entry 205 (class 1259 OID 17632)
-- Name: dic_organization_type; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.dic_organization_type (
    id bigint NOT NULL,
    record_name character varying(255) NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 17630)
-- Name: dic_organization_type_id_seq; Type: SEQUENCE; Schema: pets; Owner: -
--

CREATE SEQUENCE pets.dic_organization_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3159 (class 0 OID 0)
-- Dependencies: 204
-- Name: dic_organization_type_id_seq; Type: SEQUENCE OWNED BY; Schema: pets; Owner: -
--

ALTER SEQUENCE pets.dic_organization_type_id_seq OWNED BY pets.dic_organization_type.id;


--
-- TOC entry 231 (class 1259 OID 17924)
-- Name: log_info; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.log_info (
    id bigint NOT NULL,
    "user" text,
    action_date timestamp with time zone,
    action text,
    entity text,
    registry text,
    id_object bigint
);


--
-- TOC entry 230 (class 1259 OID 17922)
-- Name: log_info_id_seq; Type: SEQUENCE; Schema: pets; Owner: -
--

CREATE SEQUENCE pets.log_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3160 (class 0 OID 0)
-- Dependencies: 230
-- Name: log_info_id_seq; Type: SEQUENCE OWNED BY; Schema: pets; Owner: -
--

ALTER SEQUENCE pets.log_info_id_seq OWNED BY pets.log_info.id;


--
-- TOC entry 207 (class 1259 OID 17656)
-- Name: organization; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.organization (
    id bigint NOT NULL,
    name character varying(255),
    address character varying(255),
    inn character varying(12),
    kpp character varying(9),
    organization_type_id bigint NOT NULL,
    legal_type_id bigint NOT NULL,
    municipality_id bigint NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 17654)
-- Name: organization_id_seq; Type: SEQUENCE; Schema: pets; Owner: -
--

CREATE SEQUENCE pets.organization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3161 (class 0 OID 0)
-- Dependencies: 206
-- Name: organization_id_seq; Type: SEQUENCE OWNED BY; Schema: pets; Owner: -
--

ALTER SEQUENCE pets.organization_id_seq OWNED BY pets.organization.id;


--
-- TOC entry 228 (class 1259 OID 17875)
-- Name: report_municipality; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.report_municipality (
    id bigint NOT NULL,
    number integer NOT NULL,
    date_start date NOT NULL,
    date_end date NOT NULL,
    status_id bigint NOT NULL,
    date_status date NOT NULL,
    total_cost double precision NOT NULL,
    municipality_id bigint NOT NULL,
    number_of_animals integer NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 17873)
-- Name: report_id_seq; Type: SEQUENCE; Schema: pets; Owner: -
--

CREATE SEQUENCE pets.report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3162 (class 0 OID 0)
-- Dependencies: 227
-- Name: report_id_seq; Type: SEQUENCE OWNED BY; Schema: pets; Owner: -
--

ALTER SEQUENCE pets.report_id_seq OWNED BY pets.report_municipality.id;


--
-- TOC entry 226 (class 1259 OID 17852)
-- Name: report_municipality_status; Type: TABLE; Schema: pets; Owner: -
--

CREATE TABLE pets.report_municipality_status (
    id bigint NOT NULL,
    status_name text NOT NULL
);


--
-- TOC entry 2908 (class 2604 OID 17710)
-- Name: auth_privileges id; Type: DEFAULT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.auth_privileges ALTER COLUMN id SET DEFAULT nextval('pets.auth_privileges_id_seq'::regclass);


--
-- TOC entry 2907 (class 2604 OID 17696)
-- Name: auth_role id; Type: DEFAULT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.auth_role ALTER COLUMN id SET DEFAULT nextval('pets.auth_role_id_seq'::regclass);


--
-- TOC entry 2909 (class 2604 OID 17726)
-- Name: auth_user id; Type: DEFAULT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.auth_user ALTER COLUMN id SET DEFAULT nextval('pets.auth_user_id_seq'::regclass);


--
-- TOC entry 2912 (class 2604 OID 17793)
-- Name: catch_act id; Type: DEFAULT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.catch_act ALTER COLUMN id SET DEFAULT nextval('pets.act_id_seq'::regclass);


--
-- TOC entry 2913 (class 2604 OID 17816)
-- Name: catch_act_card id; Type: DEFAULT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.catch_act_card ALTER COLUMN id SET DEFAULT nextval('pets.catch_act_card_id_seq'::regclass);


--
-- TOC entry 2915 (class 2604 OID 17844)
-- Name: catch_schedule id; Type: DEFAULT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.catch_schedule ALTER COLUMN id SET DEFAULT nextval('pets.catch_schedule_id_seq'::regclass);


--
-- TOC entry 2914 (class 2604 OID 17833)
-- Name: catch_schedule_status id; Type: DEFAULT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.catch_schedule_status ALTER COLUMN id SET DEFAULT nextval('pets.catch_schedule_status_id_seq'::regclass);


--
-- TOC entry 2910 (class 2604 OID 17739)
-- Name: contract id; Type: DEFAULT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.contract ALTER COLUMN id SET DEFAULT nextval('pets.contract_id_seq'::regclass);


--
-- TOC entry 2911 (class 2604 OID 17759)
-- Name: contract_cost id; Type: DEFAULT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.contract_cost ALTER COLUMN id SET DEFAULT nextval('pets.contract_cost_id_seq'::regclass);


--
-- TOC entry 2904 (class 2604 OID 17627)
-- Name: dic_legal_type id; Type: DEFAULT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.dic_legal_type ALTER COLUMN id SET DEFAULT nextval('pets.dic_legal_type_id_seq'::regclass);


--
-- TOC entry 2903 (class 2604 OID 17617)
-- Name: dic_municipality id; Type: DEFAULT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.dic_municipality ALTER COLUMN id SET DEFAULT nextval('pets.dic_municipality_id_seq'::regclass);


--
-- TOC entry 2905 (class 2604 OID 17635)
-- Name: dic_organization_type id; Type: DEFAULT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.dic_organization_type ALTER COLUMN id SET DEFAULT nextval('pets.dic_organization_type_id_seq'::regclass);


--
-- TOC entry 2917 (class 2604 OID 17927)
-- Name: log_info id; Type: DEFAULT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.log_info ALTER COLUMN id SET DEFAULT nextval('pets.log_info_id_seq'::regclass);


--
-- TOC entry 2906 (class 2604 OID 17659)
-- Name: organization id; Type: DEFAULT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.organization ALTER COLUMN id SET DEFAULT nextval('pets.organization_id_seq'::regclass);


--
-- TOC entry 2916 (class 2604 OID 17878)
-- Name: report_municipality id; Type: DEFAULT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.report_municipality ALTER COLUMN id SET DEFAULT nextval('pets.report_id_seq'::regclass);


--
-- TOC entry 3122 (class 0 OID 17707)
-- Dependencies: 211
-- Data for Name: auth_privileges; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.auth_privileges (id, entity, possibility, restriction, role_id) FROM stdin;
1	ORGANIZATION	SELECT	ALL	3
2	ORGANIZATION	INSERT	ALL	3
3	ORGANIZATION	UPDATE	ALL	3
4	ORGANIZATION	DELETE	ALL	3
5	ORGANIZATION	SELECT	ORG	3
6	ORGANIZATION	INSERT	ORG	3
7	ORGANIZATION	UPDATE	ORG	3
8	ORGANIZATION	DELETE	ORG	3
9	ORGANIZATION	SELECT	MUN	3
10	ORGANIZATION	INSERT	MUN	3
11	ORGANIZATION	UPDATE	MUN	3
12	ORGANIZATION	DELETE	MUN	3
13	CONTRACT	SELECT	ALL	3
14	CONTRACT	INSERT	ALL	3
15	CONTRACT	UPDATE	ALL	3
16	CONTRACT	DELETE	ALL	3
17	CONTRACT	SELECT	ORG	3
18	CONTRACT	INSERT	ORG	3
19	CONTRACT	UPDATE	ORG	3
20	CONTRACT	DELETE	ORG	3
21	CONTRACT	SELECT	MUN	3
22	CONTRACT	INSERT	MUN	3
23	CONTRACT	UPDATE	MUN	3
24	CONTRACT	DELETE	MUN	3
25	CATCH_ACT	SELECT	ALL	3
26	CATCH_ACT	INSERT	ALL	3
27	CATCH_ACT	UPDATE	ALL	3
28	CATCH_ACT	DELETE	ALL	3
29	CATCH_ACT	SELECT	ORG	3
30	CATCH_ACT	INSERT	ORG	3
31	CATCH_ACT	UPDATE	ORG	3
32	CATCH_ACT	DELETE	ORG	3
33	CATCH_ACT	SELECT	MUN	3
34	CATCH_ACT	INSERT	MUN	3
35	CATCH_ACT	UPDATE	MUN	3
36	CATCH_ACT	DELETE	MUN	3
37	CATCH_SCHEDULE	SELECT	ALL	3
38	CATCH_SCHEDULE	INSERT	ALL	3
39	CATCH_SCHEDULE	UPDATE	ALL	3
40	CATCH_SCHEDULE	DELETE	ALL	3
41	CATCH_SCHEDULE	SELECT	ORG	3
42	CATCH_SCHEDULE	INSERT	ORG	3
43	CATCH_SCHEDULE	UPDATE	ORG	3
44	CATCH_SCHEDULE	DELETE	ORG	3
45	CATCH_SCHEDULE	SELECT	MUN	3
46	CATCH_SCHEDULE	INSERT	MUN	3
47	CATCH_SCHEDULE	UPDATE	MUN	3
48	CATCH_SCHEDULE	DELETE	MUN	3
49	REPORT_MUNICIPALITY	SELECT	ALL	3
50	REPORT_MUNICIPALITY	INSERT	ALL	3
51	REPORT_MUNICIPALITY	UPDATE	ALL	3
52	REPORT_MUNICIPALITY	DELETE	ALL	3
53	ORGANIZATION	SELECT	ALL	4
54	ORGANIZATION	SELECT	ORG	4
55	ORGANIZATION	SELECT	MUN	4
56	CONTRACT	SELECT	ALL	4
57	CONTRACT	SELECT	ORG	4
58	CONTRACT	SELECT	MUN	4
59	CATCH_ACT	SELECT	ALL	4
60	CATCH_ACT	SELECT	ORG	4
61	CATCH_ACT	SELECT	MUN	4
62	CATCH_SCHEDULE	SELECT	ALL	4
63	CATCH_SCHEDULE	SELECT	ORG	4
64	CATCH_SCHEDULE	SELECT	MUN	4
65	REPORT_MUNICIPALITY	SELECT	ALL	4
66	ORGANIZATION	SELECT	ALL	11
67	ORGANIZATION	SELECT	ORG	11
68	ORGANIZATION	SELECT	MUN	11
69	ORGANIZATION	SELECT	ALL	14
70	ORGANIZATION	SELECT	ORG	14
71	ORGANIZATION	SELECT	MUN	14
72	ORGANIZATION	SELECT	ALL	7
73	ORGANIZATION	SELECT	ORG	7
74	ORGANIZATION	SELECT	MUN	7
75	ORGANIZATION	SELECT	ALL	13
76	ORGANIZATION	SELECT	ORG	13
77	ORGANIZATION	SELECT	MUN	13
78	ORGANIZATION	SELECT	ALL	16
79	ORGANIZATION	SELECT	ORG	16
80	ORGANIZATION	SELECT	MUN	16
81	ORGANIZATION	SELECT	ALL	8
82	ORGANIZATION	SELECT	ORG	8
83	ORGANIZATION	SELECT	MUN	8
84	ORGANIZATION	SELECT	ALL	10
85	ORGANIZATION	SELECT	ORG	10
86	ORGANIZATION	SELECT	MUN	10
87	ORGANIZATION	SELECT	ALL	6
88	ORGANIZATION	INSERT	ALL	6
89	ORGANIZATION	UPDATE	ALL	6
90	ORGANIZATION	DELETE	ALL	6
91	ORGANIZATION	SELECT	ORG	6
92	ORGANIZATION	INSERT	ORG	6
93	ORGANIZATION	UPDATE	ORG	6
94	ORGANIZATION	DELETE	ORG	6
95	ORGANIZATION	SELECT	MUN	6
96	ORGANIZATION	INSERT	MUN	6
97	ORGANIZATION	UPDATE	MUN	6
98	ORGANIZATION	DELETE	MUN	6
99	ORGANIZATION	SELECT	ALL	9
100	ORGANIZATION	INSERT	ALL	9
101	ORGANIZATION	UPDATE	ALL	9
102	ORGANIZATION	DELETE	ALL	9
103	ORGANIZATION	SELECT	ORG	9
104	ORGANIZATION	INSERT	ORG	9
105	ORGANIZATION	UPDATE	ORG	9
106	ORGANIZATION	DELETE	ORG	9
107	ORGANIZATION	SELECT	MUN	9
108	ORGANIZATION	INSERT	MUN	9
109	ORGANIZATION	UPDATE	MUN	9
110	ORGANIZATION	DELETE	MUN	9
111	CONTRACT	SELECT	ALL	5
112	CONTRACT	SELECT	ORG	5
113	CONTRACT	SELECT	MUN	5
114	CONTRACT	SELECT	ALL	6
115	CONTRACT	SELECT	ORG	6
116	CONTRACT	SELECT	MUN	6
117	CONTRACT	SELECT	ALL	7
118	CONTRACT	SELECT	ORG	7
119	CONTRACT	SELECT	MUN	7
120	CONTRACT	SELECT	ORG	14
121	CONTRACT	SELECT	ORG	11
122	CONTRACT	SELECT	ORG	16
123	CONTRACT	SELECT	ORG	13
124	CONTRACT	SELECT	MUN	8
125	CONTRACT	SELECT	MUN	10
126	CONTRACT	SELECT	MUN	9
127	CONTRACT	INSERT	MUN	9
128	CONTRACT	UPDATE	MUN	9
129	CONTRACT	DELETE	MUN	9
130	CATCH_ACT	SELECT	ORG	12
131	CATCH_ACT	INSERT	ORG	12
132	CATCH_ACT	UPDATE	ORG	12
133	CATCH_ACT	DELETE	ORG	12
134	CATCH_ACT	SELECT	ALL	5
135	CATCH_ACT	SELECT	ORG	5
136	CATCH_ACT	SELECT	MUN	5
137	CATCH_ACT	SELECT	ALL	14
138	CATCH_ACT	SELECT	ORG	14
139	CATCH_ACT	SELECT	MUN	14
140	CATCH_ACT	SELECT	ALL	6
141	CATCH_ACT	SELECT	ORG	6
142	CATCH_ACT	SELECT	MUN	6
143	CATCH_ACT	SELECT	ALL	15
144	CATCH_ACT	SELECT	ORG	15
145	CATCH_ACT	SELECT	MUN	15
146	CATCH_ACT	SELECT	ALL	7
147	CATCH_ACT	SELECT	ORG	7
148	CATCH_ACT	SELECT	MUN	7
149	CATCH_ACT	SELECT	ALL	16
150	CATCH_ACT	SELECT	ORG	16
151	CATCH_ACT	SELECT	MUN	16
152	CATCH_ACT	SELECT	MUN	8
153	CATCH_ACT	SELECT	MUN	9
154	CATCH_ACT	SELECT	MUN	10
155	CATCH_ACT	SELECT	ORG	11
156	CATCH_ACT	SELECT	ORG	13
157	CATCH_SCHEDULE	SELECT	ALL	5
158	CATCH_SCHEDULE	SELECT	ORG	5
159	CATCH_SCHEDULE	SELECT	MUN	5
160	CATCH_SCHEDULE	SELECT	ALL	6
161	CATCH_SCHEDULE	SELECT	ORG	6
162	CATCH_SCHEDULE	SELECT	MUN	6
163	CATCH_SCHEDULE	SELECT	ALL	7
164	CATCH_SCHEDULE	SELECT	ORG	7
165	CATCH_SCHEDULE	SELECT	MUN	7
166	CATCH_SCHEDULE	SELECT	MUN	9
167	CATCH_SCHEDULE	SELECT	ORG	12
168	CATCH_SCHEDULE	INSERT	ORG	12
169	CATCH_SCHEDULE	UPDATE	ORG	12
170	CATCH_SCHEDULE	DELETE	ORG	12
171	REPORT_MUNICIPALITY	SELECT	ALL	8
172	REPORT_MUNICIPALITY	INSERT	ALL	8
173	REPORT_MUNICIPALITY	UPDATE	ALL	8
174	REPORT_MUNICIPALITY	DELETE	ALL	8
175	REPORT_MUNICIPALITY	SELECT	ALL	9
176	REPORT_MUNICIPALITY	INSERT	ALL	9
177	REPORT_MUNICIPALITY	UPDATE	ALL	9
178	REPORT_MUNICIPALITY	DELETE	ALL	9
179	REPORT_MUNICIPALITY	SELECT	ALL	10
180	REPORT_MUNICIPALITY	INSERT	ALL	10
181	REPORT_MUNICIPALITY	UPDATE	ALL	10
182	REPORT_MUNICIPALITY	DELETE	ALL	10
\.


--
-- TOC entry 3120 (class 0 OID 17693)
-- Dependencies: 209
-- Data for Name: auth_role; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.auth_role (id, role_name) FROM stdin;
1	Любая роль
2	Гость
3	Супер админ с полным доступом
4	Просмотр всего без права редактирования
5	Куратор Ветслужбы
6	Оператор Ветслужбы
7	Подписант Ветслужбы
8	Куратор ОМСУ
9	Оператор ОМСУ
10	Подписант ОМСУ
11	Куратор по отлову
12	Оператор по отлову
13	Подписант по отлову
14	Куратор приюта
15	Оператор приюта
16	Подписант приюта
\.


--
-- TOC entry 3140 (class 0 OID 17891)
-- Dependencies: 229
-- Data for Name: auth_role_privileges; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.auth_role_privileges (role_id, privileges_id) FROM stdin;
3	1
3	2
3	3
3	4
3	5
3	6
3	7
3	8
3	9
3	10
3	11
3	12
3	13
3	14
3	15
3	16
3	17
3	18
3	19
3	20
3	21
3	22
3	23
3	24
3	25
3	26
3	27
3	28
3	29
3	30
3	31
3	32
3	33
3	34
3	35
3	36
3	37
3	38
3	39
3	40
3	41
3	42
3	43
3	44
3	45
3	46
3	47
3	48
3	49
3	50
3	51
3	52
4	1
4	5
4	9
4	13
4	17
4	21
4	25
4	29
4	33
4	37
4	41
4	45
4	49
11	1
11	5
11	9
14	1
14	5
14	9
7	1
7	5
7	9
13	1
13	5
13	9
16	1
16	5
16	9
8	1
8	5
8	9
10	1
10	5
10	9
6	1
6	2
6	3
6	4
6	5
6	6
6	7
6	8
6	9
6	10
6	11
6	12
9	1
9	2
9	3
9	4
9	5
9	6
9	7
9	8
9	9
9	10
9	11
9	12
5	13
5	17
5	21
6	13
6	17
6	21
7	13
7	17
7	21
14	17
11	17
16	17
13	17
8	21
10	21
9	21
9	22
9	23
9	24
12	29
12	30
12	31
12	32
5	25
5	29
5	33
14	25
14	29
14	33
6	25
6	29
6	33
15	25
15	29
15	33
7	25
7	29
7	33
16	25
16	29
16	33
8	33
9	33
10	33
11	29
13	29
5	37
5	41
5	45
6	37
6	41
6	45
7	37
7	41
7	45
9	45
12	41
12	42
12	43
12	44
8	49
8	50
8	51
8	52
9	49
9	50
9	51
9	52
10	49
10	50
10	51
10	52
\.


--
-- TOC entry 3124 (class 0 OID 17723)
-- Dependencies: 213
-- Data for Name: auth_user; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.auth_user (id, first_name, middle_name, last_name, email, login, password, organization_id, municipality_id, role_id) FROM stdin;
1	Админ		Супер		admin	admin_g	\N	\N	3
2	Гость				anon	anon_g	\N	\N	4
3	Захар	Владиславович	Беляев	beljaev@mail.ru	opervet	opervet_g	2	4	6
4	Елизавета	Егоровна	Воробьева	vorobeva@mail.ru	curvet	curvet_g	2	4	5
5	Лев	Егорович	Ткачев	tkachev@mail.ru	podvet	podvet_g	2	4	7
6	Виктория	Робертовна	Леонтьева	leonteva@mail.ru	curtyumen	curtyumen_g	1	4	8
7	Алексей	Михайлович	Григорьев	grigorev@mail.ru	curtobol	curtobol_g	3	3	8
8	Никита	Александрович	Орлов	orlov@mail.ru	curarmiz	curarmiz_g	4	6	8
9	Мария	Вячеславовна	Пастухова	pastuhova@mail.ru	curgol	curgol_g	5	7	8
10	Макар	Ильич	Филиппов	filippov@mail.ru	curishim	curishim_g	7	2	8
11	Виктор	Тимофеевич	Громов	gromov@mail.ru	opertyumen	opertyumen_g	1	4	9
12	Есения	Николаевна	Сычева	sycheva@mail.ru	opergol	opergol_g	5	7	9
13	Юлия	Альбертовна	Ситникова	sitnikova@mail.ru	sitnikova	sitnikova_g	10	2	12
14	Константин	Аркадьевич	Давлетов	davletovka@mail.ru	davletovc	davletovc_g	22	7	14
15	Полина	Дмитриевна	Васильева	vasileva@mail.ru	davletovo	davletovo_g	22	7	15
16	Лада	Николаевна	Худякова	hudjakova@mail.ru	davletovp	davletovp_g	22	7	16
17	Леонид	Данилович	Соловьев	solovev@mail.ru	davletovkac	davletovkac_g	22	7	11
18	Никита	Георгиевич	Богданов	bogdanov@mail.ru	davletovkao	davletovkao_g	22	7	12
19	Виктор	Александрович	Зайцев	zajcev@mail.ru	davletovkap	davletovkap_g	22	7	13
20	Иван	Иваныч	Иванов	ivanov@mail.ru	ivanov	ivanov_g	23	3	12
21	Леонид	Петрович	Сидоров	sidorov@mail.ru	sidorov	sidorov_g	24	4	12
22	Дарья	Сергеевна	Петрова	petrova@mail.ru	petrova	petrova_g	25	4	12
23	Владимир	Георгиевич	Демидов	demidov@mail.ru	demidov	demidov_g	28	2	12
24	Егор	Ярославович	Воронин	voronin@mail.ru	voronin	voronin_g	30	7	12
\.


--
-- TOC entry 3130 (class 0 OID 17790)
-- Dependencies: 219
-- Data for Name: catch_act; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.catch_act (id, organization_id, municipality_id, capture_date, contract_id) FROM stdin;
3	22	1	2023-11-11	11
2	22	2	2023-03-01	2
1	22	1	2023-02-12	11
\.


--
-- TOC entry 3132 (class 0 OID 17813)
-- Dependencies: 221
-- Data for Name: catch_act_card; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.catch_act_card (id, category, sex, breed, size, wool, color, ears, tail, special_signs, tag, chip_number, act_id) FROM stdin;
7	Собака	Самка	Порода	Большой	Есть	Есть	Есть	Есть	Нет	32421	43534539	3
6	Собака	Самец	Порода	Большой	Есть	Есть	Есть	Есть	Нет	324	2323423	3
8	Собака	Самка	Порода	Нет	Есть	Есть	Есть	Есть	нет	342	234	3
3	Кошка	Самец	Персидская	Мельнкий	Длинная	Белый	Прямые	Длинный	Отсутствуют	456789123	DEF456	2
4	Собака	Самец	Овчарка	Большой	Короткая	Рыжий	Висячие	Длинный	Отсутствуют	321654987	GHI789	2
1	Кошка	Самка	Сиамская	Большой	Короткая	Коричневый	Прямые	Длинный	Отсутствуют	123456789	ABC123	1
2	Собака	Самец	Лабрадор	Средний	Длинная	Черный	Висячие	Короткий	Большой рубец на животе	987654321	XYZ789	1
5	Кошка	Самка	Британская	Средний	Короткая	Серый	Прямые	Короткий	Отсутствуют	987321654	JKL789	1
\.


--
-- TOC entry 3136 (class 0 OID 17841)
-- Dependencies: 225
-- Data for Name: catch_schedule; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.catch_schedule (id, month, year, status_id) FROM stdin;
3	10	2023	2
1	10	2023	1
\.


--
-- TOC entry 3134 (class 0 OID 17830)
-- Dependencies: 223
-- Data for Name: catch_schedule_status; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.catch_schedule_status (id, status_name) FROM stdin;
1	Не действует
2	В исполнении
3	Исполнен
4	Истёк без отлова
\.


--
-- TOC entry 3126 (class 0 OID 17736)
-- Dependencies: 215
-- Data for Name: contract; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.contract (id, num, conclusion_date, completion_date, customer_id, contractor_id) FROM stdin;
1	R12023-10.1#1	2023-10-01	2023-10-31	1	24
2	R12023-10.1#2	2023-10-01	2023-10-31	1	25
3	R52023-11.1#1	2023-11-01	2023-11-30	5	22
4	R52023-11.2#2	2023-11-01	2023-11-30	5	22
5	R32023-11.2#2	2023-11-01	2023-11-30	3	23
6	R72023-11.2#2	2023-11-01	2023-11-30	7	28
10	23123	2023-02-23	2023-12-12	26	28
11	2324234	2023-01-01	2023-12-31	1	22
\.


--
-- TOC entry 3128 (class 0 OID 17756)
-- Dependencies: 217
-- Data for Name: contract_cost; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.contract_cost (id, price, contract_id, municipality_id) FROM stdin;
1	3000	1	4
2	5000	1	6
3	2500	2	4
4	3000	2	2
5	1000	3	7
6	1200	4	7
7	2400	5	3
8	2800	5	2
9	2500	6	2
10	123	10	5
11	123	11	1
12	124	11	7
\.


--
-- TOC entry 3114 (class 0 OID 17624)
-- Dependencies: 203
-- Data for Name: dic_legal_type; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.dic_legal_type (id, record_name) FROM stdin;
1	Юридическое лицо
2	Индивидуальный предприниматель
\.


--
-- TOC entry 3112 (class 0 OID 17614)
-- Dependencies: 201
-- Data for Name: dic_municipality; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.dic_municipality (id, record_name) FROM stdin;
1	г. Заводоуковск
2	г. Ишим
3	г. Тобольск
4	г. Тюмень
5	г. Ялуторовск
6	с. Армизонское
7	п. Голышманово
8	с. Нижняя Тавда
9	с. Омутинское
10	с. Сладково
11	с. Уват
12	с. Упорово
13	с. Юргинское
14	с. Ярково
\.


--
-- TOC entry 3116 (class 0 OID 17632)
-- Dependencies: 205
-- Data for Name: dic_organization_type; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.dic_organization_type (id, record_name) FROM stdin;
1	Исполнительный орган государственной власти
2	Орган местного самоуправления
3	Приют
4	Организация по отлову
5	Организация по отлову и приют
6	Организация по транспортировке
7	Ветеринарная клиника: государственная
8	Ветеринарная клиника: частная
9	Благотворительный фонд
10	Организации по продаже товаров и предоставлению услуг для животных
11	Ветеринарная клиника: муниципальная
\.


--
-- TOC entry 3142 (class 0 OID 17924)
-- Dependencies: 231
-- Data for Name: log_info; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.log_info (id, "user", action_date, action, entity, registry, id_object) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 17656)
-- Dependencies: 207
-- Data for Name: organization; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.organization (id, name, address, inn, kpp, organization_type_id, legal_type_id, municipality_id) FROM stdin;
1	Администрация города Тюмени	ул. Первомайская, д. 20, Тюмень	27076758	860201001	2	1	1
2	Ветеринарная служба Тюменской области	ул. Институтская, д. 2, к. 1, Тюмень	8601012936	860101001	1	1	1
3	Администрация города Тобольска	ул. Аптекарская, д. 3, Тобольск	8603032896	860301001	2	1	1
4	Администрация села Армизонское	ул. Карла Маркса, д. 1, с. Армизонское	8620016728	862001001	2	1	1
5	Администрация поселка Голышманово	ул. Садовая, д. 80, п. Голышманово	8620016767	862001001	2	1	1
6	OOO "Ай-болит"	ул. Сиреневая, д. 10, Ишим	860112223334	861111111	8	1	1
7	Администрация города Ишим	ул. Гагарина, д. 67, Ишим	8601003378	860101001	2	1	1
8	Приют для животных "Спасение"	ул. Цветочная, д. 10, Тюмень	123456789012	123456789	3	1	1
9	Ветеринарная клиника "Забота"	пр. Солнечный, д. 25, Тобольск	987654321098	987654321	8	1	1
10	ООО "Бармалей"	ул. Зеленая, д. 56, Ишим	567890123456	567890123	5	1	1
11	Служба доставки животных "Переезд с хвостиком"	пр. Лесной, д. 30, Тюмень	345678901234	345678901	6	1	1
12	Фонд помощи животным "Лапки"	пр. Розовый, д. 40, Ялуторовск	210987654321	210987654	9	1	1
13	Организация по отлову "Безопасные улицы"	пр. Сосновый, д. 11, Тобольск	432109876543	432109876	4	1	1
14	Частная ветеринарная клиника "ЗооМед"	ул. Ольховая, д. 22, Тюмень	876543210987	876543210	8	1	1
15	Благотворительный фонд "Друзья наших маленьких"	пр. Ясный, д. 18, Тюмень	321098765432	321098765	9	1	1
16	Приют "Ласка"	ул. Радужная, д. 5, Тобольск	987654321011	987654322	3	1	1
17	Ветеринарная клиника "Здоровье питомца"	пр. Звездный, д. 15, Тюмень	765432109876	765432109	8	1	1
18	Служба перевозок "Путешествие с пушистиками"	пр. Солнечный, д. 5, Тобольск	345678901288	345678922	6	1	1
19	Фонд помощи животным "Добрые сердца"	пр. Цветочный, д. 21, Ялуторовск	210987654366	210987600	9	1	1
20	Частная ветеринарная клиника "Заботливый врач"	ул. Розовая, д. 33, Тюмень	876543210555	876543233	8	1	1
21	Благотворительный фонд "Надежда на завтра"	пр. Ясно-синий, д. 8, Тюмень	321098765399	321098722	9	1	1
22	ООО "Давлетов"	ул. Мельничная, д. 3, п. Голышманово	6607041721	806350130	5	1	1
23	Индивидуальный предприниматель Иванов Иван Иваныч	пр. Сосновый, д. 11, Тобольск	860012345678	\N	5	2	1
24	Индивидуальный предприниматель Сидоров Леонид Петрович	ул. Цветочная, д. 10, Тюмень	860801889350	\N	5	2	1
25	Индивидуальный предприниматель Петрова Дарья Сергеевна	пр. Звездный, д. 15, Тюмень	860823257961	\N	5	2	1
26	«Корма для собак и кошек»	пр. Ясно-синий, д. 8, Тюмень	585858585858	\N	10	2	1
27	Ветеринарная клиника "Ветеринар"	ул. Лесная, д. 20, Тюмень	860103490967	\N	8	2	1
28	Индивидуальный предприниматель Демидов Владимир Георгиевич	ул. Сиреневая, д. 10, Ишим	567890123555	\N	5	2	1
29	Индивидуальный предприниматель Морозов Олег Даниилович	ул. Виноградная, д. 35, с. Армизонское	645657217410	\N	4	2	1
30	Индивидуальный предприниматель Воронин Егор Ярославович	ул. Цветная, д. 12, п. Голышманово	257614967079	\N	5	2	1
43	Тест	Тест2	324234	234234	7	2	4
\.


--
-- TOC entry 3139 (class 0 OID 17875)
-- Dependencies: 228
-- Data for Name: report_municipality; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.report_municipality (id, number, date_start, date_end, status_id, date_status, total_cost, municipality_id, number_of_animals) FROM stdin;
1	1	2023-01-01	2023-12-12	1	2023-12-20	1000	1	10
2	123	2023-01-01	2023-12-12	1	2023-12-20	0	1	0
3	123123	2023-01-01	2023-12-12	1	2023-12-20	0	1	3
4	324323	2023-01-01	2023-12-12	2	2023-12-21	2222	1	5
5	1234123	2023-02-02	2023-03-11	1	2023-12-21	0	1	3
6	807987	2023-02-02	2023-03-11	1	2023-12-21	0	1	3
7	5875875	2023-02-02	2023-03-11	1	2023-12-21	369	1	3
9	234	2023-01-01	2023-12-31	2	2023-12-21	246	1	5
10	2234	2023-01-01	2023-12-31	1	2023-12-21	369	1	6
11	23	2023-01-01	2023-12-31	1	2023-12-21	369	1	6
\.


--
-- TOC entry 3137 (class 0 OID 17852)
-- Dependencies: 226
-- Data for Name: report_municipality_status; Type: TABLE DATA; Schema: pets; Owner: -
--

COPY pets.report_municipality_status (id, status_name) FROM stdin;
1	Черновик
2	Доработка
3	Согласование у исполнителя Муниципального Контракта
4	Согласован у исполнителя Муниципального Контракта
5	Утвержден у исполнителя Муниципального Контракта
6	Согласован в ОМСУ
\.


--
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 218
-- Name: act_id_seq; Type: SEQUENCE SET; Schema: pets; Owner: -
--

SELECT pg_catalog.setval('pets.act_id_seq', 3, true);


--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_privileges_id_seq; Type: SEQUENCE SET; Schema: pets; Owner: -
--

SELECT pg_catalog.setval('pets.auth_privileges_id_seq', 182, true);


--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_role_id_seq; Type: SEQUENCE SET; Schema: pets; Owner: -
--

SELECT pg_catalog.setval('pets.auth_role_id_seq', 17, false);


--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: pets; Owner: -
--

SELECT pg_catalog.setval('pets.auth_user_id_seq', 24, true);


--
-- TOC entry 3167 (class 0 OID 0)
-- Dependencies: 220
-- Name: catch_act_card_id_seq; Type: SEQUENCE SET; Schema: pets; Owner: -
--

SELECT pg_catalog.setval('pets.catch_act_card_id_seq', 8, true);


--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 224
-- Name: catch_schedule_id_seq; Type: SEQUENCE SET; Schema: pets; Owner: -
--

SELECT pg_catalog.setval('pets.catch_schedule_id_seq', 3, true);


--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 222
-- Name: catch_schedule_status_id_seq; Type: SEQUENCE SET; Schema: pets; Owner: -
--

SELECT pg_catalog.setval('pets.catch_schedule_status_id_seq', 4, true);


--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 216
-- Name: contract_cost_id_seq; Type: SEQUENCE SET; Schema: pets; Owner: -
--

SELECT pg_catalog.setval('pets.contract_cost_id_seq', 12, true);


--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 214
-- Name: contract_id_seq; Type: SEQUENCE SET; Schema: pets; Owner: -
--

SELECT pg_catalog.setval('pets.contract_id_seq', 11, true);


--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 202
-- Name: dic_legal_type_id_seq; Type: SEQUENCE SET; Schema: pets; Owner: -
--

SELECT pg_catalog.setval('pets.dic_legal_type_id_seq', 2, true);


--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 200
-- Name: dic_municipality_id_seq; Type: SEQUENCE SET; Schema: pets; Owner: -
--

SELECT pg_catalog.setval('pets.dic_municipality_id_seq', 14, true);


--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 204
-- Name: dic_organization_type_id_seq; Type: SEQUENCE SET; Schema: pets; Owner: -
--

SELECT pg_catalog.setval('pets.dic_organization_type_id_seq', 11, true);


--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 230
-- Name: log_info_id_seq; Type: SEQUENCE SET; Schema: pets; Owner: -
--

SELECT pg_catalog.setval('pets.log_info_id_seq', 52, true);


--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 206
-- Name: organization_id_seq; Type: SEQUENCE SET; Schema: pets; Owner: -
--

SELECT pg_catalog.setval('pets.organization_id_seq', 43, true);


--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 227
-- Name: report_id_seq; Type: SEQUENCE SET; Schema: pets; Owner: -
--

SELECT pg_catalog.setval('pets.report_id_seq', 43, true);


--
-- TOC entry 2946 (class 2606 OID 17795)
-- Name: catch_act act_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.catch_act
    ADD CONSTRAINT act_pkey PRIMARY KEY (id);


--
-- TOC entry 2932 (class 2606 OID 17715)
-- Name: auth_privileges auth_privileges_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.auth_privileges
    ADD CONSTRAINT auth_privileges_pkey PRIMARY KEY (id);


--
-- TOC entry 2928 (class 2606 OID 17701)
-- Name: auth_role auth_role_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.auth_role
    ADD CONSTRAINT auth_role_pkey PRIMARY KEY (id);


--
-- TOC entry 2958 (class 2606 OID 17895)
-- Name: auth_role_privileges auth_role_privileges_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.auth_role_privileges
    ADD CONSTRAINT auth_role_privileges_pkey PRIMARY KEY (role_id, privileges_id);


--
-- TOC entry 2934 (class 2606 OID 17731)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2948 (class 2606 OID 17821)
-- Name: catch_act_card catch_act_card_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.catch_act_card
    ADD CONSTRAINT catch_act_card_pkey PRIMARY KEY (id);


--
-- TOC entry 2952 (class 2606 OID 17846)
-- Name: catch_schedule catch_schedule_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.catch_schedule
    ADD CONSTRAINT catch_schedule_pkey PRIMARY KEY (id);


--
-- TOC entry 2950 (class 2606 OID 17838)
-- Name: catch_schedule_status catch_schedule_status_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.catch_schedule_status
    ADD CONSTRAINT catch_schedule_status_pkey PRIMARY KEY (id);


--
-- TOC entry 2942 (class 2606 OID 17774)
-- Name: contract_cost contract_cost_municipality; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.contract_cost
    ADD CONSTRAINT contract_cost_municipality UNIQUE (municipality_id, contract_id);


--
-- TOC entry 2944 (class 2606 OID 17761)
-- Name: contract_cost contract_cost_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.contract_cost
    ADD CONSTRAINT contract_cost_pkey PRIMARY KEY (id);


--
-- TOC entry 2938 (class 2606 OID 17741)
-- Name: contract contract_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (id);


--
-- TOC entry 2922 (class 2606 OID 17629)
-- Name: dic_legal_type dic_legal_type_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.dic_legal_type
    ADD CONSTRAINT dic_legal_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2920 (class 2606 OID 17619)
-- Name: dic_municipality dic_municipality_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.dic_municipality
    ADD CONSTRAINT dic_municipality_pkey PRIMARY KEY (id);


--
-- TOC entry 2924 (class 2606 OID 17637)
-- Name: dic_organization_type dic_organization_type_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.dic_organization_type
    ADD CONSTRAINT dic_organization_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2960 (class 2606 OID 17932)
-- Name: log_info log_info_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.log_info
    ADD CONSTRAINT log_info_pkey PRIMARY KEY (id);


--
-- TOC entry 2926 (class 2606 OID 17664)
-- Name: organization organization_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (id);


--
-- TOC entry 2954 (class 2606 OID 17859)
-- Name: report_municipality_status report_municipality_status_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.report_municipality_status
    ADD CONSTRAINT report_municipality_status_pkey PRIMARY KEY (id);


--
-- TOC entry 2956 (class 2606 OID 17880)
-- Name: report_municipality report_pkey; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.report_municipality
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2936 (class 2606 OID 17733)
-- Name: auth_user uk__login; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.auth_user
    ADD CONSTRAINT uk__login UNIQUE (login);


--
-- TOC entry 2930 (class 2606 OID 17703)
-- Name: auth_role uk__role_name; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.auth_role
    ADD CONSTRAINT uk__role_name UNIQUE (role_name);


--
-- TOC entry 2940 (class 2606 OID 17753)
-- Name: contract unique_contract; Type: CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.contract
    ADD CONSTRAINT unique_contract UNIQUE (num, conclusion_date, contractor_id, customer_id);


--
-- TOC entry 2972 (class 2606 OID 17796)
-- Name: catch_act act_contract_id_fkey; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.catch_act
    ADD CONSTRAINT act_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES pets.contract(id) ON DELETE CASCADE;


--
-- TOC entry 2973 (class 2606 OID 17801)
-- Name: catch_act act_municipality_id_fkey; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.catch_act
    ADD CONSTRAINT act_municipality_id_fkey FOREIGN KEY (municipality_id) REFERENCES pets.dic_municipality(id) ON DELETE CASCADE;


--
-- TOC entry 2974 (class 2606 OID 17806)
-- Name: catch_act act_organization_id_fkey; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.catch_act
    ADD CONSTRAINT act_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES pets.organization(id) ON DELETE CASCADE;


--
-- TOC entry 2964 (class 2606 OID 17716)
-- Name: auth_privileges auth_privileges_role_id_fkey; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.auth_privileges
    ADD CONSTRAINT auth_privileges_role_id_fkey FOREIGN KEY (role_id) REFERENCES pets.auth_role(id);


--
-- TOC entry 2979 (class 2606 OID 17896)
-- Name: auth_role_privileges auth_role_privileges_privileges_id_fkey; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.auth_role_privileges
    ADD CONSTRAINT auth_role_privileges_privileges_id_fkey FOREIGN KEY (privileges_id) REFERENCES pets.auth_privileges(id);


--
-- TOC entry 2980 (class 2606 OID 17901)
-- Name: auth_role_privileges auth_role_privileges_role_id_fkey; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.auth_role_privileges
    ADD CONSTRAINT auth_role_privileges_role_id_fkey FOREIGN KEY (role_id) REFERENCES pets.auth_role(id);


--
-- TOC entry 2975 (class 2606 OID 17822)
-- Name: catch_act_card catch_act_card_act_id_fkey; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.catch_act_card
    ADD CONSTRAINT catch_act_card_act_id_fkey FOREIGN KEY (act_id) REFERENCES pets.catch_act(id) ON DELETE CASCADE;


--
-- TOC entry 2976 (class 2606 OID 17847)
-- Name: catch_schedule catch_schedule_status_id_fkey; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.catch_schedule
    ADD CONSTRAINT catch_schedule_status_id_fkey FOREIGN KEY (status_id) REFERENCES pets.catch_schedule_status(id);


--
-- TOC entry 2968 (class 2606 OID 17742)
-- Name: contract fk__contract___contractor; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.contract
    ADD CONSTRAINT fk__contract___contractor FOREIGN KEY (contractor_id) REFERENCES pets.organization(id);


--
-- TOC entry 2969 (class 2606 OID 17747)
-- Name: contract fk__contract___customer; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.contract
    ADD CONSTRAINT fk__contract___customer FOREIGN KEY (customer_id) REFERENCES pets.organization(id);


--
-- TOC entry 2970 (class 2606 OID 17762)
-- Name: contract_cost fk__contract_work_cost___contract; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.contract_cost
    ADD CONSTRAINT fk__contract_work_cost___contract FOREIGN KEY (contract_id) REFERENCES pets.contract(id) ON DELETE CASCADE;


--
-- TOC entry 2971 (class 2606 OID 17767)
-- Name: contract_cost fk__contract_work_cost___municipality; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.contract_cost
    ADD CONSTRAINT fk__contract_work_cost___municipality FOREIGN KEY (municipality_id) REFERENCES pets.dic_municipality(id);


--
-- TOC entry 2965 (class 2606 OID 17912)
-- Name: auth_user fr_auth_user_municipality; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.auth_user
    ADD CONSTRAINT fr_auth_user_municipality FOREIGN KEY (municipality_id) REFERENCES pets.dic_municipality(id);


--
-- TOC entry 2966 (class 2606 OID 17907)
-- Name: auth_user fr_auth_user_organization; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.auth_user
    ADD CONSTRAINT fr_auth_user_organization FOREIGN KEY (organization_id) REFERENCES pets.organization(id);


--
-- TOC entry 2967 (class 2606 OID 17917)
-- Name: auth_user fr_auth_user_role; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.auth_user
    ADD CONSTRAINT fr_auth_user_role FOREIGN KEY (role_id) REFERENCES pets.auth_role(id);


--
-- TOC entry 2961 (class 2606 OID 17665)
-- Name: organization organization_legal_type_id_fkey; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.organization
    ADD CONSTRAINT organization_legal_type_id_fkey FOREIGN KEY (legal_type_id) REFERENCES pets.dic_legal_type(id);


--
-- TOC entry 2962 (class 2606 OID 17670)
-- Name: organization organization_municipality_id_fkey; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.organization
    ADD CONSTRAINT organization_municipality_id_fkey FOREIGN KEY (municipality_id) REFERENCES pets.dic_municipality(id);


--
-- TOC entry 2963 (class 2606 OID 17675)
-- Name: organization organization_organization_type_id_fkey; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.organization
    ADD CONSTRAINT organization_organization_type_id_fkey FOREIGN KEY (organization_type_id) REFERENCES pets.dic_organization_type(id);


--
-- TOC entry 2977 (class 2606 OID 17881)
-- Name: report_municipality report_municipality_id_fkey; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.report_municipality
    ADD CONSTRAINT report_municipality_id_fkey FOREIGN KEY (municipality_id) REFERENCES pets.dic_municipality(id);


--
-- TOC entry 2978 (class 2606 OID 17886)
-- Name: report_municipality report_status_id_fkey; Type: FK CONSTRAINT; Schema: pets; Owner: -
--

ALTER TABLE ONLY pets.report_municipality
    ADD CONSTRAINT report_status_id_fkey FOREIGN KEY (status_id) REFERENCES pets.report_municipality_status(id);


-- Completed on 2023-12-21 13:47:08

--
-- PostgreSQL database dump complete
--

