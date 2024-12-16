--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    galaxy_type character varying(50),
    distance_from_earth integer,
    has_life boolean,
    age_in_millions_of_years integer NOT NULL,
    description text
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
    name character varying(255) NOT NULL,
    planet_id integer,
    distance_from_planet numeric,
    is_spherical boolean,
    has_rings boolean
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
    name character varying(255) NOT NULL,
    star_id integer,
    planet_type character varying(50),
    has_life boolean,
    distance_from_star numeric,
    age_in_millions_of_years integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moons (
    planet_moons_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    planet_name character varying(255),
    name character varying(255)
);


ALTER TABLE public.planet_moons OWNER TO freecodecamp;

--
-- Name: planet_moons_planet_moons_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moons_planet_moons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moons_planet_moons_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moons_planet_moons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moons_planet_moons_id_seq OWNED BY public.planet_moons.planet_moons_id;


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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    star_type character varying(50),
    age_in_millions_of_years integer,
    is_spherical boolean,
    temperature numeric
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_moons planet_moons_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons ALTER COLUMN planet_moons_id SET DEFAULT nextval('public.planet_moons_planet_moons_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, false, 13500, 'The Milky Way is the galaxy that contains our solar system. It''s a spiral galaxy, with arms that curve outward like a pinwheel. It''s about 13.5 billion years old, and Earth resides in one of its spiral arms called the Orion Arm.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2500000, false, 10000, 'Andromeda is the closest spiral galaxy to the Milky Way and is on a collision course with our galaxy. It has an age of around 10 billion years and contains over a trillion stars.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, false, 11000, 'Triangulum is the third-largest member of the Local Group of galaxies, which includes the Milky Way and Andromeda. It''s a smaller spiral galaxy, approximately 11 billion years old.');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 53000000, false, 13000, 'M87 is a giant elliptical galaxy in the Virgo Cluster. It is home to a supermassive black hole, which was the subject of the first-ever black hole image captured in 2019. It''s one of the largest galaxies in the nearby universe.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Lenticular', 28000000, false, 12000, 'The Sombrero Galaxy is a bright lenticular galaxy with a prominent dust lane in its disk, giving it the appearance of a sombrero hat. It is located in the constellation Virgo and is about 12 billion years old.');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 27000000, false, 15000, 'The Whirlpool Galaxy (M51) is a classic spiral galaxy located in the constellation Canes Venatici. It''s known for its well-defined spiral arms and an active galactic nucleus. The galaxy is around 15 billion years old.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 384400, true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 9377, true, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 23460, true, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 421700, true, false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 670900, true, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1070400, true, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1882700, true, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 1221870, true, false);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 527108, true, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 3561300, true, true);
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 238020, true, false);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 294660, true, false);
INSERT INTO public.moon VALUES (13, 'Mimas', 6, 185520, true, false);
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 129380, true, false);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 191020, true, false);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 266300, true, false);
INSERT INTO public.moon VALUES (17, 'Titania', 7, 436300, true, false);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, 583500, true, false);
INSERT INTO public.moon VALUES (19, 'Triton', 8, 354760, true, true);
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 1171000, true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, 0.39, 4600);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', false, 0.72, 4600);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, 1.00, 4600);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, 1.52, 4600);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', false, 5.20, 4600);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', false, 9.58, 4600);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', false, 19.18, 4600);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', false, 30.07, 4600);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2, 'Super-Earth', false, 0.85, 700);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 2, 'Super-Earth', false, 0.15, 700);
INSERT INTO public.planet VALUES (11, 'Proxima b', 5, 'Terrestrial', false, 0.05, 5000);
INSERT INTO public.planet VALUES (12, 'HD 209458b', 3, 'Gas Giant', false, 0.046, 450);


--
-- Data for Name: planet_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moons VALUES (1, 1, 3, NULL, 'Mercury');
INSERT INTO public.planet_moons VALUES (2, 4, 5, NULL, 'Mars');
INSERT INTO public.planet_moons VALUES (3, 4, 6, NULL, 'Mars');
INSERT INTO public.planet_moons VALUES (4, 5, 7, NULL, 'Jupiter');
INSERT INTO public.planet_moons VALUES (5, 5, 8, NULL, 'Jupiter');
INSERT INTO public.planet_moons VALUES (6, 5, 9, NULL, 'Jupiter');
INSERT INTO public.planet_moons VALUES (7, 5, 10, NULL, 'Jupiter');
INSERT INTO public.planet_moons VALUES (8, 6, 11, NULL, 'Saturn');
INSERT INTO public.planet_moons VALUES (9, 6, 12, NULL, 'Saturn');
INSERT INTO public.planet_moons VALUES (10, 6, 13, NULL, 'Saturn');
INSERT INTO public.planet_moons VALUES (11, 7, 14, NULL, 'Uranus');
INSERT INTO public.planet_moons VALUES (12, 7, 15, NULL, 'Uranus');
INSERT INTO public.planet_moons VALUES (13, 7, 16, NULL, 'Uranus');
INSERT INTO public.planet_moons VALUES (14, 7, 17, NULL, 'Uranus');
INSERT INTO public.planet_moons VALUES (15, 7, 18, NULL, 'Uranus');
INSERT INTO public.planet_moons VALUES (16, 8, 19, NULL, 'Neptune');
INSERT INTO public.planet_moons VALUES (17, 8, 20, NULL, 'Neptune');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 4600, true, 5778);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 'G-type', 5700, true, 5890);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A-type', 230, true, 9940);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Red Giant', 80000, true, 3500);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 2, 'Red Dwarf', 5000, true, 3040);
INSERT INTO public.star VALUES (6, 'Vega', 3, 'A-type', 450, true, 9600);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_moons_planet_moons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moons_planet_moons_id_seq', 17, true);


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
-- Name: planet_moons planet_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_pkey PRIMARY KEY (planet_moons_id);


--
-- Name: planet_moons planet_moons_planet_id_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_planet_id_moon_id_key UNIQUE (planet_id, moon_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet_moons planet_moons_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id) ON DELETE CASCADE;


--
-- Name: planet_moons planet_moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

