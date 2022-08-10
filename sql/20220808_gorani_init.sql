--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3 (Debian 14.3-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2022-08-08 10:08:20 UTC

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

\connect postgres
DROP DATABASE gorani_database;
--
-- TOC entry 3370 (class 1262 OID 40961)
-- Name: gorani_database; Type: DATABASE; Schema: -; Owner: gorani_user
--

CREATE DATABASE gorani_database WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE gorani_database OWNER TO gorani_user;

\connect gorani_database

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
-- TOC entry 6 (class 2615 OID 40962)
-- Name: gorani_schema; Type: SCHEMA; Schema: -; Owner: gorani_user
--

CREATE SCHEMA gorani_schema;


ALTER SCHEMA gorani_schema OWNER TO gorani_user;

--
-- TOC entry 215 (class 1259 OID 41012)
-- Name: character_color_id_seq; Type: SEQUENCE; Schema: gorani_schema; Owner: gorani_user
--

CREATE SEQUENCE gorani_schema.character_color_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gorani_schema.character_color_id_seq OWNER TO gorani_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 41013)
-- Name: character_color; Type: TABLE; Schema: gorani_schema; Owner: gorani_user
--

CREATE TABLE gorani_schema.character_color (
    id integer DEFAULT nextval('gorani_schema.character_color_id_seq'::regclass) NOT NULL,
    name character varying(20) NOT NULL,
    code character varying(6) NOT NULL
);


ALTER TABLE gorani_schema.character_color OWNER TO gorani_user;

--
-- TOC entry 218 (class 1259 OID 41020)
-- Name: character_role; Type: TABLE; Schema: gorani_schema; Owner: gorani_user
--

CREATE TABLE gorani_schema.character_role (
    id integer NOT NULL,
    name character(1) NOT NULL
);


ALTER TABLE gorani_schema.character_role OWNER TO gorani_user;

--
-- TOC entry 217 (class 1259 OID 41019)
-- Name: character_role_id_seq; Type: SEQUENCE; Schema: gorani_schema; Owner: gorani_user
--

CREATE SEQUENCE gorani_schema.character_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gorani_schema.character_role_id_seq OWNER TO gorani_user;

--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 217
-- Name: character_role_id_seq; Type: SEQUENCE OWNED BY; Schema: gorani_schema; Owner: gorani_user
--

ALTER SEQUENCE gorani_schema.character_role_id_seq OWNED BY gorani_schema.character_role.id;


--
-- TOC entry 210 (class 1259 OID 40963)
-- Name: player_id_seq; Type: SEQUENCE; Schema: gorani_schema; Owner: gorani_user
--

CREATE SEQUENCE gorani_schema.player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gorani_schema.player_id_seq OWNER TO gorani_user;

--
-- TOC entry 211 (class 1259 OID 40964)
-- Name: player; Type: TABLE; Schema: gorani_schema; Owner: gorani_user
--

