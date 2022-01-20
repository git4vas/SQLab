--fjhkjdsfhbksdfbksdnfvdsjfknvjkdsf



--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9
-- Dumped by pg_dump version 12.9

-- Started on 2022-01-20 22:09:31

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

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 16617)
-- Name: human; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.human (
    ids integer NOT NULL,
    firstname character varying(40),
    lastname character varying(60)
);


ALTER TABLE public.human OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16622)
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
)
INHERITS (public.human);


ALTER TABLE public.authors OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16638)
-- Name: borrows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.borrows (
    item bigint NOT NULL,
    members integer NOT NULL,
    borrowingdate date,
    returndate date,
    CONSTRAINT check_date CHECK ((borrowingdate < returndate))
);


ALTER TABLE public.borrows OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16630)
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    isbn bigint NOT NULL,
    title character varying(512)
);


ALTER TABLE public.item OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16625)
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    ids integer,
    regdate date
)
INHERITS (public.human);


ALTER TABLE public.members OWNER TO postgres;

--
-- TOC entry 2840 (class 0 OID 16622)
-- Dependencies: 203
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (ids, firstname, lastname) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 16638)
-- Dependencies: 206
-- Data for Name: borrows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.borrows (item, members, borrowingdate, returndate) FROM stdin;
\.


--
-- TOC entry 2839 (class 0 OID 16617)
-- Dependencies: 202
-- Data for Name: human; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.human (ids, firstname, lastname) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 16630)
-- Dependencies: 205
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item (isbn, title) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 16625)
-- Dependencies: 204
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (ids, firstname, lastname, regdate) FROM stdin;
\.


--
-- TOC entry 2710 (class 2606 OID 16643)
-- Name: borrows borrows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrows
    ADD CONSTRAINT borrows_pkey PRIMARY KEY (item, members);


--
-- TOC entry 2704 (class 2606 OID 16621)
-- Name: human human_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.human
    ADD CONSTRAINT human_pkey PRIMARY KEY (ids);


--
-- TOC entry 2708 (class 2606 OID 16637)
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (isbn);


--
-- TOC entry 2706 (class 2606 OID 16629)
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (ids);


--
-- TOC entry 2711 (class 2606 OID 16644)
-- Name: borrows borrows_item_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrows
    ADD CONSTRAINT borrows_item_fkey FOREIGN KEY (item) REFERENCES public.item(isbn);


--
-- TOC entry 2712 (class 2606 OID 16649)
-- Name: borrows borrows_members_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrows
    ADD CONSTRAINT borrows_members_fkey FOREIGN KEY (members) REFERENCES public.members(ids);


-- Completed on 2022-01-20 22:09:31

--
-- PostgreSQL database dump complete
--

