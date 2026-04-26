--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-2.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-2.pgdg120+1)

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
-- Name: vector; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA public;


--
-- Name: EXTENSION vector; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION vector IS 'vector data type and ivfflat and hnsw access methods';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id smallint NOT NULL,
    category_name character varying(15) NOT NULL,
    description text,
    picture bytea
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: customer_customer_demo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_customer_demo (
    customer_id character varying(5) NOT NULL,
    customer_type_id character varying(5) NOT NULL
);


ALTER TABLE public.customer_customer_demo OWNER TO postgres;

--
-- Name: customer_demographics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_demographics (
    customer_type_id character varying(5) NOT NULL,
    customer_desc text
);


ALTER TABLE public.customer_demographics OWNER TO postgres;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id character varying(5) NOT NULL,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: employee_territories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_territories (
    employee_id smallint NOT NULL,
    territory_id character varying(20) NOT NULL
);


ALTER TABLE public.employee_territories OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id smallint NOT NULL,
    last_name character varying(20) NOT NULL,
    first_name character varying(10) NOT NULL,
    title character varying(30),
    title_of_courtesy character varying(25),
    birth_date date,
    hire_date date,
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    home_phone character varying(24),
    extension character varying(4),
    photo bytea,
    notes text,
    reports_to smallint,
    photo_path character varying(255)
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    order_id smallint NOT NULL,
    product_id smallint NOT NULL,
    unit_price real NOT NULL,
    quantity smallint NOT NULL,
    discount real NOT NULL
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id smallint NOT NULL,
    customer_id character varying(5),
    employee_id smallint,
    order_date date,
    required_date date,
    shipped_date date,
    ship_via smallint,
    freight real,
    ship_name character varying(40),
    ship_address character varying(60),
    ship_city character varying(15),
    ship_region character varying(15),
    ship_postal_code character varying(10),
    ship_country character varying(15)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id smallint NOT NULL,
    product_name character varying(40) NOT NULL,
    supplier_id smallint,
    category_id smallint,
    quantity_per_unit character varying(20),
    unit_price real,
    units_in_stock smallint,
    units_on_order smallint,
    reorder_level smallint,
    discontinued integer NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    region_id smallint NOT NULL,
    region_description character varying(60) NOT NULL
);


ALTER TABLE public.region OWNER TO postgres;

--
-- Name: schema_ardine_short; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_ardine_short (
    id integer NOT NULL,
    table_name character varying(50),
    content text,
    embedding public.vector(768)
);


ALTER TABLE public.schema_ardine_short OWNER TO postgres;

--
-- Name: schema_ardine_short_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schema_ardine_short_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schema_ardine_short_id_seq OWNER TO postgres;

--
-- Name: schema_ardine_short_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schema_ardine_short_id_seq OWNED BY public.schema_ardine_short.id;


--
-- Name: schema_embeddings_long; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_embeddings_long (
    id integer NOT NULL,
    table_name character varying(50),
    content text,
    embedding public.vector(768)
);


ALTER TABLE public.schema_embeddings_long OWNER TO postgres;

--
-- Name: schema_embeddings_long_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schema_embeddings_long_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schema_embeddings_long_id_seq OWNER TO postgres;

--
-- Name: schema_embeddings_long_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schema_embeddings_long_id_seq OWNED BY public.schema_embeddings_long.id;


--
-- Name: schema_embeddings_short; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_embeddings_short (
    id integer NOT NULL,
    table_name character varying(50),
    content text,
    embedding public.vector(768)
);


ALTER TABLE public.schema_embeddings_short OWNER TO postgres;

--
-- Name: schema_embeddings_short_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schema_embeddings_short_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schema_embeddings_short_id_seq OWNER TO postgres;

--
-- Name: schema_embeddings_short_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schema_embeddings_short_id_seq OWNED BY public.schema_embeddings_short.id;


--
-- Name: shippers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shippers (
    shipper_id smallint NOT NULL,
    company_name character varying(40) NOT NULL,
    phone character varying(24)
);


ALTER TABLE public.shippers OWNER TO postgres;

--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    supplier_id smallint NOT NULL,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24),
    homepage text
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- Name: territories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.territories (
    territory_id character varying(20) NOT NULL,
    territory_description character varying(60) NOT NULL,
    region_id smallint NOT NULL
);


ALTER TABLE public.territories OWNER TO postgres;

--
-- Name: us_states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.us_states (
    state_id smallint NOT NULL,
    state_name character varying(100),
    state_abbr character varying(2),
    state_region character varying(50)
);


ALTER TABLE public.us_states OWNER TO postgres;

--
-- Name: schema_ardine_short id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_ardine_short ALTER COLUMN id SET DEFAULT nextval('public.schema_ardine_short_id_seq'::regclass);


--
-- Name: schema_embeddings_long id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_embeddings_long ALTER COLUMN id SET DEFAULT nextval('public.schema_embeddings_long_id_seq'::regclass);


--
-- Name: schema_embeddings_short id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_embeddings_short ALTER COLUMN id SET DEFAULT nextval('public.schema_embeddings_short_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, category_name, description, picture) FROM stdin;
1	Beverages	Soft drinks, coffees, teas, beers, and ales	\\x
2	Condiments	Sweet and savory sauces, relishes, spreads, and seasonings	\\x
3	Confections	Desserts, candies, and sweet breads	\\x
4	Dairy Products	Cheeses	\\x
5	Grains/Cereals	Breads, crackers, pasta, and cereal	\\x
6	Meat/Poultry	Prepared meats	\\x
7	Produce	Dried fruit and bean curd	\\x
8	Seafood	Seaweed and fish	\\x
\.


--
-- Data for Name: customer_customer_demo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_customer_demo (customer_id, customer_type_id) FROM stdin;
\.


--
-- Data for Name: customer_demographics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_demographics (customer_type_id, customer_desc) FROM stdin;
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax) FROM stdin;
ALFKI	Alfreds Futterkiste	Maria Anders	Sales Representative	Obere Str. 57	Berlin	\N	12209	Germany	030-0074321	030-0076545
ANATR	Ana Trujillo Emparedados y helados	Ana Trujillo	Owner	Avda. de la Constitución 2222	México D.F.	\N	05021	Mexico	(5) 555-4729	(5) 555-3745
ANTON	Antonio Moreno Taquería	Antonio Moreno	Owner	Mataderos  2312	México D.F.	\N	05023	Mexico	(5) 555-3932	\N
AROUT	Around the Horn	Thomas Hardy	Sales Representative	120 Hanover Sq.	London	\N	WA1 1DP	UK	(171) 555-7788	(171) 555-6750
BERGS	Berglunds snabbköp	Christina Berglund	Order Administrator	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden	0921-12 34 65	0921-12 34 67
BLAUS	Blauer See Delikatessen	Hanna Moos	Sales Representative	Forsterstr. 57	Mannheim	\N	68306	Germany	0621-08460	0621-08924
BLONP	Blondesddsl père et fils	Frédérique Citeaux	Marketing Manager	24, place Kléber	Strasbourg	\N	67000	France	88.60.15.31	88.60.15.32
BOLID	Bólido Comidas preparadas	Martín Sommer	Owner	C/ Araquil, 67	Madrid	\N	28023	Spain	(91) 555 22 82	(91) 555 91 99
BONAP	Bon app'	Laurence Lebihan	Owner	12, rue des Bouchers	Marseille	\N	13008	France	91.24.45.40	91.24.45.41
BOTTM	Bottom-Dollar Markets	Elizabeth Lincoln	Accounting Manager	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada	(604) 555-4729	(604) 555-3745
BSBEV	B's Beverages	Victoria Ashworth	Sales Representative	Fauntleroy Circus	London	\N	EC2 5NT	UK	(171) 555-1212	\N
CACTU	Cactus Comidas para llevar	Patricio Simpson	Sales Agent	Cerrito 333	Buenos Aires	\N	1010	Argentina	(1) 135-5555	(1) 135-4892
CENTC	Centro comercial Moctezuma	Francisco Chang	Marketing Manager	Sierras de Granada 9993	México D.F.	\N	05022	Mexico	(5) 555-3392	(5) 555-7293
CHOPS	Chop-suey Chinese	Yang Wang	Owner	Hauptstr. 29	Bern	\N	3012	Switzerland	0452-076545	\N
COMMI	Comércio Mineiro	Pedro Afonso	Sales Associate	Av. dos Lusíadas, 23	Sao Paulo	SP	05432-043	Brazil	(11) 555-7647	\N
CONSH	Consolidated Holdings	Elizabeth Brown	Sales Representative	Berkeley Gardens 12  Brewery	London	\N	WX1 6LT	UK	(171) 555-2282	(171) 555-9199
DRACD	Drachenblut Delikatessen	Sven Ottlieb	Order Administrator	Walserweg 21	Aachen	\N	52066	Germany	0241-039123	0241-059428
DUMON	Du monde entier	Janine Labrune	Owner	67, rue des Cinquante Otages	Nantes	\N	44000	France	40.67.88.88	40.67.89.89
EASTC	Eastern Connection	Ann Devon	Sales Agent	35 King George	London	\N	WX3 6FW	UK	(171) 555-0297	(171) 555-3373
ERNSH	Ernst Handel	Roland Mendel	Sales Manager	Kirchgasse 6	Graz	\N	8010	Austria	7675-3425	7675-3426
FAMIA	Familia Arquibaldo	Aria Cruz	Marketing Assistant	Rua Orós, 92	Sao Paulo	SP	05442-030	Brazil	(11) 555-9857	\N
FISSA	FISSA Fabrica Inter. Salchichas S.A.	Diego Roel	Accounting Manager	C/ Moralzarzal, 86	Madrid	\N	28034	Spain	(91) 555 94 44	(91) 555 55 93
FOLIG	Folies gourmandes	Martine Rancé	Assistant Sales Agent	184, chaussée de Tournai	Lille	\N	59000	France	20.16.10.16	20.16.10.17
FOLKO	Folk och fä HB	Maria Larsson	Owner	Åkergatan 24	Bräcke	\N	S-844 67	Sweden	0695-34 67 21	\N
FRANK	Frankenversand	Peter Franken	Marketing Manager	Berliner Platz 43	München	\N	80805	Germany	089-0877310	089-0877451
FRANR	France restauration	Carine Schmitt	Marketing Manager	54, rue Royale	Nantes	\N	44000	France	40.32.21.21	40.32.21.20
FRANS	Franchi S.p.A.	Paolo Accorti	Sales Representative	Via Monte Bianco 34	Torino	\N	10100	Italy	011-4988260	011-4988261
FURIB	Furia Bacalhau e Frutos do Mar	Lino Rodriguez	Sales Manager	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal	(1) 354-2534	(1) 354-2535
GALED	Galería del gastrónomo	Eduardo Saavedra	Marketing Manager	Rambla de Cataluña, 23	Barcelona	\N	08022	Spain	(93) 203 4560	(93) 203 4561
GODOS	Godos Cocina Típica	José Pedro Freyre	Sales Manager	C/ Romero, 33	Sevilla	\N	41101	Spain	(95) 555 82 82	\N
GOURL	Gourmet Lanchonetes	André Fonseca	Sales Associate	Av. Brasil, 442	Campinas	SP	04876-786	Brazil	(11) 555-9482	\N
GREAL	Great Lakes Food Market	Howard Snyder	Marketing Manager	2732 Baker Blvd.	Eugene	OR	97403	USA	(503) 555-7555	\N
GROSR	GROSELLA-Restaurante	Manuel Pereira	Owner	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela	(2) 283-2951	(2) 283-3397
HANAR	Hanari Carnes	Mario Pontes	Accounting Manager	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil	(21) 555-0091	(21) 555-8765
HILAA	HILARION-Abastos	Carlos Hernández	Sales Representative	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela	(5) 555-1340	(5) 555-1948
HUNGC	Hungry Coyote Import Store	Yoshi Latimer	Sales Representative	City Center Plaza 516 Main St.	Elgin	OR	97827	USA	(503) 555-6874	(503) 555-2376
HUNGO	Hungry Owl All-Night Grocers	Patricia McKenna	Sales Associate	8 Johnstown Road	Cork	Co. Cork	\N	Ireland	2967 542	2967 3333
ISLAT	Island Trading	Helen Bennett	Marketing Manager	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK	(198) 555-8888	\N
KOENE	Königlich Essen	Philip Cramer	Sales Associate	Maubelstr. 90	Brandenburg	\N	14776	Germany	0555-09876	\N
LACOR	La corne d'abondance	Daniel Tonini	Sales Representative	67, avenue de l'Europe	Versailles	\N	78000	France	30.59.84.10	30.59.85.11
LAMAI	La maison d'Asie	Annette Roulet	Sales Manager	1 rue Alsace-Lorraine	Toulouse	\N	31000	France	61.77.61.10	61.77.61.11
LAUGB	Laughing Bacchus Wine Cellars	Yoshi Tannamuri	Marketing Assistant	1900 Oak St.	Vancouver	BC	V3F 2K1	Canada	(604) 555-3392	(604) 555-7293
LAZYK	Lazy K Kountry Store	John Steel	Marketing Manager	12 Orchestra Terrace	Walla Walla	WA	99362	USA	(509) 555-7969	(509) 555-6221
LEHMS	Lehmanns Marktstand	Renate Messner	Sales Representative	Magazinweg 7	Frankfurt a.M.	\N	60528	Germany	069-0245984	069-0245874
LETSS	Let's Stop N Shop	Jaime Yorres	Owner	87 Polk St. Suite 5	San Francisco	CA	94117	USA	(415) 555-5938	\N
LILAS	LILA-Supermercado	Carlos González	Accounting Manager	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela	(9) 331-6954	(9) 331-7256
LINOD	LINO-Delicateses	Felipe Izquierdo	Owner	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela	(8) 34-56-12	(8) 34-93-93
LONEP	Lonesome Pine Restaurant	Fran Wilson	Sales Manager	89 Chiaroscuro Rd.	Portland	OR	97219	USA	(503) 555-9573	(503) 555-9646
MAGAA	Magazzini Alimentari Riuniti	Giovanni Rovelli	Marketing Manager	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy	035-640230	035-640231
MAISD	Maison Dewey	Catherine Dewey	Sales Agent	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgium	(02) 201 24 67	(02) 201 24 68
MEREP	Mère Paillarde	Jean Fresnière	Marketing Assistant	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada	(514) 555-8054	(514) 555-8055
MORGK	Morgenstern Gesundkost	Alexander Feuer	Marketing Assistant	Heerstr. 22	Leipzig	\N	04179	Germany	0342-023176	\N
NORTS	North/South	Simon Crowther	Sales Associate	South House 300 Queensbridge	London	\N	SW7 1RZ	UK	(171) 555-7733	(171) 555-2530
OCEAN	Océano Atlántico Ltda.	Yvonne Moncada	Sales Agent	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	\N	1010	Argentina	(1) 135-5333	(1) 135-5535
OLDWO	Old World Delicatessen	Rene Phillips	Sales Representative	2743 Bering St.	Anchorage	AK	99508	USA	(907) 555-7584	(907) 555-2880
OTTIK	Ottilies Käseladen	Henriette Pfalzheim	Owner	Mehrheimerstr. 369	Köln	\N	50739	Germany	0221-0644327	0221-0765721
PARIS	Paris spécialités	Marie Bertrand	Owner	265, boulevard Charonne	Paris	\N	75012	France	(1) 42.34.22.66	(1) 42.34.22.77
PERIC	Pericles Comidas clásicas	Guillermo Fernández	Sales Representative	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexico	(5) 552-3745	(5) 545-3745
PICCO	Piccolo und mehr	Georg Pipps	Sales Manager	Geislweg 14	Salzburg	\N	5020	Austria	6562-9722	6562-9723
PRINI	Princesa Isabel Vinhos	Isabel de Castro	Sales Representative	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal	(1) 356-5634	\N
QUEDE	Que Delícia	Bernardo Batista	Accounting Manager	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil	(21) 555-4252	(21) 555-4545
QUEEN	Queen Cozinha	Lúcia Carvalho	Marketing Assistant	Alameda dos Canàrios, 891	Sao Paulo	SP	05487-020	Brazil	(11) 555-1189	\N
QUICK	QUICK-Stop	Horst Kloss	Accounting Manager	Taucherstraße 10	Cunewalde	\N	01307	Germany	0372-035188	\N
RANCH	Rancho grande	Sergio Gutiérrez	Sales Representative	Av. del Libertador 900	Buenos Aires	\N	1010	Argentina	(1) 123-5555	(1) 123-5556
RATTC	Rattlesnake Canyon Grocery	Paula Wilson	Assistant Sales Representative	2817 Milton Dr.	Albuquerque	NM	87110	USA	(505) 555-5939	(505) 555-3620
REGGC	Reggiani Caseifici	Maurizio Moroni	Sales Associate	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy	0522-556721	0522-556722
RICAR	Ricardo Adocicados	Janete Limeira	Assistant Sales Agent	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil	(21) 555-3412	\N
RICSU	Richter Supermarkt	Michael Holz	Sales Manager	Grenzacherweg 237	Genève	\N	1203	Switzerland	0897-034214	\N
ROMEY	Romero y tomillo	Alejandra Camino	Accounting Manager	Gran Vía, 1	Madrid	\N	28001	Spain	(91) 745 6200	(91) 745 6210
SANTG	Santé Gourmet	Jonas Bergulfsen	Owner	Erling Skakkes gate 78	Stavern	\N	4110	Norway	07-98 92 35	07-98 92 47
SAVEA	Save-a-lot Markets	Jose Pavarotti	Sales Representative	187 Suffolk Ln.	Boise	ID	83720	USA	(208) 555-8097	\N
SEVES	Seven Seas Imports	Hari Kumar	Sales Manager	90 Wadhurst Rd.	London	\N	OX15 4NB	UK	(171) 555-1717	(171) 555-5646
SIMOB	Simons bistro	Jytte Petersen	Owner	Vinbæltet 34	Kobenhavn	\N	1734	Denmark	31 12 34 56	31 13 35 57
SPECD	Spécialités du monde	Dominique Perrier	Marketing Manager	25, rue Lauriston	Paris	\N	75016	France	(1) 47.55.60.10	(1) 47.55.60.20
SPLIR	Split Rail Beer & Ale	Art Braunschweiger	Sales Manager	P.O. Box 555	Lander	WY	82520	USA	(307) 555-4680	(307) 555-6525
SUPRD	Suprêmes délices	Pascale Cartrain	Accounting Manager	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium	(071) 23 67 22 20	(071) 23 67 22 21
THEBI	The Big Cheese	Liz Nixon	Marketing Manager	89 Jefferson Way Suite 2	Portland	OR	97201	USA	(503) 555-3612	\N
THECR	The Cracker Box	Liu Wong	Marketing Assistant	55 Grizzly Peak Rd.	Butte	MT	59801	USA	(406) 555-5834	(406) 555-8083
TOMSP	Toms Spezialitäten	Karin Josephs	Marketing Manager	Luisenstr. 48	Münster	\N	44087	Germany	0251-031259	0251-035695
TORTU	Tortuga Restaurante	Miguel Angel Paolino	Owner	Avda. Azteca 123	México D.F.	\N	05033	Mexico	(5) 555-2933	\N
TRADH	Tradição Hipermercados	Anabela Domingues	Sales Representative	Av. Inês de Castro, 414	Sao Paulo	SP	05634-030	Brazil	(11) 555-2167	(11) 555-2168
TRAIH	Trail's Head Gourmet Provisioners	Helvetius Nagy	Sales Associate	722 DaVinci Blvd.	Kirkland	WA	98034	USA	(206) 555-8257	(206) 555-2174
VAFFE	Vaffeljernet	Palle Ibsen	Sales Manager	Smagsloget 45	Århus	\N	8200	Denmark	86 21 32 43	86 22 33 44
VICTE	Victuailles en stock	Mary Saveley	Sales Agent	2, rue du Commerce	Lyon	\N	69004	France	78.32.54.86	78.32.54.87
VINET	Vins et alcools Chevalier	Paul Henriot	Accounting Manager	59 rue de l'Abbaye	Reims	\N	51100	France	26.47.15.10	26.47.15.11
WANDK	Die Wandernde Kuh	Rita Müller	Sales Representative	Adenauerallee 900	Stuttgart	\N	70563	Germany	0711-020361	0711-035428
WARTH	Wartian Herkku	Pirkko Koskitalo	Accounting Manager	Torikatu 38	Oulu	\N	90110	Finland	981-443655	981-443655
WELLI	Wellington Importadora	Paula Parente	Sales Manager	Rua do Mercado, 12	Resende	SP	08737-363	Brazil	(14) 555-8122	\N
WHITC	White Clover Markets	Karl Jablonski	Owner	305 - 14th Ave. S. Suite 3B	Seattle	WA	98128	USA	(206) 555-4112	(206) 555-4115
WILMK	Wilman Kala	Matti Karttunen	Owner/Marketing Assistant	Keskuskatu 45	Helsinki	\N	21240	Finland	90-224 8858	90-224 8858
WOLZA	Wolski  Zajazd	Zbyszek Piestrzeniewicz	Owner	ul. Filtrowa 68	Warszawa	\N	01-012	Poland	(26) 642-7012	(26) 642-7012
\.


--
-- Data for Name: employee_territories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_territories (employee_id, territory_id) FROM stdin;
1	06897
1	19713
2	01581
2	01730
2	01833
2	02116
2	02139
2	02184
2	40222
3	30346
3	31406
3	32859
3	33607
4	20852
4	27403
4	27511
5	02903
5	07960
5	08837
5	10019
5	10038
5	11747
5	14450
6	85014
6	85251
6	98004
6	98052
6	98104
7	60179
7	60601
7	80202
7	80909
7	90405
7	94025
7	94105
7	95008
7	95054
7	95060
8	19428
8	44122
8	45839
8	53404
9	03049
9	03801
9	48075
9	48084
9	48304
9	55113
9	55439
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employee_id, last_name, first_name, title, title_of_courtesy, birth_date, hire_date, address, city, region, postal_code, country, home_phone, extension, photo, notes, reports_to, photo_path) FROM stdin;
1	Davolio	Nancy	Sales Representative	Ms.	1948-12-08	1992-05-01	507 - 20th Ave. E.\\nApt. 2A	Seattle	WA	98122	USA	(206) 555-9857	5467	\\x	Education includes a BA in psychology from Colorado State University in 1970.  She also completed The Art of the Cold Call.  Nancy is a member of Toastmasters International.	2	http://accweb/emmployees/davolio.bmp
2	Fuller	Andrew	Vice President, Sales	Dr.	1952-02-19	1992-08-14	908 W. Capital Way	Tacoma	WA	98401	USA	(206) 555-9482	3457	\\x	Andrew received his BTS commercial in 1974 and a Ph.D. in international marketing from the University of Dallas in 1981.  He is fluent in French and Italian and reads German.  He joined the company as a sales representative, was promoted to sales manager in January 1992 and to vice president of sales in March 1993.  Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.	\N	http://accweb/emmployees/fuller.bmp
3	Leverling	Janet	Sales Representative	Ms.	1963-08-30	1992-04-01	722 Moss Bay Blvd.	Kirkland	WA	98033	USA	(206) 555-3412	3355	\\x	Janet has a BS degree in chemistry from Boston College (1984).  She has also completed a certificate program in food retailing management.  Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.	2	http://accweb/emmployees/leverling.bmp
4	Peacock	Margaret	Sales Representative	Mrs.	1937-09-19	1993-05-03	4110 Old Redmond Rd.	Redmond	WA	98052	USA	(206) 555-8122	5176	\\x	Margaret holds a BA in English literature from Concordia College (1958) and an MA from the American Institute of Culinary Arts (1966).  She was assigned to the London office temporarily from July through November 1992.	2	http://accweb/emmployees/peacock.bmp
5	Buchanan	Steven	Sales Manager	Mr.	1955-03-04	1993-10-17	14 Garrett Hill	London	\N	SW1 8JR	UK	(71) 555-4848	3453	\\x	Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree in 1976.  Upon joining the company as a sales representative in 1992, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London.  He was promoted to sales manager in March 1993.  Mr. Buchanan has completed the courses Successful Telemarketing and International Sales Management.  He is fluent in French.	2	http://accweb/emmployees/buchanan.bmp
6	Suyama	Michael	Sales Representative	Mr.	1963-07-02	1993-10-17	Coventry House\\nMiner Rd.	London	\N	EC2 7JR	UK	(71) 555-7773	428	\\x	Michael is a graduate of Sussex University (MA, economics, 1983) and the University of California at Los Angeles (MBA, marketing, 1986).  He has also taken the courses Multi-Cultural Selling and Time Management for the Sales Professional.  He is fluent in Japanese and can read and write French, Portuguese, and Spanish.	5	http://accweb/emmployees/davolio.bmp
7	King	Robert	Sales Representative	Mr.	1960-05-29	1994-01-02	Edgeham Hollow\\nWinchester Way	London	\N	RG1 9SP	UK	(71) 555-5598	465	\\x	Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan in 1992, the year he joined the company.  After completing a course entitled Selling in Europe, he was transferred to the London office in March 1993.	5	http://accweb/emmployees/davolio.bmp
8	Callahan	Laura	Inside Sales Coordinator	Ms.	1958-01-09	1994-03-05	4726 - 11th Ave. N.E.	Seattle	WA	98105	USA	(206) 555-1189	2344	\\x	Laura received a BA in psychology from the University of Washington.  She has also completed a course in business French.  She reads and writes French.	2	http://accweb/emmployees/davolio.bmp
9	Dodsworth	Anne	Sales Representative	Ms.	1966-01-27	1994-11-15	7 Houndstooth Rd.	London	\N	WG2 7LT	UK	(71) 555-4444	452	\\x	Anne has a BA degree in English from St. Lawrence College.  She is fluent in French and German.	5	http://accweb/emmployees/davolio.bmp
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_details (order_id, product_id, unit_price, quantity, discount) FROM stdin;
10248	11	14	12	0
10248	42	9.8	10	0
10248	72	34.8	5	0
10249	14	18.6	9	0
10249	51	42.4	40	0
10250	41	7.7	10	0
10250	51	42.4	35	0.15
10250	65	16.8	15	0.15
10251	22	16.8	6	0.05
10251	57	15.6	15	0.05
10251	65	16.8	20	0
10252	20	64.8	40	0.05
10252	33	2	25	0.05
10252	60	27.2	40	0
10253	31	10	20	0
10253	39	14.4	42	0
10253	49	16	40	0
10254	24	3.6	15	0.15
10254	55	19.2	21	0.15
10254	74	8	21	0
10255	2	15.2	20	0
10255	16	13.9	35	0
10255	36	15.2	25	0
10255	59	44	30	0
10256	53	26.2	15	0
10256	77	10.4	12	0
10257	27	35.1	25	0
10257	39	14.4	6	0
10257	77	10.4	15	0
10258	2	15.2	50	0.2
10258	5	17	65	0.2
10258	32	25.6	6	0.2
10259	21	8	10	0
10259	37	20.8	1	0
10260	41	7.7	16	0.25
10260	57	15.6	50	0
10260	62	39.4	15	0.25
10260	70	12	21	0.25
10261	21	8	20	0
10261	35	14.4	20	0
10262	5	17	12	0.2
10262	7	24	15	0
10262	56	30.4	2	0
10263	16	13.9	60	0.25
10263	24	3.6	28	0
10263	30	20.7	60	0.25
10263	74	8	36	0.25
10264	2	15.2	35	0
10264	41	7.7	25	0.15
10265	17	31.2	30	0
10265	70	12	20	0
10266	12	30.4	12	0.05
10267	40	14.7	50	0
10267	59	44	70	0.15
10267	76	14.4	15	0.15
10268	29	99	10	0
10268	72	27.8	4	0
10269	33	2	60	0.05
10269	72	27.8	20	0.05
10270	36	15.2	30	0
10270	43	36.8	25	0
10271	33	2	24	0
10272	20	64.8	6	0
10272	31	10	40	0
10272	72	27.8	24	0
10273	10	24.8	24	0.05
10273	31	10	15	0.05
10273	33	2	20	0
10273	40	14.7	60	0.05
10273	76	14.4	33	0.05
10274	71	17.2	20	0
10274	72	27.8	7	0
10275	24	3.6	12	0.05
10275	59	44	6	0.05
10276	10	24.8	15	0
10276	13	4.8	10	0
10277	28	36.4	20	0
10277	62	39.4	12	0
10278	44	15.5	16	0
10278	59	44	15	0
10278	63	35.1	8	0
10278	73	12	25	0
10279	17	31.2	15	0.25
10280	24	3.6	12	0
10280	55	19.2	20	0
10280	75	6.2	30	0
10281	19	7.3	1	0
10281	24	3.6	6	0
10281	35	14.4	4	0
10282	30	20.7	6	0
10282	57	15.6	2	0
10283	15	12.4	20	0
10283	19	7.3	18	0
10283	60	27.2	35	0
10283	72	27.8	3	0
10284	27	35.1	15	0.25
10284	44	15.5	21	0
10284	60	27.2	20	0.25
10284	67	11.2	5	0.25
10285	1	14.4	45	0.2
10285	40	14.7	40	0.2
10285	53	26.2	36	0.2
10286	35	14.4	100	0
10286	62	39.4	40	0
10287	16	13.9	40	0.15
10287	34	11.2	20	0
10287	46	9.6	15	0.15
10288	54	5.9	10	0.1
10288	68	10	3	0.1
10289	3	8	30	0
10289	64	26.6	9	0
10290	5	17	20	0
10290	29	99	15	0
10290	49	16	15	0
10290	77	10.4	10	0
10291	13	4.8	20	0.1
10291	44	15.5	24	0.1
10291	51	42.4	2	0.1
10292	20	64.8	20	0
10293	18	50	12	0
10293	24	3.6	10	0
10293	63	35.1	5	0
10293	75	6.2	6	0
10294	1	14.4	18	0
10294	17	31.2	15	0
10294	43	36.8	15	0
10294	60	27.2	21	0
10294	75	6.2	6	0
10295	56	30.4	4	0
10296	11	16.8	12	0
10296	16	13.9	30	0
10296	69	28.8	15	0
10297	39	14.4	60	0
10297	72	27.8	20	0
10298	2	15.2	40	0
10298	36	15.2	40	0.25
10298	59	44	30	0.25
10298	62	39.4	15	0
10299	19	7.3	15	0
10299	70	12	20	0
10300	66	13.6	30	0
10300	68	10	20	0
10301	40	14.7	10	0
10301	56	30.4	20	0
10302	17	31.2	40	0
10302	28	36.4	28	0
10302	43	36.8	12	0
10303	40	14.7	40	0.1
10303	65	16.8	30	0.1
10303	68	10	15	0.1
10304	49	16	30	0
10304	59	44	10	0
10304	71	17.2	2	0
10305	18	50	25	0.1
10305	29	99	25	0.1
10305	39	14.4	30	0.1
10306	30	20.7	10	0
10306	53	26.2	10	0
10306	54	5.9	5	0
10307	62	39.4	10	0
10307	68	10	3	0
10308	69	28.8	1	0
10308	70	12	5	0
10309	4	17.6	20	0
10309	6	20	30	0
10309	42	11.2	2	0
10309	43	36.8	20	0
10309	71	17.2	3	0
10310	16	13.9	10	0
10310	62	39.4	5	0
10311	42	11.2	6	0
10311	69	28.8	7	0
10312	28	36.4	4	0
10312	43	36.8	24	0
10312	53	26.2	20	0
10312	75	6.2	10	0
10313	36	15.2	12	0
10314	32	25.6	40	0.1
10314	58	10.6	30	0.1
10314	62	39.4	25	0.1
10315	34	11.2	14	0
10315	70	12	30	0
10316	41	7.7	10	0
10316	62	39.4	70	0
10317	1	14.4	20	0
10318	41	7.7	20	0
10318	76	14.4	6	0
10319	17	31.2	8	0
10319	28	36.4	14	0
10319	76	14.4	30	0
10320	71	17.2	30	0
10321	35	14.4	10	0
10322	52	5.6	20	0
10323	15	12.4	5	0
10323	25	11.2	4	0
10323	39	14.4	4	0
10324	16	13.9	21	0.15
10324	35	14.4	70	0.15
10324	46	9.6	30	0
10324	59	44	40	0.15
10324	63	35.1	80	0.15
10325	6	20	6	0
10325	13	4.8	12	0
10325	14	18.6	9	0
10325	31	10	4	0
10325	72	27.8	40	0
10326	4	17.6	24	0
10326	57	15.6	16	0
10326	75	6.2	50	0
10327	2	15.2	25	0.2
10327	11	16.8	50	0.2
10327	30	20.7	35	0.2
10327	58	10.6	30	0.2
10328	59	44	9	0
10328	65	16.8	40	0
10328	68	10	10	0
10329	19	7.3	10	0.05
10329	30	20.7	8	0.05
10329	38	210.8	20	0.05
10329	56	30.4	12	0.05
10330	26	24.9	50	0.15
10330	72	27.8	25	0.15
10331	54	5.9	15	0
10332	18	50	40	0.2
10332	42	11.2	10	0.2
10332	47	7.6	16	0.2
10333	14	18.6	10	0
10333	21	8	10	0.1
10333	71	17.2	40	0.1
10334	52	5.6	8	0
10334	68	10	10	0
10335	2	15.2	7	0.2
10335	31	10	25	0.2
10335	32	25.6	6	0.2
10335	51	42.4	48	0.2
10336	4	17.6	18	0.1
10337	23	7.2	40	0
10337	26	24.9	24	0
10337	36	15.2	20	0
10337	37	20.8	28	0
10337	72	27.8	25	0
10338	17	31.2	20	0
10338	30	20.7	15	0
10339	4	17.6	10	0
10339	17	31.2	70	0.05
10339	62	39.4	28	0
10340	18	50	20	0.05
10340	41	7.7	12	0.05
10340	43	36.8	40	0.05
10341	33	2	8	0
10341	59	44	9	0.15
10342	2	15.2	24	0.2
10342	31	10	56	0.2
10342	36	15.2	40	0.2
10342	55	19.2	40	0.2
10343	64	26.6	50	0
10343	68	10	4	0.05
10343	76	14.4	15	0
10344	4	17.6	35	0
10344	8	32	70	0.25
10345	8	32	70	0
10345	19	7.3	80	0
10345	42	11.2	9	0
10346	17	31.2	36	0.1
10346	56	30.4	20	0
10347	25	11.2	10	0
10347	39	14.4	50	0.15
10347	40	14.7	4	0
10347	75	6.2	6	0.15
10348	1	14.4	15	0.15
10348	23	7.2	25	0
10349	54	5.9	24	0
10350	50	13	15	0.1
10350	69	28.8	18	0.1
10351	38	210.8	20	0.05
10351	41	7.7	13	0
10351	44	15.5	77	0.05
10351	65	16.8	10	0.05
10352	24	3.6	10	0
10352	54	5.9	20	0.15
10353	11	16.8	12	0.2
10353	38	210.8	50	0.2
10354	1	14.4	12	0
10354	29	99	4	0
10355	24	3.6	25	0
10355	57	15.6	25	0
10356	31	10	30	0
10356	55	19.2	12	0
10356	69	28.8	20	0
10357	10	24.8	30	0.2
10357	26	24.9	16	0
10357	60	27.2	8	0.2
10358	24	3.6	10	0.05
10358	34	11.2	10	0.05
10358	36	15.2	20	0.05
10359	16	13.9	56	0.05
10359	31	10	70	0.05
10359	60	27.2	80	0.05
10360	28	36.4	30	0
10360	29	99	35	0
10360	38	210.8	10	0
10360	49	16	35	0
10360	54	5.9	28	0
10361	39	14.4	54	0.1
10361	60	27.2	55	0.1
10362	25	11.2	50	0
10362	51	42.4	20	0
10362	54	5.9	24	0
10363	31	10	20	0
10363	75	6.2	12	0
10363	76	14.4	12	0
10364	69	28.8	30	0
10364	71	17.2	5	0
10365	11	16.8	24	0
10366	65	16.8	5	0
10366	77	10.4	5	0
10367	34	11.2	36	0
10367	54	5.9	18	0
10367	65	16.8	15	0
10367	77	10.4	7	0
10368	21	8	5	0.1
10368	28	36.4	13	0.1
10368	57	15.6	25	0
10368	64	26.6	35	0.1
10369	29	99	20	0
10369	56	30.4	18	0.25
10370	1	14.4	15	0.15
10370	64	26.6	30	0
10370	74	8	20	0.15
10371	36	15.2	6	0.2
10372	20	64.8	12	0.25
10372	38	210.8	40	0.25
10372	60	27.2	70	0.25
10372	72	27.8	42	0.25
10373	58	10.6	80	0.2
10373	71	17.2	50	0.2
10374	31	10	30	0
10374	58	10.6	15	0
10375	14	18.6	15	0
10375	54	5.9	10	0
10376	31	10	42	0.05
10377	28	36.4	20	0.15
10377	39	14.4	20	0.15
10378	71	17.2	6	0
10379	41	7.7	8	0.1
10379	63	35.1	16	0.1
10379	65	16.8	20	0.1
10380	30	20.7	18	0.1
10380	53	26.2	20	0.1
10380	60	27.2	6	0.1
10380	70	12	30	0
10381	74	8	14	0
10382	5	17	32	0
10382	18	50	9	0
10382	29	99	14	0
10382	33	2	60	0
10382	74	8	50	0
10383	13	4.8	20	0
10383	50	13	15	0
10383	56	30.4	20	0
10384	20	64.8	28	0
10384	60	27.2	15	0
10385	7	24	10	0.2
10385	60	27.2	20	0.2
10385	68	10	8	0.2
10386	24	3.6	15	0
10386	34	11.2	10	0
10387	24	3.6	15	0
10387	28	36.4	6	0
10387	59	44	12	0
10387	71	17.2	15	0
10388	45	7.6	15	0.2
10388	52	5.6	20	0.2
10388	53	26.2	40	0
10389	10	24.8	16	0
10389	55	19.2	15	0
10389	62	39.4	20	0
10389	70	12	30	0
10390	31	10	60	0.1
10390	35	14.4	40	0.1
10390	46	9.6	45	0
10390	72	27.8	24	0.1
10391	13	4.8	18	0
10392	69	28.8	50	0
10393	2	15.2	25	0.25
10393	14	18.6	42	0.25
10393	25	11.2	7	0.25
10393	26	24.9	70	0.25
10393	31	10	32	0
10394	13	4.8	10	0
10394	62	39.4	10	0
10395	46	9.6	28	0.1
10395	53	26.2	70	0.1
10395	69	28.8	8	0
10396	23	7.2	40	0
10396	71	17.2	60	0
10396	72	27.8	21	0
10397	21	8	10	0.15
10397	51	42.4	18	0.15
10398	35	14.4	30	0
10398	55	19.2	120	0.1
10399	68	10	60	0
10399	71	17.2	30	0
10399	76	14.4	35	0
10399	77	10.4	14	0
10400	29	99	21	0
10400	35	14.4	35	0
10400	49	16	30	0
10401	30	20.7	18	0
10401	56	30.4	70	0
10401	65	16.8	20	0
10401	71	17.2	60	0
10402	23	7.2	60	0
10402	63	35.1	65	0
10403	16	13.9	21	0.15
10403	48	10.2	70	0.15
10404	26	24.9	30	0.05
10404	42	11.2	40	0.05
10404	49	16	30	0.05
10405	3	8	50	0
10406	1	14.4	10	0
10406	21	8	30	0.1
10406	28	36.4	42	0.1
10406	36	15.2	5	0.1
10406	40	14.7	2	0.1
10407	11	16.8	30	0
10407	69	28.8	15	0
10407	71	17.2	15	0
10408	37	20.8	10	0
10408	54	5.9	6	0
10408	62	39.4	35	0
10409	14	18.6	12	0
10409	21	8	12	0
10410	33	2	49	0
10410	59	44	16	0
10411	41	7.7	25	0.2
10411	44	15.5	40	0.2
10411	59	44	9	0.2
10412	14	18.6	20	0.1
10413	1	14.4	24	0
10413	62	39.4	40	0
10413	76	14.4	14	0
10414	19	7.3	18	0.05
10414	33	2	50	0
10415	17	31.2	2	0
10415	33	2	20	0
10416	19	7.3	20	0
10416	53	26.2	10	0
10416	57	15.6	20	0
10417	38	210.8	50	0
10417	46	9.6	2	0.25
10417	68	10	36	0.25
10417	77	10.4	35	0
10418	2	15.2	60	0
10418	47	7.6	55	0
10418	61	22.8	16	0
10418	74	8	15	0
10419	60	27.2	60	0.05
10419	69	28.8	20	0.05
10420	9	77.6	20	0.1
10420	13	4.8	2	0.1
10420	70	12	8	0.1
10420	73	12	20	0.1
10421	19	7.3	4	0.15
10421	26	24.9	30	0
10421	53	26.2	15	0.15
10421	77	10.4	10	0.15
10422	26	24.9	2	0
10423	31	10	14	0
10423	59	44	20	0
10424	35	14.4	60	0.2
10424	38	210.8	49	0.2
10424	68	10	30	0.2
10425	55	19.2	10	0.25
10425	76	14.4	20	0.25
10426	56	30.4	5	0
10426	64	26.6	7	0
10427	14	18.6	35	0
10428	46	9.6	20	0
10429	50	13	40	0
10429	63	35.1	35	0.25
10430	17	31.2	45	0.2
10430	21	8	50	0
10430	56	30.4	30	0
10430	59	44	70	0.2
10431	17	31.2	50	0.25
10431	40	14.7	50	0.25
10431	47	7.6	30	0.25
10432	26	24.9	10	0
10432	54	5.9	40	0
10433	56	30.4	28	0
10434	11	16.8	6	0
10434	76	14.4	18	0.15
10435	2	15.2	10	0
10435	22	16.8	12	0
10435	72	27.8	10	0
10436	46	9.6	5	0
10436	56	30.4	40	0.1
10436	64	26.6	30	0.1
10436	75	6.2	24	0.1
10437	53	26.2	15	0
10438	19	7.3	15	0.2
10438	34	11.2	20	0.2
10438	57	15.6	15	0.2
10439	12	30.4	15	0
10439	16	13.9	16	0
10439	64	26.6	6	0
10439	74	8	30	0
10440	2	15.2	45	0.15
10440	16	13.9	49	0.15
10440	29	99	24	0.15
10440	61	22.8	90	0.15
10441	27	35.1	50	0
10442	11	16.8	30	0
10442	54	5.9	80	0
10442	66	13.6	60	0
10443	11	16.8	6	0.2
10443	28	36.4	12	0
10444	17	31.2	10	0
10444	26	24.9	15	0
10444	35	14.4	8	0
10444	41	7.7	30	0
10445	39	14.4	6	0
10445	54	5.9	15	0
10446	19	7.3	12	0.1
10446	24	3.6	20	0.1
10446	31	10	3	0.1
10446	52	5.6	15	0.1
10447	19	7.3	40	0
10447	65	16.8	35	0
10447	71	17.2	2	0
10448	26	24.9	6	0
10448	40	14.7	20	0
10449	10	24.8	14	0
10449	52	5.6	20	0
10449	62	39.4	35	0
10450	10	24.8	20	0.2
10450	54	5.9	6	0.2
10451	55	19.2	120	0.1
10451	64	26.6	35	0.1
10451	65	16.8	28	0.1
10451	77	10.4	55	0.1
10452	28	36.4	15	0
10452	44	15.5	100	0.05
10453	48	10.2	15	0.1
10453	70	12	25	0.1
10454	16	13.9	20	0.2
10454	33	2	20	0.2
10454	46	9.6	10	0.2
10455	39	14.4	20	0
10455	53	26.2	50	0
10455	61	22.8	25	0
10455	71	17.2	30	0
10456	21	8	40	0.15
10456	49	16	21	0.15
10457	59	44	36	0
10458	26	24.9	30	0
10458	28	36.4	30	0
10458	43	36.8	20	0
10458	56	30.4	15	0
10458	71	17.2	50	0
10459	7	24	16	0.05
10459	46	9.6	20	0.05
10459	72	27.8	40	0
10460	68	10	21	0.25
10460	75	6.2	4	0.25
10461	21	8	40	0.25
10461	30	20.7	28	0.25
10461	55	19.2	60	0.25
10462	13	4.8	1	0
10462	23	7.2	21	0
10463	19	7.3	21	0
10463	42	11.2	50	0
10464	4	17.6	16	0.2
10464	43	36.8	3	0
10464	56	30.4	30	0.2
10464	60	27.2	20	0
10465	24	3.6	25	0
10465	29	99	18	0.1
10465	40	14.7	20	0
10465	45	7.6	30	0.1
10465	50	13	25	0
10466	11	16.8	10	0
10466	46	9.6	5	0
10467	24	3.6	28	0
10467	25	11.2	12	0
10468	30	20.7	8	0
10468	43	36.8	15	0
10469	2	15.2	40	0.15
10469	16	13.9	35	0.15
10469	44	15.5	2	0.15
10470	18	50	30	0
10470	23	7.2	15	0
10470	64	26.6	8	0
10471	7	24	30	0
10471	56	30.4	20	0
10472	24	3.6	80	0.05
10472	51	42.4	18	0
10473	33	2	12	0
10473	71	17.2	12	0
10474	14	18.6	12	0
10474	28	36.4	18	0
10474	40	14.7	21	0
10474	75	6.2	10	0
10475	31	10	35	0.15
10475	66	13.6	60	0.15
10475	76	14.4	42	0.15
10476	55	19.2	2	0.05
10476	70	12	12	0
10477	1	14.4	15	0
10477	21	8	21	0.25
10477	39	14.4	20	0.25
10478	10	24.8	20	0.05
10479	38	210.8	30	0
10479	53	26.2	28	0
10479	59	44	60	0
10479	64	26.6	30	0
10480	47	7.6	30	0
10480	59	44	12	0
10481	49	16	24	0
10481	60	27.2	40	0
10482	40	14.7	10	0
10483	34	11.2	35	0.05
10483	77	10.4	30	0.05
10484	21	8	14	0
10484	40	14.7	10	0
10484	51	42.4	3	0
10485	2	15.2	20	0.1
10485	3	8	20	0.1
10485	55	19.2	30	0.1
10485	70	12	60	0.1
10486	11	16.8	5	0
10486	51	42.4	25	0
10486	74	8	16	0
10487	19	7.3	5	0
10487	26	24.9	30	0
10487	54	5.9	24	0.25
10488	59	44	30	0
10488	73	12	20	0.2
10489	11	16.8	15	0.25
10489	16	13.9	18	0
10490	59	44	60	0
10490	68	10	30	0
10490	75	6.2	36	0
10491	44	15.5	15	0.15
10491	77	10.4	7	0.15
10492	25	11.2	60	0.05
10492	42	11.2	20	0.05
10493	65	16.8	15	0.1
10493	66	13.6	10	0.1
10493	69	28.8	10	0.1
10494	56	30.4	30	0
10495	23	7.2	10	0
10495	41	7.7	20	0
10495	77	10.4	5	0
10496	31	10	20	0.05
10497	56	30.4	14	0
10497	72	27.8	25	0
10497	77	10.4	25	0
10498	24	4.5	14	0
10498	40	18.4	5	0
10498	42	14	30	0
10499	28	45.6	20	0
10499	49	20	25	0
10500	15	15.5	12	0.05
10500	28	45.6	8	0.05
10501	54	7.45	20	0
10502	45	9.5	21	0
10502	53	32.8	6	0
10502	67	14	30	0
10503	14	23.25	70	0
10503	65	21.05	20	0
10504	2	19	12	0
10504	21	10	12	0
10504	53	32.8	10	0
10504	61	28.5	25	0
10505	62	49.3	3	0
10506	25	14	18	0.1
10506	70	15	14	0.1
10507	43	46	15	0.15
10507	48	12.75	15	0.15
10508	13	6	10	0
10508	39	18	10	0
10509	28	45.6	3	0
10510	29	123.79	36	0
10510	75	7.75	36	0.1
10511	4	22	50	0.15
10511	7	30	50	0.15
10511	8	40	10	0.15
10512	24	4.5	10	0.15
10512	46	12	9	0.15
10512	47	9.5	6	0.15
10512	60	34	12	0.15
10513	21	10	40	0.2
10513	32	32	50	0.2
10513	61	28.5	15	0.2
10514	20	81	39	0
10514	28	45.6	35	0
10514	56	38	70	0
10514	65	21.05	39	0
10514	75	7.75	50	0
10515	9	97	16	0.15
10515	16	17.45	50	0
10515	27	43.9	120	0
10515	33	2.5	16	0.15
10515	60	34	84	0.15
10516	18	62.5	25	0.1
10516	41	9.65	80	0.1
10516	42	14	20	0
10517	52	7	6	0
10517	59	55	4	0
10517	70	15	6	0
10518	24	4.5	5	0
10518	38	263.5	15	0
10518	44	19.45	9	0
10519	10	31	16	0.05
10519	56	38	40	0
10519	60	34	10	0.05
10520	24	4.5	8	0
10520	53	32.8	5	0
10521	35	18	3	0
10521	41	9.65	10	0
10521	68	12.5	6	0
10522	1	18	40	0.2
10522	8	40	24	0
10522	30	25.89	20	0.2
10522	40	18.4	25	0.2
10523	17	39	25	0.1
10523	20	81	15	0.1
10523	37	26	18	0.1
10523	41	9.65	6	0.1
10524	10	31	2	0
10524	30	25.89	10	0
10524	43	46	60	0
10524	54	7.45	15	0
10525	36	19	30	0
10525	40	18.4	15	0.1
10526	1	18	8	0.15
10526	13	6	10	0
10526	56	38	30	0.15
10527	4	22	50	0.1
10527	36	19	30	0.1
10528	11	21	3	0
10528	33	2.5	8	0.2
10528	72	34.8	9	0
10529	55	24	14	0
10529	68	12.5	20	0
10529	69	36	10	0
10530	17	39	40	0
10530	43	46	25	0
10530	61	28.5	20	0
10530	76	18	50	0
10531	59	55	2	0
10532	30	25.89	15	0
10532	66	17	24	0
10533	4	22	50	0.05
10533	72	34.8	24	0
10533	73	15	24	0.05
10534	30	25.89	10	0
10534	40	18.4	10	0.2
10534	54	7.45	10	0.2
10535	11	21	50	0.1
10535	40	18.4	10	0.1
10535	57	19.5	5	0.1
10535	59	55	15	0.1
10536	12	38	15	0.25
10536	31	12.5	20	0
10536	33	2.5	30	0
10536	60	34	35	0.25
10537	31	12.5	30	0
10537	51	53	6	0
10537	58	13.25	20	0
10537	72	34.8	21	0
10537	73	15	9	0
10538	70	15	7	0
10538	72	34.8	1	0
10539	13	6	8	0
10539	21	10	15	0
10539	33	2.5	15	0
10539	49	20	6	0
10540	3	10	60	0
10540	26	31.23	40	0
10540	38	263.5	30	0
10540	68	12.5	35	0
10541	24	4.5	35	0.1
10541	38	263.5	4	0.1
10541	65	21.05	36	0.1
10541	71	21.5	9	0.1
10542	11	21	15	0.05
10542	54	7.45	24	0.05
10543	12	38	30	0.15
10543	23	9	70	0.15
10544	28	45.6	7	0
10544	67	14	7	0
10545	11	21	10	0
10546	7	30	10	0
10546	35	18	30	0
10546	62	49.3	40	0
10547	32	32	24	0.15
10547	36	19	60	0
10548	34	14	10	0.25
10548	41	9.65	14	0
10549	31	12.5	55	0.15
10549	45	9.5	100	0.15
10549	51	53	48	0.15
10550	17	39	8	0.1
10550	19	9.2	10	0
10550	21	10	6	0.1
10550	61	28.5	10	0.1
10551	16	17.45	40	0.15
10551	35	18	20	0.15
10551	44	19.45	40	0
10552	69	36	18	0
10552	75	7.75	30	0
10553	11	21	15	0
10553	16	17.45	14	0
10553	22	21	24	0
10553	31	12.5	30	0
10553	35	18	6	0
10554	16	17.45	30	0.05
10554	23	9	20	0.05
10554	62	49.3	20	0.05
10554	77	13	10	0.05
10555	14	23.25	30	0.2
10555	19	9.2	35	0.2
10555	24	4.5	18	0.2
10555	51	53	20	0.2
10555	56	38	40	0.2
10556	72	34.8	24	0
10557	64	33.25	30	0
10557	75	7.75	20	0
10558	47	9.5	25	0
10558	51	53	20	0
10558	52	7	30	0
10558	53	32.8	18	0
10558	73	15	3	0
10559	41	9.65	12	0.05
10559	55	24	18	0.05
10560	30	25.89	20	0
10560	62	49.3	15	0.25
10561	44	19.45	10	0
10561	51	53	50	0
10562	33	2.5	20	0.1
10562	62	49.3	10	0.1
10563	36	19	25	0
10563	52	7	70	0
10564	17	39	16	0.05
10564	31	12.5	6	0.05
10564	55	24	25	0.05
10565	24	4.5	25	0.1
10565	64	33.25	18	0.1
10566	11	21	35	0.15
10566	18	62.5	18	0.15
10566	76	18	10	0
10567	31	12.5	60	0.2
10567	51	53	3	0
10567	59	55	40	0.2
10568	10	31	5	0
10569	31	12.5	35	0.2
10569	76	18	30	0
10570	11	21	15	0.05
10570	56	38	60	0.05
10571	14	23.25	11	0.15
10571	42	14	28	0.15
10572	16	17.45	12	0.1
10572	32	32	10	0.1
10572	40	18.4	50	0
10572	75	7.75	15	0.1
10573	17	39	18	0
10573	34	14	40	0
10573	53	32.8	25	0
10574	33	2.5	14	0
10574	40	18.4	2	0
10574	62	49.3	10	0
10574	64	33.25	6	0
10575	59	55	12	0
10575	63	43.9	6	0
10575	72	34.8	30	0
10575	76	18	10	0
10576	1	18	10	0
10576	31	12.5	20	0
10576	44	19.45	21	0
10577	39	18	10	0
10577	75	7.75	20	0
10577	77	13	18	0
10578	35	18	20	0
10578	57	19.5	6	0
10579	15	15.5	10	0
10579	75	7.75	21	0
10580	14	23.25	15	0.05
10580	41	9.65	9	0.05
10580	65	21.05	30	0.05
10581	75	7.75	50	0.2
10582	57	19.5	4	0
10582	76	18	14	0
10583	29	123.79	10	0
10583	60	34	24	0.15
10583	69	36	10	0.15
10584	31	12.5	50	0.05
10585	47	9.5	15	0
10586	52	7	4	0.15
10587	26	31.23	6	0
10587	35	18	20	0
10587	77	13	20	0
10588	18	62.5	40	0.2
10588	42	14	100	0.2
10589	35	18	4	0
10590	1	18	20	0
10590	77	13	60	0.05
10591	3	10	14	0
10591	7	30	10	0
10591	54	7.45	50	0
10592	15	15.5	25	0.05
10592	26	31.23	5	0.05
10593	20	81	21	0.2
10593	69	36	20	0.2
10593	76	18	4	0.2
10594	52	7	24	0
10594	58	13.25	30	0
10595	35	18	30	0.25
10595	61	28.5	120	0.25
10595	69	36	65	0.25
10596	56	38	5	0.2
10596	63	43.9	24	0.2
10596	75	7.75	30	0.2
10597	24	4.5	35	0.2
10597	57	19.5	20	0
10597	65	21.05	12	0.2
10598	27	43.9	50	0
10598	71	21.5	9	0
10599	62	49.3	10	0
10600	54	7.45	4	0
10600	73	15	30	0
10601	13	6	60	0
10601	59	55	35	0
10602	77	13	5	0.25
10603	22	21	48	0
10603	49	20	25	0.05
10604	48	12.75	6	0.1
10604	76	18	10	0.1
10605	16	17.45	30	0.05
10605	59	55	20	0.05
10605	60	34	70	0.05
10605	71	21.5	15	0.05
10606	4	22	20	0.2
10606	55	24	20	0.2
10606	62	49.3	10	0.2
10607	7	30	45	0
10607	17	39	100	0
10607	33	2.5	14	0
10607	40	18.4	42	0
10607	72	34.8	12	0
10608	56	38	28	0
10609	1	18	3	0
10609	10	31	10	0
10609	21	10	6	0
10610	36	19	21	0.25
10611	1	18	6	0
10611	2	19	10	0
10611	60	34	15	0
10612	10	31	70	0
10612	36	19	55	0
10612	49	20	18	0
10612	60	34	40	0
10612	76	18	80	0
10613	13	6	8	0.1
10613	75	7.75	40	0
10614	11	21	14	0
10614	21	10	8	0
10614	39	18	5	0
10615	55	24	5	0
10616	38	263.5	15	0.05
10616	56	38	14	0
10616	70	15	15	0.05
10616	71	21.5	15	0.05
10617	59	55	30	0.15
10618	6	25	70	0
10618	56	38	20	0
10618	68	12.5	15	0
10619	21	10	42	0
10619	22	21	40	0
10620	24	4.5	5	0
10620	52	7	5	0
10621	19	9.2	5	0
10621	23	9	10	0
10621	70	15	20	0
10621	71	21.5	15	0
10622	2	19	20	0
10622	68	12.5	18	0.2
10623	14	23.25	21	0
10623	19	9.2	15	0.1
10623	21	10	25	0.1
10623	24	4.5	3	0
10623	35	18	30	0.1
10624	28	45.6	10	0
10624	29	123.79	6	0
10624	44	19.45	10	0
10625	14	23.25	3	0
10625	42	14	5	0
10625	60	34	10	0
10626	53	32.8	12	0
10626	60	34	20	0
10626	71	21.5	20	0
10627	62	49.3	15	0
10627	73	15	35	0.15
10628	1	18	25	0
10629	29	123.79	20	0
10629	64	33.25	9	0
10630	55	24	12	0.05
10630	76	18	35	0
10631	75	7.75	8	0.1
10632	2	19	30	0.05
10632	33	2.5	20	0.05
10633	12	38	36	0.15
10633	13	6	13	0.15
10633	26	31.23	35	0.15
10633	62	49.3	80	0.15
10634	7	30	35	0
10634	18	62.5	50	0
10634	51	53	15	0
10634	75	7.75	2	0
10635	4	22	10	0.1
10635	5	21.35	15	0.1
10635	22	21	40	0
10636	4	22	25	0
10636	58	13.25	6	0
10637	11	21	10	0
10637	50	16.25	25	0.05
10637	56	38	60	0.05
10638	45	9.5	20	0
10638	65	21.05	21	0
10638	72	34.8	60	0
10639	18	62.5	8	0
10640	69	36	20	0.25
10640	70	15	15	0.25
10641	2	19	50	0
10641	40	18.4	60	0
10642	21	10	30	0.2
10642	61	28.5	20	0.2
10643	28	45.6	15	0.25
10643	39	18	21	0.25
10643	46	12	2	0.25
10644	18	62.5	4	0.1
10644	43	46	20	0
10644	46	12	21	0.1
10645	18	62.5	20	0
10645	36	19	15	0
10646	1	18	15	0.25
10646	10	31	18	0.25
10646	71	21.5	30	0.25
10646	77	13	35	0.25
10647	19	9.2	30	0
10647	39	18	20	0
10648	22	21	15	0
10648	24	4.5	15	0.15
10649	28	45.6	20	0
10649	72	34.8	15	0
10650	30	25.89	30	0
10650	53	32.8	25	0.05
10650	54	7.45	30	0
10651	19	9.2	12	0.25
10651	22	21	20	0.25
10652	30	25.89	2	0.25
10652	42	14	20	0
10653	16	17.45	30	0.1
10653	60	34	20	0.1
10654	4	22	12	0.1
10654	39	18	20	0.1
10654	54	7.45	6	0.1
10655	41	9.65	20	0.2
10656	14	23.25	3	0.1
10656	44	19.45	28	0.1
10656	47	9.5	6	0.1
10657	15	15.5	50	0
10657	41	9.65	24	0
10657	46	12	45	0
10657	47	9.5	10	0
10657	56	38	45	0
10657	60	34	30	0
10658	21	10	60	0
10658	40	18.4	70	0.05
10658	60	34	55	0.05
10658	77	13	70	0.05
10659	31	12.5	20	0.05
10659	40	18.4	24	0.05
10659	70	15	40	0.05
10660	20	81	21	0
10661	39	18	3	0.2
10661	58	13.25	49	0.2
10662	68	12.5	10	0
10663	40	18.4	30	0.05
10663	42	14	30	0.05
10663	51	53	20	0.05
10664	10	31	24	0.15
10664	56	38	12	0.15
10664	65	21.05	15	0.15
10665	51	53	20	0
10665	59	55	1	0
10665	76	18	10	0
10666	29	123.79	36	0
10666	65	21.05	10	0
10667	69	36	45	0.2
10667	71	21.5	14	0.2
10668	31	12.5	8	0.1
10668	55	24	4	0.1
10668	64	33.25	15	0.1
10669	36	19	30	0
10670	23	9	32	0
10670	46	12	60	0
10670	67	14	25	0
10670	73	15	50	0
10670	75	7.75	25	0
10671	16	17.45	10	0
10671	62	49.3	10	0
10671	65	21.05	12	0
10672	38	263.5	15	0.1
10672	71	21.5	12	0
10673	16	17.45	3	0
10673	42	14	6	0
10673	43	46	6	0
10674	23	9	5	0
10675	14	23.25	30	0
10675	53	32.8	10	0
10675	58	13.25	30	0
10676	10	31	2	0
10676	19	9.2	7	0
10676	44	19.45	21	0
10677	26	31.23	30	0.15
10677	33	2.5	8	0.15
10678	12	38	100	0
10678	33	2.5	30	0
10678	41	9.65	120	0
10678	54	7.45	30	0
10679	59	55	12	0
10680	16	17.45	50	0.25
10680	31	12.5	20	0.25
10680	42	14	40	0.25
10681	19	9.2	30	0.1
10681	21	10	12	0.1
10681	64	33.25	28	0
10682	33	2.5	30	0
10682	66	17	4	0
10682	75	7.75	30	0
10683	52	7	9	0
10684	40	18.4	20	0
10684	47	9.5	40	0
10684	60	34	30	0
10685	10	31	20	0
10685	41	9.65	4	0
10685	47	9.5	15	0
10686	17	39	30	0.2
10686	26	31.23	15	0
10687	9	97	50	0.25
10687	29	123.79	10	0
10687	36	19	6	0.25
10688	10	31	18	0.1
10688	28	45.6	60	0.1
10688	34	14	14	0
10689	1	18	35	0.25
10690	56	38	20	0.25
10690	77	13	30	0.25
10691	1	18	30	0
10691	29	123.79	40	0
10691	43	46	40	0
10691	44	19.45	24	0
10691	62	49.3	48	0
10692	63	43.9	20	0
10693	9	97	6	0
10693	54	7.45	60	0.15
10693	69	36	30	0.15
10693	73	15	15	0.15
10694	7	30	90	0
10694	59	55	25	0
10694	70	15	50	0
10695	8	40	10	0
10695	12	38	4	0
10695	24	4.5	20	0
10696	17	39	20	0
10696	46	12	18	0
10697	19	9.2	7	0.25
10697	35	18	9	0.25
10697	58	13.25	30	0.25
10697	70	15	30	0.25
10698	11	21	15	0
10698	17	39	8	0.05
10698	29	123.79	12	0.05
10698	65	21.05	65	0.05
10698	70	15	8	0.05
10699	47	9.5	12	0
10700	1	18	5	0.2
10700	34	14	12	0.2
10700	68	12.5	40	0.2
10700	71	21.5	60	0.2
10701	59	55	42	0.15
10701	71	21.5	20	0.15
10701	76	18	35	0.15
10702	3	10	6	0
10702	76	18	15	0
10703	2	19	5	0
10703	59	55	35	0
10703	73	15	35	0
10704	4	22	6	0
10704	24	4.5	35	0
10704	48	12.75	24	0
10705	31	12.5	20	0
10705	32	32	4	0
10706	16	17.45	20	0
10706	43	46	24	0
10706	59	55	8	0
10707	55	24	21	0
10707	57	19.5	40	0
10707	70	15	28	0.15
10708	5	21.35	4	0
10708	36	19	5	0
10709	8	40	40	0
10709	51	53	28	0
10709	60	34	10	0
10710	19	9.2	5	0
10710	47	9.5	5	0
10711	19	9.2	12	0
10711	41	9.65	42	0
10711	53	32.8	120	0
10712	53	32.8	3	0.05
10712	56	38	30	0
10713	10	31	18	0
10713	26	31.23	30	0
10713	45	9.5	110	0
10713	46	12	24	0
10714	2	19	30	0.25
10714	17	39	27	0.25
10714	47	9.5	50	0.25
10714	56	38	18	0.25
10714	58	13.25	12	0.25
10715	10	31	21	0
10715	71	21.5	30	0
10716	21	10	5	0
10716	51	53	7	0
10716	61	28.5	10	0
10717	21	10	32	0.05
10717	54	7.45	15	0
10717	69	36	25	0.05
10718	12	38	36	0
10718	16	17.45	20	0
10718	36	19	40	0
10718	62	49.3	20	0
10719	18	62.5	12	0.25
10719	30	25.89	3	0.25
10719	54	7.45	40	0.25
10720	35	18	21	0
10720	71	21.5	8	0
10721	44	19.45	50	0.05
10722	2	19	3	0
10722	31	12.5	50	0
10722	68	12.5	45	0
10722	75	7.75	42	0
10723	26	31.23	15	0
10724	10	31	16	0
10724	61	28.5	5	0
10725	41	9.65	12	0
10725	52	7	4	0
10725	55	24	6	0
10726	4	22	25	0
10726	11	21	5	0
10727	17	39	20	0.05
10727	56	38	10	0.05
10727	59	55	10	0.05
10728	30	25.89	15	0
10728	40	18.4	6	0
10728	55	24	12	0
10728	60	34	15	0
10729	1	18	50	0
10729	21	10	30	0
10729	50	16.25	40	0
10730	16	17.45	15	0.05
10730	31	12.5	3	0.05
10730	65	21.05	10	0.05
10731	21	10	40	0.05
10731	51	53	30	0.05
10732	76	18	20	0
10733	14	23.25	16	0
10733	28	45.6	20	0
10733	52	7	25	0
10734	6	25	30	0
10734	30	25.89	15	0
10734	76	18	20	0
10735	61	28.5	20	0.1
10735	77	13	2	0.1
10736	65	21.05	40	0
10736	75	7.75	20	0
10737	13	6	4	0
10737	41	9.65	12	0
10738	16	17.45	3	0
10739	36	19	6	0
10739	52	7	18	0
10740	28	45.6	5	0.2
10740	35	18	35	0.2
10740	45	9.5	40	0.2
10740	56	38	14	0.2
10741	2	19	15	0.2
10742	3	10	20	0
10742	60	34	50	0
10742	72	34.8	35	0
10743	46	12	28	0.05
10744	40	18.4	50	0.2
10745	18	62.5	24	0
10745	44	19.45	16	0
10745	59	55	45	0
10745	72	34.8	7	0
10746	13	6	6	0
10746	42	14	28	0
10746	62	49.3	9	0
10746	69	36	40	0
10747	31	12.5	8	0
10747	41	9.65	35	0
10747	63	43.9	9	0
10747	69	36	30	0
10748	23	9	44	0
10748	40	18.4	40	0
10748	56	38	28	0
10749	56	38	15	0
10749	59	55	6	0
10749	76	18	10	0
10750	14	23.25	5	0.15
10750	45	9.5	40	0.15
10750	59	55	25	0.15
10751	26	31.23	12	0.1
10751	30	25.89	30	0
10751	50	16.25	20	0.1
10751	73	15	15	0
10752	1	18	8	0
10752	69	36	3	0
10753	45	9.5	4	0
10753	74	10	5	0
10754	40	18.4	3	0
10755	47	9.5	30	0.25
10755	56	38	30	0.25
10755	57	19.5	14	0.25
10755	69	36	25	0.25
10756	18	62.5	21	0.2
10756	36	19	20	0.2
10756	68	12.5	6	0.2
10756	69	36	20	0.2
10757	34	14	30	0
10757	59	55	7	0
10757	62	49.3	30	0
10757	64	33.25	24	0
10758	26	31.23	20	0
10758	52	7	60	0
10758	70	15	40	0
10759	32	32	10	0
10760	25	14	12	0.25
10760	27	43.9	40	0
10760	43	46	30	0.25
10761	25	14	35	0.25
10761	75	7.75	18	0
10762	39	18	16	0
10762	47	9.5	30	0
10762	51	53	28	0
10762	56	38	60	0
10763	21	10	40	0
10763	22	21	6	0
10763	24	4.5	20	0
10764	3	10	20	0.1
10764	39	18	130	0.1
10765	65	21.05	80	0.1
10766	2	19	40	0
10766	7	30	35	0
10766	68	12.5	40	0
10767	42	14	2	0
10768	22	21	4	0
10768	31	12.5	50	0
10768	60	34	15	0
10768	71	21.5	12	0
10769	41	9.65	30	0.05
10769	52	7	15	0.05
10769	61	28.5	20	0
10769	62	49.3	15	0
10770	11	21	15	0.25
10771	71	21.5	16	0
10772	29	123.79	18	0
10772	59	55	25	0
10773	17	39	33	0
10773	31	12.5	70	0.2
10773	75	7.75	7	0.2
10774	31	12.5	2	0.25
10774	66	17	50	0
10775	10	31	6	0
10775	67	14	3	0
10776	31	12.5	16	0.05
10776	42	14	12	0.05
10776	45	9.5	27	0.05
10776	51	53	120	0.05
10777	42	14	20	0.2
10778	41	9.65	10	0
10779	16	17.45	20	0
10779	62	49.3	20	0
10780	70	15	35	0
10780	77	13	15	0
10781	54	7.45	3	0.2
10781	56	38	20	0.2
10781	74	10	35	0
10782	31	12.5	1	0
10783	31	12.5	10	0
10783	38	263.5	5	0
10784	36	19	30	0
10784	39	18	2	0.15
10784	72	34.8	30	0.15
10785	10	31	10	0
10785	75	7.75	10	0
10786	8	40	30	0.2
10786	30	25.89	15	0.2
10786	75	7.75	42	0.2
10787	2	19	15	0.05
10787	29	123.79	20	0.05
10788	19	9.2	50	0.05
10788	75	7.75	40	0.05
10789	18	62.5	30	0
10789	35	18	15	0
10789	63	43.9	30	0
10789	68	12.5	18	0
10790	7	30	3	0.15
10790	56	38	20	0.15
10791	29	123.79	14	0.05
10791	41	9.65	20	0.05
10792	2	19	10	0
10792	54	7.45	3	0
10792	68	12.5	15	0
10793	41	9.65	14	0
10793	52	7	8	0
10794	14	23.25	15	0.2
10794	54	7.45	6	0.2
10795	16	17.45	65	0
10795	17	39	35	0.25
10796	26	31.23	21	0.2
10796	44	19.45	10	0
10796	64	33.25	35	0.2
10796	69	36	24	0.2
10797	11	21	20	0
10798	62	49.3	2	0
10798	72	34.8	10	0
10799	13	6	20	0.15
10799	24	4.5	20	0.15
10799	59	55	25	0
10800	11	21	50	0.1
10800	51	53	10	0.1
10800	54	7.45	7	0.1
10801	17	39	40	0.25
10801	29	123.79	20	0.25
10802	30	25.89	25	0.25
10802	51	53	30	0.25
10802	55	24	60	0.25
10802	62	49.3	5	0.25
10803	19	9.2	24	0.05
10803	25	14	15	0.05
10803	59	55	15	0.05
10804	10	31	36	0
10804	28	45.6	24	0
10804	49	20	4	0.15
10805	34	14	10	0
10805	38	263.5	10	0
10806	2	19	20	0.25
10806	65	21.05	2	0
10806	74	10	15	0.25
10807	40	18.4	1	0
10808	56	38	20	0.15
10808	76	18	50	0.15
10809	52	7	20	0
10810	13	6	7	0
10810	25	14	5	0
10810	70	15	5	0
10811	19	9.2	15	0
10811	23	9	18	0
10811	40	18.4	30	0
10812	31	12.5	16	0.1
10812	72	34.8	40	0.1
10812	77	13	20	0
10813	2	19	12	0.2
10813	46	12	35	0
10814	41	9.65	20	0
10814	43	46	20	0.15
10814	48	12.75	8	0.15
10814	61	28.5	30	0.15
10815	33	2.5	16	0
10816	38	263.5	30	0.05
10816	62	49.3	20	0.05
10817	26	31.23	40	0.15
10817	38	263.5	30	0
10817	40	18.4	60	0.15
10817	62	49.3	25	0.15
10818	32	32	20	0
10818	41	9.65	20	0
10819	43	46	7	0
10819	75	7.75	20	0
10820	56	38	30	0
10821	35	18	20	0
10821	51	53	6	0
10822	62	49.3	3	0
10822	70	15	6	0
10823	11	21	20	0.1
10823	57	19.5	15	0
10823	59	55	40	0.1
10823	77	13	15	0.1
10824	41	9.65	12	0
10824	70	15	9	0
10825	26	31.23	12	0
10825	53	32.8	20	0
10826	31	12.5	35	0
10826	57	19.5	15	0
10827	10	31	15	0
10827	39	18	21	0
10828	20	81	5	0
10828	38	263.5	2	0
10829	2	19	10	0
10829	8	40	20	0
10829	13	6	10	0
10829	60	34	21	0
10830	6	25	6	0
10830	39	18	28	0
10830	60	34	30	0
10830	68	12.5	24	0
10831	19	9.2	2	0
10831	35	18	8	0
10831	38	263.5	8	0
10831	43	46	9	0
10832	13	6	3	0.2
10832	25	14	10	0.2
10832	44	19.45	16	0.2
10832	64	33.25	3	0
10833	7	30	20	0.1
10833	31	12.5	9	0.1
10833	53	32.8	9	0.1
10834	29	123.79	8	0.05
10834	30	25.89	20	0.05
10835	59	55	15	0
10835	77	13	2	0.2
10836	22	21	52	0
10836	35	18	6	0
10836	57	19.5	24	0
10836	60	34	60	0
10836	64	33.25	30	0
10837	13	6	6	0
10837	40	18.4	25	0
10837	47	9.5	40	0.25
10837	76	18	21	0.25
10838	1	18	4	0.25
10838	18	62.5	25	0.25
10838	36	19	50	0.25
10839	58	13.25	30	0.1
10839	72	34.8	15	0.1
10840	25	14	6	0.2
10840	39	18	10	0.2
10841	10	31	16	0
10841	56	38	30	0
10841	59	55	50	0
10841	77	13	15	0
10842	11	21	15	0
10842	43	46	5	0
10842	68	12.5	20	0
10842	70	15	12	0
10843	51	53	4	0.25
10844	22	21	35	0
10845	23	9	70	0.1
10845	35	18	25	0.1
10845	42	14	42	0.1
10845	58	13.25	60	0.1
10845	64	33.25	48	0
10846	4	22	21	0
10846	70	15	30	0
10846	74	10	20	0
10847	1	18	80	0.2
10847	19	9.2	12	0.2
10847	37	26	60	0.2
10847	45	9.5	36	0.2
10847	60	34	45	0.2
10847	71	21.5	55	0.2
10848	5	21.35	30	0
10848	9	97	3	0
10849	3	10	49	0
10849	26	31.23	18	0.15
10850	25	14	20	0.15
10850	33	2.5	4	0.15
10850	70	15	30	0.15
10851	2	19	5	0.05
10851	25	14	10	0.05
10851	57	19.5	10	0.05
10851	59	55	42	0.05
10852	2	19	15	0
10852	17	39	6	0
10852	62	49.3	50	0
10853	18	62.5	10	0
10854	10	31	100	0.15
10854	13	6	65	0.15
10855	16	17.45	50	0
10855	31	12.5	14	0
10855	56	38	24	0
10855	65	21.05	15	0.15
10856	2	19	20	0
10856	42	14	20	0
10857	3	10	30	0
10857	26	31.23	35	0.25
10857	29	123.79	10	0.25
10858	7	30	5	0
10858	27	43.9	10	0
10858	70	15	4	0
10859	24	4.5	40	0.25
10859	54	7.45	35	0.25
10859	64	33.25	30	0.25
10860	51	53	3	0
10860	76	18	20	0
10861	17	39	42	0
10861	18	62.5	20	0
10861	21	10	40	0
10861	33	2.5	35	0
10861	62	49.3	3	0
10862	11	21	25	0
10862	52	7	8	0
10863	1	18	20	0.15
10863	58	13.25	12	0.15
10864	35	18	4	0
10864	67	14	15	0
10865	38	263.5	60	0.05
10865	39	18	80	0.05
10866	2	19	21	0.25
10866	24	4.5	6	0.25
10866	30	25.89	40	0.25
10867	53	32.8	3	0
10868	26	31.23	20	0
10868	35	18	30	0
10868	49	20	42	0.1
10869	1	18	40	0
10869	11	21	10	0
10869	23	9	50	0
10869	68	12.5	20	0
10870	35	18	3	0
10870	51	53	2	0
10871	6	25	50	0.05
10871	16	17.45	12	0.05
10871	17	39	16	0.05
10872	55	24	10	0.05
10872	62	49.3	20	0.05
10872	64	33.25	15	0.05
10872	65	21.05	21	0.05
10873	21	10	20	0
10873	28	45.6	3	0
10874	10	31	10	0
10875	19	9.2	25	0
10875	47	9.5	21	0.1
10875	49	20	15	0
10876	46	12	21	0
10876	64	33.25	20	0
10877	16	17.45	30	0.25
10877	18	62.5	25	0
10878	20	81	20	0.05
10879	40	18.4	12	0
10879	65	21.05	10	0
10879	76	18	10	0
10880	23	9	30	0.2
10880	61	28.5	30	0.2
10880	70	15	50	0.2
10881	73	15	10	0
10882	42	14	25	0
10882	49	20	20	0.15
10882	54	7.45	32	0.15
10883	24	4.5	8	0
10884	21	10	40	0.05
10884	56	38	21	0.05
10884	65	21.05	12	0.05
10885	2	19	20	0
10885	24	4.5	12	0
10885	70	15	30	0
10885	77	13	25	0
10886	10	31	70	0
10886	31	12.5	35	0
10886	77	13	40	0
10887	25	14	5	0
10888	2	19	20	0
10888	68	12.5	18	0
10889	11	21	40	0
10889	38	263.5	40	0
10890	17	39	15	0
10890	34	14	10	0
10890	41	9.65	14	0
10891	30	25.89	15	0.05
10892	59	55	40	0.05
10893	8	40	30	0
10893	24	4.5	10	0
10893	29	123.79	24	0
10893	30	25.89	35	0
10893	36	19	20	0
10894	13	6	28	0.05
10894	69	36	50	0.05
10894	75	7.75	120	0.05
10895	24	4.5	110	0
10895	39	18	45	0
10895	40	18.4	91	0
10895	60	34	100	0
10896	45	9.5	15	0
10896	56	38	16	0
10897	29	123.79	80	0
10897	30	25.89	36	0
10898	13	6	5	0
10899	39	18	8	0.15
10900	70	15	3	0.25
10901	41	9.65	30	0
10901	71	21.5	30	0
10902	55	24	30	0.15
10902	62	49.3	6	0.15
10903	13	6	40	0
10903	65	21.05	21	0
10903	68	12.5	20	0
10904	58	13.25	15	0
10904	62	49.3	35	0
10905	1	18	20	0.05
10906	61	28.5	15	0
10907	75	7.75	14	0
10908	7	30	20	0.05
10908	52	7	14	0.05
10909	7	30	12	0
10909	16	17.45	15	0
10909	41	9.65	5	0
10910	19	9.2	12	0
10910	49	20	10	0
10910	61	28.5	5	0
10911	1	18	10	0
10911	17	39	12	0
10911	67	14	15	0
10912	11	21	40	0.25
10912	29	123.79	60	0.25
10913	4	22	30	0.25
10913	33	2.5	40	0.25
10913	58	13.25	15	0
10914	71	21.5	25	0
10915	17	39	10	0
10915	33	2.5	30	0
10915	54	7.45	10	0
10916	16	17.45	6	0
10916	32	32	6	0
10916	57	19.5	20	0
10917	30	25.89	1	0
10917	60	34	10	0
10918	1	18	60	0.25
10918	60	34	25	0.25
10919	16	17.45	24	0
10919	25	14	24	0
10919	40	18.4	20	0
10920	50	16.25	24	0
10921	35	18	10	0
10921	63	43.9	40	0
10922	17	39	15	0
10922	24	4.5	35	0
10923	42	14	10	0.2
10923	43	46	10	0.2
10923	67	14	24	0.2
10924	10	31	20	0.1
10924	28	45.6	30	0.1
10924	75	7.75	6	0
10925	36	19	25	0.15
10925	52	7	12	0.15
10926	11	21	2	0
10926	13	6	10	0
10926	19	9.2	7	0
10926	72	34.8	10	0
10927	20	81	5	0
10927	52	7	5	0
10927	76	18	20	0
10928	47	9.5	5	0
10928	76	18	5	0
10929	21	10	60	0
10929	75	7.75	49	0
10929	77	13	15	0
10930	21	10	36	0
10930	27	43.9	25	0
10930	55	24	25	0.2
10930	58	13.25	30	0.2
10931	13	6	42	0.15
10931	57	19.5	30	0
10932	16	17.45	30	0.1
10932	62	49.3	14	0.1
10932	72	34.8	16	0
10932	75	7.75	20	0.1
10933	53	32.8	2	0
10933	61	28.5	30	0
10934	6	25	20	0
10935	1	18	21	0
10935	18	62.5	4	0.25
10935	23	9	8	0.25
10936	36	19	30	0.2
10937	28	45.6	8	0
10937	34	14	20	0
10938	13	6	20	0.25
10938	43	46	24	0.25
10938	60	34	49	0.25
10938	71	21.5	35	0.25
10939	2	19	10	0.15
10939	67	14	40	0.15
10940	7	30	8	0
10940	13	6	20	0
10941	31	12.5	44	0.25
10941	62	49.3	30	0.25
10941	68	12.5	80	0.25
10941	72	34.8	50	0
10942	49	20	28	0
10943	13	6	15	0
10943	22	21	21	0
10943	46	12	15	0
10944	11	21	5	0.25
10944	44	19.45	18	0.25
10944	56	38	18	0
10945	13	6	20	0
10945	31	12.5	10	0
10946	10	31	25	0
10946	24	4.5	25	0
10946	77	13	40	0
10947	59	55	4	0
10948	50	16.25	9	0
10948	51	53	40	0
10948	55	24	4	0
10949	6	25	12	0
10949	10	31	30	0
10949	17	39	6	0
10949	62	49.3	60	0
10950	4	22	5	0
10951	33	2.5	15	0.05
10951	41	9.65	6	0.05
10951	75	7.75	50	0.05
10952	6	25	16	0.05
10952	28	45.6	2	0
10953	20	81	50	0.05
10953	31	12.5	50	0.05
10954	16	17.45	28	0.15
10954	31	12.5	25	0.15
10954	45	9.5	30	0
10954	60	34	24	0.15
10955	75	7.75	12	0.2
10956	21	10	12	0
10956	47	9.5	14	0
10956	51	53	8	0
10957	30	25.89	30	0
10957	35	18	40	0
10957	64	33.25	8	0
10958	5	21.35	20	0
10958	7	30	6	0
10958	72	34.8	5	0
10959	75	7.75	20	0.15
10960	24	4.5	10	0.25
10960	41	9.65	24	0
10961	52	7	6	0.05
10961	76	18	60	0
10962	7	30	45	0
10962	13	6	77	0
10962	53	32.8	20	0
10962	69	36	9	0
10962	76	18	44	0
10963	60	34	2	0.15
10964	18	62.5	6	0
10964	38	263.5	5	0
10964	69	36	10	0
10965	51	53	16	0
10966	37	26	8	0
10966	56	38	12	0.15
10966	62	49.3	12	0.15
10967	19	9.2	12	0
10967	49	20	40	0
10968	12	38	30	0
10968	24	4.5	30	0
10968	64	33.25	4	0
10969	46	12	9	0
10970	52	7	40	0.2
10971	29	123.79	14	0
10972	17	39	6	0
10972	33	2.5	7	0
10973	26	31.23	5	0
10973	41	9.65	6	0
10973	75	7.75	10	0
10974	63	43.9	10	0
10975	8	40	16	0
10975	75	7.75	10	0
10976	28	45.6	20	0
10977	39	18	30	0
10977	47	9.5	30	0
10977	51	53	10	0
10977	63	43.9	20	0
10978	8	40	20	0.15
10978	21	10	40	0.15
10978	40	18.4	10	0
10978	44	19.45	6	0.15
10979	7	30	18	0
10979	12	38	20	0
10979	24	4.5	80	0
10979	27	43.9	30	0
10979	31	12.5	24	0
10979	63	43.9	35	0
10980	75	7.75	40	0.2
10981	38	263.5	60	0
10982	7	30	20	0
10982	43	46	9	0
10983	13	6	84	0.15
10983	57	19.5	15	0
10984	16	17.45	55	0
10984	24	4.5	20	0
10984	36	19	40	0
10985	16	17.45	36	0.1
10985	18	62.5	8	0.1
10985	32	32	35	0.1
10986	11	21	30	0
10986	20	81	15	0
10986	76	18	10	0
10986	77	13	15	0
10987	7	30	60	0
10987	43	46	6	0
10987	72	34.8	20	0
10988	7	30	60	0
10988	62	49.3	40	0.1
10989	6	25	40	0
10989	11	21	15	0
10989	41	9.65	4	0
10990	21	10	65	0
10990	34	14	60	0.15
10990	55	24	65	0.15
10990	61	28.5	66	0.15
10991	2	19	50	0.2
10991	70	15	20	0.2
10991	76	18	90	0.2
10992	72	34.8	2	0
10993	29	123.79	50	0.25
10993	41	9.65	35	0.25
10994	59	55	18	0.05
10995	51	53	20	0
10995	60	34	4	0
10996	42	14	40	0
10997	32	32	50	0
10997	46	12	20	0.25
10997	52	7	20	0.25
10998	24	4.5	12	0
10998	61	28.5	7	0
10998	74	10	20	0
10998	75	7.75	30	0
10999	41	9.65	20	0.05
10999	51	53	15	0.05
10999	77	13	21	0.05
11000	4	22	25	0.25
11000	24	4.5	30	0.25
11000	77	13	30	0
11001	7	30	60	0
11001	22	21	25	0
11001	46	12	25	0
11001	55	24	6	0
11002	13	6	56	0
11002	35	18	15	0.15
11002	42	14	24	0.15
11002	55	24	40	0
11003	1	18	4	0
11003	40	18.4	10	0
11003	52	7	10	0
11004	26	31.23	6	0
11004	76	18	6	0
11005	1	18	2	0
11005	59	55	10	0
11006	1	18	8	0
11006	29	123.79	2	0.25
11007	8	40	30	0
11007	29	123.79	10	0
11007	42	14	14	0
11008	28	45.6	70	0.05
11008	34	14	90	0.05
11008	71	21.5	21	0
11009	24	4.5	12	0
11009	36	19	18	0.25
11009	60	34	9	0
11010	7	30	20	0
11010	24	4.5	10	0
11011	58	13.25	40	0.05
11011	71	21.5	20	0
11012	19	9.2	50	0.05
11012	60	34	36	0.05
11012	71	21.5	60	0.05
11013	23	9	10	0
11013	42	14	4	0
11013	45	9.5	20	0
11013	68	12.5	2	0
11014	41	9.65	28	0.1
11015	30	25.89	15	0
11015	77	13	18	0
11016	31	12.5	15	0
11016	36	19	16	0
11017	3	10	25	0
11017	59	55	110	0
11017	70	15	30	0
11018	12	38	20	0
11018	18	62.5	10	0
11018	56	38	5	0
11019	46	12	3	0
11019	49	20	2	0
11020	10	31	24	0.15
11021	2	19	11	0.25
11021	20	81	15	0
11021	26	31.23	63	0
11021	51	53	44	0.25
11021	72	34.8	35	0
11022	19	9.2	35	0
11022	69	36	30	0
11023	7	30	4	0
11023	43	46	30	0
11024	26	31.23	12	0
11024	33	2.5	30	0
11024	65	21.05	21	0
11024	71	21.5	50	0
11025	1	18	10	0.1
11025	13	6	20	0.1
11026	18	62.5	8	0
11026	51	53	10	0
11027	24	4.5	30	0.25
11027	62	49.3	21	0.25
11028	55	24	35	0
11028	59	55	24	0
11029	56	38	20	0
11029	63	43.9	12	0
11030	2	19	100	0.25
11030	5	21.35	70	0
11030	29	123.79	60	0.25
11030	59	55	100	0.25
11031	1	18	45	0
11031	13	6	80	0
11031	24	4.5	21	0
11031	64	33.25	20	0
11031	71	21.5	16	0
11032	36	19	35	0
11032	38	263.5	25	0
11032	59	55	30	0
11033	53	32.8	70	0.1
11033	69	36	36	0.1
11034	21	10	15	0.1
11034	44	19.45	12	0
11034	61	28.5	6	0
11035	1	18	10	0
11035	35	18	60	0
11035	42	14	30	0
11035	54	7.45	10	0
11036	13	6	7	0
11036	59	55	30	0
11037	70	15	4	0
11038	40	18.4	5	0.2
11038	52	7	2	0
11038	71	21.5	30	0
11039	28	45.6	20	0
11039	35	18	24	0
11039	49	20	60	0
11039	57	19.5	28	0
11040	21	10	20	0
11041	2	19	30	0.2
11041	63	43.9	30	0
11042	44	19.45	15	0
11042	61	28.5	4	0
11043	11	21	10	0
11044	62	49.3	12	0
11045	33	2.5	15	0
11045	51	53	24	0
11046	12	38	20	0.05
11046	32	32	15	0.05
11046	35	18	18	0.05
11047	1	18	25	0.25
11047	5	21.35	30	0.25
11048	68	12.5	42	0
11049	2	19	10	0.2
11049	12	38	4	0.2
11050	76	18	50	0.1
11051	24	4.5	10	0.2
11052	43	46	30	0.2
11052	61	28.5	10	0.2
11053	18	62.5	35	0.2
11053	32	32	20	0
11053	64	33.25	25	0.2
11054	33	2.5	10	0
11054	67	14	20	0
11055	24	4.5	15	0
11055	25	14	15	0
11055	51	53	20	0
11055	57	19.5	20	0
11056	7	30	40	0
11056	55	24	35	0
11056	60	34	50	0
11057	70	15	3	0
11058	21	10	3	0
11058	60	34	21	0
11058	61	28.5	4	0
11059	13	6	30	0
11059	17	39	12	0
11059	60	34	35	0
11060	60	34	4	0
11060	77	13	10	0
11061	60	34	15	0
11062	53	32.8	10	0.2
11062	70	15	12	0.2
11063	34	14	30	0
11063	40	18.4	40	0.1
11063	41	9.65	30	0.1
11064	17	39	77	0.1
11064	41	9.65	12	0
11064	53	32.8	25	0.1
11064	55	24	4	0.1
11064	68	12.5	55	0
11065	30	25.89	4	0.25
11065	54	7.45	20	0.25
11066	16	17.45	3	0
11066	19	9.2	42	0
11066	34	14	35	0
11067	41	9.65	9	0
11068	28	45.6	8	0.15
11068	43	46	36	0.15
11068	77	13	28	0.15
11069	39	18	20	0
11070	1	18	40	0.15
11070	2	19	20	0.15
11070	16	17.45	30	0.15
11070	31	12.5	20	0
11071	7	30	15	0.05
11071	13	6	10	0.05
11072	2	19	8	0
11072	41	9.65	40	0
11072	50	16.25	22	0
11072	64	33.25	130	0
11073	11	21	10	0
11073	24	4.5	20	0
11074	16	17.45	14	0.05
11075	2	19	10	0.15
11075	46	12	30	0.15
11075	76	18	2	0.15
11076	6	25	20	0.25
11076	14	23.25	20	0.25
11076	19	9.2	10	0.25
11077	2	19	24	0.2
11077	3	10	4	0
11077	4	22	1	0
11077	6	25	1	0.02
11077	7	30	1	0.05
11077	8	40	2	0.1
11077	10	31	1	0
11077	12	38	2	0.05
11077	13	6	4	0
11077	14	23.25	1	0.03
11077	16	17.45	2	0.03
11077	20	81	1	0.04
11077	23	9	2	0
11077	32	32	1	0
11077	39	18	2	0.05
11077	41	9.65	3	0
11077	46	12	3	0.02
11077	52	7	2	0
11077	55	24	2	0
11077	60	34	2	0.06
11077	64	33.25	2	0.03
11077	66	17	1	0
11077	73	15	2	0.01
11077	75	7.75	4	0
11077	77	13	2	0
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, customer_id, employee_id, order_date, required_date, shipped_date, ship_via, freight, ship_name, ship_address, ship_city, ship_region, ship_postal_code, ship_country) FROM stdin;
10248	VINET	5	1996-07-04	1996-08-01	1996-07-16	3	32.38	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	\N	51100	France
10249	TOMSP	6	1996-07-05	1996-08-16	1996-07-10	1	11.61	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Germany
10250	HANAR	4	1996-07-08	1996-08-05	1996-07-12	2	65.83	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10251	VICTE	3	1996-07-08	1996-08-05	1996-07-15	1	41.34	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10252	SUPRD	4	1996-07-09	1996-08-06	1996-07-11	2	51.3	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10253	HANAR	3	1996-07-10	1996-07-24	1996-07-16	2	58.17	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10254	CHOPS	5	1996-07-11	1996-08-08	1996-07-23	2	22.98	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Switzerland
10255	RICSU	9	1996-07-12	1996-08-09	1996-07-15	3	148.33	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
10256	WELLI	3	1996-07-15	1996-08-12	1996-07-17	2	13.97	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10257	HILAA	4	1996-07-16	1996-08-13	1996-07-22	3	81.91	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10258	ERNSH	1	1996-07-17	1996-08-14	1996-07-23	1	140.51	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10259	CENTC	4	1996-07-18	1996-08-15	1996-07-25	3	3.25	Centro comercial Moctezuma	Sierras de Granada 9993	México D.F.	\N	05022	Mexico
10260	OTTIK	4	1996-07-19	1996-08-16	1996-07-29	1	55.09	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
10261	QUEDE	4	1996-07-19	1996-08-16	1996-07-30	2	3.05	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10262	RATTC	8	1996-07-22	1996-08-19	1996-07-25	3	48.29	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10263	ERNSH	9	1996-07-23	1996-08-20	1996-07-31	3	146.06	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10264	FOLKO	6	1996-07-24	1996-08-21	1996-08-23	3	3.67	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10265	BLONP	2	1996-07-25	1996-08-22	1996-08-12	1	55.28	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10266	WARTH	3	1996-07-26	1996-09-06	1996-07-31	3	25.73	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10267	FRANK	4	1996-07-29	1996-08-26	1996-08-06	1	208.58	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10268	GROSR	8	1996-07-30	1996-08-27	1996-08-02	3	66.29	GROSELLA-Restaurante	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela
10269	WHITC	5	1996-07-31	1996-08-14	1996-08-09	1	4.56	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10270	WARTH	1	1996-08-01	1996-08-29	1996-08-02	1	136.54	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10271	SPLIR	6	1996-08-01	1996-08-29	1996-08-30	2	4.54	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10272	RATTC	6	1996-08-02	1996-08-30	1996-08-06	2	98.03	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10273	QUICK	3	1996-08-05	1996-09-02	1996-08-12	3	76.07	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10274	VINET	6	1996-08-06	1996-09-03	1996-08-16	1	6.01	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	\N	51100	France
10275	MAGAA	1	1996-08-07	1996-09-04	1996-08-09	1	26.93	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10276	TORTU	8	1996-08-08	1996-08-22	1996-08-14	3	13.84	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10277	MORGK	2	1996-08-09	1996-09-06	1996-08-13	3	125.77	Morgenstern Gesundkost	Heerstr. 22	Leipzig	\N	04179	Germany
10278	BERGS	8	1996-08-12	1996-09-09	1996-08-16	2	92.69	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10279	LEHMS	8	1996-08-13	1996-09-10	1996-08-16	2	25.83	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	\N	60528	Germany
10280	BERGS	2	1996-08-14	1996-09-11	1996-09-12	1	8.98	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10281	ROMEY	4	1996-08-14	1996-08-28	1996-08-21	1	2.94	Romero y tomillo	Gran Vía, 1	Madrid	\N	28001	Spain
10282	ROMEY	4	1996-08-15	1996-09-12	1996-08-21	1	12.69	Romero y tomillo	Gran Vía, 1	Madrid	\N	28001	Spain
10283	LILAS	3	1996-08-16	1996-09-13	1996-08-23	3	84.81	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10284	LEHMS	4	1996-08-19	1996-09-16	1996-08-27	1	76.56	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	\N	60528	Germany
10285	QUICK	1	1996-08-20	1996-09-17	1996-08-26	2	76.83	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10286	QUICK	8	1996-08-21	1996-09-18	1996-08-30	3	229.24	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10287	RICAR	8	1996-08-22	1996-09-19	1996-08-28	3	12.76	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10288	REGGC	4	1996-08-23	1996-09-20	1996-09-03	1	7.45	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10289	BSBEV	7	1996-08-26	1996-09-23	1996-08-28	3	22.77	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10290	COMMI	8	1996-08-27	1996-09-24	1996-09-03	1	79.7	Comércio Mineiro	Av. dos Lusíadas, 23	Sao Paulo	SP	05432-043	Brazil
10291	QUEDE	6	1996-08-27	1996-09-24	1996-09-04	2	6.4	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10292	TRADH	1	1996-08-28	1996-09-25	1996-09-02	2	1.35	Tradiçao Hipermercados	Av. Inês de Castro, 414	Sao Paulo	SP	05634-030	Brazil
10293	TORTU	1	1996-08-29	1996-09-26	1996-09-11	3	21.18	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10294	RATTC	4	1996-08-30	1996-09-27	1996-09-05	2	147.26	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10295	VINET	2	1996-09-02	1996-09-30	1996-09-10	2	1.15	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	\N	51100	France
10296	LILAS	6	1996-09-03	1996-10-01	1996-09-11	1	0.12	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10297	BLONP	5	1996-09-04	1996-10-16	1996-09-10	2	5.74	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10298	HUNGO	6	1996-09-05	1996-10-03	1996-09-11	2	168.22	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10299	RICAR	4	1996-09-06	1996-10-04	1996-09-13	2	29.76	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10300	MAGAA	2	1996-09-09	1996-10-07	1996-09-18	2	17.68	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10301	WANDK	8	1996-09-09	1996-10-07	1996-09-17	2	45.08	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10302	SUPRD	4	1996-09-10	1996-10-08	1996-10-09	2	6.27	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10303	GODOS	7	1996-09-11	1996-10-09	1996-09-18	2	107.83	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
10304	TORTU	1	1996-09-12	1996-10-10	1996-09-17	2	63.79	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10305	OLDWO	8	1996-09-13	1996-10-11	1996-10-09	3	257.62	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10306	ROMEY	1	1996-09-16	1996-10-14	1996-09-23	3	7.56	Romero y tomillo	Gran Vía, 1	Madrid	\N	28001	Spain
10307	LONEP	2	1996-09-17	1996-10-15	1996-09-25	2	0.56	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10308	ANATR	7	1996-09-18	1996-10-16	1996-09-24	3	1.61	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	\N	05021	Mexico
10309	HUNGO	3	1996-09-19	1996-10-17	1996-10-23	1	47.3	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10310	THEBI	8	1996-09-20	1996-10-18	1996-09-27	2	17.52	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
10311	DUMON	1	1996-09-20	1996-10-04	1996-09-26	3	24.69	Du monde entier	67, rue des Cinquante Otages	Nantes	\N	44000	France
10312	WANDK	2	1996-09-23	1996-10-21	1996-10-03	2	40.26	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10313	QUICK	2	1996-09-24	1996-10-22	1996-10-04	2	1.96	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10314	RATTC	1	1996-09-25	1996-10-23	1996-10-04	2	74.16	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10315	ISLAT	4	1996-09-26	1996-10-24	1996-10-03	2	41.76	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10316	RATTC	1	1996-09-27	1996-10-25	1996-10-08	3	150.15	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10317	LONEP	6	1996-09-30	1996-10-28	1996-10-10	1	12.69	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10318	ISLAT	8	1996-10-01	1996-10-29	1996-10-04	2	4.73	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10319	TORTU	7	1996-10-02	1996-10-30	1996-10-11	3	64.5	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10320	WARTH	5	1996-10-03	1996-10-17	1996-10-18	3	34.57	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10321	ISLAT	3	1996-10-03	1996-10-31	1996-10-11	2	3.43	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10322	PERIC	7	1996-10-04	1996-11-01	1996-10-23	3	0.4	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexico
10323	KOENE	4	1996-10-07	1996-11-04	1996-10-14	1	4.88	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10324	SAVEA	9	1996-10-08	1996-11-05	1996-10-10	1	214.27	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10325	KOENE	1	1996-10-09	1996-10-23	1996-10-14	3	64.86	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10326	BOLID	4	1996-10-10	1996-11-07	1996-10-14	2	77.92	Bólido Comidas preparadas	C/ Araquil, 67	Madrid	\N	28023	Spain
10327	FOLKO	2	1996-10-11	1996-11-08	1996-10-14	1	63.36	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10328	FURIB	4	1996-10-14	1996-11-11	1996-10-17	3	87.03	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10329	SPLIR	4	1996-10-15	1996-11-26	1996-10-23	2	191.67	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10330	LILAS	3	1996-10-16	1996-11-13	1996-10-28	1	12.75	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10331	BONAP	9	1996-10-16	1996-11-27	1996-10-21	1	10.19	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10332	MEREP	3	1996-10-17	1996-11-28	1996-10-21	2	52.84	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10333	WARTH	5	1996-10-18	1996-11-15	1996-10-25	3	0.59	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10334	VICTE	8	1996-10-21	1996-11-18	1996-10-28	2	8.56	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10335	HUNGO	7	1996-10-22	1996-11-19	1996-10-24	2	42.11	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10336	PRINI	7	1996-10-23	1996-11-20	1996-10-25	2	15.51	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal
10337	FRANK	4	1996-10-24	1996-11-21	1996-10-29	3	108.26	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10338	OLDWO	4	1996-10-25	1996-11-22	1996-10-29	3	84.21	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10339	MEREP	2	1996-10-28	1996-11-25	1996-11-04	2	15.66	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10340	BONAP	1	1996-10-29	1996-11-26	1996-11-08	3	166.31	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10341	SIMOB	7	1996-10-29	1996-11-26	1996-11-05	3	26.78	Simons bistro	Vinbæltet 34	Kobenhavn	\N	1734	Denmark
10342	FRANK	4	1996-10-30	1996-11-13	1996-11-04	2	54.83	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10343	LEHMS	4	1996-10-31	1996-11-28	1996-11-06	1	110.37	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	\N	60528	Germany
10344	WHITC	4	1996-11-01	1996-11-29	1996-11-05	2	23.29	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10345	QUICK	2	1996-11-04	1996-12-02	1996-11-11	2	249.06	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10346	RATTC	3	1996-11-05	1996-12-17	1996-11-08	3	142.08	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10347	FAMIA	4	1996-11-06	1996-12-04	1996-11-08	3	3.1	Familia Arquibaldo	Rua Orós, 92	Sao Paulo	SP	05442-030	Brazil
10348	WANDK	4	1996-11-07	1996-12-05	1996-11-15	2	0.78	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10349	SPLIR	7	1996-11-08	1996-12-06	1996-11-15	1	8.63	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10350	LAMAI	6	1996-11-11	1996-12-09	1996-12-03	2	64.19	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10351	ERNSH	1	1996-11-11	1996-12-09	1996-11-20	1	162.33	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10352	FURIB	3	1996-11-12	1996-11-26	1996-11-18	3	1.3	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10353	PICCO	7	1996-11-13	1996-12-11	1996-11-25	3	360.63	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10354	PERIC	8	1996-11-14	1996-12-12	1996-11-20	3	53.8	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexico
10355	AROUT	6	1996-11-15	1996-12-13	1996-11-20	1	41.95	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10356	WANDK	6	1996-11-18	1996-12-16	1996-11-27	2	36.71	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10357	LILAS	1	1996-11-19	1996-12-17	1996-12-02	3	34.88	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10358	LAMAI	5	1996-11-20	1996-12-18	1996-11-27	1	19.64	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10359	SEVES	5	1996-11-21	1996-12-19	1996-11-26	3	288.43	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10360	BLONP	4	1996-11-22	1996-12-20	1996-12-02	3	131.7	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10361	QUICK	1	1996-11-22	1996-12-20	1996-12-03	2	183.17	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10362	BONAP	3	1996-11-25	1996-12-23	1996-11-28	1	96.04	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10363	DRACD	4	1996-11-26	1996-12-24	1996-12-04	3	30.54	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Germany
10364	EASTC	1	1996-11-26	1997-01-07	1996-12-04	1	71.97	Eastern Connection	35 King George	London	\N	WX3 6FW	UK
10365	ANTON	3	1996-11-27	1996-12-25	1996-12-02	2	22	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexico
10366	GALED	8	1996-11-28	1997-01-09	1996-12-30	2	10.14	Galería del gastronómo	Rambla de Cataluña, 23	Barcelona	\N	8022	Spain
10367	VAFFE	7	1996-11-28	1996-12-26	1996-12-02	3	13.55	Vaffeljernet	Smagsloget 45	Århus	\N	8200	Denmark
10368	ERNSH	2	1996-11-29	1996-12-27	1996-12-02	2	101.95	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10369	SPLIR	8	1996-12-02	1996-12-30	1996-12-09	2	195.68	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10370	CHOPS	6	1996-12-03	1996-12-31	1996-12-27	2	1.17	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Switzerland
10371	LAMAI	1	1996-12-03	1996-12-31	1996-12-24	1	0.45	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10372	QUEEN	5	1996-12-04	1997-01-01	1996-12-09	2	890.78	Queen Cozinha	Alameda dos Canàrios, 891	Sao Paulo	SP	05487-020	Brazil
10373	HUNGO	4	1996-12-05	1997-01-02	1996-12-11	3	124.12	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10374	WOLZA	1	1996-12-05	1997-01-02	1996-12-09	3	3.94	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Poland
10375	HUNGC	3	1996-12-06	1997-01-03	1996-12-09	2	20.12	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
10376	MEREP	1	1996-12-09	1997-01-06	1996-12-13	2	20.39	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10377	SEVES	1	1996-12-09	1997-01-06	1996-12-13	3	22.21	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10378	FOLKO	5	1996-12-10	1997-01-07	1996-12-19	3	5.44	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10379	QUEDE	2	1996-12-11	1997-01-08	1996-12-13	1	45.03	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10380	HUNGO	8	1996-12-12	1997-01-09	1997-01-16	3	35.03	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10381	LILAS	3	1996-12-12	1997-01-09	1996-12-13	3	7.99	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10382	ERNSH	4	1996-12-13	1997-01-10	1996-12-16	1	94.77	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10383	AROUT	8	1996-12-16	1997-01-13	1996-12-18	3	34.24	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10384	BERGS	3	1996-12-16	1997-01-13	1996-12-20	3	168.64	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10385	SPLIR	1	1996-12-17	1997-01-14	1996-12-23	2	30.96	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10386	FAMIA	9	1996-12-18	1997-01-01	1996-12-25	3	13.99	Familia Arquibaldo	Rua Orós, 92	Sao Paulo	SP	05442-030	Brazil
10387	SANTG	1	1996-12-18	1997-01-15	1996-12-20	2	93.63	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norway
10388	SEVES	2	1996-12-19	1997-01-16	1996-12-20	1	34.86	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10389	BOTTM	4	1996-12-20	1997-01-17	1996-12-24	2	47.42	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10390	ERNSH	6	1996-12-23	1997-01-20	1996-12-26	1	126.38	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10391	DRACD	3	1996-12-23	1997-01-20	1996-12-31	3	5.45	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Germany
10392	PICCO	2	1996-12-24	1997-01-21	1997-01-01	3	122.46	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10393	SAVEA	1	1996-12-25	1997-01-22	1997-01-03	3	126.56	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10394	HUNGC	1	1996-12-25	1997-01-22	1997-01-03	3	30.34	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
10395	HILAA	6	1996-12-26	1997-01-23	1997-01-03	1	184.41	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10396	FRANK	1	1996-12-27	1997-01-10	1997-01-06	3	135.35	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10397	PRINI	5	1996-12-27	1997-01-24	1997-01-02	1	60.26	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal
10398	SAVEA	2	1996-12-30	1997-01-27	1997-01-09	3	89.16	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10399	VAFFE	8	1996-12-31	1997-01-14	1997-01-08	3	27.36	Vaffeljernet	Smagsloget 45	Århus	\N	8200	Denmark
10400	EASTC	1	1997-01-01	1997-01-29	1997-01-16	3	83.93	Eastern Connection	35 King George	London	\N	WX3 6FW	UK
10401	RATTC	1	1997-01-01	1997-01-29	1997-01-10	1	12.51	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10402	ERNSH	8	1997-01-02	1997-02-13	1997-01-10	2	67.88	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10403	ERNSH	4	1997-01-03	1997-01-31	1997-01-09	3	73.79	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10404	MAGAA	2	1997-01-03	1997-01-31	1997-01-08	1	155.97	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10405	LINOD	1	1997-01-06	1997-02-03	1997-01-22	1	34.82	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10406	QUEEN	7	1997-01-07	1997-02-18	1997-01-13	1	108.04	Queen Cozinha	Alameda dos Canàrios, 891	Sao Paulo	SP	05487-020	Brazil
10407	OTTIK	2	1997-01-07	1997-02-04	1997-01-30	2	91.48	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
10408	FOLIG	8	1997-01-08	1997-02-05	1997-01-14	1	11.26	Folies gourmandes	184, chaussée de Tournai	Lille	\N	59000	France
10409	OCEAN	3	1997-01-09	1997-02-06	1997-01-14	1	29.83	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	\N	1010	Argentina
10410	BOTTM	3	1997-01-10	1997-02-07	1997-01-15	3	2.4	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10411	BOTTM	9	1997-01-10	1997-02-07	1997-01-21	3	23.65	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10412	WARTH	8	1997-01-13	1997-02-10	1997-01-15	2	3.77	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10413	LAMAI	3	1997-01-14	1997-02-11	1997-01-16	2	95.66	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10414	FAMIA	2	1997-01-14	1997-02-11	1997-01-17	3	21.48	Familia Arquibaldo	Rua Orós, 92	Sao Paulo	SP	05442-030	Brazil
10415	HUNGC	3	1997-01-15	1997-02-12	1997-01-24	1	0.2	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
10416	WARTH	8	1997-01-16	1997-02-13	1997-01-27	3	22.72	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10417	SIMOB	4	1997-01-16	1997-02-13	1997-01-28	3	70.29	Simons bistro	Vinbæltet 34	Kobenhavn	\N	1734	Denmark
10418	QUICK	4	1997-01-17	1997-02-14	1997-01-24	1	17.55	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10419	RICSU	4	1997-01-20	1997-02-17	1997-01-30	2	137.35	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
10420	WELLI	3	1997-01-21	1997-02-18	1997-01-27	1	44.12	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10421	QUEDE	8	1997-01-21	1997-03-04	1997-01-27	1	99.23	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10422	FRANS	2	1997-01-22	1997-02-19	1997-01-31	1	3.02	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italy
10423	GOURL	6	1997-01-23	1997-02-06	1997-02-24	3	24.5	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
10424	MEREP	7	1997-01-23	1997-02-20	1997-01-27	2	370.61	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10425	LAMAI	6	1997-01-24	1997-02-21	1997-02-14	2	7.93	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10426	GALED	4	1997-01-27	1997-02-24	1997-02-06	1	18.69	Galería del gastronómo	Rambla de Cataluña, 23	Barcelona	\N	8022	Spain
10427	PICCO	4	1997-01-27	1997-02-24	1997-03-03	2	31.29	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10428	REGGC	7	1997-01-28	1997-02-25	1997-02-04	1	11.09	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10429	HUNGO	3	1997-01-29	1997-03-12	1997-02-07	2	56.63	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10430	ERNSH	4	1997-01-30	1997-02-13	1997-02-03	1	458.78	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10431	BOTTM	4	1997-01-30	1997-02-13	1997-02-07	2	44.17	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10432	SPLIR	3	1997-01-31	1997-02-14	1997-02-07	2	4.34	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10433	PRINI	3	1997-02-03	1997-03-03	1997-03-04	3	73.83	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal
10434	FOLKO	3	1997-02-03	1997-03-03	1997-02-13	2	17.92	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10435	CONSH	8	1997-02-04	1997-03-18	1997-02-07	2	9.21	Consolidated Holdings	Berkeley Gardens 12  Brewery	London	\N	WX1 6LT	UK
10436	BLONP	3	1997-02-05	1997-03-05	1997-02-11	2	156.66	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10437	WARTH	8	1997-02-05	1997-03-05	1997-02-12	1	19.97	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10438	TOMSP	3	1997-02-06	1997-03-06	1997-02-14	2	8.24	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Germany
10439	MEREP	6	1997-02-07	1997-03-07	1997-02-10	3	4.07	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10440	SAVEA	4	1997-02-10	1997-03-10	1997-02-28	2	86.53	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10441	OLDWO	3	1997-02-10	1997-03-24	1997-03-14	2	73.02	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10442	ERNSH	3	1997-02-11	1997-03-11	1997-02-18	2	47.94	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10443	REGGC	8	1997-02-12	1997-03-12	1997-02-14	1	13.95	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10444	BERGS	3	1997-02-12	1997-03-12	1997-02-21	3	3.5	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10445	BERGS	3	1997-02-13	1997-03-13	1997-02-20	1	9.3	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10446	TOMSP	6	1997-02-14	1997-03-14	1997-02-19	1	14.68	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Germany
10447	RICAR	4	1997-02-14	1997-03-14	1997-03-07	2	68.66	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10448	RANCH	4	1997-02-17	1997-03-17	1997-02-24	2	38.82	Rancho grande	Av. del Libertador 900	Buenos Aires	\N	1010	Argentina
10449	BLONP	3	1997-02-18	1997-03-18	1997-02-27	2	53.3	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10450	VICTE	8	1997-02-19	1997-03-19	1997-03-11	2	7.23	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10451	QUICK	4	1997-02-19	1997-03-05	1997-03-12	3	189.09	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10452	SAVEA	8	1997-02-20	1997-03-20	1997-02-26	1	140.26	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10453	AROUT	1	1997-02-21	1997-03-21	1997-02-26	2	25.36	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10454	LAMAI	4	1997-02-21	1997-03-21	1997-02-25	3	2.74	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10455	WARTH	8	1997-02-24	1997-04-07	1997-03-03	2	180.45	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10456	KOENE	8	1997-02-25	1997-04-08	1997-02-28	2	8.12	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10457	KOENE	2	1997-02-25	1997-03-25	1997-03-03	1	11.57	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10458	SUPRD	7	1997-02-26	1997-03-26	1997-03-04	3	147.06	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10459	VICTE	4	1997-02-27	1997-03-27	1997-02-28	2	25.09	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10460	FOLKO	8	1997-02-28	1997-03-28	1997-03-03	1	16.27	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10461	LILAS	1	1997-02-28	1997-03-28	1997-03-05	3	148.61	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10462	CONSH	2	1997-03-03	1997-03-31	1997-03-18	1	6.17	Consolidated Holdings	Berkeley Gardens 12  Brewery	London	\N	WX1 6LT	UK
10463	SUPRD	5	1997-03-04	1997-04-01	1997-03-06	3	14.78	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10464	FURIB	4	1997-03-04	1997-04-01	1997-03-14	2	89	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10465	VAFFE	1	1997-03-05	1997-04-02	1997-03-14	3	145.04	Vaffeljernet	Smagsloget 45	Århus	\N	8200	Denmark
10466	COMMI	4	1997-03-06	1997-04-03	1997-03-13	1	11.93	Comércio Mineiro	Av. dos Lusíadas, 23	Sao Paulo	SP	05432-043	Brazil
10467	MAGAA	8	1997-03-06	1997-04-03	1997-03-11	2	4.93	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10468	KOENE	3	1997-03-07	1997-04-04	1997-03-12	3	44.12	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10469	WHITC	1	1997-03-10	1997-04-07	1997-03-14	1	60.18	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10470	BONAP	4	1997-03-11	1997-04-08	1997-03-14	2	64.56	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10471	BSBEV	2	1997-03-11	1997-04-08	1997-03-18	3	45.59	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10472	SEVES	8	1997-03-12	1997-04-09	1997-03-19	1	4.2	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10473	ISLAT	1	1997-03-13	1997-03-27	1997-03-21	3	16.37	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10474	PERIC	5	1997-03-13	1997-04-10	1997-03-21	2	83.49	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexico
10475	SUPRD	9	1997-03-14	1997-04-11	1997-04-04	1	68.52	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10476	HILAA	8	1997-03-17	1997-04-14	1997-03-24	3	4.41	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10477	PRINI	5	1997-03-17	1997-04-14	1997-03-25	2	13.02	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal
10478	VICTE	2	1997-03-18	1997-04-01	1997-03-26	3	4.81	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10479	RATTC	3	1997-03-19	1997-04-16	1997-03-21	3	708.95	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10480	FOLIG	6	1997-03-20	1997-04-17	1997-03-24	2	1.35	Folies gourmandes	184, chaussée de Tournai	Lille	\N	59000	France
10481	RICAR	8	1997-03-20	1997-04-17	1997-03-25	2	64.33	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10482	LAZYK	1	1997-03-21	1997-04-18	1997-04-10	3	7.48	Lazy K Kountry Store	12 Orchestra Terrace	Walla Walla	WA	99362	USA
10483	WHITC	7	1997-03-24	1997-04-21	1997-04-25	2	15.28	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10484	BSBEV	3	1997-03-24	1997-04-21	1997-04-01	3	6.88	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10485	LINOD	4	1997-03-25	1997-04-08	1997-03-31	2	64.45	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10486	HILAA	1	1997-03-26	1997-04-23	1997-04-02	2	30.53	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10487	QUEEN	2	1997-03-26	1997-04-23	1997-03-28	2	71.07	Queen Cozinha	Alameda dos Canàrios, 891	Sao Paulo	SP	05487-020	Brazil
10488	FRANK	8	1997-03-27	1997-04-24	1997-04-02	2	4.93	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10489	PICCO	6	1997-03-28	1997-04-25	1997-04-09	2	5.29	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10490	HILAA	7	1997-03-31	1997-04-28	1997-04-03	2	210.19	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10491	FURIB	8	1997-03-31	1997-04-28	1997-04-08	3	16.96	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10492	BOTTM	3	1997-04-01	1997-04-29	1997-04-11	1	62.89	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10493	LAMAI	4	1997-04-02	1997-04-30	1997-04-10	3	10.64	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10494	COMMI	4	1997-04-02	1997-04-30	1997-04-09	2	65.99	Comércio Mineiro	Av. dos Lusíadas, 23	Sao Paulo	SP	05432-043	Brazil
10495	LAUGB	3	1997-04-03	1997-05-01	1997-04-11	3	4.65	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
10496	TRADH	7	1997-04-04	1997-05-02	1997-04-07	2	46.77	Tradiçao Hipermercados	Av. Inês de Castro, 414	Sao Paulo	SP	05634-030	Brazil
10497	LEHMS	7	1997-04-04	1997-05-02	1997-04-07	1	36.21	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	\N	60528	Germany
10498	HILAA	8	1997-04-07	1997-05-05	1997-04-11	2	29.75	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10499	LILAS	4	1997-04-08	1997-05-06	1997-04-16	2	102.02	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10500	LAMAI	6	1997-04-09	1997-05-07	1997-04-17	1	42.68	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10501	BLAUS	9	1997-04-09	1997-05-07	1997-04-16	3	8.85	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Germany
10502	PERIC	2	1997-04-10	1997-05-08	1997-04-29	1	69.32	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexico
10503	HUNGO	6	1997-04-11	1997-05-09	1997-04-16	2	16.74	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10504	WHITC	4	1997-04-11	1997-05-09	1997-04-18	3	59.13	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10505	MEREP	3	1997-04-14	1997-05-12	1997-04-21	3	7.13	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10506	KOENE	9	1997-04-15	1997-05-13	1997-05-02	2	21.19	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10507	ANTON	7	1997-04-15	1997-05-13	1997-04-22	1	47.45	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexico
10508	OTTIK	1	1997-04-16	1997-05-14	1997-05-13	2	4.99	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
10509	BLAUS	4	1997-04-17	1997-05-15	1997-04-29	1	0.15	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Germany
10510	SAVEA	6	1997-04-18	1997-05-16	1997-04-28	3	367.63	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10511	BONAP	4	1997-04-18	1997-05-16	1997-04-21	3	350.64	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10512	FAMIA	7	1997-04-21	1997-05-19	1997-04-24	2	3.53	Familia Arquibaldo	Rua Orós, 92	Sao Paulo	SP	05442-030	Brazil
10513	WANDK	7	1997-04-22	1997-06-03	1997-04-28	1	105.65	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10514	ERNSH	3	1997-04-22	1997-05-20	1997-05-16	2	789.95	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10515	QUICK	2	1997-04-23	1997-05-07	1997-05-23	1	204.47	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10516	HUNGO	2	1997-04-24	1997-05-22	1997-05-01	3	62.78	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10517	NORTS	3	1997-04-24	1997-05-22	1997-04-29	3	32.07	North/South	South House 300 Queensbridge	London	\N	SW7 1RZ	UK
10518	TORTU	4	1997-04-25	1997-05-09	1997-05-05	2	218.15	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10519	CHOPS	6	1997-04-28	1997-05-26	1997-05-01	3	91.76	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Switzerland
10520	SANTG	7	1997-04-29	1997-05-27	1997-05-01	1	13.37	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norway
10521	CACTU	8	1997-04-29	1997-05-27	1997-05-02	2	17.22	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentina
10522	LEHMS	4	1997-04-30	1997-05-28	1997-05-06	1	45.33	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	\N	60528	Germany
10523	SEVES	7	1997-05-01	1997-05-29	1997-05-30	2	77.63	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10524	BERGS	1	1997-05-01	1997-05-29	1997-05-07	2	244.79	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10525	BONAP	1	1997-05-02	1997-05-30	1997-05-23	2	11.06	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10526	WARTH	4	1997-05-05	1997-06-02	1997-05-15	2	58.59	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10527	QUICK	7	1997-05-05	1997-06-02	1997-05-07	1	41.9	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10528	GREAL	6	1997-05-06	1997-05-20	1997-05-09	2	3.35	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10529	MAISD	5	1997-05-07	1997-06-04	1997-05-09	2	66.69	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgium
10530	PICCO	3	1997-05-08	1997-06-05	1997-05-12	2	339.22	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10531	OCEAN	7	1997-05-08	1997-06-05	1997-05-19	1	8.12	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	\N	1010	Argentina
10532	EASTC	7	1997-05-09	1997-06-06	1997-05-12	3	74.46	Eastern Connection	35 King George	London	\N	WX3 6FW	UK
10533	FOLKO	8	1997-05-12	1997-06-09	1997-05-22	1	188.04	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10534	LEHMS	8	1997-05-12	1997-06-09	1997-05-14	2	27.94	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	\N	60528	Germany
10535	ANTON	4	1997-05-13	1997-06-10	1997-05-21	1	15.64	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexico
10536	LEHMS	3	1997-05-14	1997-06-11	1997-06-06	2	58.88	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	\N	60528	Germany
10537	RICSU	1	1997-05-14	1997-05-28	1997-05-19	1	78.85	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
10538	BSBEV	9	1997-05-15	1997-06-12	1997-05-16	3	4.87	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10539	BSBEV	6	1997-05-16	1997-06-13	1997-05-23	3	12.36	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10540	QUICK	3	1997-05-19	1997-06-16	1997-06-13	3	1007.64	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10541	HANAR	2	1997-05-19	1997-06-16	1997-05-29	1	68.65	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10542	KOENE	1	1997-05-20	1997-06-17	1997-05-26	3	10.95	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10543	LILAS	8	1997-05-21	1997-06-18	1997-05-23	2	48.17	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10544	LONEP	4	1997-05-21	1997-06-18	1997-05-30	1	24.91	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10545	LAZYK	8	1997-05-22	1997-06-19	1997-06-26	2	11.92	Lazy K Kountry Store	12 Orchestra Terrace	Walla Walla	WA	99362	USA
10546	VICTE	1	1997-05-23	1997-06-20	1997-05-27	3	194.72	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10547	SEVES	3	1997-05-23	1997-06-20	1997-06-02	2	178.43	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10548	TOMSP	3	1997-05-26	1997-06-23	1997-06-02	2	1.43	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Germany
10549	QUICK	5	1997-05-27	1997-06-10	1997-05-30	1	171.24	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10550	GODOS	7	1997-05-28	1997-06-25	1997-06-06	3	4.32	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
10551	FURIB	4	1997-05-28	1997-07-09	1997-06-06	3	72.95	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10552	HILAA	2	1997-05-29	1997-06-26	1997-06-05	1	83.22	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10553	WARTH	2	1997-05-30	1997-06-27	1997-06-03	2	149.49	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10554	OTTIK	4	1997-05-30	1997-06-27	1997-06-05	3	120.97	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
10555	SAVEA	6	1997-06-02	1997-06-30	1997-06-04	3	252.49	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10556	SIMOB	2	1997-06-03	1997-07-15	1997-06-13	1	9.8	Simons bistro	Vinbæltet 34	Kobenhavn	\N	1734	Denmark
10557	LEHMS	9	1997-06-03	1997-06-17	1997-06-06	2	96.72	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	\N	60528	Germany
10558	AROUT	1	1997-06-04	1997-07-02	1997-06-10	2	72.97	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10559	BLONP	6	1997-06-05	1997-07-03	1997-06-13	1	8.05	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10560	FRANK	8	1997-06-06	1997-07-04	1997-06-09	1	36.65	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10561	FOLKO	2	1997-06-06	1997-07-04	1997-06-09	2	242.21	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10562	REGGC	1	1997-06-09	1997-07-07	1997-06-12	1	22.95	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10563	RICAR	2	1997-06-10	1997-07-22	1997-06-24	2	60.43	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10564	RATTC	4	1997-06-10	1997-07-08	1997-06-16	3	13.75	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10565	MEREP	8	1997-06-11	1997-07-09	1997-06-18	2	7.15	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10566	BLONP	9	1997-06-12	1997-07-10	1997-06-18	1	88.4	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10567	HUNGO	1	1997-06-12	1997-07-10	1997-06-17	1	33.97	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10568	GALED	3	1997-06-13	1997-07-11	1997-07-09	3	6.54	Galería del gastronómo	Rambla de Cataluña, 23	Barcelona	\N	8022	Spain
10569	RATTC	5	1997-06-16	1997-07-14	1997-07-11	1	58.98	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10570	MEREP	3	1997-06-17	1997-07-15	1997-06-19	3	188.99	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10571	ERNSH	8	1997-06-17	1997-07-29	1997-07-04	3	26.06	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10572	BERGS	3	1997-06-18	1997-07-16	1997-06-25	2	116.43	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10573	ANTON	7	1997-06-19	1997-07-17	1997-06-20	3	84.84	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexico
10574	TRAIH	4	1997-06-19	1997-07-17	1997-06-30	2	37.6	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
10575	MORGK	5	1997-06-20	1997-07-04	1997-06-30	1	127.34	Morgenstern Gesundkost	Heerstr. 22	Leipzig	\N	04179	Germany
10576	TORTU	3	1997-06-23	1997-07-07	1997-06-30	3	18.56	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10577	TRAIH	9	1997-06-23	1997-08-04	1997-06-30	2	25.41	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
10578	BSBEV	4	1997-06-24	1997-07-22	1997-07-25	3	29.6	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10579	LETSS	1	1997-06-25	1997-07-23	1997-07-04	2	13.73	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
10580	OTTIK	4	1997-06-26	1997-07-24	1997-07-01	3	75.89	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
10581	FAMIA	3	1997-06-26	1997-07-24	1997-07-02	1	3.01	Familia Arquibaldo	Rua Orós, 92	Sao Paulo	SP	05442-030	Brazil
10582	BLAUS	3	1997-06-27	1997-07-25	1997-07-14	2	27.71	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Germany
10583	WARTH	2	1997-06-30	1997-07-28	1997-07-04	2	7.28	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10584	BLONP	4	1997-06-30	1997-07-28	1997-07-04	1	59.14	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10585	WELLI	7	1997-07-01	1997-07-29	1997-07-10	1	13.41	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10586	REGGC	9	1997-07-02	1997-07-30	1997-07-09	1	0.48	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10587	QUEDE	1	1997-07-02	1997-07-30	1997-07-09	1	62.52	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10588	QUICK	2	1997-07-03	1997-07-31	1997-07-10	3	194.67	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10589	GREAL	8	1997-07-04	1997-08-01	1997-07-14	2	4.42	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10590	MEREP	4	1997-07-07	1997-08-04	1997-07-14	3	44.77	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10591	VAFFE	1	1997-07-07	1997-07-21	1997-07-16	1	55.92	Vaffeljernet	Smagsloget 45	Århus	\N	8200	Denmark
10592	LEHMS	3	1997-07-08	1997-08-05	1997-07-16	1	32.1	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	\N	60528	Germany
10593	LEHMS	7	1997-07-09	1997-08-06	1997-08-13	2	174.2	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	\N	60528	Germany
10594	OLDWO	3	1997-07-09	1997-08-06	1997-07-16	2	5.24	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10595	ERNSH	2	1997-07-10	1997-08-07	1997-07-14	1	96.78	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10596	WHITC	8	1997-07-11	1997-08-08	1997-08-12	1	16.34	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10597	PICCO	7	1997-07-11	1997-08-08	1997-07-18	3	35.12	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10598	RATTC	1	1997-07-14	1997-08-11	1997-07-18	3	44.42	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10599	BSBEV	6	1997-07-15	1997-08-26	1997-07-21	3	29.98	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10600	HUNGC	4	1997-07-16	1997-08-13	1997-07-21	1	45.13	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
10601	HILAA	7	1997-07-16	1997-08-27	1997-07-22	1	58.3	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10602	VAFFE	8	1997-07-17	1997-08-14	1997-07-22	2	2.92	Vaffeljernet	Smagsloget 45	Århus	\N	8200	Denmark
10603	SAVEA	8	1997-07-18	1997-08-15	1997-08-08	2	48.77	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10604	FURIB	1	1997-07-18	1997-08-15	1997-07-29	1	7.46	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10605	MEREP	1	1997-07-21	1997-08-18	1997-07-29	2	379.13	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10606	TRADH	4	1997-07-22	1997-08-19	1997-07-31	3	79.4	Tradiçao Hipermercados	Av. Inês de Castro, 414	Sao Paulo	SP	05634-030	Brazil
10607	SAVEA	5	1997-07-22	1997-08-19	1997-07-25	1	200.24	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10608	TOMSP	4	1997-07-23	1997-08-20	1997-08-01	2	27.79	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Germany
10609	DUMON	7	1997-07-24	1997-08-21	1997-07-30	2	1.85	Du monde entier	67, rue des Cinquante Otages	Nantes	\N	44000	France
10610	LAMAI	8	1997-07-25	1997-08-22	1997-08-06	1	26.78	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10611	WOLZA	6	1997-07-25	1997-08-22	1997-08-01	2	80.65	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Poland
10612	SAVEA	1	1997-07-28	1997-08-25	1997-08-01	2	544.08	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10613	HILAA	4	1997-07-29	1997-08-26	1997-08-01	2	8.11	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10614	BLAUS	8	1997-07-29	1997-08-26	1997-08-01	3	1.93	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Germany
10615	WILMK	2	1997-07-30	1997-08-27	1997-08-06	3	0.75	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finland
10616	GREAL	1	1997-07-31	1997-08-28	1997-08-05	2	116.53	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10617	GREAL	4	1997-07-31	1997-08-28	1997-08-04	2	18.53	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10618	MEREP	1	1997-08-01	1997-09-12	1997-08-08	1	154.68	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10619	MEREP	3	1997-08-04	1997-09-01	1997-08-07	3	91.05	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10620	LAUGB	2	1997-08-05	1997-09-02	1997-08-14	3	0.94	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
10621	ISLAT	4	1997-08-05	1997-09-02	1997-08-11	2	23.73	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10622	RICAR	4	1997-08-06	1997-09-03	1997-08-11	3	50.97	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10623	FRANK	8	1997-08-07	1997-09-04	1997-08-12	2	97.18	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10624	THECR	4	1997-08-07	1997-09-04	1997-08-19	2	94.8	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
10625	ANATR	3	1997-08-08	1997-09-05	1997-08-14	1	43.9	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	\N	05021	Mexico
10626	BERGS	1	1997-08-11	1997-09-08	1997-08-20	2	138.69	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10627	SAVEA	8	1997-08-11	1997-09-22	1997-08-21	3	107.46	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10628	BLONP	4	1997-08-12	1997-09-09	1997-08-20	3	30.36	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10629	GODOS	4	1997-08-12	1997-09-09	1997-08-20	3	85.46	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
10630	KOENE	1	1997-08-13	1997-09-10	1997-08-19	2	32.35	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10631	LAMAI	8	1997-08-14	1997-09-11	1997-08-15	1	0.87	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10632	WANDK	8	1997-08-14	1997-09-11	1997-08-19	1	41.38	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10633	ERNSH	7	1997-08-15	1997-09-12	1997-08-18	3	477.9	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10634	FOLIG	4	1997-08-15	1997-09-12	1997-08-21	3	487.38	Folies gourmandes	184, chaussée de Tournai	Lille	\N	59000	France
10635	MAGAA	8	1997-08-18	1997-09-15	1997-08-21	3	47.46	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10636	WARTH	4	1997-08-19	1997-09-16	1997-08-26	1	1.15	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10637	QUEEN	6	1997-08-19	1997-09-16	1997-08-26	1	201.29	Queen Cozinha	Alameda dos Canàrios, 891	Sao Paulo	SP	05487-020	Brazil
10638	LINOD	3	1997-08-20	1997-09-17	1997-09-01	1	158.44	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10639	SANTG	7	1997-08-20	1997-09-17	1997-08-27	3	38.64	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norway
10640	WANDK	4	1997-08-21	1997-09-18	1997-08-28	1	23.55	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10641	HILAA	4	1997-08-22	1997-09-19	1997-08-26	2	179.61	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10642	SIMOB	7	1997-08-22	1997-09-19	1997-09-05	3	41.89	Simons bistro	Vinbæltet 34	Kobenhavn	\N	1734	Denmark
10643	ALFKI	6	1997-08-25	1997-09-22	1997-09-02	1	29.46	Alfreds Futterkiste	Obere Str. 57	Berlin	\N	12209	Germany
10644	WELLI	3	1997-08-25	1997-09-22	1997-09-01	2	0.14	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10645	HANAR	4	1997-08-26	1997-09-23	1997-09-02	1	12.41	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10646	HUNGO	9	1997-08-27	1997-10-08	1997-09-03	3	142.33	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10647	QUEDE	4	1997-08-27	1997-09-10	1997-09-03	2	45.54	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10648	RICAR	5	1997-08-28	1997-10-09	1997-09-09	2	14.25	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10649	MAISD	5	1997-08-28	1997-09-25	1997-08-29	3	6.2	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgium
10650	FAMIA	5	1997-08-29	1997-09-26	1997-09-03	3	176.81	Familia Arquibaldo	Rua Orós, 92	Sao Paulo	SP	05442-030	Brazil
10651	WANDK	8	1997-09-01	1997-09-29	1997-09-11	2	20.6	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10652	GOURL	4	1997-09-01	1997-09-29	1997-09-08	2	7.14	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
10653	FRANK	1	1997-09-02	1997-09-30	1997-09-19	1	93.25	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10654	BERGS	5	1997-09-02	1997-09-30	1997-09-11	1	55.26	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10655	REGGC	1	1997-09-03	1997-10-01	1997-09-11	2	4.41	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10656	GREAL	6	1997-09-04	1997-10-02	1997-09-10	1	57.15	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10657	SAVEA	2	1997-09-04	1997-10-02	1997-09-15	2	352.69	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10658	QUICK	4	1997-09-05	1997-10-03	1997-09-08	1	364.15	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10659	QUEEN	7	1997-09-05	1997-10-03	1997-09-10	2	105.81	Queen Cozinha	Alameda dos Canàrios, 891	Sao Paulo	SP	05487-020	Brazil
10660	HUNGC	8	1997-09-08	1997-10-06	1997-10-15	1	111.29	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
10661	HUNGO	7	1997-09-09	1997-10-07	1997-09-15	3	17.55	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10662	LONEP	3	1997-09-09	1997-10-07	1997-09-18	2	1.28	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10663	BONAP	2	1997-09-10	1997-09-24	1997-10-03	2	113.15	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10664	FURIB	1	1997-09-10	1997-10-08	1997-09-19	3	1.27	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10665	LONEP	1	1997-09-11	1997-10-09	1997-09-17	2	26.31	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10666	RICSU	7	1997-09-12	1997-10-10	1997-09-22	2	232.42	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
10667	ERNSH	7	1997-09-12	1997-10-10	1997-09-19	1	78.09	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10668	WANDK	1	1997-09-15	1997-10-13	1997-09-23	2	47.22	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10669	SIMOB	2	1997-09-15	1997-10-13	1997-09-22	1	24.39	Simons bistro	Vinbæltet 34	Kobenhavn	\N	1734	Denmark
10670	FRANK	4	1997-09-16	1997-10-14	1997-09-18	1	203.48	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10671	FRANR	1	1997-09-17	1997-10-15	1997-09-24	1	30.34	France restauration	54, rue Royale	Nantes	\N	44000	France
10672	BERGS	9	1997-09-17	1997-10-01	1997-09-26	2	95.75	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10673	WILMK	2	1997-09-18	1997-10-16	1997-09-19	1	22.76	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finland
10674	ISLAT	4	1997-09-18	1997-10-16	1997-09-30	2	0.9	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10675	FRANK	5	1997-09-19	1997-10-17	1997-09-23	2	31.85	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10676	TORTU	2	1997-09-22	1997-10-20	1997-09-29	2	2.01	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10677	ANTON	1	1997-09-22	1997-10-20	1997-09-26	3	4.03	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexico
10678	SAVEA	7	1997-09-23	1997-10-21	1997-10-16	3	388.98	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10679	BLONP	8	1997-09-23	1997-10-21	1997-09-30	3	27.94	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10680	OLDWO	1	1997-09-24	1997-10-22	1997-09-26	1	26.61	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10681	GREAL	3	1997-09-25	1997-10-23	1997-09-30	3	76.13	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10682	ANTON	3	1997-09-25	1997-10-23	1997-10-01	2	36.13	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexico
10683	DUMON	2	1997-09-26	1997-10-24	1997-10-01	1	4.4	Du monde entier	67, rue des Cinquante Otages	Nantes	\N	44000	France
10684	OTTIK	3	1997-09-26	1997-10-24	1997-09-30	1	145.63	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
10685	GOURL	4	1997-09-29	1997-10-13	1997-10-03	2	33.75	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
10686	PICCO	2	1997-09-30	1997-10-28	1997-10-08	1	96.5	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10687	HUNGO	9	1997-09-30	1997-10-28	1997-10-30	2	296.43	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10688	VAFFE	4	1997-10-01	1997-10-15	1997-10-07	2	299.09	Vaffeljernet	Smagsloget 45	Århus	\N	8200	Denmark
10689	BERGS	1	1997-10-01	1997-10-29	1997-10-07	2	13.42	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10690	HANAR	1	1997-10-02	1997-10-30	1997-10-03	1	15.8	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10691	QUICK	2	1997-10-03	1997-11-14	1997-10-22	2	810.05	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10692	ALFKI	4	1997-10-03	1997-10-31	1997-10-13	2	61.02	Alfred's Futterkiste	Obere Str. 57	Berlin	\N	12209	Germany
10693	WHITC	3	1997-10-06	1997-10-20	1997-10-10	3	139.34	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10694	QUICK	8	1997-10-06	1997-11-03	1997-10-09	3	398.36	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10695	WILMK	7	1997-10-07	1997-11-18	1997-10-14	1	16.72	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finland
10696	WHITC	8	1997-10-08	1997-11-19	1997-10-14	3	102.55	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10697	LINOD	3	1997-10-08	1997-11-05	1997-10-14	1	45.52	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10698	ERNSH	4	1997-10-09	1997-11-06	1997-10-17	1	272.47	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10699	MORGK	3	1997-10-09	1997-11-06	1997-10-13	3	0.58	Morgenstern Gesundkost	Heerstr. 22	Leipzig	\N	04179	Germany
10700	SAVEA	3	1997-10-10	1997-11-07	1997-10-16	1	65.1	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10701	HUNGO	6	1997-10-13	1997-10-27	1997-10-15	3	220.31	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10702	ALFKI	4	1997-10-13	1997-11-24	1997-10-21	1	23.94	Alfred's Futterkiste	Obere Str. 57	Berlin	\N	12209	Germany
10703	FOLKO	6	1997-10-14	1997-11-11	1997-10-20	2	152.3	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10704	QUEEN	6	1997-10-14	1997-11-11	1997-11-07	1	4.78	Queen Cozinha	Alameda dos Canàrios, 891	Sao Paulo	SP	05487-020	Brazil
10705	HILAA	9	1997-10-15	1997-11-12	1997-11-18	2	3.52	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10706	OLDWO	8	1997-10-16	1997-11-13	1997-10-21	3	135.63	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10707	AROUT	4	1997-10-16	1997-10-30	1997-10-23	3	21.74	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10708	THEBI	6	1997-10-17	1997-11-28	1997-11-05	2	2.96	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
10709	GOURL	1	1997-10-17	1997-11-14	1997-11-20	3	210.8	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
10710	FRANS	1	1997-10-20	1997-11-17	1997-10-23	1	4.98	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italy
10711	SAVEA	5	1997-10-21	1997-12-02	1997-10-29	2	52.41	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10712	HUNGO	3	1997-10-21	1997-11-18	1997-10-31	1	89.93	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10713	SAVEA	1	1997-10-22	1997-11-19	1997-10-24	1	167.05	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10714	SAVEA	5	1997-10-22	1997-11-19	1997-10-27	3	24.49	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10715	BONAP	3	1997-10-23	1997-11-06	1997-10-29	1	63.2	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10716	RANCH	4	1997-10-24	1997-11-21	1997-10-27	2	22.57	Rancho grande	Av. del Libertador 900	Buenos Aires	\N	1010	Argentina
10717	FRANK	1	1997-10-24	1997-11-21	1997-10-29	2	59.25	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10718	KOENE	1	1997-10-27	1997-11-24	1997-10-29	3	170.88	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10719	LETSS	8	1997-10-27	1997-11-24	1997-11-05	2	51.44	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
10720	QUEDE	8	1997-10-28	1997-11-11	1997-11-05	2	9.53	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10721	QUICK	5	1997-10-29	1997-11-26	1997-10-31	3	48.92	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10722	SAVEA	8	1997-10-29	1997-12-10	1997-11-04	1	74.58	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10723	WHITC	3	1997-10-30	1997-11-27	1997-11-25	1	21.72	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10724	MEREP	8	1997-10-30	1997-12-11	1997-11-05	2	57.75	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10725	FAMIA	4	1997-10-31	1997-11-28	1997-11-05	3	10.83	Familia Arquibaldo	Rua Orós, 92	Sao Paulo	SP	05442-030	Brazil
10726	EASTC	4	1997-11-03	1997-11-17	1997-12-05	1	16.56	Eastern Connection	35 King George	London	\N	WX3 6FW	UK
10727	REGGC	2	1997-11-03	1997-12-01	1997-12-05	1	89.9	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10728	QUEEN	4	1997-11-04	1997-12-02	1997-11-11	2	58.33	Queen Cozinha	Alameda dos Canàrios, 891	Sao Paulo	SP	05487-020	Brazil
10729	LINOD	8	1997-11-04	1997-12-16	1997-11-14	3	141.06	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10730	BONAP	5	1997-11-05	1997-12-03	1997-11-14	1	20.12	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10731	CHOPS	7	1997-11-06	1997-12-04	1997-11-14	1	96.65	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Switzerland
10732	BONAP	3	1997-11-06	1997-12-04	1997-11-07	1	16.97	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10733	BERGS	1	1997-11-07	1997-12-05	1997-11-10	3	110.11	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10734	GOURL	2	1997-11-07	1997-12-05	1997-11-12	3	1.63	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
10735	LETSS	6	1997-11-10	1997-12-08	1997-11-21	2	45.97	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
10736	HUNGO	9	1997-11-11	1997-12-09	1997-11-21	2	44.1	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10737	VINET	2	1997-11-11	1997-12-09	1997-11-18	2	7.79	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	\N	51100	France
10738	SPECD	2	1997-11-12	1997-12-10	1997-11-18	1	2.91	Spécialités du monde	25, rue Lauriston	Paris	\N	75016	France
10739	VINET	3	1997-11-12	1997-12-10	1997-11-17	3	11.08	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	\N	51100	France
10740	WHITC	4	1997-11-13	1997-12-11	1997-11-25	2	81.88	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10741	AROUT	4	1997-11-14	1997-11-28	1997-11-18	3	10.96	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10742	BOTTM	3	1997-11-14	1997-12-12	1997-11-18	3	243.73	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10743	AROUT	1	1997-11-17	1997-12-15	1997-11-21	2	23.72	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10744	VAFFE	6	1997-11-17	1997-12-15	1997-11-24	1	69.19	Vaffeljernet	Smagsloget 45	Århus	\N	8200	Denmark
10745	QUICK	9	1997-11-18	1997-12-16	1997-11-27	1	3.52	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10746	CHOPS	1	1997-11-19	1997-12-17	1997-11-21	3	31.43	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Switzerland
10747	PICCO	6	1997-11-19	1997-12-17	1997-11-26	1	117.33	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10748	SAVEA	3	1997-11-20	1997-12-18	1997-11-28	1	232.55	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10749	ISLAT	4	1997-11-20	1997-12-18	1997-12-19	2	61.53	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10750	WARTH	9	1997-11-21	1997-12-19	1997-11-24	1	79.3	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10751	RICSU	3	1997-11-24	1997-12-22	1997-12-03	3	130.79	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
10752	NORTS	2	1997-11-24	1997-12-22	1997-11-28	3	1.39	North/South	South House 300 Queensbridge	London	\N	SW7 1RZ	UK
10753	FRANS	3	1997-11-25	1997-12-23	1997-11-27	1	7.7	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italy
10754	MAGAA	6	1997-11-25	1997-12-23	1997-11-27	3	2.38	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10755	BONAP	4	1997-11-26	1997-12-24	1997-11-28	2	16.71	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10756	SPLIR	8	1997-11-27	1997-12-25	1997-12-02	2	73.21	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10757	SAVEA	6	1997-11-27	1997-12-25	1997-12-15	1	8.19	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10758	RICSU	3	1997-11-28	1997-12-26	1997-12-04	3	138.17	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
10759	ANATR	3	1997-11-28	1997-12-26	1997-12-12	3	11.99	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	\N	05021	Mexico
10760	MAISD	4	1997-12-01	1997-12-29	1997-12-10	1	155.64	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgium
10761	RATTC	5	1997-12-02	1997-12-30	1997-12-08	2	18.66	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10762	FOLKO	3	1997-12-02	1997-12-30	1997-12-09	1	328.74	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10763	FOLIG	3	1997-12-03	1997-12-31	1997-12-08	3	37.35	Folies gourmandes	184, chaussée de Tournai	Lille	\N	59000	France
10764	ERNSH	6	1997-12-03	1997-12-31	1997-12-08	3	145.45	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10765	QUICK	3	1997-12-04	1998-01-01	1997-12-09	3	42.74	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10766	OTTIK	4	1997-12-05	1998-01-02	1997-12-09	1	157.55	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
10767	SUPRD	4	1997-12-05	1998-01-02	1997-12-15	3	1.59	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10768	AROUT	3	1997-12-08	1998-01-05	1997-12-15	2	146.32	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10769	VAFFE	3	1997-12-08	1998-01-05	1997-12-12	1	65.06	Vaffeljernet	Smagsloget 45	Århus	\N	8200	Denmark
10770	HANAR	8	1997-12-09	1998-01-06	1997-12-17	3	5.32	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10771	ERNSH	9	1997-12-10	1998-01-07	1998-01-02	2	11.19	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10772	LEHMS	3	1997-12-10	1998-01-07	1997-12-19	2	91.28	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	\N	60528	Germany
10773	ERNSH	1	1997-12-11	1998-01-08	1997-12-16	3	96.43	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10774	FOLKO	4	1997-12-11	1997-12-25	1997-12-12	1	48.2	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10775	THECR	7	1997-12-12	1998-01-09	1997-12-26	1	20.25	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
10776	ERNSH	1	1997-12-15	1998-01-12	1997-12-18	3	351.53	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10777	GOURL	7	1997-12-15	1997-12-29	1998-01-21	2	3.01	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
10778	BERGS	3	1997-12-16	1998-01-13	1997-12-24	1	6.79	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10779	MORGK	3	1997-12-16	1998-01-13	1998-01-14	2	58.13	Morgenstern Gesundkost	Heerstr. 22	Leipzig	\N	04179	Germany
10780	LILAS	2	1997-12-16	1997-12-30	1997-12-25	1	42.13	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10781	WARTH	2	1997-12-17	1998-01-14	1997-12-19	3	73.16	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10782	CACTU	9	1997-12-17	1998-01-14	1997-12-22	3	1.1	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentina
10783	HANAR	4	1997-12-18	1998-01-15	1997-12-19	2	124.98	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10784	MAGAA	4	1997-12-18	1998-01-15	1997-12-22	3	70.09	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10785	GROSR	1	1997-12-18	1998-01-15	1997-12-24	3	1.51	GROSELLA-Restaurante	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela
10786	QUEEN	8	1997-12-19	1998-01-16	1997-12-23	1	110.87	Queen Cozinha	Alameda dos Canàrios, 891	Sao Paulo	SP	05487-020	Brazil
10787	LAMAI	2	1997-12-19	1998-01-02	1997-12-26	1	249.93	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10788	QUICK	1	1997-12-22	1998-01-19	1998-01-19	2	42.7	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10789	FOLIG	1	1997-12-22	1998-01-19	1997-12-31	2	100.6	Folies gourmandes	184, chaussée de Tournai	Lille	\N	59000	France
10790	GOURL	6	1997-12-22	1998-01-19	1997-12-26	1	28.23	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
10791	FRANK	6	1997-12-23	1998-01-20	1998-01-01	2	16.85	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10792	WOLZA	1	1997-12-23	1998-01-20	1997-12-31	3	23.79	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Poland
10793	AROUT	3	1997-12-24	1998-01-21	1998-01-08	3	4.52	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10794	QUEDE	6	1997-12-24	1998-01-21	1998-01-02	1	21.49	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10795	ERNSH	8	1997-12-24	1998-01-21	1998-01-20	2	126.66	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10796	HILAA	3	1997-12-25	1998-01-22	1998-01-14	1	26.52	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10797	DRACD	7	1997-12-25	1998-01-22	1998-01-05	2	33.35	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Germany
10798	ISLAT	2	1997-12-26	1998-01-23	1998-01-05	1	2.33	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10799	KOENE	9	1997-12-26	1998-02-06	1998-01-05	3	30.76	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10800	SEVES	1	1997-12-26	1998-01-23	1998-01-05	3	137.44	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10801	BOLID	4	1997-12-29	1998-01-26	1997-12-31	2	97.09	Bólido Comidas preparadas	C/ Araquil, 67	Madrid	\N	28023	Spain
10802	SIMOB	4	1997-12-29	1998-01-26	1998-01-02	2	257.26	Simons bistro	Vinbæltet 34	Kobenhavn	\N	1734	Denmark
10803	WELLI	4	1997-12-30	1998-01-27	1998-01-06	1	55.23	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10804	SEVES	6	1997-12-30	1998-01-27	1998-01-07	2	27.33	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10805	THEBI	2	1997-12-30	1998-01-27	1998-01-09	3	237.34	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
10806	VICTE	3	1997-12-31	1998-01-28	1998-01-05	2	22.11	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10807	FRANS	4	1997-12-31	1998-01-28	1998-01-30	1	1.36	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italy
10808	OLDWO	2	1998-01-01	1998-01-29	1998-01-09	3	45.53	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10809	WELLI	7	1998-01-01	1998-01-29	1998-01-07	1	4.87	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10810	LAUGB	2	1998-01-01	1998-01-29	1998-01-07	3	4.33	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
10811	LINOD	8	1998-01-02	1998-01-30	1998-01-08	1	31.22	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10812	REGGC	5	1998-01-02	1998-01-30	1998-01-12	1	59.78	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10813	RICAR	1	1998-01-05	1998-02-02	1998-01-09	1	47.38	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10814	VICTE	3	1998-01-05	1998-02-02	1998-01-14	3	130.94	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10815	SAVEA	2	1998-01-05	1998-02-02	1998-01-14	3	14.62	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10816	GREAL	4	1998-01-06	1998-02-03	1998-02-04	2	719.78	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10817	KOENE	3	1998-01-06	1998-01-20	1998-01-13	2	306.07	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10818	MAGAA	7	1998-01-07	1998-02-04	1998-01-12	3	65.48	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10819	CACTU	2	1998-01-07	1998-02-04	1998-01-16	3	19.76	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentina
10820	RATTC	3	1998-01-07	1998-02-04	1998-01-13	2	37.52	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10821	SPLIR	1	1998-01-08	1998-02-05	1998-01-15	1	36.68	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10822	TRAIH	6	1998-01-08	1998-02-05	1998-01-16	3	7	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
10823	LILAS	5	1998-01-09	1998-02-06	1998-01-13	2	163.97	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10824	FOLKO	8	1998-01-09	1998-02-06	1998-01-30	1	1.23	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10825	DRACD	1	1998-01-09	1998-02-06	1998-01-14	1	79.25	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Germany
10826	BLONP	6	1998-01-12	1998-02-09	1998-02-06	1	7.09	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10827	BONAP	1	1998-01-12	1998-01-26	1998-02-06	2	63.54	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10828	RANCH	9	1998-01-13	1998-01-27	1998-02-04	1	90.85	Rancho grande	Av. del Libertador 900	Buenos Aires	\N	1010	Argentina
10829	ISLAT	9	1998-01-13	1998-02-10	1998-01-23	1	154.72	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10830	TRADH	4	1998-01-13	1998-02-24	1998-01-21	2	81.83	Tradiçao Hipermercados	Av. Inês de Castro, 414	Sao Paulo	SP	05634-030	Brazil
10831	SANTG	3	1998-01-14	1998-02-11	1998-01-23	2	72.19	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norway
10832	LAMAI	2	1998-01-14	1998-02-11	1998-01-19	2	43.26	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10833	OTTIK	6	1998-01-15	1998-02-12	1998-01-23	2	71.49	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
10834	TRADH	1	1998-01-15	1998-02-12	1998-01-19	3	29.78	Tradiçao Hipermercados	Av. Inês de Castro, 414	Sao Paulo	SP	05634-030	Brazil
10835	ALFKI	1	1998-01-15	1998-02-12	1998-01-21	3	69.53	Alfred's Futterkiste	Obere Str. 57	Berlin	\N	12209	Germany
10836	ERNSH	7	1998-01-16	1998-02-13	1998-01-21	1	411.88	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10837	BERGS	9	1998-01-16	1998-02-13	1998-01-23	3	13.32	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10838	LINOD	3	1998-01-19	1998-02-16	1998-01-23	3	59.28	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10839	TRADH	3	1998-01-19	1998-02-16	1998-01-22	3	35.43	Tradiçao Hipermercados	Av. Inês de Castro, 414	Sao Paulo	SP	05634-030	Brazil
10840	LINOD	4	1998-01-19	1998-03-02	1998-02-16	2	2.71	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10841	SUPRD	5	1998-01-20	1998-02-17	1998-01-29	2	424.3	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10842	TORTU	1	1998-01-20	1998-02-17	1998-01-29	3	54.42	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10843	VICTE	4	1998-01-21	1998-02-18	1998-01-26	2	9.26	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10844	PICCO	8	1998-01-21	1998-02-18	1998-01-26	2	25.22	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10845	QUICK	8	1998-01-21	1998-02-04	1998-01-30	1	212.98	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10846	SUPRD	2	1998-01-22	1998-03-05	1998-01-23	3	56.46	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10847	SAVEA	4	1998-01-22	1998-02-05	1998-02-10	3	487.57	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10848	CONSH	7	1998-01-23	1998-02-20	1998-01-29	2	38.24	Consolidated Holdings	Berkeley Gardens 12  Brewery	London	\N	WX1 6LT	UK
10849	KOENE	9	1998-01-23	1998-02-20	1998-01-30	2	0.56	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10850	VICTE	1	1998-01-23	1998-03-06	1998-01-30	1	49.19	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10851	RICAR	5	1998-01-26	1998-02-23	1998-02-02	1	160.55	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10852	RATTC	8	1998-01-26	1998-02-09	1998-01-30	1	174.05	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10853	BLAUS	9	1998-01-27	1998-02-24	1998-02-03	2	53.83	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Germany
10854	ERNSH	3	1998-01-27	1998-02-24	1998-02-05	2	100.22	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10855	OLDWO	3	1998-01-27	1998-02-24	1998-02-04	1	170.97	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10856	ANTON	3	1998-01-28	1998-02-25	1998-02-10	2	58.43	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexico
10857	BERGS	8	1998-01-28	1998-02-25	1998-02-06	2	188.85	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10858	LACOR	2	1998-01-29	1998-02-26	1998-02-03	1	52.51	La corne d'abondance	67, avenue de l'Europe	Versailles	\N	78000	France
10859	FRANK	1	1998-01-29	1998-02-26	1998-02-02	2	76.1	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10860	FRANR	3	1998-01-29	1998-02-26	1998-02-04	3	19.26	France restauration	54, rue Royale	Nantes	\N	44000	France
10861	WHITC	4	1998-01-30	1998-02-27	1998-02-17	2	14.93	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10862	LEHMS	8	1998-01-30	1998-03-13	1998-02-02	2	53.23	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	\N	60528	Germany
10863	HILAA	4	1998-02-02	1998-03-02	1998-02-17	2	30.26	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10864	AROUT	4	1998-02-02	1998-03-02	1998-02-09	2	3.04	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10865	QUICK	2	1998-02-02	1998-02-16	1998-02-12	1	348.14	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10866	BERGS	5	1998-02-03	1998-03-03	1998-02-12	1	109.11	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10867	LONEP	6	1998-02-03	1998-03-17	1998-02-11	1	1.93	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10868	QUEEN	7	1998-02-04	1998-03-04	1998-02-23	2	191.27	Queen Cozinha	Alameda dos Canàrios, 891	Sao Paulo	SP	05487-020	Brazil
10869	SEVES	5	1998-02-04	1998-03-04	1998-02-09	1	143.28	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10870	WOLZA	5	1998-02-04	1998-03-04	1998-02-13	3	12.04	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Poland
10871	BONAP	9	1998-02-05	1998-03-05	1998-02-10	2	112.27	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10872	GODOS	5	1998-02-05	1998-03-05	1998-02-09	2	175.32	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
10873	WILMK	4	1998-02-06	1998-03-06	1998-02-09	1	0.82	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finland
10874	GODOS	5	1998-02-06	1998-03-06	1998-02-11	2	19.58	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
10875	BERGS	4	1998-02-06	1998-03-06	1998-03-03	2	32.37	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10876	BONAP	7	1998-02-09	1998-03-09	1998-02-12	3	60.42	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10877	RICAR	1	1998-02-09	1998-03-09	1998-02-19	1	38.06	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10878	QUICK	4	1998-02-10	1998-03-10	1998-02-12	1	46.69	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10879	WILMK	3	1998-02-10	1998-03-10	1998-02-12	3	8.5	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finland
10880	FOLKO	7	1998-02-10	1998-03-24	1998-02-18	1	88.01	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10881	CACTU	4	1998-02-11	1998-03-11	1998-02-18	1	2.84	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentina
10882	SAVEA	4	1998-02-11	1998-03-11	1998-02-20	3	23.1	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10883	LONEP	8	1998-02-12	1998-03-12	1998-02-20	3	0.53	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10884	LETSS	4	1998-02-12	1998-03-12	1998-02-13	2	90.97	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
10885	SUPRD	6	1998-02-12	1998-03-12	1998-02-18	3	5.64	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10886	HANAR	1	1998-02-13	1998-03-13	1998-03-02	1	4.99	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10887	GALED	8	1998-02-13	1998-03-13	1998-02-16	3	1.25	Galería del gastronómo	Rambla de Cataluña, 23	Barcelona	\N	8022	Spain
10888	GODOS	1	1998-02-16	1998-03-16	1998-02-23	2	51.87	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
10889	RATTC	9	1998-02-16	1998-03-16	1998-02-23	3	280.61	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10890	DUMON	7	1998-02-16	1998-03-16	1998-02-18	1	32.76	Du monde entier	67, rue des Cinquante Otages	Nantes	\N	44000	France
10891	LEHMS	7	1998-02-17	1998-03-17	1998-02-19	2	20.37	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	\N	60528	Germany
10892	MAISD	4	1998-02-17	1998-03-17	1998-02-19	2	120.27	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgium
10893	KOENE	9	1998-02-18	1998-03-18	1998-02-20	2	77.78	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10894	SAVEA	1	1998-02-18	1998-03-18	1998-02-20	1	116.13	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10895	ERNSH	3	1998-02-18	1998-03-18	1998-02-23	1	162.75	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10896	MAISD	7	1998-02-19	1998-03-19	1998-02-27	3	32.45	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgium
10897	HUNGO	3	1998-02-19	1998-03-19	1998-02-25	2	603.54	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10898	OCEAN	4	1998-02-20	1998-03-20	1998-03-06	2	1.27	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	\N	1010	Argentina
10899	LILAS	5	1998-02-20	1998-03-20	1998-02-26	3	1.21	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10900	WELLI	1	1998-02-20	1998-03-20	1998-03-04	2	1.66	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10901	HILAA	4	1998-02-23	1998-03-23	1998-02-26	1	62.09	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10902	FOLKO	1	1998-02-23	1998-03-23	1998-03-03	1	44.15	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10903	HANAR	3	1998-02-24	1998-03-24	1998-03-04	3	36.71	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10904	WHITC	3	1998-02-24	1998-03-24	1998-02-27	3	162.95	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10905	WELLI	9	1998-02-24	1998-03-24	1998-03-06	2	13.72	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10906	WOLZA	4	1998-02-25	1998-03-11	1998-03-03	3	26.29	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Poland
10907	SPECD	6	1998-02-25	1998-03-25	1998-02-27	3	9.19	Spécialités du monde	25, rue Lauriston	Paris	\N	75016	France
10908	REGGC	4	1998-02-26	1998-03-26	1998-03-06	2	32.96	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10909	SANTG	1	1998-02-26	1998-03-26	1998-03-10	2	53.05	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norway
10910	WILMK	1	1998-02-26	1998-03-26	1998-03-04	3	38.11	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finland
10911	GODOS	3	1998-02-26	1998-03-26	1998-03-05	1	38.19	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
10912	HUNGO	2	1998-02-26	1998-03-26	1998-03-18	2	580.91	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10913	QUEEN	4	1998-02-26	1998-03-26	1998-03-04	1	33.05	Queen Cozinha	Alameda dos Canàrios, 891	Sao Paulo	SP	05487-020	Brazil
10914	QUEEN	6	1998-02-27	1998-03-27	1998-03-02	1	21.19	Queen Cozinha	Alameda dos Canàrios, 891	Sao Paulo	SP	05487-020	Brazil
10915	TORTU	2	1998-02-27	1998-03-27	1998-03-02	2	3.51	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10916	RANCH	1	1998-02-27	1998-03-27	1998-03-09	2	63.77	Rancho grande	Av. del Libertador 900	Buenos Aires	\N	1010	Argentina
10917	ROMEY	4	1998-03-02	1998-03-30	1998-03-11	2	8.29	Romero y tomillo	Gran Vía, 1	Madrid	\N	28001	Spain
10918	BOTTM	3	1998-03-02	1998-03-30	1998-03-11	3	48.83	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10919	LINOD	2	1998-03-02	1998-03-30	1998-03-04	2	19.8	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10920	AROUT	4	1998-03-03	1998-03-31	1998-03-09	2	29.61	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10921	VAFFE	1	1998-03-03	1998-04-14	1998-03-09	1	176.48	Vaffeljernet	Smagsloget 45	Århus	\N	8200	Denmark
10922	HANAR	5	1998-03-03	1998-03-31	1998-03-05	3	62.74	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10923	LAMAI	7	1998-03-03	1998-04-14	1998-03-13	3	68.26	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10924	BERGS	3	1998-03-04	1998-04-01	1998-04-08	2	151.52	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10925	HANAR	3	1998-03-04	1998-04-01	1998-03-13	1	2.27	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10926	ANATR	4	1998-03-04	1998-04-01	1998-03-11	3	39.92	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	\N	05021	Mexico
10927	LACOR	4	1998-03-05	1998-04-02	1998-04-08	1	19.79	La corne d'abondance	67, avenue de l'Europe	Versailles	\N	78000	France
10928	GALED	1	1998-03-05	1998-04-02	1998-03-18	1	1.36	Galería del gastronómo	Rambla de Cataluña, 23	Barcelona	\N	8022	Spain
10929	FRANK	6	1998-03-05	1998-04-02	1998-03-12	1	33.93	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10930	SUPRD	4	1998-03-06	1998-04-17	1998-03-18	3	15.55	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10931	RICSU	4	1998-03-06	1998-03-20	1998-03-19	2	13.6	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
10932	BONAP	8	1998-03-06	1998-04-03	1998-03-24	1	134.64	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10933	ISLAT	6	1998-03-06	1998-04-03	1998-03-16	3	54.15	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10934	LEHMS	3	1998-03-09	1998-04-06	1998-03-12	3	32.01	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	\N	60528	Germany
10935	WELLI	4	1998-03-09	1998-04-06	1998-03-18	3	47.59	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10936	GREAL	3	1998-03-09	1998-04-06	1998-03-18	2	33.68	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10937	CACTU	7	1998-03-10	1998-03-24	1998-03-13	3	31.51	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentina
10938	QUICK	3	1998-03-10	1998-04-07	1998-03-16	2	31.89	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10939	MAGAA	2	1998-03-10	1998-04-07	1998-03-13	2	76.33	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10940	BONAP	8	1998-03-11	1998-04-08	1998-03-23	3	19.77	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10941	SAVEA	7	1998-03-11	1998-04-08	1998-03-20	2	400.81	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10942	REGGC	9	1998-03-11	1998-04-08	1998-03-18	3	17.95	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10943	BSBEV	4	1998-03-11	1998-04-08	1998-03-19	2	2.17	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10944	BOTTM	6	1998-03-12	1998-03-26	1998-03-13	3	52.92	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10945	MORGK	4	1998-03-12	1998-04-09	1998-03-18	1	10.22	Morgenstern Gesundkost	Heerstr. 22	Leipzig	\N	04179	Germany
10946	VAFFE	1	1998-03-12	1998-04-09	1998-03-19	2	27.2	Vaffeljernet	Smagsloget 45	Århus	\N	8200	Denmark
10947	BSBEV	3	1998-03-13	1998-04-10	1998-03-16	2	3.26	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10948	GODOS	3	1998-03-13	1998-04-10	1998-03-19	3	23.39	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
10949	BOTTM	2	1998-03-13	1998-04-10	1998-03-17	3	74.44	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10950	MAGAA	1	1998-03-16	1998-04-13	1998-03-23	2	2.5	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10951	RICSU	9	1998-03-16	1998-04-27	1998-04-07	2	30.85	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
10952	ALFKI	1	1998-03-16	1998-04-27	1998-03-24	1	40.42	Alfred's Futterkiste	Obere Str. 57	Berlin	\N	12209	Germany
10953	AROUT	9	1998-03-16	1998-03-30	1998-03-25	2	23.72	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10954	LINOD	5	1998-03-17	1998-04-28	1998-03-20	1	27.91	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10955	FOLKO	8	1998-03-17	1998-04-14	1998-03-20	2	3.26	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10956	BLAUS	6	1998-03-17	1998-04-28	1998-03-20	2	44.65	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Germany
10957	HILAA	8	1998-03-18	1998-04-15	1998-03-27	3	105.36	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10958	OCEAN	7	1998-03-18	1998-04-15	1998-03-27	2	49.56	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	\N	1010	Argentina
10959	GOURL	6	1998-03-18	1998-04-29	1998-03-23	2	4.98	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
10960	HILAA	3	1998-03-19	1998-04-02	1998-04-08	1	2.08	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10961	QUEEN	8	1998-03-19	1998-04-16	1998-03-30	1	104.47	Queen Cozinha	Alameda dos Canàrios, 891	Sao Paulo	SP	05487-020	Brazil
10962	QUICK	8	1998-03-19	1998-04-16	1998-03-23	2	275.79	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10963	FURIB	9	1998-03-19	1998-04-16	1998-03-26	3	2.7	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10964	SPECD	3	1998-03-20	1998-04-17	1998-03-24	2	87.38	Spécialités du monde	25, rue Lauriston	Paris	\N	75016	France
10965	OLDWO	6	1998-03-20	1998-04-17	1998-03-30	3	144.38	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10966	CHOPS	4	1998-03-20	1998-04-17	1998-04-08	1	27.19	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Switzerland
10967	TOMSP	2	1998-03-23	1998-04-20	1998-04-02	2	62.22	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Germany
10968	ERNSH	1	1998-03-23	1998-04-20	1998-04-01	3	74.6	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10969	COMMI	1	1998-03-23	1998-04-20	1998-03-30	2	0.21	Comércio Mineiro	Av. dos Lusíadas, 23	Sao Paulo	SP	05432-043	Brazil
10970	BOLID	9	1998-03-24	1998-04-07	1998-04-24	1	16.16	Bólido Comidas preparadas	C/ Araquil, 67	Madrid	\N	28023	Spain
10971	FRANR	2	1998-03-24	1998-04-21	1998-04-02	2	121.82	France restauration	54, rue Royale	Nantes	\N	44000	France
10972	LACOR	4	1998-03-24	1998-04-21	1998-03-26	2	0.02	La corne d'abondance	67, avenue de l'Europe	Versailles	\N	78000	France
10973	LACOR	6	1998-03-24	1998-04-21	1998-03-27	2	15.17	La corne d'abondance	67, avenue de l'Europe	Versailles	\N	78000	France
10974	SPLIR	3	1998-03-25	1998-04-08	1998-04-03	3	12.96	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10975	BOTTM	1	1998-03-25	1998-04-22	1998-03-27	3	32.27	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10976	HILAA	1	1998-03-25	1998-05-06	1998-04-03	1	37.97	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10977	FOLKO	8	1998-03-26	1998-04-23	1998-04-10	3	208.5	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10978	MAISD	9	1998-03-26	1998-04-23	1998-04-23	2	32.82	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgium
10979	ERNSH	8	1998-03-26	1998-04-23	1998-03-31	2	353.07	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10980	FOLKO	4	1998-03-27	1998-05-08	1998-04-17	1	1.26	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10981	HANAR	1	1998-03-27	1998-04-24	1998-04-02	2	193.37	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10982	BOTTM	2	1998-03-27	1998-04-24	1998-04-08	1	14.01	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10983	SAVEA	2	1998-03-27	1998-04-24	1998-04-06	2	657.54	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10984	SAVEA	1	1998-03-30	1998-04-27	1998-04-03	3	211.22	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10985	HUNGO	2	1998-03-30	1998-04-27	1998-04-02	1	91.51	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10986	OCEAN	8	1998-03-30	1998-04-27	1998-04-21	2	217.86	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	\N	1010	Argentina
10987	EASTC	8	1998-03-31	1998-04-28	1998-04-06	1	185.48	Eastern Connection	35 King George	London	\N	WX3 6FW	UK
10988	RATTC	3	1998-03-31	1998-04-28	1998-04-10	2	61.14	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10989	QUEDE	2	1998-03-31	1998-04-28	1998-04-02	1	34.76	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10990	ERNSH	2	1998-04-01	1998-05-13	1998-04-07	3	117.61	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10991	QUICK	1	1998-04-01	1998-04-29	1998-04-07	1	38.51	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10992	THEBI	1	1998-04-01	1998-04-29	1998-04-03	3	4.27	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
10993	FOLKO	7	1998-04-01	1998-04-29	1998-04-10	3	8.81	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10994	VAFFE	2	1998-04-02	1998-04-16	1998-04-09	3	65.53	Vaffeljernet	Smagsloget 45	Århus	\N	8200	Denmark
10995	PERIC	1	1998-04-02	1998-04-30	1998-04-06	3	46	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexico
10996	QUICK	4	1998-04-02	1998-04-30	1998-04-10	2	1.12	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10997	LILAS	8	1998-04-03	1998-05-15	1998-04-13	2	73.91	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10998	WOLZA	8	1998-04-03	1998-04-17	1998-04-17	2	20.31	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Poland
10999	OTTIK	6	1998-04-03	1998-05-01	1998-04-10	2	96.35	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
11000	RATTC	2	1998-04-06	1998-05-04	1998-04-14	3	55.12	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
11001	FOLKO	2	1998-04-06	1998-05-04	1998-04-14	2	197.3	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
11002	SAVEA	4	1998-04-06	1998-05-04	1998-04-16	1	141.16	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
11003	THECR	3	1998-04-06	1998-05-04	1998-04-08	3	14.91	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
11004	MAISD	3	1998-04-07	1998-05-05	1998-04-20	1	44.84	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgium
11005	WILMK	2	1998-04-07	1998-05-05	1998-04-10	1	0.75	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finland
11006	GREAL	3	1998-04-07	1998-05-05	1998-04-15	2	25.19	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
11007	PRINI	8	1998-04-08	1998-05-06	1998-04-13	2	202.24	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal
11008	ERNSH	7	1998-04-08	1998-05-06	\N	3	79.46	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
11009	GODOS	2	1998-04-08	1998-05-06	1998-04-10	1	59.11	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
11010	REGGC	2	1998-04-09	1998-05-07	1998-04-21	2	28.71	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
11011	ALFKI	3	1998-04-09	1998-05-07	1998-04-13	1	1.21	Alfred's Futterkiste	Obere Str. 57	Berlin	\N	12209	Germany
11012	FRANK	1	1998-04-09	1998-04-23	1998-04-17	3	242.95	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
11013	ROMEY	2	1998-04-09	1998-05-07	1998-04-10	1	32.99	Romero y tomillo	Gran Vía, 1	Madrid	\N	28001	Spain
11014	LINOD	2	1998-04-10	1998-05-08	1998-04-15	3	23.6	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
11015	SANTG	2	1998-04-10	1998-04-24	1998-04-20	2	4.62	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norway
11016	AROUT	9	1998-04-10	1998-05-08	1998-04-13	2	33.8	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
11017	ERNSH	9	1998-04-13	1998-05-11	1998-04-20	2	754.26	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
11018	LONEP	4	1998-04-13	1998-05-11	1998-04-16	2	11.65	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
11019	RANCH	6	1998-04-13	1998-05-11	\N	3	3.17	Rancho grande	Av. del Libertador 900	Buenos Aires	\N	1010	Argentina
11020	OTTIK	2	1998-04-14	1998-05-12	1998-04-16	2	43.3	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
11021	QUICK	3	1998-04-14	1998-05-12	1998-04-21	1	297.18	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
11022	HANAR	9	1998-04-14	1998-05-12	1998-05-04	2	6.27	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
11023	BSBEV	1	1998-04-14	1998-04-28	1998-04-24	2	123.83	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
11024	EASTC	4	1998-04-15	1998-05-13	1998-04-20	1	74.36	Eastern Connection	35 King George	London	\N	WX3 6FW	UK
11025	WARTH	6	1998-04-15	1998-05-13	1998-04-24	3	29.17	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
11026	FRANS	4	1998-04-15	1998-05-13	1998-04-28	1	47.09	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italy
11027	BOTTM	1	1998-04-16	1998-05-14	1998-04-20	1	52.52	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
11028	KOENE	2	1998-04-16	1998-05-14	1998-04-22	1	29.59	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
11029	CHOPS	4	1998-04-16	1998-05-14	1998-04-27	1	47.84	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Switzerland
11030	SAVEA	7	1998-04-17	1998-05-15	1998-04-27	2	830.75	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
11031	SAVEA	6	1998-04-17	1998-05-15	1998-04-24	2	227.22	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
11032	WHITC	2	1998-04-17	1998-05-15	1998-04-23	3	606.19	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
11033	RICSU	7	1998-04-17	1998-05-15	1998-04-23	3	84.74	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
11034	OLDWO	8	1998-04-20	1998-06-01	1998-04-27	1	40.32	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
11035	SUPRD	2	1998-04-20	1998-05-18	1998-04-24	2	0.17	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
11036	DRACD	8	1998-04-20	1998-05-18	1998-04-22	3	149.47	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Germany
11037	GODOS	7	1998-04-21	1998-05-19	1998-04-27	1	3.2	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
11038	SUPRD	1	1998-04-21	1998-05-19	1998-04-30	2	29.59	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
11039	LINOD	1	1998-04-21	1998-05-19	\N	2	65	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
11040	GREAL	4	1998-04-22	1998-05-20	\N	3	18.84	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
11041	CHOPS	3	1998-04-22	1998-05-20	1998-04-28	2	48.22	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Switzerland
11042	COMMI	2	1998-04-22	1998-05-06	1998-05-01	1	29.99	Comércio Mineiro	Av. dos Lusíadas, 23	Sao Paulo	SP	05432-043	Brazil
11043	SPECD	5	1998-04-22	1998-05-20	1998-04-29	2	8.8	Spécialités du monde	25, rue Lauriston	Paris	\N	75016	France
11044	WOLZA	4	1998-04-23	1998-05-21	1998-05-01	1	8.72	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Poland
11045	BOTTM	6	1998-04-23	1998-05-21	\N	2	70.58	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
11046	WANDK	8	1998-04-23	1998-05-21	1998-04-24	2	71.64	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
11047	EASTC	7	1998-04-24	1998-05-22	1998-05-01	3	46.62	Eastern Connection	35 King George	London	\N	WX3 6FW	UK
11048	BOTTM	7	1998-04-24	1998-05-22	1998-04-30	3	24.12	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
11049	GOURL	3	1998-04-24	1998-05-22	1998-05-04	1	8.34	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
11050	FOLKO	8	1998-04-27	1998-05-25	1998-05-05	2	59.41	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
11051	LAMAI	7	1998-04-27	1998-05-25	\N	3	2.79	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
11052	HANAR	3	1998-04-27	1998-05-25	1998-05-01	1	67.26	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
11053	PICCO	2	1998-04-27	1998-05-25	1998-04-29	2	53.05	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
11054	CACTU	8	1998-04-28	1998-05-26	\N	1	0.33	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentina
11055	HILAA	7	1998-04-28	1998-05-26	1998-05-05	2	120.92	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
11056	EASTC	8	1998-04-28	1998-05-12	1998-05-01	2	278.96	Eastern Connection	35 King George	London	\N	WX3 6FW	UK
11057	NORTS	3	1998-04-29	1998-05-27	1998-05-01	3	4.13	North/South	South House 300 Queensbridge	London	\N	SW7 1RZ	UK
11058	BLAUS	9	1998-04-29	1998-05-27	\N	3	31.14	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Germany
11059	RICAR	2	1998-04-29	1998-06-10	\N	2	85.8	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
11060	FRANS	2	1998-04-30	1998-05-28	1998-05-04	2	10.98	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italy
11061	GREAL	4	1998-04-30	1998-06-11	\N	3	14.01	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
11062	REGGC	4	1998-04-30	1998-05-28	\N	2	29.93	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
11063	HUNGO	3	1998-04-30	1998-05-28	1998-05-06	2	81.73	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
11064	SAVEA	1	1998-05-01	1998-05-29	1998-05-04	1	30.09	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
11065	LILAS	8	1998-05-01	1998-05-29	\N	1	12.91	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
11066	WHITC	7	1998-05-01	1998-05-29	1998-05-04	2	44.72	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
11067	DRACD	1	1998-05-04	1998-05-18	1998-05-06	2	7.98	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Germany
11068	QUEEN	8	1998-05-04	1998-06-01	\N	2	81.75	Queen Cozinha	Alameda dos Canàrios, 891	Sao Paulo	SP	05487-020	Brazil
11069	TORTU	1	1998-05-04	1998-06-01	1998-05-06	2	15.67	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
11070	LEHMS	2	1998-05-05	1998-06-02	\N	1	136	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	\N	60528	Germany
11071	LILAS	1	1998-05-05	1998-06-02	\N	1	0.93	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
11072	ERNSH	4	1998-05-05	1998-06-02	\N	2	258.64	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
11073	PERIC	2	1998-05-05	1998-06-02	\N	2	24.95	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexico
11074	SIMOB	7	1998-05-06	1998-06-03	\N	2	18.44	Simons bistro	Vinbæltet 34	Kobenhavn	\N	1734	Denmark
11075	RICSU	8	1998-05-06	1998-06-03	\N	2	6.19	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
11076	BONAP	4	1998-05-06	1998-06-03	\N	2	38.28	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
11077	RATTC	1	1998-05-06	1998-06-03	\N	2	8.53	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued) FROM stdin;
1	Chai	8	1	10 boxes x 30 bags	18	39	0	10	1
2	Chang	1	1	24 - 12 oz bottles	19	17	40	25	1
3	Aniseed Syrup	1	2	12 - 550 ml bottles	10	13	70	25	0
4	Chef Anton's Cajun Seasoning	2	2	48 - 6 oz jars	22	53	0	0	0
5	Chef Anton's Gumbo Mix	2	2	36 boxes	21.35	0	0	0	1
6	Grandma's Boysenberry Spread	3	2	12 - 8 oz jars	25	120	0	25	0
7	Uncle Bob's Organic Dried Pears	3	7	12 - 1 lb pkgs.	30	15	0	10	0
8	Northwoods Cranberry Sauce	3	2	12 - 12 oz jars	40	6	0	0	0
9	Mishi Kobe Niku	4	6	18 - 500 g pkgs.	97	29	0	0	1
10	Ikura	4	8	12 - 200 ml jars	31	31	0	0	0
11	Queso Cabrales	5	4	1 kg pkg.	21	22	30	30	0
12	Queso Manchego La Pastora	5	4	10 - 500 g pkgs.	38	86	0	0	0
13	Konbu	6	8	2 kg box	6	24	0	5	0
14	Tofu	6	7	40 - 100 g pkgs.	23.25	35	0	0	0
15	Genen Shouyu	6	2	24 - 250 ml bottles	13	39	0	5	0
16	Pavlova	7	3	32 - 500 g boxes	17.45	29	0	10	0
17	Alice Mutton	7	6	20 - 1 kg tins	39	0	0	0	1
18	Carnarvon Tigers	7	8	16 kg pkg.	62.5	42	0	0	0
19	Teatime Chocolate Biscuits	8	3	10 boxes x 12 pieces	9.2	25	0	5	0
20	Sir Rodney's Marmalade	8	3	30 gift boxes	81	40	0	0	0
21	Sir Rodney's Scones	8	3	24 pkgs. x 4 pieces	10	3	40	5	0
22	Gustaf's Knäckebröd	9	5	24 - 500 g pkgs.	21	104	0	25	0
23	Tunnbröd	9	5	12 - 250 g pkgs.	9	61	0	25	0
24	Guaraná Fantástica	10	1	12 - 355 ml cans	4.5	20	0	0	1
25	NuNuCa Nuß-Nougat-Creme	11	3	20 - 450 g glasses	14	76	0	30	0
26	Gumbär Gummibärchen	11	3	100 - 250 g bags	31.23	15	0	0	0
27	Schoggi Schokolade	11	3	100 - 100 g pieces	43.9	49	0	30	0
28	Rössle Sauerkraut	12	7	25 - 825 g cans	45.6	26	0	0	1
29	Thüringer Rostbratwurst	12	6	50 bags x 30 sausgs.	123.79	0	0	0	1
30	Nord-Ost Matjeshering	13	8	10 - 200 g glasses	25.89	10	0	15	0
31	Gorgonzola Telino	14	4	12 - 100 g pkgs	12.5	0	70	20	0
32	Mascarpone Fabioli	14	4	24 - 200 g pkgs.	32	9	40	25	0
33	Geitost	15	4	500 g	2.5	112	0	20	0
34	Sasquatch Ale	16	1	24 - 12 oz bottles	14	111	0	15	0
35	Steeleye Stout	16	1	24 - 12 oz bottles	18	20	0	15	0
36	Inlagd Sill	17	8	24 - 250 g  jars	19	112	0	20	0
37	Gravad lax	17	8	12 - 500 g pkgs.	26	11	50	25	0
38	Côte de Blaye	18	1	12 - 75 cl bottles	263.5	17	0	15	0
39	Chartreuse verte	18	1	750 cc per bottle	18	69	0	5	0
40	Boston Crab Meat	19	8	24 - 4 oz tins	18.4	123	0	30	0
41	Jack's New England Clam Chowder	19	8	12 - 12 oz cans	9.65	85	0	10	0
42	Singaporean Hokkien Fried Mee	20	5	32 - 1 kg pkgs.	14	26	0	0	1
43	Ipoh Coffee	20	1	16 - 500 g tins	46	17	10	25	0
44	Gula Malacca	20	2	20 - 2 kg bags	19.45	27	0	15	0
45	Rogede sild	21	8	1k pkg.	9.5	5	70	15	0
46	Spegesild	21	8	4 - 450 g glasses	12	95	0	0	0
47	Zaanse koeken	22	3	10 - 4 oz boxes	9.5	36	0	0	0
48	Chocolade	22	3	10 pkgs.	12.75	15	70	25	0
49	Maxilaku	23	3	24 - 50 g pkgs.	20	10	60	15	0
50	Valkoinen suklaa	23	3	12 - 100 g bars	16.25	65	0	30	0
51	Manjimup Dried Apples	24	7	50 - 300 g pkgs.	53	20	0	10	0
52	Filo Mix	24	5	16 - 2 kg boxes	7	38	0	25	0
53	Perth Pasties	24	6	48 pieces	32.8	0	0	0	1
54	Tourtière	25	6	16 pies	7.45	21	0	10	0
55	Pâté chinois	25	6	24 boxes x 2 pies	24	115	0	20	0
56	Gnocchi di nonna Alice	26	5	24 - 250 g pkgs.	38	21	10	30	0
57	Ravioli Angelo	26	5	24 - 250 g pkgs.	19.5	36	0	20	0
58	Escargots de Bourgogne	27	8	24 pieces	13.25	62	0	20	0
59	Raclette Courdavault	28	4	5 kg pkg.	55	79	0	0	0
60	Camembert Pierrot	28	4	15 - 300 g rounds	34	19	0	0	0
61	Sirop d'érable	29	2	24 - 500 ml bottles	28.5	113	0	25	0
62	Tarte au sucre	29	3	48 pies	49.3	17	0	0	0
63	Vegie-spread	7	2	15 - 625 g jars	43.9	24	0	5	0
64	Wimmers gute Semmelknödel	12	5	20 bags x 4 pieces	33.25	22	80	30	0
65	Louisiana Fiery Hot Pepper Sauce	2	2	32 - 8 oz bottles	21.05	76	0	0	0
66	Louisiana Hot Spiced Okra	2	2	24 - 8 oz jars	17	4	100	20	0
67	Laughing Lumberjack Lager	16	1	24 - 12 oz bottles	14	52	0	10	0
68	Scottish Longbreads	8	3	10 boxes x 8 pieces	12.5	6	10	15	0
69	Gudbrandsdalsost	15	4	10 kg pkg.	36	26	0	15	0
70	Outback Lager	7	1	24 - 355 ml bottles	15	15	10	30	0
71	Flotemysost	15	4	10 - 500 g pkgs.	21.5	26	0	0	0
72	Mozzarella di Giovanni	14	4	24 - 200 g pkgs.	34.8	14	0	0	0
73	Röd Kaviar	17	8	24 - 150 g jars	15	101	0	5	0
74	Longlife Tofu	4	7	5 kg pkg.	10	4	20	5	0
75	Rhönbräu Klosterbier	12	1	24 - 0.5 l bottles	7.75	125	0	25	0
76	Lakkalikööri	23	1	500 ml	18	57	0	20	0
77	Original Frankfurter grüne Soße	12	2	12 boxes	13	32	0	15	0
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region (region_id, region_description) FROM stdin;
1	Eastern
2	Western
3	Northern
4	Southern
\.


--
-- Data for Name: schema_ardine_short; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_ardine_short (id, table_name, content, embedding) FROM stdin;
1	clients	Table: clients\nDescription: ลูกค้าของแต่ละ team เป็นเจ้าของ project และ invoice มีอัตราค่าบริการ default และสถานะ archive\nColumns:\n  id                        UUID PRIMARY KEY,                                    -- รหัส client\n  team_id                   UUID NOT NULL REFERENCES teams(id) ON DELETE CASCADE, -- FK → teams: team เจ้าของ client\n  name                      VARCHAR(255) NOT NULL,                               -- ชื่อบริษัท/ลูกค้า unique ภายใน team (case-insensitive)\n  email                     VARCHAR(255),                                        -- อีเมลหลักสำหรับติดต่อ\n  phone                     VARCHAR(50),                                         -- เบอร์โทรศัพท์\n  contact_name              VARCHAR(120),                                        -- ชื่อผู้ติดต่อฝั่งลูกค้า\n  billing_address           JSONB,                                               -- ที่อยู่ billing สำหรับออก invoice เก็บเป็น JSON object\n  tax_id                    VARCHAR(64),                                         -- เลขประจำตัวผู้เสียภาษีของลูกค้า\n  notes                     TEXT,                                                -- โน้ตภายในสำหรับทีม ลูกค้าไม่เห็น\n  default_hourly_rate_cents INTEGER,                                             -- ราคาต่อชั่วโมง default หน่วยสตางค์ เช่น 12000 = 120 บาท/ชม. (project และ task สามารถ override ได้)\n  currency                  VARCHAR(3) NOT NULL DEFAULT 'USD',                   -- สกุลเงิน เช่น THB, USD, SGD\n  archived_at               TIMESTAMPTZ                                          -- ถ้ามีค่า = client ถูก archive แล้ว ไม่ active แต่ยัง query historical data ได้\n	[0.007734968,0.029596396,-0.031811453,0.0036126666,-0.018792871,-0.03861752,-0.04069686,-0.021978728,0.047130093,0.020073378,0.032272056,0.0060513103,0.11079024,0.04099121,-0.014256317,-0.023308346,0.0020932327,-0.02640956,0.013165712,-0.014049283,0.055032115,-0.04876262,0.024081415,-0.0043847286,0.013905806,-0.022667687,-0.0046078116,0.00070083904,-0.039592598,0.045356054,0.026209915,-0.021000009,0.009227497,0.053211715,0.016427394,0.028847761,-0.0037117493,-0.029730706,-0.0008569852,-0.022351079,0.029766379,0.0005104572,0.04919892,-0.03345701,0.02099416,-0.011551774,0.06605238,0.0036373886,-0.031323094,-0.007170907,0.029985355,0.0057553654,0.06235851,0.0071576843,-0.050798137,-0.0034931803,0.029754266,0.049986858,-0.032185126,-0.012400466,-0.004428873,0.04506565,-0.00020452951,0.011448021,0.027232733,-0.013674574,0.022539416,-0.03446735,-0.049168926,-0.030415256,-0.011203343,0.009372939,0.113364875,-0.00076063524,-0.01746494,-0.0056217597,-0.03623194,0.0006253444,0.015285291,0.0012995057,0.060677078,0.005619059,0.0041256743,0.03227068,0.01579789,0.004112538,-0.040700056,0.037369676,0.03305129,0.038227715,0.021452265,-0.03386076,-0.04131839,0.03550706,0.03939741,0.027516179,0.006155201,0.007888307,0.044012707,-0.03150144,-0.010943899,-0.08502605,-0.01601514,-0.016283259,-0.08882569,-0.03248857,-0.0040784916,-0.041580826,0.05068799,-0.042581245,-0.022924967,0.012620945,0.026112573,-0.04446678,0.02483517,-0.0343215,0.065679304,-0.06023596,0.013125803,-0.07490629,-0.051157482,-0.0036526753,-0.00061251456,-0.013614038,0.046972957,-0.027346678,-0.010845574,-0.008761267,0.015406574,-0.0643836,-0.04653863,-0.044496786,-0.00816209,0.016482037,-0.014980662,0.049698703,0.040764198,-0.010747948,-0.0050810305,0.011483836,0.04735582,-0.04139174,0.0125477165,0.067779295,0.005077129,-0.06116136,-0.020710943,0.014471718,-0.026976394,0.029104099,0.042683564,-0.072030045,-0.04504097,0.0022963895,0.0340013,0.0040841824,-0.046196952,-0.014042357,0.02022644,0.01914791,0.0074123815,-0.013145907,-0.00010042851,-0.028667906,0.040996876,0.010020014,-0.014001553,0.006362535,-0.044474192,-0.00992617,-0.010786837,-0.05118623,-0.08397818,0.030374084,-0.016673457,-0.037524253,-0.013281493,-0.018689673,-0.025900023,-0.04786187,-0.072077766,0.0070412843,-0.032165505,0.020600785,-0.02713109,-0.009640624,-0.03252079,-0.024262566,0.04426707,0.001720491,-0.0015844713,0.1025849,0.007109418,0.047177695,0.029764377,0.016971188,0.013784742,0.014707706,-0.003991318,-0.04922909,-0.001424195,0.0055977837,0.040612023,0.044564057,0.0041619097,-0.04510519,0.0056164875,0.038836386,-0.00817926,0.034821335,-0.016844595,0.042427268,-0.03157513,0.034936536,-0.04131539,-0.050818626,0.03160461,0.03249362,-0.010210002,0.036148544,0.0025358354,-0.05730515,0.058305267,0.045926873,-0.024409248,0.0060414136,0.004909056,-0.024850916,0.02741426,0.015238671,0.033103894,0.110836215,-0.02720788,0.028047968,-0.008601904,-0.0039789286,0.04262861,-0.015178724,-0.0069169677,-0.10044529,-0.05853659,0.025447048,0.009551127,-0.020243976,0.03137685,-0.016649103,-0.045232825,0.046029884,-0.052882154,0.017094838,0.037720747,-0.06338679,0.004450621,-0.0064265453,0.016821874,0.009729037,-0.03393263,0.013830434,0.043943517,0.0029541666,-0.00046563594,-0.008506328,0.0019599334,-0.031204436,0.015536431,-0.006225276,0.0039434657,-0.026500763,-0.05916269,-0.011297169,-0.004209793,-0.03218018,-0.0411647,0.02471569,0.015309153,0.0015910742,-0.049652267,0.011438369,-0.008788757,-0.07128223,-0.015071428,0.034528617,-0.05585555,-0.0018963007,-0.0213332,0.009370788,-0.05516971,0.00026554315,-0.030421691,-0.0099652205,0.018843956,0.09756881,-0.008432571,-0.0060401633,0.047014702,0.016408145,0.026755242,0.005683306,-0.0042659775,0.0063787242,-0.025119528,-0.02206581,0.028874533,-0.059356965,-0.023600334,0.025747225,0.13284683,0.028532574,-0.063242756,0.04200398,-0.022952432,-0.0057020723,-0.002342616,0.05029242,0.045352515,-0.06283019,0.0104398765,0.060482234,-0.0043118624,0.023595579,-0.031930067,0.020121101,-0.012840254,-0.062418908,0.04367053,-0.037334006,0.030259548,-0.008098453,0.026257418,0.030439699,-0.017024461,0.017976014,0.037117686,0.023760118,-0.050106004,0.018372195,-0.06718876,-0.034804836,0.06635101,0.010691616,-0.028122006,0.03039182,0.03418936,-0.015723638,0.063338585,-0.07195731,-0.017283548,-0.05272968,-0.042041175,-0.0070542013,0.022368629,-0.04125496,0.023752773,-0.012884833,-0.032390747,0.00812314,0.00854104,-0.003252686,-0.017158942,-0.0068161455,-0.0041965195,0.023466876,0.037105888,-0.0072916197,0.03081566,0.028372092,-0.064084694,-0.022691844,0.015859045,0.016304716,0.08807391,0.05648142,-0.028573371,0.005947992,0.055171326,-0.021110477,0.026613006,-0.07217079,-0.021203466,0.034432486,0.047000017,0.026721442,0.032386642,0.02975108,-0.056190092,-0.011077893,0.026640268,-0.04122966,0.0440791,0.0015194819,0.04075375,0.0043654335,-0.021177428,0.047190275,0.05070068,-0.034016665,0.005727301,0.0017854018,0.025539115,-0.048792463,0.07527643,0.007895109,-0.02896925,0.06289666,0.04114856,0.022406414,-0.012182549,0.05391956,0.027608259,-0.028936625,0.023237599,-0.048460923,0.06511612,-0.01004017,0.019187497,-0.010977316,0.007211727,0.032468762,-0.0021129807,0.023084618,-0.05766375,0.0050567044,0.020442782,-0.0048389165,0.030461453,-0.072539724,0.014342293,-0.007694996,-0.00655989,0.005998381,-0.035569716,0.0014870005,-6.5016895e-05,0.003303859,0.0132390335,-0.029817114,0.0011512971,0.02008361,-0.016973536,0.0005672536,-0.017749725,-0.019844865,0.013132016,-0.0076247514,-0.018099103,0.009722495,-0.037176378,0.026705336,-0.023558753,-0.015866917,-0.015772847,-0.018281687,0.021162318,-0.0056917,0.03913843,-0.041175812,0.06736865,-0.013322893,0.006082969,-0.11378342,-0.00730183,0.0419333,0.0063611367,-4.3555585e-05,-0.032898843,-0.052299995,0.022982934,-0.04368883,0.041225825,0.0016425863,-0.043044128,-0.014961261,-0.002236692,0.03984841,-0.0099314395,0.03703783,-0.002171859,0.01999587,0.026972929,-0.008208121,0.022024816,-0.0030680934,-0.032769386,0.008431446,0.006906889,0.0523862,-0.108074516,0.028032092,0.04777942,-0.052495033,-0.033004113,0.043081306,0.033165805,-0.011083547,0.0021783703,0.04713111,0.019487118,-0.049196273,0.03849369,0.020677548,-0.022718867,-0.034351952,-0.040395442,0.007110002,-0.027521225,0.0062243943,-0.029580276,0.044335697,0.045879874,-0.05793895,0.14104964,-0.0099716345,-0.021440784,-0.015509822,0.013471809,0.010432989,-0.010069195,0.017710498,0.0077806627,-0.037537873,-0.013976819,0.0074151275,-0.034500234,-0.020541783,0.031573407,-0.04456183,0.0028670675,-0.026433015,0.05675977,-0.020150432,0.026340807,-0.025225734,0.041347153,-0.11210888,-0.06134519,0.031252448,-0.018756792,-0.010876103,0.036640707,-0.044799186,-0.006231543,-0.009937933,0.032039013,-0.019798901,0.008630816,-0.058116987,0.043771252,-0.031051777,-0.017238861,-0.021889988,0.060082342,-0.0057595125,-0.046539757,0.039681844,-0.010761202,0.05422324,0.03468546,0.016386587,0.0016477101,-0.02630302,0.027273076,-0.03248385,0.0023790896,0.024725392,0.0133388955,0.0022291678,0.035084113,-0.025039785,0.006722074,0.06572173,-0.06559723,0.010720751,0.03747532,-0.014931971,0.023791445,0.03332391,-0.027422622,-0.013692439,-0.0040898025,-0.058274917,-0.057294976,0.0036913524,0.023740806,0.026806472,0.019272357,-0.016792543,0.019199677,0.004624646,-0.20625454,0.01456083,-0.01629017,-0.04430012,-0.00023881243,0.030705983,0.03813197,-0.027804138,-0.008844883,0.040972203,0.038757432,-0.026102308,0.019974975,-0.030658389,-0.031305373,0.011331563,-0.010622534,-0.0062430417,0.021637214,0.017187461,0.003606103,0.07261496,-0.044117723,-0.02572544,-0.026811106,-0.039295673,-0.007496993,0.015421951,0.022889247,0.009678845,0.045708776,-0.004315038,0.033874027,0.024133407,-0.026775517,-0.01562517,-0.00707429,-0.0066194925,-0.09024548,0.038972136,0.021067757,-0.019575605,-0.048128147,0.0237613,0.009800929,0.04471708,0.0054949704,0.036853954,-0.020363824,-0.008360504,0.02097874,0.009074058,-0.10479387,0.011612214,-0.011551044,0.058907345,0.036284976,0.009068642,0.040160175,-0.0259298,0.06627561,0.067365885,-0.02748671,-0.0043342975,-0.012209424,0.01148247,0.05136135,-0.031214224,0.0023589951,0.03226935,0.06134168,-0.030910717,-0.008180781,-0.0051860074,0.03396183,-0.057871386,0.028195513,-0.018366609,-0.053644825,0.011133483,-0.0334609,-0.03860707,-0.010913551,0.033407383,-0.040433045,-0.047740158,-0.06389493,0.025941547,0.041902658,0.025476051,-0.015050951,-0.027346598,-0.011899403,-0.002774942,0.016122652,-0.026651464,-0.058065176,0.0034581784,-0.022395102,-0.027569091,0.029017853,0.0009122427,-0.0386315,0.023294477,0.034377176,-0.040493995,-0.12327307,0.03470812,-0.039898224,-0.04481963,0.057550646,0.042699933,0.047861952,-0.019659264,0.01229932,0.024633318,0.012979579,-0.019140093,-0.036436353,-0.059957042,-0.018830376,-0.005831676,0.004283664,0.016303364,0.031183422,0.017081179,-0.035335653,0.03703845,0.01272351,0.028835615,0.018527988,-0.061498396,0.027569124,-0.011696607,-0.039747342,0.017573025,0.024466686,-0.011638963,0.02501747,0.014687843,0.073287934,-0.05376043,-0.03127282,0.05033431,0.005386607,0.020308355,0.0042309654,0.0011781879,0.012518957,-0.01668821,-0.024538506,-0.09494671,0.0013669609,-0.017920598,-0.004960353,0.023626164,0.012812998,0.020972572,0.02524644,0.03307409,0.0050911186,-0.04578838,-0.012447966,0.0042615584,0.00063658966,-0.0059854444,0.00047096776,-0.062496755,-0.011116053,0.016519032,-0.041614506,0.0403261,0.028813213,0.025844812,0.004970366,-0.023064049,0.056353305,-0.0068606213,-0.0052233706,0.016049732]
2	invites	Table: invites\nDescription: คำเชิญเข้าร่วม team ที่ยังรอการตอบรับ มี token สำหรับสร้าง invite link และมีวันหมดอายุ\nColumns:\n  id          UUID PRIMARY KEY,                                    -- รหัส invite\n  team_id     UUID NOT NULL REFERENCES teams(id) ON DELETE CASCADE, -- FK → teams: team ที่เชิญเข้า\n  email       TEXT NOT NULL,                                       -- อีเมลของผู้ถูกเชิญ\n  role        TEXT NOT NULL,                                       -- role ที่จะได้รับเมื่อ accept: OWNER / ADMIN / MEMBER / VIEWER / BILLING\n  token       TEXT NOT NULL UNIQUE,                                -- token สุ่มสำหรับสร้าง invite link\n  expires_at  TIMESTAMPTZ NOT NULL,                                -- วันหมดอายุ invitation ที่เลยวันนี้และ accepted_at IS NULL = expired\n  accepted_at TIMESTAMPTZ,                                         -- เวลาที่ accept NULL = ยังรอการตอบรับ\n  created_at  TIMESTAMPTZ NOT NULL                                 -- วันที่สร้าง invitation\n  -- UNIQUE (team_id, email): invite ได้แค่ 1 ครั้งต่อ email ต่อ team\n	[0.014596496,0.02606932,-0.024541628,0.039797742,0.012663827,-0.04892678,-0.031190207,-0.025234576,0.031691376,0.004492189,0.016339067,0.00042569343,0.11650138,0.04900106,-0.026808023,-0.017858766,0.0077836695,-0.015249551,-0.0031766864,-0.01580481,0.06136811,-0.053508524,0.034162268,-0.013416613,0.025358267,-0.020895049,-0.011857135,-0.0048091183,-0.038140267,0.023828449,0.038705282,0.004469889,-0.022571363,0.026085733,0.023770537,0.01203279,0.006943404,-0.010239238,-0.002362004,-0.006528468,0.038802657,-0.003997773,0.0503587,-0.034864195,0.036225833,-0.017904034,0.06087675,0.032526117,-0.015302022,-0.027546354,0.023306524,0.025154272,0.04052396,0.012232127,-0.030641267,-0.027488383,0.021123732,0.03759293,-0.028575407,0.014660801,-0.010294145,0.025313098,-0.00013748066,0.04195282,0.04724507,-0.010989396,-0.014163221,-0.038165066,-0.05463313,-0.01935002,-0.012225219,0.024760697,0.09185856,-0.004384093,-0.023150422,-0.012867194,-0.05013215,0.019784968,0.002874863,-0.016072648,0.05378785,0.0069848765,0.021100016,0.019040959,-0.010344864,-0.015832022,-0.017104002,0.04586419,0.043804962,0.016741913,0.013607001,-0.042812455,-0.049463224,0.0073460215,0.041359294,0.026186395,-0.006146048,0.0050351294,0.042997263,-0.056655157,-0.0021840793,-0.08114069,-0.037821077,-0.04515647,-0.08633266,-0.036900405,-0.011193631,-0.04278964,0.047170687,-0.026432576,-0.005453515,0.008342839,0.011361772,-0.05998289,0.03494832,-0.039586045,0.062426053,-0.064577185,0.02722806,-0.054526236,-0.054636486,0.028556304,-0.014335581,-0.016270908,0.055525575,-0.028908487,0.00026889332,-0.017367521,0.0224991,-0.06219782,-0.04349936,-0.031584505,-0.0035902301,0.010831345,-0.004375391,0.055977955,0.039728552,-0.0063053626,-0.0025121043,-0.014651461,0.021419443,-0.035449494,0.011162801,0.040480427,0.016138295,-0.06371964,-0.0057944753,0.013149226,-0.01862759,0.009630438,0.04482651,-0.05712747,-0.039280687,-0.0016711139,0.044418417,0.0037189135,-0.052433338,-0.014699639,0.017855803,0.034384076,0.041716818,-0.012745835,0.036466137,-0.039518088,0.047097165,0.017869255,-0.014690935,0.021738337,-0.030336391,0.01414134,0.0018143913,-0.031160142,-0.08118667,0.038614787,-0.022683218,-0.035977952,-0.010347666,-0.03405482,-0.021608563,-0.048149325,-0.085085675,0.019211791,-0.040373966,0.024994234,-0.01995127,-0.027531138,-0.015777845,-0.021254664,0.064800434,0.004679455,-0.014152825,0.075033665,0.014716366,0.041371707,0.043215442,0.0015968769,0.022875337,0.026116373,0.018533228,-0.04494405,0.014682489,-0.014918736,0.047659837,0.031219129,0.018168734,-0.07903864,-0.008398273,0.046172425,0.011748358,0.015610982,-0.024228258,0.052429795,-0.027308064,0.05518485,-0.03983012,-0.019038491,0.018955361,0.024050614,-0.0064561586,0.04517826,0.004727494,-0.03569065,0.072145805,0.049180377,-0.02201611,0.014723791,0.01575224,-0.0070593483,0.034084123,0.03982927,0.049981758,0.0878322,-0.021430457,0.0201977,-0.014059601,-0.022424836,0.0028253691,-0.00942036,-0.011280952,-0.10134106,-0.029924488,0.027610475,-0.0037407982,-0.016339714,0.0028399627,-0.027187053,-0.025935844,0.03815667,-0.049798917,0.01900064,0.046227075,-0.038762935,-0.004199172,-0.02479713,0.015476599,0.011532044,-0.044638462,0.024310132,0.048581075,0.0047316016,-0.0016402303,0.013269412,-0.0027973303,-0.04317749,0.0036925746,-0.0036018672,0.038045198,-0.027916394,-0.042160645,-0.017563976,0.012750147,-0.03257109,-0.029556686,0.00844128,0.03860552,-0.01840905,-0.07498408,0.013459237,-0.00870602,-0.057262532,-0.036574204,0.06094497,-0.06486742,-0.049520425,-0.026729451,0.0028872127,-0.050781213,0.0061354632,-0.04548701,0.0013194998,0.032251686,0.0762034,-0.013434296,0.0053686025,0.0563167,0.008581359,0.049102698,0.0040881527,-0.02229367,0.006920914,-0.027745184,-0.022945493,0.03280058,-0.052236464,-0.0066909553,0.023306238,0.12761694,0.0014112432,-0.054646503,0.054481544,-0.020128308,-0.014050278,-0.03230464,0.06958143,0.032049224,-0.029216766,0.0018774788,0.06599127,-0.0051541594,0.04019706,-0.025066916,0.024218168,-0.0036451034,-0.06193393,0.03756128,-0.04797018,0.038406357,-0.0083287135,0.073009446,0.027548864,-0.018276732,-0.0029625422,0.009355752,0.046192188,-0.057630178,0.024998657,-0.06303786,-0.028341651,0.06611003,0.009459116,-0.029528644,0.02453211,0.031239022,-0.022550525,0.031051038,-0.08855657,-0.019389043,-0.05477153,-0.04447679,0.0015103454,0.039921883,-0.0637049,0.011777146,-0.015579721,-0.026231477,-0.0017867833,0.016422795,-0.015255899,-0.020530852,0.008666459,-0.008897162,0.030295782,0.021127494,0.0096077155,0.028168935,0.033058316,-0.06619657,-0.018532244,-0.0074981204,0.004080953,0.10695294,0.050084293,-0.04984609,-0.010108393,0.030086383,-0.033423174,0.018453354,-0.046548776,-0.008889517,0.03448479,0.03055677,0.04763565,0.031848848,0.029818801,-0.064670935,-0.0035453932,0.016798263,-0.05777077,0.024103912,-0.018388178,0.048529785,-0.0037446567,0.0012278712,0.030663783,0.04088264,-0.03597205,0.009041674,-0.0032814476,0.030334434,-0.060696132,0.05562408,0.012187843,-0.0014301778,0.05757327,0.05020612,-0.00068704935,0.0024509134,0.055405274,0.032343008,-0.032960176,0.02699429,-0.051886212,0.040974736,-0.017387155,-0.0027113243,-0.02895046,0.009447984,0.049894404,0.002155273,0.024027152,-0.057236277,0.011521928,0.027208237,0.015584669,0.025286084,-0.07595584,-0.0022279394,-0.006721537,-0.0022653379,-0.018481992,-0.029944155,0.009674534,-0.0127021745,-0.015740734,0.008112944,-0.037212335,0.017114585,0.04128625,-0.032495536,0.0044069155,-0.004402531,-0.031611253,-0.00047939928,-0.0058534485,-0.016091047,-0.02671484,-0.06626811,0.0147365425,-0.03172152,0.019191895,-0.007304153,-0.012682945,0.012928602,0.0053144554,0.05366189,-0.05008208,0.06009329,-0.042648748,0.0032149202,-0.12095695,0.029738987,0.06305188,0.0024524052,-0.0023319535,-0.04123656,-0.074581444,0.0020286166,-0.043931894,0.05672229,-0.020460933,-0.008290108,-0.0014117975,0.012186686,0.04506695,-0.0056517613,0.04182205,-0.038454954,0.009515602,0.02866206,-0.020177001,0.028867347,0.00077903375,-0.03549496,-0.009064458,0.019132411,0.04022772,-0.10999375,0.03491419,0.03158754,-0.0491849,-0.026108531,0.0356,0.048818197,-0.0007629024,-0.021302553,0.022658512,0.010487292,-0.06904974,0.033140678,0.037169404,-0.025010945,-0.03344604,-0.052174315,0.0010221931,-0.034465298,0.029785402,-0.012307285,0.022247633,0.043793608,-0.036623865,0.13611987,-0.011756953,-0.007986655,-0.010518829,0.029445194,-0.015733216,0.009626484,0.031763103,0.016461283,0.0041725016,-0.01988398,-0.017662425,-0.047449604,-0.0154689,0.034129925,-0.059220582,0.012876824,-0.01644617,0.046459053,0.012749119,0.01900133,-0.034510873,0.024117861,-0.10930282,-0.06673493,0.03248866,-0.01755464,-0.01339026,0.04897718,-0.042218197,-0.031560123,0.0041576517,0.027285876,-0.040294025,0.024651015,-0.050170768,0.032452397,-0.026347833,-0.00035686805,-0.0036754555,0.047236446,0.0061284206,-0.03932463,0.036946934,-0.02184762,0.0479013,0.04074579,0.017968185,0.017546378,-0.02613784,0.031592783,-0.024497652,0.005248902,0.023273228,-0.0024946483,-0.0027597316,0.01896669,-0.030647852,-0.021520302,0.056726333,-0.065291494,0.028868474,0.041876655,-0.0039000928,0.053720683,0.033896446,-0.012573178,-0.015011561,0.0051829224,-0.05209395,-0.048424806,-0.00197225,0.0057487437,0.014213222,0.04675255,-0.012882989,0.03629688,0.020869365,-0.21151441,-0.0007162171,-0.015214854,-0.01073178,-0.021031603,0.047339454,0.008479719,-0.03132844,-0.006270005,0.028944254,0.04591011,-0.054300148,0.00834605,0.0057272925,-0.03685562,0.005471226,-0.021624796,-0.038896684,0.00403843,0.008235156,0.014817385,0.06567127,-0.058146134,0.017501712,-0.038509693,-0.03007338,-0.023139236,0.009180053,0.011633298,0.010487987,0.018407311,-0.018398566,0.037172385,0.008750798,-0.014087825,0.00096510287,-0.011791487,0.012961294,-0.087994665,0.046000507,0.01536251,-0.015750838,-0.053932123,-0.002361909,0.012037689,0.06436306,0.024475865,0.056726247,-0.0096396245,-0.024365854,0.0013009984,0.010023703,-0.07234718,-0.00871668,0.009354222,0.022035416,0.028192367,0.012375708,0.048920162,-0.010726283,0.046542883,0.0663228,-0.040036976,-0.0043761954,-0.01427679,0.022068651,0.047153052,-0.039473414,-0.008371446,0.019915543,0.04571743,-0.040064387,-0.030105863,-0.008233453,0.014144308,-0.043027487,0.01687464,-0.0016124818,-0.066301815,0.020398946,-0.020949638,-0.03146683,-0.007028087,0.03269594,-0.042396426,-0.03712602,-0.04079546,0.020028502,0.030359523,0.014634811,-0.017212318,-0.03531515,-0.013019024,0.014350294,0.0013456758,-0.030606352,-0.026750654,0.011028526,-0.005385144,-0.023786869,0.025047794,-0.012199949,-0.048996758,0.020172592,0.017767744,-0.015834197,-0.11747483,0.043268897,-0.018985849,-0.055383198,0.056928657,0.023499727,0.04279096,-0.02092312,0.0014816484,0.01156813,0.0047124187,-0.03974583,-0.03687791,-0.03795107,-0.024815885,-0.024989909,0.021070637,-0.0067916745,0.04128352,0.018371562,-0.01536593,0.051104233,0.027234096,0.03823166,-0.0043595256,-0.06541768,0.03748962,-0.010337564,-0.021578925,0.023614809,0.029251238,-0.007127477,0.031176485,0.03428652,0.045433763,-0.064758785,-0.022687878,0.040480096,0.029852245,0.032124396,0.018123826,-0.030028554,-0.0084644295,-0.012943763,0.0012322124,-0.09367773,0.010690748,-0.016537538,-0.004410511,0.014762371,0.040633414,0.022529552,0.0126312,0.01340237,0.0036629462,-0.046825018,-0.003757249,0.015555033,-0.007223662,-0.010695646,-0.00023937099,-0.040498354,0.016180782,0.023928154,-0.01804846,0.033066656,0.022977667,-0.012027314,0.010723525,-0.016208267,0.039798453,0.01884374,-0.00934098,0.030747514]
3	invoice_items	Table: invoice_items\nDescription: รายการย่อยแต่ละบรรทัดใน invoice แต่ละ item อธิบายค่าบริการ จำนวน และราคา สามารถเชื่อมกับ time entry ได้\nColumns:\n  id             UUID PRIMARY KEY,                                          -- รหัส item\n  team_id        UUID NOT NULL REFERENCES teams(id) ON DELETE CASCADE,       -- FK → teams\n  invoice_id     UUID NOT NULL REFERENCES invoices(id) ON DELETE CASCADE,    -- FK → invoices: invoice ที่ item นี้สังกัด\n  time_entry_id  UUID REFERENCES time_entries(id) ON DELETE SET NULL,       -- FK → time_entries: time entry ที่เชื่อมกับ item นี้ (NULL = fixed-price item)\n  description    TEXT NOT NULL,                                              -- คำอธิบายรายการ เช่น "Frontend Development"\n  quantity       NUMERIC(10,2) NOT NULL,                                     -- จำนวน เช่น ชั่วโมงทำงาน 8.50\n  rate_cents     INTEGER NOT NULL,                                           -- ราคาต่อหน่วย หน่วยสตางค์\n  amount_cents   INTEGER NOT NULL,                                           -- ยอดรวมของ item = quantity × rate_cents\n  created_at     TIMESTAMPTZ NOT NULL 	[0.010492766,0.030060502,-0.012146475,0.016971532,-0.0047691762,-0.0286291,-0.023222923,-0.010629203,0.04388308,0.018916091,0.028087765,0.002088678,0.11785043,0.0559876,-0.02579821,-0.025767267,0.010919302,-0.0035282094,0.017858563,-0.027531674,0.06482206,-0.05666449,0.044718094,-0.014262501,0.006511613,-0.030182768,0.0065043764,0.005313942,-0.056495633,0.05047007,0.03704406,-0.0107454425,-0.0019293779,0.049963042,0.009425056,0.0018043336,-0.013391011,-0.028294366,0.0049943584,-0.017706094,0.04324869,0.011000463,0.033450536,-0.020399088,0.020062117,-0.019339785,0.07009988,0.0203123,-0.023703333,-0.011475733,0.036051277,0.0072417553,0.04227216,0.005133554,-0.060299806,0.017144881,0.03826937,0.043767568,-0.02126929,0.00063235813,0.006906383,0.045335837,-0.0097490875,0.016986085,0.022742592,-0.019308442,0.01934324,-0.0363386,-0.04668438,-0.030346215,-0.005681002,0.02475347,0.1022429,-0.025433347,-0.023030087,-0.011781323,-0.044074513,-0.012719532,-0.0011595535,0.0044057895,0.061423868,-0.0038746647,-0.009723194,0.031529367,-0.0008182421,-0.0037878044,-0.03316911,0.035097633,0.021931663,0.020935314,0.02791261,-0.019872477,-0.050940543,0.007912329,0.043213535,0.033377327,-0.005748278,0.02084541,0.022164615,-0.02413909,-0.0046558017,-0.07992059,0.0058134217,-0.024563149,-0.08862731,-0.019295152,-0.02086843,-0.04824132,0.07531698,-0.015503538,-0.021365715,0.014805613,0.038308706,-0.06371603,0.041578453,-0.040787466,0.0625289,-0.048090223,0.0069333417,-0.074572235,-0.045028426,-0.0031153478,-0.00468664,-0.02963453,0.04930623,-0.023713715,0.0063454323,-0.006902483,0.013476022,-0.045494914,-0.028531522,-0.05726827,-0.0026153182,0.02296349,-0.021985926,0.03196604,0.05502236,-0.0013535157,0.00092401035,0.01184725,0.043018926,-0.022008419,0.005646152,0.066150405,0.008347615,-0.055353966,-0.0125217745,0.0064461166,-0.016906466,0.038037434,0.028499756,-0.057059813,-0.036918692,-0.00020178226,0.031968962,0.006729639,-0.031374022,-0.01672064,-0.0005953611,0.032606006,0.012125359,-0.020864189,0.0016380829,-0.033605434,0.053883,0.01136749,-0.026130522,0.037436105,-0.047246408,-0.0018796732,0.012616772,-0.04200152,-0.088965535,0.040251914,-0.01977469,-0.031224625,-0.015411874,-0.018287418,-0.030969044,-0.043994453,-0.057328384,0.009927844,-0.053547837,0.0172545,-0.008976319,-0.0012909998,-0.028430894,-0.033809777,0.033602953,0.005063343,-0.006797645,0.10104566,0.0026815962,0.044002652,0.017821575,-0.00866141,0.036801793,0.023126753,-0.003437852,-0.03844488,3.215586e-05,-0.0029936524,0.03419979,0.03330436,0.0014732127,-0.050280746,-0.0023448796,0.04102387,0.0126662105,0.03447208,-0.04506131,0.03193868,-0.015344419,0.03332209,-0.02381746,-0.058354866,0.03909012,0.036225963,-0.034154203,0.031407934,0.005576626,-0.058525987,0.052152276,0.04986316,-0.013621359,0.004225755,0.017406099,-0.023160318,0.040127575,0.0095252525,0.032625448,0.113747545,-0.032118615,0.010171114,-0.007936514,-0.0063189636,0.044768963,0.004520406,-0.025438813,-0.09844949,-0.052271627,0.024838947,0.016207134,-0.0200586,0.028949745,-0.004666385,-0.04799543,0.041764885,-0.06275378,0.009534727,0.04097132,-0.056655265,0.008950455,-0.025516167,0.028223854,0.0014752994,-0.041895363,0.0095737865,0.037640445,0.003941001,0.00064194336,-0.010480172,0.008849958,-0.027697211,0.009998619,-0.0062939767,0.0012428974,-0.045530736,-0.03262324,-0.0070574633,-0.007335367,-0.032461196,-0.037237283,-0.004101272,0.010054677,-0.003867809,-0.04352141,0.016100463,-0.015717676,-0.06738387,0.0022003732,0.044476595,-0.060719047,-0.022450015,-0.035842095,0.005184779,-0.066066556,0.0024107117,-0.03264475,-0.0025988054,0.016553346,0.09438845,-0.011162674,0.002090316,0.026320148,0.017793324,0.044819735,0.011259057,-0.007710259,0.0011493304,-0.023392426,-0.016830582,0.013134508,-0.052116767,-0.03550662,0.027451783,0.12635949,0.025898468,-0.0427967,0.039608885,-0.026949178,-0.017298143,-0.01036602,0.03468269,0.04434534,-0.05476659,0.0021288274,0.05806225,-0.0101752095,0.034932278,-0.020223482,0.035011154,-0.011693077,-0.06991131,0.03968339,-0.047151368,0.030324398,-0.020718757,0.059068665,0.016754009,-0.015870923,-0.0030190046,0.017950427,0.026334457,-0.053963594,0.023558704,-0.08173311,-0.04290364,0.05330622,0.011927135,-0.022639476,0.030536478,0.029688278,0.00061138265,0.056146998,-0.080946065,-0.02185211,-0.06229025,-0.052260984,0.0073182955,0.0058930153,-0.052011613,0.003484562,-0.005742806,-0.03573516,0.006101249,0.03260549,-0.024562847,-0.02026718,-0.013552698,0.008630866,0.021416178,0.027741503,-0.015384364,0.030699937,0.021254277,-0.06515394,-0.03277245,-0.00402564,0.0007574046,0.09995607,0.054128073,-0.017485812,0.0066399937,0.034260154,-0.030834144,0.036062755,-0.059585266,-0.012295643,0.018199516,0.042517323,0.03981584,0.02663127,0.04040905,-0.04630632,-0.004716898,0.030747091,-0.04960239,0.033692863,-0.007114746,0.036611114,-0.03040901,-0.013905939,0.04042376,0.049115505,-0.04637376,-0.008563786,-0.007352662,0.022752745,-0.046695903,0.07162958,0.01047171,-0.021376604,0.0609002,0.028077452,0.03366174,-0.0057603978,0.055740748,0.044165283,-0.035178266,0.036967278,-0.052928235,0.054170325,-0.00989983,0.008722846,-0.019570453,0.016116284,0.033458028,0.0020044427,0.025157295,-0.08163476,0.04220786,0.034846958,-0.009282743,0.031585794,-0.08012554,-0.0035258739,-0.000118913005,-0.0005986555,0.003238052,-0.024739627,0.02085381,0.012862455,0.0019520271,0.019308975,-0.045427263,0.014257145,0.03186603,-0.020865168,0.004624022,-0.0086774845,-0.035898767,0.024179177,0.002441382,-0.01703476,-0.0008933052,-0.04664134,0.02913634,-0.00035070235,-0.0038375075,-0.017258676,-0.0058415667,0.026756667,-0.0032597058,0.041105263,-0.043443646,0.069550484,-0.014760695,0.0040617203,-0.12604694,0.03294484,0.044492263,-0.0055675516,-0.00388398,-0.037776146,-0.07224936,0.010218999,-0.04250273,0.03622484,0.00079172506,-0.023198215,0.004658391,-0.014254735,0.03722645,0.012928189,0.031802528,-0.009434797,0.013943706,0.033959467,-0.00058241986,0.051065914,-0.014004603,-0.0139311785,0.0024443665,-0.0004226272,0.043230306,-0.105792366,0.036674436,0.031251434,-0.047493488,-0.027319878,0.021386815,0.049019296,-0.026581151,-0.017844962,0.044252407,0.006796397,-0.057718668,0.050474517,0.038392227,-0.012048589,-0.035148617,-0.045122974,-0.0026607146,-0.04244544,-0.0052492484,-0.025002612,0.034763597,0.04556094,-0.042304352,0.12956877,0.0028355364,-0.019554315,-0.0037768383,0.014029211,-0.0078256475,-0.01722373,0.024885342,0.016807992,-0.027646357,-0.021444643,0.019001609,-0.022809744,-0.030263403,0.025762174,-0.05100125,0.014405098,-0.049726106,0.038195837,-8.650014e-05,0.021809923,-0.036341187,0.033297483,-0.10835034,-0.057665106,0.04461031,-0.0048745233,-0.004852318,0.039226208,-0.02975298,0.009934645,-0.018488478,0.022263084,-0.031889863,0.016397264,-0.05749727,0.016394762,-0.015504647,-0.0053783427,-0.010270076,0.052398548,-0.008536566,-0.031772077,0.04478072,-0.01652017,0.050174844,0.033690825,0.012852991,-0.0029921005,-0.019925738,0.01964478,-0.033010952,0.014308228,0.013615116,0.026394317,-0.0038077799,0.026839172,-0.022740986,-0.012247939,0.045640383,-0.054623228,0.033211816,0.026985947,-0.009861621,0.02367759,0.021015882,-0.031171357,-0.013598145,-0.015372492,-0.05520798,-0.028814768,0.0050143693,0.009484314,0.044285703,0.045324083,-0.005354341,0.016211933,0.016499205,-0.2171812,-0.005373154,-0.012642709,-0.041516606,-0.007870308,0.04652948,0.014522393,-0.02196807,0.004164588,0.018365229,0.041680407,-0.011220617,0.010358972,-0.044300776,-0.035645254,0.022121675,-0.005580054,-0.020788247,0.006589876,0.024132457,0.0022810514,0.08215395,-0.033169437,-0.0006372516,-0.031275272,-0.047329552,-0.009040092,0.029277107,0.016952751,6.078441e-05,0.020287354,-0.013494732,0.03110329,0.011653744,-0.0223386,-0.025497109,-0.0044080843,3.282869e-05,-0.09239466,0.050620362,0.034487236,-0.016662968,-0.049723327,0.013385261,-0.0018392649,0.04878145,0.006569824,0.049780276,-0.027874501,-0.020474082,0.009023847,0.012750266,-0.091030374,2.8949471e-05,0.0026058163,0.059141107,0.024659095,0.00030295344,0.039212495,-0.017647639,0.06913609,0.05418525,-0.035693724,-0.0038405107,-0.009896553,-0.008091347,0.03579969,-0.031158343,0.0009569955,0.023738038,0.045985658,-0.036690313,-0.018632354,0.0005964168,0.04495257,-0.04002861,0.023101991,-0.012193609,-0.06188241,-0.014536828,-0.03764606,-0.031388298,-0.012552887,0.05153917,-0.038915556,-0.053771757,-0.06389494,0.017377168,0.047234867,-0.0019075165,-0.010570454,-0.0384987,-0.018860178,0.007972365,0.022238152,-0.02947865,-0.07742185,0.021430055,-0.01253248,-0.017709367,0.00735788,0.020728385,-0.018177217,0.04180225,0.042675126,-0.01363797,-0.12183665,0.016050216,-0.03700261,-0.03944924,0.04780061,0.030144665,0.05791682,-0.005092944,0.008627046,0.029964156,0.004444069,-0.022762662,-0.02391347,-0.057891045,-0.015942384,-0.02155307,0.014405616,0.01899066,0.03323191,0.019093174,-0.039946623,0.039963774,0.012686488,0.024126226,0.016293779,-0.05467434,0.03011379,-0.011070047,-0.03811539,0.027190454,0.013085346,-2.8104969e-05,0.021654576,0.010532401,0.06895435,-0.063621335,-0.044353858,0.061114304,-0.002293943,-0.0021902274,0.008072659,-0.0027576645,0.0023325176,-0.022892838,-0.000921341,-0.0920339,0.0038098118,-0.01517038,-0.019467063,0.023015678,0.016349537,0.03509545,0.015622487,0.019591633,-0.022601815,-0.04729633,0.005164391,0.0029284481,-0.010806898,0.009930674,-0.014289172,-0.059477814,0.004289986,0.02477377,-0.029374035,0.053021207,0.010042215,0.024961393,0.02575174,-0.0066923164,0.057428278,-0.013637515,-0.012463618,0.030921884]
4	invoice_time_entries	Table: invoice_time_entries\nDescription: junction table ที่ track ว่า time entry ใดถูกรวมใน invoice ใดแล้ว ป้องกัน double billing (time entry เดียวกัน invoice ได้แค่ครั้งเดียว)\nColumns:\n  id              UUID PRIMARY KEY,                                              -- รหัส\n  invoice_id      UUID NOT NULL REFERENCES invoices(id) ON DELETE CASCADE,       -- FK → invoices: invoice ที่ time entry ถูกรวมอยู่\n  time_entry_id   UUID NOT NULL UNIQUE REFERENCES time_entries(id) ON DELETE CASCADE, -- FK → time_entries: UNIQUE = 1 time entry invoice ได้แค่ครั้งเดียว\n  invoice_item_id UUID REFERENCES invoice_items(id) ON DELETE CASCADE,          -- FK → invoice_items: line item ที่ time entry นี้สังกัด\n  created_at      TIMESTAMPTZ NOT NULL   	[0.022434352,0.04498119,-0.02111152,0.027017329,0.017010355,-0.032466047,-0.020006524,-0.018014109,0.0315477,0.0070367353,0.0071908394,-0.008783998,0.10507569,0.051659215,-0.020832742,-0.022867817,0.005241824,-0.017207252,0.02927646,-0.012954144,0.06888452,-0.05872466,0.03975294,-0.024172643,0.00020546447,-0.010116461,-0.0014875606,0.013748638,-0.052455027,0.038437545,0.02835119,-0.020781683,-0.011410683,0.03641646,0.019214183,0.0020534345,-0.00809884,-0.0074437256,0.017882656,-0.0073870206,0.026686039,0.015306678,0.05147576,-0.023097996,0.03517697,-0.025691256,0.062616065,0.040609613,-0.017672794,-0.011223689,0.029621191,0.013918699,0.042922955,0.018610328,-0.05432101,-0.009801665,0.04334678,0.03168555,-0.03624348,-0.0011406364,0.017898373,0.04903127,-0.015395682,0.013930703,0.023253072,-0.013563901,-0.0006178136,-0.034857657,-0.04345276,-0.021731358,-0.0028872313,0.012273321,0.09011594,-0.019601341,-0.018365007,-0.010817714,-0.022555014,-0.0029812627,0.017438393,0.00406899,0.05854515,-0.0065746573,0.008355939,0.017391333,-0.008673636,-0.0039279694,-0.029285075,0.043838568,0.019789,0.026895873,0.03881087,-0.016103938,-0.032418363,0.011167893,0.038492672,0.030088937,-0.0011830196,0.0121179605,0.02861598,-0.02137029,-0.006068415,-0.08028417,-0.027245523,-0.02997252,-0.066000596,-0.033271734,-0.005302222,-0.037507847,0.07611531,-0.028811395,0.003486341,0.017342001,0.016295964,-0.05512338,0.04179486,-0.041257795,0.06862692,-0.086318426,0.026952365,-0.05634045,-0.06412336,-0.0049960306,-0.00028460776,-0.035268005,0.053376503,-0.014992798,0.012618116,-0.024790974,0.017087637,-0.051901884,-0.029659973,-0.06087475,0.01920736,0.0052904864,-0.022248209,0.020774828,0.030034993,0.021276442,-0.002825283,0.018238898,0.027974833,-0.023860257,0.0019253608,0.05053609,0.010131714,-0.07896268,-0.017636048,0.0048258235,-0.027908286,0.015312501,0.03698167,-0.06304689,-0.041018326,-0.00066749915,0.021822205,-0.012148663,-0.050798155,-0.013554851,-0.03080113,0.03274579,0.029348958,0.0026295139,0.021677619,-0.03206994,0.0607565,0.004825753,-0.0265823,0.032558765,-0.03300439,-0.00020085927,0.014828104,-0.052188322,-0.088951096,0.04528903,-0.006928058,-0.05167582,-0.018068064,-0.015861263,-0.02717361,-0.050898403,-0.07653509,-0.0028577547,-0.04672602,0.022251636,-0.0073873578,0.0025682484,-0.010218516,-0.034777783,0.035754047,-0.016929874,0.006953157,0.0890526,0.030824792,0.030138588,0.030731684,0.019115927,0.00798607,0.0022354675,0.010306328,-0.036857825,0.0007383473,-0.0030388546,0.036386937,0.028820252,0.010310992,-0.05226727,-0.00076413515,0.04719295,0.03968529,0.022567386,-0.037945695,0.033463452,-0.025012594,0.035473306,-0.033776313,-0.0391941,0.04306247,0.033389922,-0.03427838,0.022554146,-0.011860889,-0.044819303,0.04812469,0.04903205,-0.008242773,0.017745795,0.020013355,-0.015144588,0.025067147,0.004467412,0.058849324,0.091410525,-0.032174192,0.0070902365,-0.010062048,-0.010814947,0.03882398,-0.010725104,-0.016094176,-0.10538239,-0.039333183,0.027155908,0.015716745,-0.018706767,0.02921353,0.0017936788,-0.038865738,0.04604889,-0.02664768,0.00034523784,0.027910842,-0.05166284,0.0125094885,-0.03664982,0.013582584,-0.016179213,-0.030480985,0.0040484117,0.025719471,0.009013165,0.008305153,-0.026975151,0.004368921,-0.015841033,0.018246833,-0.02008064,0.021993749,-0.044177312,-0.026941236,-0.0026575392,0.013867837,-0.027929874,-0.0479211,0.0053743366,0.015451324,-0.0003148335,-0.05906839,0.012096629,-0.0016749313,-0.046733193,-0.029660853,0.02807639,-0.07190476,-0.039058328,-0.032416727,0.0035960306,-0.049223226,0.00489741,-0.055478137,0.009587873,0.0081492765,0.08064237,-0.019680725,0.0012378077,0.006860828,0.026127461,0.045993827,0.042283405,-0.0076809344,-0.0046645785,-0.014400347,-0.026920496,0.024852052,-0.0523737,-0.0323941,0.0203712,0.13264973,0.029614108,-0.043441165,0.050209843,-0.02589755,-0.008734757,-0.019269288,0.039139736,0.06729661,-0.053288348,-0.024612492,0.053996988,-0.0067253443,0.027710818,-0.03610623,0.037787415,-0.021033023,-0.07070813,0.029025001,-0.04382945,0.03515126,-0.021036988,0.06446392,0.024041235,-0.019151391,0.022626936,0.027656274,0.031932194,-0.06424137,0.02741842,-0.049227025,-0.05664368,0.05044917,0.030210664,-0.0086287,0.026443364,0.02940177,0.00018322065,0.0593455,-0.08722852,-0.028230924,-0.08620427,-0.048807286,0.009841388,0.018659249,-0.04694869,0.0034003372,-0.0055910386,-0.027375458,0.019131353,0.020391194,-0.010576346,-0.016332174,-0.0021797884,-0.0066076503,0.033788048,0.016387675,-0.009181961,0.0064971377,0.026797926,-0.06957105,-0.023847893,-0.014849217,0.016502574,0.14189336,0.03602458,-0.022990128,-0.0120982,0.02576724,-0.026352746,0.041115683,-0.07302524,-0.026338674,0.0060140523,0.027892515,0.025776664,0.018359654,0.036061753,-0.036828637,0.019445378,0.03257189,-0.027815482,0.015982911,-0.016156102,0.033229604,-0.0001356477,-0.0062344805,0.02783877,0.048011772,-0.03311829,-0.0037925018,-0.0075825956,0.0133363865,-0.041261103,0.059974637,0.0110848425,-0.01138999,0.055933774,0.04685715,0.01574171,0.0034778004,0.068013385,0.013490326,-0.05139927,0.043561097,-0.041196644,0.051233083,-0.017006237,-0.0061078835,-0.023827488,0.028119933,0.016613891,-8.3193896e-05,0.04505461,-0.075876474,0.032032553,0.020054542,-0.029557316,0.02917829,-0.10234356,-0.004730239,0.006590224,-0.0028131118,-0.0036185284,0.004097641,0.011514327,0.019358054,0.014146901,0.0075980364,-0.039754346,0.017936124,0.027679402,-0.0071059805,0.010403128,-0.0017462352,-0.011401138,0.02540452,-0.03422248,-0.020734271,-0.019820888,-0.06770985,0.020568056,-0.013731234,-0.004390321,0.01466278,0.007555824,0.028412344,-0.0103056785,0.029981136,-0.040156968,0.074802615,-0.013177372,0.012373427,-0.12507603,0.043497864,0.061453618,-0.0123828305,-0.023506107,-0.038166646,-0.07139411,0.011612343,-0.05624038,0.050847545,-0.016034864,-0.012191644,0.009450995,-0.038711634,0.06210042,0.015708275,0.04193589,-0.008248328,-0.0016330263,0.0347899,-0.0055105193,0.023607664,-0.012027663,-0.006200133,0.0073486585,0.0030703554,0.031261656,-0.1022362,0.03478323,0.030637503,-0.03639092,-0.04423473,0.03897507,0.040205166,-0.016940165,-0.032344993,0.031026177,-0.017146057,-0.032813538,0.05291771,0.03328312,-0.0188678,-0.039957862,-0.042856418,-0.006157728,-0.025202991,0.006656454,-0.023882123,0.03897165,0.04194222,-0.048548862,0.13024645,-0.010554846,-0.025833298,-0.0050467723,0.044716228,-0.005436351,-0.031188758,0.026827062,0.023225667,-0.023305066,-0.021870667,0.025669664,-0.034587055,-0.025729232,0.0021716482,-0.07661347,0.022742093,-0.05111337,0.03113568,0.00085233385,0.014912119,-0.022626055,0.043809373,-0.07509471,-0.052434683,0.055292763,-0.008847818,-0.017422954,0.035671506,-0.019338792,0.017259488,-0.024850743,0.037665598,-0.03098525,0.034709714,-0.04868867,-0.010457046,-0.021308692,0.0032856038,-0.0028539232,0.05483226,-0.013024656,-0.022747628,0.049503982,-0.013071282,0.043914568,0.036452614,0.019589,0.0036188324,-0.01566951,-0.009352436,-0.027275397,0.0061922343,0.015198092,0.03424127,-0.012818241,0.02761371,-0.017689383,-0.009238468,0.038562745,-0.0620134,0.038501102,0.037345577,0.010136794,0.03597032,0.0024694034,-0.020662012,-0.020379981,0.0068809087,-0.07422721,-0.04759124,-0.024054825,0.0066849864,0.023674525,0.053446013,0.014091607,0.032462746,0.030165007,-0.20095013,0.0013866413,-0.011927443,-0.03887514,-0.002436515,0.043550216,0.024557663,-0.018710062,0.006839956,0.0026376292,0.04942669,-0.023366055,0.0052859983,-0.03368241,-0.035727873,0.050041452,-0.0072833076,-0.038406644,0.026628356,0.04867646,0.0032297827,0.09468881,-0.022453174,-0.00840088,-0.0547659,-0.05526005,-0.014974852,0.035491515,0.017577555,-0.0017811308,0.0151757775,-0.011940748,0.017208382,-0.0057410495,-0.014572446,-0.022061137,-0.011532474,0.014162412,-0.09725267,0.06755684,0.014536228,0.0019919572,-0.054074258,0.005434432,-0.006565546,0.058647715,0.030996276,0.037445784,-0.043138713,-0.030347234,0.0030256205,-0.0016187095,-0.08278363,0.022014143,0.005304536,0.044372533,0.03878994,-0.0016407216,0.056328204,-0.019510914,0.044669703,0.0362372,-0.05298143,-0.017801026,-0.011128041,-2.1627935e-05,0.045017127,-0.03489693,-0.008949094,0.009179938,0.032674424,-0.028122444,-0.031440705,0.011021567,0.03057547,-0.043547656,0.022850137,-0.020827694,-0.08800966,-0.007101667,-0.013505704,-0.026204528,-0.017015252,0.040886406,-0.031877622,-0.03598054,-0.04825541,0.022509446,0.028374491,0.018714042,-0.015303626,-0.025839707,-0.008488623,-0.013380959,0.016300602,-0.031439845,-0.049821787,0.042733517,0.02242524,-0.0043018674,0.02169442,-0.0061519025,-0.028192893,0.0060114893,0.035302937,-0.023040844,-0.119992375,0.018893713,-0.034492273,-0.03103976,0.04392623,0.034970615,0.026881505,-0.011822208,0.0153591875,0.010971222,0.0023544529,-0.021362599,-0.02357994,-0.05097116,-0.015068749,-0.014229223,0.002387527,-0.003585725,0.039950702,0.013560465,-0.048609916,0.048253078,0.0029207761,0.036924772,0.017128285,-0.03956968,0.025563866,-0.015227005,-0.011415671,0.020845309,0.017408052,0.0028252772,0.02730679,0.005053714,0.06404241,-0.080173165,-0.031549707,0.049638696,0.014340559,-0.024493443,-0.006201332,0.004821704,-0.0067172498,-0.026131896,-0.008826676,-0.08508824,0.019220253,-0.012714387,-0.024750413,0.031214582,0.024943609,0.046535958,0.010083564,0.012649103,-0.0084912125,-0.04003799,0.008283213,0.015043851,0.011474552,0.02794088,-0.022496417,-0.058526676,0.0155951865,0.010244021,-0.043275226,0.054236125,0.009596323,0.00831243,0.022620432,-0.026585769,0.053834233,-0.0026571923,-0.031548116,0.020189086]
5	invoices	Table: invoices\nDescription: ใบแจ้งหนี้ที่ออกให้ client แต่ละใบมี status, วันที่, และยอดเงินรวม invoice ที่ status='sent' และ due_date < วันปัจจุบัน ถือว่า overdue\nColumns:\n  id              UUID PRIMARY KEY,                                      -- รหัส invoice\n  team_id         UUID NOT NULL REFERENCES teams(id) ON DELETE CASCADE,   -- FK → teams\n  client_id       UUID NOT NULL REFERENCES clients(id) ON DELETE CASCADE, -- FK → clients: client ที่ออก invoice ให้\n  invoice_number  VARCHAR(50) NOT NULL UNIQUE,                           -- เลขที่ invoice เช่น INV-2025-001 ต้อง unique ทั้งระบบ\n  status          VARCHAR(20) NOT NULL DEFAULT 'draft',                  -- สถานะ: draft (ร่าง) / sent (ส่งแล้ว รอจ่าย) / paid (จ่ายแล้ว) / cancelled (ยกเลิก)\n  issued_date     DATE NOT NULL,                                         -- วันที่ออก invoice\n  due_date        DATE NOT NULL,                                         -- วันครบกำหนดชำระ (status='sent' และ due_date < today = overdue)\n  subtotal_cents  INTEGER NOT NULL DEFAULT 0,                            -- ยอดรวมก่อนภาษี หน่วยสตางค์\n  tax_rate_percent NUMERIC(5,2) NOT NULL DEFAULT 0,                      -- อัตราภาษีเป็นเปอร์เซ็นต์ เช่น 7.00 = VAT 7%\n  tax_amount_cents INTEGER NOT NULL DEFAULT 0,                           -- จำนวนเงินภาษี หน่วยสตางค์\n  total_cents     INTEGER NOT NULL DEFAULT 0,                            -- ยอดรวมทั้งหมด = subtotal_cents + tax_amount_cents (หาร 100 ได้หน่วยเงินหลัก)\n  notes           TEXT   	[0.015892906,0.040916923,-0.015912632,0.020854859,-0.008374162,-0.030764084,-0.027038226,-0.0003346354,0.019003835,0.0022529238,0.03267007,0.002977966,0.100337416,0.057052597,-0.025484411,-0.03578011,0.014054034,-0.010297697,0.019744046,-0.014191766,0.031772923,-0.049958978,0.023959646,-0.008585146,0.02589958,-0.027042625,-0.004687366,-0.008775005,-0.05330996,0.0556661,0.040788088,0.008867992,0.0022709211,0.03677852,0.013166518,0.018002097,-0.024130045,-0.040435083,0.0048256675,0.0008990054,0.026803207,-0.0053035975,0.05104111,-0.01873234,0.027798006,-0.032303553,0.062485714,0.015179066,-0.026488628,-0.0075534172,0.039896596,0.0044246274,0.049536023,0.01922896,-0.04035372,-0.008351966,0.02611656,0.034387626,-0.024416827,-0.0060231923,0.019232834,0.04702296,-0.009403738,0.031797063,0.025936069,-0.011208006,0.015282313,-0.038049147,-0.046567716,-0.025982838,-0.0022716452,0.028350545,0.11251958,-0.023697479,-0.026378796,-0.0036686454,-0.02708319,-0.003682123,-0.005609017,-0.009944155,0.05177065,0.0087946225,-0.0027870655,0.030576296,-0.0003550902,0.003150452,-0.020925347,0.03669465,0.0206473,0.039851308,0.015852708,-0.025835913,-0.057219863,0.015441299,0.026588073,0.03340489,0.013684189,0.008297615,0.04251138,-0.027886821,0.0039827176,-0.076868415,-0.0050278665,-0.02273561,-0.0768152,-0.011667236,-0.0028069357,-0.032020792,0.05837569,-0.030582312,-0.042406622,0.017769154,0.022569345,-0.05294756,0.033373907,-0.03651808,0.059903696,-0.054836195,0.010177751,-0.08074819,-0.029672928,0.008341778,-0.0035152491,-0.019815534,0.037407268,-0.02773371,-0.0062837596,0.0050511574,0.031942934,-0.06419537,-0.041558262,-0.043354485,0.006435226,0.032546457,-0.0011094749,0.03566624,0.021907734,0.010893138,-0.011631382,0.00372734,0.020147335,-0.022991884,0.018265912,0.04652806,-0.0065736463,-0.052742563,-0.011455804,0.0102493875,-0.032652188,0.026377669,0.021952642,-0.06796037,-0.041627463,0.0022173808,0.030338189,0.0025841654,-0.023555553,-0.01809121,-0.0070904535,0.021216484,0.028670894,-0.0139363725,-0.0021591028,-0.03830452,0.06576943,0.009184464,-0.0067250594,0.028049111,-0.042771123,-0.00212851,0.01858382,-0.031170903,-0.06890155,0.041879836,-0.0030529068,-0.0337469,-0.03157412,-0.023379546,-0.027832275,-0.058343336,-0.0636126,0.010061546,-0.01904709,0.022620663,-0.019035071,-0.0036522762,-0.035959024,-0.018031154,0.07162291,-0.010880867,-0.0026754588,0.08566868,0.0016719403,0.023013212,0.035194915,0.011906383,0.026741289,0.003584876,-0.028515676,-0.04738871,0.016527288,-0.011156041,0.059538566,0.06293908,0.0077191535,-0.05265443,0.002399305,0.030796079,0.0027304909,0.022883765,-0.026657516,0.026090145,-0.045118395,0.038982153,-0.019504301,-0.047926042,0.034600414,0.023917943,-0.023728915,0.047694456,-0.0005353071,-0.06272594,0.057965398,0.042845994,-0.023646425,0.022102619,0.008772093,-0.03504475,0.021720286,0.016620826,0.05588539,0.10232734,-0.02473873,0.026472434,0.00028807612,0.0017324011,0.042881005,-0.0042740614,-0.017821006,-0.09843283,-0.051253002,0.0017652329,-0.0008847027,-0.011513048,0.027067874,-0.014853393,-0.06136122,0.056445185,-0.06163693,0.02212122,0.043073364,-0.058020454,0.01666857,-0.033468693,0.014071087,-0.0023137752,-0.05117722,0.022088647,0.029683683,-0.0040466716,-0.004115876,-0.010612649,0.012514017,-0.009131929,0.0036706165,-0.025041474,-0.00039987057,-0.038784396,-0.029008476,-0.007070734,0.008851965,-0.032618128,-0.034827903,0.00823424,0.014530377,-0.009872396,-0.050891254,0.009667156,0.004712048,-0.06753841,0.005615121,0.04988174,-0.05989109,-0.017912174,-0.038096797,0.0017616476,-0.05286988,0.011045568,-0.03975836,-0.010949973,0.025366776,0.102431856,-0.0012531504,0.014781516,0.029727219,0.01943542,0.016736425,-0.0040852614,0.008361407,0.0007047661,-0.011039522,-0.030722467,0.01079679,-0.060965236,-0.03062971,0.030834524,0.1286664,0.021783656,-0.036625504,0.051540315,-0.017782493,0.00083194213,0.001081507,0.03996384,0.038416587,-0.052496053,0.033872552,0.05492917,-0.018959247,0.028649354,-0.014167893,0.034432996,-0.03543742,-0.06538668,0.036704514,-0.024962703,0.032816727,-0.009129062,0.05758167,0.0144979255,-0.025140045,0.02421934,0.016332122,0.016485255,-0.07169208,0.030415652,-0.08955707,-0.045661032,0.06787844,0.026871169,-0.038677875,0.039422393,0.023398677,-0.015983893,0.033159096,-0.09845477,-0.015758649,-0.07577734,-0.051716127,0.0035800866,0.0053771236,-0.06301235,0.012765591,-0.007542136,-0.028145632,-0.0031421487,0.019229922,-0.021529494,-0.03595015,-0.021091755,-0.0050349315,0.029778212,0.03343125,-0.012685812,0.019107513,0.02246863,-0.076423645,-0.031824537,0.013618028,0.017121414,0.08784695,0.051508322,-0.025053317,-0.026627796,0.049760718,-0.022937853,0.010659619,-0.06544608,-0.021849804,0.0041097943,0.03435008,0.02789829,0.034202024,0.04046955,-0.050263274,-0.0013083488,0.019147139,-0.05913544,0.042023923,-0.02208003,0.0389157,-0.0116606755,-0.017564833,0.03834671,0.047249563,-0.035055682,-0.023781106,-0.002666792,0.020571781,-0.035884198,0.05027859,0.0068160263,-0.019277517,0.05660522,0.048721664,0.04174575,-0.033690013,0.03665053,0.040862955,-0.03561326,0.03970698,-0.04860908,0.046144906,-0.017067362,0.01323537,-0.007605951,0.01849372,0.04855785,-0.004935417,0.026748806,-0.05280505,0.022838082,0.013981571,-0.013815125,0.03172498,-0.07035933,-0.0059682764,-0.009075849,-0.0033287096,0.0099391015,-0.008421352,0.009755377,0.0017786906,0.0016325428,0.0043011615,-0.046677027,-0.0051333583,0.043228365,-0.016845476,0.00562451,-0.027759865,-0.016587274,0.014884418,-0.021868963,-0.023858953,-0.013875211,-0.039598577,0.012029806,-0.02135015,0.0017145852,-0.010713481,-0.00025429713,0.026553266,-0.008486206,0.032912526,-0.05714522,0.07565009,0.00966179,0.017886838,-0.116722584,0.04426476,0.02555654,-0.0034807213,0.0063955174,-0.039245937,-0.06572012,-0.0024835547,-0.025426975,0.052717835,0.003413893,-0.019133197,-0.022083096,-0.011035943,0.051503815,0.012867001,0.054189883,-0.012436628,0.008202953,0.029451331,0.004108745,0.026481248,0.00031823196,-0.013719898,0.016653921,0.008817913,0.03418576,-0.10552323,0.034115337,0.06691717,-0.049730293,-0.027504697,0.01297597,0.04038705,-0.022201678,-0.020060299,0.053899,-0.005320576,-0.056921106,0.03858917,0.033956394,-0.028649725,-0.022822568,-0.029680852,0.006718599,-0.027362287,0.017003117,-0.0076665166,0.030528225,0.033321977,-0.043203235,0.13584322,-0.017554093,-0.029482672,-0.013262317,0.0035626756,-0.0027674565,-0.02002632,0.022805152,0.009228665,-0.015374271,-0.043655492,0.015839854,-0.029267376,-0.04464135,0.04494401,-0.03817456,0.0008312393,-0.048535544,0.049443115,-0.00043342626,0.02254703,-0.026236389,0.016918423,-0.11933334,-0.07609141,0.020476338,-0.012146696,-0.030136589,0.040115997,-0.032191522,0.0014745626,-0.022105396,0.048582397,-0.018331489,0.013170503,-0.048340008,-0.0012057741,-0.025779285,-0.026332889,-0.021624489,0.05723489,-0.008546983,-0.029461432,0.04362558,-0.0016324581,0.04849524,0.020796277,0.012374764,0.0122345155,-0.04641097,0.022133827,-0.025604814,-0.009833752,0.037701614,0.02509393,-0.018053154,0.03609754,-0.025025718,-0.019333608,0.056488875,-0.048201766,0.02946409,0.019604541,-0.012317031,0.018806916,0.035175588,-0.009754696,-0.03415262,0.025935557,-0.063830934,-0.024084281,0.0036140892,0.015458952,0.028803915,0.054943755,-0.007863479,0.03647865,0.01144659,-0.21125792,0.0034868026,-0.025704417,-0.057709426,-0.0076026153,0.03562312,0.03244058,-0.050902516,0.007968059,0.018345388,0.044661246,-0.019546188,0.026059784,-0.046183906,-0.036243517,0.013497651,-0.011787424,-0.02370923,0.022291657,0.030491207,-0.016194277,0.07819772,-0.021960927,-0.011295758,-0.05024124,-0.030342957,-0.026679944,0.023529679,0.012171198,0.023118164,0.026419388,-0.01255851,0.01789284,0.011541425,-0.0022707134,-0.008437204,-0.009813591,-0.002233208,-0.103344075,0.04100203,0.016435128,-0.010062724,-0.030353231,0.012554523,0.0029606486,0.03119137,0.010218446,0.048470028,-0.040596757,-0.017274227,0.012409081,0.018390002,-0.10011401,0.025951266,-0.009754442,0.048763357,0.032362856,0.020319734,0.054146405,-0.027107548,0.06887615,0.05756708,-0.0401177,0.002926606,0.0033446338,0.03531796,0.016694384,-0.029638147,0.008771745,0.03822444,0.032665785,-0.04081094,-0.012356435,0.008164224,0.045145392,-0.041647438,0.03606168,-0.029276771,-0.06537459,-0.0022783375,-0.056692474,-0.029663486,-0.0035739539,0.030685725,-0.024744233,-0.03377609,-0.05688426,0.01885734,0.03641741,0.01936435,-0.023508672,-0.022428758,-0.0053811483,0.0070978813,0.018849904,0.000626189,-0.06596654,0.013845118,0.008609941,-0.024010211,0.030303959,-0.010143473,-0.01553921,0.018754482,0.03231537,-0.030723672,-0.13092493,0.031819485,-0.03789097,-0.052876238,0.05252945,0.038239617,0.05285407,-0.0059748334,0.00085543835,0.007985996,0.016512638,-0.027329775,-0.02488133,-0.06666341,-0.0045408444,-0.01794763,0.01729479,0.030266535,0.0479857,0.017485978,-0.031258926,0.039567165,0.02783873,0.02205273,0.0006711967,-0.03427215,0.012290574,-0.025757609,-0.032991283,0.022624657,0.01745338,-0.003395904,0.02153449,0.013928994,0.06477274,-0.058888745,-0.035325192,0.04951276,0.0025078857,-0.00236574,-0.0034831658,-0.01321332,0.013987969,-0.009586599,-0.020204362,-0.07309,0.024381362,-0.014887355,-0.002840493,0.04029504,0.03848339,0.03252217,0.033919916,0.028211195,-0.022763522,-0.043145586,0.00171846,-0.00078202976,0.002813334,0.01989685,-0.005843663,-0.047305007,-0.00789062,0.021326676,-0.032781124,0.071800694,0.03444558,0.011075371,0.02350119,0.0072564054,0.04404451,-0.027028982,-0.0378303,0.02215605]
6	migrations	Table: migrations\nDescription: system table สำหรับ track การ migrate database schema ไม่ใช่ business data ใช้ภายในระบบเท่านั้น ไม่ควรนำมาใช้ใน business query\nColumns:\n  id          SERIAL PRIMARY KEY,       -- รหัส migration ลำดับอัตโนมัติ\n  name        VARCHAR(255) NOT NULL UNIQUE, -- ชื่อไฟล์ migration เช่น "001_create_teams_table"\n  executed_at TIMESTAMPTZ NOT NULL DEFAULT NOW() -- วันเวลาที่ migration นี้ถูก run	[0.019901915,0.03272279,-0.020593653,0.009068414,0.0129557345,-0.044704564,-0.011396431,-0.040020104,0.04953053,0.031522475,0.02752181,0.025980813,0.12216814,0.030381406,-0.022083247,-0.030761184,-0.022743655,-0.028479816,0.011248237,-0.014778405,0.040548343,-0.028262518,0.0018442493,-0.015873097,0.0018030423,-0.03434987,0.0006722508,0.0011583125,-0.037407055,0.021412235,0.0016340681,-0.02464852,-0.010550568,0.025971174,0.018323677,-0.0047440506,-0.028768947,-0.012721892,-0.008766794,0.016851416,0.033115145,0.009287779,0.04757397,-0.027277801,-0.00025123951,-0.01323471,0.04889694,0.00027921476,-0.019912668,0.0009361215,0.034884628,0.02596409,0.048101045,0.04100636,-0.0331454,-0.019162372,0.036578886,0.029119078,-0.04852661,0.009387377,-0.015044584,0.03404133,-0.0145943435,0.014018123,0.03936675,-0.041399546,-0.005914154,-0.03220583,-0.055166453,-0.017904142,-0.0061030006,0.010318478,0.11553255,0.006538942,-0.0038294047,-0.0051624603,-0.04096163,0.015810477,0.0019908089,0.0008031142,0.04553612,0.02077852,0.020286208,0.034787614,-0.010898939,-0.0062586656,-0.017913895,0.024592979,0.031047003,0.052733626,0.015484981,-0.037550732,-0.04066187,0.05029565,0.013056702,0.03255419,0.0019167379,-0.00043703947,0.04141749,-0.059285894,-0.018707288,-0.09607614,0.0009461134,-0.049303632,-0.076727465,-0.02842198,2.604012e-05,-0.052730236,0.07171598,0.0069237663,-0.022652695,0.041302238,0.016579809,-0.053296003,0.017724046,-0.056651797,0.040079575,-0.03964233,0.012875339,-0.05855165,-0.023891004,0.03773619,-0.00097554084,0.0003284973,0.04577587,-0.06680411,0.002367258,-0.014315713,0.051458757,-0.034022477,-0.03559284,-0.019899338,0.02844136,0.00090221514,0.0031677438,0.058412034,0.024534458,0.0023392835,-0.013902897,-0.008164889,0.037350226,-0.043005195,0.0034057614,0.061181106,0.0012725231,-0.061553195,-0.016885696,0.018001238,-0.025181666,0.017028423,0.027095992,-0.038539167,-0.027059712,-0.018266574,0.03175404,0.0036620842,-0.04354931,-0.008791091,0.0121495435,0.0228099,0.025282621,-0.014368498,0.004809986,-0.04177455,0.026445676,7.024186e-05,-0.03717193,0.0030573497,-0.061828144,-0.0083029615,0.017772123,-0.06356302,-0.07313147,0.043691993,-0.02622103,-0.03338872,-0.010769819,-0.034619875,-0.029593008,-0.03760147,-0.06580214,-0.0018618956,-0.044325344,0.021837194,-0.0010845846,-0.022901203,-0.039958157,-0.041581135,0.0345216,0.007526537,-0.0013685353,0.07550889,0.01889451,0.03632904,0.0057344693,0.023140704,0.021138202,0.0196111,0.008324537,-0.046788145,0.008982897,-0.00968173,0.036637783,0.021368751,0.013803095,-0.07970438,-0.016628677,0.068255566,0.032808587,0.01175355,-0.019688984,0.036538895,-0.014959937,0.02441261,0.0009068753,-0.048197865,0.034683987,0.01641247,-0.019935224,0.053451583,0.004943091,-0.046054397,0.08420028,0.03969319,-0.030738015,0.00014917165,0.010227251,-0.038316824,0.03828045,0.043085966,0.04286687,0.08688475,-0.022127772,0.0454233,0.00015006965,-0.033933904,0.06635693,-0.020588387,-0.006843328,-0.10543448,-0.031213673,0.010706518,0.0025319436,-0.028418602,-0.004946155,0.005098169,-0.039820626,0.021871896,-0.045061532,0.021977134,0.031826925,-0.0336556,0.016498165,-0.031857174,0.021774821,-0.0031362695,-0.018400665,-0.024417782,0.05501628,-0.013590204,0.016855966,-0.029426433,0.01861567,-0.047966726,0.009733335,0.007041936,0.011708346,-0.012568044,-0.046441823,-0.004627088,0.020912522,-0.017965484,-0.037084445,0.018213203,0.02210372,-0.002567454,-0.058774,0.014133887,-0.005437683,-0.06299012,-0.06820741,0.024774548,-0.04541872,-0.0074686976,-0.018211035,0.009267531,-0.03893523,0.010811493,-0.04065031,-0.01577117,0.002840102,0.07222561,-0.020645903,-0.0123497965,0.032592162,0.016369076,0.032867555,-0.0033048452,-0.032675836,-0.016269,-0.024184033,-0.009138068,0.043702804,-0.074121855,-0.018263148,0.040687077,0.10184312,-0.009310899,-0.036683805,0.03451506,-0.010920985,-0.019538704,-0.043034278,0.061197963,0.059757326,-0.057714287,0.005954715,0.06531099,-0.005769209,0.02080313,-0.057978235,0.020091042,-0.0016734818,-0.063706994,0.030180836,-0.03280516,0.04237832,-0.0008072735,0.012534527,0.018542467,-0.043059465,0.029613825,0.0042179497,0.0302915,-0.0400437,0.013395565,-0.031826936,-0.060080085,0.08003332,0.038516488,-0.0042533726,0.059086382,0.019798798,-0.009994861,0.090161346,-0.0753818,-0.017731633,-0.055586755,-0.04844947,0.022951312,0.033664197,-0.060211517,0.018735457,-0.0100915935,-0.0344423,-0.0050577084,0.019500295,0.015251578,-0.029139541,-0.0013655573,-0.011196056,0.029381448,-0.0018559649,-0.0019183323,0.023283085,0.023171574,-0.06364579,-0.015030175,0.0023196854,0.016473878,0.09826826,0.02361164,-0.041354,-0.012316682,0.05615452,-0.020329004,0.013767335,-0.06658372,0.0037264817,0.008075609,0.036735613,0.070680164,0.013013802,0.027540028,-0.039517455,-0.0040845894,0.0098901475,-0.074084856,0.039325748,-0.028866956,0.047767736,0.011976881,-0.0101150405,0.044507675,0.050367862,-0.027200755,0.032731973,0.0022577147,0.017676635,-0.0446269,0.050628126,0.045749802,-0.005947797,0.057514902,0.0450356,0.043843262,-0.022906577,0.04559978,0.028586851,-0.0097495075,0.03578182,-0.024570817,0.032311466,-0.00055814214,-0.0036178736,-0.021447927,-0.008037106,0.048625026,0.011342547,0.012082755,-0.07967281,0.042812314,0.033740014,0.0031448063,0.024588138,-0.10471692,0.014730103,-0.024994222,-0.018299505,-0.009363473,-0.014054099,-0.004262564,0.026715836,-0.018761741,0.017796228,-0.05186137,0.027427524,0.032146674,-0.039208323,0.0017122419,0.018686708,-0.030906703,0.02925983,-0.041464955,-0.007919817,-0.0066755037,-0.025984913,0.0051591815,-0.036375333,-0.004934776,-0.010027619,-0.040239245,0.0072879144,-0.008806776,0.041429657,-0.0379534,0.05755681,-0.02653151,0.02001909,-0.115851074,0.04402216,0.037467916,-0.0040469794,-0.0004442554,-0.017124632,-0.0724696,0.03823055,-0.062334973,0.025860451,-0.027362896,-0.06736024,-0.02799757,0.02233315,0.025398158,-0.00924887,0.048018623,0.029517258,0.027858572,0.006630046,-0.007921109,0.02519234,-0.014171572,-0.013070273,0.01543309,0.018277595,0.029500328,-0.08642772,0.04140634,0.043370187,-0.037717536,-0.042081736,0.036684815,0.03577615,0.003052918,-0.0006675539,0.035005197,-0.0070431335,-0.055006832,0.02188843,0.044024747,0.0017058817,-0.036607556,-0.028355831,-0.00081479194,-0.021099221,-0.0039099506,-0.0575901,0.046164103,0.03556441,-0.041453414,0.10387525,-0.033755478,-0.0031621128,-0.010771886,0.038938817,0.0074186656,-0.021545008,0.029937685,0.010690568,-0.017303828,-0.020075401,0.014876805,-0.050982572,-0.018676082,0.0067195124,-0.040416703,-0.0031616811,-0.044414707,0.055633605,-0.041181047,0.031980783,-0.022292366,0.052905165,-0.09608443,-0.0428235,0.016825683,0.011105345,-0.020534724,0.05291093,-0.020634884,0.031769946,-0.007552899,0.01143679,-0.04393674,0.00046948396,-0.024645088,0.01743026,-0.026753962,-0.010251784,0.015876412,0.042202555,-0.014642623,-0.008221565,0.053947017,-0.01873172,0.05361471,0.007570018,0.044242356,0.019665986,-0.044233937,0.0050311713,-0.009840422,-0.013057357,0.016957613,-0.012306676,0.018350031,0.006921131,-0.023010856,0.010462584,0.050964873,-0.054970738,0.023923406,0.01848456,-0.0012349306,0.034815002,0.040446866,-0.0048904973,-0.0065296995,0.0056918324,-0.083516024,-0.04841139,-0.036418565,0.011146628,0.020429062,0.04933273,0.0010049468,0.007889419,0.041596375,-0.21053068,0.01604954,-0.055967685,-0.03227709,0.015797224,0.056263622,0.036592778,-0.023723353,-0.0071651833,0.037341416,0.03940979,-0.04090492,0.028763106,6.445656e-05,-0.033964437,0.021048786,-0.024305731,-0.015962431,0.014253591,-4.4090462e-05,0.0145762665,0.05357598,-0.04904774,0.0025828495,-0.055114485,0.0074176337,-0.029702917,0.026463412,0.027182885,-0.00044372084,0.018154623,0.013987894,0.041169588,0.027784359,-0.013152839,-0.021650648,-0.022437748,0.00927821,-0.06224912,0.043197215,0.008571655,-0.008552547,-0.029517516,0.027625704,-0.008564296,0.042508505,0.023802122,0.026082277,-0.030358098,0.012129512,0.013977423,0.00012809993,-0.11067262,0.0033492662,-0.007297099,0.06284418,0.022502711,0.0023317137,0.02859597,-9.879679e-05,0.049487717,0.06815687,-0.023674605,0.00039493557,0.010529397,0.013226062,0.06615377,-0.048749536,-0.028943283,0.012685305,0.02681859,-0.032840572,0.003721267,-0.00627184,0.021726884,-0.02824599,0.011268867,-0.02918481,-0.05102301,0.02768243,-0.046351828,-0.008448353,-0.018404238,0.022903975,-0.045571703,-0.022222107,-0.059960842,0.010027288,0.043053586,0.005512541,-0.021553356,-0.05345024,-0.030747732,0.0239773,0.024897177,-0.011519173,-0.021506794,0.022793831,-0.039342932,-0.014781911,0.014740435,-0.012988294,-0.01822172,0.025817903,0.052526865,-0.074371375,-0.10431037,0.026789648,-0.020078199,-0.05955633,0.074092224,0.031380754,0.05453362,-0.012372311,0.029662177,-0.0032261533,0.039156705,-0.048304535,-0.037760474,-0.044006273,-0.010427905,-0.015467919,0.0052007935,0.0049540885,0.04023002,0.022266963,-0.044904508,0.035053574,0.019366646,0.031435188,-0.004843784,-0.054326545,0.03943233,-0.020976815,-0.0072955997,0.037535787,0.023159826,-0.028230133,0.023894351,0.03309016,0.066049114,-0.056584433,-0.029974736,0.049422473,-0.010232295,0.048343506,0.021481518,0.0062929457,-0.006297242,-0.030635098,0.006132437,-0.106627345,0.013555276,-0.018851869,-0.031558942,-0.01231794,0.028354228,0.016300775,0.01184197,0.02328168,-0.01291656,-0.048205245,0.00869013,0.02241664,0.0074426546,0.028240157,-0.03538364,-0.01834584,0.008741534,0.02453406,-0.007504749,0.038928796,0.013118207,0.0046017426,0.010370473,-0.015204047,0.056274682,0.006981142,-0.0047236164,0.03455167]
13	teams	Table: teams\nDescription: หน่วยองค์กรหลัก ข้อมูลทั้งหมดในระบบผูกกับ team เสมอ user คนหนึ่งสามารถอยู่ได้หลาย team\nColumns:\n  id              UUID PRIMARY KEY,     -- รหัส team สร้างอัตโนมัติ\n  name            TEXT NOT NULL,        -- ชื่อ team ความยาว 2-120 ตัวอักษร\n  slug            TEXT NOT NULL UNIQUE, -- URL-friendly name เช่น "crafted-studio" ต้อง unique\n  billing_address JSONB,               -- ที่อยู่สำหรับออก invoice เก็บเป็น JSON (street, city, country, postal_code)\n  created_at      TIMESTAMPTZ NOT NULL, -- วันเวลาที่สร้าง team\n  updated_at      TIMESTAMPTZ NOT NULL  -- วันเวลาที่แก้ไขล่าสุด อัปเดตอัตโนมัติผ่าน trigger\n	[0.011709116,0.031242883,-0.03452838,0.0050755464,0.014738265,-0.022411954,-0.02239416,-0.032089215,0.05464894,0.0028095746,0.013461214,-0.0010805264,0.10852789,0.043552563,-0.006213523,-0.021188118,0.0017103188,0.004062398,0.008874686,-0.015528102,0.045324076,-0.050594863,0.02749742,-0.016343892,0.021066131,-0.015758112,0.013402666,-0.014457647,-0.055537447,0.027569555,0.028501935,-0.023144687,-0.0073734215,0.025692323,0.02296043,-0.002589956,-0.0022603623,-0.0051935078,-0.0069688056,-0.016312359,0.038092088,0.0063044224,0.043604262,-0.016360313,0.02155152,-0.02058425,0.05311276,0.0022442974,-0.030847233,0.004620588,0.031375803,0.010921312,0.04011971,0.008273787,-0.05230261,-0.022805737,0.023598848,0.031859066,-0.03491661,0.013800937,0.001705,0.04319456,-0.015010527,0.042102758,0.016905827,-0.03368687,0.013480182,-0.03134519,-0.04125636,-0.02036411,-0.013385983,0.018533425,0.11088733,-0.0071989517,-0.054976583,-0.005720531,-0.05581776,0.010097674,-0.014130353,0.04263306,0.065297715,-0.0022055528,0.01924789,0.02722088,-0.01741927,-0.008810262,-0.029437108,0.04687368,0.05441122,0.063278615,0.008958202,-0.04526185,-0.040326376,0.020832948,0.015048154,0.03423719,-0.0059384364,-0.0029352948,0.060497362,-0.022040982,-0.017022394,-0.09308038,0.0049603125,-0.03359826,-0.08174298,-0.03192661,-0.004404339,-0.049071994,0.044046145,-0.028815698,-0.006956779,0.0043509123,0.0044585997,-0.068674535,0.044337083,-0.069788024,0.032690812,-0.045389213,-0.00090955675,-0.067909524,-0.04793243,0.017743105,0.0037338706,-0.016428208,0.057340935,-0.03912386,-0.011525493,-0.007272248,0.025523301,-0.052531566,-0.046239484,-0.023556374,0.024867572,0.012966605,-0.0045444383,0.042462908,0.013621159,0.002039924,-0.031186558,-0.0005460386,0.053080168,-0.031331632,0.009446315,0.050820746,0.015734814,-0.04860412,-0.0058465777,0.011669721,-0.019210761,0.011635863,0.04762099,-0.049113832,-0.03233684,-0.007325019,0.007550114,0.008577185,-0.047479603,-0.010741182,0.0367752,0.04199804,0.033060927,-0.008947438,0.001762736,-0.033571206,0.039670285,0.013358532,-0.024153609,0.013487855,-0.034315452,-0.03385568,0.012186358,-0.056135748,-0.11125081,0.047709554,-0.027852125,-0.027257686,-0.010481021,-0.042799525,-0.027801462,-0.040115595,-0.06264029,0.006728593,-0.016855283,0.02271516,-0.012542538,-0.0017430101,-0.022221547,-0.037976805,0.051886316,0.0023885916,-0.0070560104,0.10276808,-0.006317404,0.04372982,0.00065750064,-0.008486393,0.036219217,0.02493848,-0.0010615643,-0.053390775,0.0099194255,-0.012586662,0.024235167,0.04623193,0.023804773,-0.06472244,-0.004571507,0.03263838,0.015417429,0.011748807,-0.03441096,0.03418459,-0.011970376,0.025639987,-0.01209182,-0.044241082,0.031465247,0.020329487,-0.010097286,0.057932697,-0.0031575083,-0.042739183,0.06084469,0.031976636,-0.018609378,0.019498821,0.021218352,-0.022136495,0.016387245,0.037202213,0.042104512,0.09743888,-0.023800576,0.04303426,-0.0013052397,-0.010604748,0.04839236,-0.009208565,-0.0061616814,-0.09705139,-0.04338582,0.011162273,0.020861562,-0.022018656,0.018131008,-0.012376961,-0.042971123,0.0305577,-0.03232445,0.011749931,0.044840816,-0.048488114,0.004149815,-0.015028373,0.03279935,0.0066640954,-0.04401898,0.012763162,0.035390656,0.0006531941,0.0037560598,-0.009046053,0.013455879,-0.03353523,0.020312995,0.010778361,0.012544594,-0.009776676,-0.060788434,0.013063238,0.036799118,-0.0199502,-0.028012821,0.01619393,0.015724983,-0.018118452,-0.05948285,0.009228367,-0.006100181,-0.06169362,-0.013773795,0.05296381,-0.062371142,-0.037323095,-0.03559087,-0.009437554,-0.04539937,-0.0024255933,-0.027303856,0.0160657,0.012265815,0.07906861,-0.0027077706,0.0037413964,0.046113178,0.033179905,0.04222878,0.0061206734,-0.03180496,0.01736742,-0.026298825,-0.027459586,0.026548183,-0.08466123,-0.007833077,0.031253293,0.11446079,-0.0062130974,-0.03403399,0.030350229,-0.019743642,-0.00046509295,-0.01901377,0.05280334,0.03203989,-0.03954352,0.02817555,0.049613427,-0.017033998,0.024581183,-0.015462009,0.016638655,-0.0057832035,-0.07676864,0.03213285,-0.04828273,0.051160097,-0.01229137,0.058388535,0.009624579,-0.027823512,0.0069009443,0.022117937,0.01807151,-0.034942858,0.0034523301,-0.07654695,-0.04848322,0.055685688,0.011496916,-0.0072947536,0.034056384,0.016679835,-0.020408379,0.07551906,-0.08103393,-0.023252016,-0.013044739,-0.0511694,0.020805292,0.02132456,-0.041335218,0.027893314,-0.022869952,-0.026449122,0.008001451,0.020932008,-0.016454427,-0.03517615,-0.004413912,-0.017807258,0.018310508,0.017531117,-0.0046374965,0.01953064,0.03899339,-0.05376641,-0.032377295,0.0073143276,0.0020861032,0.07775373,0.03954295,-0.028914528,0.0017177691,0.05003702,-0.032460723,0.024512876,-0.06383444,-0.006875939,0.038958956,0.055378586,0.04360636,0.03115611,0.047112238,-0.050067388,-0.010932268,0.021866538,-0.06556927,0.045200475,-0.011669436,0.05811716,0.018760378,-0.029312057,0.032520194,0.051722884,-0.027261812,-0.007555472,0.020173587,0.030953137,-0.051933814,0.04347094,0.013555047,-0.011325773,0.044304095,0.024479702,0.017350435,-0.03226434,0.017726915,0.026097827,-0.020477576,0.045254655,-0.06366977,0.025853802,-0.011175817,-0.00743282,-0.02175716,-0.005001981,0.04209918,0.006964962,0.012779638,-0.05527536,0.019277303,0.02172324,0.023002977,0.033008426,-0.09025366,-0.020111527,-0.011123206,-0.0027379326,-0.018074293,-0.0052957046,-0.013238356,0.028977793,0.011020447,0.010369952,-0.05206969,0.015557185,0.029522846,-0.011103557,0.005099487,0.013154816,-0.032899477,0.035479292,-0.029585157,-0.017330717,-0.0036980372,-0.039131265,0.009044681,-0.033408053,0.0071339966,-0.0129485885,-0.022186747,0.019864572,-0.0023032736,0.06129222,-0.053346083,0.04249454,-0.03760542,0.03667312,-0.117156394,0.04157379,0.05213254,0.0060602813,-0.011180078,-0.043862928,-0.08815842,0.008755666,-0.054551117,0.022121945,-0.01808693,-0.051130395,0.0061972835,0.020891728,0.03408897,0.0138556175,0.041300457,-0.013219142,0.019968934,0.018556824,-0.0065870536,0.033170607,0.0077128415,-0.050793275,0.0018294689,0.020860761,0.0438562,-0.1137497,0.039617315,0.048771318,-0.044421267,-0.04141065,0.049393896,0.043074604,-0.00035369457,-0.023103435,0.043127924,0.016043622,-0.051766083,0.0038449697,0.034860283,-0.0022747915,-0.027143974,-0.026087383,-0.011398407,-0.0146202445,0.027224753,-0.024825843,0.03464208,0.041779887,-0.036936123,0.1289823,-0.0028322395,-0.017706973,-0.029524965,0.03107865,-0.008852162,0.0062447917,0.016580176,0.043876518,-0.017307052,0.00974107,0.012303109,-0.025304008,-0.011864516,0.0319088,-0.043631714,-0.0011137807,-0.024589922,0.045297295,-0.021098176,0.018998915,-0.026455661,0.020834815,-0.11736153,-0.053340413,0.036806803,-0.010515479,-0.009893661,0.045579795,-0.037381377,0.008464118,-0.014428888,0.023552855,-0.02633604,0.018026644,-0.024578404,0.00390934,-0.04314993,-0.0066107395,-0.014726008,0.05680852,0.015541795,-0.031969473,0.052115772,-0.0075450125,0.04735575,0.0077154622,0.03786512,0.008662786,-0.03943171,0.018193657,-0.03836399,0.0023332937,0.007029554,0.003035319,-0.0060545406,0.011665881,-0.021996858,-0.006990924,0.078044295,-0.062212564,0.0068034027,0.036798242,-0.032956988,0.035303906,0.026546797,-0.029215215,-0.010422285,0.00817407,-0.05831258,-0.04685205,-0.0066734767,0.010019843,0.02111662,0.041188005,-0.003627246,0.016520359,0.012451759,-0.21592982,0.016468482,-0.026780777,-0.03895349,0.008929985,0.039145056,0.022534177,-0.016029915,-0.018103266,0.019450365,0.030378075,-0.022527903,0.03163169,-0.027329301,-0.060617656,0.018952848,-0.005730908,-0.006638448,0.029365592,0.0066666515,0.013285783,0.06137075,-0.05667625,-0.016189674,-0.018321138,-0.01635389,-0.038995985,0.013419514,0.018701153,-0.0063193524,0.033987157,-0.015716868,0.04109322,0.02817453,-0.022684248,-0.035777178,-0.012160089,-0.0022474418,-0.08906805,0.043140717,0.015038788,-0.0020410295,-0.052931406,0.0024160575,0.029806942,0.04834512,0.01291434,0.034152463,-0.025555689,0.020809717,0.003469534,0.016080957,-0.11488909,0.008680903,-0.0030824624,0.06355536,0.021369956,0.0010339766,0.010313323,-0.026090207,0.05096068,0.08156875,-0.020057412,0.008961353,-0.0189076,-0.008143426,0.054057915,-0.032223336,-0.020505887,0.014334615,0.06540235,-0.04788308,-0.0045458726,-0.009403422,0.028278856,-0.020301655,0.014453173,0.0028221754,-0.076639324,0.020419434,-0.036993995,-0.02720163,-0.01250221,0.038268633,-0.038025185,-0.017373731,-0.034756187,0.03160874,0.040076464,0.013279412,-0.017587416,-0.034748163,-0.042313367,0.03560161,0.02076528,-0.027499184,-0.043132093,0.036584567,-0.015452702,-0.019261066,0.027324818,0.013325339,-0.023915328,0.033933707,0.04893294,-0.04681682,-0.13127859,0.029092602,-0.025198609,-0.032234117,0.035071127,0.031443603,0.04624232,-0.027126368,0.0017000604,0.03057153,0.009643196,-0.027128773,-0.046323642,-0.041479416,-0.014895631,-0.02441359,-0.001712475,0.004925744,0.031044839,0.018190863,-0.020314412,0.04971188,0.0064956048,0.04353499,0.012234631,-0.08326685,0.031634472,-0.01188198,-0.038729895,0.03200263,0.0150893,-0.0075581814,0.03939666,0.010621539,0.05502434,-0.06281743,-0.03400963,0.044811156,0.0043381434,0.033211753,0.003875502,-0.012536433,0.00082478323,-0.0051614232,-0.011338001,-0.0910466,0.011689923,-0.016646586,0.0047106585,0.018144796,0.019517083,0.0345048,0.0077921697,0.03857912,-0.014013248,-0.049811777,-0.0018488738,-0.003701019,-0.0015132519,0.003317836,-0.016051522,-0.038598098,0.0051956167,0.050060846,-0.03563672,0.032495342,0.028224008,0.018454408,0.024788728,-0.028360471,0.03778584,0.004331457,-0.029292108,0.021244088]
7	project_members	Table: project_members\nDescription: junction table เชื่อม user กับ project พร้อม role user ต้องเป็นสมาชิก team ก่อนจึงจะเข้าร่วม project ได้\nColumns:\n  id         UUID PRIMARY KEY,                                        -- รหัส\n  team_id    UUID NOT NULL REFERENCES teams(id) ON DELETE CASCADE,     -- FK → teams\n  project_id UUID NOT NULL REFERENCES projects(id) ON DELETE CASCADE,  -- FK → projects: project ที่ user เข้าร่วม\n  user_id    UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,     -- FK → users: user ที่เป็นสมาชิก project\n  role       TEXT NOT NULL,                                            -- MANAGER (ควบคุม project) / CONTRIBUTOR (บันทึก time entry ได้) / VIEWER (ดูอย่างเดียว)\n  created_at TIMESTAMPTZ NOT NULL,                                     -- วันที่เพิ่มเข้า project\n  updated_at TIMESTAMPTZ NOT NULL                                      -- วันที่แก้ไขล่าสุด\n  -- UNIQUE (project_id, user_id): user อยู่ใน project เดียวกันได้แค่ครั้งเดียว\n	[0.013882419,0.026056632,-0.030468268,0.024143785,0.017525215,-0.014702072,-0.01906105,-0.052219756,0.034824803,0.006329349,0.01993924,0.020306641,0.10931524,0.03386699,-0.030082883,-0.012001504,-0.009781017,-0.00848356,0.025161445,-0.0166457,0.037683018,-0.045482438,0.03999179,-0.013387644,0.024194833,-0.028360816,0.0073162136,-0.008554129,-0.049818486,0.009979887,0.031898998,-0.025274195,-0.0020598082,0.037416957,0.020664841,0.014996221,0.010779769,-0.021420017,0.0066106347,-0.012028799,0.021920765,0.00014693564,0.02746046,-0.030089447,0.008476502,-0.0066211657,0.041015748,0.042054337,-0.0066365404,-0.019364925,0.028056972,0.005672777,0.04319845,0.009438381,-0.03204425,-0.018030569,0.034520183,0.04809888,-0.037937522,0.0071680914,0.012930102,0.038843714,-0.011998539,0.011407978,0.020221304,-0.0020535018,0.011609211,-0.028646046,-0.048245765,-0.023960836,-0.01737959,0.01730778,0.09875374,-0.018466987,-0.008200266,0.00021163645,-0.04330684,0.02397143,0.030262072,-0.015837155,0.071406975,0.029111087,0.024695361,0.0034192884,-0.009920206,-0.011941703,-0.016517628,0.04830387,0.032767646,0.048865788,0.029255953,-0.0427395,-0.03899853,0.028186401,0.029470012,0.01802941,-0.003876601,0.010825675,0.04537194,-0.041564863,0.00056838675,-0.08315399,-0.030756125,-0.032581568,-0.08453384,-0.04000905,-0.0071673323,-0.035850346,0.041946083,-0.017387342,-0.0044554435,0.0101932585,0.022714507,-0.053513397,0.04485184,-0.06150497,0.0597242,-0.058052875,0.01885611,-0.057932537,-0.050553143,0.0031786128,-0.010588085,-0.012559701,0.04583314,-0.02485226,0.009859852,0.0009957203,0.016213335,-0.043202154,-0.017998584,-0.05118941,0.027062979,0.012467849,-0.031632278,0.05921063,0.023575202,0.0011138885,0.0029117444,0.009881467,0.03808833,-0.019507876,0.0103428075,0.031561065,0.0067115407,-0.07645994,-0.011107706,0.02062251,-0.033576425,0.0073672454,0.047532983,-0.059844464,-0.04055447,-0.015776968,0.03600182,-0.008860781,-0.034012724,-0.020357464,-0.0048485226,0.04026217,0.030744057,-0.0034879944,0.022822859,-0.038422607,0.035662636,0.025922826,-0.023365958,0.027408976,-0.034220375,0.009612746,0.012932303,-0.062363144,-0.07510738,0.039006446,-0.034618232,-0.022903297,-0.0295546,-0.046644516,-0.036452208,-0.05770849,-0.07086106,0.0062641557,-0.05781748,0.026055,-0.023674814,-0.009765389,-0.025332874,-0.03570594,0.046443675,0.022358852,-0.018448519,0.055315025,0.020303067,0.037370905,0.035459973,0.012119526,0.016400715,0.018324653,0.013477407,-0.033012453,0.0141537,0.009924712,0.03804048,0.023075506,0.022257876,-0.07116777,-0.010317234,0.03592449,0.014402757,0.016124597,-0.018818172,0.01622698,-0.023869349,0.054170605,-0.019815959,-0.038196284,0.033279683,0.014383059,-0.030128404,0.04573201,-0.0027803732,-0.02409556,0.06382953,0.03359869,-0.011553712,0.02544975,0.022682901,0.0059739286,0.04062396,0.027105471,0.06885501,0.0975455,-0.049581975,0.022803951,-0.021360544,9.47986e-05,0.016537953,-0.012244253,-0.017813295,-0.10439035,-0.037301984,0.021469735,0.017585896,-0.018242093,0.03003237,-0.021589447,-0.03459907,0.02523498,-0.06116477,0.013152752,0.032609228,-0.04631736,-0.0022399002,-0.04679008,0.017714884,0.0113902055,-0.023196222,0.0243488,0.039937332,0.0048284996,0.024373338,-0.0012526993,0.013486519,-0.038325164,0.029951334,-0.004376337,0.018648885,-0.0218571,-0.067198426,0.009652216,0.009284222,-0.0134947095,-0.041754507,-0.004718291,0.016640475,-0.0100743435,-0.056337517,0.012848979,-0.019931147,-0.045163162,-0.028012589,0.043886174,-0.07318649,-0.035821274,-0.018646158,-0.012325778,-0.039410785,-0.0026066506,-0.0401222,0.009633682,0.0108108595,0.08681467,-0.02529265,0.012934816,0.055486307,0.013886422,0.038037702,0.023236267,-0.013712459,-0.014106941,-0.0133591695,-0.022500549,0.047897223,-0.05999813,-0.014526731,0.033374492,0.12489538,0.014628463,-0.03803578,0.040613934,-0.026911302,-0.024363032,-0.027952956,0.028344799,0.021655703,-0.03539716,0.0026855627,0.06162469,-0.0108597595,0.047373783,-0.0290501,0.03894477,-0.016726553,-0.071117654,0.027498052,-0.053609136,0.034285717,-0.007832899,0.06801303,0.034911554,-0.01418151,-0.009347597,0.014513125,0.034671783,-0.029229263,0.034635354,-0.056370623,-0.06416185,0.06366943,0.0010990321,-0.022319801,0.023776583,0.023272205,-0.02346714,0.06258285,-0.07008656,-0.028455285,-0.07200148,-0.027612384,0.0092462255,0.029007861,-0.05634652,0.011349794,-0.024395194,-0.027118634,0.012823808,0.006903693,0.00044538977,-0.013401714,-0.011393118,-0.01704588,0.026114805,0.015012329,0.0031766952,0.007148559,0.021569334,-0.071155146,-0.02100733,-0.0046692905,0.007995503,0.116413124,0.040854096,-0.04912497,-0.0066578537,0.04214241,-0.041089535,0.026560774,-0.07317287,-0.010635521,0.0364792,0.049440373,0.0402236,0.028631259,0.040388145,-0.039082773,-0.013463164,0.03347598,-0.050974395,0.016312046,-0.004150781,0.04223838,0.006077142,-0.009742876,0.05606947,0.043198023,-0.026174186,0.027431678,0.005398905,0.013859593,-0.036503386,0.040854562,0.027174361,0.0041918224,0.053597543,0.036510173,0.006990559,-0.0011260797,0.04518958,0.037165985,-0.030082732,0.04947408,-0.06454341,0.05471823,0.027012862,0.007073259,-0.024234459,0.0075739347,0.037564043,-0.0154121155,0.016560744,-0.05352149,0.007207922,0.032295126,0.020126443,0.028454894,-0.08910368,-0.0029230197,-0.015216223,-0.013443335,-0.0013869406,-0.025756946,0.008737575,0.010577918,0.014141279,0.032150216,-0.04740684,0.013259101,0.018900197,-0.022553314,-0.005486508,-0.00636499,-0.045256086,0.0071095903,-0.011374663,-0.024027588,-0.022162007,-0.021433968,0.015040293,-0.052997995,-0.015376371,-0.007974892,-0.0047575664,0.013205157,-0.0055057565,0.03279297,-0.060464222,0.033276595,-0.03419357,0.022925708,-0.12330533,0.035055,0.033265963,-0.023915188,-0.017518997,-0.04478682,-0.078938596,0.021333832,-0.061592344,0.044315297,0.0015542018,-0.033696454,-0.009665674,0.0025397239,0.044194125,0.016245496,0.04153958,-0.023805045,0.028033642,0.020096404,0.0013940202,0.030866839,-0.017834738,-0.023377264,-0.004285634,0.0071630627,0.04734386,-0.08441554,0.031176949,0.04356523,-0.045187477,-0.04230122,0.026433574,0.06041661,-0.0020106044,-0.029093863,0.022680344,0.0074931365,-0.051619764,0.06152876,0.031959437,-0.008080007,-0.03816342,-0.04291856,-0.013908294,-0.027618032,0.01212969,-0.04103124,0.036989577,0.046871584,-0.050819594,0.118614644,-0.0027643042,-0.01874533,-0.018806867,0.0126187205,-0.0017858709,0.0035810198,0.027801018,0.0075199795,-0.015480751,-0.025487263,0.011403935,-0.0499739,-0.029543344,0.019252552,-0.05657467,0.009707454,-0.027989227,0.049840268,-0.036675304,0.02118762,-0.06275636,0.01926126,-0.09747711,-0.06598269,0.036838293,-0.0074886894,-0.030282883,0.023288049,-0.041007686,0.008852431,-0.019436182,0.04745508,-0.02918483,0.022906115,-0.040175162,0.016845,-0.016860463,-0.016686914,0.016826496,0.059289917,-0.012491453,-0.022401702,0.058405917,-0.03806887,0.04017318,0.020034099,0.01201,0.0015684679,-0.037032817,0.010652578,-0.021748805,0.013747061,0.004204102,0.0018069167,-0.0056038243,0.031565353,-0.026417373,-0.0103722755,0.062166214,-0.07703526,0.03654731,0.046542883,-0.025629131,0.039143387,0.024943054,0.0024452957,-0.0049044644,0.00605417,-0.059924755,-0.06180226,-0.017293954,-0.009758994,0.037993964,0.036435492,0.0027358185,0.033764362,0.024050951,-0.21001536,0.0014213079,0.004945934,-0.033961568,0.00018642306,0.025959905,0.00614657,-0.019147094,-0.00724857,0.0024690712,0.04608748,-0.036251217,0.0028243696,-0.023352098,-0.056349292,0.020368464,-0.01125601,-0.03480877,0.028148292,0.057706468,-5.1380506e-05,0.06398311,-0.038757794,-0.01199894,-0.027085546,-0.0032441677,-0.0068183825,0.031750765,0.027938664,-0.0052831476,0.03801412,-0.0013860773,0.039718095,0.024845725,-0.01890956,-0.035861477,-0.013832643,0.010956013,-0.07577413,0.041865274,0.011623609,-0.012284644,-0.060398433,0.012974049,0.01963584,0.05747682,0.036048554,0.04522414,-0.030773612,0.00026445373,0.006143508,0.0048348056,-0.08498641,0.020413348,0.005976304,0.08818526,0.02244696,0.016873881,0.053683784,-0.023401298,0.043469768,0.06388693,-0.02409101,-0.00831821,-0.011196734,0.022857923,0.055490203,-0.045478567,-0.011028198,-0.00867966,0.050145682,-0.03602847,-0.019344259,0.00311441,0.024034198,-0.032917246,0.00321316,-0.0063114865,-0.09231175,0.0021487086,-0.034199454,-0.023451364,0.0058845556,0.03435591,-0.02684126,-0.027596954,-0.051666427,0.026891466,0.04900403,0.0294965,-0.023205886,-0.04804591,-0.034567166,0.007245264,0.0013849798,-0.02990099,-0.037729923,0.035406623,-0.010352847,-0.026238268,0.01492877,0.026580209,-0.041012622,0.021998452,0.04376394,-0.051424075,-0.11375661,0.008084398,-0.018284976,-0.035588533,0.052346684,0.011310905,0.034007777,-0.014979818,0.0017523479,0.009756642,0.022954684,-0.027846022,-0.022109848,-0.025962919,-0.013171938,-0.02382158,-0.0032402626,-0.010635489,0.020317439,0.012036993,-0.03982302,0.044655167,0.011990268,0.037464354,-0.0015953261,-0.07847319,0.053345013,-0.022910602,-0.025686951,0.030273123,0.032487154,-0.0084737195,0.04913978,-0.0003453844,0.0702037,-0.05426597,-0.04593117,0.032895993,-0.0009754405,0.018797822,-0.014981786,-0.012037905,0.033700265,-0.017720873,-0.009506473,-0.092885785,0.02461788,-0.016555006,-0.0061855665,0.028772905,0.03745449,0.046385042,0.00706763,0.027776577,-0.01983165,-0.040533815,-0.018031485,0.022238908,0.0050509935,0.006293764,-0.017697588,-0.033790447,0.025113901,0.0334055,-0.03430757,0.063995175,0.030850755,0.011969691,0.027602207,-0.024421226,0.04088641,-0.00063508516,-0.03108374,0.031562936]
8	project_tasks	Table: project_tasks\nDescription: งานย่อย (task) ภายใน project แต่ละ task มี status, billable flag และกำหนด hourly rate ของตัวเองได้ (override rate ของ project)\nColumns:\n  id                UUID PRIMARY KEY,                                        -- รหัส task\n  team_id           UUID NOT NULL REFERENCES teams(id) ON DELETE CASCADE,     -- FK → teams\n  project_id        UUID NOT NULL REFERENCES projects(id) ON DELETE CASCADE,  -- FK → projects: project ที่ task สังกัด\n  name              TEXT NOT NULL,                                            -- ชื่อ task ความยาว 1-255 ตัวอักษร unique ภายใน project (case-insensitive)\n  description       TEXT,                                                     -- รายละเอียดของ task\n  status            TEXT NOT NULL DEFAULT 'active',                           -- สถานะ: active / completed / on_hold / archived\n  billable          BOOLEAN NOT NULL DEFAULT TRUE,                            -- true = เวลาที่บันทึกในงานนี้คิดเงินลูกค้า / false = งาน internal ไม่คิดเงิน\n  hourly_rate_cents INTEGER,                                                  -- ราคาต่อชั่วโมงเฉพาะ task นี้ หน่วยสตางค์ ถ้ามีค่าจะ override ราคาของ project และ client\n  tags              TEXT[] NOT NULL DEFAULT '{}',                             -- array ของ tag\n  order_index       INTEGER                                                   -- ลำดับแสดงผลใน UI\n	[0.012406489,0.032629237,-0.009437901,0.012898556,0.022065515,-0.026377201,-0.031732216,-0.024370102,0.038831487,0.041734267,0.03586434,0.022319326,0.11328686,0.05030186,-0.017565183,-0.034946017,0.007136852,-0.02419566,0.014169871,-0.021429026,0.029771965,-0.040423103,0.030998545,-0.002311877,0.035878856,-0.014138098,0.017295301,-0.012891404,-0.04283218,0.03096486,0.034084063,-0.008137583,-0.006777237,0.014720213,0.0114471,0.0028295186,-0.0006656774,-0.034347944,-0.0032282893,-0.0064614504,0.03660931,-0.01968762,0.04536513,-0.028821982,0.017545031,-0.0198993,0.05478185,0.018422948,-0.012824865,-0.022306882,0.022113688,0.013731552,0.028427545,0.027531475,-0.037485413,-0.010375848,0.04954122,0.028518587,-0.033985455,-0.0010547723,0.0042246636,0.04677982,0.0032527626,0.023673473,0.02015042,-0.01410777,0.028981963,-0.034563877,-0.057773322,-0.021473043,-0.022740876,0.02712227,0.095696606,-0.0171196,-0.027182138,-0.004407629,-0.03140198,0.011187687,0.022331098,0.004136726,0.057126235,0.02175898,0.014166231,0.050593186,0.018002618,-0.0002635507,-0.03146621,0.050199714,0.04502849,0.026406517,0.02051376,-0.028624447,-0.053473204,0.02330787,0.024302302,0.024868475,-0.005753266,0.008089033,0.03619717,-0.024112107,-0.009481996,-0.0690603,-0.0042551933,-0.03323292,-0.08591956,-0.028468974,-0.008006275,-0.04697044,0.038165547,-0.009901851,-0.021599768,-0.005743389,0.016778506,-0.04325367,0.038123965,-0.07359376,0.06837826,-0.058454882,-0.0068037775,-0.07020566,-0.042323038,0.015701523,-0.009609962,-0.023192024,0.039062407,-0.02056372,-0.012695612,-0.020515924,0.015850307,-0.06781591,-0.009292435,-0.017882654,-0.003627286,0.008957087,-0.013156668,0.06177284,0.028563062,0.010326451,-0.006380672,0.022427067,0.015761903,-0.035509653,0.008553579,0.05083379,0.013717825,-0.06745736,-0.022128887,0.022975814,-0.013460736,0.022849482,0.04283269,-0.060559943,-0.040369615,-0.0032833677,0.06132631,-0.0067762616,-0.04799056,-0.0014315316,0.015036089,0.02787616,0.029391343,-0.00378381,0.024429275,-0.035743557,0.042298596,0.008714394,-0.033774793,0.018540595,-0.049328625,-0.011270517,0.018822502,-0.043649055,-0.07524932,0.03877625,-0.027894365,-0.02268297,-0.022938607,-0.025389275,-0.01730295,-0.036209997,-0.06975788,0.010836141,-0.043080218,0.024063678,-0.014602428,-0.0143132275,-0.021679576,-0.021292375,0.049919184,0.02061525,0.00021874813,0.09604544,0.017775794,0.02908404,0.02450387,-0.0025988377,0.03712757,0.0059688566,0.0086958455,-0.025821168,0.0040242025,-0.0052486868,0.019100567,0.045282878,0.008688694,-0.052463338,-0.009178159,0.02511704,0.008331343,0.012057229,-0.01744307,0.021406166,-0.038137447,0.047057275,-0.026753057,-0.06196128,0.0356975,0.019276531,-0.022989366,0.051005363,0.005855862,-0.065829575,0.07516817,0.03590892,-0.022730438,0.0071831485,0.020687653,-0.004945695,0.022595389,0.022927439,0.045044255,0.09733749,-0.046773717,0.017420638,-0.030135099,-0.01725662,0.064376935,-0.021219237,-0.023727307,-0.10282515,-0.055778384,0.021662682,0.016134677,-0.023528533,0.032159463,-0.020251665,-0.040260218,0.030635413,-0.058145273,0.02998226,0.033785544,-0.050337836,0.007752228,-0.015216236,0.025721096,-0.0019864936,-0.044982683,0.008154847,0.061058022,-0.00013146938,-0.0029520374,0.0010765808,0.015008662,-0.031625994,0.032718655,0.002656336,-0.0052756593,-0.034873195,-0.06536131,0.008676753,-0.002063444,-0.024563104,-0.04188053,0.011281806,0.0037655183,5.633884e-05,-0.059467148,0.024107315,-0.008730385,-0.05554696,-0.018270837,0.03862964,-0.07513708,-0.025170866,-0.031069294,0.0033286184,-0.05138394,0.004948202,-0.02512691,-0.00609918,0.013295283,0.08159548,-0.0058518066,0.0028470792,0.07310052,0.007974414,0.007892588,0.012859023,-0.018904658,-0.0067611835,-0.02466729,-0.021639988,0.04193717,-0.043166485,-0.03850008,0.023380788,0.12260027,0.026413253,-0.06191889,0.03306328,-0.0077653625,-0.013432816,-0.00973741,0.042172655,0.032093737,-0.05693977,0.016077593,0.058079336,-0.010095643,0.03453155,-0.023109922,0.038164314,-0.013653926,-0.09341146,0.043599524,-0.046617374,0.03275005,0.0015872975,0.050948296,0.029675314,-0.010361884,-0.0063430076,0.02132946,0.019591706,-0.034760714,0.041030303,-0.06358192,-0.055515084,0.060337957,-0.007343221,-0.017927859,0.04638441,0.03227178,0.011772936,0.06361132,-0.077216126,-0.022184703,-0.054473117,-0.05516927,0.014662591,0.013839959,-0.04595335,0.004639022,-0.032296672,-0.03548972,0.01480718,0.012153008,-0.018224522,-0.00043822455,-0.014324726,-0.0027066665,0.019471109,0.014982928,-0.015042145,0.020876562,0.030055474,-0.052844953,-0.034740932,0.0066328417,0.0048786285,0.08672397,0.055849478,-0.033357985,0.0004928463,0.047912017,-0.028623238,0.016241139,-0.07213347,-0.010015838,0.041421704,0.038446937,0.03148426,0.032733075,0.033654645,-0.0409283,-0.006854353,0.018627824,-0.05603311,0.0407703,0.003287195,0.035283066,0.0057725264,-0.014817012,0.055683065,0.03504821,-0.054000426,0.0045751208,0.014663624,0.008893531,-0.042725697,0.054045927,0.022581054,-0.013855938,0.05102315,0.044089507,0.014086705,-0.013394182,0.047616113,0.034663167,-0.02222176,0.021919215,-0.05429472,0.04882115,0.013427126,0.02142662,-0.027844666,0.017575404,0.05039969,7.0837166e-05,0.014373221,-0.06803417,0.0043476764,0.021546077,-0.0008457492,0.036204666,-0.075488456,0.011897315,-0.010472367,-0.019717136,0.0063139065,-0.010929755,0.020521874,0.015833005,0.016085288,0.031676464,-0.043365657,0.024929175,0.01655008,-0.011252848,-0.0016543806,-0.023108,-0.03428465,0.018130632,-0.009797299,-0.019256182,0.009326899,-0.03499139,0.013173189,-0.037487157,-0.015983528,-0.016681425,-0.011621532,0.011441135,-0.019387865,0.024832234,-0.052489944,0.065708764,-0.0007788869,0.0138924895,-0.122009605,0.004034718,0.031735916,0.014674921,-0.016486997,-0.04693156,-0.06397836,0.022700228,-0.075456016,0.038128342,0.0057393853,-0.026854558,-0.009791843,-0.023870118,0.035582226,0.009270954,0.042545266,-0.004121685,0.034246527,0.022784773,-0.017216798,0.039965212,-0.03225501,-0.046593115,-0.002622171,0.006025403,0.05723481,-0.106904015,0.024318494,0.04055321,-0.0467033,-0.020580716,0.044530857,0.032627963,-0.0074454793,0.0013765122,0.038999017,0.019664144,-0.06688706,0.06319124,0.038133845,-0.02303914,-0.046046942,-0.045001246,0.008223518,-0.03713747,-0.008001096,-0.022667503,0.021288767,0.034241892,-0.040919874,0.12816912,-0.009749019,-0.030799745,-0.015772378,0.01659493,0.010482146,-0.01941676,0.028830046,0.014515417,-0.032483432,-0.02341458,0.030252911,-0.017333109,-0.020957489,0.014857517,-0.0468833,0.016971255,-0.03548796,0.051591065,-0.005014963,0.022650726,-0.030791067,0.018856386,-0.12292996,-0.08024902,0.041030403,-0.023199612,-0.013510746,0.0248948,-0.031699628,0.004201556,-0.01498872,0.017218048,-0.03143126,0.016384639,-0.055893634,0.026721809,-0.0061693355,-0.013790356,-0.012107379,0.05593549,-0.02263631,-0.02915371,0.060488928,-0.013478293,0.06603318,0.016373828,0.015163498,-0.0070737903,-0.024405107,0.007652155,-0.0332625,0.010075657,0.014138542,0.008624871,-0.016502377,0.036208577,-0.026887484,-0.015912814,0.061146356,-0.0600858,0.025900997,0.042556033,0.0023653517,0.022344671,0.015358983,-0.007958009,-0.010886226,-0.014655032,-0.05065016,-0.060901802,0.009361296,0.013702528,0.021364816,0.0506398,-0.005369712,0.01973442,0.018472021,-0.20218316,0.016950948,-0.005365922,-0.04191287,-0.010453842,0.037068993,0.0174622,-0.028342986,0.0026404036,0.0381399,0.034991622,-0.040312782,0.02680941,-0.02505611,-0.039047647,0.0033603834,-0.0021487689,-0.012293687,0.009999081,0.015525481,0.0036588209,0.06812007,-0.036803305,-0.016757367,-0.03304785,-0.034299016,0.013272169,0.019226605,0.021424873,0.0025069478,0.036643665,-0.0151464725,0.048313513,0.010711081,-0.027172452,-0.0196932,-0.0032561286,-0.0039324854,-0.10374781,0.03200647,0.02903732,-0.0055593806,-0.051602952,0.016102921,0.0014322953,0.05863453,0.018815622,0.04318081,-0.02610506,-0.004531892,0.025656618,0.0063460623,-0.09264762,0.0039770366,-0.007964373,0.058583368,0.02064117,0.004708731,0.02710135,-0.029737487,0.05186709,0.054697108,-0.012068815,-0.0005246748,-0.011279769,0.0062570125,0.054999765,-0.023014197,-0.005321261,0.0062923124,0.054334514,-0.03749174,-0.014537767,-0.013601996,0.04023911,-0.022585243,0.015451934,-0.007855818,-0.059676416,0.010405741,-0.044198483,-0.047459263,-0.019317804,0.038706046,-0.041655365,-0.030964848,-0.06445782,0.016844284,0.02843539,0.020124437,-0.0082177175,-0.04796308,-0.02004167,0.0021362419,0.02529315,-0.019842107,-0.04480236,0.017216926,-0.025886644,-0.000837578,0.030093983,0.01183271,-0.031545963,0.038415585,0.047617137,-0.04735351,-0.11332508,0.028619299,-0.032681946,-0.04002582,0.046815664,0.03251539,0.048866067,-0.026374498,0.0066019627,0.006994335,0.019030048,-0.050528165,-0.026149904,-0.04711053,-0.018348858,-0.03516264,0.0022315264,0.009884551,0.028564263,0.022244833,-0.03519888,0.06034286,0.011998496,0.030141236,-0.0034390085,-0.06960399,0.032563534,-0.016242584,-0.027098434,0.029192796,0.003065133,-0.0031841034,0.019530741,0.019358251,0.0725345,-0.05195224,-0.015382271,0.061904363,-0.0052620443,0.011004984,-0.017045947,-0.015366904,0.007310176,-0.029938655,-0.026788767,-0.10275468,0.010831452,-0.013766174,-0.02596982,0.029562557,0.014034708,0.033989944,0.011959499,0.039586097,-0.034631312,-0.054435827,-0.003949654,-0.012732325,-0.007933575,-0.007385132,-0.000888037,-0.04251362,0.023462288,0.033743076,-0.030576041,0.06309078,0.0312355,0.021362185,0.02210403,-0.0065448224,0.049054943,-0.0035160284,0.0010913098,0.034455735]
9	projects	Table: projects\nDescription: งานหรือโครงการที่รับจาก client มี status, budget, timeline และ tag มี rate ค่าบริการเป็นของตัวเอง (override จาก client)\nColumns:\n  id                        UUID PRIMARY KEY,                                      -- รหัส project\n  team_id                   UUID NOT NULL REFERENCES teams(id) ON DELETE CASCADE,   -- FK → teams: team เจ้าของ\n  client_id                 UUID NOT NULL REFERENCES clients(id) ON DELETE CASCADE, -- FK → clients: client เจ้าของ project\n  name                      VARCHAR(255) NOT NULL,                                  -- ชื่อ project unique ภายใน team (case-insensitive)\n  code                      TEXT,                                                   -- รหัสย่อ project เช่น GL-001, FF-002\n  description               TEXT,                                                   -- รายละเอียด project\n  status                    TEXT NOT NULL DEFAULT 'active',                         -- สถานะ: active / completed / on_hold / archived\n  color                     TEXT,                                                   -- สี hex สำหรับแสดงใน UI เช่น "#4CAF50"\n  tags                      TEXT[] NOT NULL DEFAULT '{}',                           -- array ของ tag เช่น {web, nextjs, ecommerce}\n  default_hourly_rate_cents INTEGER,                                                -- ราคาต่อชั่วโมง default หน่วยสตางค์ override ค่าจาก client\n  budget_type               TEXT,                                                   -- ประเภท budget: none / hours / amount\n  budget_hours              INTEGER,                                                -- จำนวนชั่วโมงสูงสุด ใช้เมื่อ budget_type = 'hours'\n  budget_amount_cents       INTEGER,                                                -- วงเงิน budget สูงสุด หน่วยสตางค์ ใช้เมื่อ budget_type = 'amount'\n  start_date                DATE,                                                   -- วันเริ่มต้น project\n  due_date                  DATE,                                                   -- วันกำหนดส่ง project\n  archived_at               TIMESTAMPTZ                                             -- ถ้ามีค่า = project ถูก archive แล้ว\n  -- Rate resolution order (ลำดับความสำคัญของราคา): task > project > client\n	[0.013572731,0.03509857,-0.01479509,0.01905884,-0.008873019,-0.013630053,-0.023975536,-0.032723688,0.025632218,0.05263302,0.029801298,0.0249624,0.11736353,0.041374337,-0.026656255,-0.045515627,-0.0022105249,-0.016400926,0.016665855,-0.0166769,0.051322255,-0.035788145,0.04135607,-0.018258916,0.031070298,-0.011638209,0.009081892,0.00059557514,-0.06231893,0.03200807,0.035368945,-0.014679718,0.007961627,0.047330435,0.014457317,0.021648921,0.002508651,-0.03476422,-0.0063327663,-0.0066543715,0.034118064,-0.0003744032,0.053567402,-0.048803296,0.027508454,-0.022791732,0.055988923,0.012666411,-0.006819176,-0.019261237,0.030414574,0.010852815,0.04646414,0.0151641965,-0.04652744,0.002877874,0.048337065,0.035667,-0.028317034,-0.014548804,0.0065446347,0.043264262,-0.007825714,0.027702654,0.019333554,-0.00518121,0.018083017,-0.03896409,-0.065615185,-0.028230352,-0.018618308,0.011817112,0.10257231,-0.014321094,-0.004466123,-0.0047569424,-0.034694906,0.0031163502,0.01607282,-0.010314984,0.0678525,0.03292433,0.0038011894,0.04651524,0.022321386,-0.0046670535,-0.04842225,0.04134752,0.042102944,0.019413065,0.018737912,-0.030652653,-0.027348094,0.020753417,0.020901538,0.021172887,0.0033425095,-0.0044666654,0.037922397,-0.025223467,-0.010509966,-0.07429035,0.0014990593,-0.025783189,-0.10050997,-0.030984243,-0.024037685,-0.039397594,0.046639826,-0.029045865,-0.034204382,0.0035464126,0.029541356,-0.029525463,0.03125522,-0.067950614,0.061345518,-0.049294576,-0.011478529,-0.05512813,-0.03364856,0.006108327,-0.0057954644,-0.025837062,0.02980968,-0.02200301,-0.0053362455,-0.01039429,0.02295843,-0.07579959,-0.016278075,-0.029280188,-0.0059831887,0.011440514,-0.006591384,0.0684904,0.028861076,0.014733489,-0.010287934,0.013130623,0.023405993,-0.033976976,0.005831888,0.063648,0.021702165,-0.052874614,-0.016591687,0.016606404,-0.017110227,0.013028284,0.0466214,-0.064013585,-0.035851303,-0.0018503454,0.051868785,0.0032596965,-0.052186027,-0.011873768,0.021694267,0.021505775,0.031816285,0.0064250967,0.008935828,-0.02780626,0.046931263,0.011306917,-0.020792095,0.014762887,-0.043665223,-0.017499268,0.011080944,-0.044675753,-0.066184245,0.0363477,-0.0065314393,-0.026649352,-0.02338404,-0.03163099,-0.023090575,-0.048884634,-0.05804568,0.005300663,-0.05318951,0.025013147,-0.022716453,-0.019095315,-0.03397845,-0.01616672,0.04026164,0.013171877,0.0071267127,0.08915894,0.026913483,0.031628832,0.03430653,-0.0057430654,0.03162323,0.015009547,-0.007886142,-0.045779552,0.021543665,-0.010307752,0.028410895,0.044349987,0.005839002,-0.05183056,0.012041496,0.03703522,0.0031151094,0.02240944,-0.003794311,0.024892913,-0.045871094,0.046307337,-0.025823692,-0.07486279,0.028093709,0.02111682,-0.030640326,0.053343028,0.0051733376,-0.07845666,0.07125159,0.036517657,-0.01420498,0.0029745658,-0.0022455866,-0.0079092,0.029518813,0.011177465,0.040269215,0.09210904,-0.04458906,0.017576683,-0.031055829,-0.007776984,0.05936415,-0.015313389,-0.017587721,-0.09574347,-0.06115853,0.026216667,0.010458234,-0.020108066,0.029718215,-0.028119994,-0.0414985,0.04185156,-0.07526272,0.022944007,0.026391847,-0.064453736,0.005966703,-0.018451273,0.018949872,0.0009992187,-0.030196229,0.00025255393,0.054332547,0.0011353679,0.0050545237,0.0011137227,0.015872441,-0.03168491,0.025560189,-0.012055062,-0.0020171076,-0.018822365,-0.060327478,-0.004160906,-0.0021132955,-0.031623423,-0.0416912,0.0057439995,0.0015058527,-0.011337791,-0.059317518,0.011267877,0.0030178875,-0.059539218,-0.027803304,0.039271835,-0.07271301,-0.01663598,-0.025824253,-0.00021426995,-0.060878284,-0.009418094,-0.029268362,0.011269606,0.010694739,0.09590423,-0.010932577,0.0041021644,0.06660056,0.0076001,0.020660348,-0.002642452,-0.0025190287,-0.009304982,-0.011995833,-0.020273177,0.030183537,-0.054498922,-0.020039957,0.022200251,0.124300696,0.027501222,-0.06120205,0.04149356,-0.021574274,-0.006056265,0.00486367,0.037746217,0.043780033,-0.061848383,0.014976497,0.050711803,-0.011405019,0.039812375,-0.023844153,0.0357913,-0.015792804,-0.08733029,0.032675687,-0.037791226,0.02584469,-0.015935635,0.03857301,0.032331266,-0.010746165,-0.002192976,0.03683596,0.037582576,-0.039596,0.037896365,-0.07491355,-0.05155972,0.059467625,-0.00849652,-0.013118275,0.036356814,0.053797275,-0.016812317,0.054659054,-0.07958774,-0.02420609,-0.07404675,-0.051083893,0.014905556,0.009965263,-0.06908521,0.017215088,-0.023677247,-0.042766437,0.02415523,0.018698702,-0.0038194992,-0.011756432,-0.017574858,-0.008075632,0.01589666,0.027743323,-0.020626785,0.024680449,0.02972493,-0.057075527,-0.03534331,0.005735777,-0.00991687,0.07863808,0.062968984,-0.019439843,0.0032373061,0.050571546,-0.024379415,0.017431976,-0.079206444,-0.004755205,0.056689158,0.04054219,0.02266517,0.04880266,0.051074136,-0.036878888,-0.016659368,0.021388547,-0.05665779,0.04790321,-4.0154788e-05,0.044182174,-0.0023220386,-0.017448163,0.057779085,0.05847918,-0.03957582,-0.00058552914,0.013313669,0.022489343,-0.049293548,0.057144195,0.024411853,-0.016096385,0.05417373,0.036185976,0.022869814,-0.026034571,0.036897894,0.015593791,-0.02532362,0.0345189,-0.037123334,0.057800632,0.0055097053,0.022386124,-0.019620653,0.01989525,0.055550702,-0.024937589,0.019776383,-0.072343536,0.016441913,0.015389936,0.0015551503,0.029121544,-0.06800412,0.010423998,-0.0117942225,-0.012413265,0.012772532,-0.01027528,0.006639657,-0.0014531428,0.010074513,0.030013349,-0.04798746,0.020070791,0.016869174,-0.027102802,0.0057233935,-0.029913694,-0.016377775,0.014302369,0.001924525,-0.025297578,-0.004312046,-0.02194015,0.0047989455,-0.04377225,-0.017012266,-0.02374911,-0.0037242805,0.01071668,-0.026363473,0.02326286,-0.04689371,0.051466912,0.0037040333,0.005296629,-0.12175678,0.019929972,0.023130499,0.02162048,-0.007098422,-0.026384123,-0.050148454,0.029640898,-0.052832913,0.024290256,-0.002404558,-0.048713673,-0.009143067,-0.018298538,0.034209397,-0.009355791,0.048373375,-0.008000619,0.03417713,0.024247117,-0.010694751,0.042859487,-0.034191065,-0.046743713,0.018566975,-0.004338437,0.048431337,-0.10784507,0.040075663,0.048483077,-0.053408902,-0.024767915,0.036964007,0.03335275,-0.022532638,-0.00079337746,0.05798602,0.012258158,-0.056719746,0.054460976,0.045800697,-0.03902981,-0.03050945,-0.04753965,0.0035714617,-0.03460124,0.0022992028,-0.028737316,0.035496965,0.0447447,-0.037237003,0.12520503,-0.015934832,-0.021023368,-0.028476894,0.015220356,0.008353998,-0.016597964,0.02136049,0.00070273696,-0.019300444,-0.031087855,0.025993345,-0.019082403,-0.030913668,0.033578634,-0.042837285,0.012936323,-0.04314817,0.05888743,-0.009183635,0.02638198,-0.038212188,0.010044286,-0.11836807,-0.06494228,0.04217709,-0.032634567,-0.0174742,0.030562896,-0.024949228,-0.0005448304,-0.011344378,0.0031273158,-0.017544204,0.009879216,-0.055376526,0.0430389,-0.015390054,-0.02284082,-0.03162661,0.049923755,-0.007069523,-0.041686546,0.054898344,-0.004244729,0.053971507,0.024915189,0.008257412,0.0016813054,-0.04336153,0.0054229493,-0.03762892,0.018298732,0.004855986,0.008379091,-0.0029416215,0.03207067,-0.014368643,-0.025525475,0.06480624,-0.069307335,0.031211149,0.038594805,0.0039179805,0.035788283,0.023152811,-0.010469352,-0.01525911,-0.0057256888,-0.043956187,-0.05310596,0.0076831966,0.007895808,0.035446383,0.030712055,-0.0017840288,0.011429003,0.027422547,-0.18490511,0.016110778,-0.008094019,-0.047397558,-0.007305394,0.021406384,0.01787705,-0.02721511,0.0021938493,0.039204735,0.029036328,-0.044544064,0.027376993,-0.030909885,-0.037178975,-0.005225996,0.015306101,-0.020092402,0.019229822,0.013042238,-0.005402455,0.05365587,-0.037114013,-0.02249726,-0.028526748,-0.026350984,-3.2233496e-05,0.009274287,0.012959367,0.015050203,0.026093235,-0.005984242,0.040552545,0.011598502,-0.021823961,-0.01256148,-0.010716291,-0.0004877652,-0.10404828,0.037174642,0.035296094,-0.018645104,-0.048983958,0.017650275,0.0021274295,0.044126347,0.025991123,0.035054017,-0.017482722,-0.009836557,0.016776133,0.016972657,-0.09142743,0.010003648,-0.0032673301,0.06277446,0.025247386,0.022512367,0.03409412,-0.024529343,0.041305497,0.06543058,-0.006081662,-0.004444869,-0.008199003,0.012094722,0.05139724,-0.026223823,-0.004220657,0.00012071224,0.048300654,-0.046175733,-0.008796782,-0.01257794,0.037047498,-0.033472832,0.014913876,-0.01959564,-0.06020127,0.0026384601,-0.058079544,-0.019256802,-0.0052120383,0.04414785,-0.034168422,-0.0418819,-0.066872686,0.01816047,0.039825547,0.028765872,-0.018933777,-0.034413658,-0.002762779,-0.0018078719,0.025990617,-0.022323398,-0.061891027,0.018537715,-0.017630417,-0.023042243,0.024537414,0.010894706,-0.031894386,0.032090273,0.054262217,-0.04620337,-0.09965418,0.020877618,-0.03489639,-0.04018612,0.06383621,0.03565254,0.054654412,-0.022892842,-0.0027761234,0.0010259546,0.019980676,-0.03218896,-0.026182307,-0.042763002,-0.0074640866,-0.019033847,-0.0028095865,0.018759092,0.0147461,0.019371936,-0.049813107,0.057362128,0.0054589347,0.018052824,0.016816087,-0.064604566,0.03080498,-0.003626405,-0.0067250454,0.03135205,0.017986784,-0.012689799,0.030520942,0.0194321,0.062142365,-0.04586833,-0.026691379,0.04076765,-0.014948754,0.012980962,0.000341664,0.0034237301,0.0061327447,-0.035449155,-0.01806622,-0.0880895,0.0072377967,-0.014344589,-0.01070182,0.023736399,0.016119583,0.034783516,0.019337486,0.029162493,-0.011298732,-0.05097148,-0.021137023,0.0020952832,-0.004312209,-0.00041121445,0.0002560612,-0.03233625,0.017392622,0.022550203,-0.0332454,0.066107444,0.043994788,0.024340862,0.009450728,-0.024332734,0.04368603,-0.009236842,0.0009251312,0.03735006]
10	sessions	Table: sessions\nDescription: session การ login ของ user ใช้สำหรับ authentication ระบบ session-based\nColumns:\n  id         VARCHAR(255) PRIMARY KEY,                                -- session token สุ่มสร้าง ใช้เป็น cookie\n  user_id    UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,   -- FK → users: user เจ้าของ session\n  expires_at TIMESTAMPTZ NOT NULL,                                   -- วันหมดอายุของ session\n  created_at TIMESTAMPTZ NOT NULL   	[0.022272054,0.019350922,-0.01984081,0.036244247,0.018737784,-0.04720345,-0.030666437,-0.009871223,0.05437756,0.038813513,0.016729256,0.023829078,0.12577467,0.04789078,-0.00791622,-0.025729423,-0.012584821,-0.019574787,0.002825606,-0.008864605,0.0310733,-0.033313982,-0.0061764675,-0.016131705,0.025494331,-0.04276699,0.0008080054,-0.005005638,-0.051616766,0.019630603,0.016083615,-0.012458871,-0.015972327,0.057225663,0.024671517,0.014740041,-0.009836201,-0.005801532,0.018971108,-0.0069758478,0.010428003,0.009910638,0.046356462,-0.05762203,0.009635873,-0.017697934,0.060095355,0.038303986,-0.013709621,-0.036766503,0.034516428,-0.0038328627,0.042618956,0.011248589,-0.03895342,-0.039341126,0.02211947,0.036264416,-0.037858788,0.019873412,-0.012140292,0.048582766,0.0005105855,0.013296349,0.02489217,-0.009817523,-0.003139639,-0.02090888,-0.029453134,-0.011894002,-0.02423309,0.0039314884,0.12363559,-0.02751241,-0.008447792,0.0111808395,-0.036579415,0.022540428,0.018781584,-0.005321082,0.07427192,0.042173807,0.010367492,0.00565748,-0.011815758,0.006701811,-0.020995695,0.044757754,0.060665313,0.03639415,0.0141912615,-0.040676218,-0.037678026,0.039868258,0.023016725,0.033324298,-0.0008848095,-0.0016732595,0.057304,-0.046630297,-0.0380939,-0.09627558,-0.032007664,-0.041984804,-0.08149571,-0.023538928,-0.01870241,-0.065129004,0.054749053,-0.01698216,0.0025330728,0.01086514,0.00012942345,-0.04664242,0.060971458,-0.018062878,0.059507698,-0.07053296,0.01945087,-0.06929378,-0.032492027,0.0020168857,-0.007978507,-0.029064298,0.055481575,-0.05264865,0.0019540563,-0.013985552,0.025941376,-0.036376897,-0.03920022,-0.065085925,0.0062011066,-0.008899196,-0.010265221,0.059691593,0.032289483,0.006092999,-0.021101048,0.0031755592,0.037518285,-0.027099203,0.027641984,0.062503465,0.023449747,-0.08309346,0.010219483,0.010888365,-0.03520443,0.025248876,0.024487276,-0.046638153,-0.019826403,-0.0068807523,0.025451776,-0.006242913,-0.04193013,0.0024831663,-0.004550582,0.038192034,0.017067567,0.0023245458,0.015705146,-0.02523279,0.027668051,0.008877507,0.001064289,0.0054873605,-0.037091147,0.009687012,0.0009380449,-0.04847625,-0.06470395,0.03398244,-0.037762273,-0.019670554,-0.021216653,-0.042510778,-0.030245429,-0.06118375,-0.059514187,-0.017329365,-0.061993845,0.023164121,-0.007785279,-0.014057801,-0.032106012,-0.014750845,0.053562175,-0.009667637,-0.00017368236,0.07456423,-0.008306301,0.023751391,0.03326586,0.02968233,0.022077719,0.0285756,-0.02265959,-0.052482385,0.0047614756,-0.0066102934,0.03291692,0.02883874,0.026733175,-0.056484822,-0.010571134,0.044559944,0.030112216,0.022270173,-0.03664314,0.03553702,-0.025981475,0.038811997,-0.0032399346,-0.039198916,0.02219055,0.010070147,-0.007932943,0.03047446,0.018147333,-0.035662618,0.073002696,0.048619524,-0.029530713,0.014151845,0.016012695,-0.008635351,0.022324786,0.057389136,0.07004423,0.07588472,-0.015505699,0.021481715,-0.015925279,-0.03232474,0.025759531,-0.016800778,-0.015456243,-0.110228576,-0.028347129,0.02975572,-0.0036461083,-0.032943074,0.033714075,-0.010749059,-0.050244283,0.031020522,-0.04541172,0.007969636,0.027870383,-0.036125813,0.012932594,-0.016644679,0.0009803725,0.013784517,-0.020467456,0.002173402,0.016058901,0.020330902,0.011014256,-0.016441612,-0.020967253,-0.0562763,0.005767312,-0.0031414286,0.00352371,-0.028462788,-0.03572844,0.010886241,0.014398556,-0.034221847,-0.037588015,0.023396056,0.034195855,-0.018510923,-0.0628473,0.031185739,-0.010579087,-0.034179315,-0.034873907,0.02892213,-0.06676892,-0.032329593,-0.042804245,-0.0056797275,-0.041383866,-0.03397758,-0.05426014,0.011950111,0.0037302345,0.069979675,-0.0053163827,0.00801551,0.029447718,0.007319195,0.028147852,0.029058417,0.0022313602,-0.018152883,-0.025693515,-0.013091588,0.02752156,-0.049816072,0.006279936,0.029968703,0.12221759,0.007091172,-0.03186959,0.039126143,-0.020460393,-0.021586679,-0.025169373,0.07272636,0.028333211,-0.063879706,0.005770437,0.07415508,-0.026847245,0.023970556,-0.068293326,0.015872147,-0.014038882,-0.065938726,0.039401144,-0.031756535,0.026368726,-0.015943505,0.046868354,0.01930013,-0.021140467,0.027376208,0.0053926343,0.051733736,-0.044608746,0.0241818,-0.050403308,-0.053912222,0.07744211,0.021510161,-0.016446838,0.04255992,0.04904421,-0.007456564,0.037720133,-0.066998795,-0.021372182,-0.05558822,-0.038342778,0.0120104365,0.04806833,-0.05104133,0.01717918,0.009656281,-0.03159843,0.017990341,-0.011700286,-0.0130981,-0.020596635,-0.0034089207,-0.011203121,0.04248219,0.0048106564,0.01872718,0.011498817,0.01655939,-0.08318717,-0.038552564,0.007253134,0.02393214,0.09800493,0.032030303,-0.050374992,-0.015994804,0.024938785,-0.0428659,0.027900139,-0.097168,-0.006448787,-0.00023948574,0.01765904,0.07847073,0.030542508,0.011162162,-0.031183459,0.025731243,0.025355259,-0.039316017,0.04081275,-0.01668537,0.03777432,0.021338494,-0.015115909,0.04627301,0.042410407,-0.002374358,0.029904407,-0.021261828,0.00838662,-0.041414574,0.07297705,0.018168379,-0.022434253,0.06636044,0.07476798,0.04534032,-0.008544537,0.030237807,0.029062508,-0.036760062,0.03258423,-0.026685983,0.022638984,0.0017773227,0.005663898,-0.021678496,0.024445679,0.04810142,0.0027487087,0.035936948,-0.050686657,0.015157628,0.026625156,0.01701109,0.014948038,-0.0796994,-0.015791068,-0.031148095,-0.015249988,-0.008486868,-0.030922525,0.0046014725,0.015029321,0.0035336378,0.014661117,-0.035755754,0.029219579,0.0060428726,-0.06140711,0.012045836,0.0039828154,-0.030816307,0.00904736,-0.008329565,0.0028344472,-0.0146182515,-0.04357438,-0.0046844026,-0.033881582,-0.018758502,0.007738538,-0.0035871735,-0.01612818,-0.014456533,0.040968552,-0.024908166,0.043965656,-0.034092966,0.033667874,-0.10455542,0.042255104,0.060491152,-0.019879634,0.013694317,-0.037713483,-0.04790022,0.043216437,-0.04247009,0.002589733,-0.004616204,-0.038707364,-0.023430506,0.0045780395,0.039192975,-0.0048368736,0.037456214,-0.0035574466,0.014470716,0.022192324,-0.0058991867,0.045667302,-0.015601268,-0.05012362,-0.012149466,0.012091747,0.045826666,-0.07923393,0.03473281,0.0383395,-0.027264208,-0.037252802,0.055272646,0.021785421,-0.014444666,-0.024584983,0.04539274,0.0009698393,-0.059190605,0.045593042,0.017631337,-0.004814127,-0.00080928794,-0.02966399,-0.0037816623,-0.047036756,0.008092484,-0.021399062,0.017943589,0.039440606,-0.030580007,0.12343531,-0.010452076,-0.02733244,-0.017524429,0.030249836,0.010137832,-0.018632323,0.032678623,0.028923057,-0.021945702,-0.034129675,0.014092686,-0.04407302,-0.0009442635,0.009111041,-0.06568205,0.01429491,-0.024596367,0.03550852,-0.049576014,0.03144949,-0.039695706,0.05349496,-0.09510526,-0.05276498,0.00392294,-0.007866736,-0.01858105,0.03322738,-0.04710647,0.0061393506,-0.011306337,0.015036111,-0.042334642,0.009768506,-0.030557245,0.024334583,-0.03013603,-0.010521628,-0.023308849,0.04851599,-0.0004329044,-0.031534977,0.05087607,-0.04527961,0.055658326,0.028682733,0.017452573,-0.0022291956,-0.024371019,0.0142555,-0.030541847,-0.008273044,0.040089946,-0.007222909,0.03878889,0.01268984,-0.022800282,-0.022083351,0.07197568,-0.09413895,0.032775145,0.031748205,6.5354136e-05,0.050212935,0.05704537,-0.0071478398,-0.026044995,4.0144176e-05,-0.05296511,-0.0796029,-0.0391661,0.0154047785,0.025656054,0.041535366,0.0019720686,0.041246258,-0.0052147694,-0.1915575,-0.0050729415,-0.007026346,-0.032430235,-0.0018454925,0.026233435,0.039251946,-0.0075613675,-0.0070799286,0.028224874,0.036515824,-0.04213983,0.020972358,0.015055789,-0.039100602,-0.0044138003,-0.012112072,-0.02123463,0.032450564,-0.0020601456,0.012482765,0.05872964,-0.039541215,0.011943666,-0.048460685,0.0038475818,0.005935971,0.01835369,0.024297407,0.0066930843,0.02604364,-0.0010623495,0.018380148,0.010144302,-0.0275714,-0.027814934,-0.02189587,0.0076235696,-0.0612489,0.05747846,0.009375866,-0.014582381,-0.0324743,0.012961771,-0.009369198,0.051307924,0.030192181,0.01829594,-0.026595253,0.0019313298,-0.012326896,0.009510906,-0.090012,0.017208911,0.0024185353,0.051594365,0.024657533,0.01492961,0.067994736,-0.017735621,0.05227828,0.07289668,-0.04249157,0.0075893067,-0.0146610765,0.017844789,0.06335466,-0.036288284,-0.03780266,0.0080017615,0.041511163,-0.047470454,-0.018254792,0.011217676,0.031332344,-0.037377685,0.020976689,0.0026657016,-0.066632025,0.0061966744,0.0009469579,-0.017485594,-0.01752833,0.042000562,-0.039473597,-0.014679223,-0.055719238,0.034942027,0.04068862,0.0053391624,-0.02446254,-0.06332743,-0.010098359,0.013942846,7.4465606e-05,-0.027897418,-0.024035875,0.0021506778,-0.00097346504,-0.03309048,0.010626594,-0.034928564,-0.040586755,0.0014551579,0.0518597,-0.04232892,-0.116879,0.029844783,-0.039821815,-0.0506288,0.039491795,0.042969454,0.03797966,-0.019925874,0.026693285,0.0047333864,0.021452384,-0.04012344,-0.035238143,-0.05771378,-0.004069755,-0.01756476,0.01905684,-0.014568571,0.023136338,0.014618485,-0.035427958,0.044060223,0.008701049,0.038688082,0.023550408,-0.05293421,0.046450794,-0.0065404885,-0.030163689,0.04621048,0.009817577,-0.015110825,0.03968624,0.020683799,0.05803795,-0.080762826,-0.0090350965,0.056616705,0.011183338,0.012176874,0.017718041,-0.001421671,-0.0051013557,-0.022400696,0.021481203,-0.06832371,0.019761637,-0.019868627,-0.026921736,0.009211743,0.023616636,0.0069000376,0.0010921133,0.013661421,-0.016337398,-0.042709365,-0.015711788,0.033609986,0.005962704,0.007232122,-0.013610591,-0.015965646,0.03493194,0.024846826,-0.04685833,0.027686397,0.01484077,0.012910745,0.025789697,-0.0057260855,0.07071544,0.01845138,-0.009583279,0.04363142]
11	task_assignees	Table: task_assignees\nDescription: junction table เชื่อม user กับ task task หนึ่งมี assignee ได้หลายคน\nColumns:\n  id         UUID PRIMARY KEY,                                              -- รหัส\n  team_id    UUID NOT NULL REFERENCES teams(id) ON DELETE CASCADE,           -- FK → teams\n  task_id    UUID NOT NULL REFERENCES project_tasks(id) ON DELETE CASCADE,  -- FK → project_tasks: task ที่ assign\n  user_id    UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,          -- FK → users: user ที่รับผิดชอบ task\n  created_at TIMESTAMPTZ NOT NULL                                           -- วันที่ assign\n  -- UNIQUE (task_id, user_id): assign user คนเดียวกันซ้ำไม่ได้\n	[0.00054393767,0.03513488,-0.016343284,0.015623642,0.021932874,-0.0031217714,-0.026639562,-0.026529148,0.04662499,0.0122943,0.031225257,0.015807472,0.10524193,0.043185346,-0.022754097,-0.012511894,0.0041576433,-0.012629899,0.021917433,-0.012898682,0.023053128,-0.043087564,0.012462034,-0.0014733246,0.026994755,-0.021951934,0.013604391,0.0026005842,-0.058746364,0.013564991,0.037138283,-0.01844313,-0.009201048,0.023640472,0.015533897,-0.011843747,-0.010157647,-0.01345403,-0.0030677407,0.0070294742,0.038746618,0.009222999,0.018878682,-0.016321063,0.023637984,-0.008049899,0.044136457,0.02221009,-0.017792713,-0.0065170154,0.017041458,0.0050328407,0.037586454,0.024049591,-0.0626935,-0.029530691,0.047387786,0.026210712,-0.03131293,0.031785782,0.022024464,0.0367833,0.0019631844,0.035822894,0.026883509,-0.003465876,0.017130755,-0.017098308,-0.039072704,-0.02554941,-0.00950488,-0.0009321357,0.086929284,-0.0388889,-0.020513969,-0.0024229423,-0.040527984,0.020467576,0.026527625,-0.0136241475,0.065643206,0.028344331,0.014203435,0.010623679,-0.005831035,-0.019345079,-0.0019731007,0.041934855,0.044539835,0.048066493,0.05142826,-0.045126606,-0.04443957,0.04012146,0.016538365,0.026487647,-0.009194192,0.011117862,0.023980401,-0.025472263,-0.0013393094,-0.08657842,-0.030066473,-0.0283876,-0.09384311,-0.035002884,-0.006831831,-0.044013407,0.042563442,-0.010087618,0.0079135215,0.000679432,0.005643976,-0.03208456,0.038023584,-0.047796454,0.04820959,-0.06350178,0.0055887,-0.057269875,-0.04931406,0.016556287,-0.02740289,0.00085272663,0.056708477,-0.03393097,0.0018919171,-0.00961367,0.038190182,-0.04461883,-0.01738597,-0.064413786,0.03201731,0.011520678,-0.02625492,0.048575874,0.022918401,0.0339123,-0.016528917,0.0068699997,0.008872656,-0.020348346,0.008539244,0.035690807,0.011969285,-0.070025384,0.0027711613,0.029765729,-0.024095984,-0.0014949566,0.035516206,-0.052442398,-0.027198117,-0.026451355,0.039140508,-0.0099865785,-0.058475763,-0.011120991,-0.018006181,0.03904267,0.016276421,-0.008289387,0.025889333,-0.032077115,0.018228417,0.024705403,-0.018593222,0.028727964,-0.049125064,0.01279496,0.015700728,-0.058156718,-0.081947625,0.03198764,-0.052098352,-0.03476877,-0.027321326,-0.029512703,-0.0373768,-0.04484794,-0.073492885,0.01161143,-0.009245669,0.027812624,-0.0035292555,-0.016259944,-0.009093368,-0.008604717,0.06844816,0.006877518,-0.00037336044,0.08076965,0.025489572,0.034782436,0.033877626,0.0063988753,0.012628391,-0.003281286,0.02837597,-0.027505245,0.004895503,-0.008731333,0.04150211,0.022083512,0.025642328,-0.060633164,0.00017772614,0.061203185,0.030482408,0.018009817,-0.018262923,0.009165437,-0.037509583,0.04203432,-0.015595029,-0.042551976,0.019433348,0.012844424,-0.024523696,0.05064006,0.0005554182,-0.023700995,0.043711036,0.0314329,0.0051047746,0.019048912,0.040994372,-7.9189624e-05,0.011299621,0.03617649,0.07233952,0.091197126,-0.047180336,0.0169164,0.014612486,-0.0030134853,0.03206721,-0.022187706,-0.018230319,-0.11854611,-0.03753593,0.012121534,0.013882921,-0.032823108,0.031575523,-0.01767758,-0.019849112,0.044391826,-0.04304384,0.039772887,0.021714706,-0.042476397,0.019093959,-0.048086543,0.007845854,-0.0008477576,-0.04527675,0.00557545,0.03654174,0.013221736,0.0055418015,0.0034878864,0.0018740852,-0.035047293,0.024816014,0.0068634893,0.03196172,-0.030659754,-0.058067545,0.021379191,0.0042641317,-0.015565206,-0.039646953,0.020208873,0.019418096,-0.016761968,-0.064533934,0.03819174,-0.025520355,-0.037632555,-0.02562962,0.063191876,-0.08142018,-0.04924409,-0.024516864,-0.030107703,-0.053253077,-0.009919859,-0.043443423,0.0066388003,0.026712291,0.07008367,-0.006187738,0.014608888,0.053881492,0.018715592,0.035617463,0.022865217,-0.01802509,-0.009028992,-0.02912287,-0.029804775,0.03960252,-0.06404534,-0.014400174,0.015431554,0.11625419,0.0028433183,-0.053263504,0.044013534,-0.03190607,-0.014914277,-0.040485762,0.039352167,0.036021072,-0.022340758,-0.004141133,0.057878118,-0.0060817446,0.023676412,-0.022709444,0.031103252,-0.005873169,-0.0746332,0.04069476,-0.05223276,0.02840925,-0.011665668,0.0735687,0.032777842,-0.010023851,-0.00393922,-0.000354264,0.043463055,-0.01418106,0.047519486,-0.07134617,-0.06616745,0.04775788,0.0009350672,-0.006850498,0.029223919,0.023746384,-0.012381233,0.06490429,-0.06819265,-0.029480709,-0.060139585,-0.061303012,0.023269553,0.023634274,-0.055437416,0.02048698,-0.01441439,-0.0103326095,0.009570919,0.01870919,-0.009176855,-0.033290483,-0.016293567,-0.014834724,0.025909213,0.009837596,-0.01094429,0.006135871,0.021373285,-0.047242835,-0.035573933,0.0135195935,-6.379743e-05,0.11805881,0.057413783,-0.03092695,-0.017577155,0.03261426,-0.023196215,0.022427626,-0.09663969,-0.017022518,0.028556919,0.041825384,0.04583193,0.010123946,0.04409789,-0.035807323,-0.011012777,0.036861718,-0.048192352,0.041341525,-0.009253787,0.034797605,0.024163332,-0.013812071,0.03899273,0.038783215,-0.026297813,0.04047824,-0.003991774,0.0039044677,-0.027515689,0.065772034,0.030609252,-0.003471057,0.048810028,0.049689952,0.021174947,-0.012142786,0.029917972,0.03060179,-0.040143307,0.051886074,-0.059162263,0.044846896,0.014091297,0.017433222,-0.016616255,0.02256206,0.041727513,-0.030577702,0.0066428743,-0.040998776,-0.0083123045,0.04177753,0.010856487,0.015554992,-0.08734066,-0.008669693,-0.019941667,-0.00039692983,0.0008840643,-0.012938099,-0.0022966943,0.025243128,0.01833491,0.022165619,-0.04884907,0.013119108,-0.0020588066,-0.040540963,-0.012048356,0.0029207077,-0.032842517,0.0071955523,-0.029100683,-0.019599304,-0.021909231,-0.026382191,0.010986633,-0.027759138,-0.012355843,-0.0061269575,0.006938163,0.017571628,-0.0012002706,0.018914886,-0.06685882,0.031239081,-0.015742691,0.025764316,-0.12296015,0.052864354,0.043228984,-0.02679008,-0.04153089,-0.04406753,-0.08239569,0.020943236,-0.071564436,0.061453115,-0.0021455395,-0.031264592,-0.008329588,0.0020655654,0.039250992,0.024317842,0.041812018,-0.013350117,0.00746207,0.031676922,-0.007772651,0.03515345,-0.030489609,-0.016657002,-0.015424675,0.0048953933,0.036998745,-0.0821612,0.036650192,0.052435886,-0.030922282,-0.034087002,0.037290756,0.040204138,-0.013915604,-0.016962068,0.02213082,-0.0047879047,-0.050675623,0.062181156,0.034578297,0.0042603705,-0.036809687,-0.033640932,-0.011116336,-0.022055108,0.0021441313,-0.027163472,0.028683772,0.03668261,-0.047338646,0.11306554,-0.0051021157,-0.041515153,-0.0057992777,0.020541115,0.01931516,-0.01198628,0.022068704,0.016459553,-0.008500478,-0.025006942,0.0057198564,-0.033114668,-0.018490119,0.009529577,-0.05855253,0.00798964,-0.034647193,0.03972806,-0.027256474,0.007433579,-0.06029541,0.033848416,-0.09463906,-0.08511115,0.06618392,-8.242313e-05,-0.030506093,0.018920373,-0.029009074,4.841422e-05,-0.013109902,0.03321674,-0.026993781,0.020418154,-0.026269635,0.005342359,-0.034892105,0.017866753,0.008267208,0.039474186,-0.009481937,-0.0015584922,0.055359967,-0.026881648,0.03985714,0.0113580525,-0.0019947405,-0.0058456925,-0.026131283,0.020255297,-0.014428145,0.0032175817,0.011995666,-0.021172276,-0.013045749,0.03854019,-0.037685398,-0.028783377,0.05817042,-0.066262856,0.021228306,0.0509145,-0.012711097,0.05889751,0.029897133,0.0013390906,-0.003699183,-0.0005970355,-0.051649086,-0.06379353,-0.027474035,-0.009877114,0.041666955,0.06278808,0.0067732683,0.0256946,0.0070046103,-0.20333982,0.0046437304,-0.0087192925,-0.040381763,-0.0030669714,0.015835818,0.01594015,-0.015136193,0.008320034,-0.0042111385,0.03447521,-0.03637514,0.0030098702,-0.017306224,-0.049415782,0.0067055044,-0.008655398,-0.03378144,0.014368673,0.049340136,0.012022677,0.065060504,-0.03674437,-0.01673839,-0.026186688,0.0035953189,-0.011447179,0.036509026,0.01702365,-0.008980071,0.017921615,-0.00037414717,0.042528164,0.008850318,-0.006538517,-0.051406827,0.0051379562,0.00647504,-0.07065379,0.053318214,0.008576359,0.0020624062,-0.057324078,0.018171972,-0.0049352003,0.04015276,0.038448464,0.03942129,-0.037920214,-0.025206381,-0.01321315,0.0037079626,-0.08452172,0.02752252,0.002431475,0.090951726,0.031451676,0.023110818,0.043117262,-0.02610837,0.052958857,0.037462644,-0.024827573,0.012792639,-0.02974548,0.00913893,0.07703673,-0.03213859,-0.030812979,-0.0004699426,0.049923956,-0.040376667,-0.024133757,0.003350717,0.029387785,-0.02954739,0.0012339228,-0.03270641,-0.07970016,0.009975349,-0.034973666,-0.040383317,-0.0059956145,0.039375618,-0.042250734,-0.014469613,-0.033872183,0.017798727,0.039893985,0.037582893,-0.012114008,-0.067273945,-0.012437414,0.0011436112,0.018277338,-0.04006598,-0.022388242,0.041770276,0.0034293586,-0.01411415,0.022881243,0.010149432,-0.020596903,0.028204292,0.027051156,-0.035238333,-0.12959059,0.006255613,-0.042469937,-0.055577077,0.056043945,0.051240515,0.040252857,-0.018239167,-0.00014696698,0.02231397,0.011243893,-0.018407179,-0.019007193,-0.017307429,-0.014702251,-0.036868215,-0.011716872,-0.010008186,0.027263753,0.008351369,-0.05207996,0.051716447,0.012163215,0.024324331,0.0053225905,-0.070050865,0.034610074,-0.028094241,-0.034880307,0.025105143,0.018035622,-0.010191646,0.046864413,-0.0025435034,0.043461673,-0.070438124,-0.036123086,0.05410623,-0.0023550405,0.0038294937,-0.023593951,-0.0045256927,0.023408605,-0.017621662,-0.0058206976,-0.098421864,0.01907221,-0.01169914,-0.01098091,0.021394249,0.017167963,0.045765605,0.009338429,0.026417622,-0.045825616,-0.046876457,-0.0054231617,0.010563536,-0.0024568308,0.036635086,-0.006708177,-0.03845228,0.0029379055,0.022742242,-0.035648216,0.06365991,0.021210218,0.028251426,0.036002304,-0.014489692,0.043106947,-0.014381788,-0.041291308,0.03229033]
12	team_membership	Table: team_memberships\nDescription: เชื่อม user กับ team พร้อมกำหนด role ของ user ในแต่ละ team user 1 คนมีได้ 1 role ต่อ team\nColumns:\n  id         UUID PRIMARY KEY,                                    -- รหัส membership\n  team_id    UUID NOT NULL REFERENCES teams(id) ON DELETE CASCADE, -- FK → teams: team ที่ user เป็นสมาชิก\n  user_id    UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,  -- FK → users: user ที่เป็นสมาชิก\n  role       TEXT NOT NULL,                                        -- OWNER / ADMIN / MEMBER / VIEWER / BILLING\n  invited_at TIMESTAMPTZ,                                          -- เวลาที่ได้รับ invitation (NULL = ไม่ได้ถูก invite)\n  joined_at  TIMESTAMPTZ NOT NULL,                                 -- เวลาที่เข้าร่วม team จริง\n  created_at TIMESTAMPTZ NOT NULL                                  -- วันที่สร้าง record\n  -- UNIQUE (team_id, user_id): user อยู่ใน team เดียวกันได้แค่ครั้งเดียว\n	[0.00857707,0.020671027,-0.025508318,0.033556804,0.010601051,-0.037541874,-0.032854043,-0.029941283,0.03694112,0.0018501192,0.022285301,0.012203558,0.12530105,0.04635973,-0.024006736,-0.0043419744,-0.017619235,-0.013289816,0.01942913,-0.029663336,0.049556553,-0.04184494,0.043469127,0.0007623026,0.031478625,-0.03988345,-0.0031957326,-0.017977476,-0.03493525,0.02068679,0.035771165,-0.02234939,-0.021510096,0.03498121,0.01208679,0.020600816,0.0045623807,-0.0077768997,0.0055028955,-0.019337526,0.033373527,0.00904069,0.02779146,-0.033004027,0.027288003,-0.014922825,0.045694668,0.03141193,-0.028269935,-0.01748113,0.02146894,0.013872506,0.04199678,0.0095385155,-0.040317878,-0.028823216,0.028909493,0.048398525,-0.03478035,0.019199971,0.002285416,0.048065238,0.00045074476,0.019576596,0.021973707,-0.003735054,-0.0073862774,-0.037035286,-0.044846013,-0.022264749,-0.0050336467,0.008841932,0.09892752,-0.0070100077,-0.023236686,-0.010831262,-0.050593764,0.01607797,0.018344123,-0.013295002,0.061494883,0.0039320467,0.025645453,0.023210607,-0.021243682,-0.007638281,-0.009708577,0.05043257,0.03217307,0.03129769,0.018341472,-0.04063972,-0.058506504,0.013754782,0.037421945,0.027847394,-0.014748197,0.009503532,0.05932184,-0.048518006,0.009117134,-0.08710874,-0.038239114,-0.03305799,-0.078004174,-0.038570113,-0.0068820966,-0.040104873,0.045339566,-0.023187831,0.00036811517,0.0014209349,0.009191699,-0.06249846,0.045818686,-0.05235104,0.04639529,-0.054743197,0.01849538,-0.05457221,-0.04248271,0.031142939,-0.012389876,-0.0047163866,0.040443376,-0.030933894,0.008042235,-0.0067245164,0.020599188,-0.03804316,-0.03546967,-0.04417831,0.0101890825,0.0064636203,-0.015633836,0.049461447,0.025187278,-0.014594896,-0.0018688163,0.0005380484,0.038748797,-0.038180094,0.00947744,0.023686634,0.013273282,-0.07084097,-0.007875002,0.013545536,-0.0314492,0.011108552,0.028736541,-0.052539706,-0.038602397,-0.013778935,0.037408073,0.0031328788,-0.029203482,-0.02125436,0.02239932,0.040816456,0.039492518,-0.01691026,0.027823819,-0.026417047,0.039908994,0.023249738,-0.024650581,0.0073387185,-0.040244713,0.0014500296,-0.0062771244,-0.053502377,-0.0817637,0.042316306,-0.02807587,-0.034442723,-0.021666288,-0.03252789,-0.04328086,-0.039222118,-0.07353142,0.004782852,-0.031225871,0.02563678,-0.023863954,-0.016948977,-0.02238696,-0.032519884,0.07100027,0.02291485,-0.014519963,0.07676391,0.0061641135,0.029567745,0.029054185,-0.0051074536,0.024825476,0.029611059,0.013854188,-0.032855198,0.029368043,0.0021253785,0.05731749,0.042967685,0.030361427,-0.06110395,-0.006927702,0.036769375,0.022762876,-0.0020043214,-0.01645382,0.025028339,-0.012221347,0.048602354,-0.038387425,-0.034131106,0.026978122,0.023836266,-0.038145673,0.040651105,-0.0030652718,-0.028326862,0.07301269,0.02539199,-0.026781727,0.01871133,0.021059847,-6.483576e-05,0.04379293,0.037610263,0.06800962,0.092257544,-0.024941044,0.036516454,-0.0074076103,-0.01575079,0.0078031584,-0.012609902,-0.017958594,-0.1103972,-0.024897592,0.021511417,0.009531765,-0.012728848,0.019122932,-0.015730925,-0.028278528,0.033395197,-0.050603766,-0.010676708,0.04960206,-0.027321842,-0.010847898,-0.0420869,0.008104892,0.01782004,-0.03317188,0.025851337,0.041472696,0.0034725827,0.023197401,-0.0026812807,-0.003942458,-0.040384084,0.022863457,0.009227497,0.015381082,-0.011814678,-0.070245415,-0.020755365,0.01070209,-0.016038835,-0.034788385,0.0022491165,0.024504576,-0.013753651,-0.06334048,0.023840968,-0.030552082,-0.059867628,-0.028440962,0.051033676,-0.072424226,-0.027099717,-0.026008045,-0.0052070655,-0.0464247,0.0017051816,-0.032311402,-0.0021645806,0.018071534,0.099790454,-0.016066017,-0.0015254972,0.048421253,0.008159639,0.04027224,0.021371204,-0.004179582,0.015944473,-0.025673732,-0.017144088,0.05011438,-0.05093968,-0.0047668936,0.03152854,0.12212442,0.013858443,-0.048029285,0.02906345,-0.02767739,-0.014009668,-0.026339386,0.038101435,0.025251571,-0.04063058,0.0053208447,0.05540205,-0.009686166,0.035388105,-0.027749198,0.029841406,-0.011017611,-0.06324806,0.041347377,-0.067260735,0.038438756,2.5356146e-06,0.05679286,0.031306878,-0.03221656,-0.007902821,0.0044169896,0.027820764,-0.022121765,0.030541932,-0.06676786,-0.044670027,0.07649498,-0.0064169774,-0.014955442,0.02590275,0.01817699,-0.01585687,0.05621933,-0.05806764,-0.026786633,-0.074203186,-0.03831249,-0.0035510743,0.025392752,-0.04680923,0.017075263,-0.017471114,-0.013452497,0.012057185,0.01037032,-0.02676133,-0.027146626,-0.0005046433,-0.02090035,0.025481302,0.030159876,-0.0024323459,0.010485037,0.019054793,-0.06419607,-0.019637875,-0.018480698,0.011454,0.10438008,0.045464206,-0.04585003,0.0002896254,0.036723025,-0.026190752,0.03398489,-0.069916725,-0.012952622,0.020946365,0.050555367,0.055723414,0.039747283,0.03301669,-0.051011402,-0.009212728,0.023784135,-0.05163598,0.033987176,-0.022513168,0.04513613,0.011201986,-0.0012647037,0.040139515,0.049641926,-0.014559402,0.008159548,-0.0094711725,0.023629898,-0.044291884,0.05003153,0.021407181,-0.0077326195,0.049313523,0.039467845,0.013804722,0.011884122,0.027833436,0.04363976,-0.028555032,0.040417343,-0.06673432,0.050325535,-0.0004772239,0.0046652076,-0.021307617,0.014929002,0.03916008,-0.0053973,0.016073924,-0.05134517,0.021011215,0.028419992,0.013559534,0.035857342,-0.08797579,-0.002371127,-0.010495601,-0.01175443,0.0059020626,-0.042510316,0.0092646675,0.016153995,-0.0053439443,0.008736286,-0.032228414,0.01913072,0.023287382,-0.030923987,-0.005894318,0.0051393006,-0.053300835,0.0049063945,-0.009768533,-0.013090262,-0.030007875,-0.04617844,0.006044749,-0.03986334,-0.005060334,-0.00714288,-0.003803065,0.017332457,-0.0057087173,0.04548156,-0.052531704,0.054066353,-0.031773727,0.024565708,-0.12776469,0.03263371,0.0428078,-0.022790357,3.5608777e-05,-0.044337086,-0.06886472,0.011648497,-0.04951147,0.04275317,-0.006146347,-0.024183864,0.0040719537,0.032344162,0.04687451,0.0052557257,0.031531923,-0.027585492,0.028160794,0.03355251,-0.0056757177,0.029382735,-0.01145948,-0.04571712,0.0012135992,0.02642167,0.047783803,-0.092233755,0.03042035,0.038338926,-0.043598205,-0.023233347,0.033198886,0.053299244,-0.0036095113,-0.03840501,0.01744095,0.0071736784,-0.06422633,0.034578536,0.04100719,-0.0060131527,-0.027591102,-0.056001894,-0.014049023,-0.040145922,0.006809051,-0.039726485,0.024063127,0.045543965,-0.045904074,0.13166316,0.0020623873,-0.02183652,-0.003383965,0.021479614,-0.026326668,0.013743653,0.03058644,0.018169882,-0.006177666,-0.024560342,0.0025381793,-0.034388337,-0.02161441,0.015755711,-0.054184888,0.023355138,-0.02845183,0.049102433,-0.02259507,0.021070752,-0.05609163,0.032048877,-0.1102388,-0.062316075,0.020840961,-0.0028257275,-0.015641717,0.04156383,-0.04470151,-0.0029633273,-0.002852375,0.052810725,-0.04523065,0.0249364,-0.033440165,0.01286726,-0.020823827,-0.0058489493,0.0076961233,0.04603449,0.009323976,-0.035429433,0.04877631,-0.04161398,0.047075227,0.017343035,0.021242473,0.0063177063,-0.023153596,0.016568078,-0.013307403,0.006743417,0.02556438,0.005847575,-0.0020470605,0.02420215,-0.025770156,-0.01487017,0.041719276,-0.06618045,0.02143708,0.042863287,-0.017654272,0.033947762,0.035907727,-0.0027283363,-0.0044083954,-0.009638667,-0.046771448,-0.04816928,-0.023503557,0.009313014,0.026577447,0.054457024,-0.012735274,0.047440156,0.02483699,-0.20947306,-0.00059385994,-0.008831813,-0.01687958,-0.013595559,0.040861636,0.0025718666,-0.02205911,-0.015601029,0.019270288,0.053535506,-0.04267583,0.016996857,-0.003913816,-0.059300784,0.010097618,-0.026630322,-0.021648394,0.019772185,0.038639564,0.015812505,0.069594406,-0.050346345,-0.0020769625,-0.030615179,-0.011972546,-0.0032032507,0.03321969,0.011467695,0.001648208,0.031647407,-0.010319154,0.028885849,0.026312523,-0.018373448,-0.034865156,-0.016208567,0.0057250094,-0.08110873,0.03978683,0.0064429203,-0.015497373,-0.039013922,6.0507144e-05,0.021530775,0.06323623,0.028824931,0.06053842,-0.027467836,-0.005853541,0.018004296,0.011937428,-0.08728604,0.006940551,0.02013381,0.062290452,0.020167807,0.010667134,0.047876153,-0.025426019,0.052221328,0.060046423,-0.03994933,-0.009787625,-0.013007244,0.022116827,0.056346707,-0.04293475,-0.019238207,0.010693387,0.055489242,-0.049728587,-0.028724939,-0.010601077,0.018893318,-0.038375672,0.009056984,-0.0052347756,-0.075061925,0.0067437803,-0.024233364,-0.014226606,0.0009667354,0.02262229,-0.039600115,-0.02837533,-0.05184802,0.030999951,0.03988972,0.023099044,-0.017475152,-0.05126201,-0.04173462,0.027552104,-0.010142502,-0.0356326,-0.036175683,0.018897412,-0.012844246,-0.02800168,0.024929203,-0.0011810022,-0.050367896,0.027289562,0.017240796,-0.032710537,-0.1190101,0.020251092,-0.010284679,-0.040355124,0.0595853,0.023463663,0.04077302,-0.018702587,0.012178317,0.024399668,-0.0030366543,-0.053953353,-0.04131536,-0.021371875,-0.02162699,-0.026442502,0.01599313,-2.6456813e-05,0.034613207,0.010434845,-0.0334381,0.04756361,0.0208194,0.04011084,0.011324442,-0.069724895,0.03970431,-0.025139904,-0.037896715,0.033499934,0.029567966,-0.012035005,0.048470136,0.014598277,0.057219908,-0.06579989,-0.032541905,0.03683635,0.022974417,0.024448743,0.013097016,-0.020947332,0.005258647,-0.014911157,-0.00012230052,-0.095146045,0.023003614,-0.01538384,-0.018949887,0.016259205,0.03505589,0.030106995,0.013119016,0.032876994,-0.001824455,-0.058982305,-0.008629353,0.025895454,0.0032523794,-0.0022657474,-0.010807122,-0.04746196,0.0035929645,0.04856334,-0.02277638,0.05102127,0.0192693,0.005609396,0.022926908,-0.03451082,0.041105475,0.009155876,-0.036434557,0.022935104]
14	time_entries	Table: time_entries\nDescription: บันทึกเวลาทำงานของ user ในแต่ละ project และ task หัวใจหลักของระบบ time tracking เก็บเวลาเริ่ม-หยุด, ระยะเวลา, billable flag และมูลค่าเงิน\nColumns:\n  id                UUID PRIMARY KEY,                                        -- รหัส time entry\n  team_id           UUID NOT NULL REFERENCES teams(id) ON DELETE CASCADE,     -- FK → teams\n  project_id        UUID NOT NULL REFERENCES projects(id) ON DELETE CASCADE,  -- FK → projects: project ที่บันทึกเวลา\n  task_id           UUID REFERENCES project_tasks(id) ON DELETE SET NULL,    -- FK → project_tasks: task ที่บันทึกเวลา (optional ไม่จำเป็นต้องระบุ)\n  user_id           UUID REFERENCES users(id) ON DELETE CASCADE,             -- FK → users: user ที่ log เวลา\n  client_id         UUID REFERENCES clients(id) ON DELETE CASCADE,           -- FK → clients: denormalized จาก project เพื่อ query ง่ายขึ้นโดยไม่ต้อง JOIN projects\n  note              TEXT,                                                     -- คำอธิบายว่าทำอะไรใน session นี้\n  started_at        TIMESTAMPTZ NOT NULL,                                     -- เวลาเริ่มจับเวลา\n  stopped_at        TIMESTAMPTZ,                                              -- เวลาหยุดจับเวลา NULL = timer กำลังรันอยู่\n  duration_seconds  INTEGER,                                                  -- ระยะเวลาทำงานหน่วยวินาที คำนวณจาก stopped_at - started_at (หาร 3600 ได้ชั่วโมง)\n  billable          BOOLEAN NOT NULL DEFAULT TRUE,                            -- true = คิดเงินลูกค้า / false = งาน internal ไม่คิดเงิน\n  hourly_rate_cents INTEGER,                                                  -- ราคาต่อชั่วโมง ณ เวลาที่บันทึก หน่วยสตางค์ (snapshot ไว้ไม่เปลี่ยนย้อนหลัง)\n  amount_cents      INTEGER  	[0.017731037,0.042461853,-0.008896319,0.014648029,0.0061057685,-0.037680577,-0.03273493,-0.026241617,0.02274178,0.02957266,0.030869836,0.01930285,0.11888396,0.04791783,-0.022479951,-0.035388645,-0.004904171,-0.026946578,0.016998943,-0.023034735,0.049903296,-0.05888997,0.012556006,-0.012575791,0.026048182,-0.030596288,0.0060060746,-0.0037737868,-0.04953429,0.021689681,0.033563532,-0.017182114,0.00025767152,0.025754837,0.026016999,0.016498175,-0.009910494,-0.042168014,0.013484807,0.003111206,0.028910527,-0.015150544,0.052110523,-0.029036382,0.009862078,-0.013652502,0.05201386,0.027119804,-0.0070553175,-0.018449515,0.033175252,0.019640833,0.039793607,0.017484771,-0.044331335,0.0017473019,0.027796473,0.027715974,-0.03190023,-0.0022914105,-0.0013356277,0.05864117,-0.005151567,0.017771203,0.012025748,-0.0077762185,0.018415948,-0.027129443,-0.058461234,-0.031856395,-0.021068828,0.019976752,0.09608177,-0.013760621,-0.006608843,-0.002366848,-0.036351345,0.001907377,0.028740374,-0.0029872977,0.060819257,0.017795365,0.0052456628,0.021807954,0.0036053846,0.0022405048,-0.017944807,0.039880272,0.042991977,0.037920754,0.032689303,-0.016802866,-0.048234507,0.023125648,0.03309991,0.019917237,-0.005341228,0.0054837423,0.04282357,-0.03323784,-0.0124105755,-0.07453717,-0.0023184326,-0.027759146,-0.08619875,-0.025823273,-0.023190374,-0.05768451,0.058441486,-0.021212962,-0.017539702,0.0001925814,0.014379537,-0.06141072,0.03418086,-0.057790026,0.06156836,-0.059778433,0.0148949595,-0.06420345,-0.061600532,-0.004547712,0.00529882,-0.019530464,0.044132285,-0.03560164,-0.007252694,-0.017836293,0.007967313,-0.059377443,-0.029931262,-0.03349876,0.002789832,-0.0050162114,-0.02217178,0.053672835,0.026319075,-0.0044353628,-0.005597269,0.018041959,0.031476505,-0.035147674,0.018954735,0.055245556,0.013256944,-0.07562128,-0.0146172615,0.011150758,-0.015996067,0.036571227,0.039026324,-0.05190493,-0.03418113,0.006515338,0.045248862,-0.010419033,-0.053257413,-0.020035544,0.01913632,0.032564733,0.013606107,0.0007772539,0.0071618296,-0.03679176,0.029802818,0.007486784,-0.04728519,0.021871971,-0.045912366,0.008703536,-0.0021162457,-0.06746972,-0.08161206,0.022532603,-0.025633376,-0.034829184,-0.01557735,-0.029944789,-0.039589554,-0.05206674,-0.06958832,0.0057047033,-0.05603906,0.021828143,-0.013427079,-0.017862184,-0.030108985,-0.0122652445,0.035089143,0.013943324,0.0010699091,0.08212624,0.008161726,0.04371399,0.026498212,0.0072688167,0.03267658,0.013064213,0.0027467557,-0.040245954,0.006051866,0.0015425506,0.034315914,0.041625775,0.015360338,-0.066353396,-0.004532357,0.035098568,0.035986386,0.010704642,-0.0366899,0.03710449,-0.05089261,0.047448393,-0.028156882,-0.060975596,0.04067377,0.022635002,-0.015716374,0.03521523,0.0021530564,-0.060293093,0.053751204,0.04805877,-0.023673922,0.0075554783,0.02581509,-0.010580791,0.030903537,0.02839754,0.047961537,0.10115531,-0.046774752,0.009153342,-0.022510055,-0.024465509,0.04649145,-0.011615902,-0.017811455,-0.12026288,-0.051135942,0.027218515,0.011730348,-0.012564371,0.05364274,0.00097275956,-0.048090305,0.038511544,-0.04440389,0.022293625,0.031296622,-0.04953999,0.005953506,-0.016556501,0.022827368,-0.00040396058,-0.05173029,0.010787269,0.050070554,0.0071772146,0.00731724,-0.0072000045,0.003989431,-0.0338124,0.020815201,-0.027234675,0.00031554114,-0.030404659,-0.05099854,-0.0062672477,-0.008920369,-0.02835821,-0.039610125,-0.01991052,0.012197921,-0.0035401327,-0.07276061,0.020973815,-0.019021641,-0.052154377,-0.015214253,0.04383431,-0.0783393,-0.030465886,-0.021714734,-0.002188316,-0.046517946,0.014172259,-0.03993325,-0.01806537,0.022796556,0.08083369,-0.011801068,0.0066374084,0.057163432,0.007534085,0.03788834,0.012298467,-0.003180339,-0.021512195,-0.020303074,-0.0115652075,0.01760246,-0.06400234,-0.046546314,0.029254364,0.117475815,0.022432303,-0.0701655,0.035940465,-0.01758441,-0.01303021,-0.011686533,0.052624285,0.036956098,-0.046225213,-0.0043250667,0.057585124,-0.0044503594,0.02833401,-0.03624232,0.033284456,-0.021484194,-0.089616664,0.039363813,-0.044630677,0.031873077,-0.008964491,0.03808253,0.0339505,-0.0047416724,0.010379731,0.023546254,0.039251592,-0.04119863,0.027608296,-0.055680353,-0.061255626,0.05432788,-0.0010920501,-0.027923526,0.033397198,0.029936235,0.0035990141,0.05349383,-0.071223654,-0.03026776,-0.071674265,-0.04216069,0.0076665417,0.0126984725,-0.047527462,0.02496872,-0.023469234,-0.027468976,0.02638283,0.012257799,-0.009592824,0.0008013169,-0.014420219,0.006359989,0.021762775,0.025275648,-0.013375472,0.008973571,0.02714168,-0.0736526,-0.025988149,0.01213075,0.021408819,0.107549444,0.052327964,-0.033124227,-0.00042895667,0.04218495,-0.028811794,0.049433555,-0.07168779,-0.010797985,0.034295164,0.044686258,0.04759948,0.028010257,0.040667884,-0.036663912,-0.011284623,0.014332214,-0.043594226,0.036144536,-0.009242758,0.050640296,0.009379055,-0.013467547,0.04406712,0.059365395,-0.03810949,-0.0058047725,-0.0046165343,0.0132438345,-0.04854556,0.049918123,0.013241023,-0.026197445,0.056617234,0.04124373,0.02330471,-0.023964541,0.051602755,0.024459165,-0.03656685,0.047985192,-0.05064579,0.054791868,0.006693995,0.030309819,0.0090346355,0.01685394,0.039726853,0.00046346444,0.01262568,-0.061483953,0.022517271,0.024484674,-0.002440121,0.03381117,-0.085767046,0.010970755,-0.017805707,-0.023964662,0.011463882,-0.034917127,0.017263927,0.019971862,0.017421888,0.039850127,-0.0396486,0.022181692,0.024966776,-0.020917257,0.014623821,-0.022334473,-0.043107014,0.016801361,-0.0056149326,-0.02660924,0.0077947453,-0.03717683,0.00825848,-0.031896293,-0.029011603,-0.0054084947,0.0062824897,0.012301739,-0.013310509,0.035052083,-0.05682866,0.038657557,0.0072061294,0.0023472179,-0.10700109,0.014910161,0.034861553,0.0046920367,0.009623308,-0.04364194,-0.070274845,0.026504599,-0.07079081,0.032517552,0.013574116,-0.038879577,-0.01901599,-0.014857292,0.036701877,0.008832335,0.033187985,0.012058646,0.04522212,0.032535903,0.0030294238,0.058203,-0.01042277,-0.034622632,0.0044043027,0.008301281,0.060063187,-0.09887541,0.024635991,0.035986632,-0.04088274,-0.026318137,0.05551679,0.031829406,-0.02280248,-0.0024449164,0.041711766,0.0014430289,-0.053634673,0.06311588,0.03777526,-0.023755675,-0.023765195,-0.035766155,0.008195736,-0.029029457,-0.002954663,-0.033851992,0.028084137,0.049984563,-0.034799658,0.12715526,0.0022013024,-0.013707134,-0.013208343,0.016717963,0.007414473,-0.02800823,0.02519174,0.0071738083,-0.035320956,-0.028565133,0.032993365,-0.024231223,-0.035258126,0.01319454,-0.05348405,0.009703235,-0.01830634,0.037203696,-0.028130943,0.028596569,-0.020264762,0.03360635,-0.106222644,-0.054848675,0.018819194,-0.014625212,-0.007297674,0.034378115,-0.037865836,0.02136214,-0.015286976,0.021740308,-0.040789448,0.0130723845,-0.051628217,0.025059724,-0.012155245,-0.01909115,-0.0089715645,0.05989498,-0.0072588543,-0.026282743,0.046516214,-0.009293198,0.05843874,0.023843251,0.02932464,0.025475241,-0.02044429,0.009073292,-0.025154386,0.0053256103,0.0026923548,0.017530689,-0.0035606045,0.035830583,-0.019780867,-0.013929586,0.053181157,-0.054392047,0.038314864,0.044932976,0.01184618,0.02176412,0.023423837,-0.010816418,-0.013529263,-0.0019354759,-0.0560011,-0.055085026,-0.0055867005,0.016541893,0.015537797,0.04535034,0.0052841837,0.037248567,0.01352186,-0.1979317,0.006160025,0.006850977,-0.040751204,-0.004369949,0.04064545,0.039656296,-0.02493467,0.0045596063,0.028883783,0.04503849,-0.016302703,0.02162701,-0.023139345,-0.026172113,0.007984662,-0.0051702056,-0.016776158,0.019596089,0.02381102,0.009267664,0.06699985,-0.03642522,-0.010303072,-0.044017404,-0.03330822,0.02444236,0.026801122,0.026264466,0.0049245525,0.03886901,-0.007290205,0.029643172,0.023572203,-0.02568261,-0.027949637,-0.018282544,-0.00036979967,-0.10496155,0.03530106,0.03702507,-0.009763167,-0.04619557,0.010832198,0.007399566,0.0392493,0.030743161,0.035264365,-0.022813449,-0.0067628277,0.02041223,0.007929518,-0.09829826,0.020780267,0.0011111198,0.061214667,0.02820267,0.0026310598,0.02514305,-0.030824646,0.06052254,0.036380358,-0.013698591,-0.007378641,-0.005350614,0.015731143,0.050001618,-0.019940356,-0.01597177,0.014699678,0.045971744,-0.04186883,-0.0047027473,-0.009974835,0.025100531,-0.0440284,0.019647961,-0.012330331,-0.07797492,0.0045074187,-0.02557935,-0.037429925,-0.016501067,0.04058384,-0.03634184,-0.047024496,-0.06457501,0.018312821,0.038611185,0.014876067,-0.015845167,-0.040225063,-0.019673709,-0.02911456,0.01653073,-0.02590809,-0.045939676,0.020184226,-0.021031508,-0.018876858,0.018576542,0.0072520357,-0.01828103,0.02840076,0.051294997,-0.039506927,-0.10757072,0.029141247,-0.044928502,-0.030013837,0.04657773,0.02817939,0.04332078,-0.008916536,0.008525455,0.00044102955,0.0104547655,-0.03094644,-0.034359924,-0.032122705,-0.01317664,-0.024692293,-0.018925862,0.0038864156,0.020266714,-0.0022598896,-0.04065806,0.04965369,0.0013075111,0.025163257,0.007149542,-0.06185514,0.03283686,-0.010969592,-0.021082215,0.042784274,0.011626821,-0.005682827,0.028414909,0.012293192,0.086420976,-0.060073048,-0.041298945,0.0507853,-0.0041593425,0.015386972,-0.012166669,-0.009116234,0.013596184,-0.021512078,-0.018152403,-0.093007155,0.006366144,-0.0118351225,-0.02218565,0.03012331,0.021900883,0.025902683,0.014966071,0.039506353,-0.017234426,-0.051689,-0.018674033,0.014298033,-0.0142566655,-0.007681788,-0.012585115,-0.04529435,0.02754477,0.0069072735,-0.021106498,0.034553498,0.01726032,0.021510553,0.01870304,-0.01975734,0.05457044,0.004797819,0.0008513612,0.038669225]
15	users	Table: users\nDescription: ผู้ใช้งานในระบบ login ด้วย email และ password user คนหนึ่งสามารถเป็นสมาชิกได้หลาย team และมี role ต่างกันในแต่ละ team\nColumns:\n  id                  UUID PRIMARY KEY,         -- รหัส user สร้างอัตโนมัติ\n  email               VARCHAR(255) NOT NULL UNIQUE, -- อีเมลสำหรับ login ต้อง unique ทั้งระบบ\n  name                VARCHAR(255) NOT NULL,    -- ชื่อจริงของผู้ใช้\n  password_hash       VARCHAR(255) NOT NULL,    -- bcrypt hash ของรหัสผ่าน ไม่เก็บรหัสผ่านตรงๆ\n  instance_role       TEXT NOT NULL DEFAULT 'USER', -- สิทธิ์ระดับระบบ: USER (ทั่วไป) หรือ ADMIN (จัดการทุก team ได้)\n  display_name        VARCHAR(120),             -- ชื่อที่แสดงใน UI แทนชื่อจริง เช่น ชื่อเล่น\n  email_verified_at   TIMESTAMPTZ,              -- เวลาที่ยืนยัน email ถ้า NULL = ยังไม่ยืนยัน\n  created_at          TIMESTAMPTZ NOT NULL,     -- วันที่สมัครสมาชิก\n  updated_at          TIMESTAMPTZ NOT NULL      -- วันที่แก้ไขข้อมูลล่าสุด	[0.015544718,0.029251179,-0.026337776,0.0016544807,0.0042520915,-0.06382355,-0.05256142,-0.03530478,0.05258324,0.023797406,0.013439419,0.009334943,0.1277635,0.03756525,-0.0110819405,-0.011990799,-0.009580555,-0.020683857,-0.012568286,-0.009722725,0.049243134,-0.043865,0.022803985,-0.0047122864,0.022498045,-0.02768477,0.0008562876,-0.013917177,-0.019602336,0.008945,0.032548964,-0.01719102,-0.026624672,0.04612895,0.02425698,0.00964651,-0.0056001525,-0.013350954,0.00038042935,0.00047031982,0.025729258,5.125201e-05,0.02927754,-0.039137494,0.024601849,-0.022098633,0.05050193,0.017313179,-0.03318992,-0.023835264,0.025637522,0.023964928,0.029060917,0.0018927207,-0.02240791,-0.021357762,0.024801403,0.030605774,-0.037320945,0.03402075,-0.008999466,0.0383449,-0.0011568142,0.020571,0.013696335,-0.009284419,0.014578741,-0.017898766,-0.032772735,-0.03138783,-0.014157318,-0.006734734,0.10521307,-0.0098141115,-0.024554182,-0.0036963567,-0.06958914,0.01612311,0.018693246,0.000854096,0.042855892,0.019004552,0.031437706,0.007321371,-0.016499901,-0.014100006,-0.011137795,0.05850625,0.04503927,0.05247888,0.0058007413,-0.043722723,-0.039785147,0.007745192,0.033836104,0.03714267,-0.014363484,0.007844566,0.058231052,-0.040901255,-0.012696561,-0.09683524,-0.039721116,-0.033846416,-0.06691132,-0.041276533,-0.0035631307,-0.047685076,0.042992726,-0.038766894,0.005665405,0.004172196,0.005504253,-0.04707004,0.042313367,-0.032543186,0.062327623,-0.056990318,0.016086541,-0.0479962,-0.050994452,0.014791955,-0.021053962,-0.0051936433,0.054068305,-0.022571169,-0.012519773,-0.0048461794,0.026890622,-0.05609699,-0.03511051,-0.050978992,0.008108464,0.02052831,-0.026677527,0.05182122,0.03912626,-0.014080018,-0.007014131,0.0058426694,0.038736407,-0.023224877,0.030576222,0.056532398,0.0058258367,-0.07777168,-0.00362016,0.016149553,-0.0117463125,0.010307561,0.037948996,-0.06405519,-0.04185503,-0.003289797,0.043768913,0.011084685,-0.018444918,0.0023506235,0.024189187,0.055336937,0.027234532,-0.013382729,0.0008180136,-0.039526943,0.034375146,0.0022672468,-0.014346323,0.012718147,-0.036873244,-0.010379093,-0.016822247,-0.04596222,-0.09925445,0.030856792,-0.021606278,-0.016302608,-0.029549003,-0.044445604,-0.020472357,-0.06160948,-0.083155744,0.0004954528,-0.035707455,0.026973817,-0.01836949,-0.019125998,-0.005673555,-0.0238477,0.037641477,-0.000620137,-0.017864784,0.06898332,0.0003847898,0.03136094,0.03611037,-0.011052682,0.03606628,0.025795521,-0.0071021584,-0.058514003,0.009245322,0.0033194537,0.05475986,0.045434333,0.034974303,-0.071866944,-0.02048592,0.032583687,0.011611887,0.015943265,-0.0065968772,0.04667984,-0.00939947,0.04799696,-0.028640252,-0.0412239,0.017953036,0.0049651526,0.0012966598,0.037506353,0.010327852,-0.04439474,0.058384053,0.035949048,-0.014162897,0.013410342,0.015675157,-0.012726645,0.03184692,0.058681756,0.052981704,0.08274283,-0.008751929,0.04348059,-0.025668917,-0.020557132,0.01964935,-0.005362902,-0.006807416,-0.09781622,-0.023144936,0.030091427,0.023211423,-0.022358665,0.020320736,-0.022654617,-0.06225312,0.046094965,-0.026197374,0.01963191,0.042989496,-0.044150595,0.0046003317,-0.03289785,0.016454358,0.023306595,-0.023290968,-0.0028539805,0.03958911,0.004572582,0.0051497933,0.0036277736,0.010128037,-0.0365362,0.016314128,0.012769282,0.009564169,-0.01438296,-0.06957343,0.0068143834,0.009629583,-0.011306179,-0.044958025,0.008877231,0.02733943,-0.009324925,-0.068194136,0.034854196,-0.01484214,-0.057411503,-0.039973095,0.04772659,-0.054930735,-0.03537078,-0.042255376,0.0033522504,-0.0419148,-0.0024838704,-0.055971712,0.018890798,0.01703869,0.07322535,-0.014430334,0.0124265645,0.06396145,0.016201524,0.03173875,0.006655717,-0.0210994,-0.0049278806,-0.02213438,-0.0033578328,0.03155785,-0.057143282,-0.008674977,0.021416713,0.12741458,0.0054520904,-0.055584628,0.057164416,-0.029864868,-0.0003290635,-0.0102459565,0.05144429,0.04808517,-0.03464992,0.021121139,0.055645265,-0.0073160403,0.05068049,-0.03135979,0.013309898,-0.0100643225,-0.056287624,0.048564248,-0.050082464,0.03734403,-0.003642041,0.062766984,0.03270835,-0.014550105,0.0019992788,0.0026837932,0.039572287,-0.052114308,0.0212075,-0.053089026,-0.030798113,0.09208608,-0.006882144,-0.02258544,0.02960136,0.035374757,-0.010296351,0.059610613,-0.06745008,-0.026040312,-0.059575655,-0.029920992,-0.0046362304,0.05252655,-0.047022067,0.023997033,-0.018113459,-0.017812539,0.013795304,0.010416907,-0.021564357,-0.03871425,0.00881851,-0.03089189,0.025539674,0.027438264,-0.0004006044,0.025896888,0.010059026,-0.0771061,-0.027701624,-0.008655749,-0.008760269,0.074959405,0.051208545,-0.048045337,-0.025234416,0.02206874,-0.01873834,0.007574286,-0.068419956,-0.014032799,0.021061463,0.039190706,0.058237292,0.045120522,0.027112113,-0.05408771,0.014808416,0.013674815,-0.07802904,0.033927213,-0.0107207205,0.052563623,0.0030913316,-0.027552899,0.043132566,0.047656335,-0.0069637643,0.011369428,-0.004633854,0.02535028,-0.04264921,0.054608095,0.016704507,0.0093047265,0.054012965,0.045136686,-0.003186843,-0.006156222,0.030197164,0.0497462,-0.026950778,0.041737475,-0.045590702,0.0358041,0.0038651673,0.007401109,-0.019172788,-0.011969381,0.03543463,-0.0038963798,0.020635774,-0.043012213,0.02251905,0.026562907,0.011033034,0.02104406,-0.0928923,0.010784731,0.011227336,-0.011260417,-0.005336038,-0.046491344,-0.00023755625,0.013073487,-0.0054176026,-0.0022181044,-0.023043111,0.012377157,0.030035937,-0.029029634,0.015973527,-0.00651933,-0.02706298,0.0027879837,-0.0060372367,-0.018716587,-0.010983338,-0.029990349,-0.0018009573,-0.03536207,0.0080468925,-0.00023808918,-0.0141308755,0.0081781205,0.0020489977,0.05137672,-0.044327717,0.037446808,-0.027131986,0.025280312,-0.11630496,0.024250977,0.053369936,0.0006437529,0.005816983,-0.054993857,-0.06633645,0.014873759,-0.059504762,0.023769757,0.0047236886,-0.02362632,-0.018466176,0.024578037,0.040615298,0.00031217057,0.036302786,-0.024449443,0.023860471,0.0286016,-0.017577615,0.014149357,-0.012015086,-0.043007202,0.009634352,-0.00813618,0.024234101,-0.0866498,0.037382666,0.0532308,-0.030921226,-0.026886437,0.030386485,0.05491855,0.004103021,-0.0031253383,0.04893402,0.017194193,-0.0732893,0.03689472,0.024493081,-0.005719132,-0.030898517,-0.034976397,-0.01247269,-0.042577494,0.018709823,-0.021168826,0.036391053,0.035476826,-0.040163733,0.12611309,-0.014480056,-0.02588782,-0.008450558,0.039741833,-0.020139607,-0.008120656,0.02575726,0.025058703,-0.030348882,-0.02033101,0.0075051757,-0.040525656,-0.006006012,0.018332463,-0.05312067,0.0040921294,-0.02140222,0.04813582,-0.01492869,0.017882027,-0.05423997,0.021519177,-0.10823805,-0.033328496,0.03147491,-0.0042282105,-0.025699323,0.043214083,-0.038150016,-0.0037467622,-0.020170564,0.017652864,-0.05350016,0.027944338,-0.02760261,0.014856864,-0.020991655,-0.009711509,-0.0063454974,0.041525338,0.001385678,-0.047893044,0.06520694,-0.04076153,0.051419143,0.010508108,0.024907123,-0.004579757,-0.020739818,0.014094488,-0.032347497,-0.0036622433,0.0089566745,-0.015255202,0.018678203,0.023773132,-0.02477312,-0.024322195,0.050205536,-0.074229226,0.020361224,0.045941915,-0.016513912,0.044291273,0.044068284,-0.010457711,-0.026512222,0.0032497135,-0.065514155,-0.05298607,-0.016713977,0.0044011385,0.007206188,0.040394176,-0.0072284536,0.057566065,0.0038127382,-0.21475677,-0.014636959,-0.0020587505,-0.045768913,-0.007530583,0.041987572,0.026973372,-0.020011412,-0.014191105,0.01687447,0.05260023,-0.03177689,0.025757726,0.008568262,-0.071926445,-0.004930322,-0.023234958,-0.006877782,0.01594327,-0.016043669,0.011291052,0.057183105,-0.04852378,0.0020055212,-0.021263357,0.004746352,-0.022136288,0.0300753,0.007977794,0.0163477,0.05663271,0.011283873,0.022942197,0.024599265,-0.0227406,-0.027231546,-0.011977032,0.017572071,-0.07645328,0.037271902,0.006347036,-0.008691129,-0.039832093,0.007308153,-0.001350161,0.04887332,0.025183378,0.037072454,-0.026297167,-0.009356481,0.0017137416,0.014585445,-0.097513095,0.007779055,0.009365777,0.037127513,0.02284843,0.01919058,0.0499871,-0.022265334,0.054226093,0.0663932,-0.037177347,0.004105323,-0.022303801,0.029694676,0.077460006,-0.044497408,-0.016859235,0.04025759,0.05431162,-0.043563113,-0.015973136,-0.004514251,0.025193421,-0.03515744,0.007983342,-0.013259943,-0.048638042,0.03036342,-0.032589734,-0.026233774,-0.002895149,0.016748512,-0.03199902,-0.03795304,-0.053653233,0.0133596705,0.030813655,0.034568585,-0.008709464,-0.052327443,-0.021559827,0.028950524,0.0016260226,-0.009882921,-0.033014882,0.0072721257,-0.019677851,-0.032937236,0.009232962,-0.008587174,-0.05253139,0.006588887,0.04690829,-0.032296356,-0.11940246,0.044057194,-0.02291019,-0.06288495,0.046871305,0.02186679,0.036399957,-0.019112274,0.010024614,0.017524477,0.033167306,-0.049698874,-0.051650845,-0.04761553,-0.01444923,-0.017060544,0.011197429,-0.0009314105,0.039335746,0.024426565,-0.01404552,0.03862008,0.010052713,0.049002092,0.0009012551,-0.06730678,0.04685868,-0.0059208996,-0.009800188,0.04122547,0.028779887,0.0020081117,0.03271435,0.016057303,0.0943968,-0.081085645,-0.032568082,0.026826432,0.01930989,0.044595294,0.0073910872,-0.0048004156,0.015090791,-0.010180584,0.009867036,-0.07440294,0.020065928,-0.019389454,-0.026568113,0.01482838,0.02928997,0.014859843,0.0114682475,0.030742666,0.009883649,-0.053189527,-0.020441351,0.010193126,0.008653508,0.008601142,0.0013902643,-0.020384721,0.02848371,0.03561304,-0.034164242,0.028288597,0.012288126,-0.0074336315,0.02125645,-0.031020835,0.055371765,-0.00056858675,-0.027604898,0.02577185]
\.


--
-- Data for Name: schema_embeddings_long; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_embeddings_long (id, table_name, content, embedding) FROM stdin;
1	catarories	Table: categories\nDescription: หมวดหมู่สินค้า ใช้จัดกลุ่ม products หนึ่ง category มีได้หลาย products\nColumns:\n  category_id   INTEGER PRIMARY KEY   -- รหัส category\n  category_name VARCHAR(15) NOT NULL  -- ชื่อหมวด เช่น 'Beverages', 'Seafood', 'Dairy Products', 'Condiments'\n  description   TEXT                  -- คำอธิบายหมวดหมู่\n  picture       BYTEA                 -- binary รูปภาพ\nRelationships:\n  - category_id ถูกอ้างอิงโดย products.category_id (one-to-many)\nCommon Queries:\n  - JOIN products ON categories.category_id = products.category_id\n	[0.03253661,0.02877737,-0.011614223,0.021698147,0.039182715,-0.02682068,-0.020649564,-0.04465677,0.035441417,0.06344374,0.026420204,0.011588775,0.1113647,0.042714555,-0.011362444,-0.057090152,-0.009220263,-0.029208126,0.024276614,-0.025649918,0.028931301,-0.031940196,0.032366045,-0.02140562,-0.015469989,-0.027725779,-0.00018279797,0.0036773018,-0.02135537,0.0452281,0.024852697,-0.032888073,-0.022297928,0.04639585,0.009081127,-0.018749438,-0.005790487,-0.015837895,-0.006981212,0.0036205663,0.020296369,-0.0017619727,0.04459401,-0.0356272,0.037165225,-0.017470267,0.044956744,0.0038860831,-0.014052867,-0.0031516836,0.013972037,-0.021314375,0.041768957,0.019442026,-0.0273971,-0.012260309,0.03880278,0.06529352,-0.021397412,0.033543933,-0.017747257,0.03465815,-0.028082257,0.0086914785,0.02431069,-0.033938568,-0.008441542,-0.019003594,-0.047890548,-0.029467504,-0.00049191545,-0.0009339926,0.08539483,0.0013620504,-0.019777128,-0.0070385183,-0.040264186,0.024689957,0.01772944,0.031317644,0.03684266,0.03192283,0.030640746,0.042555768,0.038162045,0.0047893655,-0.0141656725,0.06396378,0.034738433,0.061943356,0.018815024,-0.030837836,-0.044923164,0.048998117,0.009017462,0.005602965,0.019699484,0.0009715186,0.025247667,-0.043685034,-0.026677076,-0.06525787,-0.013343554,-0.03960545,-0.10293303,-0.02192223,-0.011504871,-0.04782852,0.07152406,-0.035284694,-0.007553428,-0.014256052,0.011558557,-0.023639733,0.020629238,-0.05257887,0.07157205,-0.04792458,0.0058126803,-0.043021813,-0.03325216,0.017125797,-0.036309082,-0.024804547,0.043317918,-0.070499934,-0.009724009,-0.0058507463,0.03562349,-0.033833258,-0.02895681,-0.032955077,0.0052643837,0.015763545,-0.008300685,0.0546127,0.030605998,-0.007366531,-0.0096154,0.013980363,0.014797983,-0.073656715,-0.011875412,0.07873417,0.0210553,-0.05816183,-0.0061800424,0.012819537,-0.00473932,0.021747408,0.022152781,-0.05524764,-0.033112537,-0.026934946,0.018932862,-0.0032550623,-0.023045093,-0.014216079,0.004346454,0.0057129688,0.017498234,-0.013604201,5.6850124e-05,-0.0044456325,0.03131212,0.010531888,-0.013085815,0.038383327,-0.017547676,-0.026815614,0.01616942,-0.046741974,-0.075912595,0.012530768,-0.032315966,0.0030253173,-0.024486823,-0.009403447,-0.012148466,-0.06054914,-0.042794317,-0.02228315,-0.043842204,0.028393015,-0.00045979212,-0.02049617,-0.0027254673,-0.016333926,0.04254867,-0.0013748134,0.017535951,0.0736972,0.00026319476,0.029837264,0.021920675,-0.014372985,0.007786259,0.026520498,0.0031015673,-0.061279986,0.031216864,-0.0056868135,0.03068548,-0.009412759,0.021925643,-0.022869347,-0.02967969,0.023158368,0.029771142,0.020645365,-0.016144495,0.017301908,-0.044570934,0.007761584,-0.0132814795,-0.06544442,0.03712491,0.04066639,-0.038586892,0.02080433,0.027730381,-0.031193666,0.07722199,0.024080819,-0.009632902,-0.0074940315,0.013259262,-0.0008296211,0.027044356,0.036761977,0.021882689,0.06511632,-0.05242667,0.02083896,-0.012594404,-0.018946765,0.027972067,-0.007288454,0.008687443,-0.113063574,-0.015915792,0.008798082,-0.018393986,-0.03768285,-0.012230611,-0.03571269,-0.056717444,-0.0066444115,-0.04116242,0.023580186,0.019647254,-0.050859172,0.023997806,-0.034237824,-0.0034440816,0.0015420171,0.0057900674,0.025695827,0.048559222,-0.009164756,0.027278136,-0.023589712,0.0025297645,-0.064838804,0.039375555,0.032750722,-0.0011355021,-0.009301472,-0.03843578,0.003695194,0.01651743,-0.042077556,-0.03527489,0.020293975,-0.015384832,-0.012981218,-0.042406864,0.026004855,-0.0018317895,-0.010984462,-0.040282823,0.042700145,-0.049130924,-0.030873239,-0.04468655,-0.008299278,-0.05581757,-0.024362378,-0.053911358,0.00027493032,0.04563704,0.042350292,-0.0018642767,0.018988168,0.05474184,0.0012173484,0.028275818,-0.00028414244,-0.016918676,-0.023037512,-0.06485018,0.014855922,0.044434953,-0.060141876,-0.021691306,-0.005726457,0.12383358,0.019838963,-0.04603543,0.03277268,-0.020894315,-0.006860651,-0.016998608,0.030798858,0.059770897,-0.05771318,-0.0035396153,0.05285494,-0.0013078972,0.030109249,-0.025684314,0.009679343,-0.012792743,-0.11154931,0.027819037,-0.050511558,0.018125651,-0.008202934,0.039428744,0.023811389,-0.034715507,0.02696452,0.051057693,0.060969412,-0.037148096,0.050271004,-0.045366757,-0.027839318,0.08505058,0.0094465995,0.006197809,0.03884766,0.023835436,-0.0037248214,0.077079736,-0.07005287,-0.01250095,-0.059725035,-0.031990923,0.028409105,0.054458994,-0.07509392,0.006258524,-0.001892451,-0.056353312,0.039951146,0.024238981,-0.018869756,-0.033828843,-0.0048425994,-0.02857309,0.0119804675,0.0028763292,-0.0022469803,0.022426708,0.03731993,-0.08193243,-0.048485216,-0.030531367,0.021631936,0.08151569,0.031641927,-0.059868257,-0.0071221567,0.027186818,-0.03216354,0.028128378,-0.073124595,0.0013767823,0.032841723,0.040001303,0.05559736,0.04687203,0.036474206,-0.03234454,0.03493291,0.00010509784,-0.05995647,0.029513042,0.017160693,0.02375903,0.037030246,0.010249864,0.034995664,0.04795035,-0.015442754,0.016396293,-0.0007568404,0.024988687,-0.034352794,0.01939735,0.03412011,0.011439728,0.060165316,0.034006495,0.04352269,0.0009678279,0.010272583,0.013202904,-0.0079990495,0.048440706,-0.00960946,0.033678573,0.016496783,0.020801723,-0.047156587,0.006867893,0.04013422,0.010237743,0.010727052,-0.071844265,0.053817272,0.0102978395,0.014958632,0.0064704297,-0.07206349,-0.0006472217,-0.018131483,-0.018594362,-0.016616296,-0.019321654,-0.003728117,0.03791469,0.033525463,0.008336625,-0.032028675,0.053109188,0.01615898,-0.040168095,0.026365047,-0.023263037,-0.030532544,0.025303133,-0.013845121,0.00032219972,0.0129894605,-0.050027527,-0.009411024,-0.038313337,-0.004471572,-0.024769165,0.009473998,0.0011782689,-0.010282101,0.018829525,-0.04175407,0.07163171,0.0055788145,0.03811246,-0.13325414,0.025435215,0.05948767,0.008855654,-0.00086585217,-0.014680407,-0.0805793,0.0317783,-0.04338672,0.028091129,-0.025389398,-0.047385827,-0.02390963,-0.010019482,0.022122946,-0.01839868,0.047427755,0.014180511,0.025430452,0.012698641,-0.032234833,0.02388913,-0.024709098,-0.019085588,0.024564318,0.03632277,0.02650474,-0.104142025,0.050902966,0.040037,-0.013522371,-0.026229179,0.027519763,0.023049789,0.009361753,-0.0040593212,0.061902955,-0.0011264695,-0.046534635,0.05073923,0.02707784,-0.011244296,-0.04345744,-0.066892795,0.0063458323,-0.024236618,0.010068822,-0.053248927,0.050162017,0.03649219,-0.031778645,0.13079478,-0.019116431,-0.03754596,-0.0137107,0.009334995,-0.00765599,-0.044500574,0.035615675,0.0202517,-0.012669002,-0.010031966,0.04694271,-0.036684632,-0.016973075,0.021125164,-0.05287587,-0.0016140684,-0.052221235,0.033819165,0.0015052153,0.04350568,-0.06282893,0.05058534,-0.111407414,-0.0667266,0.016611204,-0.025312858,-0.022876492,0.0529421,-0.043753903,-0.011669271,-0.023271909,-0.009884808,-0.054986984,0.008704922,-0.02463488,-0.006181829,-0.020551318,0.007774004,-0.044405103,0.0668413,-0.005744449,-0.012111662,0.03076257,-0.043851677,0.0657815,0.008709293,0.005023713,0.02570306,-0.001257086,0.0064079124,-0.016213166,0.007895088,0.043652188,-0.021946928,0.030046241,0.0102599235,-0.004831632,-0.039441794,0.06572553,-0.05038316,0.047091667,0.04985233,0.0008440895,0.05759538,0.022270143,-0.004431846,-0.0062711667,-0.0011381228,-0.047026202,-0.05306563,-0.03662435,0.006802926,0.04785356,0.025748841,0.00986947,0.02739805,0.039167322,-0.20284322,0.027753936,-0.01968487,-0.01817208,-0.007937711,0.021366585,0.021879401,-0.02330615,0.00018274285,-4.333227e-05,0.010894812,-0.040152952,0.0074738227,-0.009223979,-0.05991241,0.031100335,-0.006144592,-0.004828739,0.024194188,0.0018989398,0.0039204243,0.034699142,-0.041350868,-0.0077236295,-0.03020561,-0.008921505,-0.014087102,-0.009484751,0.0066249995,0.03206464,0.009217175,0.024576461,0.010068747,0.029074207,-0.021715447,-0.011138093,-0.00015728896,0.0042428807,-0.054578356,0.05950635,-0.014615345,0.014806501,-0.022406047,0.013188199,-0.0048938133,0.061450288,0.039594248,0.015672967,-0.034980405,0.0153122535,0.040773865,0.0025942093,-0.09716001,0.014886704,-0.016044468,0.05992837,0.011158647,0.017258465,0.050936904,-0.0014665427,0.04399997,0.04622342,-0.042409558,0.0050193206,0.00039318323,-0.0018409202,0.050931294,-0.0510934,-0.029291112,-0.007833322,0.039372694,-0.0330123,-0.017796556,0.012578255,0.02613671,-0.033405684,0.01497304,-0.041104168,-0.06717366,-0.004117493,-0.021889076,-0.0092212465,0.0050287624,0.03176188,-0.04345682,-0.014566473,-0.02659544,-0.001545346,0.035615914,0.003417429,-0.0022439547,-0.03475469,0.0146616865,0.017963208,0.008374067,-0.014557352,-0.041356906,0.032678165,-0.030809917,-0.021890633,0.008426054,-0.004121477,-0.039693944,0.02453345,0.062461574,-0.049222127,-0.10324262,0.0028576448,-0.0049260883,-0.06038948,0.06917733,0.056807965,0.06440337,-0.020949457,0.020429721,-0.010381448,0.012417624,-0.030475702,-0.035771217,-0.030553883,-0.00914726,-0.0023507467,0.008272034,0.006083636,0.042882513,0.018535707,-0.03205543,0.046487585,0.010408399,0.045581207,0.0009996851,-0.04284082,0.03480904,-0.025335826,-0.051808756,0.022318585,0.022830918,-0.022965956,0.030453203,0.028855423,0.05931289,-0.08108372,-0.026169727,0.045522608,0.0047455877,0.0053311517,0.03242994,-0.004617431,-0.011566032,-0.048287638,-0.00219091,-0.099925414,1.756228e-05,-0.015786303,-0.019014757,0.01560837,0.010293286,0.021457667,-0.007147044,-0.00852018,-0.010042518,-0.03713038,-0.006594664,0.037627403,0.0021311676,0.012443621,-0.036399446,-0.0026482148,0.0106494585,0.024436671,0.0010654676,0.04884995,0.043894295,0.017738022,0.021330468,-0.01873599,0.05504422,-0.028801162,-0.030502088,0.039872292]
2	customer_customer_demo	Table: customer_customer_demo\nDescription:\n  Junction table เชื่อมลูกค้า (customers) กับประเภทลูกค้า (customer_demographics) ใช้เมื่อต้องการรู้ว่าลูกค้าอยู่ใน demographic segment ไหนบ้าง\n  ส่วนใหญ่ JOIN พร้อมกับ customers และ customer_demographics เสมอ\nColumns:\n  customer_id      VARCHAR(5) NOT NULL  -- FK → customers.customer_id\n  customer_type_id VARCHAR(5) NOT NULL  -- FK → customer_demographics.customer_type_id\n  PRIMARY KEY (customer_id, customer_type_id)\nRelationships:\n  - customer_id      → customers.customer_id             (many-to-one)\n  - customer_type_id → customer_demographics.customer_type_id (many-to-one)\n	[0.016919147,0.044376187,-0.01610984,0.023464436,0.01448051,-0.025482193,-0.022533325,-0.035226077,0.036205284,-0.0050050565,0.009462089,0.0028556157,0.11543857,0.033593368,-0.02771947,-0.021771284,-0.0026552882,-0.0012398526,0.043336257,-0.026828324,0.047895335,-0.040002413,0.017638935,0.013992127,0.013690073,-0.008560346,-0.02312125,-0.0023108355,-0.04027898,0.053028353,0.04491971,-0.04591948,0.00092754257,0.048084896,0.022243604,0.03974202,0.013627717,-0.013033746,0.024089437,-0.009568801,-0.005493626,0.012264537,0.023853697,-0.049826037,0.053202547,-0.01413288,0.024624713,-0.0061711604,-0.026123779,0.0022061812,0.041408755,-0.006374347,0.069700465,0.008379037,-0.049294695,-0.030909762,0.041536942,0.055603493,-0.02397047,0.018222218,0.004242366,0.053740207,-0.028670307,0.031824496,0.023910768,-0.032325353,-0.0043000453,-0.01616501,-0.03858634,-0.012512254,0.0070381574,0.0073222267,0.101354286,-0.016782247,-0.01065635,-0.01100813,-0.025113499,0.0041563725,0.005603037,-0.0071041225,0.040033948,0.04353813,0.01663073,0.02007365,0.027359584,-0.009678825,-0.01669658,0.059301548,0.01892647,0.029690042,0.04793281,-0.033266857,-0.027809056,0.051705286,0.017360056,0.019691072,0.03478575,0.0073839226,0.040694818,-0.05725846,-0.0053974264,-0.068674095,-0.02799323,-0.04122062,-0.07067605,-0.024665097,0.0023268962,-0.046857208,0.048994504,-0.051910516,-0.018542107,0.040743064,0.02625469,-0.040473975,0.035240322,-0.010782499,0.055062383,-0.052416995,0.023053491,-0.06853932,-0.030945687,-0.005435392,-0.016029146,-0.00042364674,0.034335047,-0.035373334,0.0017282724,0.00016467248,0.036676105,-0.030996291,-0.012222253,-0.07278829,0.022618564,0.018040078,-0.027382957,0.028445767,0.031307783,0.02087364,-0.0496947,0.0054803146,0.074302346,-0.051786505,0.0007569722,0.060471244,-0.001899699,-0.084949754,-0.014993508,0.029843898,-0.031478208,0.016660502,0.024585916,-0.059975974,-0.014990711,-0.051655963,0.029707473,-0.002786424,-0.04751879,-0.0008019498,-0.005547798,0.010654546,0.01971498,0.0048668184,0.016361983,-0.011724731,0.03751737,0.035096116,-0.02225738,0.014919621,-0.0030627847,-0.011006736,0.01388134,-0.061986692,-0.060862917,0.013079025,-0.0012385276,-0.0024441755,-0.033473056,-0.033164687,-0.037502836,-0.071243644,-0.05991923,-0.007946512,-0.012122511,0.029345427,-0.008931026,-0.01923677,-0.026689403,-0.0013785829,0.020638164,-0.0014143542,-0.031504124,0.059886735,0.030691197,0.020557158,0.029681407,0.013878537,-9.607642e-05,0.00057379855,0.026299404,-0.070549,0.013958376,0.012207427,0.052282117,0.0075618103,0.014635491,-0.0673607,0.0063374927,0.046261553,0.014370968,0.005732148,-0.02239703,0.014724683,-0.025758235,0.013682995,-0.036644317,-0.063913524,0.01497461,0.030894851,-0.030240405,0.025762213,-0.0044632405,-0.018537488,0.053816557,0.01638722,-0.009816739,0.017953927,-0.009173713,-0.009034307,0.05443438,0.016965725,0.054287646,0.07239948,-0.03695109,0.03142842,0.0005016775,-0.0049246093,0.031455077,-0.009341925,0.0084577715,-0.09823026,-0.013652727,-0.000187745,0.003279611,-0.027362904,0.0093128495,-0.041601192,-0.037296217,0.02954057,-0.05994475,-0.0055813515,0.004854453,-0.060043838,0.041795492,-0.053613894,-0.00015332834,0.010618449,-0.015006541,0.013429047,0.029647682,-0.0051160306,0.01431526,-0.028061708,0.008380926,-0.06982298,0.054777343,-0.0017341728,0.029986957,-0.010660329,-0.0564404,0.00074381917,-0.009823967,-0.019136032,-0.0604476,0.011466248,0.0089615,-0.01337489,-0.050889973,0.0074553476,-0.016849726,-0.034164403,-0.038832065,0.026938694,-0.047147017,-0.012691689,-0.043970756,0.019307049,-0.06275624,-0.02908269,-0.056103315,0.013402294,0.044021666,0.08852693,-0.02311285,0.0044865864,0.053775083,0.010153834,0.009658578,0.008983783,-0.004010693,-0.021994825,-0.023752293,-0.009045891,0.009316804,-0.06091824,0.015481587,0.025319625,0.11285197,-0.009539626,-0.042807497,0.031485017,-0.034647405,-0.012217533,-0.009142722,0.02185431,0.0144821685,-0.048651617,0.024345381,0.09282786,0.010453331,0.019945668,-0.051347703,0.019428724,-0.022091333,-0.07519639,0.022521785,-0.044069123,0.026957544,-0.037874594,0.05364989,0.029108407,-0.017281756,0.008900085,0.024791386,0.045652878,-0.04185974,0.044454344,-0.061413992,-0.053537372,0.08274892,0.01919931,-0.03685868,0.031686313,0.033524893,-0.02392344,0.04416267,-0.07717866,-0.00018448077,-0.08087012,-0.010162149,0.026863987,0.03399377,-0.05660648,-0.00039204815,0.009403706,-0.039076168,0.022683896,0.039955273,-0.0064482493,-0.019137625,0.0036714738,-0.01573669,0.021759797,-0.0035018467,-0.00035839298,0.0137175545,0.008595211,-0.057215523,-0.038155217,0.00914926,0.028211148,0.10526887,0.017692082,-0.043407068,-0.010007639,0.029066192,-0.03878315,0.030171553,-0.08732301,-0.0017636599,0.030961026,0.020452106,0.023851436,0.024103181,0.014655963,-0.017447518,0.020548465,0.030000933,-0.0246896,0.02255914,-0.0009346492,0.043382145,0.0033336799,-0.009131008,0.04688657,0.04114131,-0.033972465,0.016557781,0.0059652072,-0.0019709666,-0.05423905,0.032470625,0.014225564,0.016132616,0.068839386,0.042250082,0.028189862,0.005980701,0.029676497,-0.0008396193,-0.022147011,0.039565913,-0.04375613,0.036481217,0.025801016,0.019771457,-0.022298934,0.004672449,0.014516723,0.02022805,0.016412057,-0.042386796,0.019585222,0.0074806707,0.0033251038,0.0018451224,-0.07145262,0.002686341,-0.017602928,-0.0055832798,0.018504627,-0.008963819,-0.006529149,0.0073013958,0.00035106708,-0.0037674382,-0.06407614,0.0156373,0.015814178,-0.019042643,0.050165433,0.018111397,-0.03087475,0.037461683,-0.020945845,-0.015800005,-0.03964033,-0.021955157,0.014244795,-0.021336062,-0.029198738,0.0050196494,0.008137373,0.0069534006,-0.016629513,0.032724883,-0.058046483,0.01870389,-0.016335268,0.020770816,-0.1132869,0.0046018246,0.03428566,-0.019593978,-0.033582456,-0.027617093,-0.08678827,0.005714524,-0.047885384,0.03669853,-0.0028716594,-0.04062932,-0.0040704855,-0.0037695584,0.05166434,-0.0013616822,0.043304306,-0.010437608,0.014055101,0.037881654,0.0020867204,0.013432955,-0.0048743333,-0.028621282,-0.012841986,0.020061849,0.011947042,-0.07367535,0.044996064,0.04011166,-0.03678119,-0.05628096,0.015585438,0.025641017,0.0034271632,0.005494603,0.030457674,-0.007543132,-0.03288487,0.022518484,0.00891329,-0.02114926,-0.04316186,-0.047504213,0.012460126,-0.00702558,0.028858086,-0.02978653,0.051883817,0.027297137,-0.04597989,0.12627585,-0.0050887014,-0.04893569,-0.01167589,0.032124236,0.008435828,-0.026487539,0.03972023,-0.0074626836,0.0004819037,-0.027663808,0.032489713,-0.062684,-0.020852068,0.020223644,-0.06738903,-0.0019652923,-0.056782637,0.028505174,-0.06117446,0.03852656,-0.04755599,0.03872124,-0.09075712,-0.04014534,0.047327325,-0.004857636,-0.042568333,0.051913794,-0.026877705,-0.014203867,-0.019391673,0.057528846,-0.012740261,0.01154596,-0.049695887,-0.0052827736,-0.04558524,0.012502918,-0.008173068,0.06770372,0.018203154,-0.031760763,0.037131898,-0.04442879,0.02934671,0.011103436,0.008389731,-0.020286083,-0.0157517,0.023704162,-0.04076692,0.0026466737,0.035516597,0.0053690383,0.004609197,0.039536852,0.011528716,-0.013212618,0.08161544,-0.0420225,0.047333423,0.03259727,-0.029143857,0.058418423,0.042820893,-0.01429443,0.0045620757,0.024597488,-0.048087683,-0.053156562,-0.043460023,0.0104272645,0.037442125,0.03530515,-0.00057670946,0.03787612,0.012993161,-0.20438935,0.010809814,-0.002648271,-0.04154329,-0.00062793423,0.007223684,0.028333236,-0.025236344,-0.008299935,0.019040197,0.041726995,-0.044135433,0.01268472,-0.02529785,-0.07100524,0.02772346,-0.0061121713,-0.012376805,0.009569208,0.035140526,0.0032871158,0.055158805,-0.005181024,-0.0047087003,-0.052746143,-0.00902454,-0.013609493,0.029215762,0.020407613,0.005995493,0.023812592,0.00026913107,0.00575569,0.011927089,-0.016589535,-0.0026582514,0.008085274,0.0061035366,-0.07365443,0.059476197,-0.01042153,-0.016401898,-0.06444398,0.02575201,0.02053448,0.05902531,0.02490747,0.003049905,-0.03866353,0.0007431117,0.029269883,0.008420439,-0.10782238,0.029931381,-0.0139064165,0.071777835,0.045941565,0.025428906,0.08908561,-0.0030913914,0.033207517,0.05481362,-0.07260751,0.0138909565,-0.016314423,0.0066133495,0.063067265,-0.06078902,-0.034351427,-0.010588998,0.05282302,-0.017631538,-0.0043039303,0.029448599,0.03748236,-0.030823378,0.0074923253,-0.009297549,-0.049931034,0.0057930397,-0.014488204,-0.008500416,-0.018400444,0.026918454,-0.044013813,-0.058360353,-0.023020966,0.018252412,0.05313555,0.019014727,-0.01749341,-0.030627128,0.0053775012,-0.012897431,-0.017269328,-0.019106736,-0.037158173,0.03768105,-0.017318364,-0.007992395,0.0067335754,-0.005703312,-0.0066541787,-0.021355396,0.04981463,-0.04674626,-0.12232002,0.004664634,-0.021280592,-0.06950656,0.060877852,0.030694904,0.05899959,-0.026543017,0.04674792,0.022241406,-0.0008158471,-0.010374252,-0.03705835,-0.04751104,-0.03250273,0.0034058616,0.011270938,-0.014549858,-0.0062313103,0.012872717,-0.05133842,0.057844903,0.02621472,0.029575448,-0.009670199,-0.051595766,0.038732514,-0.04216084,-0.0055435807,0.025258353,0.029001761,0.00015090722,0.04354209,0.019465644,0.056622487,-0.050794117,-0.0303959,0.022422893,-0.035207726,0.0054198415,-0.01649621,0.015952148,0.029940614,-0.014514272,-0.015749827,-0.07116282,0.0076789386,-0.009574621,-0.029474316,0.041106988,0.016270086,0.045246404,0.0014478097,0.014218244,0.008221623,-0.015732922,-0.016876977,0.028106848,0.011958587,0.052115235,-0.041392405,-0.0374581,0.0037015984,0.016268006,-0.03173416,0.038467683,0.06330528,0.03069563,0.009481649,-0.028475469,0.069947384,-0.03138753,-0.007551554,0.05607427]
3	customer_demographics	Table: customer_demographics\nDescription:\n  ตารางอ้างอิงประเภท/กลุ่มลูกค้า (demographic segment)\n  ใช้ร่วมกับ customer_customer_demo เพื่อจัดกลุ่มลูกค้า\n  ตารางนี้มักถูก JOIN ผ่าน customer_customer_demo เสมอ ไม่ค่อยใช้โดดๆ\nColumns:\n  customer_type_id VARCHAR(5) PRIMARY KEY  -- รหัสประเภทลูกค้า\n  customer_desc    TEXT                    -- คำอธิบายประเภทลูกค้า\nRelationships:\n  - customer_type_id ถูกอ้างอิงโดย customer_customer_demo.customer_type_id (one-to-many)\nNote:\n  - ถ้าต้องการข้อมูล demographic ของลูกค้า ต้อง JOIN 3 ตาราง:\n    customers → customer_customer_demo → customer_demographics	[0.022511054,0.034158174,-0.02251262,0.019464474,0.01312786,-0.030963436,-0.02998888,-0.033688985,0.031971067,0.012771463,0.02153118,0.0138731785,0.123278104,0.04554971,-0.023922747,-0.02084585,-0.009101783,-0.015492681,0.047244854,-0.032845736,0.04878795,-0.02369576,0.017918434,0.0033443696,0.02223418,-0.024102995,-0.016975362,-0.006895056,-0.034996822,0.054006077,0.052223753,-0.03756042,-0.018240213,0.039496046,0.016842788,0.048837736,0.0044940505,-0.018456327,0.0048317253,0.004237826,-0.0008267748,0.015774157,0.029310305,-0.060676936,0.054122075,-0.014820784,0.030330447,-0.0054849205,-0.010309421,-0.00088126457,0.04188564,-0.003850222,0.06577286,0.010618738,-0.05706644,-0.013671191,0.035752207,0.041947376,-0.032367177,0.01665235,-0.017709784,0.068473876,-0.018598454,0.044740375,0.02540188,-0.03700976,-0.0037235578,-0.009148869,-0.04160264,-0.017213881,0.013789455,-0.0004085184,0.08997448,0.012444723,-0.004201383,-0.001102781,-0.032992598,-0.00011615755,0.0082567,0.003210096,0.041219287,0.034606095,0.021486834,0.037819203,0.030896027,0.005758653,-0.019772884,0.053381864,0.020654887,0.032422334,0.048078947,-0.018118665,-0.03433104,0.040324416,0.018859595,0.020615779,0.028584102,0.010006485,0.040674653,-0.06155449,-0.020607736,-0.075880356,-0.009253269,-0.038684834,-0.074038416,-0.019366901,-0.012124425,-0.050468214,0.046860237,-0.038780082,-0.022456812,0.02750894,0.024947165,-0.02736887,0.027942065,-0.019556154,0.06294719,-0.0483748,0.018744292,-0.06406407,-0.023859812,0.023634668,-0.0065602213,0.0006781898,0.041118253,-0.04453201,0.009040981,-0.0055821505,0.043048523,-0.040068325,-0.01927332,-0.058500372,0.02378901,0.019169955,-0.010457496,0.028929766,0.023392415,0.028252011,-0.052428473,0.011124753,0.061643694,-0.056869302,-0.0043647075,0.06849624,0.00870654,-0.080162324,-0.004628546,0.012978652,-0.02614425,0.019397737,0.021833694,-0.0486068,-0.018727483,-0.03584323,0.012169193,0.002680564,-0.036591463,-0.004751937,0.013565285,0.011887693,0.008513629,0.002486577,0.0117600355,-0.00505398,0.048444506,0.010054571,-0.022699747,0.011608177,-0.015548585,-0.011215545,0.01745873,-0.0618934,-0.06258193,0.020489546,-0.009657733,-0.0237898,-0.026223248,-0.016788958,-0.030967603,-0.06524885,-0.05870084,-0.005994078,-0.016242025,0.026118748,-0.007565135,-0.02483593,-0.038450718,-0.012932118,0.03141183,0.016834801,-0.010583873,0.07982137,0.016127093,0.02824894,0.016784778,-0.011864912,0.0025472331,0.0041916687,0.0048234463,-0.07066836,0.015962193,0.012106776,0.055664007,0.013698312,0.01184845,-0.059548803,0.0060040983,0.049566507,0.032556828,0.009531529,-0.018971955,0.0020928292,-0.02147064,0.029529663,-0.038758226,-0.06854425,0.027203627,0.046095744,-0.023377107,0.022199396,-0.013958338,-0.021737609,0.069697745,0.022554701,-0.018769203,0.011617079,0.0012780855,-0.01799177,0.05030777,0.04560143,0.050931424,0.06802677,-0.046961144,0.023714487,-0.0015404961,-0.018908544,0.02848481,-0.022801343,0.016018962,-0.11606411,-0.009054129,0.0058901976,0.000878195,-0.033028714,0.011349166,-0.030768877,-0.03332225,0.030099146,-0.07187928,-0.0072916728,0.021813735,-0.05053252,0.030171476,-0.027914986,0.00847972,0.014773055,-0.036334924,-0.0015924106,0.035655826,-0.006165008,0.030423569,-0.02361389,-0.007634074,-0.06833608,0.056678087,-0.0009970327,0.017398374,-0.0026863678,-0.07050824,-0.0111392485,-0.009616502,-0.02680958,-0.052596774,0.0009779541,0.009952912,-0.0062449286,-0.05539491,0.0027441233,-0.016395975,-0.049389474,-0.043956775,0.030167641,-0.05535273,-0.010757984,-0.044872664,0.01273264,-0.056915767,-0.027190732,-0.045071434,0.008966514,0.042141613,0.104301624,-0.011999156,0.008238481,0.05382925,0.0019458266,0.00842445,-0.008372685,-0.0067476477,-0.01755242,-0.03933497,0.013749566,0.0074363006,-0.06898334,0.00025605684,0.016521584,0.11317165,-0.007973702,-0.051802862,0.021736365,-0.022721438,-0.0038719636,-0.014115864,0.023052039,0.018820316,-0.051898513,0.01950319,0.09174989,-0.004363734,0.023664579,-0.009898745,0.019956687,-0.03213254,-0.09407119,0.03479522,-0.03562417,0.024281757,-0.02495731,0.028521163,0.018186912,-0.024130048,0.0037642433,0.036281284,0.04894691,-0.020992666,0.020646645,-0.05440763,-0.040811125,0.08052541,0.020099912,-0.03529352,0.028084679,0.041263267,-0.014968782,0.04661004,-0.06891823,-0.008549764,-0.07966034,-0.01315851,0.026852064,0.03078732,-0.0491523,-0.006798386,0.005842865,-0.047039647,0.023342371,0.043630548,-0.008509205,-0.03125859,0.008946227,-0.018871255,0.022623636,0.024615495,-0.0040714466,0.026399564,0.015747167,-0.061181072,-0.040838648,0.006617883,0.028808422,0.08185015,0.017790142,-0.041192673,-0.01349857,0.041520055,-0.013885344,0.018632742,-0.084145784,-0.0032527973,0.040553115,0.015808525,0.039477624,0.032819737,0.018409884,-0.02681996,0.0063294247,0.027329847,-0.024942128,0.026839968,-0.009737802,0.05480184,0.012426376,-0.0026626664,0.030636389,0.042733654,-0.01863005,0.017507125,0.010841943,0.002270403,-0.037964646,0.027746798,-0.00017269612,0.025086913,0.059406355,0.035755284,0.061340164,-0.0001953262,0.023804393,0.007819485,-0.029831262,0.024083082,-0.043850776,0.035222825,0.020496044,0.026453948,-0.017556243,0.021126362,0.026102668,0.027775861,0.010664463,-0.057206832,0.023531504,-0.008072851,-0.014758537,0.0062549612,-0.06809411,0.001177966,-0.011805111,-0.0077138073,0.018826634,-0.010782511,-0.014269594,-0.005295211,-0.0044809156,-0.012341385,-0.06363194,0.012443893,0.0052612014,-0.021918587,0.06279464,0.010129391,-0.039027255,0.03702316,-0.020553729,-0.010724386,-0.027957132,-0.025016302,-0.0026104941,-0.020000748,-0.03154871,0.0063278535,0.013482476,-0.0053888177,-0.018523768,0.032080937,-0.070002764,0.024494365,-0.0038516116,0.0051209144,-0.12312842,0.00087357266,0.04676384,-0.015243013,-0.016445419,-0.02226487,-0.077326626,0.0075450595,-0.050312962,0.030438563,-0.00934537,-0.059078008,-0.014223539,0.016636021,0.04029975,-0.012236343,0.04241668,0.009373926,0.022192637,0.042246103,0.00057082105,0.029133804,-0.014584266,-0.032574724,0.0030380045,0.0325185,0.026944213,-0.07864767,0.04186136,0.03853247,-0.030778473,-0.04172841,0.0329588,0.035817266,0.017078092,0.005353696,0.040325932,0.0031191453,-0.04283061,0.018830225,0.0242691,-0.03737111,-0.042969372,-0.04979031,0.019347329,-0.008241568,0.02437446,-0.03818941,0.05148714,0.024669249,-0.04414682,0.12157975,0.004421026,-0.040964205,-0.0058335285,0.0111372145,0.0018874743,-0.013132492,0.028538354,-0.0034926475,0.013141254,-0.025928563,0.02179852,-0.05470762,-0.016982079,0.04314757,-0.05622338,0.008060609,-0.05942712,0.048664026,-0.058328427,0.0432749,-0.047852308,0.04759128,-0.10815536,-0.043017223,0.036708195,-0.024195025,-0.03875323,0.057006605,-0.019537762,-0.015485406,-0.017715849,0.05057458,-0.0239897,0.008548142,-0.041386023,-0.0056684306,-0.045641486,0.013613963,-0.010564854,0.07132895,0.008279154,-0.03773481,0.031139432,-0.04221044,0.031583093,0.009336315,0.016004758,-0.02789996,-0.026577594,0.025075328,-0.04821925,0.005565485,0.052185558,0.0015911213,-0.0005495949,0.035186063,0.01404315,-0.022175713,0.06281356,-0.03603096,0.044561144,0.033943538,-0.026305685,0.056507815,0.04173559,-0.008672491,0.00038929918,0.021943681,-0.06488015,-0.037914023,-0.044811253,0.012517413,0.0329784,0.0471467,-0.012382124,0.020626772,0.017420135,-0.2081224,0.024359332,-0.011858956,-0.037873633,-0.019008355,0.02442573,0.02031093,-0.029004073,-0.012007802,0.020466391,0.039980937,-0.022001995,0.025545001,-0.016316473,-0.07632208,0.017493468,-0.004282431,0.010502035,0.0007883766,0.010758893,0.001831459,0.035448853,-0.017660383,0.008279416,-0.046046287,-0.0019646806,-0.016189054,0.0065914756,0.0036783484,0.01393883,0.01902545,0.0029237529,0.004690224,0.025451694,-0.015296939,0.004946887,0.010829629,-0.0025736243,-0.069086775,0.052406456,-0.0013338727,-0.013811396,-0.04569553,0.024457874,0.028026862,0.029015584,0.020708708,-0.0010633436,-0.026845898,0.004297434,0.028135123,0.0017047538,-0.105290525,0.035383873,-0.022117317,0.0713889,0.05447637,0.03152952,0.077747695,0.0021248602,0.03158624,0.05532646,-0.06116279,0.016951187,-0.0037614158,0.0034486253,0.039834037,-0.055411264,-0.034631208,0.009395773,0.068422504,-0.03501468,-0.00906011,0.02534639,0.03624602,-0.034766413,0.028308976,-0.014364074,-0.044396967,0.012820065,-0.018898902,-0.01471122,-0.006907876,0.02869665,-0.030965846,-0.060025305,-0.035101596,0.020999182,0.024670908,0.020140067,-0.01923665,-0.029835468,0.013293826,-0.0014509995,-0.010166958,-0.024004921,-0.04302884,0.03368201,-0.027822303,-0.011944963,0.012474326,-0.025709672,-0.017244976,0.0042194496,0.04712141,-0.048221067,-0.11680584,-0.003676541,-0.0083807865,-0.06266349,0.07493615,0.027410962,0.07441191,-0.023041047,0.03666572,0.010767947,-0.014197076,-0.024552705,-0.030040406,-0.051563717,-0.022613514,-0.006996574,0.019871462,-0.0056803916,0.014349556,0.010134629,-0.054176338,0.05933897,0.032391496,0.029527236,0.003211841,-0.03397983,0.01674233,-0.045265228,-0.040979516,0.030765397,0.019209113,-0.012608124,0.037089676,0.013705862,0.05508914,-0.056909584,-0.028858202,0.030510228,-0.029093914,0.014316471,-0.015667085,0.010512607,-0.0033095363,-0.025240198,-0.012527601,-0.088911526,0.0016504774,-0.012286904,-0.027011314,0.030288802,0.014374252,0.02689161,0.00587258,0.018643968,-0.009685357,-0.0254616,-0.022434117,0.02832251,-0.0015328225,0.04422818,-0.04557996,-0.029452858,0.0030050278,0.007033584,-0.024515899,0.045607015,0.063070565,0.029572554,0.0053680884,-0.031296637,0.05742178,-0.038817488,-0.012829626,0.07424303]
4	customers	Table: customers\nDescription:\n  ข้อมูลลูกค้า (buyer) ที่สั่งซื้อสินค้าจาก Northwind\n  หนึ่ง customer มีได้หลาย orders\nNote: ลูกค้าใน Northwind เป็นบริษัท (B2B) ไม่ใช่บุคคล ดังนั้น company_name คือชื่อหลักที่ใช้แสดงผล ไม่ใช่ contact_name\nColumns:\n  customer_id   VARCHAR(5)  PRIMARY KEY  -- รหัสลูกค้า 5 ตัวอักษรพิมพ์ใหญ่ เช่น 'ALFKI', 'ANATR', 'ANTON'\n  company_name  VARCHAR(40) NOT NULL     -- ชื่อบริษัทลูกค้า เช่น 'Alfreds Futterkiste', 'Around the Horn'\n  contact_name  VARCHAR(30)              -- ชื่อผู้ติดต่อในบริษัท เช่น 'Maria Anders'\n  contact_title VARCHAR(30)              -- ตำแหน่ง เช่น 'Sales Representative', 'Owner', 'Marketing Manager'\n  address       VARCHAR(60)              -- ที่อยู่\n  city          VARCHAR(15)              -- เมือง เช่น 'Berlin', 'London', 'Paris'\n  region        VARCHAR(15)              -- ภูมิภาค (nullable — ลูกค้าในยุโรปส่วนใหญ่เป็น NULL)\n  postal_code   VARCHAR(10)              -- รหัสไปรษณีย์\n  country       VARCHAR(15)              -- ประเทศ เช่น 'Germany', 'UK', 'France', 'USA', 'Mexico'\n  phone         VARCHAR(24)              -- เบอร์โทรศัพท์\n  fax           VARCHAR(24)              -- เบอร์แฟกซ์\nRelationships:\n  - customer_id ถูกอ้างอิงโดย orders.customer_id (one-to-many)\n  - customer_id ถูกอ้างอิงโดย customer_customer_demo.customer_id (one-to-many)\nCommon Queries:\n  - ดูยอดสั่งซื้อต่อลูกค้า → JOIN orders ON customers.customer_id = orders.customer_id\n  - กรองตามประเทศ → WHERE country = 'Germany'\n  - ค้นหาชื่อบริษัท  → WHERE company_name LIKE '%Wilman Kala%'	[0.022818081,0.020503052,-0.023255086,0.002451667,-0.013044732,-0.06585185,-0.019341411,-0.027287085,0.0207623,0.027941233,0.018698663,0.0024107913,0.10631169,0.04091654,-0.025668504,-0.041764062,0.020983296,-0.017604463,0.009529233,-0.031659678,0.04193771,-0.03676429,0.059276044,-0.021430565,0.008002625,-0.019267807,-0.006938079,0.0028951152,-0.01574105,0.03836936,0.050841764,-0.0047985855,-0.004707239,0.0060047745,0.0010042543,0.016987452,-0.011188306,-0.01818194,-0.006780044,0.011803393,0.012735957,0.0017161649,0.020094922,-0.042418413,0.033666242,-0.011559623,0.042410083,0.005799707,-0.021956792,-0.0011590278,0.035829823,0.014694461,0.054785497,0.034547977,-0.024656396,-0.0002612655,0.03544238,0.06014459,-0.053933933,0.01845796,-0.0010094581,0.04029622,0.003798012,0.008365386,-0.006066165,-0.0129091805,0.00083731866,-0.008052982,-0.039569266,-0.03201131,0.0004909597,0.012915333,0.09241343,0.011876695,-0.021552758,-0.013892131,-0.03794188,0.01376001,0.00064889033,-0.004969575,0.049309716,0.04695202,0.011819152,0.013575666,0.012785628,-0.024898393,-0.027081633,0.030848784,0.044782456,0.04763383,0.02851433,-0.026496876,-0.02969841,0.031167,0.021129452,0.0025668128,0.037725914,0.013430272,0.047996968,-0.016356021,-0.0028632218,-0.095302865,-0.023271462,-0.008914676,-0.072175086,-0.0076329443,-0.0062124245,-0.040354673,0.031210272,-0.06446678,-0.04280722,0.012508225,0.03303881,-0.03802324,0.028684877,-0.028913105,0.035107803,-0.032091793,0.009160978,-0.0645455,-0.023953468,0.00813705,-0.023604676,-0.016228287,0.043736998,-0.026042445,-0.009928365,-0.0065808557,0.0407359,-0.05188012,-0.030378772,-0.03373525,0.0045026867,0.034324735,-0.0073473696,0.042802125,0.034699544,-0.009223643,-0.02002462,-0.009731968,0.045977462,-0.05335676,-0.010826205,0.03559236,0.014045364,-0.05773452,-0.013082681,0.03290501,0.0052440893,0.055305496,0.030688869,-0.044783883,-0.038517144,-0.0062712957,0.023298671,-0.010894491,-0.026039425,-0.017724197,0.0007781651,0.039820414,0.02592219,0.0043923124,0.012905066,-0.018736418,0.04543045,0.0030268414,0.0113202995,0.029887365,-0.011747145,-0.009071908,0.008687876,-0.03241866,-0.07279254,0.023541499,0.0030439503,-0.021368222,-0.03085133,-0.021652495,-0.04432295,-0.05706805,-0.035778064,-0.019776383,-0.02983038,0.029008143,-0.025389785,-0.012890706,-0.028235152,-0.022433233,0.030378196,0.0069509186,-0.015107319,0.06299783,0.04251101,0.039865334,0.030916432,-0.0023201872,0.011811312,0.009820679,0.010231912,-0.051038276,0.01702068,-0.013749658,0.033744007,0.011417284,-0.013307336,-0.03768497,-0.013589758,0.041885167,0.0090818135,0.041129015,-0.018955644,0.036308218,-0.043148473,0.026417065,-0.015518456,-0.052203678,0.02943095,0.04695473,-0.022388339,0.039951663,0.018213218,-0.03752486,0.035590917,0.04460661,0.0034953807,0.0040327613,0.0074540665,-0.013379763,0.013507729,0.032288186,0.027792575,0.082092084,-0.014558208,0.043392304,-0.018783517,-0.009464606,0.0507012,-0.030864097,-0.033380203,-0.099879146,-0.022523226,-0.0071007265,0.004250783,-0.03912933,-0.0006343469,-0.05701401,-0.057227828,0.015819646,-0.10425334,0.038585242,0.016179418,-0.05369615,0.034724675,-0.01451784,-0.0022807394,0.008631356,-0.0327132,0.014276151,0.023526723,-0.00966888,0.014067057,-0.03486507,-0.0052237133,-0.016150387,0.037319187,0.008908701,0.004217724,-0.01712246,-0.07802934,-0.0020243153,-0.024507562,-0.05322041,-0.047397178,0.021544399,0.013778446,-0.017208196,-0.040509295,0.0025148538,-0.0039748764,-0.036418628,-0.027246065,0.05310803,-0.04496027,-0.014040869,-0.032821745,0.029222852,-0.09075577,-0.014706125,-0.054319423,0.0038762363,0.044891912,0.07269567,-0.020379588,0.0022737472,0.056046754,0.02197494,0.033042625,0.0044272095,0.020023983,-0.02225435,-0.03261525,-0.01347883,0.02380468,-0.061008584,-0.016410695,0.03796831,0.10999945,0.008390968,-0.061950494,0.047296107,-0.028941425,-0.008783554,-0.02525046,0.04677962,0.055893168,-0.06811553,0.02226531,0.07243509,0.017014574,0.019712422,-0.03698412,0.0198523,-0.03280215,-0.10508418,0.024623975,-0.05617,0.030678485,-0.013157487,0.0591062,0.03141077,-0.036934864,5.2075367e-05,0.02570541,0.026358547,-0.07640956,0.053566232,-0.03723114,-0.040894825,0.081822075,0.01837153,-0.04864411,0.011498527,0.027796691,-0.023444455,0.05658541,-0.1001424,-0.015415017,-0.029184958,-0.05144123,-0.006396993,0.02555933,-0.041423667,0.043169625,0.013675429,-0.017252102,0.012000261,0.016301213,0.0042584315,-0.04108945,-0.012092819,-0.01630411,0.035596136,0.018737493,0.0034138458,0.012397616,0.022740599,-0.06599777,-0.006829945,-0.008468333,0.03352627,0.1036965,0.01870048,-0.025843704,-0.0044274274,0.06227984,-0.024176063,0.022933995,-0.023830099,-0.0042160875,0.01829342,0.02603765,0.021027116,0.032123458,0.03239592,-0.029395021,0.0120223295,0.03161349,-0.046006802,0.030849144,-0.004737559,0.04839164,-0.0033415214,0.002101702,0.02691843,0.04641403,-0.024006039,0.0067023896,0.002828984,0.04199724,-0.03539646,0.009706949,-0.006245133,0.023073465,0.057507038,0.022781363,0.007141525,0.016396837,0.03518265,0.005432287,-0.020707736,0.04201363,-0.040481236,0.037052367,-0.018783826,0.02496456,-0.030645888,-0.0025779002,0.03256661,0.01922036,0.001182996,-0.031082882,0.016991153,0.027882356,-0.012092542,0.0135502415,-0.06892473,-0.0059442543,-0.0083495695,-0.010028181,-0.029359246,-0.017702166,-0.0041048694,0.013470333,-0.0062395427,-0.013368651,-0.011582014,0.025644807,0.026124941,-0.04112446,0.059294097,0.0018902358,-0.027001373,0.0053939843,-0.0056930357,-0.019796927,-0.016432922,-0.022225484,0.005189279,-0.010060759,-0.013181934,-0.02861136,0.019086333,0.009456701,-0.021402854,0.06278444,-0.08125557,0.065085694,0.0137493145,-0.0026970783,-0.12943308,0.021168375,0.036404338,0.024131263,0.0018511506,-0.03452097,-0.06767644,-0.0030772283,-0.0042863875,0.03598989,-0.0056231413,-0.043460377,-0.022772532,-0.006430734,0.04799445,-0.0020512056,0.043660384,-0.015391231,-0.020519236,0.019511651,-0.050973296,0.037170153,0.0047451467,-0.029314265,0.022553802,-0.0012378186,0.023008363,-0.09945241,0.047162898,0.057300515,-0.04894803,-0.050367445,0.04217588,0.046375923,-0.02264223,0.0017249949,0.06059266,0.014203353,-0.05914788,0.01928978,0.040999692,-0.02427223,-0.028792059,-0.060469035,0.013276545,-0.03212704,0.006087687,-0.008357283,0.054995585,0.0572916,-0.050269324,0.12558155,0.0007901384,-0.021598151,-0.018931817,0.026044967,0.013242902,-0.032401565,0.010477823,0.031481043,0.003301836,-0.0027597032,-0.0010000209,-0.028449532,-0.04351754,0.0072858008,-0.04045307,-0.010216615,-0.04614363,0.04153105,-0.026866011,0.045730647,-0.029710114,0.059091445,-0.10378645,-0.039270014,0.0415728,0.001910191,-0.049306378,0.030244559,-0.03722485,-0.024566542,-0.03027066,0.011277582,-0.025469765,0.02269016,-0.030942932,0.04734041,-0.04624176,-0.011779934,-0.037874084,0.08634872,-0.0029808215,-0.05327279,0.054521643,-0.015960645,0.03823906,0.017235039,0.04044737,-0.0052426266,-0.012716272,0.014084459,-0.029273279,0.0040581254,0.044857264,0.0056372858,-0.0072086863,0.03303385,-0.0035181735,-0.010597352,0.048469078,-0.037837837,0.031323127,0.057927933,0.0101419045,0.04890845,0.044882085,-0.011843024,-0.00248893,0.01265703,-0.039910436,-0.060076106,-0.013897438,0.021920253,0.027419878,0.009808195,0.0133557385,0.036308125,0.021003928,-0.21718732,0.018763585,-0.00304927,-0.05719644,-0.011985032,0.02549532,0.016504316,0.0051596467,0.009889533,0.055577952,0.03539905,-0.031291265,-0.0064744432,-0.022677269,-0.053266063,0.008656356,0.0156886,-0.024226984,-0.0024829456,0.009440078,-0.010704875,0.08984395,-0.04859611,0.0063575986,0.0031069822,-0.014051147,-0.020097345,0.014113682,-0.014735536,0.02191183,0.036223065,0.0031226291,0.020310733,0.03485417,-0.012780938,-0.013428303,-0.002472674,0.006252849,-0.079692796,0.05706572,0.007957455,-0.027088903,-0.04115141,0.013891159,-0.015051337,0.06035568,0.05828836,0.012447808,-0.048704017,-0.031511437,0.024118345,0.028966213,-0.08299244,-0.0032451276,0.0028089343,0.06834945,-0.00035283735,0.023220144,0.06570081,0.0015874105,0.04846389,0.07346173,-0.06834422,0.025786823,-0.001317702,0.021256082,0.05629479,-0.03798106,-0.0011503509,0.022989415,0.06644889,-0.04854145,-0.0118918065,-0.006792156,0.04142342,-0.059610922,-0.007427895,-0.012272742,-0.05423699,0.026854036,0.0029733032,-0.04379777,-0.010097863,0.015676906,-0.021005444,-0.051843643,-0.040185064,0.0056507024,0.04617984,0.033389,-0.031419735,-0.049927756,0.028824905,0.0072926595,0.013462668,-0.03183506,-0.03886437,0.014607192,-0.02378607,-0.0067150835,0.013283971,-0.039389838,-0.029433336,0.010697378,0.040077697,-0.05242649,-0.08982327,0.03243565,-0.025623966,-0.04336857,0.051034804,0.03879883,0.045465514,-0.034706585,0.005848549,0.0023380604,0.029696196,-0.024728626,-0.025600791,-0.020404791,-0.02904101,0.011555286,0.03510574,0.0073589734,0.016956564,0.006194521,-0.041143496,0.07103946,0.020656988,0.023614896,-0.011412678,-0.0692199,0.01339673,-0.029709697,-0.009262463,0.038470168,0.014451277,-0.019399615,0.008595686,0.02530806,0.05448998,-0.061814938,-0.04271529,0.037180718,-0.039255757,0.018142745,0.008079772,-0.009204608,0.0052626994,-0.04786476,-0.016053421,-0.101101175,0.012911606,-0.0093652345,-0.024229048,0.021130372,0.018813878,0.04271879,-0.012963325,0.013945666,-0.0076392326,-0.035724618,-0.006252471,0.0029339173,-0.009197499,-0.022007978,-0.023394763,-0.023822716,-0.005434629,0.031438105,-0.0074384273,0.0343225,0.041536663,0.017124757,-0.005380153,-0.0288492,0.059376538,-0.024541458,-0.019881004,0.048602592]
5	employee_territories	Table: employee_territories\nDescription:\n  Junction table เชื่อมพนักงานกับ territory ที่รับผิดชอบ (many-to-many) ใช้ตารางนี้เมื่อถามเกี่ยวกับ territory/region ที่พนักงานดูแล\n  Note: ตารางนี้ไม่มี column อื่นนอกจาก FK ทั้งสอง ไม่มีข้อมูลเพิ่มเติมเช่น วันที่รับผิดชอบ\nColumns:\n  employee_id  SMALLINT    NOT NULL  -- FK → employees.employee_id\n  territory_id VARCHAR(20) NOT NULL  -- FK → territories.territory_id\n  PRIMARY KEY (employee_id, territory_id)\nRelationships:\n  - employee_id  → employees.employee_id       (many-to-one)\n  - territory_id → territories.territory_id    (many-to-one)\nCommon Queries:\n  - หา region ที่พนักงานรับผิดชอบ → JOIN 3 ตาราง:\n    employees → employee_territories → territories → region\n  - [CAUTION] ถ้าถามเรื่อง "region" ต้องแยกให้ออกว่าหมายถึง\n    - work region  → ใช้ employee_territories → territories → region\n    - ที่อยู่จริง  → ใช้ employees.region (column ตรงๆ)	[0.027116822,0.038500663,-0.013170017,-0.004292206,0.021189367,-0.042986408,-0.024428248,-0.02951013,0.042792957,0.014643746,0.00598452,0.02301447,0.122304216,0.050389107,-0.045482032,-0.025936233,0.003800775,-0.0021354076,0.012864996,-0.035625774,0.040513813,-0.047568448,0.04270163,-0.008880069,0.009809686,-0.024102967,0.0044516246,-0.017850766,-0.02583654,0.030656762,0.013740846,-0.036897946,0.009638253,0.023692654,0.0061063156,0.010960265,-0.020183438,-0.029319327,0.011332569,0.016442878,0.013056358,-0.0011089281,0.021714464,-0.04111741,0.04649906,-0.027530877,0.03639615,0.033030454,-0.038343076,-0.028639264,0.020159742,-0.014544229,0.04263504,0.033772253,-0.06614692,-0.021724371,0.026123492,0.050041206,-0.034789436,0.03371685,-0.00058698317,0.043542586,-0.013173938,0.0106279235,0.02921104,-0.018646153,0.018995697,-0.016329067,-0.030339869,-0.008470757,-0.00399454,0.018403266,0.10485638,0.016128333,-0.020196583,0.015801216,-0.04903559,0.02134551,0.020149667,0.003468206,0.07181426,0.011577443,0.0022986878,0.02083226,0.011366705,0.0127941435,-0.0065111234,0.048091687,0.035960384,0.033302873,0.04421575,-0.026688216,-0.048375864,0.052124538,0.0053089494,0.006517472,0.034670845,0.020861078,0.036326606,-0.03297917,-0.013785621,-0.06664438,0.001892953,-0.055957656,-0.09016503,-0.036337707,0.008233957,-0.05216568,0.032704256,-0.027899498,-0.028014015,0.01191189,0.019709803,-0.018304681,0.045265477,-0.046064984,0.045773096,-0.054105826,-1.2371822e-05,-0.06916064,-0.022156496,-0.004388157,-0.024670394,-0.02773118,0.050762217,-0.02877733,-0.02722278,0.009130463,0.02680207,-0.025539398,-0.01802303,-0.06849016,0.012844182,0.02363088,-0.02693878,0.0262605,0.037573997,0.008281325,-0.015268659,0.0028876688,0.058297187,-0.034532744,-0.00052899926,0.07375324,-0.0065736775,-0.07364888,-0.029172566,-0.011020306,0.010399826,0.00906927,0.03464255,-0.05312318,-0.015528765,-0.026979895,0.04520304,-0.018334849,-0.038382776,-0.017682347,0.006796803,0.023783384,0.005075772,-0.022593547,0.01029202,-0.014680455,0.04683024,-0.007876188,-0.022244921,0.038133714,-0.040797025,-0.037053894,0.0220333,-0.056077108,-0.06559278,0.03604797,-0.036299042,0.0031383845,-0.023110863,-0.06122826,-0.034142155,-0.06442089,-0.05100408,0.0005617333,-0.037758775,0.025914688,-0.008721012,0.004524183,-0.018629013,-0.035682276,0.023487741,0.013346818,-0.0036676638,0.05883341,0.02798369,0.021139257,0.018500267,0.0065719686,0.026603568,0.0003513294,0.026133357,-0.038841948,0.013023219,-0.008862259,0.008686436,0.019208072,0.02346229,-0.06616195,0.0046590613,0.03844144,0.01759561,0.033733428,-0.026025936,0.018009827,-0.009166351,0.02766913,-0.041577317,-0.047226973,0.022269588,0.02604764,-0.04161918,0.036603685,0.037925098,-0.05686839,0.07473691,0.031593293,-0.014122693,0.011882003,0.0073177298,0.0135019915,0.026848665,0.0351342,0.059586447,0.09138089,-0.04501491,0.017768169,0.025468946,-0.033789188,0.040668093,-0.013625929,-0.0189164,-0.091692604,-0.011484275,0.020134356,0.0073144264,-0.037460476,0.02000846,-0.05367775,-0.044358067,0.05591368,-0.05898279,0.022201242,0.021417592,-0.056176104,0.031831622,-0.036607627,-0.0041363784,0.013939533,-0.018762512,-0.005804593,0.03851909,-0.008590623,-0.003423105,-0.012813543,-0.010625952,-0.04206827,0.0049241735,0.029121568,0.008424766,-0.024458608,-0.044873584,0.016666636,0.0030177014,-0.032184094,-0.04136259,-0.009495041,-0.0010482833,-0.022943519,-0.043361615,0.01954084,0.0035584162,-0.0415883,-0.03734326,0.024134364,-0.07095686,-0.03770907,-0.05877826,0.002447085,-0.043668244,0.0001774949,-0.0496045,0.018145723,0.026430404,0.094778694,-0.005585239,0.03600975,0.062473234,0.01000054,0.028876038,-0.022479603,-0.0006482101,-0.0011303967,-0.026956938,-0.0121195745,0.034379598,-0.053089656,0.008484611,0.02677096,0.11604262,0.0050027436,-0.028233336,0.024604002,-0.011364621,-0.027117826,-0.02463689,0.028962282,0.015095858,-0.04329238,-0.006388479,0.0683432,-0.01915664,0.02438883,-0.062876135,0.038998704,-0.03463858,-0.09686125,0.04478073,-0.060911633,0.033811774,-0.008959974,0.0802286,0.030279031,-0.029651565,-0.0010817747,0.012274132,0.030976107,-0.040950835,0.03343469,-0.051931795,-0.058242638,0.07016107,0.016122999,-0.03322359,0.03372922,0.009382515,-0.012829713,0.05550222,-0.0546932,-0.019145554,-0.070927784,-0.049101032,0.0065168035,0.015250868,-0.05921049,0.03849011,0.023560068,-0.019756572,-0.008045766,-0.0011189679,0.0013292533,-0.046580173,-0.017438233,-0.008537051,0.022638064,0.010560224,0.008625237,0.017028451,0.0017308472,-0.052404284,-0.026423145,0.002455766,0.008078672,0.11099041,0.027699126,-0.033019207,-0.002153061,0.034166574,-0.029030958,0.045479316,-0.09918821,0.0032374645,0.060392406,0.043913,0.062240344,0.04890233,0.033683825,-0.02438417,-0.0048933965,0.022165837,-0.041046254,0.020938065,-0.008519544,0.026830833,0.029383782,-0.0058534923,0.05395393,0.04772794,-0.044955242,0.00885835,-0.022163156,-0.0046145055,-0.058009453,0.026380405,0.03235863,0.013859336,0.04952955,0.056667827,0.022843812,0.0015863267,0.022876864,0.0077275266,-0.039609425,0.058391605,-0.043055918,0.041916743,0.015926022,-0.00015016345,-0.01593707,0.0051733395,0.03137932,0.03521814,0.012713661,-0.041142516,0.0041859485,0.026069527,0.019643137,0.029079681,-0.0896533,-0.006320937,-0.015040066,-0.015245211,-0.005955521,0.0069245216,-0.01997108,0.028630784,-0.009023772,0.025875602,-0.04313463,0.0046750074,0.03838751,-0.02447442,0.02207931,0.0053614294,-0.035565253,0.034880746,-0.022465406,-0.018346619,-0.005881129,-0.014261781,0.04230145,-0.01259784,-0.02904774,-0.017042594,-0.011472146,0.007597606,-0.017136058,0.031892948,-0.053969502,0.04405807,0.0017397421,0.005828129,-0.12012049,0.05914469,0.020481972,-0.02040475,-0.012253617,-0.038251054,-0.068694934,0.013362874,-0.02376506,0.051174093,-0.00977874,-0.023447488,-0.02914051,-0.0012040593,0.04416189,0.012576199,0.054660168,0.00047065355,0.0034768644,0.05383838,-0.025851957,0.030244706,-0.008686193,-0.006849951,-0.018535927,0.005094606,0.026442043,-0.07260829,0.029075125,0.051665083,-0.014860551,-0.024931153,0.038186777,0.043349646,0.009489021,0.009873824,0.04370899,0.010840157,-0.03539744,0.023088409,0.030899273,0.00079383096,-0.045085616,-0.020494413,0.0039925757,-0.023612212,0.021339862,-0.029185083,0.048279095,0.02888251,-0.040037297,0.12796971,-0.0031097042,-0.036349934,-0.012438518,0.06924798,0.013549645,-0.019075217,0.01377388,0.007672366,-0.024033068,-0.009383602,0.00090045325,-0.03398973,-0.012483567,0.009277324,-0.042037886,0.020175839,-0.05430077,0.03763605,-0.042641714,0.0251616,-0.07178406,0.037320476,-0.10524927,-0.058089882,0.050572332,0.011420593,-0.01747442,0.028600147,-0.026663413,-0.013215931,-0.02363334,0.026275942,-0.053160902,0.029220907,-0.04067582,-0.014843613,-0.026406664,0.011787082,0.0015705503,0.057316802,-0.03424159,-0.034578525,0.05747082,-0.029467225,0.034175996,0.021182396,0.025492914,-0.01015668,-0.025328709,0.0032891727,-0.016221493,0.018716864,0.03210835,0.005040007,-0.013091569,0.023196466,-0.020597596,-0.02513128,0.051709507,-0.050471634,0.032178354,0.02838085,-0.01651403,0.056639124,0.04478691,-0.025092624,0.009200493,0.012499174,-0.07396144,-0.053736668,-0.01742788,0.0087932255,0.018751685,0.018944772,0.010649075,0.03285907,0.00063356926,-0.20574403,0.012873636,0.0026711707,-0.037162293,-0.009370589,0.03797111,0.036250327,-0.01182048,0.030042788,0.012394685,0.032616846,-0.01856416,0.006297557,-0.01204303,-0.04536537,0.011973681,0.0017467025,-0.035924457,-0.0014827481,0.0273735,-0.013661083,0.04982481,-0.02187653,0.0003051659,-0.04052686,-0.0038995794,0.005839803,0.016986508,-0.002070007,0.0021476427,0.025730297,-0.006848938,0.029359156,0.023728289,-0.015522947,-0.027803471,-0.008874133,0.037343204,-0.092712566,0.018167445,0.018648947,-0.03234409,-0.049792606,0.013444787,0.010268441,0.044949263,0.0544434,0.031202901,-0.030176993,-0.0152998,0.026055178,-0.0058304807,-0.08036047,0.009683119,0.018684188,0.08123401,0.022748036,-0.002829223,0.08582994,-0.009918989,0.0480351,0.045805935,-0.06674539,0.01472104,-0.025619501,-0.000600855,0.05395006,-0.049525976,-0.03901766,-0.019169152,0.02155268,-0.03028622,-0.01855596,-0.0008635778,0.022619,-0.04534792,0.018050257,-0.02193487,-0.064200655,0.0107778115,-0.022831688,-0.0024631484,-0.0040164995,0.019493487,-0.04897056,-0.030962117,-0.047448035,-0.0006206021,0.04740895,0.019093521,-0.03790018,-0.041994363,-0.0023055903,-0.004904832,0.016098388,-0.03389092,-0.028130386,0.033926107,0.011830495,-0.012122901,0.02559223,0.002772276,-0.019517606,0.004309216,0.052401427,-0.050996486,-0.11910065,-0.010227312,-0.03591852,-0.055632573,0.07170004,0.019651648,0.042271268,-0.0064813616,0.02899532,-0.0012321871,0.014549696,-0.023613859,-0.020787636,-0.020756679,-0.026913762,-0.03467424,0.006371691,0.012230745,0.029158508,0.030252371,-0.05047264,0.027901346,0.007775423,0.045660663,-0.006805451,-0.05752674,0.02878242,-0.04116184,-0.038810477,0.039701328,0.019768728,-0.0077837775,0.035080373,0.005376489,0.05663163,-0.04554874,-0.055645157,0.047930885,0.0024038837,0.014536598,0.020477822,-0.0053597577,0.020284094,-0.021919101,-0.0136423,-0.08387196,0.033005178,-0.013093279,-0.046997517,0.03877057,0.027805764,0.06129898,0.008673349,0.02738565,0.005932654,-0.020825304,0.026217792,0.0136312535,0.00087359076,0.019823384,-0.028404687,-0.04184948,0.016175512,0.028838182,-0.031257547,0.025142305,0.028375337,0.0356097,0.008049951,-0.004109284,0.041797772,-0.0054394943,-0.033128362,0.042194754]
6	employees	Table: employees\nDescription:\n  ข้อมูลพนักงานขาย (sales employee) ที่ดูแลและติดต่อลูกค้าโดยตรง\n  มีโครงสร้าง hierarchy ผ่าน reports_to (self-reference)\n  Note: ชื่อเต็มพนักงาน = first_name || ' ' || last_name\nColumns:\n  employee_id        SMALLINT    PRIMARY KEY  -- รหัสพนักงาน\n  last_name          VARCHAR(20) NOT NULL     -- นามสกุล\n  first_name         VARCHAR(10) NOT NULL     -- ชื่อ\n  title              VARCHAR(30)              -- ตำแหน่ง เช่น 'Sales Representative', 'Vice President, Sales', 'Sales Manager'\n  title_of_courtesy  VARCHAR(25)              -- คำนำหน้า เช่น 'Mr.', 'Ms.', 'Mrs.', 'Dr.'\n  birth_date         DATE                     -- วันเกิด\n  hire_date          DATE                     -- วันที่เริ่มงาน\n  address            VARCHAR(60)              -- ที่อยู่บ้าน\n  city               VARCHAR(15)              -- เมืองที่พักอาศัย\n  region             VARCHAR(15)              -- ที่อยู่จริง ไม่ใช่ work region [CAUTION] อย่าสับสนกับ territories→region\n  postal_code        VARCHAR(10)              -- รหัสไปรษณีย์\n  country            VARCHAR(15)              -- ประเทศที่พักอาศัย\n  home_phone         VARCHAR(24)              -- เบอร์โทรศัพท์บ้าน\n  extension          VARCHAR(4)               -- เบอร์ต่อภายใน\n  photo              BYTEA                    -- binary รูปภาพ\n  notes              TEXT                     -- ประวัติย่อพนักงาน\n  reports_to         SMALLINT                 -- FK → employees.employee_id (self-ref) = manager โดยตรง, NULL = ไม่มี manager (top-level)\n  photo_path         VARCHAR(255)             -- path รูปภาพ\nRelationships:\n  - employee_id ถูกอ้างอิงโดย orders.employee_id           (one-to-many)\n  - employee_id ถูกอ้างอิงโดย employee_territories.employee_id (one-to-many)\n  - reports_to  → employees.employee_id (self-reference: manager hierarchy)\nCommon Queries:\n  - ชื่อเต็มพนักงาน        → first_name || ' ' || last_name\n  - หา manager ของพนักงาน  → Self JOIN: e JOIN employees m ON e.reports_to = m.employee_id\n  - หา subordinate ทั้งหมด → WHERE reports_to = <employee_id>\n  - work region ที่รับผิดชอบ → JOIN employee_territories → territories → region(ไม่ใช่ employees.region)\n	[0.03223026,0.030911706,-0.031738706,0.014059731,0.014283253,-0.04156,-0.03529749,-0.016356137,0.0400666,0.01529091,0.0056858948,0.019719826,0.1399177,0.057296444,-0.033627342,-0.036358967,0.003169279,-0.022144886,0.000515889,-0.016164757,0.037329312,-0.043360576,0.036248486,-0.011223053,0.009098452,-0.017219866,-0.01181543,-0.0086895805,-0.009007013,0.043440618,0.024388542,-0.022701235,0.009143964,0.02458207,0.017614909,0.009146563,-0.0047265515,-0.03355633,-0.0041264202,0.023433516,0.0075600934,-0.026363067,0.018258322,-0.037833232,0.019672198,-0.019801348,0.050295323,0.0154205095,-0.029300144,-0.01657758,0.008606322,0.01283416,0.06506682,0.042647187,-0.020135695,-0.031082934,0.041256957,0.06643445,-0.034705844,0.005957846,-0.022892527,0.024177613,-0.0031598646,0.009238163,0.040703252,-0.040394872,0.00887643,-0.033161476,-0.046672706,-0.02327848,-0.012669679,0.015252031,0.09385939,0.0024695515,-0.014036889,0.017239003,-0.043509893,0.01440745,0.016072724,0.016194167,0.03841049,-0.0027213,0.0050058453,0.030285602,0.0087416265,-0.0034004853,-0.03494159,0.06466041,0.058579687,0.048182376,0.03511884,-0.0074760364,-0.03187095,0.049204092,0.005106568,0.008045038,0.013154532,0.0072093904,0.038773816,-0.034241542,-0.011709292,-0.06985396,-0.01679335,-0.059019756,-0.07168721,-0.045642156,0.002183965,-0.04487072,0.037681952,-0.040090222,-0.038981743,0.0076660127,0.028844766,-0.042760506,0.041851886,-0.045116287,0.059143815,-0.043960817,-0.0034214552,-0.075966515,-0.029934343,0.0026714453,-0.033857547,-0.0253559,0.033018887,-0.023705287,-0.03779046,-0.0036013927,0.029183257,-0.055461258,-0.01896488,-0.028265474,-0.002279992,0.011518955,-0.014422087,0.04255232,0.027178198,-0.02208719,0.0008619934,0.0048156995,0.04038299,-0.073996626,0.0013360291,0.06049787,0.0064827153,-0.07196343,-0.03266375,0.010446334,-0.020880133,0.013934737,0.03693084,-0.060102675,-0.030801618,-0.019691365,0.052437115,-0.0027557837,-0.012990745,-0.0154486755,0.011400586,0.032058995,0.024305252,-0.013569307,0.011174599,-0.02872616,0.034640335,0.0016140032,-0.0054378225,0.01777354,-0.0460002,-0.009083251,0.013782817,-0.030337337,-0.082593165,0.030108174,-0.01460363,-0.0009805025,-0.038378444,-0.050324943,-0.038768053,-0.070761986,-0.047412977,-0.015287658,-0.05682886,0.02704085,-0.005612055,0.0006824054,-0.009830196,-0.03259743,0.014773582,0.020942206,-0.0008499976,0.059917554,0.016681626,0.027736519,0.028377289,0.015607611,0.02316874,0.02193281,0.013260895,-0.050685138,0.0009406728,0.0054196995,0.0020650432,0.009811761,0.00801852,-0.06005464,-0.022813823,0.026549574,0.0049891374,0.0368926,-0.033257138,0.026482772,-0.02335453,0.04372962,-0.041953333,-0.05461698,0.008622435,0.022389218,-0.029342419,0.039568055,0.032810584,-0.05110486,0.066174865,0.031116039,-0.010512963,0.009603466,0.015767543,-0.016423408,0.03905782,0.054394603,0.033782844,0.08867497,-0.032420557,0.03561548,-0.019788314,-0.031867106,0.045797613,-0.022584192,-0.022265453,-0.0988018,-0.0054493276,0.036254987,-0.0022816085,-0.03591706,0.019624287,-0.046187412,-0.05295183,0.04085644,-0.05269758,0.045050543,0.043343112,-0.04646041,0.022710573,-0.011394172,0.018586913,0.0023416704,-0.033597965,-0.0050854096,0.030340018,0.0011361672,0.02070156,-0.010827621,0.003860261,-0.027362684,0.023214336,0.0196904,0.022631705,-0.03271222,-0.04545011,0.00015901214,0.027906151,-0.029019203,-0.029775776,0.009211671,-0.008273901,-0.01363857,-0.061579224,0.03460679,0.017290788,-0.041959263,-0.044076312,0.024772087,-0.051720463,-0.024282405,-0.04051886,0.0076330113,-0.05286009,0.010164039,-0.045813695,0.0093955295,0.043761384,0.0887968,-0.0026609332,0.03679529,0.06940028,0.00972138,0.02472915,-0.005254628,-0.004405686,-0.0012376072,-0.023848971,-0.018331192,0.026609654,-0.045576606,-0.008635753,0.026468527,0.113637276,0.027785785,-0.03498185,0.050754827,-0.02565334,-0.0278432,-0.022807863,0.04732675,0.045566984,-0.058619246,-0.004963675,0.072315805,-0.009637025,0.022519765,-0.05921718,0.007629913,-0.024889525,-0.10502067,0.043741927,-0.0509907,0.043097798,-0.014075262,0.054532725,0.038932025,-0.013309566,-0.0034354706,0.031507637,0.0415576,-0.062485054,0.03182968,-0.03903829,-0.05101991,0.07642794,0.011621057,-0.021864926,0.020811766,0.026818348,-0.021975443,0.058826078,-0.083236806,-0.018131804,-0.057154,-0.050381057,-0.0025743498,0.03724326,-0.071924746,0.04426567,0.02469937,-0.04172342,0.02304809,0.015438434,-0.0101236,-0.035606682,-0.015934933,0.0035796138,0.007696444,0.003685067,-0.006178052,0.017564822,0.030914837,-0.076465175,-0.024765618,0.0014098233,0.0014670902,0.09434415,0.04204285,-0.036804702,-0.006444308,0.041516263,-0.01687433,0.02145303,-0.056804683,-0.010727945,0.045832567,0.037355434,0.05381243,0.034981634,0.008590706,-0.045013875,-0.0062474688,0.011998989,-0.048839357,0.02683763,0.007322604,0.033024978,0.008874613,0.0061579165,0.028486488,0.045432333,-0.033177037,0.0071617444,0.005255517,0.01886084,-0.0487101,0.03390944,0.039337594,0.016692821,0.051342987,0.03771472,0.036083307,0.004417547,0.01675905,-0.00033425292,-0.030486805,0.051189147,-0.035592154,0.044776965,-0.009907638,0.0048178677,-0.017663741,0.0010941715,0.028794091,0.01263872,0.019844873,-0.043406554,0.026241824,0.01897095,0.004728772,0.012390354,-0.064228565,-0.0072378963,-0.012917886,-0.021395754,-0.021522071,-0.012285172,-0.024720283,0.022012731,0.007697599,0.05420167,-0.011609574,0.02629796,0.03138054,-0.01276307,0.022097139,-0.015698874,-0.037028357,0.016663197,0.00094797544,-0.024626145,-0.0023691638,-0.03446256,0.015583839,-0.03491599,-0.012458049,0.003125568,-0.004058907,-0.0028065725,-0.0032803065,0.05122891,-0.050706394,0.056157548,0.00921561,-0.011935461,-0.12403137,0.018338019,0.027680356,-0.00054964673,0.007841463,-0.045870006,-0.070756875,0.009417827,-0.02222735,0.037389617,0.0070559103,-0.050251696,-0.028449161,-0.0047781705,0.02566334,0.004117828,0.05860022,0.005065524,0.02500157,0.019070812,-0.023012094,-0.0007147652,-0.028532537,-0.022257611,0.0060303155,0.011956665,0.018034417,-0.07467598,0.04954088,0.04332272,-0.030240744,-0.023637135,0.017840622,0.06105899,-0.0038456179,0.01638037,0.06259683,0.0052701165,-0.05739614,0.024615457,0.029792089,-0.033064533,-0.05036588,-0.049210332,0.015218125,-0.032444585,0.0026036126,-0.021495817,0.058663994,0.027508112,-0.055908218,0.127292,-0.026887037,-0.016781384,-0.027691789,0.03252741,-0.00616333,-0.039683912,0.033357963,0.0075152363,-0.0148848565,-0.02377621,0.010262375,-0.038625225,-0.028042668,0.016367562,-0.04384563,0.0025218653,-0.04680574,0.053356882,-0.018910067,0.015651386,-0.04536749,0.031074177,-0.092317946,-0.041824017,0.036135945,0.002960024,-0.021823488,0.025942646,-0.038769297,-0.031225953,-0.014397046,0.018232321,-0.055275775,0.016079113,-0.02768193,0.020709649,-0.006327988,-0.0003630822,-0.0077696224,0.055067666,-0.0061703753,-0.038544413,0.05353417,-0.029464107,0.061972238,0.010532334,0.038510613,0.012933846,-0.0139373215,-0.0030147908,-0.018331831,0.01998008,0.04720681,-0.004182847,-0.00032037034,0.038967937,-0.017413324,-0.026983043,0.048725948,-0.050492294,0.04045802,0.054111034,-0.007371792,0.061761614,0.047400635,-0.00944062,-0.006530401,0.0041863923,-0.05344391,-0.06385178,-0.026371043,0.032871753,0.027109655,0.004171202,0.0064562587,0.04592496,0.011438167,-0.21146756,0.022699928,-0.009533172,-0.054599665,-0.009183417,0.04126638,0.030670116,-0.01940529,0.00051857653,0.045328405,0.036005232,-0.026026376,-0.0043988414,-0.012615701,-0.0397297,0.0047518406,0.012815864,-0.030852553,0.0057066707,0.004622146,-0.008065663,0.072871186,-0.034547225,-0.00016999294,-0.049284194,-0.010038167,0.0013184883,0.0060154633,0.008809945,0.019792682,0.02304134,-0.0029849156,0.026759183,0.03207742,-0.01728057,0.0012837192,0.001700827,0.01303997,-0.081660986,0.04876521,0.015885387,-0.025445914,-0.044714145,0.026279755,-0.008372999,0.04949248,0.016714633,0.0026721961,-0.038761448,-0.02268091,0.03419321,0.015490752,-0.09212549,0.008564313,-0.004972468,0.063089825,0.023463164,0.010637712,0.05523055,-0.009590731,0.05609082,0.08065684,-0.048239492,0.006234813,-0.0060835653,-0.0016174894,0.051603414,-0.049027443,-0.022279603,0.019670056,0.040619384,-0.031919293,-0.026329419,-0.0022488725,0.031455476,-0.03342597,0.014296953,-0.014208115,-0.04990745,0.024615856,-0.03261876,-0.014342681,-0.0067986003,0.025167063,-0.040878583,-0.04030788,-0.04864926,0.010460117,0.040071554,0.025570195,-0.025121918,-0.053818595,0.0012105327,0.016203579,0.0020163497,-0.0123547,-0.04772824,0.031278502,-0.034082357,-0.013949008,-0.005120155,-0.009557409,-0.045784198,0.015884858,0.04303971,-0.027432539,-0.11318277,0.01647262,-0.03723975,-0.046666995,0.06330094,0.026784832,0.045923285,0.0018255498,0.0057891114,-0.00053998944,0.023897437,-0.04425623,-0.024327403,-0.03474641,-0.025747783,0.00695622,-0.0113989385,0.01380077,0.04894431,0.03697583,-0.044680376,0.04802036,0.010396447,0.04159509,0.00039201905,-0.068898186,0.027752906,-0.04045552,-0.017767306,0.026946744,0.034232944,-0.005473433,0.023461692,0.022150371,0.078525074,-0.045979332,-0.030208364,0.037973903,-0.0007020725,0.010329422,0.026675034,-0.0045613246,0.0043072547,-0.04193582,-0.005378536,-0.09412042,0.026075577,-0.01637911,-0.05022505,0.021737436,0.032723315,0.0382103,-0.0056988033,0.033250142,0.0077562886,-0.04487821,-0.00033388194,0.01472333,0.0078042187,-0.00041279904,-0.028801369,-0.036796477,0.023641812,0.03442095,-0.01921514,0.03908512,0.030824216,0.010990685,0.012112711,-0.0024858564,0.07326121,-0.01841992,-0.0114370175,0.043760847]
14	us_states	Table: us_states\nDescription: ตารางอ้างอิงรัฐในสหรัฐอเมริกา [CAUTION] ตารางนี้ไม่มี FK เชื่อมกับตารางอื่นเลย\nไม่ควรนำมา JOIN กับตารางอื่น เว้นแต่ถามเรื่อง US states โดยตรง\nColumns:\n  state_id     SMALLINT     PRIMARY KEY  -- รหัสรัฐ\n  state_name   VARCHAR(100)              -- ชื่อรัฐ เช่น 'California', 'New York', 'Texas'\n  state_abbr   VARCHAR(2)                -- ตัวย่อ เช่น 'CA', 'NY', 'TX'\n  state_region VARCHAR(50)               -- ภูมิภาค เช่น 'West', 'East', 'South', 'North'	[0.00013804219,0.028007697,-0.03502814,0.011356327,0.0034170272,-0.021274429,-0.0061126538,-0.016059766,0.02793144,0.018258348,0.035579577,-0.009639381,0.117435016,0.040415365,-0.0050358637,-0.029077057,0.013160352,-0.009394099,0.013743064,-0.009832217,0.028147245,-0.038147133,0.03745847,-0.009740569,0.024704719,-0.032830287,-0.0002571867,0.0072098686,-0.029906208,0.044452205,0.0060681137,-0.039512545,-0.010609557,0.026694395,0.023372795,-0.007292516,-0.023522947,-0.043118495,0.00060494436,0.005266714,0.02000806,0.019525716,-0.009314847,-0.025505869,0.017702784,-0.025593396,0.059735518,0.018790754,0.002677592,-0.018342601,0.03233544,-0.008427542,0.054502983,0.018904045,-0.058055747,-0.008063881,0.041956935,0.052209143,-0.032002814,0.021016615,-0.02435846,0.028275609,-0.00025190169,0.01827011,0.049671277,-0.01908572,0.011770695,-0.023296675,-0.0272031,-0.0047842837,-0.008875931,0.0023090914,0.108982444,0.0023169436,-0.04708322,-0.008688665,-0.045381073,0.006516277,0.004035855,0.009580364,0.038286272,0.014435233,0.012140005,0.031842288,-0.015845617,-0.010513824,-0.031892527,0.04742407,0.03677974,0.0405521,0.035298146,-0.018654332,-0.044426844,0.053342685,0.025397787,0.0086616725,0.029688634,0.00230924,0.04087441,-0.033781514,-0.039852083,-0.098465994,-0.0026311022,-0.04147168,-0.08969157,-0.01769031,-0.030158523,-0.05735741,0.035236876,-0.041298628,-0.03290498,0.009674269,0.030123046,-0.014342683,0.024377739,-0.019607734,0.052236702,-0.05511069,0.01658796,-0.06155098,-0.011014876,0.0024989033,-0.044834495,-0.0098688025,0.04029257,-0.032459915,-0.0011313906,-0.024415014,0.041055016,-0.03295455,-0.022161203,-0.060993,-0.005869071,0.030134702,-0.008836365,0.010183163,0.0075413696,0.014839557,-0.01698474,0.0121731935,0.057953198,-0.0607476,-0.010708895,0.051441263,0.0052563236,-0.07858985,-0.0057861656,0.0020818263,0.0006024357,0.037668727,0.03744218,-0.05121163,-0.029451838,-0.014695266,0.008882675,0.0068818736,-0.03146957,-0.006660871,-0.016772438,0.031973973,0.018823957,-0.00602515,0.005128277,-0.010443913,0.041675776,-0.019362276,-0.011691854,0.014238491,-0.029729916,-0.019021643,6.464296e-05,-0.046466082,-0.054009546,0.018727234,-0.011536708,-0.022088576,-0.03246146,-0.0310401,-0.009866052,-0.05134172,-0.07354695,-0.0072745187,-0.0012901035,0.027271232,0.0005484122,0.013747004,-0.020057786,-0.040084343,0.03970629,-0.005575525,0.013311,0.06696174,0.018367695,0.03349901,-0.0037333204,0.0106887175,0.015578605,0.0119761005,-0.0001635849,-0.05489666,0.0075738425,-0.009975087,0.033042796,-0.0074014086,0.0013157185,-0.082420334,-0.010828228,0.066847146,0.047838096,0.025546573,-0.017474346,0.04481572,-0.0016468525,0.027085828,-0.046903174,-0.06752034,0.033975992,0.020307869,-0.036071822,0.066122584,0.027546467,-0.075253725,0.09513584,0.040878285,-0.04874081,-0.021234665,0.005690073,-0.003330348,0.02002415,0.060163785,0.042579804,0.06849432,-0.030541632,-0.0054661795,0.0025854537,-0.024028819,0.06314782,0.00093087857,-0.0033933558,-0.10064672,-0.027371608,0.01437764,0.020386646,-0.055472802,0.026807167,-0.038683712,-0.049550876,0.02480042,-0.05326182,0.01824897,0.01699397,-0.031804167,0.03381394,-0.014401664,0.01796347,0.015480948,-0.03312735,0.020412832,0.02429094,-0.0027072756,0.00013376851,-0.03476306,-0.010208054,-0.040530443,0.021047615,0.028188128,0.0042871246,-0.030228825,-0.037205726,-0.005930391,0.033132978,-0.04030587,-0.049771857,0.018880373,-0.00731279,0.010361683,-0.04321059,0.034283444,-0.0007564426,-0.033598896,-0.044772588,0.029214771,-0.03766128,-0.034675214,-0.040759515,0.027365815,-0.07271835,0.04071812,-0.02998717,-0.0041437093,0.039232187,0.086137004,0.022478921,0.040848028,0.05234098,-0.009225968,0.03638861,-0.003994472,-0.00016256138,-0.010768224,-0.04292422,0.0069827763,0.007632525,-0.059164196,-0.0011628254,0.018065572,0.11791105,0.00021999265,-0.037403595,0.063243344,-0.032943003,-0.014276736,-0.020448646,0.03861096,0.006743055,-0.06878518,0.007928374,0.06171352,0.009439634,-0.011922429,-0.024315147,0.032218773,-0.022011753,-0.06592189,0.043698102,-0.05664074,0.040105883,-0.031696036,0.051638667,0.012776755,-0.04428959,0.01755207,0.0059149857,0.013516758,-0.031938557,0.006286536,-0.055659905,-0.04628523,0.072946385,0.016299674,-0.05423264,0.03829811,0.04041517,-0.00519094,0.03664067,-0.08063828,-0.00078695593,-0.06256916,-0.03491545,0.015133588,0.028397752,-0.05206928,0.020192051,0.01098888,-0.024317315,0.01280263,-0.004863966,-0.010484688,-0.03743373,-0.0012070783,-0.039497234,0.019946212,0.016520517,0.018479683,0.014104707,0.015900875,-0.04133591,-0.016523272,-0.01829357,0.018320149,0.08689753,0.006168534,-0.045327786,0.001433814,0.055705152,-0.027946787,0.04549317,-0.09739116,-0.0021750075,0.048197284,0.02186673,0.06828767,0.033189956,0.028624626,-0.02050598,-0.002355417,-0.0020590506,-0.036611293,0.0386489,0.020642173,0.028812276,0.009650804,0.016116312,0.011055957,0.033452015,-0.012106845,0.054991685,-0.019293036,0.058269113,-0.05394812,0.011418732,0.0042800466,0.015490917,0.039504196,0.048006106,0.012327937,-0.028279198,0.020570485,-0.010086516,-0.037249543,0.045611467,-0.03982308,0.034897063,-0.008426095,0.004839554,-0.0340886,0.011231178,0.033652995,0.002947757,0.018226707,-0.045598444,0.0035804566,0.011546808,0.009785496,0.02987876,-0.07018719,-0.028245028,-0.012957339,-0.017056061,0.0136958,-0.0393793,-0.038272873,0.0065101697,-0.024540849,0.029440006,-0.020494275,0.021569803,0.0069883424,-0.028185887,0.014209595,0.0035789488,-0.025088076,0.019546421,-0.03708152,-0.009718348,-0.0014404748,-0.033005998,0.023692023,-0.014477037,-0.022938292,-0.00032213732,0.0062622754,0.00016918012,-0.02559085,0.06415669,-0.07655149,0.065664604,-0.036012124,0.015483315,-0.11970822,0.07100393,0.04278377,-0.0040795417,-0.01157027,-0.03943081,-0.07477598,0.021595769,-0.014846127,0.021253161,-0.02966907,-0.043021318,-0.011795233,-0.0005242345,0.038191125,0.023962388,0.044119757,-0.013443939,-0.008061675,0.037917066,-0.015331233,0.05005343,-0.0052515487,-0.011287681,0.002245252,0.037735987,0.015825069,-0.078581825,0.030845912,0.047477964,-0.04182041,-0.028221183,0.03704022,0.052445732,0.005218197,0.03211906,0.048783287,0.016113035,-0.05945474,0.004665497,0.02719436,-0.00705119,-0.023663128,-0.04327989,0.023698268,-0.014795831,0.033367224,-0.025114642,0.024746343,0.029243222,-0.043404885,0.110636756,-0.0033211363,-0.02919611,-0.023712063,0.01974941,0.013250991,-0.015333416,0.00235405,0.030103596,0.0011626497,0.00084705814,0.014341276,-0.050981965,-0.007672996,0.005845191,-0.03245053,0.022055777,-0.045159303,0.03210728,-0.021142505,0.007029068,-0.07545849,0.05288819,-0.11828458,-0.07120705,0.039539676,0.03587923,-0.034375124,0.04884441,-0.045506727,-0.020939235,-0.014608025,0.015564245,-0.030477744,0.010603853,-0.007906698,0.03350922,-0.03894101,-0.004846801,-0.016406292,0.03358486,-0.008525627,-0.040633027,0.04796791,-0.03087638,0.040069092,0.027168341,0.037326675,0.027336836,-0.025109623,0.018237373,-0.027940996,-0.012469647,0.05475497,0.007196068,-0.0012685313,0.035095382,0.011074095,-0.030580174,0.04971485,-0.041072197,0.024367629,0.023340838,-0.008720859,0.058235247,0.04294229,0.014610802,0.018549914,0.035352305,-0.056872677,-0.070168324,-0.0081852935,0.010887821,0.021133862,0.032997284,0.027893376,0.024975114,0.02137875,-0.22356148,0.0309455,-0.021047149,-0.03570964,-0.0054380163,0.048135396,0.021058312,-0.035458874,0.020167518,0.0013467215,0.029770115,-0.018679745,0.010571856,-0.024803905,-0.050318737,0.054029755,-0.0028027524,-0.010835448,-0.0046636267,-0.018710613,0.013056958,0.06442938,-0.037432432,-0.0039515365,-0.026375579,-0.008149753,-0.035971045,0.018320888,0.00944514,0.029220905,0.03136294,0.008500835,0.0012650728,0.044223774,-0.025324464,-0.011217852,-0.0036562295,0.023301044,-0.037878346,0.028139263,-0.010690516,-0.0058552274,-0.0012888919,0.01800549,-0.0059886468,0.029844305,0.046557624,0.016729902,-0.041335683,0.0038763648,0.021368597,0.011785069,-0.09697849,0.0071699065,0.0084246695,0.06988786,0.02862943,0.0056979703,0.032967377,0.0014756372,0.045300167,0.061278276,-0.050008252,0.03335699,-0.014383871,0.008691885,0.044642136,-0.037190042,-0.022247666,-0.018706283,0.034366816,-0.029762447,0.006598006,0.04400269,0.005940226,-0.027216265,0.029867163,-0.012691982,-0.07242407,0.01697227,-0.0018206876,-0.013291375,-0.013446485,0.02156225,-0.035948303,-0.018299075,-0.055359446,0.025890889,0.03306438,0.044670872,-0.021252085,-0.01110612,0.0040898547,0.0031413636,0.03815921,-0.022576751,-0.04618991,0.004011646,-0.006075302,-0.03930933,-5.7653477e-05,-0.0133397635,-0.030268647,0.010889377,0.039353028,-0.043463014,-0.118347906,0.0069276416,-0.011528205,-0.040296424,0.04133811,0.016092556,0.032095052,0.000793317,0.029649885,-0.00986776,0.029514119,-0.026292047,-0.049302135,-0.029068371,-0.018138168,0.0061232145,0.0057124863,-0.012294115,0.041583057,0.038606085,-0.06341917,0.051658064,0.062137295,0.03889148,0.008191495,-0.024793023,0.023710158,-0.025851207,-0.04934788,0.033383217,0.002305634,-0.034053136,0.037166536,0.013517799,0.05405521,-0.09283706,-0.07823111,0.07392101,-0.012763085,0.0045098234,0.012058314,-0.017014848,0.011498629,-0.021193909,-0.019550603,-0.10089911,0.008149961,-0.017889617,-0.033593126,0.028752083,0.011532403,0.033266723,-0.0016674097,0.046307072,0.0007627311,-0.041380722,0.031316444,0.012698509,0.013557739,0.018513026,-0.02928898,-0.033418696,0.0053883614,0.021171542,-0.0075589768,0.043733016,0.02508881,0.0211603,0.011765501,-0.019394957,0.053355187,-0.03315927,-0.045818716,0.052140106]
7	order_details	Table: order_details\nDescription:\n  รายการสินค้าแต่ละชิ้นภายใน order (line items) หนึ่ง order มีได้หลาย order_details\n  [IMPORTANT] revenue ที่แท้จริง = unit_price * quantity * (1 - discount)\nColumns:\n  order_id   SMALLINT NOT NULL  -- FK → orders.order_id\n  product_id SMALLINT NOT NULL  -- FK → products.product_id\n  unit_price REAL     NOT NULL  -- ราคาต่อหน่วย ณ วันที่สั่ง [CAUTION] อาจต่างจาก products.unit_price ในปัจจุบัน\n  quantity   SMALLINT NOT NULL  -- จำนวนที่สั่ง\n  discount   REAL     NOT NULL  -- ส่วนลด 0.0–1.0 (เช่น 0.05 = 5%, 0.0 = ไม่มีส่วนลด)\n  PRIMARY KEY (order_id, product_id)\nRelationships:\n  - order_id   → orders.order_id      (many-to-one)\n  - product_id → products.product_id  (many-to-one)\nCommon Queries:\n  - revenue ต่อ line item  → unit_price * quantity * (1 - discount)\n  - revenue ต่อ order      → SUM(unit_price * quantity * (1 - discount)) GROUP BY order_id\n  - revenue ทั้งหมด        → SUM(unit_price * quantity * (1 - discount))\n  - [CAUTION] อย่าใช้ products.unit_price คำนวณ revenue เพราะราคาอาจเปลี่ยนแล้ว	[0.042695656,0.034341805,-0.014803611,0.011185063,0.004484103,-0.045484316,-0.043335088,-0.02224683,0.035483208,0.043702,0.015690846,0.013623254,0.10733184,0.034023378,-0.018147105,-0.04510038,-0.0022677707,-0.025337035,0.017032884,-0.026987396,0.05097918,-0.037734054,0.024841273,-0.022282347,0.016292226,-0.052226428,-0.010779957,-0.010263506,-0.06163616,0.044687398,0.03206962,-0.036389668,0.005296528,0.030406622,0.016114024,-0.0032919848,-0.009089013,-0.03388247,0.022344582,-0.016539844,0.013636713,-0.01665152,0.04845267,-0.032407247,0.04349175,-0.016941095,0.054867465,-0.0056378627,-0.02644001,-0.002880253,0.009367752,0.002564939,0.04818239,0.012676677,-0.02655054,-0.003734464,0.033318613,0.043782983,-0.0346473,0.0025667753,0.023031568,0.059727266,-0.009294237,0.011869299,0.043108877,-0.04191272,0.027638903,-0.018888447,-0.048417486,-0.01304298,0.00064180273,0.0069682305,0.10238644,0.011190964,-0.028641082,0.004403891,-0.033906784,-0.0013353254,0.0038540931,0.003304957,0.04152449,0.012670348,0.008292709,0.009538882,0.009249952,0.005858335,-0.031040296,0.04612354,0.036462642,0.015705109,0.044549536,-0.024778612,-0.050139148,0.05116515,0.0179475,0.018258998,0.014219247,-0.00208297,0.027597338,-0.028919332,-0.015851483,-0.05606379,-0.006283167,-0.027180389,-0.08077285,-0.020014297,-0.023012497,-0.05404395,0.0526186,-0.057302624,-0.009913413,0.007656093,0.031538773,-0.051565386,0.029804263,-0.039733652,0.06859046,-0.044280525,0.0034027793,-0.08044616,-0.036242224,0.008970316,-0.016371679,-0.047955725,0.04675489,-0.036218826,0.0036264695,-0.02229909,0.015501118,-0.04931012,-0.014704439,-0.040925495,0.008303535,0.033328507,-0.016816113,0.03753543,0.040267315,-0.006944949,-0.012743448,0.019786082,0.054913905,-0.06967314,-0.005894095,0.0598213,0.0100712795,-0.06720234,-0.012992496,0.014994348,-0.019530129,0.030032765,0.02018384,-0.06120911,-0.031925242,-0.022575375,0.02647799,0.0016537566,0.0011667861,-0.013691205,-0.017059714,0.012854299,0.027987184,0.011414561,0.014324497,-0.016403133,0.05159075,0.028130172,-0.006603986,0.03850314,-0.03776007,-0.023201397,0.020344285,-0.028802138,-0.065538876,0.013239503,-0.012504493,-0.026274659,-0.04436443,-0.037276976,-0.023211133,-0.05403766,-0.055129953,-0.0047698957,-0.049081393,0.019269288,-0.006687462,-0.017369583,-0.025070488,-0.019658668,0.03223582,0.010041383,0.01225875,0.08804456,0.0025284977,0.033656966,0.027023625,0.026541661,0.005486652,0.024260895,-0.023999572,-0.04439655,0.019364681,-0.010277346,0.020325763,0.018099684,-0.0022088417,-0.053638477,-0.029254869,0.036301985,0.011209904,0.0063366587,-0.029341675,0.026633792,-0.030161986,0.029397845,-0.041343898,-0.0570894,0.046012044,0.045954812,-0.019618453,0.024032881,0.017510578,-0.028688172,0.080788456,0.041591402,-0.01646811,0.013559528,0.008405768,-0.02046631,0.051932413,0.017662698,0.042834494,0.07402851,-0.027212277,-0.006137287,-0.0033789899,-0.012486457,0.015096373,-0.006080205,-0.013144943,-0.111073464,-0.044239666,0.011841825,-0.0030552463,-0.036349084,0.019910658,-0.05394474,-0.041557536,0.023506615,-0.054017637,-0.0045281798,0.03838435,-0.06156885,0.020022308,-0.030986333,0.014694376,0.002522038,-0.023502344,0.0037768262,0.04599538,-0.005391682,0.026672581,-0.025664404,-0.0034090262,-0.022935184,0.040418316,0.0014200388,-0.0051021217,-0.038306072,-0.021761231,-0.00891395,-0.0015356091,-0.0386599,-0.039413013,-0.010489653,0.010654791,0.023186538,-0.0381164,0.037395366,0.012169473,-0.031635713,0.005665592,0.0312646,-0.05951523,-0.01656055,-0.034822073,0.0049270494,-0.053659115,0.010303892,-0.057466682,-0.018776355,0.025271783,0.08818051,0.002428693,0.021626584,0.042007912,0.011350969,0.015680104,-0.003304306,-0.0018692672,-0.02683067,-0.05018576,-0.019676859,0.02464042,-0.070288986,-0.022877982,0.03925785,0.12182056,0.017393108,-0.034388024,0.040396564,-0.011220489,-0.016792526,-0.005874673,0.04437969,0.0502101,-0.053639058,0.005883555,0.057765793,-0.023233393,0.024447372,-0.035748392,0.023503488,-0.032102767,-0.07984622,0.036996476,-0.060017716,0.035015218,-0.00731307,0.056923248,0.035229936,-0.025614688,0.0027755233,0.024145419,0.025622299,-0.046235163,0.04746423,-0.07295579,-0.0120758265,0.08977436,0.013770823,-0.02052289,0.034893364,0.03885001,0.011448191,0.06737514,-0.059352845,-0.026326103,-0.068802305,-0.049216997,0.027012557,0.023229182,-0.08596679,0.013632738,-0.009677139,-0.052769206,0.014135027,0.010346548,-0.01766383,-0.007005553,-0.017196082,-0.025237793,0.030023973,0.019878628,-0.0016659556,0.0036216655,0.035272263,-0.059758235,0.006640468,-0.0016265422,0.021777028,0.0923838,0.035305526,-0.03616248,-0.0039986046,0.039706804,-0.038745493,0.017787276,-0.044725575,0.009432241,0.020677032,0.03799684,0.046089265,0.0484034,0.03077297,-0.046354853,0.010834747,0.0043093157,-0.088728674,0.023469737,-0.014472869,0.024214488,-0.0020449013,0.0035865412,0.013173908,0.04265987,-0.04405685,-0.014921604,0.0017194245,0.006597565,-0.06394187,0.048070185,0.025166713,-0.022559028,0.05313858,0.026539594,0.028842838,0.020071551,0.0553826,0.01501923,-0.023681736,0.03607961,-0.032288637,0.05341454,-0.009993922,0.014504001,-0.029882891,0.017678963,0.04652297,0.017039271,0.023645855,-0.075953364,0.011439681,0.010568152,0.009807843,0.022140022,-0.07824522,-0.0076973154,0.00030093297,-0.023521345,0.0001863687,-0.021811472,-0.0026587266,0.029473128,0.006138641,0.03554639,-0.02133736,0.048989132,0.043984316,-0.025406105,0.035178896,-0.021551296,-0.039555263,0.02205128,-0.0042836242,-0.028197125,0.000661595,-0.034733795,0.014948793,-0.019320125,-0.008370921,-0.0009603413,0.019836437,0.011719602,0.0033152194,0.038702235,-0.05073693,0.05364317,-0.0092874775,0.015658159,-0.12858386,0.03567949,0.02909585,0.0029575306,-0.0012821048,-0.013498888,-0.06687861,0.026670381,-0.050617564,0.035300195,-0.0102428645,-0.048769385,-0.023036554,-0.021835288,0.044907816,-0.0021087297,0.04011055,0.015267526,0.006574411,0.031424258,-0.022414265,0.04774507,-0.016374137,-0.024850404,0.023231145,0.020771649,0.026192103,-0.10053368,0.03581571,0.052048378,-0.027042342,-0.043833252,0.016830754,0.03809458,0.0065887277,0.008938651,0.06484408,0.007800205,-0.0617133,0.0505967,0.027126106,-0.033913404,-0.032865,-0.05823549,0.0029795093,-0.03959791,-0.014633483,-0.033859313,0.043345693,0.05222162,-0.02955466,0.13507174,-0.013071536,-0.054001145,-0.019272896,0.013971103,0.009260168,-0.033126444,0.025460461,0.02544854,-0.006524191,-0.017280245,0.003500509,-0.025917059,-0.030975128,0.034120172,-0.061882824,-0.0028570215,-0.044777624,0.02833276,-0.00098538,0.029983984,-0.051405124,0.02395564,-0.10676437,-0.05298582,0.03791762,-0.0214988,-0.025851734,0.037679747,-0.052649543,-0.009578826,-0.0036641343,-0.0051077795,-0.051429905,0.017217752,-0.036662273,0.008269916,-0.019629031,0.0078990655,-0.029668726,0.05704311,-0.0009896145,-0.047183,0.0469491,-0.020060202,0.045499902,0.018039841,-0.0024504531,0.015399341,-0.010145494,0.028591989,-0.0366707,0.019999487,0.045213543,0.018653184,0.0056119184,0.034832716,-0.0074346885,-0.0067466875,0.06204146,-0.07490988,0.05010273,0.053711224,-0.023949072,0.0485231,0.020480609,-0.022400038,-0.02920832,-0.019303875,-0.051554818,-0.031346887,-0.018002966,0.03100085,0.038222354,0.029460989,0.010577419,0.040884767,0.002985222,-0.18997367,0.0068493844,-0.011858105,-0.039430536,-0.034634862,0.03408865,0.037486568,-0.018699259,0.009630784,0.019632824,0.031502016,-0.033194356,0.010991974,-0.036096063,-0.035866324,0.017839275,0.01580337,-0.010004918,0.011238187,0.027489958,0.0036317988,0.060802322,0.0063649705,-0.014129596,-0.05130752,-0.033315007,-0.004809465,0.038434707,0.027456408,0.029067397,0.027663304,-0.0025579587,0.013010526,0.021332027,-0.02321973,0.012029408,0.0012404894,0.009774196,-0.088836394,0.068816714,-0.00082845165,0.001962034,-0.029847894,0.0003705674,0.022049578,0.041305315,0.032402232,0.012195243,-0.032279193,-0.0394014,0.014483483,0.010615489,-0.089214526,0.020663513,-0.0038438926,0.059288476,0.017190363,0.030302271,0.063074194,-0.019005284,0.057349145,0.05865476,-0.03727899,0.0058268635,-0.001487393,0.020329516,0.053757206,-0.05651096,-0.0044480776,0.008727491,0.0502896,-0.039679058,-0.000887925,0.0046105557,0.03684874,-0.03978199,0.011525066,-0.022840507,-0.06536503,-0.004951889,-0.027102469,-0.007833509,-0.019623144,0.033734743,-0.0340193,-0.03884572,-0.067246534,0.011033029,0.045247894,-0.0057494263,-0.010674927,-0.037426293,-0.010832679,0.01322836,0.0065717045,-0.024801796,-0.04454996,0.017740844,-0.0046987073,-0.033086527,0.013537291,-0.00800656,-0.007927385,0.015728373,0.039666303,-0.028096087,-0.09049298,0.024126573,-0.04476469,-0.053043973,0.048296954,0.052136194,0.053975027,-0.037093017,0.011266354,-0.0026421768,0.0011599697,-0.018579606,-0.028206171,-0.034579135,-0.0030438069,-0.01840403,0.026766518,-0.0029680482,0.040673435,0.009001503,-0.03875931,0.0675723,0.018382385,0.026197456,-0.013141891,-0.06842648,0.03745525,-0.021593513,-0.040594466,0.015577758,0.021138608,-0.011849005,0.04011751,0.020815205,0.06680605,-0.058191516,-0.04050897,0.054172583,-0.01035896,-0.0070009194,0.011405432,0.0092178015,0.0011734703,-0.038120992,-0.022507364,-0.105857745,0.036957137,-0.015943788,-0.012510951,0.02554826,0.016568648,0.014116807,-0.0022228502,0.022695808,-0.002382992,-0.04116633,-0.0013660889,0.017602757,0.0013716301,-0.0053429226,-0.011860334,-0.008306719,0.014769576,0.018620165,-0.0046689613,0.03668,0.034911152,0.045737926,0.03169707,-0.018760711,0.05247376,-0.0050804345,0.0027078383,0.044351812]
8	orders	Table: orders\nDescription:\n  ข้อมูลคำสั่งซื้อของลูกค้า หนึ่ง order มีได้หลาย order_details (line items)\n  [IMPORTANT] total revenue ของ order ต้องคำนวณจาก order_details ไม่ใช่จาก orders โดยตรง\nColumns:\n  order_id         SMALLINT    PRIMARY KEY  -- รหัส order\n  customer_id      VARCHAR(5)               -- FK → customers.customer_id\n  employee_id      SMALLINT                 -- FK → employees.employee_id: พนักงานที่รับ order\n  order_date       DATE                     -- วันที่สั่งซื้อ\n  required_date    DATE                     -- วันกำหนดส่ง\n  shipped_date     DATE                     -- วันที่ส่งจริง (NULL = ยังไม่ได้ส่ง / pending)\n  ship_via         SMALLINT                 -- FK → shippers.shipper_id: บริษัทขนส่ง\n  freight          REAL                     -- ค่าขนส่ง (ไม่รวมใน revenue calculation)\n  ship_name        VARCHAR(40)              -- ชื่อผู้รับปลายทาง\n  ship_address     VARCHAR(60)              -- ที่อยู่จัดส่ง\n  ship_city        VARCHAR(15)              -- เมืองปลายทาง\n  ship_region      VARCHAR(15)              -- ภูมิภาคปลายทาง (ที่อยู่จัดส่ง) [CAUTION] ไม่ใช่ work region\n  ship_postal_code VARCHAR(10)              -- รหัสไปรษณีย์ปลายทาง\n  ship_country     VARCHAR(15)              -- ประเทศปลายทาง\nRelationships:\n  - order_id    ถูกอ้างอิงโดย order_details.order_id  (one-to-many)\n  - customer_id → customers.customer_id               (many-to-one)\n  - employee_id → employees.employee_id               (many-to-one)\n  - ship_via    → shippers.shipper_id                 (many-to-one)\nCommon Queries:\n  - order ที่ยังไม่ได้ส่ง    → WHERE shipped_date IS NULL\n  - order ที่ส่งช้า           → WHERE shipped_date > required_date\n  - revenue ต่อ order         → JOIN order_details และ SUM(unit_price * quantity * (1 - discount))\n  - [CAUTION] freight ไม่ใช่ revenue ของสินค้า เป็นค่าขนส่งแยกต่างหาก	[0.051814593,0.04745076,-0.016322358,0.013853019,0.00034078135,-0.0530188,-0.037696294,-0.022178546,0.042252943,0.018867167,0.019972954,0.020148857,0.11726701,0.06337591,-0.021833796,-0.043004733,0.0057068137,-0.024664316,0.0029083348,-0.025692757,0.0435462,-0.039136626,0.038534272,-0.008468164,0.008303501,-0.028151106,-0.012001029,-0.007515901,-0.030067565,0.04260474,0.031536896,-0.024115462,0.0030344392,0.023650628,0.010177549,0.009637592,-0.016722007,-0.03754177,-0.0029285501,0.005423017,0.00532119,-0.023640502,0.05171851,-0.050939582,0.061885018,-0.022985807,0.04674461,0.008709688,-0.041582424,-0.011346883,0.0029434753,0.011409875,0.042536832,0.026375925,-0.026323268,-0.004921136,0.025116762,0.053443212,-0.043225974,0.0003800899,0.0020051403,0.038545217,-0.009844522,0.020715395,0.0337204,-0.041042555,0.017067024,-0.018331625,-0.04901192,-0.023297364,-0.011843995,0.006231695,0.10777606,0.013341264,-0.038249575,0.00124938,-0.032262392,0.01651268,-0.004351474,0.00933542,0.043219883,0.038055543,0.005434223,0.025314009,-0.0034149813,0.010056787,-0.026252823,0.052778773,0.04610487,0.030017504,0.04735298,-0.015509303,-0.031914543,0.041515373,0.015978733,0.01931484,0.024420608,-0.00029580385,0.021073367,-0.010410987,-0.016612478,-0.06785883,-0.01698453,-0.03392518,-0.061761502,-0.030373618,-0.011000562,-0.04477756,0.03692889,-0.04376132,-0.035778884,0.0056298273,0.036708765,-0.05193739,0.028004464,-0.044047892,0.07485362,-0.06454029,0.008134252,-0.08173293,-0.030795697,0.017311579,-0.019771587,-0.040220123,0.034509666,-0.040205993,-0.008770724,-0.015085284,0.028492741,-0.06507906,-0.014989493,-0.04878007,-0.00026380736,0.04217644,-0.0059946603,0.051822234,0.023325136,0.0066304626,-0.01326677,0.013470646,0.044823617,-0.06305804,0.011352976,0.043576226,0.014357424,-0.073084034,-0.038924683,0.008053153,-0.003653188,0.03334529,0.022115018,-0.06189338,-0.030380165,-0.01772794,0.034047473,0.0025883827,-0.0045179855,0.005508704,0.0040586474,0.021088146,0.022041228,0.016779674,0.0066922554,-0.025277106,0.041871373,0.0015286903,-0.018502446,0.0319787,-0.03763615,-0.013125817,0.024952844,-0.03322214,-0.07419766,0.027498784,-0.010815463,-0.026004003,-0.037000097,-0.044138644,-0.032153346,-0.06432923,-0.040468223,0.0027901912,-0.046566926,0.02938853,-0.008373531,-0.0030509399,-0.021584101,-0.012336068,0.015047908,0.010074054,0.010374224,0.07550266,0.021058768,0.034717467,0.025362464,0.023880258,0.01541603,0.01221166,0.0038025402,-0.053792942,0.015899371,-0.002779831,0.0071965093,0.009593051,0.0066543547,-0.047222264,-0.01638253,0.02433255,0.0009260806,0.02271806,-0.034119733,0.034459393,-0.042080466,0.030654917,-0.034520805,-0.05663384,0.040760156,0.04447574,-0.027763505,0.04621637,0.030460738,-0.023675207,0.056598034,0.03574606,-0.021867221,0.01401183,0.015152371,-0.017631486,0.04535215,0.028629411,0.03733668,0.09584225,-0.013636248,0.013940793,-0.0035453273,-0.037201297,0.029162912,-0.023423186,-0.016428975,-0.09936366,-0.04789411,0.019592065,-0.0031377205,-0.042763833,0.031550482,-0.043660443,-0.049098596,0.039776627,-0.059548616,0.021007938,0.04646559,-0.058514692,0.024951732,-0.017312357,0.010340267,-0.0095224455,-0.029549424,-0.015490768,0.029124495,-0.0009083845,0.020681826,-0.025546117,-0.0039903414,-0.000500569,0.027810339,0.0060892617,0.0059854756,-0.02769611,-0.0340216,0.0023168167,-0.0023735808,-0.0357361,-0.038209725,0.0018821537,-0.0050096004,-0.0013152559,-0.04502878,0.024102079,0.022790695,-0.02893318,-0.03356835,0.0318008,-0.06319742,-0.01092821,-0.029337555,0.007826277,-0.049555823,0.022285974,-0.049270384,-0.01517352,0.025812227,0.084472485,-0.0040671346,0.024420882,0.0465718,0.02382872,0.015347691,0.0048035197,-0.009650254,-0.008778049,-0.017496351,-0.019963788,0.0299298,-0.04820802,-0.0053016045,0.050069574,0.11791266,0.014868556,-0.05764493,0.052686643,-0.012923785,-0.01857194,-0.011229299,0.046158243,0.055572897,-0.055478834,0.0055806073,0.081240095,-0.0022683325,0.018339697,-0.049021058,0.009225697,-0.040239338,-0.09757111,0.036874037,-0.06483079,0.0405945,-0.009691119,0.056677546,0.034816828,-0.013109878,0.0055521145,0.04443506,0.0450028,-0.06794374,0.046273973,-0.051724862,-0.020791128,0.08725612,0.005327313,-0.03366605,0.026915615,0.039430585,0.0051476066,0.043168485,-0.06585759,-0.018409956,-0.07585687,-0.051024135,0.03109061,0.028927183,-0.06731384,0.019564928,-0.0049149673,-0.0447648,0.010876039,0.0033981411,-0.0040989704,-0.02652373,-0.034589753,-0.010418086,0.024406437,0.011576844,-0.0060372017,0.014415347,0.035130356,-0.060031265,-0.0069333753,-0.0055548074,0.010257701,0.08640611,0.029556783,-0.038784634,-0.001642525,0.03913603,-0.032683093,0.017006816,-0.06504566,0.013449812,0.030782586,0.043237984,0.019269811,0.04093782,0.017478012,-0.026543371,0.013698124,0.0051240874,-0.056326177,0.037009828,-0.011492445,0.037049603,-0.008215517,0.013693544,0.016372012,0.053092,-0.034059405,-0.011879514,-0.012031465,-0.0040801982,-0.051110215,0.038811535,0.031477842,0.0052093263,0.04109386,0.030237246,0.010783406,0.006977548,0.03478852,-0.0055964245,-0.036562208,0.042482056,-0.018406853,0.047604073,-0.012472216,0.0053322627,-0.027787723,-0.0034322587,0.023633936,0.02548339,0.018240575,-0.063185364,0.014111714,0.016401546,0.0065272073,0.019035734,-0.06885779,0.00506366,0.0046024784,-0.021569986,-0.0010057517,0.0010940272,-0.017800678,0.019650191,0.008945604,0.032545432,-0.0057674265,0.02408148,0.034336824,-0.033444133,0.03202502,-0.01628141,-0.036909748,0.016426513,0.0043302574,-0.020715503,0.008371449,-0.037214264,0.016278071,-0.018987976,-0.00543351,0.002518982,-0.0017384503,-0.005246746,-0.0024343138,0.03838844,-0.056564324,0.06710891,-0.006180171,0.0033283466,-0.122232735,0.0043668114,0.038277116,-0.010646311,-0.009360908,-0.030912962,-0.0612138,0.007716154,-0.03640797,0.046316992,0.00063208706,-0.031132817,-0.027387528,-0.018920228,0.06755548,0.008661229,0.04143292,0.010604333,0.010437806,0.03537465,-0.035330568,0.0054554385,-0.008680648,-0.0391917,0.011821219,0.012114349,0.035632238,-0.092444204,0.036324404,0.033684794,-0.041542817,-0.028554775,0.031986658,0.057700913,0.0067164353,0.004677366,0.068490826,0.010182233,-0.065992504,0.030004956,0.039649844,-0.02906848,-0.03868605,-0.058667418,-0.000839143,-0.03573746,-0.009393161,-0.026565071,0.05848185,0.04069473,-0.046047192,0.13808446,-0.021553557,-0.033544715,-0.012615809,0.01964712,-0.0034066692,-0.030242054,0.02133029,0.019564766,-0.01284312,-0.022165019,0.001822546,-0.041491866,-0.024904596,0.033661485,-0.050525773,-0.0058224113,-0.03780765,0.03789764,-0.01417173,0.017932761,-0.037563063,0.030660745,-0.10819602,-0.055543236,0.03022854,-0.004075513,-0.018495401,0.03636777,-0.048451494,-0.03447434,-0.0052003977,0.0032257626,-0.05859757,0.012868778,-0.029607998,0.014828636,-0.00836938,0.010477988,-0.023662869,0.057312667,-0.013377106,-0.053404458,0.034622893,-0.025032109,0.046278276,0.008565702,0.019965736,0.021324102,-0.011139288,0.018570347,-0.02563314,0.01926621,0.05028994,0.010779977,-0.005364366,0.02531845,-0.021781795,-0.024189994,0.053499937,-0.05311787,0.030286085,0.04960655,-0.014032041,0.059936702,0.031501915,-0.020865347,-0.0098154,-0.007502507,-0.067838125,-0.057816513,-0.02803542,0.030620955,0.025177643,0.02098939,0.003543403,0.039692543,0.02066011,-0.19324124,0.006937195,-0.003080281,-0.059402965,-0.014247575,0.030323112,0.041332435,-0.03480639,0.009799875,0.040253792,0.035622958,-0.024230499,-0.017469062,-0.018620042,-0.045999967,0.028301954,0.015717879,-0.028771961,0.0034835266,0.021125436,-0.0043740356,0.077582106,-0.019294957,-0.00413718,-0.050447308,-0.037720475,0.0016316191,0.013023919,0.0026225331,0.03421243,0.031984497,0.0077636032,0.009202439,0.012496567,-0.02117799,-0.0061262907,-0.005469588,0.013905135,-0.088399164,0.039634984,0.013997306,-0.012941637,-0.021903714,0.023390368,0.0098874755,0.04650612,0.03805198,0.007311669,-0.0443342,-0.031062068,0.014249779,0.027143,-0.1011443,0.011217609,0.004989289,0.084230326,0.019733533,0.013133258,0.07103975,-0.015582651,0.07501287,0.07309838,-0.044897974,0.0058281384,-0.010014907,0.030455079,0.043189842,-0.050288823,0.0003965008,0.010449672,0.030095933,-0.03821399,-0.017920963,-0.002635531,0.021408604,-0.049550936,0.014039175,-0.033780143,-0.049880087,0.028528616,-0.017751569,-0.022331238,-0.01411702,0.018633783,-0.041701026,-0.05178939,-0.06912778,0.014646523,0.04719897,0.018914938,-0.036066476,-0.0438877,-0.005437921,0.0019698774,0.015196328,-0.026869183,-0.044611942,-7.624132e-05,-0.012080527,-0.018910425,0.013500943,-0.012473864,-0.023853298,0.013626421,0.039825622,-0.025214313,-0.09979648,0.032426026,-0.035330806,-0.048196394,0.05805244,0.031955007,0.04640002,-0.024201406,0.0016552006,-0.015774721,0.03750647,-0.052279495,-0.025543684,-0.033572994,-0.033178076,-0.0011762963,0.0112635,-0.0015808438,0.048149828,0.0251453,-0.03978474,0.051392246,0.009893139,0.025808584,-0.016577655,-0.06623292,0.02877842,-0.034322817,-0.020088524,0.026255088,0.030572701,-0.004842757,0.015942434,0.020864954,0.0816336,-0.059900064,-0.04238793,0.028952412,-0.0082731135,0.011222543,0.022200594,0.00645207,0.011342245,-0.04057942,-0.019994808,-0.08669954,0.027975125,-0.012737753,-0.03811742,0.027531875,0.029847817,0.02112745,0.0031241667,0.029489983,0.013763981,-0.04791019,0.0048499852,0.008914155,-0.0010882871,-0.0052872393,-0.01738707,-0.015612297,0.031935163,0.036396,-0.0135972295,0.03824459,0.035634622,0.044052888,0.030683337,-0.029020837,0.057908725,-0.016096218,0.0033731372,0.048965696]
9	products	Table: products\nDescription:\n  ข้อมูลสินค้าที่จำหน่ายโดย Northwind [CAUTION] unit_price ในตารางนี้คือราคาปัจจุบัน ถ้าต้องการราคา ณ วันที่สั่งซื้อจริง ต้องใช้ order_details.unit_price แทน\nColumns:\n  product_id        SMALLINT    PRIMARY KEY  -- รหัสสินค้า\n  product_name      VARCHAR(40) NOT NULL     -- ชื่อสินค้า เช่น 'Chai', 'Chang', 'Aniseed Syrup'\n  supplier_id       SMALLINT                 -- FK → suppliers.supplier_id\n  category_id       SMALLINT                 -- FK → categories.category_id\n  quantity_per_unit VARCHAR(20)              -- หน่วยบรรจุ เช่น '10 boxes x 20 bags', '24 - 12 oz bottles'\n  unit_price        REAL                     -- ราคาปัจจุบัน [CAUTION] ไม่ใช่ราคา ณ วันที่สั่ง ดู order_details.unit_price\n  units_in_stock    SMALLINT                 -- จำนวนสินค้าคงคลังปัจจุบัน\n  units_on_order    SMALLINT                 -- จำนวนที่กำลังสั่งซื้อเพิ่มจาก supplier\n  reorder_level     SMALLINT                 -- จำนวนขั้นต่ำที่ trigger การสั่งซื้อเพิ่ม\n  discontinued      INTEGER     NOT NULL     -- 0 = ยังจำหน่าย, 1 = หยุดจำหน่ายแล้ว\nRelationships:\n  - product_id ถูกอ้างอิงโดย order_details.product_id  (one-to-many)\n  - supplier_id → suppliers.supplier_id (many-to-one)\n  - category_id → categories.category_id (many-to-one)\nCommon Queries:\n  - สินค้าที่ยังจำหน่าย        → WHERE discontinued = 0\n  - สินค้าที่หยุดจำหน่าย       → WHERE discontinued = 1\n  - สินค้าที่ต้องสั่งซื้อเพิ่ม  → WHERE units_in_stock < reorder_level\n  - สินค้าหมด                  → WHERE units_in_stock = 0 AND discontinued = 0	[0.038222723,0.026671125,-0.027488494,0.035619248,0.013015757,-0.05664372,-0.032848027,-0.019776914,0.044191454,0.017809834,0.01795513,0.013041514,0.1250716,0.062374685,-0.031584986,-0.039462466,0.032245573,-0.017065894,0.024085747,-0.00675046,0.059393223,-0.02940671,0.032285433,-0.0025388366,0.010756309,-0.03464039,-0.014996735,-0.01136246,-0.04892912,0.029231407,0.032518316,-0.05116982,0.019041276,0.020356428,0.019674273,0.0015115525,-0.010710566,-0.02240164,0.0005862556,0.013964051,0.0086540505,-0.012320006,0.03982809,-0.053040195,0.033074778,-0.011171593,0.046173703,-0.019034168,-0.0031717597,-0.0043239263,0.011052915,0.013407984,0.046303235,0.005656605,-0.043052785,-0.0053502773,0.025724947,0.060934193,-0.028610496,0.008270391,0.00019195073,0.037403483,-0.027764129,0.028668096,0.03567995,-0.028640201,0.0074535883,-0.014531294,-0.04062271,-0.011937865,-0.010099497,0.01154081,0.10813453,-0.0068816636,-0.0032040218,0.005030237,-0.05568593,0.0012109476,0.0010746082,0.0024294974,0.032236554,0.019397063,0.011063877,0.018947644,-0.011567737,-0.019360604,-0.011556618,0.024257269,0.027787022,0.04163307,0.04013685,-0.03553692,-0.044185225,0.032143936,0.0076467595,-0.0012131156,0.022085655,0.009602944,0.042323664,-0.03401381,-0.0148219885,-0.07595339,-0.006163424,-0.048473757,-0.08570676,-0.011809191,-0.017951531,-0.038931664,0.030253105,-0.03811836,-0.040318944,0.0070284866,0.040902324,-0.054362472,0.01756814,-0.04766703,0.053751938,-0.04390979,0.014738595,-0.039405458,-0.031615186,0.013816886,-0.03093514,-0.046633605,0.045628455,-0.029525308,0.0039671906,-0.032564536,0.04287476,-0.0601024,-0.018530693,-0.060046855,0.0029046233,0.05332791,-0.0017308902,0.039313495,0.030935058,-0.023306586,-0.0050529405,-0.0012894975,0.029132262,-0.07149966,0.0018077384,0.053406868,0.02168003,-0.06275129,-0.018655667,0.013515903,-0.010658847,0.05897639,0.043945998,-0.058214862,-0.037841756,-0.029829778,0.005577024,-0.0067535196,-0.031746536,-0.02042951,-0.012545791,0.020083046,0.024614556,-0.010450092,0.014475128,-0.026705641,0.047962505,0.019052088,-0.032377947,0.05530187,-0.031060528,-0.010857883,0.03441825,-0.016636234,-0.09380184,0.022626832,0.0062788976,-0.014436868,-0.06032304,-0.046496004,-0.032709084,-0.055471107,-0.05165643,-0.02735557,-0.03812865,0.02472947,-0.015409435,-0.0018064972,-0.010901023,-0.023269074,0.013762779,0.00295877,-0.004541116,0.08966117,0.0071112197,0.033902116,0.022248926,0.0317111,0.011236411,0.018856646,-0.018177675,-0.03680589,0.012938594,-0.00787851,0.017373994,-0.005994482,-0.0010606011,-0.057735205,-0.022007426,0.04720549,0.02016053,0.019918058,-0.026822433,0.029097768,-0.028792784,0.010464282,-0.020021511,-0.06981451,0.045037344,0.027850514,-0.01023105,0.026362611,0.009851193,-0.06622807,0.04848264,0.042682476,-0.023631709,0.017211571,0.03675228,-0.0031238224,0.02986054,0.024240844,0.0075503965,0.06590814,-0.027012467,0.010216338,-0.028296566,-0.021990368,0.039623253,-0.005595646,-0.026130587,-0.10114965,-0.029536016,0.011813125,-0.00077143894,-0.02955152,-0.008908793,-0.057868123,-0.04795634,0.023347056,-0.05846163,0.01973158,-0.003735425,-0.065498956,0.020522783,-0.004052588,0.022206252,-0.010978091,-0.03765102,0.008091427,0.031575847,-0.0040655923,0.023150727,-0.020933412,0.00205433,-0.01184657,0.048011336,-0.002453142,0.027267989,-0.034540284,-0.040087473,-0.011309167,-0.005776293,-0.06259685,-0.037319027,-0.025849178,0.015415322,-0.005887852,-0.026487049,0.0222494,0.0018142404,-0.010983538,0.00314849,0.034192536,-0.043411147,-0.019089393,-0.035453424,0.01739574,-0.057449277,0.00088297814,-0.053988952,0.0014099192,0.041040108,0.073266976,-0.012058784,0.0445284,0.026101716,0.013709461,0.025350928,0.011455876,0.010107587,-0.027322652,-0.041077275,-0.01390488,0.027647305,-0.06278923,-0.022432249,0.02263606,0.11430317,0.017536283,-0.037167415,0.012620142,-0.028503723,-0.0140029695,-0.018794334,0.056872386,0.035546742,-0.04899189,-0.0031589458,0.06934968,0.0050857756,0.038206827,-0.015635297,0.012698998,-0.03754679,-0.09026374,0.04374718,-0.038777344,0.044900134,-0.0032661653,0.060699202,0.037179597,-0.009246653,0.018215176,0.025872935,0.03653216,-0.07414572,0.0366694,-0.0542283,-0.038798958,0.07133937,0.016124154,-0.012098607,0.032864027,0.061883267,0.014708928,0.04944105,-0.095786415,0.0033675942,-0.052299432,-0.060465198,0.013405647,0.03078715,-0.0529181,0.002967891,0.008523301,-0.041604098,-0.006866933,0.005460604,0.0033893485,-0.02493105,-0.031990368,-0.022639368,0.0076273717,0.017745215,0.0031902958,0.0036421593,0.053149533,-0.04894666,-0.007842615,-0.003236265,0.010441467,0.099335104,0.04201846,-0.027498998,-0.023533817,0.042577706,-0.042015925,0.0042078607,-0.03275103,0.00965673,0.043916296,0.053984877,0.024943758,0.046285648,0.03396837,-0.03720515,0.026477322,1.2157373e-05,-0.053238925,0.039678615,0.01103426,0.025516527,0.0031473362,-0.0064135585,0.031688474,0.029432148,-0.03433937,-0.00032006987,-0.0036872386,0.029663045,-0.016078323,0.031321358,0.010541202,-0.0062213307,0.05150131,0.0009067609,0.03147589,0.02502963,0.047534578,-0.01255997,-0.014697716,0.030444844,-0.03665964,0.050428934,-0.03481127,0.003315389,-0.032326687,0.006803034,0.04944961,-0.021178462,0.036106456,-0.053645857,0.026654227,0.021362117,-0.00054948905,0.017644603,-0.08194687,0.015799342,0.0015371736,-0.019040022,-0.016939241,-0.032120526,0.0012718819,0.02480252,0.01010823,0.013985944,-0.01827403,0.03742936,0.04857735,-0.053813294,0.039864272,-0.035431553,-0.02701116,0.043137074,-0.0090850955,-0.031698514,0.0077657984,-0.041860603,0.005015136,-0.040537123,-0.0059969323,-0.0027688427,0.013785616,0.021156901,0.007716664,0.044389438,-0.086296454,0.07037718,0.013157641,0.012428032,-0.12106622,0.031073691,0.037733804,0.013170819,-0.005920488,-0.03022512,-0.06464813,0.0079630045,-0.040653568,0.039135043,-0.015804382,-0.028973382,-0.027384603,-0.022772398,0.018042957,0.015580551,0.04143645,0.009958047,0.0030181208,0.017189885,-0.03082045,0.030472329,-0.008119459,-0.0053863646,-0.0111227445,0.027132979,0.039927155,-0.096586354,0.04217553,0.034535732,-0.024255877,-0.026042618,0.037491236,0.033769567,-0.0026991107,0.013424745,0.06022516,0.006728402,-0.07557638,0.027194943,0.03128854,-0.036898043,-0.038290393,-0.049224846,0.018601716,-0.021154214,-0.004875063,-0.0022037956,0.034745887,0.039424717,-0.0388827,0.14227405,0.012312362,-0.04384288,-0.025670715,0.001848583,0.0039506927,-0.050432373,0.022715429,0.031419832,-0.009740198,-0.004058924,0.0058065304,-0.039607137,-0.01436586,-0.0008498481,-0.051613893,0.010002283,-0.032012798,0.05543002,-0.014903097,0.026707511,-0.030183502,0.04069986,-0.09553965,-0.04750655,0.06500455,0.0011413555,-0.042097367,0.006732006,-0.046421245,-0.012001456,-0.012034598,-0.014946732,-0.048865113,0.0375816,-0.016946102,0.013095546,-0.025566708,0.010152047,-0.027294194,0.062473323,-0.00037843682,-0.05467837,0.06424446,-0.013590964,0.03230602,0.02187825,-0.0030318305,0.027561283,-0.036994144,0.0071505075,-0.018377617,0.015251522,0.044369604,-0.004393384,0.023712097,0.03253614,0.0046551786,-0.030128226,0.06631196,-0.028897442,0.0475298,0.06410636,-5.2594576e-05,0.055655833,0.019575972,-0.023581052,-0.034920756,-6.85628e-05,-0.037700556,-0.05157482,-0.01901213,0.009720247,0.028490786,0.043582357,0.03115429,0.03045458,0.019619968,-0.21461599,0.021992853,-0.018617209,-0.03236566,-0.025071727,0.025438663,0.041832495,-0.022767078,0.024807498,0.02695282,0.026751082,-0.027320545,-0.0023791413,-0.02183561,-0.013351658,0.028882112,0.03084365,-0.008026466,0.004705527,0.031868707,-0.0015341648,0.08673551,-0.015050139,-0.017320039,-0.04978991,-0.025232881,-0.021491902,0.013789706,0.030630156,0.038982663,0.021167932,-0.0046098083,0.005915709,0.03284944,-0.019357566,0.0328611,-0.01676096,0.008242405,-0.09518387,0.060019884,0.0041993805,-0.0024366053,-0.035450127,-0.0005750303,-0.0018817019,0.04679806,0.05388859,0.010866976,-0.019089423,-0.012208603,0.007533378,0.021608913,-0.110409535,0.012543458,-0.007893473,0.051701743,0.003789986,0.0083740465,0.05346622,-0.0042152395,0.06290269,0.051741097,-0.030895492,0.023642482,-0.0019020961,0.0007308643,0.042360757,-0.038836814,-0.01982916,0.0065304814,0.05650151,-0.022232607,0.010134226,-0.010338967,0.034032043,-0.037286114,0.0035264615,-0.029352477,-0.061706495,0.030011872,-0.020578733,-0.010318666,0.012012674,0.0005813748,-0.021566723,-0.026727965,-0.040195532,0.028022805,0.02814851,0.025283998,-0.022115996,-0.046018884,-0.008646013,0.021274311,-0.004186489,-0.03334694,-0.038932774,0.030581422,-0.009919825,-0.013267377,0.02652606,-0.014854244,-0.025770167,0.031598777,0.052110627,-0.05879616,-0.080352604,0.038596563,-0.025217831,-0.058707297,0.040098988,0.043620564,0.040037557,-0.026428575,0.012087622,-0.009777394,0.004851776,-0.03690297,-0.028344003,-0.017979851,-0.016993247,-0.018513335,0.03073897,-0.015819449,0.037802584,0.026283503,-0.03325951,0.08160511,0.0082584,0.023192883,-0.011122306,-0.07666328,0.021979118,-0.04027506,-0.029367965,0.045604132,0.028466398,-0.01389668,0.031382233,0.028253278,0.05272467,-0.07917261,-0.029683353,0.042600106,-0.018545855,-0.00758414,-0.0085801985,0.0085008545,0.015974026,-0.047319315,-0.008696051,-0.10440985,0.0042264448,-0.017763399,-0.0148585355,0.026004365,0.0068201744,0.025279347,-0.009584413,0.0027194386,0.0042035882,-0.053226557,-0.0008281189,-0.005790936,-0.0036298416,0.014222285,-0.038919102,-0.00033598838,0.015170413,0.028795527,0.01120065,0.032131743,0.026793526,0.013561219,0.015591555,-0.024783522,0.055085443,-0.008770725,-0.010072501,0.041805323]
10	region	Table: region\nDescription: ภูมิภาคการทำงาน (work region) ใช้จัดกลุ่ม territories [CAUTION] ไม่ใช่ region ที่อยู่อาศัยของพนักงาน (employees.region)\nและไม่ใช่ ship_region ของ orders\nColumns:\n  region_id          SMALLINT    PRIMARY KEY  -- รหัส work region\n  region_description VARCHAR(60) NOT NULL     -- ชื่อ work region: 'Eastern', 'Western', 'Northern', 'Southern'\nRelationships:\n  - region_id ถูกอ้างอิงโดย territories.region_id (one-to-many)\n  - เข้าถึงจากพนักงานผ่าน: employees → employee_territories → territories → region	[0.018004281,0.04013498,-0.009042738,0.009006465,0.008966663,-0.048688177,-0.017807025,-0.033373564,0.05874076,0.039551083,0.023831915,0.0061280085,0.114974864,0.051414993,-0.03768816,-0.04871949,0.014125917,-0.008152025,0.010831654,-0.045588292,0.04830782,-0.033419985,0.034763683,-0.007264202,0.034903213,-0.032973517,-0.003106887,-0.0069621867,-0.03718435,0.052683745,0.008704568,-0.02911724,0.00797456,0.019269513,0.016020836,0.015627513,-0.027853906,-0.022683034,-0.011344517,-5.6060722e-05,0.025439087,0.013334049,0.01972082,-0.017410433,0.023021039,-0.0193076,0.045748714,0.016456746,-0.02445792,-0.014223426,0.006496134,-0.0136998845,0.0440153,0.029209567,-0.059155174,-0.026275018,0.024995368,0.054859985,-0.046818715,0.047407437,-0.03676234,0.044766027,0.001030907,0.0077830707,0.026802948,-0.03121025,0.0063900077,-0.0060057226,-0.039613385,-0.01202416,-0.0019166643,0.01178851,0.11518489,0.024746107,-0.021965234,-0.007528293,-0.052396417,0.009284488,0.011015896,0.011150461,0.053028725,0.009408851,0.0079607405,0.033041168,-0.0016897776,0.0016332348,-0.02910332,0.037122972,0.035611752,0.035612617,0.03807736,-0.026178828,-0.04865877,0.058412362,-0.007046845,0.019248232,0.008219192,0.0152320545,0.021851804,-0.020575171,-0.027700266,-0.08590433,0.0049073542,-0.051337883,-0.0792841,-0.041395325,0.005097163,-0.04909364,0.043080892,-0.023495208,-0.03604585,-0.006809266,0.03203846,-0.029655708,0.05104784,-0.052267697,0.039441574,-0.031066397,-0.0010135598,-0.055698242,-0.014525346,0.017880833,-0.019570205,-0.02731771,0.03392516,-0.028585773,-0.009935741,-0.004024273,0.042899556,-0.027984116,-0.009761641,-0.054646596,0.0021998696,0.046686053,-0.018645111,0.028026091,0.019471804,0.016771369,0.0013551107,-0.020678703,0.07263657,-0.065277964,-0.0041734083,0.089293584,0.004067141,-0.08481006,-0.029115371,0.008637665,0.002571538,0.020202436,0.04842652,-0.037484966,-0.030046288,-0.025824582,0.03855695,-0.018526314,-0.019554192,-0.0049340962,0.026313785,0.023114841,0.016161634,-0.016305175,0.005438471,-0.015362452,0.030708307,-0.023414679,-0.020118902,0.024705432,-0.043074843,-0.042975605,0.010532055,-0.047614533,-0.070133075,0.031438854,-0.03205511,0.001018969,-0.010806077,-0.03896043,-0.02447221,-0.064282894,-0.026217757,-0.007601673,-0.038128857,0.025212014,0.009069598,0.0034266163,-0.014833079,-0.03240989,0.025556417,0.018082483,0.0053062006,0.063116886,0.0032441653,0.036713116,0.011424149,-0.006155538,0.027724491,-0.0082384525,0.01982414,-0.05304754,0.0036468643,-0.008419935,-0.013366826,0.009725671,0.02040878,-0.061113715,-0.0043024803,0.048854023,0.024327192,0.02799862,-0.033927966,0.025474485,-0.009807291,0.020973569,-0.022898713,-0.058721937,0.012889377,0.025225347,-0.03661362,0.046936963,0.035970427,-0.042211328,0.06838221,0.02007025,-0.012544037,0.0075737564,0.023125026,0.0019336051,0.027385134,0.041079376,0.028803045,0.0969491,-0.03464577,0.024234887,0.003666607,-0.04937241,0.030704586,-0.025583245,-0.022624282,-0.09615729,-0.012905889,0.020575656,0.003212397,-0.045607675,0.021049477,-0.05335819,-0.035922896,0.04132197,-0.064550154,0.03336595,0.019609194,-0.04545575,0.02396794,-0.019691171,-0.0014635317,0.008365887,-0.02212893,-0.031416334,0.035382226,-0.030596225,0.004392245,-0.01603351,0.007195419,-0.03970088,0.009600606,0.011353972,0.016612517,-0.022938244,-0.047455072,0.018713353,0.01115057,-0.02460929,-0.042772185,0.015535563,-0.0061121737,-0.010024173,-0.060608983,0.02081981,-0.00017944037,-0.057824068,-0.040290285,0.048896875,-0.04653441,-0.027789291,-0.051286165,0.007876004,-0.034672946,0.011638504,-0.034042895,0.011618772,0.023383033,0.07609567,-0.0125237545,0.035919443,0.05408323,0.023999626,0.04014447,-0.0047559864,-0.016998548,0.0038960641,-0.027318075,-0.017209977,0.031638112,-0.05069699,0.0042452416,0.015454577,0.09909856,0.014388818,-0.0245729,0.04398583,-0.019690692,-0.01870461,-0.024636133,0.030240973,0.037663735,-0.07171084,-0.004659294,0.08009806,-0.0032140075,0.031561006,-0.053522583,0.035510052,-0.023699764,-0.105209924,0.055267863,-0.040201634,0.03077479,0.0021175225,0.06567512,0.02935875,-0.025665272,0.00633785,0.0066119,0.03343549,-0.055314865,0.024414096,-0.048632927,-0.049494356,0.06782492,0.015511339,-0.025366463,0.03317522,0.0038234321,-0.015289721,0.05061259,-0.07577543,-0.026096066,-0.05770552,-0.051808354,0.005487196,0.016295796,-0.07005474,0.02837246,0.020546876,-0.009530941,-0.0065847905,0.00433215,-0.015999308,-0.056110755,-0.030732246,0.0028627007,0.013032556,0.0062415963,0.00665997,0.027096106,-0.001224904,-0.06543156,-0.03706729,0.0029761149,0.010283308,0.08881732,0.023986898,-0.03079603,0.003018372,0.044211637,-0.022922622,0.05300027,-0.078176945,0.015416128,0.048209302,0.032168668,0.067940034,0.027982574,0.03874443,-0.013584953,-0.0154612595,0.013304122,-0.071037985,0.046887405,-0.0021563256,0.032885887,0.02609827,-0.0043690726,0.05842766,0.05199005,-0.019888975,0.033425372,-0.016990284,0.009921282,-0.03753641,0.018930236,0.051746767,0.012791799,0.050378755,0.058375232,0.031752814,0.004022171,0.019709075,0.004126681,-0.03475253,0.050227232,-0.015902918,0.019935958,-0.010899523,0.020444453,-0.018761603,-0.0018666275,0.040589873,0.01679305,0.019313797,-0.051784758,0.0035441741,0.021215644,0.015941711,0.030215438,-0.08337014,-0.009675079,0.00044938494,-0.022812273,-0.030122997,0.0145211425,-0.032157168,0.024709465,-0.019952605,0.032276496,-0.0531353,0.02669594,0.021220928,-0.04233736,0.009021699,0.014468892,-0.052066453,0.024772078,-0.0033771254,-0.014544808,-0.009840824,-0.0057909894,0.020480031,-0.011224729,-0.028706035,-0.024662105,-0.020339489,0.0032996584,-0.0031066886,0.06573639,-0.045026362,0.04669778,-0.010258512,0.010464151,-0.12597904,0.047364354,0.03603418,-0.030784203,-0.0045283823,-0.061205816,-0.084781356,0.0101111755,-0.036819644,0.03865052,0.002554983,-0.041125856,-0.03431458,0.02003805,0.045814104,0.0149893565,0.041405857,-0.0058300085,0.0009952715,0.05005995,-0.034552637,0.02680253,-0.013926857,-0.0066082613,0.0032130235,0.014591753,0.045457866,-0.0643016,0.03805741,0.06673648,-0.011952069,-0.031157257,0.04485618,0.049315795,0.016872773,0.020242054,0.05404053,0.0022385505,-0.05821434,0.010195752,0.037436724,-0.008059091,-0.031218007,-0.028865477,0.010544669,-0.02100428,0.012922586,-0.03158113,0.07632866,0.030863266,-0.020624844,0.11806365,0.0020353892,-0.017439645,-0.033523582,0.057561424,0.021796674,-0.02772771,0.030671997,0.017856758,-0.021891482,0.003966125,0.003039754,-0.035662517,-0.02010882,0.009779704,-0.023548966,0.009480768,-0.058997374,0.046217095,-0.028877534,0.02141583,-0.07330576,0.041170895,-0.11420243,-0.042197395,0.07423954,0.0060900487,-0.01325366,0.017403044,-0.03372157,-0.026540147,-0.037462782,0.0150587205,-0.05303113,0.019846993,-0.017457658,-0.0055363677,-0.03159893,0.002205795,-0.03141812,0.064492196,-0.0038559097,-0.031421974,0.046711735,-0.02754845,0.039555784,0.008997117,0.025339713,0.00196198,-0.009867535,0.014958226,-0.0031987336,0.020190718,0.04690813,-0.0036133802,-0.015377664,0.015753115,-0.02570666,-0.019304257,0.053959183,-0.06159188,0.022127097,0.028135851,-0.010005317,0.0505169,0.049345948,-0.020091306,0.023026029,0.02566506,-0.07602861,-0.06477117,-0.0065646977,0.021883866,0.029013524,0.012957985,0.0016810176,0.033398174,0.028798956,-0.2091241,0.0073285904,-0.018741738,-0.029790271,-0.011198788,0.028414378,0.024343401,0.0045411503,0.015287421,0.013874561,0.02116798,-0.028576916,-0.009944533,0.00563367,-0.034249756,0.020067943,0.012499116,-0.022776162,0.0032384868,0.006962617,0.013892786,0.058809847,-0.047272567,-0.009622452,-0.043926034,-0.0010798562,-0.008338585,-0.0071488414,0.003513728,0.021595657,0.015730191,0.01403547,0.02757728,0.023536865,-0.02522351,-0.027577762,-0.0055848965,0.030899648,-0.06295729,0.019935744,0.036939334,-0.013403965,-0.029304383,0.019328639,0.00022575595,0.030221839,0.04175544,0.012896464,-0.05402033,0.0009441915,0.005336982,-0.006617695,-0.10247346,-0.007130014,-0.0010271993,0.07624592,0.014195997,0.008423643,0.044613525,-0.016578732,0.043635085,0.07463798,-0.040932998,0.017319186,-0.02325794,-0.015193963,0.033980455,-0.059941504,-0.042232003,-0.010704367,0.030521225,-0.023605347,-0.016243972,-0.0030461107,0.022389662,-0.033091266,0.012303917,-0.024980886,-0.06650197,0.018898413,-0.022703983,-0.010120367,-0.009730847,0.018796483,-0.040948078,-0.013286097,-0.021519791,0.005499889,0.03759763,0.0087010795,-0.035681296,-0.05606869,-0.010526355,0.021268822,0.0072453367,-0.038622014,-0.04668957,0.012660585,-0.010082413,-0.0014207385,0.005634362,-0.016662862,-0.020646164,0.02322659,0.065152295,-0.06332151,-0.10680413,-0.0084349895,-0.018949449,-0.046501216,0.058720604,0.006611302,0.061974086,-0.014039311,0.008386709,0.014106839,0.043005634,-0.037931655,-0.023183051,-0.025908658,-0.02294836,-0.025014387,-0.012601666,0.004676211,0.056706253,0.029762788,-0.043551162,0.026641,0.013037155,0.04076987,0.012779485,-0.059397653,0.024665972,-0.03743212,-0.034101423,0.03207466,0.027374458,-0.002227133,0.011674849,0.016756745,0.084248886,-0.03148122,-0.04724148,0.056414206,-0.007727477,0.01801758,0.011211714,0.0016086268,-0.0030010021,-0.039837576,0.0071051605,-0.0866632,0.020839375,-0.013355218,-0.04504652,0.026250865,0.03754277,0.054526918,0.0076803956,0.035855077,0.0117737865,-0.023973826,0.02769656,0.008022958,-0.010589522,0.013310719,-0.032589253,-0.03892081,0.005900211,0.033208795,-0.021836508,0.028292598,0.027168058,0.018164646,-0.0016780532,-0.024223942,0.044821795,-0.012200762,-0.019274877,0.046612147]
11	shippers	Table: shippers\nDescription:\n  ข้อมูลบริษัทขนส่งที่ใช้จัดส่งสินค้าให้ลูกค้า ถูกอ้างอิงผ่าน orders.ship_via (ชื่อ column ต่างจาก shipper_id)\nColumns:\n  shipper_id   SMALLINT    PRIMARY KEY  -- รหัส shipper\n  company_name VARCHAR(40) NOT NULL     -- ชื่อบริษัทขนส่ง เช่น 'Federal Shipping', 'Speedy Express', 'United Package'\n  phone        VARCHAR(24)              -- เบอร์โทรศัพท์\nRelationships:\n  - shipper_id ถูกอ้างอิงโดย orders.ship_via (one-to-many)\n  - [CAUTION] JOIN ด้วย orders.ship_via = shippers.shipper_id ไม่ใช่ orders.shipper_id	[0.035528462,0.04700996,-0.02871837,0.011889374,0.02007625,-0.030071294,-0.021904688,-0.031367842,0.04106818,0.004949725,0.0124918,0.013981675,0.114447154,0.034622636,-0.021950018,-0.038961995,0.012146823,-0.02680841,0.025231779,-0.022428917,0.04490292,-0.034176227,0.05013925,0.009167847,0.0071553774,-0.026413968,-0.02737432,4.7028265e-05,-0.058025286,0.047346238,0.024807908,-0.033334047,-0.0071339332,0.027594868,0.00999746,0.0043046987,-0.0036771605,-0.013008408,-0.016118608,0.018495249,0.009548204,0.019377118,0.020487273,-0.04558131,0.036498025,-0.023525238,0.02758138,-0.026358973,-0.033766896,-0.015865695,0.009528791,0.01416938,0.04156056,0.03424104,-0.057448506,0.009333691,0.019604195,0.025258005,-0.028110793,0.017081039,-0.0034308385,0.027909767,-0.0058988677,0.046653982,0.028206635,-0.054510567,0.011558134,-0.011688498,-0.04147774,-0.04526563,0.021194011,0.0036429064,0.09255654,-0.0031412502,-0.016772736,-0.0040333983,-0.04221849,0.022962434,-0.015607377,0.0135152945,0.042761587,0.043539543,0.001076387,0.029086871,-0.012914346,0.0052374573,-0.02090503,0.066658735,0.048769925,0.038630497,0.035629496,-0.035124704,-0.046597797,0.029824303,0.015612404,0.019765273,0.017832123,0.001099143,0.025605224,-0.013391199,-0.0067244167,-0.08738082,-0.013518342,-0.052072283,-0.06072108,-0.012088454,-0.008199697,-0.05762115,0.04778529,-0.053267214,-0.030615952,0.010664844,0.043497756,-0.06081782,0.0035671555,-0.044918478,0.07318293,-0.06255769,0.036485553,-0.05743218,0.0018433247,0.020834416,-0.020431865,-0.011952656,0.019463602,-0.032314416,-0.01286121,-0.021842007,0.05702084,-0.07473969,-0.013912487,-0.04509231,-0.010436962,0.044496093,-0.021625815,0.053488538,0.021998297,0.013387956,-0.020339377,0.017372647,0.0353373,-0.05153126,-0.00031326097,0.057170335,0.0066570854,-0.076646775,-0.017277947,0.022430966,0.0034125121,0.036069207,0.035664547,-0.049535707,-0.026901955,-0.007775814,0.005945819,0.004466846,-0.0035626467,0.00499884,-0.0020247886,0.02377793,0.025230879,-0.011321311,0.011425089,-0.019592784,0.042785943,-0.01743404,5.0997307e-05,0.0388477,-0.034062203,0.0057439646,0.008524802,-0.04085037,-0.06459452,0.014974665,0.0050874003,-0.035035513,-0.04632354,-0.036912326,-0.026641387,-0.07618115,-0.039569482,-0.017142687,-0.038314413,0.026589254,-0.0066916626,-0.013153077,0.013044742,-0.008859778,0.02509214,0.025458226,0.0048070406,0.07279742,0.025689919,0.04145242,0.026571073,0.00976612,0.024645407,0.008731037,0.019022048,-0.061337974,0.01549357,-0.009305884,0.00837528,-0.0030000398,0.00096595834,-0.037066005,-0.026074326,0.04670145,0.022389421,0.033006452,-0.010632618,0.032331523,-0.036809213,0.0141009735,-0.013962553,-0.076006554,0.03118903,0.045033094,-0.023667714,0.04619583,0.010681866,-0.019805197,0.074095145,0.043312427,-0.03101123,0.003121567,0.030753335,-0.02185555,0.027422031,0.030466223,0.018321365,0.070663035,-0.01285403,0.04028179,0.0008102643,-0.019047586,0.033277806,-0.008358966,-0.014797156,-0.12300521,-0.025574781,0.001688219,-0.0022129065,-0.04034298,0.036114287,-0.05750873,-0.019875187,0.027745422,-0.057563342,0.03463613,0.012430869,-0.057428967,0.04513427,-0.013644068,-0.005867905,-0.0018432382,-0.022860035,-4.8050744e-05,0.046453536,-0.00012930938,0.028011536,-0.027901497,0.003517211,-0.026968237,0.02404429,0.024889942,0.022753928,-0.021701477,-0.038587634,-0.0004759502,-0.0003091359,-0.02336388,-0.050075613,0.010382252,0.0030323793,-0.012821661,-0.036468863,0.023750298,0.016988171,-0.036662284,-0.036010243,0.04009658,-0.032523297,-0.022743784,-0.040027406,-0.0033213648,-0.058909107,0.015903238,-0.03876683,-0.026596865,0.041822802,0.06431571,0.002591846,0.011262222,0.019303141,0.03305463,0.043102033,-0.005471817,-0.030593667,-0.0029381146,-0.033576787,-0.008289783,0.017000848,-0.056343958,-0.007579367,0.014518258,0.11632746,-0.005654741,-0.04653937,0.048142098,-0.028321903,-0.017336003,-0.019360853,0.029635394,0.053927142,-0.07551014,0.0036324982,0.08355533,0.0073833955,0.027928317,-0.028468836,0.006421505,-0.03641889,-0.09314622,0.027931968,-0.061942022,0.02580899,-0.019118896,0.032650277,0.029791852,-0.017211689,0.018434959,0.032716922,0.030588958,-0.062663846,0.05252536,-0.03920313,-0.024837164,0.07385148,0.0105666835,-0.012618092,0.03189543,0.04955842,0.009734156,0.038288217,-0.07428169,-0.022243774,-0.034658592,-0.048722077,0.034549613,0.031991288,-0.053620514,0.024080457,-0.0054279617,-0.049765885,0.0124374125,-0.007314989,-0.019373043,-0.015145943,-0.016060356,-0.021052165,0.015187937,0.02480703,-0.01312505,0.0321831,0.047166113,-0.049884368,-0.024823578,-0.015611744,-0.008743892,0.09106771,0.023293285,-0.0506804,-0.0044328044,0.050099872,-0.036942746,0.037243098,-0.056632172,0.002234959,0.014608576,0.039834537,0.027782725,0.033167906,0.02271188,0.0076932916,0.022109797,0.013178927,-0.059440233,0.055213608,0.009218887,0.031927086,-0.0009103153,0.025729824,0.03010861,0.034905802,-0.0174593,0.029100105,-0.004760658,0.0013344815,-0.018946996,0.039301176,0.021361768,0.02615474,0.047551714,0.032504376,0.014301259,0.0006125148,0.020810222,-0.013464558,-0.030833738,0.04658729,-0.028733194,0.05461819,-0.012644502,0.032588053,-0.04828881,0.00198807,0.03981162,0.023979025,-0.0059837187,-0.06782045,0.030545706,0.031234289,0.00816647,0.020983877,-0.073115505,-0.0015694463,-0.008929947,-0.02305765,-0.02199952,-0.005500223,-0.017742084,0.012331052,0.006256417,0.0056942943,-0.039153878,0.044021748,0.016652975,-0.047537185,0.0344494,-0.0051939073,-0.01964043,0.018351251,-0.006960582,-0.01718962,-0.004429805,-0.03895517,0.018030189,-0.008211641,-0.0077828704,-0.004498322,-0.010833423,0.0008373325,-0.013111478,0.04833967,-0.0634722,0.08867963,-0.041490782,-0.0009641692,-0.12251537,0.05025705,0.03568918,-0.015210429,-0.017566703,-0.0036806674,-0.06574245,0.020359611,-0.013322374,0.025847208,-0.03242851,-0.050641846,-0.027469309,0.0012440381,0.037390098,0.01063356,0.036917742,0.01095656,0.011839073,0.01846488,-0.032459933,-0.0028068912,-0.041774854,-0.03474124,0.0058249244,0.01752716,0.016654234,-0.08560915,0.057286855,0.013181464,-0.037587065,-0.0141915,0.028382353,0.062486604,-0.012410629,0.01322758,0.068461254,-0.008339868,-0.044255096,0.008299127,0.04580219,-0.020563252,-0.032227743,-0.06171994,-0.00044471538,-0.039794434,0.018617671,-0.029254809,0.057597365,0.04594273,-0.018007796,0.11238569,-0.025771473,-0.02637505,-0.013380929,0.020076597,-0.02291183,-0.03307461,0.0299306,0.03037046,-0.012644389,-5.3453226e-05,0.016592478,-0.055400424,-0.013516747,0.006433138,-0.04578126,0.00636543,-0.027467068,0.03982821,-0.015611061,-0.008497816,-0.051538486,0.040452443,-0.08784327,-0.080368824,0.032578185,-0.002880966,-0.028049998,0.059662387,-0.033101697,-0.021884538,-0.010822196,0.011873336,-0.053126626,0.027418122,-0.037332777,0.0063971845,-0.016940165,0.018626891,-0.0040966924,0.049986806,-0.0047138114,-0.028366469,0.03650532,-0.031570747,0.054252155,0.01104934,0.045548815,0.025249785,-0.017275296,0.04016822,-0.01713088,0.010645882,0.04967525,-0.008405742,0.019731764,0.023963599,-0.018353093,-0.04377638,0.04759494,-0.07040765,0.0005451887,0.034241967,-0.009481408,0.07296254,0.028713169,-0.0032663937,-0.012700453,0.024407348,-0.06443281,-0.060846057,-0.056124885,0.02580173,0.039476246,0.023380285,0.0035313636,0.040308774,0.03130298,-0.21866398,0.02800778,-0.024070064,-0.012104902,-0.021498268,0.0075687813,0.024596117,-0.035060693,0.0073978677,0.020902527,0.030990018,-0.042020604,-0.008878147,-0.017424213,-0.066271916,0.0442374,-0.0002725292,-0.03100744,0.009505743,0.013243407,0.008314838,0.061650068,-0.040661942,-0.006632888,-0.034521174,-0.044801272,-0.0077329907,0.017642502,0.006326097,0.03724872,0.0017529023,0.004212208,-0.003255663,0.03226823,-0.021343589,-0.009365157,-0.020344345,0.011512482,-0.07932052,0.038235605,-0.008361927,-0.010954066,-0.028088422,0.01587545,0.018563736,0.04260153,0.051139433,-0.003054707,-0.048251677,-0.01344338,0.0062770643,0.02707011,-0.10942136,0.017768525,0.009784213,0.0645129,0.013993383,0.010094175,0.07088879,0.012288572,0.07090425,0.068246275,-0.047784988,0.02627722,0.012181744,0.0030143964,0.023494968,-0.03380867,-0.017855106,0.008282868,0.045731425,-0.022624828,-0.008284902,0.00013434418,0.014794357,-0.048827093,0.010660868,-0.04633826,-0.05071669,0.058354277,-0.0059609273,-0.025015114,-0.019108163,0.005996112,-0.035183784,-0.03134742,-0.044257943,0.014419097,0.032082263,0.014038697,-0.014748874,-0.039692327,-0.0037512057,0.013767305,0.042639438,-0.038134493,-0.017782042,0.009496785,-0.018352669,-0.02908681,0.0098887775,-0.034329887,-0.01855262,0.024593089,0.06160039,-0.011091613,-0.09705444,0.03461766,-0.018998116,-0.038556524,0.06179961,0.022455413,0.052894983,-0.0264766,0.007707278,0.016516482,0.027819648,-0.06563562,-0.025739172,-0.011507021,-0.04587559,-0.012395305,0.017679155,-0.013970565,0.011951049,0.021963796,-0.036471106,0.043647032,0.020423926,0.017033665,-0.0075648567,-0.06596172,0.025184248,-0.04338438,-0.016103594,0.0440648,0.020799361,0.0014095955,-0.00021692096,0.014219793,0.08781939,-0.058058076,-0.044894323,0.036902357,-0.02535237,0.018639995,0.02269812,0.0006838971,-0.010554449,-0.049947873,-0.0049781185,-0.077931084,-0.0082420185,-0.016736627,-0.026350187,0.022884583,0.030416956,0.029418724,-0.03242495,0.038519662,0.00027671704,-0.038729846,0.0125704575,0.0033512176,-0.014652939,0.032194793,-0.027130667,-0.027739054,0.021423172,0.047723185,-0.019653557,0.026198333,0.050951455,0.035722475,0.006934962,-0.03785861,0.08410342,-0.028082233,-0.0075140926,0.048261657]
12	suppliers	Table: suppliers\nDescription:\n  ข้อมูล supplier (vendor) ที่จัดหาสินค้าให้ Northwind หนึ่ง supplier จัดหาได้หลาย products\nColumns:\n  supplier_id   SMALLINT    PRIMARY KEY  -- รหัส supplier\n  company_name  VARCHAR(40) NOT NULL     -- ชื่อบริษัท supplier เช่น 'Exotic Liquids', 'Tokyo Traders'\n  contact_name  VARCHAR(30)              -- ชื่อผู้ติดต่อ\n  contact_title VARCHAR(30)              -- ตำแหน่ง เช่น 'Sales Representative', 'Owner'\n  address       VARCHAR(60)              -- ที่อยู่\n  city          VARCHAR(15)              -- เมืองที่ตั้ง\n  region        VARCHAR(15)              -- ที่อยู่จริง [CAUTION] ไม่ใช่ work region, nullable สำหรับ supplier ในยุโรป\n  postal_code   VARCHAR(10)              -- รหัสไปรษณีย์\n  country       VARCHAR(15)              -- ประเทศ เช่น 'UK', 'USA', 'Japan', 'Germany', 'France'\n  phone         VARCHAR(24)              -- เบอร์โทรศัพท์\n  fax           VARCHAR(24)              -- เบอร์แฟกซ์\n  homepage      TEXT                     -- เว็บไซต์\nRelationships:\n  - supplier_id ถูกอ้างอิงโดย products.supplier_id (one-to-many)	[0.035765134,0.018196462,-0.017221436,0.0038514617,0.028600657,-0.061894998,-0.00857383,-0.02593684,0.035683535,0.016150527,0.005415904,0.004607197,0.10697228,0.054990675,-0.030444236,-0.044492345,0.053621773,-0.0061955354,0.0152568845,-0.03431583,0.055985313,-0.017572705,0.04202854,-0.027825944,0.0019676257,-0.028960222,-0.016211595,0.0038403329,-0.041699152,0.031102516,0.03717672,-0.05140227,0.007886908,0.016233936,0.018576557,0.01972585,-0.005751079,-0.007657202,-0.0064044353,0.0151169095,0.0100545585,6.3517437e-06,0.034608487,-0.022972628,0.03636589,-0.010267292,0.03883858,-0.014505316,-0.010715827,-0.023854265,0.030472845,0.0005841905,0.04156166,0.026825488,-0.028477876,-0.021191461,0.0281437,0.0596791,-0.02332115,0.0051577697,-0.014851961,0.0336528,-0.013397043,0.039288208,0.012401063,-0.027843049,0.014376694,-0.008708514,-0.063252315,-0.017447444,-0.0017711942,0.041915674,0.10126059,-0.010947656,-0.024372824,-0.013312122,-0.06476008,0.03341333,-0.0006386721,0.013178714,0.044786252,0.017517112,0.0041116783,0.021862773,0.011025608,-0.022760468,-0.013636672,0.041851874,0.02947141,0.04200929,0.033048555,-0.04167741,-0.03712581,0.027852995,0.0014080795,0.0089831585,0.026206793,0.008948041,0.04615799,-0.052349817,-0.025018437,-0.080740824,-0.018457346,-0.07259788,-0.08191233,-0.016188787,-0.014380037,-0.06253619,0.036534827,-0.053417534,-0.03409445,-0.0041417256,0.018204732,-0.048311282,0.02948803,-0.026730653,0.04783274,-0.041495644,0.022174757,-0.036344014,-0.03295106,0.019083126,-0.030287294,-0.0067700087,0.029190533,-0.03143148,-0.0055006417,-0.023147838,0.03797999,-0.04411093,-0.022602197,-0.039495427,-0.003704942,0.05756193,-0.009726935,0.04352006,0.038568866,-0.019167509,-0.0063912896,0.009629816,0.031265832,-0.050363854,0.000645386,0.041057315,0.01544151,-0.05080439,-0.009969313,0.020838652,-0.0036539654,0.04431873,0.040290616,-0.041065883,-0.04084964,-0.027216582,0.0075867274,0.00021104627,-0.03510121,-0.007893198,0.002306827,0.040571105,0.025628945,-0.010098912,0.03055151,-0.02093533,0.04660757,0.0047450764,-0.0038079529,0.06321096,-0.033320483,-0.003793908,0.01593156,-0.028611634,-0.06922415,0.0045470526,-0.009586494,-0.0050801393,-0.038259696,-0.028897349,-0.01875646,-0.03985426,-0.025835041,-0.022333419,-0.03443957,0.02593215,-0.018994847,-0.036497187,0.013920448,-0.0030408087,0.024727937,0.005785749,0.0011343877,0.06528752,0.0046059457,0.028994126,0.02273832,0.006402929,0.0258643,0.014980937,0.007096117,-0.05121247,0.02401319,-0.017394278,0.04127221,-0.006434241,-0.006024395,-0.032644812,-0.024450554,0.06832436,0.00639776,0.04183495,-0.01923113,0.019369626,-0.026565146,0.022763642,-0.03062057,-0.043114066,0.029257484,0.036427185,-0.019870162,0.0397678,0.021473136,-0.03822076,0.05565688,0.035404883,0.0005012582,0.005164845,0.019976677,-0.0044923737,0.027911289,0.043415353,0.014703471,0.07855874,-0.011379082,0.031435516,-0.0249035,0.003185202,0.021889566,-0.015841573,-0.03653515,-0.09931105,-0.021122476,0.011120432,-0.002752829,-0.021892145,-0.0126127675,-0.04728405,-0.05954735,0.039341323,-0.07161698,0.04228413,0.018334646,-0.06259116,0.032652866,-0.024348782,-0.0013066968,0.02725124,-0.037804294,0.028685993,0.04871114,0.0012398777,0.010845458,-0.0070394594,-0.008519897,-0.030783491,0.024804583,0.030540014,0.012482492,-0.0274923,-0.05439526,-0.016946707,-0.010271481,-0.043901116,-0.037957124,0.0027643845,0.030967025,-0.039083585,-0.027352331,-0.0063491333,-0.007603607,-0.023097964,-0.028068138,0.037677936,-0.03581326,-0.015602379,-0.043630034,0.019831607,-0.055275228,-0.013582258,-0.052291356,-0.0040273354,0.03891503,0.080927126,-0.021827636,0.013437085,0.0289472,0.028585667,0.0155141605,-0.012538667,-0.014035413,-0.024523286,-0.050830003,-0.024920534,0.017747153,-0.046856586,-0.016784433,0.014602217,0.11133925,0.0088067455,-0.050962176,0.035826594,-0.022696784,0.0038619319,-0.02470124,0.051019218,0.043931555,-0.07411009,0.031269345,0.057653364,0.002993399,0.04719613,-0.011976041,0.010373699,-0.031823818,-0.09173835,0.03100237,-0.07262485,0.02538947,-0.0045086183,0.070370525,0.02434021,-0.0282813,0.02716201,0.017639115,0.029327376,-0.08838956,0.036145393,-0.061774295,-0.05561399,0.0690232,0.010284464,-0.015158515,0.044084556,0.046398982,-0.03309817,0.059407566,-0.09991626,0.016041694,-0.04558151,-0.062931895,0.027982008,0.039343625,-0.0666148,0.021279361,0.0014864646,-0.023311317,-0.014211308,0.008386322,0.015876817,-0.029752051,-0.01544452,-0.019317888,0.00092368206,0.010019473,0.010623697,0.021794908,0.03390072,-0.033500645,-0.021549365,-0.012755095,0.014789753,0.0973688,0.02807104,-0.027613834,0.007324871,0.05235177,-0.023643801,0.027013967,-0.060459163,0.011658626,0.021997187,0.07830879,0.02085601,0.03934891,0.037027944,-0.026070202,0.006668425,0.014421298,-0.054871943,0.019936318,0.008599776,0.03117029,-0.012531217,-0.003707292,0.022423508,0.027456388,-0.015079073,0.027247151,-0.0015344918,0.027293703,-0.014166471,0.035890833,0.021491906,0.01564491,0.059843965,0.026301408,0.011814264,-0.0068991096,0.037569627,-0.0027522247,-0.008741096,0.049083717,-0.040651664,0.058663208,-0.021291275,0.0028247214,-0.026279544,-0.012336975,0.043447774,-0.02441788,0.005684254,-0.04386408,0.029718101,0.012421931,0.018019453,0.022864254,-0.07254579,-0.00027351364,0.00047178805,-0.0016101399,-0.040939186,-0.014453698,-0.0029273345,0.02117256,-0.01869825,0.0064673806,-0.041080233,0.024552675,0.02546048,-0.05923913,0.049206816,-0.031525083,-0.01738314,0.02133505,-0.028315848,-0.037615187,0.0049365945,-0.028727446,0.0031264285,-0.024562532,-0.015804533,-0.00019996199,-0.0073265643,0.0073213596,0.0010528126,0.048536558,-0.06633734,0.057612028,-0.007047026,0.025988674,-0.12538904,0.018492553,0.043553848,0.0040552937,-0.013188512,-0.03171994,-0.08468782,0.014954428,-0.0051911455,0.048049204,-0.00018229718,-0.019616725,-0.01189826,-0.0012880048,0.036581382,0.0068511483,0.03470624,-0.03001973,-0.008280246,0.0047103083,-0.035142362,0.0045363833,-0.0019338907,-0.008339741,-0.0067870575,0.03372529,0.0354309,-0.09676543,0.05660695,0.04688028,-0.032473102,-0.041015245,0.029292347,0.0273682,0.0077321255,-0.002770621,0.049712475,9.7119955e-05,-0.058839306,0.030680895,0.0361608,-0.01872995,-0.037790645,-0.07008809,0.00754269,-0.03756872,0.004884549,0.008183893,0.04830759,0.06379411,-0.04516017,0.12798138,-0.0010284766,-0.012788782,-0.020741789,0.036347583,0.0040439176,-0.03390919,0.03255499,0.04803313,0.0023557914,-0.012734089,0.010047966,-0.043774076,-0.012030082,0.015304858,-0.050840534,0.007575756,-0.045314435,0.056005552,-0.026414277,0.009495857,-0.03626695,0.033742823,-0.10043583,-0.04373673,0.054786697,-0.014913555,-0.033707213,0.03318223,-0.039884955,-0.0067297495,-0.022514347,-0.019472048,-0.051019046,0.020690145,-0.013806682,0.012469638,-0.036124904,-0.010524207,-0.015818788,0.051852323,0.009312511,-0.03532409,0.091796294,-0.029121375,0.031608384,0.026757794,0.021710029,0.016302912,-0.007816273,0.023327004,0.0042348136,0.014056112,0.04539316,-0.0064232047,0.017747035,0.036562808,-0.010289704,-0.039283756,0.06709616,-0.028128086,0.013333239,0.06415998,-0.019800525,0.050406765,0.03547164,-0.002472834,-0.010141817,0.008381465,-0.04077131,-0.059742417,-0.019040648,0.018561773,0.03012908,0.007063397,0.016188802,0.03589832,0.008556096,-0.22802465,0.021255773,-0.014613799,-0.019136187,-0.020116484,0.014288395,0.026386777,-0.019757977,-0.0012125919,0.033760644,0.05569216,-0.041193977,-0.016682416,-0.0124021,-0.045679133,0.016983416,0.020318557,-0.04133759,0.0047918004,0.01233061,0.009677754,0.06661332,-0.04967454,-0.0149597,-0.031874876,-0.022805361,-0.0038150004,0.0053227115,-0.011138225,0.04368151,0.010710749,-0.009220354,-0.0023914874,0.039679874,-0.008207173,0.033815496,-0.029581012,0.020517318,-0.09033884,0.06350388,0.0067784605,0.011291784,-0.046452958,0.0065211337,0.025217978,0.061582442,0.049840212,0.0014912345,-0.044362336,-0.038987946,0.03337918,0.031852588,-0.09587074,0.016897002,-0.008240805,0.029964505,-0.004925387,0.008552897,0.057713978,-0.0074670142,0.063182816,0.07612219,-0.048751395,0.028072022,-0.012691745,-0.009654316,0.02793756,-0.039906006,-0.028434588,0.034151323,0.048672628,-0.028872738,0.006618257,-0.0066085877,0.04708419,-0.041114725,0.013017326,-0.02465099,-0.063144155,0.015829349,-0.009533778,-0.021374814,0.0055057807,-6.2177605e-05,-0.024429213,-0.027990162,-0.021048646,-0.0052185026,0.04078391,0.037819784,-0.025185432,-0.025506033,-0.015099448,0.009280055,-0.006416726,-0.042842757,-0.023225939,0.01987813,0.006441345,-0.017412927,-0.015190691,-0.029035468,-0.04231272,0.045956437,0.07715911,-0.0612861,-0.095219225,0.029891554,-0.026856279,-0.059964497,0.044985,0.03781916,0.0513288,-0.01273942,0.0071590855,0.011814463,0.026874507,-0.03857294,-0.027275072,-0.008141433,-0.043567423,-0.0034668583,0.03225131,-0.0051241517,0.008611898,0.024508914,-0.03517554,0.062270198,0.020089151,0.027806673,-0.0150593305,-0.060375933,0.034790125,-0.037086397,-0.027933147,0.042736858,0.021655157,-0.002065087,0.0038701317,0.017583562,0.054382548,-0.057552326,-0.040690295,0.03459991,-0.031863302,0.012494945,-0.0032726577,-0.0127078295,0.015641352,-0.050336406,-0.016426379,-0.089719094,-0.014152253,-0.015371634,-0.026468717,0.02666626,0.0077504204,0.047643494,-0.027465098,0.021271346,-0.026891515,-0.025364071,0.0021397204,-0.010789569,-0.008032768,0.023472834,-0.036898255,-0.008141035,-0.004499515,0.034361128,0.002043327,0.02386996,0.047001746,0.013456495,-0.012962392,-0.025624616,0.06950847,-0.009252348,-0.015474454,0.04801912]
13	territories	Table: territories\nDescription:\n  พื้นที่รับผิดชอบการขาย (sales territory) ใช้จัดกลุ่มพนักงานขายตามพื้นที่\n  หนึ่ง territory สังกัดหนึ่ง region, หนึ่ง region มีได้หลาย territories\nColumns:\n  territory_id          VARCHAR(20) PRIMARY KEY  -- รหัส territory\n  territory_description VARCHAR(60) NOT NULL     -- ชื่อพื้นที่ เช่น 'Boston', 'Atlanta', 'Seattle'\n  region_id             SMALLINT    NOT NULL      -- FK → region.region_id: work region ที่สังกัด\nRelationships:\n  - region_id    → region.region_id    (many-to-one)\n  - territory_id ถูกอ้างอิงโดย employee_territories.territory_id (one-to-many)\n  - เข้าถึงจากพนักงานผ่าน: employees → employee_territories → territories → region	[0.023470396,0.02926534,-0.008622858,-0.0062559354,0.018880842,-0.039134752,-0.02340461,-0.03666244,0.04366143,0.017912501,0.04718599,0.011491192,0.109752364,0.03825564,-0.023225535,-0.035172425,0.011174351,0.0035015808,-0.015955467,-0.038483214,0.020929707,-0.027817966,0.052408565,-0.013415358,0.0119798565,-0.028335338,0.0115773585,0.0068861237,-0.014230958,0.056047685,0.017346105,-0.033039387,0.012634481,0.0132487705,0.008740341,0.014406076,-0.025419649,-0.020126473,0.001341863,-0.0052042105,0.010654063,-0.017789844,0.022623232,-0.04526084,0.020611523,-0.025969682,0.043779675,0.017131248,-0.025263198,-0.017047893,0.025545016,-0.015637714,0.045631725,0.02770333,-0.034275398,-0.03476862,0.044835504,0.041811273,-0.048236087,0.041115697,-0.012206053,0.050045956,-0.0029303941,0.03587179,0.034617987,-0.026074914,0.031879764,-0.019678215,-0.032348618,-0.01881353,-0.0042812764,0.014395645,0.110015765,0.019502103,-0.03218438,0.007288034,-0.055432424,0.016515724,0.010729239,0.012931232,0.04580995,0.008880105,-0.0049090474,0.045969762,-0.0021261133,0.022648664,-0.009579989,0.041161407,0.01544301,0.04047626,0.046735812,-0.04173935,-0.04735022,0.059186347,0.0003762355,0.029462975,0.017237162,0.010701496,0.030646358,-0.041374624,-0.024961524,-0.069421634,0.016589794,-0.031819478,-0.07429734,-0.017417897,-0.012335453,-0.050062392,0.05002598,-0.0123774,-0.049845114,1.6959622e-05,0.046425365,-0.01871969,0.056421373,-0.053217765,0.025906585,-0.045616116,-0.0061027356,-0.058236092,-0.00088111416,0.034334645,-0.03036031,-0.04438506,0.032329623,-0.022617765,-0.029074544,-0.014383099,0.03011113,-0.016807323,-0.017073236,-0.067827165,0.020167088,0.041806772,-0.012202252,0.03344174,0.021942748,0.01764947,-0.008830744,0.000780072,0.050972305,-0.045751024,0.0059931893,0.08440651,0.005671249,-0.07757675,-0.01742726,0.018405419,0.0043944,0.011463855,0.046429418,-0.049797397,-0.018029643,-0.048768666,0.02619074,0.0022675234,-0.021641685,-0.0071825054,0.032129545,0.042821057,0.009036499,-0.05170432,0.02139043,-0.012574599,0.03792655,-0.022580419,-0.0030111652,0.0356487,-0.05076511,-0.031684384,0.02993638,-0.03690768,-0.06289627,0.02497746,-0.013523665,-0.005470827,-0.022073818,-0.037254587,-0.00958267,-0.042659476,-0.032654796,0.0048667397,-0.035821546,0.024260566,-0.002395845,0.012899535,-0.022395846,-0.020297023,0.023709917,0.010602399,-0.007383343,0.071951896,0.017453514,0.016390104,0.018881254,0.009662726,0.04156366,-0.0057253307,0.0050828764,-0.040311676,0.019424366,-0.030687898,0.029504932,0.037958376,0.021118915,-0.059904426,-0.020695115,0.053325437,0.011101281,0.041127436,-0.03636404,0.004024837,0.01576082,0.031845093,-0.04896255,-0.039754223,0.024771895,0.019871507,-0.037275095,0.05237668,0.01959348,-0.05839333,0.056503236,0.04507136,-0.015340037,0.012860037,0.016637076,0.011782295,0.018852621,0.048873223,0.035910238,0.086677976,-0.019868724,0.028566593,0.0058233044,-0.03244247,0.037253093,-0.008205804,-0.038675524,-0.096145906,-0.02904286,0.019675959,0.011138509,-0.054346863,0.0020604597,-0.061088018,-0.06634313,0.036021765,-0.055824187,0.039502546,0.02945471,-0.04480577,0.038940888,-0.038603045,-0.011520698,0.01871202,-0.031244783,-0.0014382318,0.019871201,-0.021612972,-0.010712514,-0.008118389,-0.007732212,-0.050229084,0.018745257,0.027932737,0.012405897,-0.022937788,-0.027124299,0.0065302593,-0.0057479255,-0.022430385,-0.03162584,0.030951891,0.0022141782,-0.023931038,-0.047147144,0.033533245,-0.011460297,-0.058281086,-0.032965645,0.030472131,-0.06025107,-0.026997725,-0.06661706,0.0045898496,-0.04201675,0.009331943,-0.042746417,0.01378394,0.0379682,0.09035207,-0.0054944176,0.012219666,0.055232354,-0.0063180653,0.014970975,0.0046601887,-0.020847801,0.0071917307,-0.053381797,-0.0146844415,0.048118573,-0.04430563,0.0020075531,0.01670397,0.11202716,0.014729668,-0.030433744,0.03706598,-0.0075258855,0.005503181,-0.018564075,0.035166036,0.02847283,-0.058400244,-2.4761969e-06,0.07845809,-0.007639907,0.027919529,-0.06034823,0.03055135,-0.024974704,-0.09730667,0.045101956,-0.064713776,0.03728553,0.0005542484,0.050261203,0.036787976,-0.04256597,0.01821305,-0.004899316,0.030709019,-0.054262955,0.024851982,-0.04788524,-0.05495639,0.073948406,0.02658014,-0.02199567,0.03132876,0.010235637,-0.023662897,0.042737473,-0.09135957,-0.017098999,-0.053549502,-0.043514278,0.014959823,0.0011536415,-0.06364883,0.05773964,-0.0067124655,-0.019892944,0.013310239,0.010066507,-0.030959895,-0.05708018,-0.012092455,-0.02103748,0.028207632,0.0056660594,0.012423079,0.023723487,0.018777931,-0.035823856,-0.04775996,0.0182188,-0.015086853,0.07707484,0.030913265,-0.003373701,-0.012521774,0.031094091,-0.013846433,0.03439779,-0.08421975,-0.0074390206,0.06474807,0.026293239,0.04817791,0.050359994,0.03400235,-0.038471293,-0.010033257,0.017345162,-0.06536002,0.046671532,0.0003642643,0.058105413,0.017919859,-0.011098512,0.052591432,0.030629186,-0.02800026,0.024868796,-0.01043068,0.028415777,-0.030647162,0.017400857,0.046918463,0.012428539,0.03974363,0.06051768,0.034488026,0.012935439,0.008754924,0.020137308,-0.04075763,0.038006026,-0.03849062,0.024029866,-0.0059841084,0.01680308,-0.0023319772,-0.003108003,0.047400188,0.0031446153,0.027456248,-0.07335996,0.017553557,0.016955774,0.017558051,0.013697714,-0.08708919,-0.014089318,0.0065392996,-0.0018304718,-0.024429101,0.023299888,-0.027764326,0.017044967,0.012068617,0.012358311,-0.048673388,0.022825023,0.016315376,-0.029095978,0.022753159,0.007491451,-0.03292665,0.022745429,-0.014797734,-0.030515658,-0.005213983,-0.014650492,0.01996051,0.0022274144,-0.016542403,-0.009865783,-0.014652619,0.0033266554,-0.012451398,0.056480855,-0.05234354,0.023257216,0.010347908,0.0035842776,-0.12815954,0.03573862,0.04223797,-0.0024817602,-0.023732856,-0.042449012,-0.09645411,0.0067292308,-0.028972426,0.045365337,-0.001890104,-0.03981674,-0.023209544,0.01063786,0.018685201,0.0076200045,0.064296305,0.005378728,0.0010687511,0.053710163,-0.03560827,0.031658128,-0.022659602,-0.009842131,-0.018417362,0.014055531,0.020818247,-0.07675698,0.04053466,0.049476147,-0.0056961374,-0.036566827,0.042370792,0.022240559,0.008108431,0.00870603,0.06483951,0.013615836,-0.056928158,0.002494664,0.03302955,-0.0057212366,-0.035655107,-0.06311052,0.008150626,-0.047034692,0.024837824,-0.045686692,0.04790299,0.036252376,-0.028448146,0.127529,0.02718254,-0.042893037,-0.011517575,0.06711387,0.01932172,0.009911448,0.045356657,0.013030848,-0.012688444,-0.0060970425,0.0113182105,-0.04693596,-0.01741827,-0.017694598,-0.03998854,0.02303101,-0.03611736,0.036816835,-0.027577499,0.04128986,-0.039932515,0.048364304,-0.11061885,-0.065093845,0.05953174,0.006886798,-0.012719002,0.034106757,-0.015386485,-0.0031990204,-0.019885771,0.03171955,-0.04708285,0.0025600835,-0.026888605,-0.0039453367,-0.03854387,-0.0024170838,-0.004916115,0.062107086,-0.014883394,-0.03978766,0.044079788,-0.037743084,0.039823946,0.02693061,0.018310843,-0.008000635,-0.0035876895,0.002109966,0.008221772,0.037015833,0.06407649,0.01968203,-0.004383495,0.019407272,-0.02931205,-0.028077358,0.046435416,-0.057370692,0.032948684,0.017389799,-0.0080265375,0.055674,0.035402548,-0.019987196,0.01729812,0.026787492,-0.052997075,-0.048019677,-0.00583725,0.03825492,0.02617509,0.029385664,0.0050223623,0.045033358,-0.013788954,-0.19496752,0.010205446,-0.008275037,-0.014342598,-0.010587613,0.03351773,0.035657544,-0.009068636,0.033186335,0.030182645,0.026180832,-0.028600372,0.011251119,-0.022149438,-0.043403044,0.03769434,-0.00082402094,-0.0301755,-0.0029199966,0.007020129,0.0061790915,0.055003475,-0.05983425,-0.009738067,-0.03278301,-0.003166963,-0.008206211,-0.015307159,0.005817738,0.017686477,0.029411241,-0.004016999,0.0060529364,0.02973861,-0.024723144,-0.014947894,-0.01003053,0.013597106,-0.07987229,0.03153317,0.023061547,-0.02123016,-0.026301892,0.0055102706,-0.010835291,0.059531778,0.028897453,0.018740863,-0.062348325,-0.007294424,-0.0009938426,0.0051814783,-0.09558677,-0.022606699,-0.009570682,0.08163811,0.020062039,0.0077501587,0.06030629,-0.02402519,0.060283836,0.052024078,-0.047226124,0.013043517,-0.014375021,-0.015771067,0.07167147,-0.04799262,-0.03288468,-0.01685913,0.0264821,-0.030992642,-0.034547154,0.0068342523,0.037264947,-0.032157667,0.018197814,-0.01603505,-0.056711465,0.013143405,-0.037386693,0.0038591246,-0.0061133658,0.0069695082,-0.03726667,-0.033349518,-0.023624325,0.004162762,0.033884834,0.018591335,-0.028316053,-0.056369066,-0.0066298577,0.018007653,0.010542379,-0.030827904,-0.029081903,0.03640746,-0.0106411,-0.012405885,0.01372211,-0.016200721,-0.032505807,0.022355517,0.04914783,-0.047388956,-0.12111631,0.013277945,-0.038413342,-0.054781564,0.04257606,0.002927103,0.043059457,-0.005188563,0.019238647,-0.005501057,0.014645764,-0.04585401,-0.042692132,-0.012015088,-0.027837059,-0.04080177,0.0077944463,0.029300012,0.043303467,0.03591109,-0.04572647,0.019702315,0.016833829,0.0269345,0.0046248618,-0.051828403,0.026362648,-0.035102263,-0.046262767,0.015861543,0.010180599,-0.007506945,0.019994004,-0.004384471,0.07545959,-0.033401337,-0.045859117,0.05382664,0.0015272051,0.008169888,0.002272466,-0.016104124,-0.009962408,-0.042456944,0.0032844972,-0.101409055,0.025234777,-0.012797964,-0.04557513,0.033700947,0.007094487,0.0353562,-0.0031925607,0.015728934,0.002369819,-0.018771969,0.02705997,-0.005827341,-0.0042674444,0.010890398,-0.031920765,-0.061997186,-0.007408126,0.023942053,-0.005680987,0.046728197,0.019057939,0.013744102,0.004537787,-0.023324199,0.032215104,-0.016651845,-0.009085113,0.01916068]
\.


--
-- Data for Name: schema_embeddings_short; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_embeddings_short (id, table_name, content, embedding) FROM stdin;
1	catarories	Table:categories\nDescription:หมวดหมู่สินค้า\nColumns:\n  category_id   INTEGER PRIMARY KEY,  -- รหัส category\n  category_name VARCHAR(15) NOT NULL, -- ชื่อ category เช่น Beverages, Seafood\n  description   TEXT,                 -- คำอธิบาย category\n  picture       BYTEA                 -- รูปภาพ category	[0.02019132,0.03693226,-0.010998994,0.017531876,0.02501433,-0.02617976,-0.023828814,-0.042400394,0.036725663,0.06457069,0.027780699,0.0034801792,0.12285725,0.04998167,-0.023259787,-0.044187803,-0.011457778,-0.021619702,0.028649788,-0.0029433665,0.0319539,-0.034099754,0.02244438,-0.02311158,0.0026400397,-0.024125867,0.00870646,0.0101795755,-0.027553799,0.045024756,0.011443072,-0.033661675,-0.013840142,0.07426555,0.015399718,-0.006871738,-0.01765921,-0.018000599,0.0072551398,-0.012838654,0.022751778,0.0066307667,0.04277352,-0.021689722,0.023108615,-0.025296992,0.04176735,0.013421417,-0.017102031,-0.010716656,0.008345551,-0.0015311263,0.03408995,0.017745553,-0.028934099,-0.015461424,0.03375053,0.06224735,-0.031148463,0.024393866,-0.0093842875,0.04136034,-0.02532445,0.0057604252,0.03421177,-0.03188444,-0.016015194,-0.019175494,-0.052096907,-0.022773737,-0.019461852,-0.0066179656,0.09414016,-0.01335297,-0.011910882,-0.007290493,-0.03620953,0.02314622,0.0034918252,0.03404461,0.04445124,0.039073825,0.01571419,0.03568773,0.025594339,0.0062784096,-0.026215652,0.05640523,0.038527664,0.055023443,0.016502172,-0.023311023,-0.041777357,0.056016084,0.0037039625,0.020150391,0.011771354,0.0065252637,0.014722533,-0.051513337,-0.021782042,-0.07841464,-0.01670662,-0.038906146,-0.10067872,-0.030012026,-0.024401866,-0.051880747,0.07839419,-0.02530852,-0.008274329,0.003885711,0.0080109965,-0.02573366,0.015523554,-0.04212332,0.07067655,-0.045701765,0.010490417,-0.039830685,-0.014197803,0.0046017077,-0.03118616,-0.010909513,0.039865334,-0.06408252,-0.014798627,-0.016248723,0.02735732,-0.0370252,-0.015440852,-0.023158584,0.007240487,0.02798304,0.0049545662,0.06255701,0.024064913,0.0003406188,-0.010475828,0.0103345085,0.0093789,-0.077626735,-0.009533572,0.0782791,0.016633982,-0.05996488,-0.0018304414,0.0032641937,-0.008497241,0.026873667,0.046170857,-0.052719466,-0.02725083,-0.013664663,0.019224143,-0.00049104093,-0.04143674,-0.008493914,0.0055168215,-0.005320567,0.025835574,0.0010500631,0.0041499846,-0.006981515,0.022222469,-0.014545651,-0.025944127,0.029651787,-0.03694865,-0.033009924,0.0063896617,-0.04036119,-0.07491407,0.032225113,-0.027259817,0.00092266354,-0.023005644,-0.01244458,-0.006872333,-0.06591345,-0.057712834,-0.024445212,-0.061780237,0.027527211,-0.0029426026,-0.01942106,-0.0028169283,-0.015548373,0.048418295,-0.007447189,0.0032390042,0.06538901,0.0034126667,0.04772927,0.022451906,0.00029782907,0.023167463,0.02797828,0.0032669716,-0.060785875,0.037904575,-0.010345718,0.03666627,-0.0105209295,0.022957522,-0.04646172,-0.021990549,0.043142267,0.02375273,0.038556352,-0.023205888,0.03073419,-0.03513478,0.005662261,-0.007335483,-0.06639688,0.022868263,0.020046124,-0.0415821,0.026898595,0.03649734,-0.056584015,0.08583959,0.03031728,-0.011531606,0.0035609624,0.010347915,-0.009838141,0.023218611,0.047674686,0.019350633,0.05886141,-0.033885926,0.021058517,-0.021432072,-0.04366895,0.03314221,-0.00092660484,0.0060225422,-0.11911499,-0.030366862,0.007960908,-0.011481268,-0.038449597,-0.0027312208,-0.02879516,-0.04941575,-0.001473345,-0.054822516,0.030617721,0.011248366,-0.042967767,0.018927788,-0.026900617,-0.0012994531,-0.013375595,0.0027378465,0.043680437,0.048714723,-0.011320466,0.014596496,-0.02924913,0.0062672137,-0.07062482,0.025490407,0.027427755,0.006761025,-0.011482144,-0.04661532,-0.0015988698,0.030301915,-0.03341849,-0.029448371,0.02673209,-0.0066942465,-0.002113434,-0.04491483,0.033672277,0.010541022,-0.017414961,-0.044772454,0.03025026,-0.046071295,-0.024566943,-0.051846508,-0.0013166992,-0.061386652,-0.01496495,-0.04657394,0.0019435516,0.027972277,0.044312567,0.0087283505,0.030506998,0.050849345,0.009581638,0.032826275,0.01768518,-0.000651876,-0.014142255,-0.053773098,0.013917633,0.025960492,-0.055216815,-0.013861424,-0.0053442903,0.11536339,0.008407014,-0.040115986,0.0630385,-0.021572016,-0.0041869706,-0.020224111,0.038344793,0.06342069,-0.06962334,-0.0012929658,0.060143597,0.0062903333,0.022575326,-0.033203036,0.018342102,0.0070990846,-0.0956704,0.029447315,-0.017619777,0.022493996,-0.028690143,0.050200693,0.028943906,-0.037853926,0.032145526,0.028787589,0.05564198,-0.029126426,0.03125416,-0.041882817,-0.036700975,0.09562318,-0.002016216,-0.016968193,0.050013576,0.026051674,-0.010530317,0.06559939,-0.06511748,-0.01396126,-0.059580106,-0.03974234,0.034896716,0.045523506,-0.04668789,0.014676005,0.0012414905,-0.054989874,0.028727591,0.027877154,-0.011839955,-0.024122959,-0.01310584,-0.032778863,0.008141528,0.0014323796,0.010923931,0.02880582,0.039178018,-0.082707524,-0.031238375,-0.018357802,0.013974638,0.08231545,0.031208333,-0.06236379,-0.008771111,0.030356579,-0.032390773,0.029856658,-0.077313885,-0.002819007,0.024953006,0.041916583,0.05932461,0.035054736,0.017671373,-0.027345687,0.027827643,0.00010637856,-0.053892493,0.02407114,0.008607784,0.021308243,0.0076507335,0.011325247,0.020726664,0.030793387,-0.013546285,0.02133194,-0.00936579,0.039122626,-0.042374272,0.034576442,0.028883072,0.022851914,0.06360531,0.034453467,0.022168191,-0.011759439,0.021733185,0.014464556,-0.017666843,0.034988206,-0.007278778,0.028867166,-0.01140581,0.020420885,-0.036791436,0.012601426,0.04604868,0.022900768,0.010312851,-0.06803015,0.044654597,0.022817878,0.0148749575,0.010877232,-0.074947804,-0.0036922442,-0.010829616,-0.026393132,-0.023459362,-0.019764187,0.0032448235,0.023259584,0.026538718,0.012707571,-0.048978064,0.055702005,0.013181123,-0.010847191,0.030575909,-0.014422665,-0.029683301,0.024021868,-0.018065555,-0.0048555764,0.0055192695,-0.060124982,-0.007443209,-0.035736445,-0.008318406,-0.018288678,0.006470772,-0.00066537526,-0.01577864,0.030793218,-0.02942806,0.08184484,-0.01359618,0.019702803,-0.114959694,0.040807787,0.050315756,0.0038548105,-0.0025145046,-0.0087694,-0.0700521,0.03615846,-0.041211884,0.019619443,-0.021775655,-0.052406155,-0.023113742,-0.003799123,0.018925564,-0.0077715195,0.047421586,0.016351642,0.025165165,0.005334855,-0.031669583,0.021236025,-0.026596775,0.0006700165,0.028611982,0.027861474,0.035974372,-0.10643982,0.06306213,0.04323375,-0.019098066,-0.017311862,0.029427035,0.03158856,0.004435131,0.0013256157,0.050599784,0.0013404788,-0.05972494,0.047406152,0.027735844,-0.02324581,-0.0425295,-0.058498535,0.0064369994,-0.0149766235,0.012492608,-0.046297096,0.049256228,0.034869213,-0.02462407,0.11487022,-0.011491784,-0.03315619,-0.023156993,0.012574319,-0.0063497312,-0.046612907,0.03487158,0.017448075,-0.01035034,-0.008964087,0.04282637,-0.039841298,-0.010714159,0.030749874,-0.039861415,-0.007703069,-0.06251112,0.035402644,0.008227636,0.044571158,-0.053574424,0.062865265,-0.102919064,-0.06452465,0.014280937,-0.020258045,-0.011001149,0.04747252,-0.038584635,-0.0138705,-0.020871041,-0.00484564,-0.038390078,-0.0015944367,-0.0083597265,0.011647652,-0.033973694,-0.0036009846,-0.051738687,0.053608768,-0.005681633,-0.008528605,0.040266905,-0.04066002,0.06179036,0.0024573067,0.014853713,0.041733768,-0.011078716,0.006402605,-0.02712682,-0.0039128563,0.05172131,-0.013799667,0.025409603,0.0050787963,-0.0023948152,-0.03501307,0.077010885,-0.053763233,0.038042046,0.04418208,-0.0033490064,0.056212712,0.022434399,-0.008470416,-0.022641553,0.012201364,-0.06799137,-0.07008172,-0.024474602,0.007285827,0.055468965,0.035719447,0.021642953,0.024594095,0.04727714,-0.201669,0.0344077,-0.027320558,-0.017310347,0.00061700103,0.0069079753,0.024558755,-0.03243596,-0.0044980072,0.012506465,0.0083714565,-0.045139633,0.018066088,-0.0082037365,-0.047193803,0.030486755,-0.008934183,-0.021339197,0.027176658,-0.0035241214,0.019426186,0.028658321,-0.03844471,-0.025403459,-0.03840985,-0.015445659,-0.018744035,-0.016440611,0.009795605,0.02439702,0.012942391,0.02589281,0.009098498,0.030348547,-0.019671539,-0.009044047,-0.017080119,-0.007724494,-0.032300808,0.06518012,-0.016977882,0.0073602684,-0.02240865,0.009520488,-0.013070021,0.06316829,0.024339253,0.010715108,-0.024951018,0.02787561,0.031556536,0.0057053803,-0.10857011,-0.009904492,-0.012483631,0.035379663,0.026321324,0.023050064,0.045005463,-0.004452363,0.047080506,0.056581575,-0.020595646,0.0056444355,0.006144849,-0.0010443066,0.051171474,-0.039259642,-0.02283745,-0.008961211,0.029933373,-0.029062936,-0.031473305,0.006872413,0.034397848,-0.03930569,0.010907555,-0.037577227,-0.056914423,0.011594508,-0.027550073,-0.024988895,0.005791544,0.028269935,-0.031957027,-0.0095009925,-0.04509314,-0.006311556,0.038793746,0.0055029592,-0.010123766,-0.033310313,0.0038793923,0.012991889,0.031234398,-0.02412357,-0.04744343,0.022046104,-0.03659012,-0.030727854,0.0030380744,-0.014974011,-0.030415239,0.028788475,0.069437206,-0.056610353,-0.11247248,0.014376012,-0.008143146,-0.061531845,0.054421764,0.06585267,0.079187475,-0.015335413,0.030480314,-0.0022233785,0.020486044,-0.034040537,-0.053606495,-0.046277,-0.0072395075,-0.0006364961,4.9114195e-05,-0.0027569549,0.032913703,0.027067535,-0.037127666,0.04111438,0.01410543,0.05021133,0.0015633113,-0.04395755,0.055120986,-0.017222008,-0.04403807,0.030260857,0.028223043,-0.025845945,0.024283383,0.027353212,0.050232083,-0.07622297,-0.03678708,0.034990296,0.00908926,-0.0028688647,0.020948993,-0.025495945,-0.0046979343,-0.051590614,0.0023231027,-0.089937404,-0.018186728,-0.020975653,-0.008142074,0.0034487285,0.019641306,0.020274544,-0.012298899,-0.0036177558,-0.007308566,-0.027054615,-0.0006744486,0.042745836,0.004885829,0.019560264,-0.044255085,-0.014479926,0.008819244,0.026454553,-0.025493795,0.033528186,0.029271001,0.024513924,0.0353603,-0.02715122,0.07205804,-0.041072614,-0.01881965,0.04269452]
2	customer_customer_demo	Table:customer_customer_demo\nDescription: เป็น junction table เชื่อมลูกค้ากับประเภทลูกค้า (demographic type)\nColumns:\n  customer_id      VARCHAR(5) REFERENCES customers(customer_id),                        -- FK → customers\n  customer_type_id VARCHAR(5) REFERENCES customer_demographics(customer_type_id),       -- FK → customer_demographics\n  PRIMARY KEY (customer_id, customer_type_id) -- junction table: ลูกค้า 1 คนมีได้หลาย demographic type	[0.02272084,0.04979298,-0.016616525,0.028331662,0.018632086,-0.021887792,-0.026403522,-0.03729891,0.031743474,-0.010649672,0.016665252,0.009982073,0.120453484,0.03714666,-0.025008965,-0.019658422,-0.0097171245,-0.0061391224,0.040751357,-0.013736617,0.05296639,-0.036427546,0.02014672,0.006989748,0.026644783,-0.020772576,-0.024051184,0.004497787,-0.03603582,0.049529627,0.042275935,-0.037577007,-0.007679013,0.043797962,0.013157886,0.032365527,0.008006989,-0.0074645677,0.010086498,-0.006998969,0.0019898769,0.0065328516,0.037881125,-0.057505243,0.043070294,-0.019433932,0.040486474,0.00024950286,-0.019336188,0.0077395313,0.039461065,-0.00071431434,0.06697349,0.01600699,-0.036600552,-0.03231208,0.04958975,0.061786156,-0.03269203,0.030208027,0.010472717,0.058846932,-0.019763945,0.031558644,0.030296117,-0.042843368,-0.004907848,-0.013912567,-0.039502572,-0.010962896,0.011678818,0.008636013,0.10702237,-0.010535114,-0.003469625,-0.0007619903,-0.026665336,0.0063544856,-0.0040931134,0.00032795977,0.04103885,0.03778018,0.007519486,0.026621645,0.027296398,-0.004166106,-0.014368347,0.05224973,0.029911725,0.03946852,0.04432824,-0.03348669,-0.030039683,0.06090775,0.007143803,0.020302135,0.027715985,-0.0036279005,0.029040584,-0.05024334,-0.022162843,-0.06888756,-0.0286651,-0.043183476,-0.081843756,-0.026640672,-0.011375858,-0.057985842,0.053073436,-0.050821178,-0.018104218,0.020881904,0.027628146,-0.042078257,0.038614225,-0.014192989,0.045728948,-0.050321557,0.0067919507,-0.07407973,-0.024604741,0.004563724,-0.0051212274,-0.00798249,0.043108508,-0.036272515,0.0093692085,7.8344645e-05,0.04938991,-0.02257651,-0.0161653,-0.06607709,0.020546196,0.011398856,-0.013004713,0.029341325,0.019335965,0.018540543,-0.048609864,0.01383211,0.068385474,-0.05952032,-0.000756054,0.05990972,0.010282058,-0.07240432,-0.011421756,0.014403615,-0.02301216,0.014849254,0.020786237,-0.055641834,-0.017594017,-0.045394704,0.014642023,0.006438269,-0.048362546,-0.00070059195,-0.015097078,0.0149166975,0.014175013,0.002122899,0.018750517,-0.008289923,0.030570883,0.030755222,-0.01211548,0.013131551,-0.011325814,-0.009601349,0.013150317,-0.05927348,-0.05672331,0.027860679,0.0052318205,-0.009741188,-0.03346146,-0.011212323,-0.037233647,-0.075322576,-0.061195936,-0.011666121,-0.013520741,0.02424444,0.0025509004,-0.01976013,-0.028443297,-0.004468388,0.028396562,-0.01122004,-0.020521184,0.07296242,0.036960937,0.035421822,0.030718893,0.01528348,-0.0047247284,0.0047496557,0.024901522,-0.071676806,0.01054354,0.018128168,0.04886766,0.010213979,0.015195934,-0.06102074,-0.0015482787,0.05460059,0.025934337,0.0076559614,-0.01775074,0.018154688,-0.036420368,0.012807859,-0.017139597,-0.06714137,-0.0062897136,0.034872737,-0.035869095,0.030161398,-0.0032373318,-0.009863188,0.06961634,0.024031194,-0.005263483,0.021467168,0.0069451095,-0.022592109,0.04574796,0.02252829,0.056414854,0.06579017,-0.03143469,0.008896302,-0.005798014,-0.025973598,0.032393698,-0.014976673,8.353711e-05,-0.09459674,-0.009497272,-0.010810708,-0.002474965,-0.026828086,0.020107448,-0.0314535,-0.031640362,0.021512298,-0.054655667,-0.0011162988,0.014431865,-0.050709475,0.039075542,-0.034796234,-0.0019697335,0.0063741235,-0.022175876,0.005408282,0.017633433,0.0058777393,0.0136539955,-0.026832175,-0.00062936236,-0.060791194,0.046625134,0.004820524,0.0353591,-0.016099727,-0.043857798,-0.002883589,-0.0015523386,-0.00916509,-0.05593269,0.0060400106,0.022752417,-0.0067003677,-0.052914098,0.009838887,-0.008570175,-0.030356769,-0.043688733,0.023077406,-0.047163967,-0.008205119,-0.046142615,0.027870463,-0.06704477,-0.031859722,-0.056634568,0.027563717,0.03583898,0.09051484,-0.015285887,0.0038191227,0.06224786,0.013618233,0.019079026,0.011312416,-0.016547482,-0.017818943,-0.020425482,-0.006311181,0.018956194,-0.05448554,0.022708297,0.018749319,0.116935074,-0.009198488,-0.05227604,0.042111576,-0.021513365,-0.013461743,-0.02127828,0.028383046,0.010282551,-0.050416313,0.018510243,0.098056704,-0.0011063969,0.024622088,-0.044667065,0.00904985,-0.028742706,-0.07474757,0.026188506,-0.041166544,0.026020272,-0.03283267,0.04498109,0.023126647,-0.025141804,0.001968173,0.025232948,0.051942315,-0.037490614,0.031029936,-0.062411275,-0.046429384,0.08229875,0.0063232514,-0.029722009,0.03990872,0.032541685,-0.021057205,0.04711121,-0.07613639,-0.0063168886,-0.0838536,-0.015975913,0.009356308,0.035126142,-0.064868264,0.005693856,0.00040627783,-0.040024154,0.019601887,0.058223687,-0.0029548092,-0.030225784,0.0013459877,-0.013454263,0.027483447,-0.0049078516,-0.0073196623,0.025029775,0.01911362,-0.063979134,-0.03942807,0.015239309,0.034167178,0.12187132,0.01521436,-0.043361723,-0.018771501,0.03303367,-0.020601073,0.023913106,-0.088516414,0.021101309,0.03143498,0.021870775,0.038969107,0.029249841,0.021183651,-0.019489428,0.016825482,0.020862017,-0.03568134,0.035818834,-0.010872744,0.049670048,0.01098429,-0.016231032,0.043863736,0.041859783,-0.025640944,0.009125285,0.014218874,-0.006399966,-0.05181858,0.0465241,0.016619831,0.013852779,0.070748255,0.043446254,0.035232354,0.00031482519,0.029932152,0.014836526,-0.022919076,0.05107289,-0.04487354,0.03927459,0.019412877,0.009230746,-0.018352615,0.008399349,0.016553756,0.032810386,0.016197208,-0.04818924,0.022171998,0.009476772,-0.00050080445,0.01902171,-0.07962584,0.0019503182,-0.02261014,-0.012245814,-0.004858433,-0.0031065077,-0.00012179659,0.008976359,0.0026406292,-0.0058302633,-0.061095692,0.01436459,-0.0003367585,-0.018562244,0.05469396,0.017413825,-0.01991587,0.03437962,-0.029524691,-0.008321508,-0.045387488,-0.029018106,0.006192639,-0.0312479,-0.02342668,0.01698877,0.0020013407,0.002917128,-0.018851401,0.029979061,-0.058020208,0.022712607,-0.016993564,0.016144257,-0.11565219,0.017559336,0.044630993,-0.01103437,-0.022177616,-0.02075722,-0.077111214,0.012549275,-0.03723242,0.031787124,-0.007137831,-0.06275635,-0.0062819305,0.0056203017,0.050131474,-0.0071979864,0.044421997,-0.01045963,0.019135764,0.034696173,0.00032531173,0.011877837,-0.0029929716,-0.035843562,-0.001326835,0.030141838,0.024475895,-0.08075214,0.04956081,0.03740656,-0.031620577,-0.0468562,0.015576379,0.023876194,-0.009409266,-0.00035926155,0.036844626,-0.0024312674,-0.03670671,0.03397331,0.022123646,-0.025191152,-0.040351782,-0.035154924,0.0099514,-0.017659536,0.022558965,-0.04096019,0.058153123,0.029202849,-0.04497682,0.117534176,-0.0046265684,-0.036666457,-0.015353567,0.020448985,0.011827042,-0.033200674,0.047675196,-0.006849944,0.0041318573,-0.026815884,0.02943253,-0.06407319,-0.014228784,0.026257422,-0.06411053,-0.006734498,-0.063964695,0.028496182,-0.06071769,0.028000263,-0.061889682,0.04938385,-0.07945594,-0.04294065,0.03453048,-0.010787707,-0.03296353,0.059612337,-0.036767498,-0.010227295,-0.02948392,0.047801297,-0.018483518,0.004938574,-0.037996728,-0.0031963012,-0.04349764,0.017422728,-0.005416532,0.05562341,0.010590952,-0.030408425,0.043772686,-0.049773756,0.02763951,0.005169294,0.013905435,-0.013517503,-0.035227664,0.035634983,-0.043175668,0.0051294435,0.04408289,0.005679799,-0.0027608536,0.031176254,0.0016326644,-0.0196277,0.074398406,-0.050110575,0.039225973,0.025651107,-0.034267984,0.071987025,0.045065474,-0.0039189924,0.0022138553,0.023156367,-0.052880753,-0.07354609,-0.048107587,-0.005998685,0.030266726,0.03695808,-0.009226931,0.03760041,0.018939875,-0.19456069,0.0023958604,-0.014580098,-0.048304144,-0.0023870883,0.0041927504,0.016837038,-0.019172825,-0.008838531,0.018222038,0.039781656,-0.035631977,0.018847503,-0.019276014,-0.067662045,0.01584556,-0.0016166545,-0.013369956,0.008059826,0.020495195,0.0005139176,0.051687784,-0.013953151,0.004835314,-0.03733362,-0.018193362,-0.019899713,0.020054203,0.020129949,0.0031094549,0.028067643,-0.010900007,0.000726193,0.0086959945,-0.017950103,-0.013341337,0.009134159,-0.0013081434,-0.06300416,0.050904743,-0.008406216,-0.035847567,-0.050854687,0.023740815,0.018437246,0.056581706,0.023415538,0.0016640152,-0.03585392,0.002533021,0.029958233,0.006354257,-0.10631101,0.029345933,-0.02499643,0.08239809,0.045206178,0.029729482,0.07799442,0.0029928226,0.028240921,0.052964125,-0.05554605,0.016112935,-0.016100755,0.0026204565,0.06787419,-0.059728533,-0.04299242,-0.007177217,0.055231184,-0.029502759,-0.019943265,0.030463355,0.04402023,-0.029100595,0.01015997,-0.015948296,-0.036758214,0.0006764579,-0.024267463,-0.0083781965,-0.0070608812,0.04015899,-0.051044278,-0.043253142,-0.027445361,0.022326577,0.040723883,0.0037908165,-0.009984338,-0.048094884,-0.005586105,-0.021757592,-0.00969494,-0.015011954,-0.032300927,0.042932566,-0.011757517,-0.009864946,0.007832171,-0.002938525,-0.005289934,-0.019529114,0.04824219,-0.037555546,-0.12560332,-0.0043473346,-0.016519336,-0.07734866,0.061032236,0.028447371,0.060296826,-0.024981946,0.04163318,0.018686296,0.0012285108,-0.0075861765,-0.03118589,-0.04173924,-0.034959055,0.0065080277,0.0034391303,-0.01242627,0.007853152,0.017711543,-0.054113157,0.051337015,0.021517321,0.0382062,-0.005185518,-0.049782764,0.032688547,-0.03731324,-0.014482095,0.028879154,0.02353479,-0.011087361,0.036005046,0.015980562,0.053946886,-0.061901875,-0.02467826,0.026988726,-0.02653314,-0.0042302855,-0.016253954,0.010291258,0.00576174,-0.020630648,-0.011288934,-0.07819137,0.009834497,-0.014485575,-0.020190703,0.034800816,0.018143728,0.03690833,-0.012762296,0.019376235,0.0068070395,-0.021854866,-0.013287167,0.03746413,0.015119514,0.047945864,-0.031810794,-0.032587953,-0.0016337668,0.017458064,-0.03921678,0.04509647,0.04983337,0.022941997,0.018166205,-0.02506281,0.069480054,-0.034897096,-0.0069985604,0.054233477]
3	customer_demographics	Table:customer_demographics\nDescription:ประเภทลูกค้า (customer demographic type)\nColumns:\n  customer_type_id VARCHAR(5) PRIMARY KEY, -- รหัสประเภทลูกค้า\n  customer_desc    TEXT                    -- คำอธิบายประเภทลูกค้า	[0.016879711,0.03390828,-0.025081478,0.015053576,0.01514282,-0.015158884,-0.026795052,-0.040342797,0.035520036,0.012241523,0.03191135,0.005047877,0.1074916,0.063337855,-0.029018052,-0.02410141,-0.010875225,-0.010130264,0.037681643,0.0109095955,0.041615967,-0.033441473,0.016082492,-0.008356515,0.02924847,-0.020736327,-0.0056294543,-0.003195638,-0.031819705,0.056801043,0.042429544,-0.02675216,-0.00708155,0.053543802,0.0062919757,0.018934662,-0.011525091,-0.005166642,-0.00053855556,-0.030840851,-0.008398153,0.024394162,0.043137632,-0.053117827,0.028210677,-0.022259872,0.04072028,0.006938817,-0.011920342,0.0042995363,0.043721486,0.005438118,0.04718264,0.021487527,-0.045247603,-0.04330766,0.03721316,0.065303765,-0.035265956,0.029190306,-0.012965229,0.069216065,-0.0031272378,0.027414639,0.035022274,-0.0367585,-0.0038134535,-0.010651831,-0.030081768,-0.013514108,0.011208961,-0.01058414,0.08733063,-0.020826628,-0.002697844,-0.0060249288,-0.030233536,0.012783384,-0.0069673816,0.008549842,0.051561896,0.032231644,0.0017467967,0.02462201,0.017143147,-0.006762871,-0.028249277,0.04312329,0.020011868,0.047545124,0.036980443,-0.030767947,-0.039209742,0.058365963,0.0049063074,0.020952638,0.023693535,0.00780941,0.01680243,-0.044206727,-0.020090308,-0.09103212,-0.026027812,-0.036737807,-0.0809071,-0.021558542,-0.031682175,-0.057069905,0.052767448,-0.03765456,-0.020165544,0.034379765,0.019849757,-0.03464392,0.034010682,-0.020580232,0.05312203,-0.05843283,0.0065735956,-0.05169188,-0.011875088,0.008730691,-0.013619002,-0.0073141037,0.04736018,-0.040466543,0.013389272,-0.016023487,0.04526419,-0.036885176,-0.024008095,-0.04887888,0.0064316182,0.00494004,0.0002054204,0.031104429,0.023861604,0.019045252,-0.034261968,0.023675442,0.03975528,-0.06830704,-0.00016051937,0.04197054,0.031368222,-0.07232145,0.0074472544,0.01610729,-0.028570868,-0.0012455396,0.019780783,-0.03917927,-0.01680334,-0.025790278,0.011585272,0.01348923,-0.044888496,0.011953196,0.019885499,-0.003067978,0.016599797,-0.0012387135,0.0077357264,-0.019926812,0.027023088,0.0064595817,-0.019421086,-0.008410861,-0.031370632,-0.031167088,0.008104071,-0.040404346,-0.061179824,0.042826768,-0.0032860325,-0.014018175,-0.021340773,-0.0022212944,-0.025218345,-0.0779522,-0.056717444,-0.010657909,-0.023495818,0.026476206,0.00022849803,-0.035379376,-0.033217147,-0.011145435,0.0359512,-0.010842878,-0.03113022,0.076579526,0.028551618,0.039461043,0.031111108,0.0021184403,0.008975286,0.008382551,0.01012143,-0.080627754,0.018837996,0.0023806049,0.046162378,0.014472184,0.01993187,-0.062794395,-0.02527788,0.060664576,0.014002893,0.026872898,-0.026201943,0.023637794,-0.02777556,0.018899893,-0.017729107,-0.068175994,0.0142534245,0.017386291,-0.038185272,0.037841957,0.0047316914,-0.02591655,0.07271833,0.032972924,-0.0009239665,0.030358324,0.0066416687,-0.028747382,0.050093573,0.049262263,0.04124574,0.044700623,-0.020814281,0.011057687,0.005150793,-0.035653643,0.03581297,-0.020910427,0.0077174767,-0.12356439,-0.010721554,0.011102993,-0.0006959965,-0.045361277,0.0048483294,-0.026161766,-0.044702508,0.028887624,-0.06493414,0.009058317,0.012354657,-0.052260473,0.029621037,0.0015919346,0.00074774196,0.00834429,-0.012740157,0.025827566,0.020444933,-0.0055169594,0.032003377,-0.028949374,0.009788237,-0.074612625,0.026455821,0.02299068,0.029731588,-0.020403927,-0.05817845,0.00052110525,-0.001386438,-0.004341561,-0.050881043,0.022620482,0.009779314,-0.004260486,-0.059054594,0.03308881,-0.009870155,-0.04316052,-0.036444638,0.024654645,-0.057749353,0.01612195,-0.05594184,0.015327179,-0.057011656,-0.019576035,-0.053311445,0.0048676026,0.035957888,0.09429289,0.0068730363,0.024184262,0.054767728,0.020673888,0.015664782,0.017493365,-0.012582428,-0.013951507,-0.03282841,0.018843975,-0.00553039,-0.052824147,-0.00939821,0.026301239,0.1043983,-0.006131156,-0.03500246,0.05264253,-0.026188577,-0.003721758,-0.02527548,0.03820515,0.031723008,-0.081939936,0.025508089,0.10147172,0.008291848,0.008335145,-0.01444724,0.028859295,-0.01934806,-0.066707134,0.030411258,-0.014536166,0.02245973,-0.032581396,0.03320435,0.025779245,-0.032614715,0.015736988,0.011803132,0.05662251,-0.014764102,-0.0029309217,-0.048893895,-0.03848641,0.090189345,0.0054301233,-0.026066497,0.046711102,0.027649086,-0.013390517,0.044987496,-0.06702608,-0.012223268,-0.07784992,-0.010890947,0.026983187,0.04980598,-0.052517816,0.0044182516,-0.0032569745,-0.04443876,0.010881193,0.037271403,-0.01561176,-0.026104342,-0.024623299,-0.033535212,0.030003402,0.0025254749,-0.009564175,0.031963013,0.030946001,-0.06369139,-0.027228719,0.021689372,0.01770979,0.094704226,0.009551755,-0.045016073,-0.018598022,0.04367954,-0.01374243,0.036019232,-0.07130274,0.011368603,0.028971445,0.02345017,0.040897682,0.0065153884,0.010296127,-0.0065824697,0.012920764,0.036841657,-0.04023041,0.051299967,-0.017168922,0.035679005,0.011694801,-0.0067511243,0.038552135,0.03820801,0.00063625246,0.016176658,0.0026666704,0.014504178,-0.031931017,0.042332344,0.021327315,0.026882915,0.06279409,0.05268978,0.032717265,-0.0014675505,0.03180008,0.013458457,-0.03198331,0.028418621,-0.037956383,0.027132843,-0.004237482,0.023642,-0.02176591,0.020284288,0.037259575,0.035999324,0.006747776,-0.04403405,0.033033665,0.003678931,0.0062955352,0.0064645275,-0.07263244,-0.009126156,-0.010314864,-0.0071426705,-0.016937762,-0.008394203,-0.009552296,-0.010338779,-0.010273062,-0.016154971,-0.055463385,0.027789438,0.0053614783,-0.014798919,0.053713933,0.0036564777,-0.033424657,0.014462199,-0.014325855,0.0012839523,-0.020805344,-0.036033913,-0.008636354,-0.014671025,-0.028967155,0.015258592,-0.007039673,-0.0039036358,-0.02859427,0.04579048,-0.04487499,0.0360698,-0.024805775,0.0023433492,-0.121951915,0.012560482,0.034217913,-0.0053934194,-0.01493245,-0.028624564,-0.067166865,0.020670025,-0.031725176,0.021783758,-0.0026048822,-0.07282301,-0.022569953,0.021503666,0.036386855,-0.016353404,0.027156103,0.0021062805,0.013816899,0.020256573,-0.009818289,0.014755601,-0.016023656,-0.023169655,0.016120581,0.025612561,0.019432027,-0.09418502,0.04404866,0.04948416,-0.020574367,-0.026885418,0.03205444,0.032036673,-0.0036711523,-0.0016524609,0.051896643,4.5328885e-05,-0.053857204,0.020633008,0.01937522,-0.022929521,-0.024801932,-0.04594584,0.007091434,-0.029513905,0.034451272,-0.052363902,0.055828802,0.02012994,-0.036495026,0.118905716,-0.005964039,-0.039825946,-0.021527003,-0.0005744251,0.018544367,-0.04501046,0.048482683,-0.004593056,0.008172866,-0.025088564,0.032090604,-0.047734313,-0.00442329,0.046161775,-0.04389057,0.014009899,-0.06280832,0.036628462,-0.06263049,0.05359395,-0.062090985,0.061077,-0.09297823,-0.039841305,0.032737475,-0.017477889,-0.026766758,0.062466,-0.015305101,-0.0047829305,-0.01813322,0.036557317,-0.008069196,-0.007554637,-0.027197083,0.0059362953,-0.0354533,0.0001049119,-0.024466652,0.055656746,-0.004944213,-0.015602666,0.054947395,-0.052814152,0.04003457,0.0055389586,0.023009386,-0.011684688,-0.034993086,0.033769038,-0.031021139,-0.0015078192,0.05673471,0.001625574,0.009427661,0.01837964,-0.001065328,-0.018167732,0.07286277,-0.048618022,0.041843057,0.032956187,-0.011898025,0.07365564,0.0437435,-0.019034335,-0.008820467,0.03068486,-0.060582146,-0.05956796,-0.045320116,0.0022580044,0.027602948,0.045752432,-0.0021343224,0.020308854,0.02552235,-0.20292488,0.016702628,-0.033761702,-0.024533678,-0.003660866,0.001177179,0.009294949,-0.026400782,-0.0034567458,0.02519374,0.038538087,-0.05057322,0.033178836,-0.00882624,-0.052727744,0.024666822,-0.009576806,0.003219085,0.013195803,0.0020972814,0.026211133,0.03304064,-0.027133204,0.00835993,-0.04141105,-0.010983437,-0.023908323,0.008763978,0.016766582,0.018712454,-0.003508035,0.0062605706,-0.0008836734,0.017303906,-0.02729183,-0.018367141,-0.011589617,-0.009633114,-0.027321123,0.07220964,0.000296213,-0.021792922,-0.033149894,0.024801042,0.025489077,0.04063557,0.006518183,-0.0070576365,-0.044668525,0.024328655,0.027819822,0.0071515413,-0.12183416,0.009105375,-0.028881911,0.057236098,0.05825993,0.035918664,0.07545846,-0.0108587025,0.036416944,0.05597419,-0.037850644,0.018119069,-0.005781877,-0.0008386977,0.05386295,-0.047463216,-0.030427571,0.0024031594,0.059995845,-0.028055716,-0.040296756,0.02834676,0.036219273,-0.04413365,0.0156238,-0.022043448,-0.03657462,0.012167725,-0.01065544,-0.023611303,-0.016637232,0.03263717,-0.038815524,-0.03917721,-0.036390927,0.027246052,0.035498098,0.012218671,-0.02366066,-0.046341125,0.024367826,-0.0030157177,0.014827116,-0.027820121,-0.048516676,0.035820175,-0.028986404,-0.026820034,-0.0039248895,-0.022905264,-0.01508868,0.005649119,0.06474382,-0.046146274,-0.12351945,-0.0036660475,-0.011424125,-0.0707823,0.050763343,0.04930535,0.07654435,-0.022832585,0.032489188,0.013503535,0.018498218,-0.0285466,-0.042994846,-0.056341402,-0.030361516,-0.016097473,0.022626858,-0.019340713,0.022929585,0.020905131,-0.045515146,0.030649204,0.040073853,0.035185654,0.004288364,-0.04831288,0.047758672,-0.045575187,-0.030116942,0.048352383,0.017844087,-0.009742106,0.025714938,0.012323039,0.069165476,-0.0830009,-0.035248388,0.026023483,-0.0030140074,0.013216888,-0.015318091,-0.011537287,-0.004884361,-0.038242694,0.002304231,-0.06450527,-0.0252137,-0.017302029,-0.02956305,0.005420164,0.025698578,0.012476324,-0.012643941,0.021046545,-0.008315299,-0.018601872,-0.011863429,0.032152276,0.009958126,0.036552478,-0.047714636,-0.03990659,-0.004050726,0.022885531,-0.039384224,0.041147206,0.044285566,0.028172174,0.03105697,-0.029807111,0.07983649,-0.043657035,-0.012807083,0.05603736]
4	customers	Table:customers\nDescription:ข้อมูลลูกค้า (customer) ที่สั่งซื้อสินค้า\ncloumn:\n  customer_id   VARCHAR(5) PRIMARY KEY, -- รหัสลูกค้า (5 ตัวอักษร เช่น ALFKI)\n  company_name  VARCHAR(40) NOT NULL,   -- ชื่อบริษัทลูกค้า\n  contact_name  VARCHAR(30),            -- ชื่อผู้ติดต่อ\n  contact_title VARCHAR(30),            -- ตำแหน่งผู้ติดต่อ\n  address       VARCHAR(60),            -- ที่อยู่ลูกค้า\n  city          VARCHAR(15),            -- เมืองที่ตั้ง\n  region        VARCHAR(15),            -- ภูมิภาคที่ตั้ง (ที่อยู่จริง ไม่ใช่ work region)\n  postal_code   VARCHAR(10),            -- รหัสไปรษณีย์\n  country       VARCHAR(15),            -- ประเทศของลูกค้า\n  phone         VARCHAR(24),            -- เบอร์โทรศัพท์\n  fax           VARCHAR(24)             -- เบอร์แฟกซ์	[0.016652487,0.020418944,-0.03869057,0.0025278877,0.013659711,-0.045027506,-0.033398196,-0.02605291,0.033353962,0.041460037,0.02294734,-0.0056350795,0.10847922,0.05063881,-0.025199218,-0.0242187,0.010164088,-0.035485435,0.019996643,-0.0057585435,0.05042097,-0.025312973,0.042773545,-0.021560214,0.023801778,-0.017351996,-0.0124235945,0.019631846,-0.029046576,0.072427005,0.03314414,-0.021438058,-0.013649402,0.039602596,0.012276491,0.032445543,-0.00022845692,-0.015924742,-0.0053015864,-0.012571995,0.006797902,0.012307724,0.017755756,-0.034654982,0.030883491,-0.028308915,0.03726578,0.012449511,-0.025408952,0.022583012,0.017430944,0.02149468,0.043275606,0.013048212,-0.037033245,-0.032031834,0.044777628,0.057478145,-0.045957062,0.03342711,0.006025257,0.04321518,-0.00063142565,0.037749585,0.0067425035,-0.02496748,0.015172085,-0.019293206,-0.03265614,-0.028413627,-0.013531824,0.003314102,0.09467135,0.0018934145,-0.023021279,-0.015928442,-0.04716779,0.009138742,-0.017996902,0.0087532075,0.047122497,0.04689374,0.017908769,0.010551268,0.001825836,-0.018215053,-0.010180472,0.043844182,0.034033414,0.044282738,0.018872485,-0.019112771,-0.06070444,0.045528498,0.0041194907,0.006788139,0.035579316,9.516175e-05,0.036683366,-0.042275835,-0.010852429,-0.10121018,-0.016487945,-0.025157116,-0.09156658,-0.012790933,-0.026843937,-0.055889834,0.042232513,-0.055086326,-0.03682732,0.03147856,0.042908072,-0.033779126,0.020696027,-0.02263847,0.0418791,-0.05317101,-0.0022585555,-0.065232836,-0.012931359,-0.0060542566,-0.015385872,-0.035349693,0.05589694,-0.031318482,0.00058019964,-0.017742664,0.040719196,-0.05309334,-0.0070756343,-0.03458688,0.016101144,0.04337361,0.0011774051,0.05351051,0.03369644,-0.018649653,-0.016389998,-0.010141324,0.048646975,-0.06285106,-0.007262531,0.06768324,0.036188506,-0.06263864,0.001335544,0.020317161,0.0029818993,0.011485586,0.035545602,-0.057419725,-0.03104394,-0.020087475,0.017872812,0.00954874,-0.04348824,-0.005308918,0.013836097,0.019957067,0.028518543,0.014420146,0.0059768995,-0.026038757,0.046039928,-0.00390083,0.016509147,0.0074160714,-0.02486307,-0.030617267,0.0031994928,-0.044038467,-0.083216816,0.023433905,-0.015099547,0.0065315706,-0.018476328,-0.020515002,-0.021587932,-0.06559965,-0.039190773,-0.004431117,-0.03318094,0.029942341,-0.008391105,-0.027441882,-0.0152370855,-0.012647044,0.04537729,0.008327183,-0.03558586,0.072349675,0.018700656,0.048511516,0.03654009,0.0027855064,-0.0036622693,0.024368659,0.00025379536,-0.07212977,0.031284455,-0.012148051,0.026500918,0.0037640017,-0.0098514045,-0.06906253,-0.023742028,0.046770383,-0.003619957,0.04566963,-0.028978234,0.03808497,-0.030822422,0.020650536,-0.015017381,-0.055505943,0.022958515,0.019244598,-0.026519708,0.04631533,0.010448681,-0.0206041,0.05162377,0.026162002,0.004174486,0.024340687,0.021262227,-0.02654053,0.031196019,0.045290437,0.018668363,0.07650495,-0.008735524,0.027256051,-0.008807285,-0.021074118,0.048457596,-0.01672371,-0.0020169164,-0.09156623,-0.022401026,-0.010083272,0.008498406,-0.046252716,0.010444668,-0.041931264,-0.067282826,0.02736901,-0.08082436,0.034388192,0.034378592,-0.0542845,0.03058838,-0.017089646,0.007992812,0.0052419277,-0.03655951,-0.0091456985,0.03142951,-0.008724898,0.014985415,-0.03505906,0.008778716,-0.03912505,0.005688281,0.011504312,0.018699653,-0.009114913,-0.054681502,-0.0074961083,0.00016545452,-0.035330772,-0.04887779,0.027478559,0.023416921,-0.016157378,-0.039481353,0.028664412,-0.00064097275,-0.032877296,-0.030912684,0.052347478,-0.039284185,-0.018656416,-0.047771703,0.03161628,-0.059343383,-0.009824567,-0.034500614,0.004290837,0.042782255,0.091572836,8.7694236e-05,0.009069869,0.058652025,0.019410297,0.022507649,0.017838812,-0.02202192,-0.016123654,-0.058221877,-0.0032872325,0.008922072,-0.07353834,-0.013999567,0.037791885,0.11330337,0.0064676236,-0.022419235,0.05649564,-0.006483529,-0.0026899723,-0.00408083,0.038580287,0.03171889,-0.076763436,0.022567363,0.08160702,0.015995642,0.023915673,-0.034721326,0.019121325,-0.027922736,-0.08117494,0.026257478,-0.031776283,0.033431146,-0.026890999,0.048849106,0.03306506,-0.036787026,0.023443474,0.016828502,0.037451044,-0.03460296,0.008821332,-0.039766315,-0.03766782,0.088117175,0.04674185,-0.052183606,0.016662573,0.04839942,-0.021698177,0.054115783,-0.08625531,-0.02128115,-0.06643496,-0.040235132,0.013881141,0.014124305,-0.029566841,0.043218996,0.0015763892,-0.013529509,0.019124528,0.0105320485,-0.015938554,-0.03349958,-0.007930546,-0.025257437,0.031912323,0.012680614,-0.00018367812,0.018591877,0.031415157,-0.063699216,-0.014552014,0.011485288,0.020240502,0.08782562,0.015871968,-0.030306762,0.00035434397,0.043354735,-0.023666944,0.025809338,-0.05437983,0.0019263068,0.00050508144,0.038737405,0.030451417,0.01773516,0.014216068,-0.021242265,0.0043997136,0.042439554,-0.044436064,0.03917563,-0.010047504,0.036541186,0.00824795,-0.008444688,0.019581426,0.03773667,-0.0051704305,0.0035954397,0.019626703,0.035230707,-0.028607868,0.02863162,-0.0011938767,0.03354856,0.06615927,0.046987996,0.022650892,-0.014878988,0.024985535,0.013153259,-0.001611634,0.034434523,-0.019235129,0.038201284,-0.017894235,0.020785881,-0.03505424,-0.003796712,0.0271156,0.008732628,0.0057934374,-0.04787737,0.012182734,0.025699383,0.0091795465,0.004893328,-0.09299084,-0.01437655,-0.0020484526,-0.010254251,-0.032285325,-0.012150254,-0.005873684,0.009630262,-0.0009343046,-0.007087901,-0.029283773,0.029002205,0.011444187,-0.022658126,0.05365055,-0.0092564905,-0.039077114,-0.0096197575,-0.020715475,-0.023409598,-0.009258606,-0.0065870797,0.002102725,0.0034590438,-0.0012485395,-0.009575773,-0.005535109,-0.006148044,-0.02899953,0.055146776,-0.06522039,0.045085058,-0.015840035,0.0055895117,-0.11530311,0.022062587,0.05500399,-0.009121212,-0.023537144,-0.03520457,-0.04576658,0.009648754,-0.019192616,0.045429632,-0.0013950791,-0.056323487,-0.02100194,0.009882587,0.041978057,-0.005529309,0.04255649,-0.012519402,0.023460925,0.008531436,-0.02964241,0.021634318,-0.013121533,-0.03817535,0.0038072434,0.003350757,0.02291098,-0.09533641,0.05626828,0.035606313,-0.01327165,-0.025900755,0.045530204,0.049693782,0.0010852421,-0.011264457,0.058861263,0.010664828,-0.06812844,-0.00043700894,0.04763816,-0.021879299,-0.03166182,-0.056053318,-0.0044828607,-0.028294614,0.0010588428,-0.0060851695,0.03988674,0.05765704,-0.053604532,0.11600205,-0.0046035787,-0.025915435,-0.028461419,0.043113243,0.004422645,-0.05425941,0.021586735,0.018106837,0.003189767,0.007607515,0.020555863,-0.028778156,-0.023137733,0.028851194,-0.052521855,-0.0007484491,-0.040006585,0.043607846,-0.016514177,0.03900797,-0.049635943,0.04627756,-0.099498,-0.05085386,0.038360137,-0.017964395,-0.030974591,0.052973524,-0.03568138,-0.039209988,-0.022794854,0.022755008,-0.020980485,0.020645265,-0.03206658,0.0316888,-0.05544454,0.009158774,-0.023322167,0.06791066,-0.007919075,-0.040668547,0.046917412,-0.029917076,0.031355217,0.014600261,0.032915954,-0.002309174,-0.022343019,0.032252412,-0.030250896,0.0016263394,0.06766873,0.013057478,0.03694785,0.03114272,0.005985868,-0.01590792,0.070093796,-0.050195083,0.01981646,0.04619982,-0.005411881,0.0610611,0.045943618,-0.011959429,-0.0019966732,0.015824275,-0.04585361,-0.06057804,-0.011391023,0.02289351,0.02972,0.02217042,0.0023587346,0.04219898,0.021109283,-0.22581771,0.018695647,-0.009950575,-0.042294573,-0.007694686,0.01631757,0.012825178,-0.00083428744,-0.013118962,0.049834866,0.03788601,-0.02573597,0.004714527,-0.015867928,-0.058406632,0.0060877632,0.0154091995,-0.0026944235,0.02109528,-0.009813368,-0.005272991,0.07734814,-0.049251206,-0.0056385845,-0.014593468,-0.022578143,-0.03406561,0.020348718,-0.0019263333,0.024371171,0.02000317,-0.0068438933,-0.0028226194,0.03653273,-0.027628249,-0.022577241,-0.009112256,-0.017120149,-0.058694854,0.056413263,0.004735069,-0.0200579,-0.043943726,0.021083122,0.0022224307,0.057867568,0.02214474,-0.004754233,-0.044315293,-0.016081575,0.005620983,0.009006373,-0.110981286,0.0026663928,-0.017703597,0.07459807,0.029896943,0.021928806,0.0654191,0.00056635094,0.048611846,0.08813862,-0.043750945,0.009365987,-0.0109394435,-0.007348658,0.052058026,-0.05150664,-0.024815425,-0.0019171876,0.060634535,-0.028210344,-0.034792367,0.010704442,0.040883265,-0.050514843,-0.0039447728,-0.009348015,-0.0682126,0.01648711,-0.009975187,-0.019421669,-0.0072956416,0.017463101,-0.026184533,-0.039243773,-0.051351983,0.018057305,0.039380655,0.035683833,-0.028559435,-0.032332476,2.5372143e-05,0.01749844,0.012514745,-0.031805173,-0.017088814,0.025419148,0.0066563715,-0.031227794,0.01924189,-0.023857655,-0.025059773,0.0073413076,0.04803791,-0.03373338,-0.09695259,0.022908688,-0.030429212,-0.048207097,0.05406897,0.044517048,0.06280638,-0.01939783,0.029808888,-0.007083895,0.02800102,-0.028954215,-0.036540974,-0.029632123,-0.0318699,0.020742886,0.025960581,-0.0044564293,0.019197851,0.006244499,-0.056328766,0.04686391,0.015359716,0.035961315,-0.012691808,-0.07172991,0.04386358,-0.018429272,0.0046034814,0.035251066,0.0147490185,-0.011195394,0.0063511925,0.025066597,0.074489735,-0.0815056,-0.062043186,0.016200557,-0.017600812,0.0067565376,0.020054286,-0.004471514,0.01412162,-0.04456425,0.004755074,-0.07844948,-0.020537613,-0.016304852,-0.029804664,0.0018082449,0.01383044,0.024196375,-0.018928591,0.00091881177,0.00827154,-0.01586637,-0.0038289162,0.01883549,-0.0012135123,-0.014223039,-0.046933092,-0.037637725,0.0048301877,0.01899562,-0.019938672,0.045423854,0.033827882,0.021643134,0.009691819,-0.027472869,0.07623445,-0.024745915,-5.355747e-05,0.037056185]
5	employee_territories	Table:employee_territories\nDescription: เป็น junction table เชื่อม work region ที่พนักงานรับผิดชอบ ใช้ตารางนี้เมื่อถามเกี่ยวกับ region ที่พนักงานทำงาน/รับผิดชอบ\nColumns:\n  employee_id  SMALLINT    REFERENCES employees(employee_id),    -- FK → employees\n  territory_id VARCHAR(20) REFERENCES territories(territory_id), -- FK → territories → region\n  PRIMARY KEY (employee_id, territory_id)	[0.020176891,0.041907076,-0.029368907,0.020980965,0.029840818,-0.032885052,-0.024630975,-0.03180247,0.04184319,0.0075797886,0.017954137,0.016797116,0.11254732,0.04485656,-0.046741113,-0.027124368,0.0040769856,0.004519721,0.023709029,-0.033895034,0.052818466,-0.041922268,0.033699993,0.0021139446,0.04048323,-0.028764516,0.0020663096,0.0059949886,-0.040812526,0.044652756,0.0041705137,-0.047176108,0.008236787,0.019338993,0.02076764,0.011190833,-0.013147212,-0.016306233,0.003780843,0.010275003,0.017770877,-0.00031393286,0.026331706,-0.0232444,0.014417909,-0.030856807,0.051956035,0.028040905,-0.032616008,-0.021775506,0.015979612,-0.0048561743,0.042748276,0.03814253,-0.061329417,-0.0292541,0.02483377,0.05010216,-0.036633085,0.055713158,-0.00023520087,0.036072806,-0.009237376,0.021816842,0.0227036,-0.029219722,0.014785573,-0.010127841,-0.03064374,-0.01445407,-0.0011386535,0.015717305,0.1277633,-0.005680144,-0.018948767,0.009901763,-0.05296995,0.023511186,0.011746871,0.00077046535,0.06456703,0.01979669,-0.004489717,0.021302227,0.010547925,0.0111555215,-0.012150565,0.036872514,0.033062138,0.046804883,0.047071822,-0.019346988,-0.05139472,0.06892794,-0.0036443996,0.010916869,0.02402738,0.020580553,0.030559061,-0.039955307,-0.023440829,-0.05837819,-0.022384312,-0.061573718,-0.078945056,-0.04210267,-0.004930356,-0.06079343,0.05604339,-0.037378836,-0.03889446,0.0066042664,0.021836631,-0.028844703,0.055974845,-0.0434273,0.029460095,-0.050541297,0.0017756865,-0.07600755,-0.020249343,0.0018437755,-0.029597709,-0.02091524,0.058663122,-0.017529588,-0.015016324,-0.008411593,0.040833663,-0.023758817,-0.0020360188,-0.06549136,0.016748713,0.028306378,-0.014236749,0.02448552,0.0294858,0.013144781,-0.0039869794,-0.00060549635,0.058235094,-0.040171385,0.004295549,0.08692225,-0.00079352385,-0.06224368,-0.03132878,-0.014073739,0.002323212,0.019149508,0.041262146,-0.036436442,-0.0053721406,-0.037444137,0.021204593,-0.011692816,-0.04193034,-0.0061108614,0.0081256945,0.02543924,0.01137994,-0.02148288,0.016964499,-0.020675438,0.036389455,-0.012279142,-0.016273428,0.04642461,-0.048036326,-0.03559612,0.02145684,-0.052077007,-0.068795405,0.02645993,-0.029609302,0.010209348,-0.021610685,-0.033950094,-0.023036836,-0.06887903,-0.036726773,-0.010039614,-0.04255952,0.024846956,0.016100865,0.0008112919,0.0027199013,-0.03617544,0.030813903,0.0074406657,-0.011209218,0.0526782,0.02735684,0.04086018,0.02286601,0.02116442,0.008940144,-0.016032131,0.03057045,-0.037513025,0.012697376,-0.009395077,0.010723618,0.009274939,0.030224096,-0.08024957,-0.0019965998,0.068490155,0.031025447,0.038658634,-0.03330597,0.03546284,-0.011861279,0.021706574,-0.024702104,-0.049992867,0.0131787155,0.013424759,-0.041690655,0.041559797,0.033045683,-0.03787658,0.070458785,0.031997602,-0.012820146,-0.000894348,0.020637855,0.0030663214,0.025515663,0.043608725,0.04604288,0.08911661,-0.03474228,0.0046392456,0.006169037,-0.031352505,0.05526993,-0.016472716,-0.024466168,-0.08850697,-0.006485512,0.009105626,0.00014717663,-0.049616333,0.018192956,-0.046642095,-0.04540042,0.040516645,-0.05060837,0.024134729,0.016564572,-0.04371487,0.026306082,-0.031597316,0.0071220053,0.009930484,-0.024042271,-0.017638117,0.019997181,-0.00085509475,0.0024445886,-0.017128402,0.0076338686,-0.04703431,0.0062162196,0.02045397,0.03538899,-0.019219967,-0.04132036,0.0044420906,0.0054642013,-0.024969611,-0.043535735,0.004957942,0.0010354671,-0.02416491,-0.046488523,0.0077953525,-0.0063011535,-0.032645155,-0.04909504,0.030199898,-0.061758056,-0.035537533,-0.05176198,0.011285817,-0.059313655,-0.0092065865,-0.046204314,0.024405267,0.03372722,0.075566925,-0.011645494,0.029820653,0.055343214,0.013698424,0.03197275,-0.009582336,-0.028475434,-0.001954933,-0.030003285,-0.018592803,0.037667524,-0.047536634,0.027606852,0.018272528,0.10042445,0.008784494,-0.020124536,0.04276801,-0.029651236,-0.024575725,-0.020154234,0.029034887,0.0138198845,-0.05091762,-0.016671708,0.07165901,-0.027136942,0.026168292,-0.060010936,0.033362135,-0.029318731,-0.081800796,0.039775353,-0.07427821,0.030030899,-0.002303272,0.0868373,0.0272557,-0.014071672,0.0065598167,0.004399576,0.03353154,-0.035839565,0.011881088,-0.06075348,-0.071311995,0.06350975,0.02869571,-0.030283742,0.032039832,0.021050341,-0.005833337,0.04306225,-0.059851468,-0.013938226,-0.07295378,-0.05756359,0.0051696356,0.015090611,-0.053404056,0.03418535,0.027040055,-0.030493513,-0.005608892,0.013600175,-0.003622417,-0.050871786,-0.023356175,0.004331773,0.032749694,0.0064786365,-0.010411031,0.019510724,0.00322924,-0.04960759,-0.029999183,0.010367798,0.0057907803,0.1415442,0.012601019,-0.050012153,-0.010739631,0.04002777,-0.025230896,0.045564115,-0.0932624,0.010695611,0.05202674,0.042267192,0.065377854,0.039744537,0.029648753,-0.0034036834,-0.012602286,0.027709683,-0.041445196,0.03032279,-0.019007694,0.035556916,0.028177204,-0.009875175,0.03637509,0.043855187,-0.02624382,0.015407952,-0.02197085,0.003226021,-0.055528007,0.028044598,0.04609752,0.022876093,0.05087749,0.05598489,0.020660277,-0.018421372,0.026025455,0.010317399,-0.042665537,0.05706166,-0.03547962,0.03088064,-0.0040428936,0.0050613075,-0.009288227,0.0028369972,0.035792332,0.028035257,0.031864792,-0.03994929,-0.004191722,0.03545235,0.014719173,0.037395865,-0.10030025,-0.011387508,-0.01367667,-0.023209048,-0.02354767,0.010256362,-0.014343627,0.018086407,-0.016950862,0.028494336,-0.060809,0.0018150453,0.014986003,-0.01622709,0.006002351,0.012291871,-0.027309125,0.03443659,-0.03460078,-0.01296539,-0.016984427,-0.015464673,0.024262011,-0.020384701,-0.030797953,0.009890882,-0.0225511,0.0063365037,-0.0057032416,0.044541635,-0.0484683,0.031768844,-0.01296468,0.014030944,-0.12278684,0.07051058,0.04226379,-0.020953814,-0.018387921,-0.037615836,-0.06502592,0.009522455,-0.027425949,0.041874856,-0.0025657048,-0.03770669,-0.028725088,0.0013873315,0.0334494,0.02883781,0.057669755,-0.0048612584,0.00879963,0.05945548,-0.02033733,0.031182911,-0.02390102,-0.00583362,-0.037577312,0.010608998,0.038850605,-0.055022202,0.038292117,0.0394369,-0.008239883,-0.02298078,0.019731984,0.03751677,0.013927884,0.0050038067,0.042225108,-0.0050803493,-0.05151982,0.017463388,0.026040945,0.00013150742,-0.03417367,-0.011009546,-0.0039388887,-0.014710135,0.019962514,-0.030770669,0.057597365,0.023892945,-0.03893742,0.110163234,0.0072435355,-0.02480963,-0.018508507,0.05870083,0.014069468,-0.010054273,0.019739782,0.0010121674,-0.025723012,-0.007555038,0.015731245,-0.054463904,-0.015744222,0.006301714,-0.03054773,0.02395365,-0.05991166,0.03916072,-0.033093292,0.004095014,-0.08167683,0.045815393,-0.09028703,-0.05213923,0.055523764,0.02360047,-0.003308053,0.023169039,-0.032934062,-0.011721238,-0.047170024,0.04378361,-0.049094647,0.030834384,-0.02206687,-0.014858328,-0.033114158,0.02839998,0.0128256865,0.056371164,-0.020976488,-0.020057129,0.059496075,-0.027545834,0.034057207,0.00994085,0.018023835,-0.00020807868,-0.018536044,0.022221893,-0.013102801,0.012574773,0.04593267,-0.004284831,0.000113137685,0.026170747,-0.02797133,-0.030502113,0.060956623,-0.041241784,0.03204875,0.019130224,-0.03281055,0.06895195,0.036055747,-0.01288525,0.019338867,0.030201793,-0.06551035,-0.07154811,-0.0336531,-0.002656806,0.025247129,0.018040765,0.015674269,0.032680146,0.019535497,-0.20161623,0.01380428,-0.017397393,-0.042655997,-0.010725191,0.030523058,0.014344413,-0.0020463937,0.02952622,0.0016114849,0.02881449,-0.01806492,0.012683122,-0.013310014,-0.042894155,0.030455291,0.0056318734,-0.037885364,-0.004361392,0.0228038,0.0037384005,0.057308167,-0.036393065,-0.012583644,-0.046698198,-0.009702783,-0.01136342,0.012550737,0.023190144,0.010019999,0.012999234,-0.0068881772,0.016991442,0.022438396,-0.03151177,-0.025877964,-0.0077119246,0.028974384,-0.052818503,0.018076867,0.021048045,-0.038989406,-0.04770928,0.007626775,0.009479435,0.052045263,0.035874195,0.017842446,-0.03443433,-0.0035525702,0.014628176,-0.015141485,-0.09169538,0.016756374,-0.009663336,0.080893196,0.031477436,0.007186544,0.055165455,-0.008779155,0.038447477,0.05136166,-0.041006483,0.019084593,-0.038248964,-0.0035097091,0.0673154,-0.06250564,-0.063052386,-0.023970816,0.019048905,-0.017066358,-0.033752903,0.0074550984,0.022998633,-0.027610268,0.015551944,-0.020874484,-0.06413839,0.001321958,-0.023863807,0.0012254148,-0.003423869,0.0066598,-0.05184508,-0.01739006,-0.026182052,0.012288294,0.026910512,0.0066522886,-0.026662013,-0.039469957,-0.020556627,-0.006263846,0.012009945,-0.031466488,-0.028270457,0.050175715,0.0069832024,-0.014215681,0.013771509,0.0096739335,-0.029131014,0.0074018408,0.051393464,-0.049261864,-0.118029706,-0.020049864,-0.023418777,-0.048963353,0.051005736,0.023113007,0.04472873,0.0001188603,0.025989242,0.008695638,0.0065724584,-0.02352737,-0.03104033,-0.030360956,-0.03601642,-0.020024395,-0.0053610066,-0.0004148397,0.043248866,0.025538802,-0.047514852,0.02133899,-0.0006758516,0.054443065,-0.0027012692,-0.050435975,0.03232692,-0.036061663,-0.041296728,0.03175307,0.00843417,-0.008020617,0.02976933,0.0063127605,0.05602941,-0.049201887,-0.05433883,0.050271343,0.004632914,0.0032710547,0.0059622037,-0.011722096,0.004720446,-0.022417586,-0.020325573,-0.08375403,0.023305697,-0.013702,-0.057441276,0.041984007,0.039604466,0.05946507,-0.0034001933,0.022560613,0.0011588015,-0.014321815,0.035815917,0.021647755,0.017696802,0.03938916,-0.043894492,-0.03567615,0.012451876,0.03774594,-0.036489267,0.040355403,0.027690519,0.017596496,0.030001676,-0.0023262848,0.04560688,-0.025053747,-0.031253304,0.041632865]
6	employees	Table:employees\nDescription:ข้อมูลพนักงานขาย (sales employee) ที่ติดต่อกับลูกค้าโดยตรง\nColumns:\n  employee_id       SMALLINT PRIMARY KEY,                           -- รหัสพนักงาน\n  last_name         VARCHAR(20) NOT NULL,                           -- นามสกุล\n  first_name        VARCHAR(10) NOT NULL,                           -- ชื่อ\n  title             VARCHAR(30),                                    -- ตำแหน่งงาน เช่น Sales Representative\n  title_of_courtesy VARCHAR(25),                                    -- คำนำหน้า เช่น Mr., Ms., Dr.\n  birth_date        DATE,                                           -- วันเกิด\n  hire_date         DATE,                                           -- วันที่เริ่มงาน\n  address           VARCHAR(60),                                    -- ที่อยู่บ้านพนักงาน\n  city              VARCHAR(15),                                    -- เมืองที่พักอาศัย\n  region            VARCHAR(15),                                    -- ภูมิภาคที่พักอาศัย (บ้านเกิด) ไม่ใช่ work region\n  postal_code       VARCHAR(10),                                    -- รหัสไปรษณีย์บ้านพนักงาน\n  country           VARCHAR(15),                                    -- ประเทศที่พักอาศัย\n  home_phone        VARCHAR(24),                                    -- เบอร์โทรศัพท์บ้าน\n  extension         VARCHAR(4),                                     -- เบอร์ต่อภายใน\n  photo             BYTEA,                                          -- รูปถ่ายพนักงาน\n  notes             TEXT,                                           -- ประวัติย่อพนักงาน\n  reports_to        SMALLINT REFERENCES employees(employee_id),    -- FK → employees (self-ref): รหัส manager โดยตรง\n  photo_path        VARCHAR(255)                    	[0.024536379,0.033434,-0.02587294,0.018403325,0.01222834,-0.026271418,-0.014924503,-0.030439878,0.034408968,0.008622617,0.019907352,0.01968908,0.14195555,0.04601944,-0.029594587,-0.030448385,0.00959335,-0.02742831,0.009084896,-0.016827775,0.046467297,-0.026168011,0.032982692,-0.0140152825,0.02021889,-0.014523908,-0.015360684,-0.0015737741,-0.009907654,0.052076705,0.009832058,-0.016754448,0.004240888,0.02251216,0.020942781,0.011113295,-0.0036024132,-0.04434486,-0.0028010583,0.006958777,0.0009785898,-0.015747244,0.010483851,-0.023925925,0.022705862,-0.0153905945,0.06408347,0.01241449,-0.030233858,-0.0016935784,0.0030103063,0.015277588,0.06691623,0.037401646,-0.026078071,-0.025631063,0.044118058,0.07361311,-0.033336844,0.008463433,-0.0066724145,0.02998549,-0.011424008,0.0066767344,0.040881604,-0.034994747,0.01941856,-0.022680674,-0.04934598,-0.034628455,-0.016324865,0.0070505035,0.088547245,-0.013041403,-0.019291181,0.024295423,-0.04111781,0.025390968,0.011036402,0.01640264,0.04266848,0.012761806,-0.007431817,0.016302904,-0.0062212576,-0.0027914497,-0.035925623,0.06197693,0.0508797,0.048631538,0.041864935,-0.0067181294,-0.035874996,0.04180938,6.594279e-05,0.016538633,0.01217474,0.0022641341,0.04467639,-0.046494924,-0.0132002905,-0.075724676,-0.026831502,-0.057596996,-0.07144765,-0.04807504,-0.012911868,-0.06144511,0.043544088,-0.034690112,-0.04054165,0.017566245,0.0242791,-0.04204492,0.03383122,-0.033401147,0.05930901,-0.04272233,0.0065646386,-0.07531672,-0.010888603,-0.010518299,-0.03801582,-0.0222799,0.04168001,-0.023805443,-0.041020103,-0.027348172,0.043293964,-0.05327047,-0.014377535,-0.034905728,0.00011042792,0.027334223,-0.022752594,0.04604131,0.027147576,-0.025764572,-0.0038873397,0.005984993,0.035299104,-0.060107794,0.0015738216,0.059278633,0.013387781,-0.062217,-0.028031535,-0.0061109094,-0.010627619,0.02029218,0.03644228,-0.058820583,-0.03014502,-0.024604868,0.03796555,0.0022135973,-0.020303743,-0.008760027,0.010702013,0.01711827,0.025951168,-0.012623149,0.012172967,-0.024734696,0.028523013,0.0044189417,0.0021365995,0.02398063,-0.0455987,0.0026135414,0.007839352,-0.03497456,-0.0877794,0.024999598,-0.013664246,-0.007297728,-0.045192245,-0.04037846,-0.03404219,-0.0546448,-0.06328583,-0.009752127,-0.06197378,0.02559422,-0.002711149,-0.007817009,0.0038874568,-0.026849292,0.025308575,0.017226715,-0.015587683,0.0564982,0.032237902,0.04003058,0.029271334,0.0155305825,0.011706919,0.01594514,0.014699706,-0.05167503,0.009953319,0.004985802,0.011462718,0.0154032335,0.020005845,-0.071475886,-0.025775703,0.045104727,-0.0066644643,0.047291268,-0.036306128,0.034878433,-0.02899816,0.030345803,-0.041246507,-0.046645615,0.011507289,0.023223663,-0.024666222,0.046001118,0.010513301,-0.057889994,0.06660146,0.03211485,-0.0019788411,0.011625333,0.028391877,-0.034597576,0.04038625,0.06053075,0.03563511,0.084623076,-0.013573407,0.03199365,-0.016379625,-0.032849465,0.043747254,-0.005234803,-0.020226909,-0.10494032,-0.017192118,0.02328936,0.0027067114,-0.033043765,0.0256044,-0.05329429,-0.07290956,0.034342334,-0.06269414,0.045254633,0.044259768,-0.04488703,0.019494642,-0.0014028897,0.0076740095,6.987697e-05,-0.035614282,0.018206289,0.035076547,0.003410936,0.013109498,-0.020593878,0.015498579,-0.037121788,0.018212974,0.022928227,0.014059245,-0.028380282,-0.052435335,0.001332251,0.024446532,-0.034116175,-0.033837114,0.0050681056,-0.001119044,-0.008205551,-0.050616737,0.02645433,-0.0018560598,-0.04641527,-0.037335634,0.019317772,-0.04227569,-0.015152765,-0.046227623,0.009437403,-0.07009495,0.0015127864,-0.030766048,0.017967165,0.049733512,0.09121968,5.470191e-06,0.028351456,0.060255393,0.009113639,0.012108121,-0.0051897797,0.0014432817,-0.021193441,-0.031942796,-0.005265098,0.030877214,-0.042393655,-0.018972278,0.020479506,0.117389396,0.022029314,-0.02674746,0.045346033,-0.024170713,-0.028301118,-0.025126033,0.048318084,0.036441557,-0.071087174,0.004666037,0.096107475,-0.008366559,0.02778001,-0.049149156,0.0062102596,-0.018890467,-0.08460579,0.034146566,-0.034276664,0.036059003,-0.021521589,0.056330655,0.032402385,-0.024017608,0.009566792,0.021591771,0.039676428,-0.05667876,0.01697189,-0.042663243,-0.054071125,0.07727823,0.007950076,-0.021212451,0.023345634,0.04494039,-0.016876047,0.04629135,-0.08308521,-0.017315079,-0.056846406,-0.046818018,0.008833762,0.03077429,-0.06522374,0.04854944,0.016869728,-0.031767387,0.021551205,0.012017826,-0.014098576,-0.035033304,-0.009565336,0.0021103707,0.018443756,0.008044918,-0.003175412,0.019623162,0.030906374,-0.055785436,-0.01843811,-0.0029699174,0.0019790004,0.10571085,0.036530305,-0.037089027,-0.005189058,0.043422483,-0.019303933,0.026157945,-0.06042263,-0.0046743755,0.03387649,0.037323322,0.048189815,0.02248606,0.0038370166,-0.03067708,-0.0014674204,0.03261981,-0.047822937,0.028525371,-0.0021478718,0.024335736,-0.007040292,0.007256027,0.025963942,0.043687705,-0.026681678,0.012572798,0.0029030566,0.033375397,-0.03427266,0.037741844,0.03099968,0.014084889,0.054783963,0.051273704,0.03927518,-0.0010267756,0.0292475,0.009581365,-0.031212568,0.0482277,-0.047582053,0.04323138,-0.01328757,-0.0035811178,-0.02073571,0.0035419692,0.033951525,0.00066665653,0.014767327,-0.05363274,0.01824343,0.018266799,0.015232788,-0.00053952564,-0.07466408,-0.018554738,-0.00522682,-0.017570624,-0.012988244,-0.024942001,-0.013848201,0.018737778,-0.003272198,0.033760995,-0.022283338,0.024939673,0.026564294,-0.023838323,0.01874528,-0.011343432,-0.036768634,0.010689142,-0.0065077543,-0.016253851,-0.0035922679,-0.04574234,0.019794276,-0.034085967,-0.016623754,0.0109424,-0.007726068,0.0032671387,-0.0009626501,0.057588656,-0.04307335,0.057540018,0.0029202185,-0.017943246,-0.12069452,0.018915204,0.03191315,0.0034136947,0.013998882,-0.042246185,-0.06913104,0.020046636,-0.014418849,0.024227664,0.0051815878,-0.04956501,-0.026047861,0.008960169,0.014641916,0.006816123,0.053726986,0.003767834,0.03711507,0.011124341,-0.020250421,-0.002707709,-0.022579763,-0.01376959,0.0018561962,0.020716952,0.025991166,-0.07714159,0.055648036,0.034332946,-0.03430198,-0.02544109,0.008922987,0.069610186,0.005875614,0.0079013575,0.064361736,0.012534475,-0.06715147,0.0052695763,0.032140523,-0.033099268,-0.051377956,-0.056692332,0.010430597,-0.027531102,0.0065120277,-0.020876195,0.040130425,0.038402382,-0.051837478,0.12526377,-0.029088225,-0.018389037,-0.022418272,0.03936002,-0.018251667,-0.045798372,0.03156302,-0.0019124466,-0.013282935,-0.003055487,0.01182147,-0.047116656,-0.02188019,0.019008035,-0.043154545,-0.0041701645,-0.049671203,0.04769706,-0.017193789,0.017253015,-0.04807613,0.0237041,-0.0934903,-0.041116145,0.02650179,0.0011890912,-0.01890403,0.034268305,-0.038670056,-0.032151286,-0.010493809,0.03349106,-0.05120675,0.010803101,-0.029199464,0.033221312,-0.023229329,0.0038023663,1.8882163e-07,0.057129536,-0.0050737704,-0.040381618,0.061305255,-0.04004671,0.045971543,0.009078348,0.025947187,0.028904693,-0.010084109,0.0019444171,-0.018940844,0.018927379,0.050173134,0.0047214734,0.01335605,0.030049726,-0.006954758,-0.022391513,0.041329484,-0.05295119,0.032657415,0.05362296,-0.0069442815,0.063775554,0.03961366,-0.008219915,-0.0041061225,0.011204874,-0.054515537,-0.07323322,-0.016910769,0.02753023,0.044285182,0.011852652,-0.0027830119,0.03853928,0.00049943,-0.21555996,0.023833474,-0.017318686,-0.043417554,-0.017310573,0.031926874,0.030373372,-0.015924718,0.00049358926,0.05084606,0.032395195,-0.028537866,-0.0018494291,-0.018624347,-0.035086546,0.016399706,0.0044966307,-0.01944724,0.005835599,0.008851986,-0.00953559,0.05979548,-0.034490276,-0.008430585,-0.042717785,-0.016315987,-0.010369169,0.017252773,0.019519068,0.025583575,0.015759839,-0.002370115,0.016994428,0.04143332,-0.017401518,0.008372429,0.011544295,0.0026665896,-0.06656714,0.070744395,0.008938401,-0.031247733,-0.04818988,0.024275627,-0.012859827,0.04420363,0.015879376,-0.00043478954,-0.02640779,-0.022537021,0.017636586,0.016788783,-0.09705159,0.012118505,-0.014261426,0.04718394,0.035209637,0.019928431,0.053514954,-0.009294621,0.063744485,0.06889434,-0.037051216,0.00565432,-0.0022860586,-0.004781567,0.05326414,-0.05120955,-0.033997737,0.028852073,0.041362684,-0.03047948,-0.023435466,0.0043362365,0.038502216,-0.05062241,0.0072688875,-0.013914762,-0.050117545,0.028624298,-0.032454647,-0.018301256,-0.012268825,0.01527982,-0.02997415,-0.046309125,-0.045138314,0.021489922,0.0377801,0.020053005,-0.032224797,-0.04807054,-0.0075425794,0.018894091,0.019735284,-0.0249374,-0.044891603,0.04543442,-0.019709645,-0.020708399,0.012768446,-0.021355232,-0.030979114,0.025528843,0.050091278,-0.033703476,-0.11256542,0.018337796,-0.029726114,-0.06495479,0.05620145,0.036511045,0.05419286,-0.0033027236,0.020235728,0.014422126,0.019959286,-0.047161702,-0.025789108,-0.034004852,-0.027325748,0.010200486,0.004656588,-0.003644479,0.022898216,0.033246245,-0.052087065,0.045693997,0.016408304,0.043283224,-0.0028672253,-0.0636598,0.04418187,-0.03609764,-0.01895677,0.02758853,0.043260362,-0.010799993,0.020967888,0.018540675,0.07451707,-0.060795654,-0.042013437,0.032226935,-0.0063207815,0.026234012,0.019144192,-0.0012399557,0.017076576,-0.048976175,0.0043932875,-0.092597336,0.0058083897,-0.02251223,-0.040128652,0.020322382,0.036300313,0.035360664,-0.020471295,0.032295555,0.004362471,-0.034577098,-0.0044027334,0.012793046,0.01031135,-0.0026128818,-0.028492741,-0.030773213,0.011881723,0.025391724,-0.02071409,0.033794876,0.029494194,0.0212202,0.00762628,-0.008780953,0.083419345,-0.019355023,-0.008334323,0.033623494]
7	order_details	Table:order_details\nDescription:รายละเอียดของ order แต่ละรายการ\nColumns:\n  order_id   SMALLINT REFERENCES orders(order_id),   -- FK → orders\n  product_id SMALLINT REFERENCES products(product_id), -- FK → products\n  unit_price REAL     NOT NULL,                        -- ราคาต่อหน่วย ณ วันที่สั่ง (อาจต่างจาก products.unit_price)\n  quantity   SMALLINT NOT NULL,                        -- จำนวนที่สั่ง\n  discount   REAL     NOT NULL,                        -- ส่วนลด (0.0 - 1.0 เช่น 0.1 = 10%)\n  PRIMARY KEY (order_id, product_id)	[0.017820196,0.027509186,-0.029466445,0.0118995495,-0.000847373,-0.038173817,-0.03846794,-0.018793115,0.04063616,0.0384277,0.017809045,0.0060812775,0.10795828,0.030673742,-0.024149958,-0.043144066,0.00092407025,-0.03797317,0.032580707,-0.013642281,0.04623542,-0.035444863,0.03087763,-0.016320897,0.035267927,-0.049724933,-0.01632325,0.0076900786,-0.060169768,0.054226607,0.015815154,-0.050219864,-0.005578816,0.022875864,0.019889446,0.004535961,-0.009856431,-0.032450985,0.020578422,-0.0033230537,0.01855254,0.008405321,0.036450114,-0.020240938,0.033632476,-0.016259752,0.06559317,-0.010230113,-0.021557065,-0.0023092765,0.004486391,0.012162084,0.045052014,0.018557554,-0.05408007,0.022266172,0.029806316,0.04973837,-0.034443703,0.02909604,0.025912516,0.059980173,-0.012257584,0.036974028,0.045062114,-0.03834193,0.019887418,-0.019681374,-0.035375737,-0.013087343,-0.011865472,0.009750813,0.10587572,-0.002738397,-0.017144207,-0.0024301817,-0.052942064,-0.00953801,-0.006818189,0.0012674963,0.042854417,-0.0015330883,-0.008273935,0.012601231,-0.013545737,0.009362546,-0.019819988,0.03182635,0.034101013,0.032771062,0.05201961,-0.030184982,-0.056397814,0.05988248,0.020527072,0.01114117,0.0018537146,0.00666379,0.02496078,-0.0244535,-0.036533248,-0.07042489,-0.02475096,-0.045964804,-0.09041104,-0.026013555,-0.02780144,-0.05593843,0.06775481,-0.06749475,-0.020891512,-0.00050777476,0.02386398,-0.06257271,0.02495195,-0.042250663,0.048579022,-0.03443336,0.014047018,-0.0742677,-0.0016661271,-0.0013214943,-0.029508915,-0.029023264,0.046677552,-0.03465173,0.018712906,-0.03897099,0.049414154,-0.042245608,-0.001150956,-0.048360027,0.015631499,0.045133647,-0.0026070448,0.035555597,0.02699181,-0.0193483,-0.010629903,0.014683683,0.04007718,-0.045346707,-0.0007099941,0.07543289,0.009894826,-0.06842583,-0.00076380983,0.0045346823,-0.015507523,0.032279316,0.024704073,-0.038613304,-0.023579737,-0.015007023,0.0002570319,0.0053301943,-0.019786026,-0.022308277,-0.005306495,0.012145427,0.0197083,-0.00048182596,0.011161075,-0.010720653,0.06261427,0.004205461,-0.001922567,0.060327567,-0.05702174,-0.026827395,0.02619726,-0.029124146,-0.07428678,-0.0005575611,-0.0084863985,-0.018543798,-0.050077982,-0.037847076,-0.015242127,-0.043778926,-0.055604465,-0.009459869,-0.043876242,0.01750393,0.02166236,-0.026838232,-0.0072405767,-0.011622291,0.043258715,-0.002059954,-0.0032120303,0.08518823,0.012237441,0.047228552,0.031860232,0.026870199,0.000398369,0.016293693,-0.012288516,-0.032783244,0.03130783,-0.0148199815,0.011438264,-0.00019845032,-0.00053413486,-0.06871534,-0.028646633,0.06083693,0.03302957,0.035298437,-0.016071936,0.026093233,-0.02728277,0.0067474954,-0.01973569,-0.08710516,0.018867621,0.03994182,-0.0114417365,0.024400456,0.021585919,-0.044861436,0.06637077,0.032634243,-0.011412323,0.005710913,0.030555118,-0.011125941,0.03489382,0.053160112,0.030174196,0.07101036,-0.014118144,-0.009562933,-0.023659155,-0.028444344,0.026964566,0.001889072,-0.016287172,-0.1227858,-0.041564796,0.0048366953,-0.012455758,-0.042745218,0.04471332,-0.06467384,-0.042289,0.017749494,-0.04272045,0.005406054,0.023140617,-0.057519697,0.032807175,-0.015123416,0.025351934,7.708822e-05,-0.025868623,0.00030559354,0.045478985,-0.0053929435,0.030026311,-0.031759776,0.016449196,-0.0342744,0.023059614,0.014709284,0.017659182,-0.039217595,-0.022336366,-0.011208579,0.014701594,-0.027383078,-0.034802932,-0.0027596843,0.017474217,0.012292538,-0.035785664,0.030836148,0.007998965,-0.041249875,-0.0031849123,0.040186275,-0.042205714,-0.025803855,-0.029749237,0.007082343,-0.060975213,-0.0044621793,-0.043734927,-0.003568254,0.033186235,0.08243196,0.0071192263,0.027428646,0.023360847,0.0122368345,0.028480247,-0.012036878,-0.008365033,-0.020714382,-0.06093793,0.0006925547,0.029076125,-0.068121426,-0.009305285,0.01876251,0.10537365,0.014828448,-0.021441843,0.026769914,-0.02302683,-0.011544187,-0.015786119,0.06825082,0.045861606,-0.054434936,0.0060714055,0.07475645,-0.015055214,0.04069267,-0.00680344,0.014840377,-0.0449242,-0.07474479,0.023763824,-0.04976794,0.025167147,-0.010835061,0.050400108,0.039134182,-0.016167687,0.011354329,0.0009898894,0.033543523,-0.049481984,0.024660671,-0.06455882,-0.015726872,0.081858076,0.011615033,-0.02353614,0.030324576,0.06886942,0.013642296,0.046775207,-0.065783426,-0.011383351,-0.067310184,-0.059648003,0.032459226,0.0045677945,-0.06043225,0.01457953,0.017952338,-0.059630644,0.011712131,0.027055515,-0.013343137,-0.02957736,-0.024557834,-0.023529802,0.026070783,0.0312103,-0.005844203,0.0064554424,0.042953767,-0.051776312,0.0022706452,-0.0062179645,0.025462758,0.12612388,0.0340775,-0.04571363,-0.020485686,0.038782913,-0.027260602,0.01516298,-0.04865709,0.005324515,0.026521863,0.04213223,0.041563973,0.03690007,0.037282698,-0.033035994,0.013699131,0.017342804,-0.0669965,0.018945388,-0.022447824,0.016904453,-0.01956047,0.011699886,0.015100633,0.027977942,-0.027501501,0.011377006,0.0031316427,0.018069305,-0.041262746,0.052137792,0.0017317078,-0.010888336,0.061813466,0.026892437,0.028081024,0.014570393,0.055539478,0.020790113,-0.020806607,0.04010276,-0.033393025,0.045321323,-0.026478013,-0.0010518244,-0.034475747,0.02673326,0.054005478,0.014454153,0.025638891,-0.06598799,0.029440496,0.025850432,0.008513378,0.023306224,-0.09039485,-0.002992309,0.0027754141,-0.024365528,-0.011361239,-0.032998156,0.006755451,0.022752717,0.004713085,0.01654707,-0.031157017,0.02858556,0.034063295,-0.018633718,0.03223318,-0.00615472,-0.028079953,0.017061885,-0.0214914,-0.034411877,-0.002848057,-0.044696618,0.016362045,-0.005153045,-0.022092162,0.023525132,0.013237783,0.0041064015,0.0042167166,0.046546303,-0.0747636,0.04100163,-0.01376249,0.011195355,-0.119021386,0.033813294,0.035875827,0.015945088,0.00058098976,-0.0031595526,-0.0640142,0.02715619,-0.036745563,0.012692158,-0.0078298235,-0.043467786,-0.025629764,-0.01031333,0.020241063,0.0104630245,0.03645902,0.0069570956,-0.00023024261,0.04987787,-0.013922062,0.047462877,-0.030372316,0.0022584223,-0.0028904248,0.024906319,0.0337784,-0.08490108,0.056242444,0.019532785,-0.031058814,-0.016250785,0.016181927,0.04271315,0.013933447,0.00521417,0.05662118,0.0037800176,-0.08747117,0.02127115,0.044802368,-0.02909797,-0.026289275,-0.05631717,0.00014426795,-0.031961348,-0.005099545,-0.015008324,0.027267918,0.0475903,-0.022930058,0.12139342,-0.009380023,-0.039418444,-0.012310141,0.023920313,-0.005025312,-0.038450714,0.02668655,0.033517197,-0.01353592,-0.0065716063,0.01861307,-0.042520784,-0.012506549,0.03338223,-0.05306713,0.0105163595,-0.049879916,0.03143327,0.0048016952,0.016577369,-0.060070824,0.015129414,-0.0929671,-0.060667384,0.06080627,-0.011683354,-0.027163291,0.022790471,-0.048129037,-0.015673753,-0.016942797,0.0013744707,-0.03556562,0.024525527,-0.010055798,0.011832874,-0.037504964,0.016790846,-0.026162544,0.05566413,0.0072792624,-0.03225463,0.06900493,-0.025757013,0.025903052,0.009553901,-0.016844632,0.02682755,-0.018904502,0.016892208,-0.046144944,0.02982844,0.053316697,0.0058298344,0.013411807,0.023196826,-0.0033700715,-0.045954004,0.043979667,-0.05976032,0.027296942,0.042900406,-0.005451485,0.051886547,0.018004987,-0.006700875,-0.03317556,-0.01997921,-0.052963246,-0.047918327,-0.013644774,0.020622293,0.040600985,0.015281731,0.011266379,0.04802219,0.022854198,-0.21093917,0.01941053,-0.007835979,-0.0459294,-0.036974594,0.022417529,0.030794034,-0.0072527714,0.01043753,0.013656291,0.03616256,-0.020792417,-0.010341472,-0.032127496,-0.048499275,0.035440583,0.0099397665,0.0027071035,0.0013436747,0.014632301,0.0036427942,0.0642429,-0.007191836,-0.008194828,-0.06570346,-0.045105163,-0.028495422,0.024211286,0.035888597,0.027137611,0.011076614,-0.010466934,-0.0059313253,0.03614326,-0.017509304,0.019300543,0.012570354,-0.0020712253,-0.077270344,0.073956124,-0.007934262,-0.0037167787,-0.0196108,0.007946662,0.014398969,0.028640881,0.025212629,0.0019220394,-0.016657747,-0.036840674,-0.0010470556,0.015680626,-0.09653738,0.016159,-0.012623389,0.045673486,0.016755125,0.031045545,0.053972535,-0.015177073,0.058058772,0.06922715,-0.0109461825,0.026652092,-0.011565856,0.0029091546,0.05845636,-0.050815932,-0.039584126,-0.00064442604,0.042011067,-0.027844604,-0.010947933,0.01562276,0.022119282,-0.03143575,0.023849213,-0.025644528,-0.06658467,0.0028162687,-0.02564924,-0.016841454,-0.01634817,0.02135364,-0.033144474,-0.021432914,-0.053719897,0.011756502,0.026339047,0.0013608767,-0.02220185,-0.027313989,-0.02739177,0.016006753,0.032561872,-0.020803142,-0.034119505,0.035956092,-0.0026728606,-0.034812827,0.02676966,-0.026178557,-0.016161487,0.020162877,0.040781524,-0.03246515,-0.074109204,0.022847762,-0.034058716,-0.050460614,0.037768923,0.054266978,0.05740888,-0.019812003,0.023860404,-0.0028805775,-0.01858897,-0.030210478,-0.036113866,-0.025613703,-0.013766761,0.0040841317,0.013681402,-0.018648695,0.031166038,0.030948041,-0.038678538,0.06492654,0.029332029,0.050506588,-0.012642156,-0.072826006,0.03754864,-0.018183166,-0.04688035,0.028809834,0.012962382,-0.02231538,0.043438774,0.028579421,0.059162386,-0.06499422,-0.04338907,0.05782945,-0.020252226,-0.006780358,-0.009351273,-0.008658109,-0.0019574587,-0.0277006,-0.014714911,-0.10008395,0.019921374,-0.021263339,-0.0236635,0.021851681,0.011745096,0.014048045,-0.0142190065,0.023211772,0.00642373,-0.04193203,0.0008601915,0.01532339,-0.004728957,0.019892517,-0.03602261,-0.021086875,0.0023938452,0.03468832,-0.00030687454,0.049017325,0.031741533,0.04567859,0.015979577,-0.010972499,0.06623283,-0.013770825,0.007472159,0.054838385]
8	orders	Table:orders\nDescription: ข้อมูลการสั่งซื้อของลูกค้า 1 order อาจมีหลาย order_details\nColumns:\n  order_id         SMALLINT PRIMARY KEY,                          -- รหัส order\n  customer_id      VARCHAR(5) REFERENCES customers(customer_id), -- FK → customers: ลูกค้าที่สั่ง\n  employee_id      SMALLINT   REFERENCES employees(employee_id), -- FK → employees: พนักงานที่รับ order\n  order_date       DATE,                                          -- วันที่สั่งซื้อ\n  required_date    DATE,                                         -- วันที่ต้องการรับสินค้า\n  shipped_date     DATE,                                          -- วันที่ส่งสินค้าจริง (NULL = ยังไม่ได้ส่ง)\n  ship_via         SMALLINT   REFERENCES shippers(shipper_id),   -- FK → shippers: บริษัทขนส่งที่ใช้\n  freight          REAL,                                          -- ค่าขนส่ง\n  ship_name        VARCHAR(40),                                   -- ชื่อผู้รับปลายทาง\n  ship_address     VARCHAR(60),                                   -- ที่อยู่จัดส่ง\n  ship_city        VARCHAR(15),                                   -- เมืองปลายทาง\n  ship_region      VARCHAR(15),                                   -- ภูมิภาคปลายทาง (ที่อยู่จัดส่ง ไม่ใช่ work region)\n  ship_postal_code VARCHAR(10),                                   -- รหัสไปรษณีย์ปลายทาง\n  ship_country     VARCHAR(15)   	[0.03439379,0.039192412,-0.023488743,0.015147467,-0.0021954142,-0.038579173,-0.030642683,-0.02205742,0.050925475,0.014209133,0.018667147,0.019333038,0.119951434,0.055504587,-0.02323804,-0.024630437,0.004590536,-0.03121202,0.009213037,-0.006061042,0.061287183,-0.034129422,0.030552479,-0.013025522,0.025514903,-0.022096818,-0.027457165,0.0049971514,-0.02790685,0.06282442,0.025613409,-0.036353417,-0.004860738,0.025731338,0.019587528,0.012712129,-0.01754088,-0.026650121,-0.011324547,0.0038489874,0.0088093635,-0.012202406,0.0415585,-0.03711476,0.052734274,-0.031207493,0.055638168,0.010227524,-0.031786025,-0.0038308387,-0.006139319,0.015072903,0.049022526,0.024183648,-0.027528813,-0.007167795,0.02912968,0.046612114,-0.04984748,0.009398294,0.012400627,0.036405694,-0.012832024,0.032290023,0.037757915,-0.038926076,0.019378642,-0.02192051,-0.045884162,-0.032593325,-0.016431617,0.016128855,0.10438327,0.007924037,-0.029499562,-0.0001656993,-0.043426264,0.014291642,-0.017397828,0.0024535619,0.050107937,0.03069517,0.004280444,0.025387969,-0.020161089,0.0074506495,-0.020096375,0.05082999,0.04681863,0.04214558,0.051196337,-0.0154401325,-0.039362412,0.04486437,0.013519633,0.014371754,0.013951755,-0.0004974291,0.027948396,-0.010342777,-0.022659166,-0.08592859,-0.027121251,-0.044216793,-0.07101531,-0.045243744,-0.009530377,-0.05642671,0.049049556,-0.042952016,-0.041822955,0.0102479765,0.036594935,-0.058946073,0.030059459,-0.03945894,0.060091335,-0.058389083,0.012400565,-0.07138119,-0.016732743,0.015021185,-0.024573814,-0.036004912,0.03791641,-0.02854043,-0.014588827,-0.021714086,0.046010844,-0.06297051,-0.0029193303,-0.042791773,0.0081654545,0.04496914,-0.008027909,0.056741353,0.013159651,-0.013901453,-0.008780719,0.0042037517,0.036011826,-0.06233011,0.016815154,0.04340475,0.015605154,-0.07058549,-0.027521195,0.011282557,-0.004454347,0.030119061,0.03446082,-0.052155197,-0.032455925,-0.021667255,0.021637702,0.01572986,-0.017349252,0.0015245915,0.002019138,0.019371085,0.026251255,0.015773997,0.015024836,-0.022999845,0.034524497,-0.011504594,-0.0047048787,0.03613076,-0.041930024,-0.018355012,0.02406762,-0.026485287,-0.07814324,0.016503854,-0.0027790705,-0.022880018,-0.038756967,-0.038417585,-0.02290651,-0.0630542,-0.040635623,-0.0033139384,-0.04852515,0.027039664,0.0018308405,0.00037568161,-0.00031512626,-0.01312165,0.024049966,0.012575532,-0.00993318,0.07795411,0.027844142,0.05082943,0.027165418,0.014907866,0.00911195,0.012849559,0.008708404,-0.05114473,0.012164987,-0.0013040007,0.0034834298,0.003996577,0.004885878,-0.054409627,-0.017480804,0.050939463,0.0067039025,0.042378593,-0.027038826,0.04001322,-0.039256264,0.0249773,-0.020845812,-0.06454776,0.01340967,0.039777078,-0.021418653,0.050400082,0.0325616,-0.026256477,0.04413251,0.03225962,-0.009836574,0.01701396,0.038035393,-0.023040103,0.038761638,0.04709807,0.029303636,0.093079165,-0.0032128359,0.024436079,-0.007842581,-0.053961962,0.035043526,-0.016507933,-0.026345171,-0.09563164,-0.04731941,0.009088973,-0.01079343,-0.04621843,0.045003828,-0.060494028,-0.042674776,0.03476603,-0.053315513,0.036612593,0.03766435,-0.0519954,0.036422707,0.0033684652,0.015891472,-0.004617854,-0.038584076,-0.00860689,0.029927775,0.0027522477,0.020913731,-0.031489607,0.009986995,-0.0052287267,0.01775953,0.012923879,0.019214407,-0.028271735,-0.03165587,-0.0052551595,0.006927781,-0.028614834,-0.034818932,0.00856278,0.00979149,-0.0070541385,-0.043787733,0.0150649,0.015184535,-0.02907212,-0.034829915,0.0288988,-0.06120004,-0.016789934,-0.029007746,0.015022498,-0.06622935,0.013268707,-0.03682198,-0.0016606314,0.029864013,0.084659375,-0.0015874509,0.022666994,0.04475868,0.021222806,0.025584966,0.0044964096,-0.016699418,-0.00598581,-0.028184814,-0.01416118,0.020080646,-0.052888807,-0.009044999,0.044959966,0.1148079,0.011871286,-0.054599147,0.053520888,-0.009878161,-0.021106295,-0.019313404,0.058642983,0.049719464,-0.05674895,-0.0008600047,0.09148989,0.0033655942,0.02955322,-0.040148348,-0.006604247,-0.025506908,-0.090471074,0.034165587,-0.056074087,0.04305416,-0.007911087,0.05337625,0.0350786,-0.012255003,0.0039782412,0.025917677,0.049710073,-0.059598606,0.02643414,-0.04514982,-0.02372084,0.08502969,0.0061760982,-0.031768985,0.02181575,0.04993751,0.0023865835,0.03349603,-0.0727557,-0.014226804,-0.07573326,-0.052907597,0.025707891,0.028614525,-0.056444295,0.029358987,0.0038870631,-0.042674314,0.012937253,0.008294036,-0.0068079797,-0.040388703,-0.04150702,-0.016593356,0.022904031,0.017852148,0.0013867762,0.009531248,0.040004544,-0.041218232,-0.003909386,-0.007263956,0.013067834,0.10048424,0.034123674,-0.040809773,-0.0018712113,0.039416295,-0.019100321,0.014251652,-0.06192472,0.018457605,0.032597907,0.048245292,0.025842428,0.030537814,0.015378492,-0.018361168,0.013130548,0.013045135,-0.04309584,0.03693585,-0.016695224,0.03152223,-0.010341833,0.02126116,0.015707584,0.03937682,-0.03128346,-0.00029972405,-0.0018429224,0.0036057234,-0.036842093,0.032816697,0.020603469,0.01679011,0.04864503,0.033462595,0.010162317,0.002145319,0.03285231,0.012506918,-0.024937408,0.046764493,-0.018731877,0.042307977,-0.023505248,-0.0057376293,-0.03084608,-0.006942849,0.028302856,0.019690728,0.011752969,-0.057044476,0.012939904,0.019803701,0.0064029973,0.016204678,-0.06808708,0.00096758635,0.00524348,-0.026575008,-0.013109702,-0.011053728,-0.017454624,0.016036794,0.009746717,0.029404473,-0.011690285,0.017369596,0.032802936,-0.032039855,0.028150847,-0.0135393,-0.032449093,-0.0015800287,-0.0076031866,-0.016122604,-0.0050567137,-0.035162482,0.020868024,-0.015639206,-0.0024907587,0.021973182,-0.0040972247,-0.0010217906,0.0018729178,0.042693034,-0.06338607,0.06930837,-0.0205636,-0.0068020676,-0.12442362,0.010968833,0.051367,-0.003993926,-0.0032261573,-0.033303358,-0.062373947,0.013346758,-0.03242644,0.03850909,0.002748987,-0.036456883,-0.024360724,-0.019402983,0.051646896,0.011893036,0.044305135,0.0064230496,0.01758845,0.028053705,-0.032554723,-0.00041259552,-0.009797527,-0.029555405,-0.0035255658,0.022371013,0.029247303,-0.08943185,0.052427102,0.02443873,-0.027268056,-0.017249566,0.029193895,0.061838172,0.0013647672,0.010556974,0.06555105,-0.0001571705,-0.07904458,0.015530748,0.047196407,-0.029474203,-0.03592043,-0.06206656,-9.575157e-05,-0.030959966,0.0035942933,-0.018405953,0.043656476,0.041487064,-0.04159552,0.13329561,-0.018832147,-0.02265708,-0.017348269,0.02107102,-0.012398687,-0.045458514,0.033302836,0.022040486,-0.013204779,-0.016256977,0.0074487934,-0.05265902,-0.018736469,0.026145766,-0.044313908,-0.007908639,-0.045526814,0.044560324,-0.013017308,0.008397006,-0.051239952,0.031704765,-0.09734269,-0.055506743,0.040377304,-0.0112098865,-0.020371327,0.018185709,-0.041061264,-0.04855384,-0.018170968,0.018218292,-0.060729764,0.018483246,-0.009429472,0.012608408,-0.023367267,0.013582567,-0.020016694,0.0473092,0.0011406969,-0.048482254,0.041156985,-0.029646456,0.032479484,0.0038079221,0.019868637,0.029015416,-0.02209379,0.012533821,-0.019818855,0.027443504,0.053238664,0.008240243,0.00512657,0.020789867,-0.021296903,-0.028180366,0.05509775,-0.050577465,0.023313558,0.04968074,-0.015375972,0.06565858,0.03575907,-0.010134068,-0.015645726,-0.0002504669,-0.06358847,-0.07274318,-0.020742312,0.017103905,0.040773075,0.019020906,0.0029527294,0.03441714,0.020367563,-0.21071246,0.007500352,-0.005313171,-0.05729093,-0.021625042,0.019319164,0.03685728,-0.026437448,0.0065166266,0.042884815,0.034242842,-0.022789352,-0.021487268,-0.012701782,-0.046283737,0.032382317,0.01140219,-0.022185966,0.00084848056,0.018727105,-0.0069084014,0.08376024,-0.033280537,-0.0007186172,-0.051107716,-0.03770014,-0.01085638,0.007426028,0.010581802,0.03845083,0.022607649,0.0033655073,0.006648283,0.0171663,-0.024160782,0.006203293,-0.0012641655,0.006113336,-0.0722938,0.05018511,0.012189458,-0.030095458,-0.02199641,0.02590714,0.0063925367,0.043984838,0.030338278,0.0034026015,-0.034269325,-0.037116338,0.0020955533,0.023255885,-0.11205291,0.011460647,0.0014127286,0.07379532,0.028005285,0.018987529,0.06859489,-0.008655968,0.07298728,0.07720748,-0.03596338,0.00874913,-0.012414886,0.00654708,0.045720372,-0.048267458,-0.016777534,0.012160789,0.03133561,-0.03351867,-0.03347215,0.004498808,0.015765978,-0.04621085,0.010540706,-0.034515344,-0.045041747,0.033416778,-0.018017128,-0.023777148,-0.006396349,0.011486742,-0.040224988,-0.045878965,-0.04913582,0.0136803975,0.04350981,0.026281774,-0.034923177,-0.045001034,-0.021018298,0.0025174844,0.020028517,-0.03167262,-0.03709967,0.021814609,-0.007898616,-0.022966992,0.008401587,-0.026040623,-0.023906555,0.020302001,0.042633392,-0.020968722,-0.10096048,0.03428886,-0.04161285,-0.064693615,0.037684437,0.03863773,0.037643854,-0.011857167,0.005917874,-0.014814777,0.027875023,-0.056871545,-0.024185965,-0.034679543,-0.04568783,0.0068726535,0.0068260515,-0.017792733,0.031219827,0.024497341,-0.04087982,0.049111046,0.010800621,0.045549765,-0.010092087,-0.06843542,0.032839306,-0.026259677,-0.022195814,0.04120785,0.037226338,-0.004634167,0.018174136,0.020224798,0.07621534,-0.06980579,-0.041340295,0.025215304,-0.007817827,0.011289381,0.016410965,0.004541846,0.015164919,-0.048404686,-0.018440992,-0.08357852,0.0036338526,-0.0201558,-0.039805193,0.01815496,0.02731547,0.027686885,0.001709879,0.02446214,0.01663154,-0.03913324,0.0048934277,0.015243815,-0.0014265378,0.0050147427,-0.026497379,-0.02106905,0.018617779,0.03957852,-0.01945148,0.033152577,0.032628916,0.030274423,0.030119425,-0.024261728,0.07145592,-0.020843588,0.0059436806,0.05058701]
9	products	Table:products\nDescription: ข้อมูลสินค้าที่จำหน่าย\nColumns:\n  product_id        SMALLINT PRIMARY KEY,                        -- รหัสสินค้า\n  product_name      VARCHAR(40) NOT NULL,                        -- ชื่อสินค้า\n  supplier_id       SMALLINT REFERENCES suppliers(supplier_id),  -- FK → suppliers: บริษัทที่จัดหาสินค้า\n  category_id       SMALLINT REFERENCES categories(category_id), -- FK → categories: หมวดหมู่สินค้า\n  quantity_per_unit VARCHAR(20),                                  -- หน่วยบรรจุ เช่น "10 boxes x 20 bags"\n  unit_price        REAL,                                        -- ราคาต่อหน่วย\n  units_in_stock    SMALLINT,                                    -- จำนวนสินค้าคงคลัง\n  units_on_order    SMALLINT,                                    -- จำนวนที่กำลังสั่งซื้อเพิ่ม\n  reorder_level     SMALLINT,                                    -- จำนวนขั้นต่ำที่ต้องสั่งซื้อเพิ่ม\n  discontinued      INTEGER NOT NULL    	[0.03602716,0.01490269,-0.029984402,0.010203173,0.028079316,-0.034539238,-0.03097629,-0.012725305,0.06272735,0.02527999,0.027105844,0.013969553,0.11743732,0.047799695,-0.020560985,-0.045598675,0.039293166,-0.038864773,0.014577997,0.0021177966,0.060648683,-0.02232816,0.03394028,-0.0024032095,0.0218973,-0.023859281,-0.022929177,0.002346027,-0.045337126,0.05560259,0.013260318,-0.06558141,0.006352728,0.0390428,0.023616463,-0.00035531932,-0.0154693425,-0.025018657,0.004884254,0.0041646133,0.01086741,-0.007897889,0.028743898,-0.028501078,0.02032025,-0.020141039,0.059479088,0.0008412604,0.0032073704,-0.0008659815,0.005941749,0.010110654,0.046672415,-0.00051327463,-0.040394884,0.005194858,0.042070337,0.06669855,-0.028570386,0.02575815,0.017510336,0.02305131,-0.031092588,0.020103538,0.051817216,-0.040355198,0.018255934,-0.023147564,-0.029436283,-0.020654328,-0.017606001,0.024239052,0.10484919,-0.00067564467,-0.020073729,0.0021450224,-0.06520205,0.0056989416,-0.013145279,-0.0042611742,0.04852663,0.024588136,0.005888138,0.02290191,-0.022308217,-0.013019826,-0.0128571745,0.046168312,0.019317722,0.052633204,0.032993052,-0.030007182,-0.063891195,0.03509596,-0.00029754153,0.015511771,0.011843732,-0.0087141255,0.02823138,-0.032046672,-0.024589974,-0.0783213,-0.008326585,-0.062322225,-0.10608133,-0.0364019,-0.016854925,-0.059947975,0.06096744,-0.046594344,-0.037859026,0.010177201,0.038310274,-0.06949624,0.024285981,-0.045893107,0.044404186,-0.055652503,0.017349575,-0.0456422,-0.021193404,0.008544193,-0.024591424,-0.029044814,0.043987077,-0.024758095,-0.004328747,-0.034993593,0.03647903,-0.04944278,-0.006649725,-0.051570356,0.015751965,0.039413165,-0.0074226996,0.058155406,0.017245213,-0.027482472,0.0032613864,-0.008053628,0.038871273,-0.06795031,0.0035538676,0.05172,0.017058993,-0.07388557,-0.0055204146,0.0040321653,-0.010001018,0.0212,0.044144157,-0.058085263,-0.036374323,-0.042498995,-0.016636362,0.0029139386,-0.020870913,-0.014460317,-0.013927608,0.028955748,0.02939307,-0.014279984,0.016211368,-0.023519572,0.043291073,0.012782305,-0.01809254,0.04305936,-0.039143533,-0.027394017,0.030289898,-0.014889076,-0.08237327,-0.00299387,0.0069331983,0.016298229,-0.067847714,-0.02494427,-0.022648606,-0.04897277,-0.056541316,-0.025737444,-0.057047408,0.02702364,0.009538396,-0.018035874,0.011711019,-0.03572676,0.020775802,0.01880333,-0.005737916,0.084056005,0.012403275,0.05811171,0.023568556,0.04336012,0.004989048,0.014073001,-0.00718932,-0.029370164,0.0123110805,-0.0029752865,0.018872716,-0.014578392,0.00035809053,-0.06229713,-0.02985111,0.0634064,0.010922902,0.024008099,-0.020376999,0.029371042,-0.0140268365,-0.00593764,-0.034498364,-0.07629802,0.029406874,0.0046148994,-0.026620748,0.045554016,0.030833155,-0.048553485,0.064659595,0.026051678,-0.0027809965,0.01686066,0.04073874,-0.001495875,0.031047396,0.028455999,0.011627149,0.06981053,-0.018311925,0.0020429993,-0.02248044,-0.013415401,0.044246625,0.0013387146,-0.033344857,-0.09237352,-0.012627304,0.021162124,-0.008509489,-0.031145254,0.026085371,-0.056880835,-0.061362058,0.02175849,-0.03185843,0.033660036,-0.0075743813,-0.056518484,0.031162793,-0.0094901305,0.018830655,-0.0025828443,-0.04029063,0.024863575,0.052556757,0.0018616498,0.0131306015,-0.021597607,0.020445153,-0.011238701,0.03020742,0.02524528,-0.0006088873,-0.039790355,-0.021158863,-0.013355247,0.020141432,-0.045182556,-0.03377183,-0.0039850124,0.016361225,-0.029487688,-0.035023693,0.030400155,0.008978899,-0.011237697,-0.0020333384,0.026712403,-0.020405138,-0.033791594,-0.02809406,0.0056700497,-0.07071947,-0.0039642565,-0.041958004,-0.0021169765,0.05255573,0.06973446,0.010196071,0.036794458,0.039601482,-6.225997e-05,0.019847745,0.0017535307,-0.011352422,-0.025820617,-0.060294755,-0.015894087,0.037667662,-0.061159674,-0.017762678,0.019571418,0.10834944,0.02514028,-0.012491399,0.03733436,-0.023969406,-0.011638595,-0.01055546,0.0435351,0.029614357,-0.043714367,9.6070115e-05,0.09006656,-0.00048218024,0.05134478,-0.020148147,0.02203888,-0.02945763,-0.08293074,0.047031168,-0.044529274,0.040177483,0.00042359746,0.061325014,0.038644902,-0.013126305,0.01792785,0.018289756,0.049135838,-0.05674988,0.02681727,-0.050369866,-0.03573528,0.066988245,0.00043950643,-0.018018005,0.029469559,0.049974494,-0.014632199,0.048599057,-0.09064536,0.0063611893,-0.06672341,-0.057043247,0.015709402,0.019195251,-0.05083638,0.018373406,0.02389818,-0.046366718,-0.007450119,0.0061668623,-0.018108081,-0.024166016,-0.03757655,-0.01611708,0.010111427,0.018869622,0.009661566,-0.00048199377,0.04156662,-0.018833052,0.0036882602,0.0023790149,0.00813425,0.0952186,0.03087993,-0.038466558,-0.014721277,0.025303962,-0.039521907,0.0029951981,-0.04299564,0.009407674,0.02709062,0.04890378,0.03096182,0.04713306,0.02960961,-0.030605411,0.024705175,0.0034044555,-0.04269842,0.011762795,0.004443896,0.016759127,-0.018381322,0.013972605,0.014431553,0.013201735,-0.019335438,0.02758537,0.015142579,0.036184866,-0.020149512,0.037681278,0.009850588,0.009991431,0.05459212,0.009458281,0.037463054,0.033712152,0.039588448,0.012154831,-0.0154263135,0.03306445,-0.032483984,0.03775416,-0.02428892,-0.00860372,-0.032520786,0.003885378,0.054958917,-0.0037645262,0.011428314,-0.06026073,0.046584312,0.012061114,0.0054157358,0.02062178,-0.06997882,-0.0017465921,0.008424574,-0.016967477,-0.029536711,-0.04122691,0.0070585827,0.02221509,0.0026254612,0.023607848,-0.01670098,0.024453163,0.035324182,-0.041437704,0.042260677,-0.035342246,-0.022292186,0.023291523,-0.029753793,-0.023217833,-0.0065151323,-0.044431083,0.011698178,-0.03436749,-0.0037263487,0.024621805,0.006363667,0.011878024,0.014690405,0.02812477,-0.06673084,0.052142672,-0.017026387,0.019795686,-0.117747895,0.00033105872,0.03046767,0.0006753273,-0.025050376,-0.017713241,-0.06559916,0.00085884036,-0.022981422,0.045557044,-0.008453186,-0.011627673,-0.026642837,-0.01171662,0.003179646,0.03012012,0.06342938,-0.0070776213,0.029707758,0.011527924,-0.041123994,0.008429874,-0.02703386,-0.0065269573,-0.011846423,0.023428364,0.02671572,-0.082610205,0.061244804,0.019118765,-0.009012336,-0.009829924,0.03234669,0.03828146,0.01131973,0.014182363,0.06518947,-0.01377645,-0.087666504,0.035323396,0.039915055,-0.033164155,-0.03265468,-0.05759656,0.015241827,-0.015885286,0.004039944,-0.0105431145,0.026417976,0.05024312,-0.031658784,0.13726765,-0.012544583,-0.045095775,-0.024758378,0.017298186,-0.010601834,-0.044023648,0.033053916,0.018753042,-0.021805689,-0.006661955,0.032915518,-0.034903154,-0.0060834847,0.015036608,-0.04370638,0.009384176,-0.04242334,0.039213326,-0.00087495823,0.020054916,-0.041516915,0.010526168,-0.09147042,-0.053472277,0.061599024,-0.008461944,-0.04458656,0.029751327,-0.046386898,-0.046047624,-0.02311155,-0.004308194,-0.06162556,0.037506044,0.008046673,0.022859735,-0.038180783,0.007345881,-0.01737364,0.038039304,-0.011498319,-0.037462033,0.047058467,-0.03714024,0.031460717,0.018873798,-0.015737498,0.039519206,-0.0184496,-0.003372946,-0.019285647,0.02534893,0.040535,-0.0005181028,0.03361432,0.025415976,-0.009065963,-0.036004037,0.061823756,-0.045559984,0.0404653,0.05015278,-0.0050030435,0.05892987,0.018542549,-0.0034401051,-0.021065958,-0.016515879,-0.02787137,-0.06890904,-0.025034038,0.012489849,0.06319166,0.032569326,0.027309572,0.03026225,-0.0016532049,-0.23456085,0.023750758,-0.031624466,-0.04359202,-0.023657588,0.015496915,0.037643358,-0.017453993,0.019245049,0.031496953,0.031346407,-0.020964533,-0.00952285,-0.031542175,-0.026872281,0.03587535,0.018871274,-0.0024439583,0.0034433333,0.0064846645,-0.00065545953,0.088249385,-0.02136512,-0.031754352,-0.05036505,-0.02744978,-0.014882936,0.02248303,0.037551746,0.033318404,0.018265048,0.0081522465,-0.0067083775,0.027932871,-0.010137719,0.023236679,-0.01259932,0.0005003367,-0.07985724,0.06352044,-0.002069222,-0.006651621,-0.034216218,0.012043083,-0.00059968134,0.046025373,0.025768464,-0.0016120842,-0.019257814,-0.027942127,-0.0071480735,0.027697751,-0.10683945,0.015811559,-0.009815447,0.05023197,0.019513039,0.013346556,0.03712078,-0.014284477,0.04485156,0.05774059,-0.02048035,0.023523549,-0.013990942,-0.029123217,0.037511256,-0.036177848,-0.029567698,-0.00040454933,0.04868936,-0.02098366,-0.0037280847,0.005603993,0.02053931,-0.023192836,0.0010540232,-0.018525442,-0.06807115,0.020732906,-0.020683346,-0.015639825,-0.00097645016,0.007038753,-0.038601875,-0.019883832,-0.052060522,0.012834462,0.03522967,0.026349349,-0.03080764,-0.015330647,-0.03250978,0.023168908,0.0075241355,-0.025124276,-0.045348696,0.04419859,0.004312228,-0.020110417,0.0047594393,-0.01740544,-0.022387875,0.030798284,0.049850367,-0.033668432,-0.089988224,0.04280033,-0.029467385,-0.05876358,0.024903093,0.04214378,0.058282007,-0.0006597038,0.017801307,0.00038580797,0.0071680546,-0.04063319,-0.03353425,-0.018755518,-0.02437135,-0.005208604,0.03270773,-0.012970034,0.016760053,0.033105448,-0.042938463,0.048987944,0.026559878,0.05246195,-0.015806671,-0.07626264,0.050149646,-0.028625235,-0.027909482,0.037286818,0.030192692,-0.007790209,0.02814646,0.027132906,0.06458058,-0.08853011,-0.046671513,0.04848319,-0.015871396,0.0075609074,0.0024028302,-0.0017688515,0.034106866,-0.042775117,-0.010444291,-0.08603788,-0.023726964,-0.017592046,-0.02370496,0.025457533,0.00086781895,0.023252273,-0.008519736,0.008006328,0.013087182,-0.036375146,0.015102937,0.024087196,-0.0106720645,0.022758892,-0.04335463,-0.012153034,-0.015683647,0.038874205,-0.002448713,0.0420997,0.02435391,0.027899249,0.018981608,-0.026246767,0.07174705,-0.01636228,0.00012946577,0.029642036]
10	region	Table:region\nDescription:ภูมิภาคการทำงาน\nColumns:\n  region_id          SMALLINT PRIMARY KEY, -- รหัส work region\n  region_description VARCHAR(60) NOT NULL  -- ชื่อ work region เช่น Eastern, Western, Northern, Southern	[0.013789343,0.026086945,-0.015708178,0.005883835,0.014710386,-0.04702552,-0.022853043,-0.02531251,0.052359942,0.031643014,0.019087415,0.01097202,0.10647132,0.061155144,-0.03498388,-0.02302316,0.007047988,-0.0035976863,0.019970728,-0.017463282,0.039612483,-0.03546363,0.020088933,-0.0037789447,0.044515043,-0.028142331,0.0023575784,0.004599231,-0.031114917,0.056777768,0.0058349464,-0.023371305,0.020745067,0.044578865,0.022074271,0.021699518,-0.027184833,-0.014225578,0.0013450481,-0.0320418,0.01936242,0.0107591655,0.018969918,-0.0024077178,0.012549161,-0.02785792,0.053269833,0.029471958,-0.0034401624,-0.0155800395,0.012171865,-0.0019014608,0.042378973,0.026979754,-0.04760969,-0.02872808,0.035997912,0.055124804,-0.038593072,0.0455014,-0.023271622,0.047798973,0.014132735,-0.006877405,0.025290865,-0.02944107,0.0041524526,-0.016404048,-0.05043183,-0.022912316,-0.0112035675,0.008187952,0.11157768,0.0011950199,-0.025033765,-0.0030316778,-0.040059652,0.015379042,-0.008678196,0.016490968,0.058968138,0.013578597,-0.0055996105,0.030995043,-0.0076113557,-0.0039765956,-0.037782438,0.040900104,0.032659005,0.04006227,0.038180143,-0.022974275,-0.04169843,0.08467514,-0.004338053,0.011570402,0.00827176,0.024125163,0.021243373,-0.0016431831,-0.028513085,-0.08329936,-0.003949143,-0.053353485,-0.09344753,-0.04030926,-0.011708628,-0.05183515,0.051706016,-0.012548881,-0.028870724,0.0060438346,0.023309357,-0.029226324,0.044634152,-0.044599853,0.036343183,-0.03391548,-0.0047010947,-0.06745561,-0.014310406,-0.004688733,-0.031754084,-0.021449072,0.035747528,-0.034510065,-0.0093190335,-0.022397747,0.05283884,-0.044525042,-0.0011435786,-0.04294683,0.00024926852,0.043927446,-0.0105116265,0.043338504,0.028726917,0.015943127,-0.0054377634,-0.0002653311,0.045540087,-0.08415441,-0.00844102,0.07653686,0.00121574,-0.07743625,-0.027429512,0.0050347694,-0.0015030738,0.027683714,0.055296563,-0.03650018,-0.028196568,-0.023071112,0.029635482,-0.0051523214,-0.032881666,-0.017295532,0.02599719,0.021653825,0.024176663,0.0007664012,0.0062328377,-0.021238286,0.022675056,-0.025938384,-0.011604349,0.020818483,-0.059644997,-0.040584587,0.00941316,-0.052636493,-0.06963634,0.03641571,-0.039704178,0.0017965207,-0.016298896,-0.04192356,-0.017914059,-0.06250549,-0.03797125,-0.030611733,-0.04813274,0.025358563,0.015715273,0.004105745,-0.018031633,-0.02498958,0.030482905,0.0012975134,-0.015450854,0.07166343,0.0018566452,0.049940914,0.016781723,0.011190172,0.025292024,-0.01467254,0.019095467,-0.057010483,0.015868394,-0.017923785,-0.0007998434,-0.0028411401,0.012454255,-0.068121165,-0.012357311,0.0635258,0.013418335,0.040201202,-0.034496173,0.033269595,-0.00723606,0.015241356,-0.025398348,-0.06388101,0.0077771866,0.018811658,-0.035965357,0.058190174,0.037664786,-0.047568873,0.07618183,0.026349977,-0.0017270984,0.0120286625,0.017305808,-0.008154778,0.017609281,0.03582586,0.019039286,0.07620908,-0.026308922,0.005037368,-0.0061362446,-0.05354927,0.055944454,-0.011141756,-0.024951916,-0.10945438,-0.020856544,0.010112615,0.00062651327,-0.046174675,0.026828323,-0.043711536,-0.041812938,0.041055966,-0.0639928,0.04347842,0.022530071,-0.031581905,0.023500113,0.0035674858,-0.0031944055,-0.006640467,-0.031194635,0.006101563,0.024084093,-0.015467783,0.0075323707,-0.027007805,0.013541359,-0.044425163,0.003419285,0.022533374,0.0107598,-0.040762983,-0.05272952,0.009731017,0.018923553,-0.022391075,-0.030787135,0.019295372,-0.0032986263,-0.0042662453,-0.05969002,0.028080933,0.0057556964,-0.039254725,-0.040047027,0.04601484,-0.057671193,-0.030842373,-0.05652354,0.012164412,-0.035363585,0.010293304,-0.025018204,0.01046336,0.025643127,0.061068013,0.0014417917,0.04497856,0.04300634,0.020597745,0.03325735,0.011881179,-0.024859682,-0.012597845,-0.024674455,-0.01751746,0.02425553,-0.060636394,-0.0042993734,0.024794767,0.09654571,0.014722888,-0.011065844,0.04493811,-0.016949879,-0.016362991,-0.03257326,0.05092135,0.041453257,-0.09195184,0.0065509574,0.07743421,0.0003120901,0.024972878,-0.05837181,0.041012123,-0.008108817,-0.085842386,0.04946989,-0.021726454,0.03043382,-0.00796638,0.0678333,0.032353804,-0.020034198,0.014203595,0.003020314,0.03817769,-0.046147056,0.0028175465,-0.044771455,-0.04968333,0.09373996,0.007583338,-0.024296498,0.038046505,0.011630492,-0.018013276,0.050004363,-0.07649157,-0.016868917,-0.05257042,-0.04667318,0.012535974,0.025315851,-0.057422478,0.020651856,0.0218914,-0.019878304,-0.008444633,-0.0015729293,-0.007108461,-0.04037378,-0.039465602,-0.01463962,0.015270033,-0.009163847,0.0215572,0.02485956,0.010080418,-0.057716023,-0.014901155,0.004165093,0.01201401,0.09090527,0.018115317,-0.045358863,-0.0035726302,0.055659283,-0.0067797177,0.038818665,-0.072434686,0.017514661,0.057066444,0.037488345,0.06646205,0.027645014,0.017645516,-0.010438073,-0.015908431,0.015251979,-0.051640727,0.028200896,0.013009918,0.026530396,0.01575537,0.0066625737,0.049422912,0.03343973,-0.023646027,0.03423404,-0.020839192,0.022928776,-0.03698727,0.017480636,0.04287606,0.00053128396,0.061613586,0.057547674,0.017025974,-0.011160284,0.034170147,0.00076531805,-0.03317283,0.034951102,-0.019875363,0.03013141,-0.008030912,0.03528785,-0.012091056,0.0063155866,0.05106061,0.026543807,0.020452809,-0.0593449,0.027316704,0.032495845,0.02018773,0.020590212,-0.09229484,-0.0106385695,-0.009933449,-0.020314187,-0.03940752,0.008792413,-0.01831618,0.011882367,-0.025777582,0.031233214,-0.0616309,0.024848986,-0.00050694443,-0.018431742,0.011055535,0.0049214093,-0.045179896,0.01956983,-0.020717446,-0.0047547338,-0.012037362,-0.019034712,0.015017149,-0.020890472,-0.043585192,-0.006731008,-0.020019533,-0.0042545935,-0.014033687,0.06329736,-0.039261952,0.036592044,-0.019800577,0.00047705523,-0.11615136,0.052458417,0.04183346,-0.0085921865,-0.015884167,-0.037252557,-0.07604905,0.0056337123,-0.031356364,0.027003333,-0.014398341,-0.039928365,-0.03464825,0.01147674,0.0339948,0.020186502,0.034367055,0.005516667,-0.0027320602,0.041820154,-0.027043298,0.025511539,-0.026878508,0.012599422,0.016501075,0.01606304,0.052889828,-0.08657373,0.058842886,0.062367465,-0.008651389,-0.020071704,0.034167044,0.052511588,0.007303687,0.026771285,0.05203853,0.009196999,-0.07338196,0.014784466,0.041357763,0.0012775152,-0.03183056,-0.03729013,0.011093152,-0.027075207,0.015066856,-0.030516354,0.066949375,0.01931912,-0.039656356,0.109681584,0.012964252,-0.009509476,-0.048942886,0.05518185,0.038443416,-0.026871828,0.024947584,0.019161332,-0.015285769,0.0018029475,0.015298084,-0.030529186,-0.016637364,0.02070808,-0.002944422,0.008907518,-0.05970424,0.042785976,-0.02912478,0.033487033,-0.07394881,0.042881645,-0.107424475,-0.04641389,0.055172693,0.013800567,-0.015931781,0.014105851,-0.035552185,-0.031275865,-0.030082338,0.016993387,-0.036659844,0.00657386,-0.01637956,-0.005672592,-0.032482266,-0.0050629643,-0.043235518,0.059378315,-0.0049829856,-0.012736566,0.068536505,-0.037738882,0.0292475,0.006668061,0.018963955,0.023970542,-0.0138079785,0.01908221,-0.0036214197,-0.00351675,0.04196917,0.0017100163,-0.011284318,0.01480287,-0.02021588,-0.019055126,0.07393617,-0.055958446,0.027291505,0.029595248,-0.006445664,0.045938574,0.048679136,-0.020497492,0.00028386037,0.034920048,-0.09231597,-0.0708462,0.0030121077,0.015580091,0.02310987,0.021652913,0.016838875,0.01696762,0.023171842,-0.1974727,0.0058751525,-0.03370771,-0.020960947,-0.007998024,0.030024689,0.046093684,-0.00089509535,0.0070462623,0.018224774,0.017642146,-0.026459375,-0.005463155,0.0026358773,-0.030732514,0.029463861,0.004965102,-0.017863324,0.012220295,0.016853932,0.010077111,0.045825403,-0.0339382,-0.011373028,-0.044712428,-0.012764838,-0.0130767,-4.886598e-05,0.0152375335,0.018506896,0.020092858,0.019620543,0.012418181,0.014347102,-0.022400057,-0.026334073,-0.020261874,0.010309109,-0.03370848,0.03225905,0.025085682,-0.013512822,-0.025577987,0.015010808,0.0063254093,0.023858221,0.027175311,-0.00017863608,-0.04721286,0.005681574,-0.005671889,-0.011265339,-0.11338703,-0.012485425,-0.01669447,0.047357056,0.027338581,0.019814335,0.033957068,-0.0009275148,0.048023287,0.07873635,-0.021648062,0.02372147,-0.027867708,-0.009814682,0.033302084,-0.060209546,-0.046321712,-0.015717896,0.028936664,-0.017265543,-0.012520841,0.0047963895,0.031782757,-0.03535147,0.017469224,-0.022000229,-0.063569106,0.01696196,-0.012367214,-0.015152696,0.00044254784,0.015183458,-0.022444893,-0.0072692814,-0.03647341,0.0020205453,0.03144877,0.017099421,-0.026384655,-0.048497315,-0.010062689,0.005955841,0.03749715,-0.03396697,-0.03823719,0.03680381,-0.020178396,-0.025597313,0.0018288278,-0.006775594,-0.019275276,0.0143136885,0.08236774,-0.07104187,-0.108383164,0.0041511576,-0.0217276,-0.05809506,0.048158232,0.029134016,0.060744964,0.0011362798,0.021715317,0.01564933,0.047690883,-0.037723888,-0.045525067,-0.057479613,-0.023354417,-0.023547154,-0.0063446686,0.0018277732,0.057597756,0.026018383,-0.047637496,0.022936575,0.018138409,0.045545325,0.0014078433,-0.056792773,0.0443655,-0.04295134,-0.043821998,0.034805905,0.028318163,-0.006993401,0.011206406,0.010849244,0.08248945,-0.064951584,-0.05419367,0.05623747,-0.010087053,0.014331652,0.0059923707,-0.010153709,-0.005417176,-0.03325099,0.0028985422,-0.08275425,-0.001989031,-0.020347979,-0.042689558,0.0114304535,0.02749714,0.034144524,-0.005109222,0.04437217,0.006957107,-0.014954853,0.025438707,0.01990348,0.008537225,0.012856706,-0.023562277,-0.04113582,-0.005564672,0.04184418,-0.035265222,0.020769633,0.01663451,0.021476349,0.0206764,-0.012297635,0.059424333,-0.035323016,-0.021408277,0.043542095]
11	shippers	Table:shippers\nDescription:ข้อมูลบริษัทขนส่งที่ใช้จัดส่งสินค้าให้ลูกค้า (ใช้เป็น FK ใน orders.ship_via)\nColumns:\n  shipper_id   SMALLINT PRIMARY KEY, -- รหัส shipper (ใช้เป็น FK ใน orders.ship_via)\n  company_name VARCHAR(40) NOT NULL, -- ชื่อบริษัทขนส่ง\n  phone        VARCHAR(24)           -- เบอร์โทรศัพท์บริษัทขนส่ง	[0.038478192,0.043237485,-0.037682507,0.02022762,0.018635748,-0.024429737,-0.018000972,-0.026705837,0.03780057,0.0016553347,0.016414393,0.013296961,0.12021963,0.043333825,-0.018204985,-0.03143872,0.0116968015,-0.026438907,0.030598799,-0.0041665654,0.06164658,-0.030998437,0.041916452,0.0048823217,0.023708036,-0.033068374,-0.019746466,0.00665773,-0.061842967,0.064846635,0.00910054,-0.042720832,0.0059455764,0.022754025,0.0048282333,0.012880418,0.00045823184,-0.013289279,-0.015487925,0.0055696913,0.0056656096,0.0084104575,0.042342935,-0.032628704,0.04105676,-0.02155207,0.041877203,-0.013332847,-0.040566802,-0.008828215,0.009466886,0.02351792,0.040873386,0.03730767,-0.053275026,-0.0042883283,0.0139017105,0.02347376,-0.033932213,0.031007042,0.018175516,0.035474222,0.00038745248,0.046092335,0.026942763,-0.060426883,0.0022652938,-0.016154148,-0.03702198,-0.030684432,0.016609611,0.0016388678,0.109251216,0.0096924,-0.02340265,-0.005488443,-0.036460888,0.033127397,-0.015257514,0.025191622,0.04948581,0.03953403,-0.0027923912,0.019969659,-0.029738287,-0.008172825,-0.019971704,0.044531733,0.0406922,0.04292231,0.03229098,-0.03873818,-0.050966375,0.04684537,0.0066325017,0.008410225,0.015838936,-0.0037874996,0.007987309,-0.0112830885,-0.009917331,-0.08142273,-0.023176484,-0.05470964,-0.08055663,-0.015457028,-0.011335646,-0.053968932,0.05025933,-0.049603045,-0.030099148,0.016659062,0.035014212,-0.03980529,0.0030018121,-0.043649375,0.068645746,-0.0573167,0.030500662,-0.062450945,0.008101678,0.023371639,-0.03380643,-0.02130552,0.028358715,-0.046446957,-0.006015085,-0.039715588,0.048105337,-0.066234194,-0.017811783,-0.0456491,-0.0031166044,0.039922494,-0.011821794,0.06170828,0.013400904,0.0077945525,-0.015921703,0.0191913,0.035742022,-0.04920009,0.00961045,0.053685654,0.016705366,-0.06547258,-0.023726866,0.021451058,-0.007652312,0.03145783,0.039633397,-0.036459256,-0.025466232,-0.021825412,0.0040715365,0.005843865,-0.020199485,0.012637711,0.008213763,0.013777783,0.019719252,-0.009266361,0.005178336,-0.029815502,0.039163366,-0.02671666,-0.0035112707,0.030878397,-0.049172904,-0.0118040135,0.0077541047,-0.036120053,-0.08114313,0.024156751,-0.007731195,-0.032178093,-0.04085698,-0.027308758,-0.014253919,-0.061204974,-0.037809826,-0.016437903,-0.044318892,0.026696663,0.0058858832,-0.025962494,0.004620142,-0.00046030193,0.040830754,0.007971112,-0.0026936654,0.07525434,0.01611675,0.042025182,0.020862069,0.013830548,0.024244659,0.012911686,0.0146664195,-0.062426124,0.026721051,-0.0021968205,0.00063403795,0.008357868,0.0045911283,-0.037203833,-0.014748937,0.06748868,0.0178952,0.039727423,-0.019516984,0.026809871,-0.049330283,0.012250982,0.0024197635,-0.07588887,0.019561866,0.03961844,-0.033002105,0.0650128,0.0035836126,-0.028981274,0.05893437,0.041432135,-0.014918112,0.018103538,0.032952443,-0.022973837,0.02464302,0.034992594,0.007505855,0.08207871,0.0068318495,0.02032015,0.0038166528,-0.04128519,0.042588025,-0.009023758,-0.021695895,-0.11279773,-0.04300553,-0.0021746359,0.002204457,-0.040685024,0.039537128,-0.06454861,-0.030899953,0.021337125,-0.06997395,0.03539218,0.013339626,-0.07979574,0.04318198,0.0069535426,0.0053561176,-0.012482278,-0.02839649,-0.00055280386,0.039043225,0.0034582422,0.018185169,-0.03845585,0.020171776,-0.025930094,0.010643766,0.024579333,0.018773694,-0.025067965,-0.025615292,0.005681199,0.0122376885,-0.027668808,-0.038029455,0.013637544,0.0119412225,-0.008988731,-0.03537908,0.017893681,0.016404409,-0.026342947,-0.045828488,0.028651206,-0.045231786,-0.012380803,-0.03745329,0.004060805,-0.058428258,0.0022854607,-0.029352013,-0.018173493,0.03450242,0.056632835,-0.0033125712,0.0032066524,0.030350938,0.045028873,0.056172505,-0.0030519634,-0.02117214,-0.001120671,-0.029877594,-0.011926536,0.022266474,-0.061701436,0.0032065557,0.01737475,0.10459136,-0.017012233,-0.043065745,0.04120871,-0.018036082,-0.020049902,-0.013980612,0.044805508,0.04749066,-0.07087769,0.0054055173,0.09107109,-0.0034079084,0.02070162,-0.039045773,0.00700206,-0.025761412,-0.07952577,0.025632609,-0.055397462,0.015664335,-0.0131028015,0.04098424,0.02469744,-0.024373643,0.02296169,0.028968524,0.027854579,-0.041560765,0.028958598,-0.043752957,-0.02883813,0.067200266,0.0029309376,-0.016966166,0.045551453,0.052782968,0.006849056,0.042621512,-0.056304626,-0.024262007,-0.040953018,-0.040930387,0.04576409,0.041153584,-0.055930603,0.019121397,-0.008191176,-0.060909797,-0.0006506574,0.0058309645,-0.012761269,-0.02004796,-0.024482697,-0.020768728,0.031079173,0.010700073,0.0021852148,0.01881997,0.05384485,-0.049020696,-0.02683418,-0.0031741515,-0.004543924,0.10868036,0.016231306,-0.060432088,-0.0022863126,0.04793376,-0.03828707,0.024213297,-0.06069806,0.013375057,0.010309849,0.03526068,0.033820592,0.03625019,0.036571294,0.015434954,0.030011497,0.017085044,-0.0355772,0.038686726,-0.0035616122,0.02934207,-0.0050391555,0.011040941,0.04016146,0.034674954,-0.011938909,0.015682153,-0.008530521,0.00064345787,-0.03533669,0.033241447,0.020786349,0.023214841,0.050216086,0.043352097,0.016385833,-0.016868867,0.025161337,-0.012659102,-0.027602114,0.050558113,-0.019105751,0.047171842,-0.01742903,0.020999394,-0.047029182,-0.00044679004,0.03989348,0.035879392,-0.0031960127,-0.070396565,0.034232732,0.03640168,0.016648889,0.012870588,-0.07128321,-0.0014653578,-0.012687397,-0.03000019,-0.027232775,0.0023385254,-0.006762014,0.01701105,-0.0018826461,-0.010940603,-0.041417565,0.028383078,0.004449924,-0.03578396,0.037298266,0.0007157492,-0.015063447,0.016930485,-0.019100834,-0.0077889543,-0.013454501,-0.041557185,0.002292527,-0.008958953,-0.010434608,0.016217308,-0.023860944,0.003118346,-0.012022795,0.042741526,-0.063523784,0.07600918,-0.043081794,0.008018308,-0.113801956,0.045798775,0.051056035,-0.013127677,-0.01397926,-0.015157334,-0.05884178,0.021477988,-0.011530781,0.012165389,-0.023358261,-0.05060824,-0.031398963,0.011216189,0.03689517,0.0012445722,0.04325564,0.012202256,0.02250528,0.021575108,-0.030573588,0.0029886328,-0.035287283,-0.024978211,0.011493468,0.018680833,0.036218144,-0.09273222,0.04989779,0.021004163,-0.024837969,-0.0064708446,0.045847006,0.05576208,-0.0017827206,0.0047150296,0.057754308,-0.014938182,-0.05951528,0.021999191,0.040563583,-0.008702344,-0.017943697,-0.053862862,-0.011267941,-0.035892334,0.02650954,-0.028353646,0.05731022,0.043490328,-0.011843678,0.101402305,-0.020110855,-0.027656611,-0.028471323,0.029179735,-0.014838597,-0.044095907,0.021666998,0.021231089,-0.013421945,0.0060279113,0.025184246,-0.06373563,-0.003913469,0.013928054,-0.042676196,-0.009508038,-0.036144443,0.036357917,-0.013592888,-0.004408278,-0.0491546,0.046201937,-0.083051,-0.06980387,0.025600642,0.0042374767,-0.0082818335,0.038767103,-0.036236234,-0.01422203,-0.011223835,0.008639446,-0.058129538,0.014931726,-0.01774178,0.008813177,-0.026718307,0.015321748,-0.010788894,0.051964026,0.0044368166,-0.02300602,0.033073228,-0.03885282,0.040116798,0.0020995487,0.037685152,0.028369885,-0.014263217,0.03822105,-0.027979258,0.010314995,0.057011075,0.010659633,0.030770212,0.011086546,-0.022268226,-0.033760186,0.058245774,-0.06142469,0.009665015,0.017406892,-0.017229887,0.071106896,0.037546575,-0.003524639,-0.019999376,0.02962849,-0.06483724,-0.088184334,-0.04866405,0.018579606,0.04163719,0.026773388,0.0076000607,0.04138963,0.037893705,-0.20311566,0.025677621,-0.029274646,-0.018257048,-0.017062668,-0.0010845026,0.029777873,-0.025475085,0.0026181152,0.026794393,0.027853563,-0.04348244,-0.0034130407,-0.015589165,-0.061256178,0.050171234,-0.008566954,-0.03375476,0.014694451,0.01193487,0.012478858,0.061737344,-0.03479193,-0.0077761444,-0.049952213,-0.037825096,-0.005423262,0.013768787,0.013127257,0.026794203,-0.0019447483,-0.0032213237,0.005955237,0.020770723,-0.027216325,-0.014548654,-0.01582002,-0.00030782336,-0.062298648,0.040136162,0.0020239274,-0.0058750752,-0.015920175,0.022466835,0.025286086,0.048326787,0.04032782,-0.003395766,-0.047302704,-0.0019106115,0.009921655,0.021247149,-0.11706883,0.023740865,-0.00020346494,0.05996193,0.02156361,0.027336907,0.054320797,0.008114804,0.07867069,0.071821466,-0.025064593,0.03262585,-0.0039085555,0.004493849,0.04116403,-0.05033817,-0.031084904,-0.002637242,0.0502785,-0.023793532,-0.009332891,0.0021209912,0.028998021,-0.050436802,0.0074837613,-0.040206216,-0.05673147,0.043394156,-0.0063730176,-0.0060607693,-0.010935482,0.012926456,-0.04764632,-0.025309434,-0.054300178,0.01814744,0.04758657,-0.005458606,-0.028826825,-0.026577344,-0.0064930716,0.00933282,0.043493703,-0.037158865,-0.013612533,0.014170612,-0.005789558,-0.032737713,0.015745778,-0.023393052,-0.015058988,0.018487873,0.06432421,-0.028450113,-0.100197084,0.03145209,-0.026608499,-0.05442934,0.0525576,0.035972662,0.05665494,-0.03133343,0.01867805,0.004716049,0.025220074,-0.065284505,-0.04355783,-0.037398774,-0.04695781,-0.0075658592,0.012256802,-0.028210713,0.007533144,0.021957966,-0.03417677,0.035013914,0.011327047,0.018001707,0.0025305334,-0.072472855,0.048074998,-0.030480416,-0.01915873,0.050214536,0.013675807,-0.0035106228,0.005357422,0.014052647,0.070592746,-0.0760078,-0.054564793,0.030647814,-0.01207011,0.024736492,0.029363265,0.00244927,-0.008547821,-0.060519356,-0.008413165,-0.07366093,-0.007852849,-0.018530663,-0.021870676,0.017747693,0.026473962,0.02692867,-0.035011914,0.027808959,0.0039179535,-0.025913965,-0.00073566946,0.02029016,-0.00031686507,0.021937048,-0.050731115,-0.0119336145,0.011683214,0.041887715,-0.021254698,0.028213618,0.05031527,0.02778166,0.012877757,-0.0424153,0.097981654,-0.03272738,-0.00031596786,0.043330114]
12	suppliers	Table:suppliers\nDescription:ข้อมูล supplier ที่จัดหาสินค้าให้กับบริษัท\nColumns:\n  supplier_id   SMALLINT PRIMARY KEY,  -- รหัส supplier\n  company_name  VARCHAR(40) NOT NULL,  -- ชื่อบริษัท supplier\n  contact_name  VARCHAR(30),           -- ชื่อผู้ติดต่อ\n  contact_title VARCHAR(30),           -- ตำแหน่งผู้ติดต่อ\n  address       VARCHAR(60),           -- ที่อยู่บริษัท supplier\n  city          VARCHAR(15),           -- เมืองที่ตั้งบริษัท supplier\n  region        VARCHAR(15),           -- ภูมิภาคที่ตั้งบริษัท supplier (ที่อยู่จริง ไม่ใช่ work region)\n  postal_code   VARCHAR(10),           -- รหัสไปรษณีย์ supplier\n  country       VARCHAR(15),           -- ประเทศที่ตั้งบริษัท supplier\n  phone         VARCHAR(24),           -- เบอร์โทรศัพท์ supplier\n  fax           VARCHAR(24),           -- เบอร์แฟกซ์ supplier\n  homepage      TEXT                   -- เว็บไซต์ supplier	[0.034439404,0.018106379,-0.039905556,-0.0016617951,0.03653163,-0.033821378,-0.023084147,-0.029947763,0.046769112,0.0085494695,0.020776376,0.0061735134,0.11516899,0.04582103,-0.02884001,-0.03931849,0.028007107,-0.028729025,0.018746417,0.00039116613,0.05522717,-0.020334251,0.032813173,-0.019361744,0.008462616,-0.02034425,-0.028489176,0.017865812,-0.03824504,0.05637175,0.023040526,-0.05572221,0.0045520347,0.05221548,0.021058816,0.012887366,-0.003870333,-0.0061438684,0.0012655221,-0.009277358,0.009144893,0.00056393066,0.025239402,-0.0050670295,0.027596997,-0.019683572,0.048098315,-0.0107873725,-0.0110653965,-0.016186403,0.020680463,0.021702837,0.038843714,0.0191999,-0.025802234,-0.018788448,0.02662022,0.04860808,-0.020360919,0.025474483,-0.00856538,0.03707977,-0.010589587,0.028951978,0.021228088,-0.040998727,0.021591095,-0.014394795,-0.052887756,-0.045255672,-0.012478758,0.03601807,0.10481128,0.0010041349,-0.04229632,-0.0080152955,-0.04497145,0.020580474,-0.002002604,0.03398283,0.03484627,0.03225395,0.0063977544,0.02616211,-0.015198472,-0.016757263,-0.0021192334,0.052029748,0.0408024,0.047702055,0.022913322,-0.032388147,-0.05079748,0.043014865,-0.008264002,0.012533038,0.032209586,0.012971775,0.031809814,-0.055315994,-0.03771156,-0.08501088,-0.02447981,-0.06345415,-0.1046808,-0.023482006,-0.030100128,-0.06737772,0.054253943,-0.047749914,-0.030354831,0.016990392,0.024262827,-0.037045013,0.03889172,-0.04284412,0.057915784,-0.06291551,0.011308869,-0.04302728,-0.026172323,0.015969351,-0.03766792,0.0017667831,0.044569783,-0.020182636,-0.015095739,-0.03706792,0.037454333,-0.049183793,-0.015506146,-0.052179247,-0.012182883,0.032765917,0.008557243,0.055900913,0.0237374,-0.017964909,-0.007965312,-0.0015591262,0.03466433,-0.06943458,-0.0026876782,0.05785051,0.011797092,-0.07218287,-0.0091653215,0.0063904393,-0.002700578,0.0053765792,0.05912615,-0.04591276,-0.030293593,-0.028395426,-0.0068584452,0.013229702,-0.02574324,-0.014533558,0.009622866,0.037183348,0.020221565,-0.011159295,0.028187802,-0.041270785,0.047055434,-0.002310785,0.0024577524,0.02456798,-0.049520474,-0.012423592,0.012180146,-0.036088143,-0.07652624,0.014192839,-0.026708992,-0.01020345,-0.039187856,-0.027529258,-0.006009626,-0.05350666,-0.040692795,-0.017741356,-0.0461859,0.03087891,0.0012335834,-0.035339776,0.014682634,-0.015958969,0.02039547,0.0039683008,-0.01866174,0.04984406,-0.0015547879,0.052647594,0.027313644,0.007541942,0.023179304,-0.0004551828,0.01416402,-0.06013354,0.026028777,-0.008550636,0.015154438,-0.0034777645,-0.010518126,-0.07169281,-0.04378691,0.06748057,-0.008934817,0.054044697,-0.025282456,0.029004335,-0.021982692,0.023681993,-0.032501455,-0.056461815,0.016765473,0.011092008,-0.037126515,0.055989508,0.020587044,-0.04369065,0.07080977,0.03334491,0.006049508,0.019262122,0.023056556,-0.0058449395,0.035864167,0.047596768,0.019218579,0.076306365,-0.015917158,0.016737029,-0.0140636405,-0.016136777,0.026210785,-0.01099106,-0.0074823494,-0.101652786,-0.03167328,0.006310688,0.001639335,-0.034634884,-0.0017271296,-0.05763486,-0.060770698,0.031070331,-0.043911383,0.041861683,0.025302198,-0.07218811,0.029180424,-0.010541848,0.024552153,0.0038045857,-0.03659383,0.008379374,0.054823592,-0.004192234,0.007726922,-0.019319054,0.0076679178,-0.030256826,0.02251364,0.03452875,0.003744537,-0.018810345,-0.04124876,-0.008583514,0.012913994,-0.04102568,-0.022386057,0.0093174195,0.005866009,-0.04897678,-0.033988576,0.017634459,0.0070772963,-0.032796577,-0.030978179,0.03672266,-0.029525004,-0.020191973,-0.03952559,0.022974497,-0.040784735,0.0032800518,-0.039338432,-0.010327087,0.045009527,0.06491952,-0.0013780954,0.019997522,0.039173804,0.0069820285,0.03753753,-0.0037694052,-0.04937791,-0.018586177,-0.05625826,-0.016683845,0.023780398,-0.054855324,-0.00095385365,0.016869206,0.11138554,0.0020886026,-0.017776309,0.04095029,-0.029925374,-0.010297511,-0.019245232,0.04149115,0.039903373,-0.06506809,0.01918989,0.06829716,-0.0011202117,0.043171927,-0.019509394,0.01576666,-0.03937861,-0.08575107,0.039439827,-0.037919722,0.034588214,-0.011217558,0.04516835,0.036963042,-0.013699258,0.031702593,0.019358426,0.029935526,-0.059881203,0.020446178,-0.041887265,-0.04530683,0.068866,0.019801838,-0.02151996,0.037829038,0.044975366,-0.02636246,0.05974016,-0.092649154,-0.0032234716,-0.05472331,-0.059679005,0.016168024,0.03438533,-0.041239683,0.032821942,0.009426882,-0.030740881,-0.013095596,0.016047968,-0.003942504,-0.03412608,-0.02077462,-0.025364961,0.004319743,0.017062427,0.0075540454,0.025986752,0.04578294,-0.022965336,-0.015641145,-0.0036434943,0.006313735,0.083652325,0.028324693,-0.032434095,0.015323812,0.03727474,-0.007761936,0.01810659,-0.07639064,0.006369508,0.010026984,0.061025564,0.028391717,0.04765684,0.028698642,-0.02114033,-0.005373931,0.018530825,-0.050832298,0.025418023,0.02670939,0.048562907,0.0024426922,0.01571928,0.007853726,0.016086113,-0.0005233639,0.035900243,-0.005046395,0.031032536,-0.011180389,0.024422335,0.017853826,0.03650115,0.06410172,0.03273234,0.030266697,-0.015403288,0.03157972,0.004934955,-0.022321569,0.037859958,-0.013956647,0.047498785,-0.019096054,0.012621912,-0.031769354,-0.005519152,0.0372962,-0.009874461,0.0007808206,-0.064141534,0.03204479,0.017638197,0.0117802825,0.013742571,-0.075155474,-0.008667454,-0.0005952951,-0.009397243,-0.029829066,-0.0097010955,-0.02155758,0.02676552,-0.013201307,0.004731751,-0.03359722,0.037156682,0.02862304,-0.02118106,0.045508746,-0.022168566,-0.026880123,0.018159188,-0.02366718,-0.025520595,0.0011730881,-0.017688343,0.00053081964,-0.015810793,-0.0025481759,0.008375637,-0.020343924,0.012551854,-0.0043626744,0.046220005,-0.06359137,0.06680853,-0.020690788,0.008409799,-0.13033833,0.023385243,0.048750054,-0.010891394,-0.029314462,-0.016305953,-0.07417154,0.00031326484,-0.0075707478,0.05372942,-0.009604191,-0.013052943,-0.02032705,0.009491087,0.020219967,0.01604675,0.052668,-0.01661417,0.02544403,0.006896452,-0.028398525,0.00089627405,-0.026839735,-0.003950623,-0.0149356425,0.02206336,0.028492311,-0.0872983,0.062224146,0.021732556,-0.013832607,-0.028616851,0.037676826,0.036779117,0.012225416,0.0063804933,0.04625622,0.0027239805,-0.07213323,0.032649487,0.047391433,-0.02655552,-0.044834103,-0.058312714,0.016969075,-0.029914882,0.01833744,-0.0008770297,0.06413107,0.05311457,-0.05507207,0.11445815,-0.0095532015,-0.010872917,-0.022829527,0.038451508,0.0040532975,-0.0336623,0.029225016,0.023647351,-0.009498873,-0.00065949693,0.03413689,-0.058287043,0.0012557872,0.016535394,-0.03982442,0.013844109,-0.053016126,0.047164794,-0.023229413,0.012760378,-0.046887945,0.039537515,-0.08200187,-0.059113454,0.04302489,-0.013228454,-0.034108866,0.05255756,-0.038271986,-0.026076134,-0.015457408,0.0020774985,-0.045048147,0.02152135,-0.013051813,0.035261177,-0.03812746,0.006787986,-0.012514307,0.04247392,0.011982636,-0.03714703,0.062304284,-0.051507164,0.05047572,0.009249909,0.022311652,0.010198144,-0.015469714,0.029414479,-0.007328064,0.0059581813,0.05937143,0.0044453046,0.014976698,0.031031078,-0.021536516,-0.028966038,0.053790413,-0.04784504,0.015600463,0.05724129,-0.035023205,0.057342786,0.048077703,0.0011105945,-0.0076212212,0.00032037593,-0.054782342,-0.068265595,-0.020630082,0.028296018,0.03951807,0.019336767,0.014788955,0.03122005,0.0205199,-0.23226158,0.030831747,-0.022465412,-0.02885161,-0.013148038,0.0037476583,0.03877978,-0.024262968,0.004454552,0.031133944,0.041700665,-0.026462957,-0.019319689,-0.005548513,-0.03797855,0.036032315,0.011243605,-0.045389134,0.026568128,-0.0031817565,0.0042294133,0.06891742,-0.05144193,-0.019418465,-0.041723598,-0.021847619,-0.013579021,-0.0019160948,0.00938822,0.024484782,0.003319895,-0.0030984788,0.012694853,0.04060711,-0.02269335,0.010163806,-0.01850877,-0.0016252242,-0.0678666,0.05148647,0.004708999,-0.0044756723,-0.03980207,0.004042173,0.02287359,0.057724766,0.032387972,-0.016207354,-0.03185621,-0.019178582,0.011918679,0.030133212,-0.106857166,0.023117548,-0.013439969,0.05258129,0.009217992,0.010173485,0.05541875,0.004550734,0.058740154,0.0768107,-0.025289308,0.02477616,-0.029651193,-0.01942339,0.029009469,-0.040049654,-0.037458953,0.012717146,0.03821193,-0.014903587,-0.01614447,0.0057292813,0.031621587,-0.03339997,0.0094027,-0.037121013,-0.06932206,0.02789055,-0.02161966,-0.023039943,0.0033721523,0.01333554,-0.033380486,-0.014072788,-0.042827617,-0.0039054737,0.050034266,0.022214655,-0.023993118,-0.015580187,-0.018050922,0.020696457,0.018607965,-0.03581062,-0.03337024,0.03256102,-0.013946588,-0.025012095,-0.007843855,-0.008964657,-0.03905302,0.029019983,0.06282116,-0.02370176,-0.10292882,0.03364322,-0.025279826,-0.045552462,0.042174764,0.04089467,0.07705965,-0.007829564,0.018327927,-0.0014085472,0.0369366,-0.04091275,-0.039952133,-0.02156207,-0.03594746,0.0075710393,0.02518513,-0.020299913,0.018176893,0.019783376,-0.0459537,0.03917813,-0.00025579784,0.036014643,-0.015518778,-0.04262746,0.047027692,-0.012676846,-0.028950406,0.03127403,0.02001952,-0.006122404,0.0069963885,0.013346789,0.06751622,-0.06923682,-0.05889194,0.038198404,-0.008723549,0.017227031,-0.0051050805,-0.0029719837,0.011073893,-0.052926783,0.0008884572,-0.0901142,-0.02941583,-0.01621748,-0.036640048,0.020673363,-0.00068868924,0.030616853,-0.026567264,0.014329368,-0.0034191913,-0.018685257,0.013850721,0.0059763463,-0.0063552745,0.0123884715,-0.036630448,-0.019036576,-0.0022938019,0.026077377,-0.015671812,0.03968292,0.035513286,0.03059325,0.016203605,-0.0272018,0.07811734,-0.028765135,-0.005602153,0.04890691]
13	territories	Table:territories\nDescription:พื้นที่รับผิดชอบการขาย (sales territory) เช่น Boston, Atlanta\ncolumns:\n  territory_id          VARCHAR(20) PRIMARY KEY,                       -- รหัส territory(พื้นที่รับผิดชอบการขาย)\n  territory_description VARCHAR(60) NOT NULL,                          -- ชื่อ territory เช่น Boston, Atlanta\n  region_id             SMALLINT NOT NULL REFERENCES region(region_id) -- FK → region: work region ที่ territory นี้สังกัด	[0.008792253,0.02706848,-0.0026050042,-0.011680164,0.017574647,-0.03135315,-0.020780237,-0.023772592,0.03790368,0.017779151,0.044001196,0.009188858,0.121275164,0.037433855,-0.03716381,-0.022903735,-0.00019327205,-0.0011943447,0.000450468,-0.020187477,0.008548778,-0.033949517,0.03996728,-0.012744785,0.02027173,-0.025011847,0.0024832038,0.028734721,-0.013266248,0.05749663,0.015383355,-0.036370385,0.007997267,0.036052912,0.0074612224,0.0027393696,-0.022903742,-0.004955703,0.015623668,-0.0041664834,0.010021942,-0.008830975,0.027229322,-0.030786708,0.012081464,-0.028331563,0.03643409,0.013999638,-0.01797585,-0.008981542,0.039372135,0.0005076055,0.040248964,0.029882764,-0.046457652,-0.038838502,0.03976137,0.026607366,-0.05056662,0.05241739,-0.003392056,0.04524617,-0.0017176054,0.028040268,0.024030033,-0.023185765,0.031488653,-0.01883858,-0.047200568,-0.022618745,-0.0037004699,0.0035943016,0.11196982,0.004335024,-0.02093092,0.0024910502,-0.061192784,0.0040371134,-0.004185368,0.017955042,0.050722055,0.0028259754,-0.016789116,0.029565532,-0.00825714,0.019503413,-0.021874787,0.04498945,0.036557518,0.042332143,0.0370833,-0.03990842,-0.045313165,0.05562423,-0.0048408667,0.021263514,0.011893643,0.015121815,0.024814432,-0.028197719,-0.017658437,-0.059396543,0.008662181,-0.030073518,-0.08299677,-0.019861335,-0.030160794,-0.04922181,0.053445555,-0.004760058,-0.051460885,0.0136000505,0.051895514,-0.018560665,0.038864944,-0.046583574,0.04400151,-0.039099615,-0.012606816,-0.059020974,0.0040923576,0.012922009,-0.032034874,-0.047530685,0.04204939,-0.032599904,-0.016762093,-0.023443896,0.041641466,-0.011563127,-0.015608296,-0.06803195,0.0039175027,0.062482633,0.0019684362,0.041863386,0.0076730414,0.021638691,-0.0141695645,0.012909346,0.048471004,-0.03927968,0.0056255274,0.086321585,0.009483744,-0.078316756,-0.013618222,-0.0020454323,-0.004306086,0.02423651,0.047280747,-0.038308896,-0.018052135,-0.04808847,0.011697473,0.0058442783,-0.029978743,-0.009523054,0.028972128,0.026649047,0.013586216,-0.027711663,0.01629997,-0.012964064,0.04213289,-0.02008372,-0.008104349,0.028212152,-0.06422576,-0.032866325,0.019664966,-0.028404696,-0.06230608,0.030600285,-0.01744199,-0.014980249,-0.029058661,-0.026926255,0.006030138,-0.059290387,-0.03498851,-0.0060254964,-0.030825015,0.019599963,0.009411986,0.007215732,-0.022520265,-0.01810672,0.04125227,0.008438637,-0.015308395,0.07484257,0.021314345,0.045821685,0.017462308,0.006623239,0.04167078,-0.0002573724,-0.0002894097,-0.052476313,0.026587427,-0.031966142,0.022746297,0.026873121,0.009962751,-0.06720464,-0.017267214,0.07014304,0.022231333,0.036479224,-0.026480934,0.017351784,-0.0028876201,0.019186055,-0.03327106,-0.049593583,0.011870106,0.002607779,-0.036632374,0.048416737,0.031349592,-0.063924685,0.07466284,0.055140484,-0.01901491,0.01693765,0.011894018,0.011853836,0.003407673,0.053403284,0.016644599,0.0825809,-0.015910469,0.012765724,0.005553958,-0.037805688,0.041578494,0.0025818124,-0.02990539,-0.10151994,-0.031013668,0.004166608,0.0151280975,-0.05829845,0.014253844,-0.04479965,-0.06463093,0.032202143,-0.06631952,0.047096487,0.013401316,-0.042408407,0.03783008,-0.01939423,-0.00090560125,0.016770113,-0.033173382,0.0018668323,0.031091915,-0.02150649,-0.009112489,-0.024255289,-0.002002183,-0.040935494,0.007847513,0.02861025,0.017333206,-0.035566494,-0.024290014,-0.008484535,0.012591679,-0.011326895,-0.029059222,0.030341493,0.00507821,-0.020344766,-0.046284094,0.03058125,-0.009268889,-0.040118113,-0.035976548,0.040413506,-0.05459188,-0.029832954,-0.071383,-0.007339155,-0.04302503,0.010414143,-0.03517933,0.0087651955,0.035990193,0.06566313,0.0090138605,0.023581183,0.059168503,-0.0039474177,0.022772714,0.0054902732,-0.021245815,0.012713829,-0.0468991,-0.01912278,0.029400924,-0.06561608,0.013477171,0.012935812,0.10776678,0.007528663,-0.031824388,0.049396265,-0.00999958,0.008610522,-0.028212864,0.0615225,0.04300596,-0.070518225,0.0029682934,0.087052464,-0.010462277,0.02872608,-0.0672204,0.033117693,0.0004578098,-0.09842754,0.048448876,-0.058107167,0.03482786,-0.0018084649,0.06540669,0.030097254,-0.047077864,0.025700308,-0.004490651,0.034625243,-0.04737576,0.015556035,-0.05114933,-0.053440128,0.0725948,0.024562627,-0.018226517,0.042412464,0.0077744196,-0.024230722,0.04159704,-0.08754917,-0.015647367,-0.06267259,-0.06763071,0.021982228,0.0029750532,-0.06386849,0.050115947,-0.011878881,-0.017960643,0.011917776,0.0064209183,-0.020980945,-0.052563865,-0.013145189,-0.023296935,0.03188547,-0.0018096856,0.026099283,0.024323521,0.018458525,-0.047267906,-0.04842216,0.019546617,-0.004853306,0.083062,0.007899161,-0.019421663,-0.021513961,0.056445535,-0.008481133,0.022075579,-0.08265504,-0.0010114018,0.03679735,0.024484621,0.057213042,0.03926967,0.03624995,-0.038464848,-0.013827723,0.007575443,-0.050125804,0.04316751,0.0034982294,0.039132833,0.0052583623,-0.009952143,0.049797755,0.022258602,-0.018132102,0.014489988,-0.010440671,0.046647087,-0.051994134,0.030493708,0.037375882,0.016492916,0.050706092,0.060106173,0.02093444,0.01335032,0.029071668,0.00971825,-0.03636969,0.049291223,-0.021052226,0.04040535,-0.021953054,0.009285988,-0.006125611,0.0064394674,0.045444727,0.029779939,0.023501994,-0.07362285,0.034666017,0.02756518,0.01366343,0.026287975,-0.083937295,-0.008272662,-0.0106550995,-0.005674648,-0.025687069,0.014237837,-0.029958868,0.020552605,0.009000597,0.014722826,-0.053307198,0.04253888,0.0069637783,-0.029141266,0.03265427,0.0039612507,-0.031633005,0.026787173,-0.031156078,-0.026217531,-0.0126933735,-0.019460084,0.01631483,-0.019697199,-0.02309929,-0.0059798243,-0.01598218,-0.004288259,-0.016664518,0.06466113,-0.05159422,0.044920154,-0.0061611007,0.00050167076,-0.1194112,0.04475569,0.037419323,0.0028793574,-0.025750464,-0.026490139,-0.08916406,0.013922781,-0.018586561,0.00991821,-0.016234927,-0.04342228,-0.023468263,0.0057913056,0.01904192,0.0039292322,0.048723478,0.0075294184,-0.008903743,0.04995926,-0.029881656,0.018970912,-0.02394159,0.0074395943,-0.002387636,0.027934348,0.026590073,-0.08694948,0.030565731,0.04855477,-0.0044524623,-0.021327315,0.04466129,0.024730269,-0.0065098833,0.02045264,0.06177199,0.022331854,-0.056069992,-0.0037650098,0.037088756,0.008276134,-0.024392974,-0.047907293,-0.002041991,-0.03672998,0.015015726,-0.033743914,0.040137053,0.02806853,-0.031661436,0.1152457,0.02524419,-0.033881888,-0.020740878,0.06566301,0.032887843,0.0008175563,0.038470704,0.016487097,-0.004303762,-0.011795278,0.010235134,-0.043407552,-0.024628911,0.0015752937,-0.02324844,0.016869787,-0.0504822,0.029679779,-0.028239494,0.039702848,-0.03495313,0.06148757,-0.10350015,-0.056815065,0.06697385,0.010449115,-0.007901831,0.050107528,-0.024233399,-0.0081386315,-0.01799879,0.020814542,-0.029483449,0.0008040921,-0.021526089,0.0005116017,-0.05002977,-0.014793122,-0.019790709,0.05385858,-0.009971696,-0.01784687,0.05251491,-0.028718308,0.03864122,0.03546312,0.012930374,0.008484845,-0.016937885,0.006450035,0.0058413176,0.017599221,0.056923267,0.013643883,-0.005993912,0.018499713,-0.024600474,-0.017777378,0.057840317,-0.061820768,0.036112644,0.01956135,0.0041615064,0.077665344,0.030936519,-0.00975199,0.008549295,0.04838905,-0.056075126,-0.073713504,0.018036326,0.014748544,0.027797997,0.015870422,0.017160736,0.027081402,-0.006946975,-0.19229855,0.013239707,-0.022495488,-0.025648858,-0.004626739,0.017672654,0.038198132,-0.00976147,0.025875859,0.026766997,0.027435808,-0.033619817,0.00887132,-0.023385225,-0.0378286,0.034430698,0.0053362413,-0.041646205,-0.009516963,0.012526687,0.012153706,0.03963203,-0.05405363,-0.018668693,-0.030214082,-0.009589067,-0.010960926,-0.016994968,0.01111794,0.02527125,0.014378362,0.0027858256,-0.0013563889,0.03267995,-0.024542008,-0.014912955,-0.01924805,0.0106214415,-0.06871969,0.022914344,0.023572715,-0.018375607,-0.029793737,0.016998695,-0.008523429,0.07108203,0.043486286,0.012137635,-0.053949554,0.001506364,-0.009153223,0.0041688085,-0.10163774,-0.03125088,-0.0158938,0.064895906,0.026156602,0.0135794105,0.048469115,-0.013145553,0.057149816,0.069649406,-0.02557053,0.029734153,-0.019059895,-0.010205848,0.057421345,-0.035176784,-0.03525422,-0.030997926,0.04008917,-0.023774201,-0.039145596,0.0060670027,0.032479033,-0.031174764,0.023161372,-0.018861772,-0.050153825,0.0016914401,-0.021874681,-0.007798614,-0.011040268,0.009614697,-0.029224768,-0.026095584,-0.039993573,0.0038032024,0.028819552,0.007144607,-0.025724553,-0.055811577,0.008580419,0.010187349,0.030509118,-0.024353504,-0.024051892,0.03276304,-0.012166348,-0.01972806,0.010331063,-0.010881423,-0.009190089,0.026725665,0.048654515,-0.037648205,-0.11531777,0.015500172,-0.04736885,-0.0692985,0.052813686,0.026758201,0.05339332,-0.009173442,0.024861028,-0.0074434504,0.019800663,-0.039440714,-0.048458446,-0.034585975,-0.029757868,-0.028010672,-0.0012076937,0.01709856,0.041894324,0.031876653,-0.056191076,0.0052502663,0.021352373,0.019734386,0.0039603985,-0.055370238,0.034112647,-0.0156981,-0.056497302,0.022741415,0.00928555,-0.007915106,0.0075585674,0.0017102734,0.08221653,-0.048443764,-0.047763962,0.060610905,-0.013904343,0.011185478,-0.003906535,-0.018748796,-0.011409097,-0.044231642,0.0074846796,-0.096283756,0.021418707,-0.018288074,-0.046471026,0.025946824,0.008188934,0.029668711,-0.0052504214,0.023994192,0.0141538195,-0.018334579,0.02568988,-0.002073191,-0.0027074488,0.020592282,-0.029805355,-0.0645831,-0.01347496,0.019397328,-0.020723568,0.048229087,0.012896532,0.019586522,0.008564006,-0.02859045,0.038437627,-0.032802664,-0.007023701,0.027111275]
14	us_states	Table:us_states\nDescription:ข้อมูลรัฐในสหรัฐอเมริกา\nColumns:\n  state_id     SMALLINT PRIMARY KEY, -- รหัสรัฐ (ใช้ standalone ไม่ได้ FK กับตารางอื่น)\n  state_name   VARCHAR(100),         -- ชื่อรัฐ เช่น California\n  state_abbr   VARCHAR(2),           -- ตัวย่อรัฐ เช่น CA\n  state_region VARCHAR(50)           -- ภูมิภาคของรัฐ เช่น West	[0.0045226193,0.031171134,-0.028474387,0.0047597946,0.010831279,-0.01904406,-0.014224505,-0.012222339,0.037607893,0.017366113,0.031804707,0.010615432,0.11368252,0.048519928,-0.014621412,-0.03222133,0.010107564,-0.017028606,0.008195095,0.006744366,0.011369294,-0.046544086,0.04550458,-0.00938826,0.025045132,-0.022731166,0.02161279,0.01110518,-0.046142355,0.059760623,0.005199618,-0.035288062,-0.003616524,0.034911633,0.017142627,-0.013830343,-0.029843029,-0.017900983,0.00061372016,-0.0031933656,0.019499604,0.010288004,0.010882636,-0.027121883,0.009580414,-0.026106559,0.06090017,0.02335449,-0.0013846419,-0.009760025,0.02692235,-0.009284096,0.043362245,0.030697877,-0.044521544,-0.020096663,0.045257445,0.055108353,-0.019739226,0.023390839,-0.009686079,0.039441008,0.0044458574,0.008487641,0.045269165,-0.023673948,0.005066433,-0.01905026,-0.028656684,-0.004312452,-0.01958823,0.008853594,0.11843888,0.010568154,-0.038981758,-0.000995171,-0.049412664,0.013581676,0.00583867,0.029374816,0.031169854,0.008105315,-0.0016029652,0.034152087,-0.009425295,-0.010119968,-0.035793822,0.04664574,0.040677205,0.039132766,0.024590623,-0.030678904,-0.036852892,0.048275482,0.012961602,0.007702983,0.017834561,-0.006069443,0.034657944,-0.032412067,-0.039412238,-0.104394704,-0.0037192109,-0.0330805,-0.08584235,-0.018712612,-0.029306876,-0.058850493,0.035233755,-0.040412653,-0.041053984,0.014900182,0.039855137,-0.020719338,0.025441268,-0.018808007,0.06705715,-0.057314344,0.012928777,-0.06762059,-0.000805585,-0.0023458041,-0.049733903,-0.005825137,0.036456212,-0.048025545,-0.01056317,-0.024178918,0.03808987,-0.027440991,-0.018897066,-0.054716274,-0.013626274,0.02631865,-0.01321265,0.020662146,0.005352955,0.013456348,-0.021473233,0.003940214,0.060074423,-0.070493676,-0.007483885,0.05442896,0.0035399436,-0.08102555,-0.020452175,0.0056575867,-0.0029615376,0.030448435,0.02897969,-0.040599197,-0.023333278,-0.019874755,0.016114345,0.0055372864,-0.037446994,0.005011486,0.0021189237,0.026192805,0.030053116,0.0004139057,-0.004879249,-0.019822601,0.03299656,-0.021216314,-0.009950304,0.0060092113,-0.031443767,-0.03779713,-0.005782596,-0.045234326,-0.052848417,0.024359683,-0.0071867267,-0.0111737605,-0.022809276,-0.032840576,-0.010552855,-0.06403827,-0.06047373,-0.014093198,-0.022280952,0.027704066,0.009615936,0.0117442515,-0.0150126,-0.040900055,0.04405753,-0.009967235,0.010550434,0.08217683,0.009391174,0.039652877,0.0033676324,0.018973771,0.019066779,0.0054833735,-0.008110208,-0.057618573,0.009105497,-0.014793921,0.023165235,-0.0054726223,0.017618952,-0.06926028,-0.012127691,0.07080637,0.032083083,0.022313045,-0.014705765,0.032684967,-0.0058300947,0.025446525,-0.036666542,-0.060865995,0.024687579,0.009925483,-0.04218844,0.06319649,0.014438676,-0.05848058,0.09213618,0.044469085,-0.049999177,-0.0054479777,-0.004438125,-0.0039676805,0.020192778,0.052516207,0.04716002,0.06991985,-0.012856598,-0.015974298,0.0018527919,-0.038855568,0.074013114,-0.00020002727,-0.013779844,-0.09517217,-0.03847512,0.009770034,0.01923075,-0.059668362,0.027017672,-0.051304534,-0.05518838,0.019211173,-0.06076043,0.019568618,0.003256777,-0.02716962,0.03520694,0.0030687,0.012689525,0.0091397455,-0.035555873,0.016155312,0.026636597,-0.013022651,0.004939829,-0.03791147,-0.008469849,-0.031883255,0.015993495,0.024526525,-0.001103256,-0.039568003,-0.029387508,0.0018957487,0.04480116,-0.040423155,-0.045331523,0.014916593,0.008857878,0.0035169492,-0.04869365,0.040717606,0.018808745,-0.038896736,-0.044780713,0.030492013,-0.053878576,-0.0288798,-0.05780291,0.02308492,-0.057915587,0.015145214,-0.035321195,-0.0034806104,0.018554129,0.07492622,0.026220271,0.035708502,0.061516345,-0.0020326308,0.039468504,0.016238693,0.0138885,-0.004910101,-0.044711985,-0.0013534699,0.02595592,-0.0633541,0.002237313,0.019147646,0.111918636,0.0035564753,-0.031745456,0.057880636,-0.030096754,-0.008382908,-0.010778783,0.043415833,0.0068735164,-0.07033794,0.018523706,0.060657185,0.0012609242,-0.009834062,-0.054416645,0.0240526,-0.022876276,-0.06863906,0.04663812,-0.047830738,0.03492613,-0.026707266,0.05445997,0.023434663,-0.055586334,0.031215277,0.0026839215,0.016958287,-0.039679546,0.0015242845,-0.055711344,-0.041998193,0.07246334,0.008503817,-0.052876305,0.06185562,0.03932818,-0.0067465142,0.0412866,-0.08057608,0.0002520748,-0.06368788,-0.04520845,0.011134019,0.029990224,-0.061019238,0.023309188,0.0049235825,-0.012625331,0.0049908957,-0.010492559,-0.021044344,-0.04190368,-0.016654555,-0.044493705,0.023061788,-0.003700694,0.016648138,0.013742298,0.029368086,-0.03963641,-0.019726487,-0.0038266133,0.021541035,0.0814806,0.001331942,-0.053702895,-0.004621297,0.052087016,-0.021215241,0.038141504,-0.08874553,0.007636662,0.040197384,0.022857502,0.074614584,0.044336554,0.03223676,-0.01999951,-0.0041743284,-0.013264691,-0.039971825,0.04551482,0.017951967,0.030167399,0.017575929,0.011968651,0.020326179,0.032607332,0.010469425,0.046840012,-0.016031478,0.054785855,-0.052219275,0.020225618,0.0038848082,0.00090980536,0.052836254,0.06548462,0.0066803778,-0.022982243,0.02501183,0.00788087,-0.030331386,0.053501636,-0.031496443,0.03318681,-0.0095973145,0.0047852644,-0.03965488,0.0073803137,0.049080703,0.023493303,0.025545325,-0.050805762,0.01926221,0.014914803,0.01305015,0.0225983,-0.07786864,-0.0073187845,-0.016027415,-0.020000512,0.015552039,-0.025020182,-0.032854743,0.015800335,-0.018272752,0.023039179,-0.018687645,0.02116718,0.0028701152,-0.012462226,0.017272921,0.006423809,-0.02018847,0.026005914,-0.027376838,-0.004046665,-0.0007752734,-0.03566223,0.01651621,-0.027792698,-0.021800159,0.0031689184,0.0045869756,-0.015137835,-0.034750707,0.05964766,-0.05945491,0.055037778,-0.025290484,0.016934197,-0.12602928,0.048398174,0.036412567,-0.0029870511,-0.0074544814,-0.039816774,-0.062488522,0.03329102,0.0013993433,0.02063938,-0.019753529,-0.04658979,-0.027978005,-0.003185549,0.033843193,0.016971154,0.04488853,-0.007994195,-0.006153244,0.03546771,-0.016187517,0.049547665,-0.015371018,-0.0012080623,0.007691085,0.03495284,0.029831968,-0.093597665,0.03200099,0.055495813,-0.03777014,-0.026817525,0.049354147,0.04622365,-0.0058319927,0.029325912,0.0523812,0.026777394,-0.06891377,0.005830508,0.03384626,-0.011838894,-0.02376924,-0.039377693,0.017555267,-0.030760046,0.032843,-0.032515474,0.03966517,0.025310496,-0.033123635,0.11541715,-0.010878844,-0.02514808,-0.044371076,0.032485608,0.026151976,-0.028089616,0.0076751625,0.032821763,-0.011345046,0.005467844,0.023689875,-0.054058176,-0.00019815435,0.003880661,-0.027562039,0.011895641,-0.05417879,0.031228857,-0.02482693,0.021073077,-0.05174759,0.06900465,-0.11638547,-0.05666356,0.036699902,0.025228998,-0.035825364,0.032312114,-0.04997424,-0.018978333,-0.0037440893,0.022348914,-0.0273449,-0.002198079,0.0052974904,0.0237268,-0.04668912,-0.009683897,-0.041443817,0.031892255,-0.02466145,-0.03699765,0.0615604,-0.03923843,0.03743039,0.021929651,0.03389559,0.038950305,-0.02066821,0.016547302,-0.032227032,-0.006957368,0.06867838,0.011887343,0.0072700283,0.021474686,-0.0016781841,-0.0166033,0.05496854,-0.039122738,0.021245537,0.024308603,0.00017556532,0.04536026,0.05857305,-0.0034082648,0.012016921,0.031886045,-0.0661875,-0.07406397,-0.017450944,0.005543538,0.011220329,0.026913423,0.031130586,0.022881752,0.036401276,-0.20603883,0.020450212,-0.029030932,-0.031455774,-0.005534092,0.022906745,0.031041835,-0.024698202,0.011497295,0.0017778506,0.02300527,-0.020199249,0.031310827,-0.02085072,-0.03596728,0.05497354,0.005471258,-0.0038271283,0.0064349268,-0.027836122,0.010969408,0.06319959,-0.031448156,-0.003767973,-0.038067203,-0.011156573,-0.018735677,0.010622528,0.012772671,0.020850742,0.033075497,0.007860241,0.0053832494,0.039323404,-0.030680856,-0.02657019,-0.01034899,0.011655295,-0.02442884,0.03296056,-0.0034394315,-0.019620907,-0.0009753047,0.019727752,-0.011635,0.02699734,0.046425782,0.008226554,-0.03999133,0.014397553,0.01717976,0.001852563,-0.107451774,-0.0013293101,0.000626913,0.058462314,0.022914989,0.008603368,0.02205999,-0.010959599,0.042208437,0.06094046,-0.028316943,0.03413517,-0.023148289,0.0021956705,0.03935768,-0.03644323,-0.031026106,-0.01946637,0.033246554,-0.02222704,0.015007258,0.030944848,0.016317982,-0.017441466,0.037182502,-0.012192545,-0.052292373,0.017304096,0.0039005352,-0.007032567,-0.01959651,0.027401185,-0.04602798,-0.011077031,-0.055204187,0.03064615,0.036680084,0.03824336,-0.03159619,-0.02138538,0.0023929542,0.008957065,0.040997606,-0.031443648,-0.043614905,0.0033169996,-0.003871635,-0.02828655,8.506691e-05,0.0033124043,-0.030507086,0.009673509,0.04998665,-0.0429265,-0.103659295,0.010563662,-0.02796452,-0.05551176,0.042179946,0.018093668,0.03264261,-0.0010442558,0.03248757,-0.014198278,0.032158088,-0.02814338,-0.049548186,-0.046762533,-0.019789632,0.00420153,-0.001631825,-0.0044633597,0.044659536,0.028320495,-0.06203315,0.037457686,0.056511674,0.03637172,0.0133494465,-0.029591642,0.042517863,-0.027502188,-0.050349403,0.038798746,0.0110366,-0.027736448,0.033781726,0.016917778,0.06116835,-0.09841746,-0.07112072,0.06978929,-0.004598374,0.009737166,0.009938319,-0.011760705,-0.0028508205,-0.029825969,-0.011753681,-0.0836835,0.0029185133,-0.01941686,-0.04144417,0.020320963,0.0141822295,0.030231921,-0.009355672,0.050126255,0.013280758,-0.040448103,0.013984333,0.023163956,0.020728774,0.018850036,-0.032850023,-0.033535518,0.011575429,0.0204867,-0.020135114,0.043349367,0.013113259,0.011873494,0.01812629,-0.021917742,0.0655993,-0.03885956,-0.031689376,0.042842057]
\.


--
-- Data for Name: shippers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shippers (shipper_id, company_name, phone) FROM stdin;
1	Speedy Express	(503) 555-9831
2	United Package	(503) 555-3199
3	Federal Shipping	(503) 555-9931
4	Alliance Shippers	1-800-222-0451
5	UPS	1-800-782-7892
6	DHL	1-800-225-5345
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers (supplier_id, company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax, homepage) FROM stdin;
1	Exotic Liquids	Charlotte Cooper	Purchasing Manager	49 Gilbert St.	London	\N	EC1 4SD	UK	(171) 555-2222	\N	\N
2	New Orleans Cajun Delights	Shelley Burke	Order Administrator	P.O. Box 78934	New Orleans	LA	70117	USA	(100) 555-4822	\N	#CAJUN.HTM#
3	Grandma Kelly's Homestead	Regina Murphy	Sales Representative	707 Oxford Rd.	Ann Arbor	MI	48104	USA	(313) 555-5735	(313) 555-3349	\N
4	Tokyo Traders	Yoshi Nagase	Marketing Manager	9-8 Sekimai Musashino-shi	Tokyo	\N	100	Japan	(03) 3555-5011	\N	\N
5	Cooperativa de Quesos 'Las Cabras'	Antonio del Valle Saavedra	Export Administrator	Calle del Rosal 4	Oviedo	Asturias	33007	Spain	(98) 598 76 54	\N	\N
6	Mayumi's	Mayumi Ohno	Marketing Representative	92 Setsuko Chuo-ku	Osaka	\N	545	Japan	(06) 431-7877	\N	Mayumi's (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#
7	Pavlova, Ltd.	Ian Devling	Marketing Manager	74 Rose St. Moonie Ponds	Melbourne	Victoria	3058	Australia	(03) 444-2343	(03) 444-6588	\N
8	Specialty Biscuits, Ltd.	Peter Wilson	Sales Representative	29 King's Way	Manchester	\N	M14 GSD	UK	(161) 555-4448	\N	\N
9	PB Knäckebröd AB	Lars Peterson	Sales Agent	Kaloadagatan 13	Göteborg	\N	S-345 67	Sweden	031-987 65 43	031-987 65 91	\N
10	Refrescos Americanas LTDA	Carlos Diaz	Marketing Manager	Av. das Americanas 12.890	Sao Paulo	\N	5442	Brazil	(11) 555 4640	\N	\N
11	Heli Süßwaren GmbH & Co. KG	Petra Winkler	Sales Manager	Tiergartenstraße 5	Berlin	\N	10785	Germany	(010) 9984510	\N	\N
12	Plutzer Lebensmittelgroßmärkte AG	Martin Bein	International Marketing Mgr.	Bogenallee 51	Frankfurt	\N	60439	Germany	(069) 992755	\N	Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#
13	Nord-Ost-Fisch Handelsgesellschaft mbH	Sven Petersen	Coordinator Foreign Markets	Frahmredder 112a	Cuxhaven	\N	27478	Germany	(04721) 8713	(04721) 8714	\N
14	Formaggi Fortini s.r.l.	Elio Rossi	Sales Representative	Viale Dante, 75	Ravenna	\N	48100	Italy	(0544) 60323	(0544) 60603	#FORMAGGI.HTM#
15	Norske Meierier	Beate Vileid	Marketing Manager	Hatlevegen 5	Sandvika	\N	1320	Norway	(0)2-953010	\N	\N
16	Bigfoot Breweries	Cheryl Saylor	Regional Account Rep.	3400 - 8th Avenue Suite 210	Bend	OR	97101	USA	(503) 555-9931	\N	\N
17	Svensk Sjöföda AB	Michael Björn	Sales Representative	Brovallavägen 231	Stockholm	\N	S-123 45	Sweden	08-123 45 67	\N	\N
18	Aux joyeux ecclésiastiques	Guylène Nodier	Sales Manager	203, Rue des Francs-Bourgeois	Paris	\N	75004	France	(1) 03.83.00.68	(1) 03.83.00.62	\N
19	New England Seafood Cannery	Robb Merchant	Wholesale Account Agent	Order Processing Dept. 2100 Paul Revere Blvd.	Boston	MA	02134	USA	(617) 555-3267	(617) 555-3389	\N
20	Leka Trading	Chandra Leka	Owner	471 Serangoon Loop, Suite #402	Singapore	\N	0512	Singapore	555-8787	\N	\N
21	Lyngbysild	Niels Petersen	Sales Manager	Lyngbysild Fiskebakken 10	Lyngby	\N	2800	Denmark	43844108	43844115	\N
22	Zaanse Snoepfabriek	Dirk Luchte	Accounting Manager	Verkoop Rijnweg 22	Zaandam	\N	9999 ZZ	Netherlands	(12345) 1212	(12345) 1210	\N
23	Karkki Oy	Anne Heikkonen	Product Manager	Valtakatu 12	Lappeenranta	\N	53120	Finland	(953) 10956	\N	\N
24	G'day, Mate	Wendy Mackenzie	Sales Representative	170 Prince Edward Parade Hunter's Hill	Sydney	NSW	2042	Australia	(02) 555-5914	(02) 555-4873	G'day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#
25	Ma Maison	Jean-Guy Lauzon	Marketing Manager	2960 Rue St. Laurent	Montréal	Québec	H1J 1C3	Canada	(514) 555-9022	\N	\N
26	Pasta Buttini s.r.l.	Giovanni Giudici	Order Administrator	Via dei Gelsomini, 153	Salerno	\N	84100	Italy	(089) 6547665	(089) 6547667	\N
27	Escargots Nouveaux	Marie Delamare	Sales Manager	22, rue H. Voiron	Montceau	\N	71300	France	85.57.00.07	\N	\N
28	Gai pâturage	Eliane Noz	Sales Representative	Bat. B 3, rue des Alpes	Annecy	\N	74000	France	38.76.98.06	38.76.98.58	\N
29	Forêts d'érables	Chantal Goulet	Accounting Manager	148 rue Chasseur	Ste-Hyacinthe	Québec	J2S 7S8	Canada	(514) 555-2955	(514) 555-2921	\N
\.


--
-- Data for Name: territories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.territories (territory_id, territory_description, region_id) FROM stdin;
01581	Westboro	1
01730	Bedford	1
01833	Georgetow	1
02116	Boston	1
02139	Cambridge	1
02184	Braintree	1
02903	Providence	1
03049	Hollis	3
03801	Portsmouth	3
06897	Wilton	1
07960	Morristown	1
08837	Edison	1
10019	New York	1
10038	New York	1
11747	Mellvile	1
14450	Fairport	1
19428	Philadelphia	3
19713	Neward	1
20852	Rockville	1
27403	Greensboro	1
27511	Cary	1
29202	Columbia	4
30346	Atlanta	4
31406	Savannah	4
32859	Orlando	4
33607	Tampa	4
40222	Louisville	1
44122	Beachwood	3
45839	Findlay	3
48075	Southfield	3
48084	Troy	3
48304	Bloomfield Hills	3
53404	Racine	3
55113	Roseville	3
55439	Minneapolis	3
60179	Hoffman Estates	2
60601	Chicago	2
72716	Bentonville	4
75234	Dallas	4
78759	Austin	4
80202	Denver	2
80909	Colorado Springs	2
85014	Phoenix	2
85251	Scottsdale	2
90405	Santa Monica	2
94025	Menlo Park	2
94105	San Francisco	2
95008	Campbell	2
95054	Santa Clara	2
95060	Santa Cruz	2
98004	Bellevue	2
98052	Redmond	2
98104	Seattle	2
\.


--
-- Data for Name: us_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_states (state_id, state_name, state_abbr, state_region) FROM stdin;
1	Alabama	AL	south
2	Alaska	AK	north
3	Arizona	AZ	west
4	Arkansas	AR	south
5	California	CA	west
6	Colorado	CO	west
7	Connecticut	CT	east
8	Delaware	DE	east
9	District of Columbia	DC	east
10	Florida	FL	south
11	Georgia	GA	south
12	Hawaii	HI	west
13	Idaho	ID	midwest
14	Illinois	IL	midwest
15	Indiana	IN	midwest
16	Iowa	IO	midwest
17	Kansas	KS	midwest
18	Kentucky	KY	south
19	Louisiana	LA	south
20	Maine	ME	north
21	Maryland	MD	east
22	Massachusetts	MA	north
23	Michigan	MI	north
24	Minnesota	MN	north
25	Mississippi	MS	south
26	Missouri	MO	south
27	Montana	MT	west
28	Nebraska	NE	midwest
29	Nevada	NV	west
30	New Hampshire	NH	east
31	New Jersey	NJ	east
32	New Mexico	NM	west
33	New York	NY	east
34	North Carolina	NC	east
35	North Dakota	ND	midwest
36	Ohio	OH	midwest
37	Oklahoma	OK	midwest
38	Oregon	OR	west
39	Pennsylvania	PA	east
40	Rhode Island	RI	east
41	South Carolina	SC	east
42	South Dakota	SD	midwest
43	Tennessee	TN	midwest
44	Texas	TX	west
45	Utah	UT	west
46	Vermont	VT	east
47	Virginia	VA	east
48	Washington	WA	west
49	West Virginia	WV	south
50	Wisconsin	WI	midwest
51	Wyoming	WY	west
\.


--
-- Name: schema_ardine_short_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schema_ardine_short_id_seq', 15, true);


--
-- Name: schema_embeddings_long_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schema_embeddings_long_id_seq', 14, true);


--
-- Name: schema_embeddings_short_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schema_embeddings_short_id_seq', 14, true);


--
-- Name: categories pk_categories; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT pk_categories PRIMARY KEY (category_id);


--
-- Name: customer_customer_demo pk_customer_customer_demo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer_demo
    ADD CONSTRAINT pk_customer_customer_demo PRIMARY KEY (customer_id, customer_type_id);


--
-- Name: customer_demographics pk_customer_demographics; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_demographics
    ADD CONSTRAINT pk_customer_demographics PRIMARY KEY (customer_type_id);


--
-- Name: customers pk_customers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT pk_customers PRIMARY KEY (customer_id);


--
-- Name: employee_territories pk_employee_territories; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_territories
    ADD CONSTRAINT pk_employee_territories PRIMARY KEY (employee_id, territory_id);


--
-- Name: employees pk_employees; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (employee_id);


--
-- Name: order_details pk_order_details; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT pk_order_details PRIMARY KEY (order_id, product_id);


--
-- Name: orders pk_orders; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT pk_orders PRIMARY KEY (order_id);


--
-- Name: products pk_products; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT pk_products PRIMARY KEY (product_id);


--
-- Name: region pk_region; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT pk_region PRIMARY KEY (region_id);


--
-- Name: shippers pk_shippers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shippers
    ADD CONSTRAINT pk_shippers PRIMARY KEY (shipper_id);


--
-- Name: suppliers pk_suppliers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT pk_suppliers PRIMARY KEY (supplier_id);


--
-- Name: territories pk_territories; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.territories
    ADD CONSTRAINT pk_territories PRIMARY KEY (territory_id);


--
-- Name: us_states pk_usstates; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us_states
    ADD CONSTRAINT pk_usstates PRIMARY KEY (state_id);


--
-- Name: schema_ardine_short schema_ardine_short_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_ardine_short
    ADD CONSTRAINT schema_ardine_short_pkey PRIMARY KEY (id);


--
-- Name: schema_embeddings_long schema_embeddings_long_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_embeddings_long
    ADD CONSTRAINT schema_embeddings_long_pkey PRIMARY KEY (id);


--
-- Name: schema_embeddings_short schema_embeddings_short_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_embeddings_short
    ADD CONSTRAINT schema_embeddings_short_pkey PRIMARY KEY (id);


--
-- Name: customer_customer_demo fk_customer_customer_demo_customer_demographics; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer_demo
    ADD CONSTRAINT fk_customer_customer_demo_customer_demographics FOREIGN KEY (customer_type_id) REFERENCES public.customer_demographics(customer_type_id);


--
-- Name: customer_customer_demo fk_customer_customer_demo_customers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer_demo
    ADD CONSTRAINT fk_customer_customer_demo_customers FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: employee_territories fk_employee_territories_employees; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_territories
    ADD CONSTRAINT fk_employee_territories_employees FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);


--
-- Name: employee_territories fk_employee_territories_territories; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_territories
    ADD CONSTRAINT fk_employee_territories_territories FOREIGN KEY (territory_id) REFERENCES public.territories(territory_id);


--
-- Name: employees fk_employees_employees; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employees_employees FOREIGN KEY (reports_to) REFERENCES public.employees(employee_id);


--
-- Name: order_details fk_order_details_orders; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT fk_order_details_orders FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: order_details fk_order_details_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT fk_order_details_products FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: orders fk_orders_customers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: orders fk_orders_employees; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_employees FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);


--
-- Name: orders fk_orders_shippers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_shippers FOREIGN KEY (ship_via) REFERENCES public.shippers(shipper_id);


--
-- Name: products fk_products_categories; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_categories FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- Name: products fk_products_suppliers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_suppliers FOREIGN KEY (supplier_id) REFERENCES public.suppliers(supplier_id);


--
-- Name: territories fk_territories_region; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.territories
    ADD CONSTRAINT fk_territories_region FOREIGN KEY (region_id) REFERENCES public.region(region_id);


--
-- PostgreSQL database dump complete
--