CREATE TABLE gorani_schema.player (
    id integer DEFAULT nextval('gorani_schema.player_id_seq'::regclass) NOT NULL,
    login_id character varying(100) NOT NULL,
    password character varying(600) NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(320) NOT NULL,
    register_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    recent_login_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE gorani_schema.player OWNER TO gorani_user;

--
-- TOC entry 213 (class 1259 OID 40975)
-- Name: room; Type: TABLE; Schema: gorani_schema; Owner: gorani_user
--

CREATE TABLE gorani_schema.room (
    id integer NOT NULL,
    name character varying(100),
    visit_code character varying(10),
    create_time timestamp without time zone,
    max_player integer DEFAULT 1,
    creator_player_id integer DEFAULT 1 NOT NULL,
    visit_url character varying(500) NOT NULL,
    current_player integer DEFAULT 0 NOT NULL,
    visit_port integer
);


ALTER TABLE gorani_schema.room OWNER TO gorani_user;

--
-- TOC entry 212 (class 1259 OID 40974)
-- Name: room_id_seq; Type: SEQUENCE; Schema: gorani_schema; Owner: gorani_user
--

CREATE SEQUENCE gorani_schema.room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gorani_schema.room_id_seq OWNER TO gorani_user;

--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 212
-- Name: room_id_seq; Type: SEQUENCE OWNED BY; Schema: gorani_schema; Owner: gorani_user
--

ALTER SEQUENCE gorani_schema.room_id_seq OWNED BY gorani_schema.room.id;


--
-- TOC entry 214 (class 1259 OID 40995)
-- Name: room_player_join; Type: TABLE; Schema: gorani_schema; Owner: gorani_user
--

CREATE TABLE gorani_schema.room_player_join (
    player_id integer NOT NULL,
    room_id integer NOT NULL,
    join_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    recent_enter_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nickname character varying(100) NOT NULL,
    player_color_id integer DEFAULT 1 NOT NULL,
    player_role_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE gorani_schema.room_player_join OWNER TO gorani_user;

--
-- TOC entry 3199 (class 2604 OID 41023)
-- Name: character_role id; Type: DEFAULT; Schema: gorani_schema; Owner: gorani_user
--

ALTER TABLE ONLY gorani_schema.character_role ALTER COLUMN id SET DEFAULT nextval('gorani_schema.character_role_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 40978)
-- Name: room id; Type: DEFAULT; Schema: gorani_schema; Owner: gorani_user
--

ALTER TABLE ONLY gorani_schema.room ALTER COLUMN id SET DEFAULT nextval('gorani_schema.room_id_seq'::regclass);


--
-- TOC entry 3362 (class 0 OID 41013)
-- Dependencies: 216
-- Data for Name: character_color; Type: TABLE DATA; Schema: gorani_schema; Owner: gorani_user
--



--
-- TOC entry 3364 (class 0 OID 41020)
-- Dependencies: 218
-- Data for Name: character_role; Type: TABLE DATA; Schema: gorani_schema; Owner: gorani_user
--



--
-- TOC entry 3357 (class 0 OID 40964)
-- Dependencies: 211
-- Data for Name: player; Type: TABLE DATA; Schema: gorani_schema; Owner: gorani_user
--

INSERT INTO gorani_schema.player (id, login_id, password, username, email, register_time, recent_login_time) VALUES (1, 'vplayer', 'vpw', '관리자', 'vplayer@vplayer.com', '2022-08-07 11:23:04.066705', '2022-08-07 11:23:04.066705');


--
-- TOC entry 3359 (class 0 OID 40975)
-- Dependencies: 213
-- Data for Name: room; Type: TABLE DATA; Schema: gorani_schema; Owner: gorani_user
--

INSERT INTO gorani_schema.room (id, name, visit_code, create_time, max_player, creator_player_id, visit_url, current_player, visit_port) VALUES (1, NULL, NULL, NULL, NULL, 1, 'http://220.92.222.100', 0, 6000);
INSERT INTO gorani_schema.room (id, name, visit_code, create_time, max_player, creator_player_id, visit_url, current_player, visit_port) VALUES (2, NULL, NULL, NULL, NULL, 1, 'http://220.92.222.100', 0, 6001);
INSERT INTO gorani_schema.room (id, name, visit_code, create_time, max_player, creator_player_id, visit_url, current_player, visit_port) VALUES (3, NULL, NULL, NULL, NULL, 1, 'http://220.92.222.100', 0, 6002);


--
-- TOC entry 3360 (class 0 OID 40995)
-- Dependencies: 214
-- Data for Name: room_player_join; Type: TABLE DATA; Schema: gorani_schema; Owner: gorani_user
--



--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 215
-- Name: character_color_id_seq; Type: SEQUENCE SET; Schema: gorani_schema; Owner: gorani_user
--

SELECT pg_catalog.setval('gorani_schema.character_color_id_seq', 1, true);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 217
-- Name: character_role_id_seq; Type: SEQUENCE SET; Schema: gorani_schema; Owner: gorani_user
--

SELECT pg_catalog.setval('gorani_schema.character_role_id_seq', 1, false);


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 210
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: gorani_schema; Owner: gorani_user
--

SELECT pg_catalog.setval('gorani_schema.player_id_seq', 2, true);


--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 212
-- Name: room_id_seq; Type: SEQUENCE SET; Schema: gorani_schema; Owner: gorani_user
--

SELECT pg_catalog.setval('gorani_schema.room_id_seq', 6, true);


--
-- TOC entry 3209 (class 2606 OID 41018)
-- Name: character_color character_color_pkey; Type: CONSTRAINT; Schema: gorani_schema; Owner: gorani_user
--

ALTER TABLE ONLY gorani_schema.character_color
    ADD CONSTRAINT character_color_pkey PRIMARY KEY (id);


--
-- TOC entry 3211 (class 2606 OID 41025)
-- Name: character_role character_role_pkey; Type: CONSTRAINT; Schema: gorani_schema; Owner: gorani_user
--

ALTER TABLE ONLY gorani_schema.character_role
    ADD CONSTRAINT character_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 40973)
-- Name: player player_pkey; Type: CONSTRAINT; Schema: gorani_schema; Owner: gorani_user
--

ALTER TABLE ONLY gorani_schema.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 40982)
-- Name: room room_pkey; Type: CONSTRAINT; Schema: gorani_schema; Owner: gorani_user
--

ALTER TABLE ONLY gorani_schema.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 41001)
-- Name: room_player_join room_player_join_pkey; Type: CONSTRAINT; Schema: gorani_schema; Owner: gorani_user
--

