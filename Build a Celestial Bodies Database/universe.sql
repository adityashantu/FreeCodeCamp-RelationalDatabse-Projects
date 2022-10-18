--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    size_in_km numeric(12,4),
    galaxy_id integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_billion_years numeric(5,2),
    radius_in_kpc numeric(5,2),
    description text,
    is_collided boolean DEFAULT false,
    has_stars_in_billion integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_billion_years numeric(5,2),
    radius_in_km numeric(12,4),
    description text,
    is_spherical boolean DEFAULT true,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_billion_years numeric(5,2),
    radius_in_km numeric(12,4),
    description text,
    is_spherical boolean DEFAULT true,
    star_id integer NOT NULL,
    has_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_billion_years numeric(5,2),
    radius_in_km numeric(12,4),
    description text,
    is_spherical boolean DEFAULT true,
    galaxy_id integer NOT NULL,
    has_planets integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'comet_01', 11.1100, 1);
INSERT INTO public.comet VALUES (2, 'comet_02', 22.2200, 2);
INSERT INTO public.comet VALUES (3, 'comet_03', 33.3300, 3);
INSERT INTO public.comet VALUES (4, 'comet_04', 44.4400, 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.61, 16.20, 'Also called a spiral galaxy with huge collection of stars, dust and gas.', false, 100);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.01, 33.73, 'also known as Messier 31, is a spiral galaxy.', false, 1000);
INSERT INTO public.galaxy VALUES (3, 'Black Eye', 13.28, 8.11, 'The Black Eye Galaxy is a relatively isolated spiral galaxy 17 million light-years away.', false, 100);
INSERT INTO public.galaxy VALUES (4, 'Bode''galaxy', 13.31, 13.80, 'Also known as Messier 81 is a grand design spiral galaxy.', false, 250);
INSERT INTO public.galaxy VALUES (5, 'Tadpole Galaxy', 0.10, 59.79, 'A disrupted barred spiral galaxy with a trail of stars about 280,000 light years long.', true, NULL);
INSERT INTO public.galaxy VALUES (6, 'LMC', 1.10, 2.15, 'A satellite dwarf galaxy of the Milky Way that is among the closest galaxies to Earth.', false, 30);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon_01', 4.01, 100.0100, 'description_01', true, 1);
INSERT INTO public.moon VALUES (2, 'moon_02', 4.02, 100.0200, 'description_02', true, 2);
INSERT INTO public.moon VALUES (3, 'moon_03', 4.03, 100.0300, 'description_03', true, 2);
INSERT INTO public.moon VALUES (4, 'moon_04', 4.04, 100.0400, 'description_04', true, 3);
INSERT INTO public.moon VALUES (5, 'moon_05', 4.05, 100.0500, 'description_05', true, 4);
INSERT INTO public.moon VALUES (6, 'moon_06', 4.06, 100.0600, 'description_06', true, 5);
INSERT INTO public.moon VALUES (7, 'moon_07', 4.07, 100.0700, 'description_07', true, 4);
INSERT INTO public.moon VALUES (8, 'moon_08', 4.08, 100.0800, 'description_08', true, 3);
INSERT INTO public.moon VALUES (9, 'moon_09', 4.09, 100.0900, 'description_09', true, 5);
INSERT INTO public.moon VALUES (10, 'moon_10', 4.10, 100.1000, 'description_10', true, 9);
INSERT INTO public.moon VALUES (11, 'moon_11', 4.11, 100.1100, 'description_11', true, 7);
INSERT INTO public.moon VALUES (12, 'moon_12', 4.12, 100.1200, 'description_12', true, 3);
INSERT INTO public.moon VALUES (13, 'moon_13', 4.13, 100.1300, 'description_13', true, 9);
INSERT INTO public.moon VALUES (14, 'moon_14', 4.14, 100.1400, 'description_14', true, 6);
INSERT INTO public.moon VALUES (15, 'moon_15', 4.15, 100.1500, 'description_15', true, 6);
INSERT INTO public.moon VALUES (16, 'moon_16', 4.16, 100.1600, 'description_16', true, 7);
INSERT INTO public.moon VALUES (17, 'moon_17', 4.17, 100.1700, 'description_17', true, 5);
INSERT INTO public.moon VALUES (18, 'moon_18', 4.18, 100.1800, 'description_18', true, 6);
INSERT INTO public.moon VALUES (19, 'moon_19', 4.19, 100.1900, 'description_19', true, 5);
INSERT INTO public.moon VALUES (20, 'moon_20', 4.20, 100.2000, 'description_20', true, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet_01', 4.01, 1000.0100, 'description_01', true, 1, 1);
INSERT INTO public.planet VALUES (2, 'planet_02', 4.02, 1000.0200, 'description_02', true, 2, 2);
INSERT INTO public.planet VALUES (3, 'planet_03', 4.03, 1000.0300, 'description_03', true, 4, 5);
INSERT INTO public.planet VALUES (4, 'planet_04', 4.04, 1000.0400, 'description_04', true, 1, 2);
INSERT INTO public.planet VALUES (5, 'planet_05', 4.05, 1000.0500, 'description_05', true, 1, 14);
INSERT INTO public.planet VALUES (6, 'planet_06', 4.06, 1000.0600, 'description_06', true, 2, 21);
INSERT INTO public.planet VALUES (7, 'planet_07', 4.07, 1000.0700, 'description_07', true, 6, 9);
INSERT INTO public.planet VALUES (8, 'planet_08', 4.08, 1000.0800, 'description_08', true, 7, 8);
INSERT INTO public.planet VALUES (9, 'planet_09', 4.09, 1000.0900, 'description_09', true, 5, 3);
INSERT INTO public.planet VALUES (10, 'planet_10', 4.10, 1000.1000, 'description_10', true, 1, 5);
INSERT INTO public.planet VALUES (11, 'planet_11', 4.11, 1000.1100, 'description_11', true, 2, 17);
INSERT INTO public.planet VALUES (12, 'planet_12', 4.12, 1000.1200, 'description_12', true, 3, 9);
INSERT INTO public.planet VALUES (13, 'planet_13', 4.13, 1000.1300, 'description_13', true, 3, 13);
INSERT INTO public.planet VALUES (14, 'planet_14', 4.14, 1000.1400, 'description_14', true, 4, 22);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star_01', 111.11, 101.1100, 'description-01', true, 1, 11);
INSERT INTO public.star VALUES (2, 'star_02', 222.22, 202.2200, 'description-02', true, 2, 12);
INSERT INTO public.star VALUES (3, 'star_03', 333.33, 303.3300, 'description-03', true, 3, 13);
INSERT INTO public.star VALUES (4, 'star_04', 444.44, 404.4400, 'description-04', true, 1, 14);
INSERT INTO public.star VALUES (5, 'star_05', 555.55, 505.5500, 'description-05', true, 1, 15);
INSERT INTO public.star VALUES (6, 'star_06', 666.66, 606.6600, 'description-06', true, 2, 16);
INSERT INTO public.star VALUES (7, 'star_71', 777.77, 707.7700, 'description-07', true, 4, 17);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

