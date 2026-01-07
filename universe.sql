--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL,
    age_in_billion_years numeric(4,1) NOT NULL,
    size_in_light_years integer NOT NULL
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
-- Name: life_form; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.life_form (
    life_form_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    planet_id integer
);


ALTER TABLE public.life_form OWNER TO freecodecamp;

--
-- Name: life_form_life_form_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.life_form_life_form_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_form_life_form_id_seq OWNER TO freecodecamp;

--
-- Name: life_form_life_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.life_form_life_form_id_seq OWNED BY public.life_form.life_form_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    size_in_km integer NOT NULL,
    distance_from_planet_in_km integer NOT NULL,
    planet_id integer
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
    name character varying(20) NOT NULL,
    description text,
    age_in_billion_years numeric(4,1),
    has_life boolean NOT NULL,
    has_moons boolean NOT NULL,
    population_in_billion integer,
    star_id integer
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
    name character varying(20) NOT NULL,
    description text,
    age_in_billion_years numeric(4,1),
    size_in_million_km integer NOT NULL,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: life_form life_form_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_form ALTER COLUMN life_form_id SET DEFAULT nextval('public.life_form_life_form_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The famous galaxy where we live in.', 453.1, 52400);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest galaxy to the milky way!', 453.3, 54200);
INSERT INTO public.galaxy VALUES (3, 'Galaxy-3', 'Man i dont know', 340.2, 34200);
INSERT INTO public.galaxy VALUES (4, 'Galaxy-4', 'The forth galaxy?', 341.2, 34250);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'This one is named because of its shape', 432.2, 4400);
INSERT INTO public.galaxy VALUES (6, 'Galaxy-6', 'Sixth Galaxy', 34.2, 3400);


--
-- Data for Name: life_form; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.life_form VALUES (1, 'Humans', 'Humanity as we know it.', 1);
INSERT INTO public.life_form VALUES (2, 'Viltrumites', 'Powerful species', 6);
INSERT INTO public.life_form VALUES (3, 'Dogmen', 'Unknown origin', 12);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 'Uhh.. The moon?', 345000, 384500, 1);
INSERT INTO public.moon VALUES (2, 'The Moon 2', 'Uhh.. The moon?', 345000, 384500, 2);
INSERT INTO public.moon VALUES (3, 'The Moon 22', 'Uhh.. The moon?', 345000, 384500, 2);
INSERT INTO public.moon VALUES (4, 'The Moon 222', 'Uhh.. The moon?', 345000, 384500, 10);
INSERT INTO public.moon VALUES (6, 'The Moon 221', 'Uhh.. The moon?', 345000, 384500, 11);
INSERT INTO public.moon VALUES (7, 'The Moon 121', 'Uhh.. The moon?', 345000, 384500, 10);
INSERT INTO public.moon VALUES (8, 'The Moon 111', 'Uhh.. The moon?', 345000, 384500, 3);
INSERT INTO public.moon VALUES (9, 'The Moon 131', 'Uhh.. The moon?', 345000, 384500, 4);
INSERT INTO public.moon VALUES (10, 'The Moon 134', 'Uhh.. The moon?', 345000, 384500, 3);
INSERT INTO public.moon VALUES (11, 'The Moon 1134', 'Uhh.. The moon?', 345000, 384500, 8);
INSERT INTO public.moon VALUES (12, 'The Moon 1154', 'Uhh.. The moon?', 345000, 384500, 7);
INSERT INTO public.moon VALUES (13, 'The Moon 1454', 'Uhh.. The moon?', 345000, 384500, 4);
INSERT INTO public.moon VALUES (14, 'The Moon 11454', 'Uhh.. The moon?', 345000, 384500, 4);
INSERT INTO public.moon VALUES (15, 'The Moon 141454', 'Uhh.. The moon?', 345000, 384500, 4);
INSERT INTO public.moon VALUES (16, 'The Moon 1414554', 'Uhh.. The moon?', 345000, 384500, 4);
INSERT INTO public.moon VALUES (17, 'The Moon 13414554', 'Uhh.. The moon?', 345000, 384500, 4);
INSERT INTO public.moon VALUES (18, 'The Moon 132414554', 'Uhh.. The moon?', 345000, 384500, 5);
INSERT INTO public.moon VALUES (19, 'The Moon 1324143554', 'Uhh.. The moon?', 345000, 384500, 5);
INSERT INTO public.moon VALUES (20, 'The Moon 132414', 'Uhh.. The moon?', 345000, 384500, 5);
INSERT INTO public.moon VALUES (21, 'The Moon 1324114', 'Uhh.. The moon?', 345000, 384500, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home sweet home', 4.5, true, true, 8, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Red planet hehehe', 4.5, false, true, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Kepler-33c', 'Some cold planet far away...', 33.2, false, true, NULL, 3);
INSERT INTO public.planet VALUES (4, 'Viltrum', 'Home of the powerful viltrumites, conquering the galaxies.', 34.3, true, true, 1, 4);
INSERT INTO public.planet VALUES (5, 'Planet X', 'Home of the powerful alien X', 100.0, true, false, 1, 6);
INSERT INTO public.planet VALUES (6, 'Jekyl-31C', 'Unknown planet??', 34.3, true, true, 1, 4);
INSERT INTO public.planet VALUES (7, 'KXC-3311', 'Home of the aliens known as zorglobs', 33.2, true, false, 3, 3);
INSERT INTO public.planet VALUES (8, 'Zorgoza', 'Home of invasive aliens known as the spoolgroobs', 34.1, true, true, 3, 2);
INSERT INTO public.planet VALUES (9, 'Planet-9', 'this planet has nothing.', 332.1, false, false, NULL, 5);
INSERT INTO public.planet VALUES (10, 'Planet-11', 'This planet has it all', 331.1, true, true, 3, 3);
INSERT INTO public.planet VALUES (11, 'Penultimatia', 'about 6 or 7 life species', 341.1, true, false, 2, 5);
INSERT INTO public.planet VALUES (12, 'Xen', 'The famous alien planet referenced in Half-Life series', 100.5, true, true, 6, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Also known to humans as the SUN.', 100.4, 452, 1);
INSERT INTO public.star VALUES (2, 'Kepler-34b', 'A very hot star 100 times bigger than the sun', 344.4, 10000, 3);
INSERT INTO public.star VALUES (3, 'Kepler-34c ALPHA', 'Something I made up', 340.3, 23000, 2);
INSERT INTO public.star VALUES (4, 'XCQ-34c', 'Guess what this is..', 340.3, 300, 4);
INSERT INTO public.star VALUES (5, 'STAR-34D', 'Scorching hot at 30 billion Celsius!', 345.1, 23, 5);
INSERT INTO public.star VALUES (6, 'SUPER-3341-2', 'ALMOST A SUPERNOVA', 231.2, 341, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: life_form_life_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.life_form_life_form_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: life_form life_form_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_form
    ADD CONSTRAINT life_form_name_key UNIQUE (name);


--
-- Name: life_form life_form_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_form
    ADD CONSTRAINT life_form_pkey PRIMARY KEY (life_form_id);


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
-- Name: life_form life_form_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_form
    ADD CONSTRAINT life_form_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