ALTER TABLE ONLY gorani_schema.room_player_join
    ADD CONSTRAINT room_player_join_pkey PRIMARY KEY (player_id, room_id);


--
-- TOC entry 3205 (class 2606 OID 49153)
-- Name: room room_visit_code_key; Type: CONSTRAINT; Schema: gorani_schema; Owner: gorani_user
--

ALTER TABLE ONLY gorani_schema.room
    ADD CONSTRAINT room_visit_code_key UNIQUE (visit_code);


--
-- TOC entry 3212 (class 2606 OID 40983)
-- Name: room room_creator_player_id_fkey; Type: FK CONSTRAINT; Schema: gorani_schema; Owner: gorani_user
--

ALTER TABLE ONLY gorani_schema.room
    ADD CONSTRAINT room_creator_player_id_fkey FOREIGN KEY (creator_player_id) REFERENCES gorani_schema.player(id);


--
-- TOC entry 3215 (class 2606 OID 41028)
-- Name: room_player_join room_player_join_player_color_id_fkey; Type: FK CONSTRAINT; Schema: gorani_schema; Owner: gorani_user
--

ALTER TABLE ONLY gorani_schema.room_player_join
    ADD CONSTRAINT room_player_join_player_color_id_fkey FOREIGN KEY (player_color_id) REFERENCES gorani_schema.character_color(id) NOT VALID;


--
-- TOC entry 3213 (class 2606 OID 41002)
-- Name: room_player_join room_player_join_player_id_fkey; Type: FK CONSTRAINT; Schema: gorani_schema; Owner: gorani_user
--

ALTER TABLE ONLY gorani_schema.room_player_join
    ADD CONSTRAINT room_player_join_player_id_fkey FOREIGN KEY (player_id) REFERENCES gorani_schema.player(id);


--
-- TOC entry 3216 (class 2606 OID 41033)
-- Name: room_player_join room_player_join_player_role_id_fkey; Type: FK CONSTRAINT; Schema: gorani_schema; Owner: gorani_user
--

ALTER TABLE ONLY gorani_schema.room_player_join
    ADD CONSTRAINT room_player_join_player_role_id_fkey FOREIGN KEY (player_role_id) REFERENCES gorani_schema.character_role(id) NOT VALID;


--
-- TOC entry 3214 (class 2606 OID 41007)
-- Name: room_player_join room_player_join_room_id_fkey; Type: FK CONSTRAINT; Schema: gorani_schema; Owner: gorani_user
--

ALTER TABLE ONLY gorani_schema.room_player_join
    ADD CONSTRAINT room_player_join_room_id_fkey FOREIGN KEY (room_id) REFERENCES gorani_schema.room(id);


-- Completed on 2022-08-08 10:08:20 UTC

--
-- PostgreSQL database dump complete
--

