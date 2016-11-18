--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: customer_recipes; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE customer_recipes (
    cust_rec_id integer NOT NULL,
    customer_id integer NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE customer_recipes OWNER TO vagrant;

--
-- Name: customer_recipes_cust_rec_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE customer_recipes_cust_rec_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customer_recipes_cust_rec_id_seq OWNER TO vagrant;

--
-- Name: customer_recipes_cust_rec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE customer_recipes_cust_rec_id_seq OWNED BY customer_recipes.cust_rec_id;


--
-- Name: customer_restrictions; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE customer_restrictions (
    cust_restr_id integer NOT NULL,
    customer_id integer NOT NULL,
    diet_id integer NOT NULL
);


ALTER TABLE customer_restrictions OWNER TO vagrant;

--
-- Name: customer_restrictions_cust_restr_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE customer_restrictions_cust_restr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customer_restrictions_cust_restr_id_seq OWNER TO vagrant;

--
-- Name: customer_restrictions_cust_restr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE customer_restrictions_cust_restr_id_seq OWNED BY customer_restrictions.cust_restr_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE customers (
    user_id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    email character varying(100) NOT NULL,
    password_hash character varying(500) NOT NULL,
    street_address character varying(100),
    zipcode character varying(15),
    state character varying(2),
    phone character varying(30)
);


ALTER TABLE customers OWNER TO vagrant;

--
-- Name: customers_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE customers_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_user_id_seq OWNER TO vagrant;

--
-- Name: customers_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE customers_user_id_seq OWNED BY customers.user_id;


--
-- Name: deliveries; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE deliveries (
    delivery_id integer NOT NULL,
    vendor character varying(500),
    received_at timestamp without time zone NOT NULL
);


ALTER TABLE deliveries OWNER TO vagrant;

--
-- Name: deliveries_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE deliveries_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE deliveries_delivery_id_seq OWNER TO vagrant;

--
-- Name: deliveries_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE deliveries_delivery_id_seq OWNED BY deliveries.delivery_id;


--
-- Name: delivery_quantities; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE delivery_quantities (
    deliv_qty_id integer NOT NULL,
    product_id integer NOT NULL,
    product_qty integer NOT NULL,
    delivery_id integer NOT NULL
);


ALTER TABLE delivery_quantities OWNER TO vagrant;

--
-- Name: delivery_quantities_deliv_qty_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE delivery_quantities_deliv_qty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery_quantities_deliv_qty_id_seq OWNER TO vagrant;

--
-- Name: delivery_quantities_deliv_qty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE delivery_quantities_deliv_qty_id_seq OWNED BY delivery_quantities.deliv_qty_id;


--
-- Name: dietary_restrictions; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE dietary_restrictions (
    diet_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE dietary_restrictions OWNER TO vagrant;

--
-- Name: dietary_restrictions_diet_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE dietary_restrictions_diet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dietary_restrictions_diet_id_seq OWNER TO vagrant;

--
-- Name: dietary_restrictions_diet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE dietary_restrictions_diet_id_seq OWNED BY dietary_restrictions.diet_id;


--
-- Name: icons; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE icons (
    icon_id integer NOT NULL,
    url character varying(500) NOT NULL,
    credit character varying(100) NOT NULL
);


ALTER TABLE icons OWNER TO vagrant;

--
-- Name: icons_icon_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE icons_icon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE icons_icon_id_seq OWNER TO vagrant;

--
-- Name: icons_icon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE icons_icon_id_seq OWNED BY icons.icon_id;


--
-- Name: order_quantities; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE order_quantities (
    order_qty_id integer NOT NULL,
    product_id integer NOT NULL,
    product_qty integer NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE order_quantities OWNER TO vagrant;

--
-- Name: order_quantities_order_qty_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE order_quantities_order_qty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_quantities_order_qty_id_seq OWNER TO vagrant;

--
-- Name: order_quantities_order_qty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE order_quantities_order_qty_id_seq OWNED BY order_quantities.order_qty_id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE orders (
    order_id integer NOT NULL,
    customer_id integer NOT NULL,
    placed_at timestamp without time zone NOT NULL,
    total numeric NOT NULL,
    pickup_id integer NOT NULL,
    received_at timestamp without time zone
);


ALTER TABLE orders OWNER TO vagrant;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_order_id_seq OWNER TO vagrant;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE orders_order_id_seq OWNED BY orders.order_id;


--
-- Name: pickups; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE pickups (
    pickup_id integer NOT NULL,
    name character varying(100),
    street_address character varying(100) NOT NULL,
    description character varying(100) NOT NULL,
    zipcode character varying(15) NOT NULL,
    state character varying(2) NOT NULL
);


ALTER TABLE pickups OWNER TO vagrant;

--
-- Name: pickups_pickup_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE pickups_pickup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pickups_pickup_id_seq OWNER TO vagrant;

--
-- Name: pickups_pickup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE pickups_pickup_id_seq OWNED BY pickups.pickup_id;


--
-- Name: product_tags; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE product_tags (
    prod_tag_id integer NOT NULL,
    product_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE product_tags OWNER TO vagrant;

--
-- Name: product_tags_prod_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE product_tags_prod_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product_tags_prod_tag_id_seq OWNER TO vagrant;

--
-- Name: product_tags_prod_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE product_tags_prod_tag_id_seq OWNED BY product_tags.prod_tag_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE products (
    product_id integer NOT NULL,
    name character varying(200) NOT NULL,
    description character varying,
    weight numeric,
    unit character varying(50),
    price numeric NOT NULL,
    price_per numeric,
    per_unit character varying(50),
    aisle character varying(50),
    category character varying(50),
    img character varying(500),
    icon_id integer,
    color character varying(10),
    search_term character varying(50),
    search_strength integer
);


ALTER TABLE products OWNER TO vagrant;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_product_id_seq OWNER TO vagrant;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE products_product_id_seq OWNED BY products.product_id;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE recipes (
    recipe_id integer NOT NULL,
    url character varying(300) NOT NULL,
    name character varying(100) NOT NULL,
    ingredients json NOT NULL,
    img character varying(300)
);


ALTER TABLE recipes OWNER TO vagrant;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE recipes_recipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipes_recipe_id_seq OWNER TO vagrant;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE recipes_recipe_id_seq OWNED BY recipes.recipe_id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE tags (
    tag_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE tags OWNER TO vagrant;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE tags_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_tag_id_seq OWNER TO vagrant;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE tags_tag_id_seq OWNED BY tags.tag_id;


--
-- Name: cust_rec_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY customer_recipes ALTER COLUMN cust_rec_id SET DEFAULT nextval('customer_recipes_cust_rec_id_seq'::regclass);


--
-- Name: cust_restr_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY customer_restrictions ALTER COLUMN cust_restr_id SET DEFAULT nextval('customer_restrictions_cust_restr_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY customers ALTER COLUMN user_id SET DEFAULT nextval('customers_user_id_seq'::regclass);


--
-- Name: delivery_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY deliveries ALTER COLUMN delivery_id SET DEFAULT nextval('deliveries_delivery_id_seq'::regclass);


--
-- Name: deliv_qty_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY delivery_quantities ALTER COLUMN deliv_qty_id SET DEFAULT nextval('delivery_quantities_deliv_qty_id_seq'::regclass);


--
-- Name: diet_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY dietary_restrictions ALTER COLUMN diet_id SET DEFAULT nextval('dietary_restrictions_diet_id_seq'::regclass);


--
-- Name: icon_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY icons ALTER COLUMN icon_id SET DEFAULT nextval('icons_icon_id_seq'::regclass);


--
-- Name: order_qty_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY order_quantities ALTER COLUMN order_qty_id SET DEFAULT nextval('order_quantities_order_qty_id_seq'::regclass);


--
-- Name: order_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY orders ALTER COLUMN order_id SET DEFAULT nextval('orders_order_id_seq'::regclass);


--
-- Name: pickup_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY pickups ALTER COLUMN pickup_id SET DEFAULT nextval('pickups_pickup_id_seq'::regclass);


--
-- Name: prod_tag_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY product_tags ALTER COLUMN prod_tag_id SET DEFAULT nextval('product_tags_prod_tag_id_seq'::regclass);


--
-- Name: product_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY products ALTER COLUMN product_id SET DEFAULT nextval('products_product_id_seq'::regclass);


--
-- Name: recipe_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY recipes ALTER COLUMN recipe_id SET DEFAULT nextval('recipes_recipe_id_seq'::regclass);


--
-- Name: tag_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tags ALTER COLUMN tag_id SET DEFAULT nextval('tags_tag_id_seq'::regclass);


--
-- Data for Name: customer_recipes; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY customer_recipes (cust_rec_id, customer_id, recipe_id) FROM stdin;
\.


--
-- Name: customer_recipes_cust_rec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('customer_recipes_cust_rec_id_seq', 1, false);


--
-- Data for Name: customer_restrictions; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY customer_restrictions (cust_restr_id, customer_id, diet_id) FROM stdin;
\.


--
-- Name: customer_restrictions_cust_restr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('customer_restrictions_cust_restr_id_seq', 1, false);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY customers (user_id, first_name, last_name, email, password_hash, street_address, zipcode, state, phone) FROM stdin;
1	Maria	Moy	mariakmoy@gmail.com	$pbkdf2-sha256$20000$GuPc.z/HmPN.LwUA4FwLQQ$B8HsLHPOCBO2YFBoeF9IVS2UbB78QxoWVrnWG8Nb6h0	8201 16th St, 818	20910	MD	6177841741
\.


--
-- Name: customers_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('customers_user_id_seq', 1, true);


--
-- Data for Name: deliveries; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY deliveries (delivery_id, vendor, received_at) FROM stdin;
\.


--
-- Name: deliveries_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('deliveries_delivery_id_seq', 1, false);


--
-- Data for Name: delivery_quantities; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY delivery_quantities (deliv_qty_id, product_id, product_qty, delivery_id) FROM stdin;
\.


--
-- Name: delivery_quantities_deliv_qty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('delivery_quantities_deliv_qty_id_seq', 1, false);


--
-- Data for Name: dietary_restrictions; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY dietary_restrictions (diet_id, name) FROM stdin;
\.


--
-- Name: dietary_restrictions_diet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('dietary_restrictions_diet_id_seq', 1, false);


--
-- Data for Name: icons; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY icons (icon_id, url, credit) FROM stdin;
206	https://d30y9cdsu7xlg0.cloudfront.net/png/637587-200.png	Kale By Made Somewhere, AU
207	https://d30y9cdsu7xlg0.cloudfront.net/png/639932-200.png	Laurel Wreath By Jacqueline Fernandes, PT
208	https://d30y9cdsu7xlg0.cloudfront.net/png/610468-200.png	Sage Pose By Pelin Kahraman, TR
209	https://d30y9cdsu7xlg0.cloudfront.net/png/10132-200.png	Uncredited
210	https://d30y9cdsu7xlg0.cloudfront.net/png/152443-200.png	Peach By mariam asad, US
211	https://d30y9cdsu7xlg0.cloudfront.net/png/666039-200.png	Fennel By Edoardo Marconi, IT
212	https://d30y9cdsu7xlg0.cloudfront.net/png/9780-200.png	Artichoke By Richard Zeid, US
213	https://d30y9cdsu7xlg0.cloudfront.net/png/118140-200.png	Goat Cheese By Andrea Harris, US
214	https://d30y9cdsu7xlg0.cloudfront.net/png/537756-200.png	Chicken By Alberto Gongora, CO
215	https://d30y9cdsu7xlg0.cloudfront.net/png/178975-200.png	Guava By Creative Stall, PK
216	https://d30y9cdsu7xlg0.cloudfront.net/png/380-200.png	Milk By Edward Boatman, US
217	https://d30y9cdsu7xlg0.cloudfront.net/png/703685-200.png	Cheese By Grant Taylor, ZA
218	https://d30y9cdsu7xlg0.cloudfront.net/png/674388-200.png	Yoga Man By Anton Anuchin
219	https://d30y9cdsu7xlg0.cloudfront.net/png/43511-200.png	Uncredited
220	https://d30y9cdsu7xlg0.cloudfront.net/png/637594-200.png	Blueberries By Made Somewhere, AU
221	https://d30y9cdsu7xlg0.cloudfront.net/png/9113-200.png	Ham Rove By Burton Rast, US
222	https://d30y9cdsu7xlg0.cloudfront.net/png/619399-200.png	Apricot Jam By Elena Rimeikaite, IE
223	https://d30y9cdsu7xlg0.cloudfront.net/png/23778-200.png	Smoothie By Chance Smith, US
224	https://d30y9cdsu7xlg0.cloudfront.net/png/647987-200.png	Avocado By Katrin Leo Pako, US
225	https://d30y9cdsu7xlg0.cloudfront.net/png/446595-200.png	Dining Area By NOPIXEL, UZ
226	https://d30y9cdsu7xlg0.cloudfront.net/png/698333-200.png	Celery By Alvaro De Ramon Murillo, NL
227	https://d30y9cdsu7xlg0.cloudfront.net/png/597403-200.png	Americano By Kemesh Maharjan, NP
228	https://d30y9cdsu7xlg0.cloudfront.net/png/552717-200.png	Grapefruit By parkjisun
229	https://d30y9cdsu7xlg0.cloudfront.net/png/235590-200.png	Cheese By icon 54
230	https://d30y9cdsu7xlg0.cloudfront.net/png/696771-200.png	Cranberries By Artem Kovyazin, RU
231	https://d30y9cdsu7xlg0.cloudfront.net/png/508479-200.png	Fried Egg By Curve, FR
232	https://d30y9cdsu7xlg0.cloudfront.net/png/320880-200.png	Risotto By Oliviu Stoian, RO
233	https://d30y9cdsu7xlg0.cloudfront.net/png/180005-200.png	Condiment By Joe Harrison, GB
234	https://d30y9cdsu7xlg0.cloudfront.net/png/163887-200.png	Mop By Alex Rodriguez, US
235	https://d30y9cdsu7xlg0.cloudfront.net/png/693873-200.png	Pumpkin By icon 54
236	https://d30y9cdsu7xlg0.cloudfront.net/png/124317-200.png	Plates By Arthur Shlain, RU
237	https://d30y9cdsu7xlg0.cloudfront.net/png/654691-200.png	Chives By Dairy Free Design, GB
238	https://d30y9cdsu7xlg0.cloudfront.net/png/541440-200.png	Anchovies By elmars
239	https://d30y9cdsu7xlg0.cloudfront.net/png/573891-200.png	Endive By Yu luck, KR
240	https://d30y9cdsu7xlg0.cloudfront.net/png/155885-200.png	Pecans By Alex Vaughn
241	https://d30y9cdsu7xlg0.cloudfront.net/png/404999-200.png	Blackberry Jam By Nikita Kozin, RU
242	https://d30y9cdsu7xlg0.cloudfront.net/png/125411-200.png	Cheese By BraveBros., CZ
243	https://d30y9cdsu7xlg0.cloudfront.net/png/634402-200.png	Cheese By Beatriz Isaura Cantu Brandi, MX
244	https://d30y9cdsu7xlg0.cloudfront.net/png/90142-200.png	Eggnog By Cards Against Humanity, US
245	https://d30y9cdsu7xlg0.cloudfront.net/png/619475-200.png	Orange By ludmil
246	https://d30y9cdsu7xlg0.cloudfront.net/png/107127-200.png	Bottle By Zlatko Najdenovski, MK
247	https://d30y9cdsu7xlg0.cloudfront.net/png/542359-200.png	Watermelon By Lisa Krymova, RU
248	https://d30y9cdsu7xlg0.cloudfront.net/png/585642-200.png	Charging Port By ProSymbols, US
249	https://d30y9cdsu7xlg0.cloudfront.net/png/12671-200.png	Half Track By Simon Child, GB
250	https://d30y9cdsu7xlg0.cloudfront.net/png/636446-200.png	Beef By Jacqueline Fernandes, PT
251	https://d30y9cdsu7xlg0.cloudfront.net/png/99914-200.png	Pineapple By Ema Dimitrova, BG
252	https://d30y9cdsu7xlg0.cloudfront.net/png/149078-200.png	Perfume By Hermine Blanquart, FR
253	https://d30y9cdsu7xlg0.cloudfront.net/png/35970-200.png	Onion By Brennan Novak, IS
254	https://d30y9cdsu7xlg0.cloudfront.net/png/563426-200.png	Romaine Lettuce By Yu luck, KR
255	https://d30y9cdsu7xlg0.cloudfront.net/png/580698-200.png	Potato By Artem Kovyazin, RU
256	https://d30y9cdsu7xlg0.cloudfront.net/png/238976-200.png	Puglia By Fabio Rinaldi, IT
257	https://d30y9cdsu7xlg0.cloudfront.net/png/222096-200.png	Uncredited
258	https://d30y9cdsu7xlg0.cloudfront.net/png/130555-200.png	Roasted Chicken By Creative Stall, PK
259	https://d30y9cdsu7xlg0.cloudfront.net/png/522017-200.png	Midi Synthesizer By Iconic, CY
260	https://d30y9cdsu7xlg0.cloudfront.net/png/645698-200.png	Lightning By AFY Studio, ID
261	https://d30y9cdsu7xlg0.cloudfront.net/png/345-200.png	Steak By Edward Boatman, US
262	https://d30y9cdsu7xlg0.cloudfront.net/png/356910-200.png	Rosemary By Anthony Bossard, FR
263	https://d30y9cdsu7xlg0.cloudfront.net/png/713353-200.png	Frozen Pork By Denis Shumaylov, RU
264	https://d30y9cdsu7xlg0.cloudfront.net/png/542346-200.png	Cherry By Lisa Krymova, RU
265	https://d30y9cdsu7xlg0.cloudfront.net/png/139943-200.png	Oregano By Timothy Scahill
266	https://d30y9cdsu7xlg0.cloudfront.net/png/180036-200.png	Salt Shaker By Joe Harrison, GB
267	https://d30y9cdsu7xlg0.cloudfront.net/png/274805-200.png	Cone Sorbet By Oliviu Stoian, RO
268	https://d30y9cdsu7xlg0.cloudfront.net/png/702118-200.png	Bacon By Made Somewhere, AU
269	https://d30y9cdsu7xlg0.cloudfront.net/png/337041-200.png	Lavender By Julia Amadeo, RU
270	https://d30y9cdsu7xlg0.cloudfront.net/png/342728-200.png	Burger By Eliricon, FI
271	https://d30y9cdsu7xlg0.cloudfront.net/png/48137-200.png	Almond By gabriela
272	https://d30y9cdsu7xlg0.cloudfront.net/png/114206-200.png	Turnip By Creative Stall, PK
273	https://d30y9cdsu7xlg0.cloudfront.net/png/169576-200.png	Oil By Xela Ub, VN
274	https://d30y9cdsu7xlg0.cloudfront.net/png/722756-200.png	Cheese By arif fajar yulianto, ID
275	https://d30y9cdsu7xlg0.cloudfront.net/png/660944-200.png	Lemongrass By Dairy Free Design, GB
276	https://d30y9cdsu7xlg0.cloudfront.net/png/574894-200.png	Water By Alexandru Constantin
277	https://d30y9cdsu7xlg0.cloudfront.net/png/275916-200.png	Sausages By Oliviu Stoian, RO
278	https://d30y9cdsu7xlg0.cloudfront.net/png/545846-200.png	Fragile By icon 54
279	https://d30y9cdsu7xlg0.cloudfront.net/png/27507-200.png	Leaf By Mark Caron, US
280	https://d30y9cdsu7xlg0.cloudfront.net/png/662358-200.png	Fillet By Richard Wearn, GB
281	https://d30y9cdsu7xlg0.cloudfront.net/png/357180-200.png	Uncredited
282	https://d30y9cdsu7xlg0.cloudfront.net/png/315821-200.png	Uncredited
283	https://d30y9cdsu7xlg0.cloudfront.net/png/712200-200.png	Mandarin By Arianna Sbaffi, IT
284	https://d30y9cdsu7xlg0.cloudfront.net/png/537706-200.png	Fixed Window By Gentry Griffin, US
285	https://d30y9cdsu7xlg0.cloudfront.net/png/78562-200.png	Egg By Chiara Rossi, IT
286	https://d30y9cdsu7xlg0.cloudfront.net/png/549900-200.png	Fish By Focus Lab, US
287	https://d30y9cdsu7xlg0.cloudfront.net/png/127944-200.png	Pepper By artworkbean, ID
288	https://d30y9cdsu7xlg0.cloudfront.net/png/587-200.png	Wheat By Edward Boatman, US
289	https://d30y9cdsu7xlg0.cloudfront.net/png/222096-200.png	Uncredited
290	https://d30y9cdsu7xlg0.cloudfront.net/png/621634-200.png	Broccoli By Gan Khoon Lay
291	https://d30y9cdsu7xlg0.cloudfront.net/png/656054-200.png	Rub By Ker'is, TH
292	https://d30y9cdsu7xlg0.cloudfront.net/png/646538-200.png	Pear By Nada AlYafaei, AE
293	https://d30y9cdsu7xlg0.cloudfront.net/png/537771-200.png	Corn By Alberto Gongora, CO
294	https://d30y9cdsu7xlg0.cloudfront.net/png/540774-200.png	Shoe By romzicon, ID
295	https://d30y9cdsu7xlg0.cloudfront.net/png/524511-200.png	Romano Green Beans By Jane Pellicciotto, US
296	https://d30y9cdsu7xlg0.cloudfront.net/png/583285-200.png	Comb By Danil Polshin, RU
297	https://d30y9cdsu7xlg0.cloudfront.net/png/107145-200.png	Walnut By Sergey Patutin, BY
298	https://d30y9cdsu7xlg0.cloudfront.net/png/559683-200.png	Broccoli By Carla Dias, PT
299	https://d30y9cdsu7xlg0.cloudfront.net/png/618511-200.png	Raspberry By Chanut is Industries, TH
300	https://d30y9cdsu7xlg0.cloudfront.net/png/307552-200.png	Pickax By lastspark, RU
301	https://d30y9cdsu7xlg0.cloudfront.net/png/646543-200.png	Grape By Nada AlYafaei, AE
302	https://d30y9cdsu7xlg0.cloudfront.net/png/487628-200.png	Navarra By www.mindgraphy.com, ES
303	https://d30y9cdsu7xlg0.cloudfront.net/png/45957-200.png	Box By useiconic.com, US
304	https://d30y9cdsu7xlg0.cloudfront.net/png/208979-200.png	Prawn By NAMI A
305	https://d30y9cdsu7xlg0.cloudfront.net/png/491641-200.png	Snowflake By Creative Stall, PK
306	https://d30y9cdsu7xlg0.cloudfront.net/png/603911-200.png	Leaves By KEN MURRAY, CA
307	https://d30y9cdsu7xlg0.cloudfront.net/png/720552-200.png	Spinache By VectorBakery, HU
308	https://d30y9cdsu7xlg0.cloudfront.net/png/681939-200.png	Shrimp By Grant
309	https://d30y9cdsu7xlg0.cloudfront.net/png/580789-200.png	Cheese By gayatri
310	https://d30y9cdsu7xlg0.cloudfront.net/png/66645-200.png	Beans By Marco Galtarossa, IT
311	https://d30y9cdsu7xlg0.cloudfront.net/png/66645-200.png	Beans By Marco Galtarossa, IT
312	https://d30y9cdsu7xlg0.cloudfront.net/png/552009-200.png	Box By Chameleon Design, IN
313	https://d30y9cdsu7xlg0.cloudfront.net/png/692289-200.png	Eggplants By Artem Kovyazin, RU
314	https://d30y9cdsu7xlg0.cloudfront.net/png/698256-200.png	Hand Drawn Bok Choy By Linseed Studio, US
315	https://d30y9cdsu7xlg0.cloudfront.net/png/235556-200.png	Chanterelle By Lisa Staudinger, AT
316	https://d30y9cdsu7xlg0.cloudfront.net/png/590-200.png	Cheese By Edward Boatman, US
317	https://d30y9cdsu7xlg0.cloudfront.net/png/535194-200.png	Apple By Souvik Bhattacharjee
318	https://d30y9cdsu7xlg0.cloudfront.net/png/148598-200.png	Uncredited
319	https://d30y9cdsu7xlg0.cloudfront.net/png/357181-200.png	Uncredited
320	https://d30y9cdsu7xlg0.cloudfront.net/png/688719-200.png	Bowl By Claire Jones, GB
321	https://d30y9cdsu7xlg0.cloudfront.net/png/334121-200.png	Cheese By mubarak cc7, IN
322	https://d30y9cdsu7xlg0.cloudfront.net/png/9050-200.png	Two By Jim Slatton, US
323	https://d30y9cdsu7xlg0.cloudfront.net/png/563218-200.png	Rucola By Yu luck, KR
324	https://d30y9cdsu7xlg0.cloudfront.net/png/563426-200.png	Romaine Lettuce By Yu luck, KR
325	https://d30y9cdsu7xlg0.cloudfront.net/png/469916-200.png	Jellyfish By parkjisun
326	https://d30y9cdsu7xlg0.cloudfront.net/png/545717-200.png	Duck By Lisa Krymova, RU
327	https://d30y9cdsu7xlg0.cloudfront.net/png/563412-200.png	Cabbage By Yu luck, KR
328	https://d30y9cdsu7xlg0.cloudfront.net/png/130532-200.png	Lemon By Creative Stall, PK
329	https://d30y9cdsu7xlg0.cloudfront.net/png/695825-200.png	Uncredited
330	https://d30y9cdsu7xlg0.cloudfront.net/png/75161-200.png	Cashew By Sarah Tan, US
331	https://d30y9cdsu7xlg0.cloudfront.net/png/407-200.png	Salad By Edward Boatman, US
332	https://d30y9cdsu7xlg0.cloudfront.net/png/697538-200.png	Frozen Beef By Denis Shumaylov, RU
333	https://d30y9cdsu7xlg0.cloudfront.net/png/654696-200.png	Parsley By Dairy Free Design, GB
334	https://d30y9cdsu7xlg0.cloudfront.net/png/559683-200.png	Broccoli By Carla Dias, PT
335	https://d30y9cdsu7xlg0.cloudfront.net/png/537905-200.png	Spread Arrow By romzicon, ID
336	https://d30y9cdsu7xlg0.cloudfront.net/png/99261-200.png	Sauce By Arthur Shlain, RU
337	https://d30y9cdsu7xlg0.cloudfront.net/png/96627-200.png	Ice Cream By Lloyd Humphreys, DK
338	https://d30y9cdsu7xlg0.cloudfront.net/png/505082-200.png	Basil By ludmil
339	https://d30y9cdsu7xlg0.cloudfront.net/png/130736-200.png	Banana By Creative Stall, PK
340	https://d30y9cdsu7xlg0.cloudfront.net/png/619480-200.png	Kiwi By ludmil
341	https://d30y9cdsu7xlg0.cloudfront.net/png/675266-200.png	Sorrel By Julia Amadeo, RU
342	https://d30y9cdsu7xlg0.cloudfront.net/png/309-200.png	Mushroom By Edward Boatman, US
343	https://d30y9cdsu7xlg0.cloudfront.net/png/634402-200.png	Cheese By Beatriz Isaura Cantu Brandi, MX
344	https://d30y9cdsu7xlg0.cloudfront.net/png/446159-200.png	Raisin By Artem Kovyazin, RU
345	https://d30y9cdsu7xlg0.cloudfront.net/png/7095-200.png	Sailfish By Mallory Hawes, US
346	https://d30y9cdsu7xlg0.cloudfront.net/png/485998-200.png	Squash Racket By Hea Poh Lin, MY
347	https://d30y9cdsu7xlg0.cloudfront.net/png/674388-200.png	Yoga Man By Anton Anuchin
348	https://d30y9cdsu7xlg0.cloudfront.net/png/114212-200.png	Strawberry By Creative Stall, PK
349	https://d30y9cdsu7xlg0.cloudfront.net/png/348928-200.png	Flan By parkjisun
350	https://d30y9cdsu7xlg0.cloudfront.net/png/614080-200.png	Mint By KEN MURRAY, CA
351	https://d30y9cdsu7xlg0.cloudfront.net/png/240388-200.png	George Harrison By enrico chialastri, IT
352	https://d30y9cdsu7xlg0.cloudfront.net/png/407-200.png	Salad By Edward Boatman, US
353	https://d30y9cdsu7xlg0.cloudfront.net/png/185452-200.png	Thermometer By Holger Ziemann, DE
354	https://d30y9cdsu7xlg0.cloudfront.net/png/44721-200.png	Flower By MarkieAnn Packer, US
355	https://d30y9cdsu7xlg0.cloudfront.net/png/660937-200.png	Mint By Dairy Free Design, GB
356	https://d30y9cdsu7xlg0.cloudfront.net/png/712213-200.png	Persimmon By Arianna Sbaffi, IT
357	https://d30y9cdsu7xlg0.cloudfront.net/png/433198-200.png	La Rioja By Buenos Dias, AR
358	https://d30y9cdsu7xlg0.cloudfront.net/png/113394-200.png	Uncredited
359	https://d30y9cdsu7xlg0.cloudfront.net/png/358493-200.png	Radish By Julia Amadeo, RU
360	https://d30y9cdsu7xlg0.cloudfront.net/png/718656-200.png	Ribcage By Arthur Shlain, RU
361	https://d30y9cdsu7xlg0.cloudfront.net/png/660947-200.png	Dill By Dairy Free Design, GB
362	https://d30y9cdsu7xlg0.cloudfront.net/png/142425-200.png	Parsley By Botho Willer, DE
363	https://d30y9cdsu7xlg0.cloudfront.net/png/646236-200.png	Squid By Jacqueline Fernandes, PT
364	https://d30y9cdsu7xlg0.cloudfront.net/png/687515-200.png	Cucumber By Botho Willer, DE
365	https://d30y9cdsu7xlg0.cloudfront.net/png/163-200.png	Water By Edward Boatman, US
366	https://d30y9cdsu7xlg0.cloudfront.net/png/52570-200.png	Yogurt By Vashte Johnson, US
367	https://d30y9cdsu7xlg0.cloudfront.net/png/707468-200.png	Uncredited
368	https://d30y9cdsu7xlg0.cloudfront.net/png/487288-200.png	Cap By www.mindgraphy.com, ES
369	https://d30y9cdsu7xlg0.cloudfront.net/png/138456-200.png	Seed By blackspike
370	https://d30y9cdsu7xlg0.cloudfront.net/png/35970-200.png	Onion By Brennan Novak, IS
371	https://d30y9cdsu7xlg0.cloudfront.net/png/563655-200.png	Cream Jar By ProSymbols, US
372	https://d30y9cdsu7xlg0.cloudfront.net/png/723571-200.png	Frozen Lamb By Denis Shumaylov, RU
373	https://d30y9cdsu7xlg0.cloudfront.net/png/130671-200.png	Noodles By Creative Stall, PK
374	https://d30y9cdsu7xlg0.cloudfront.net/png/537817-200.png	Lemon By Alberto Gongora, CO
375	https://d30y9cdsu7xlg0.cloudfront.net/png/545434-200.png	Hazelnut By icon 54
376	https://d30y9cdsu7xlg0.cloudfront.net/png/563237-200.png	Walnut By Yu luck, KR
377	https://d30y9cdsu7xlg0.cloudfront.net/png/402997-200.png	Cheese By Laura Barretta, IT
378	https://d30y9cdsu7xlg0.cloudfront.net/png/415230-200.png	Canned Tuna By Artem Kovyazin, RU
379	https://d30y9cdsu7xlg0.cloudfront.net/png/301185-200.png	Goat By Agne Alesiute, LT
380	https://d30y9cdsu7xlg0.cloudfront.net/png/127946-200.png	Tomato By artworkbean, ID
381	https://d30y9cdsu7xlg0.cloudfront.net/png/720545-200.png	Zucchini By VectorBakery, HU
382	https://d30y9cdsu7xlg0.cloudfront.net/png/47829-200.png	Candy By Jason D. Rowley, US
383	https://d30y9cdsu7xlg0.cloudfront.net/png/538332-200.png	Chocolate Truffle By Fernando Affonso, BR
384	https://d30y9cdsu7xlg0.cloudfront.net/png/374-200.png	Oil By Edward Boatman, US
385	https://d30y9cdsu7xlg0.cloudfront.net/png/706154-200.png	Uncredited
386	https://d30y9cdsu7xlg0.cloudfront.net/png/620669-200.png	Pomegranate By Chanut is Industries, TH
387	https://d30y9cdsu7xlg0.cloudfront.net/png/539848-200.png	Humpback Salmon By Sergey Demushkin, RU
388	https://d30y9cdsu7xlg0.cloudfront.net/png/177692-200.png	Peas By Creative Stall, PK
389	https://d30y9cdsu7xlg0.cloudfront.net/png/609821-200.png	Garlic By Khomsun Chaiwong, TH
390	https://d30y9cdsu7xlg0.cloudfront.net/png/697467-200.png	Shallot By Oliviu Stoian, RO
391	https://d30y9cdsu7xlg0.cloudfront.net/png/532843-200.png	Uncredited
392	https://d30y9cdsu7xlg0.cloudfront.net/png/659441-200.png	Dates By Pelin Kahraman, TR
393	https://d30y9cdsu7xlg0.cloudfront.net/png/490197-200.png	Tuna Can By Yazmin Alanis, MX
394	https://d30y9cdsu7xlg0.cloudfront.net/png/283394-200.png	Drought By Chameleon Design, IN
395	https://d30y9cdsu7xlg0.cloudfront.net/png/689334-200.png	Chard By Botho Willer, DE
396	https://d30y9cdsu7xlg0.cloudfront.net/png/13490-200.png	Butter Knife By Regis Biecher, FR
397	https://d30y9cdsu7xlg0.cloudfront.net/png/639369-200.png	Trees By Hamish Buchanan
398	https://d30y9cdsu7xlg0.cloudfront.net/png/357181-200.png	Uncredited
399	https://d30y9cdsu7xlg0.cloudfront.net/png/107968-200.png	Beet By VeenM64
400	https://d30y9cdsu7xlg0.cloudfront.net/png/580698-200.png	Potato By Artem Kovyazin, RU
401	https://d30y9cdsu7xlg0.cloudfront.net/png/597151-200.png	Gelato Melting By Madeleine Bennett, US
402	https://d30y9cdsu7xlg0.cloudfront.net/png/118140-200.png	Goat Cheese By Andrea Harris, US
403	https://d30y9cdsu7xlg0.cloudfront.net/png/115319-200.png	Face By Sridharan S, IN
404	https://d30y9cdsu7xlg0.cloudfront.net/png/208775-200.png	Anchor By Anton Noskov, RU
405	https://d30y9cdsu7xlg0.cloudfront.net/png/105899-200.png	Mango By Creative Stall, PK
406	https://d30y9cdsu7xlg0.cloudfront.net/png/209952-200.png	Halibut Sushi By Lane F. Kinkade, US
407	https://d30y9cdsu7xlg0.cloudfront.net/png/128650-200.png	Basket By Creative Stall, PK
408	https://d30y9cdsu7xlg0.cloudfront.net/png/96615-200.png	Heart By Lloyd Humphreys, DK
409	https://d30y9cdsu7xlg0.cloudfront.net/png/593457-200.png	Blend Manually By Tatina Vazest
410	https://d30y9cdsu7xlg0.cloudfront.net/png/163654-200.png	Ginger By Ryan Speziale, CA
\.


--
-- Name: icons_icon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('icons_icon_id_seq', 410, true);


--
-- Data for Name: order_quantities; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY order_quantities (order_qty_id, product_id, product_qty, order_id) FROM stdin;
\.


--
-- Name: order_quantities_order_qty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('order_quantities_order_qty_id_seq', 1, false);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY orders (order_id, customer_id, placed_at, total, pickup_id, received_at) FROM stdin;
\.


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('orders_order_id_seq', 1, false);


--
-- Data for Name: pickups; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY pickups (pickup_id, name, street_address, description, zipcode, state) FROM stdin;
1	CUSTOMER ADDRESS	CUSTOMER ADDRESS	CUSTOMER ADDRESS	HOME	CA
2	Parnassus Farmers' Market (UCSF)	505 Parnassus Avenue	Wednesdays: 10 a.m-3 p.m.	94122	CA
3	Mission Bay Farmers' Market (UCSF in Mission Bay)	550 Gene Friend Way	Wednesdays: 10:00 AM to 2:00 PM	94158	CA
4	Noe Valley Farmers' Market	3861 24th St.	Saturdays: 8 a.m -1 p.m.	94114	CA
5	Inner Sunset Farmers' Market	1315 8th Ave	Sundays: 9 a.m.-1 p.m.	94122	CA
7	Heart of the City Farmers' Market	1182 Market St.	Sundays: 7 a.m.-5 p.m.<br>Wednesdays: 7 a.m.-5:30 p.m.	94102	CA
6	Inner Richmond: Clement Street Farmer's Market	200 Clement St.	Sundays: 9 a.m.-2 p.m.	94118	CA
\.


--
-- Name: pickups_pickup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('pickups_pickup_id_seq', 7, true);


--
-- Data for Name: product_tags; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY product_tags (prod_tag_id, product_id, tag_id) FROM stdin;
1	1	1
2	2	1
3	2	2
4	3	1
5	3	2
6	4	1
7	5	1
8	5	2
9	6	1
10	6	2
11	7	2
12	7	3
13	8	1
14	8	2
15	10	4
16	11	1
17	11	2
18	12	1
19	12	2
20	13	1
21	13	2
22	14	1
23	14	2
24	15	3
25	16	1
26	16	2
27	17	1
28	17	2
29	18	2
30	18	3
31	19	4
32	20	2
33	20	3
34	21	1
35	21	2
36	23	3
37	24	3
38	25	5
39	25	6
40	29	1
41	29	2
42	29	7
43	30	2
44	30	3
45	31	1
46	32	1
47	33	1
48	33	2
49	34	1
50	34	8
51	35	1
52	36	1
53	36	2
54	37	1
55	38	1
56	38	2
57	39	1
58	40	1
59	41	3
60	42	1
61	43	3
62	44	1
63	45	1
64	45	2
65	46	1
66	46	2
67	47	1
68	47	2
69	48	1
70	49	1
71	49	2
72	50	1
73	50	2
74	51	1
75	51	2
76	52	1
77	52	2
78	52	3
79	53	1
80	53	2
81	54	1
82	54	2
83	55	1
84	55	2
85	56	1
86	56	2
87	57	1
88	58	1
89	58	2
90	59	1
91	59	2
92	60	1
93	61	1
94	61	2
95	62	1
96	63	1
97	64	1
98	65	1
99	66	1
100	66	2
101	67	1
102	67	2
103	68	1
104	68	2
105	69	3
106	70	1
107	71	1
108	72	3
109	73	3
110	74	3
111	75	1
112	75	2
113	76	1
114	76	2
115	78	1
116	80	1
117	80	2
118	81	1
119	81	2
120	82	1
121	82	2
122	83	1
123	83	2
124	84	1
125	84	2
126	85	1
127	86	1
128	86	2
129	87	1
130	87	2
131	88	1
132	89	1
133	89	2
134	90	1
135	90	2
136	91	1
137	92	1
138	92	2
139	93	2
140	93	3
141	94	1
142	94	2
143	95	1
144	95	2
145	96	1
146	97	2
147	97	3
148	97	9
149	100	1
150	100	2
151	101	1
152	102	1
153	103	2
154	103	3
155	104	1
156	104	2
157	105	1
158	105	2
159	106	2
160	106	3
161	107	1
162	107	2
163	108	2
164	108	3
165	109	1
166	109	2
167	110	2
168	111	5
169	111	2
170	112	2
171	112	3
172	113	1
173	113	2
174	114	1
175	114	2
176	115	1
177	115	2
178	118	1
179	118	2
180	119	1
181	119	2
182	120	1
183	120	2
184	121	1
185	121	2
186	122	1
187	122	2
188	122	3
189	123	1
190	123	2
191	124	1
192	124	2
193	125	1
194	125	2
195	126	2
196	126	3
197	127	1
198	127	2
199	128	3
200	129	1
201	129	2
202	130	1
203	130	2
204	131	1
205	131	2
206	132	1
207	132	2
208	133	1
209	133	2
210	134	1
211	134	2
212	135	1
213	135	2
214	136	1
215	136	2
216	137	1
217	137	2
218	138	1
219	138	2
220	139	1
221	139	2
222	140	1
223	140	2
224	141	1
225	141	6
226	142	1
227	142	2
228	143	1
229	143	2
230	144	1
231	144	2
232	145	1
233	145	2
234	146	1
235	146	2
236	147	1
237	147	2
238	148	1
239	148	2
240	149	2
241	149	3
242	150	1
243	150	2
244	151	1
245	151	2
246	152	2
247	153	1
248	153	2
249	154	1
250	154	2
251	155	1
252	155	2
253	156	1
254	156	2
255	157	1
256	157	2
257	158	1
258	158	2
259	159	1
260	159	2
261	160	1
262	160	2
263	161	2
264	161	3
265	162	1
266	162	2
267	163	1
268	163	2
269	164	1
270	164	2
271	165	1
272	165	2
273	166	1
274	167	1
275	167	2
276	168	1
277	168	2
278	169	1
279	169	2
280	170	1
281	170	2
282	171	1
283	171	2
284	172	1
285	172	2
286	173	1
287	173	2
288	174	1
289	174	2
290	175	1
291	175	2
292	176	1
293	179	1
294	179	2
295	180	1
296	180	2
297	181	1
298	181	2
299	182	1
300	182	2
301	183	1
302	183	2
303	184	1
304	184	2
305	185	1
306	185	2
307	186	1
308	186	2
309	187	2
310	187	3
311	188	2
312	188	3
313	189	1
314	189	2
315	190	1
316	190	2
317	191	1
318	191	2
319	192	2
320	192	3
321	193	1
322	193	2
323	194	1
324	194	2
325	195	1
326	195	2
327	196	1
328	196	2
329	197	1
330	197	2
331	198	1
332	198	2
333	199	2
334	199	3
335	200	2
336	200	3
337	201	1
338	202	2
339	202	3
340	202	9
341	203	1
342	203	2
343	204	2
344	204	3
345	204	9
346	205	9
347	205	2
348	205	3
349	206	2
350	206	3
351	206	9
352	207	2
353	207	3
354	207	9
355	208	1
356	208	2
357	209	9
358	209	2
359	210	1
360	210	2
361	211	1
362	211	2
363	212	2
364	212	3
365	213	1
366	213	2
367	214	2
368	214	3
369	215	1
370	215	2
371	216	1
372	216	2
373	217	1
374	217	2
375	217	10
376	217	3
377	218	1
378	218	2
379	219	1
380	219	2
381	220	1
382	220	2
383	221	1
384	221	2
385	222	1
386	222	2
387	223	1
388	223	2
389	223	10
390	223	3
391	224	1
392	224	2
393	225	1
394	225	2
395	226	1
396	226	2
397	226	10
398	226	3
399	227	1
400	227	2
401	228	1
402	228	2
403	228	10
404	228	3
405	229	2
406	229	3
407	230	1
408	230	2
409	231	1
410	231	2
411	233	1
412	233	2
413	237	1
414	237	2
415	239	6
416	240	6
417	241	6
418	242	6
419	243	1
420	244	1
421	244	2
422	245	1
423	246	1
424	246	2
425	247	1
426	247	2
427	248	1
428	248	2
429	249	2
430	249	3
431	250	1
432	250	2
433	251	1
434	254	2
435	254	3
436	255	1
437	255	2
438	256	1
439	256	2
440	257	1
441	258	1
442	260	1
443	261	1
444	261	2
445	262	1
446	262	2
447	263	1
448	263	2
449	264	1
450	264	2
451	266	1
452	266	2
453	267	1
454	267	2
455	268	2
456	268	10
457	268	3
458	269	1
459	269	2
460	270	1
461	270	2
462	271	1
463	271	2
464	272	1
465	272	2
466	273	1
467	273	2
468	274	1
469	278	1
470	278	2
471	279	1
472	279	2
473	280	1
474	280	2
475	281	1
476	281	2
477	282	1
478	282	2
479	283	2
480	283	3
481	284	1
482	284	2
483	285	2
484	286	1
485	286	2
486	287	1
487	287	2
488	288	2
489	288	3
490	289	1
491	289	2
492	290	2
493	290	3
494	291	2
495	291	3
496	292	2
497	292	3
498	293	1
499	293	2
500	294	2
501	294	3
502	295	2
503	295	3
504	297	2
505	297	3
506	298	1
507	298	2
508	299	1
509	299	2
510	300	2
511	300	3
512	301	11
513	303	12
514	303	11
515	303	3
516	304	12
517	305	11
518	306	11
519	307	12
520	307	11
521	307	3
522	310	12
523	310	11
524	310	3
525	311	12
526	311	11
527	311	10
528	311	3
529	312	13
530	312	14
531	312	15
532	312	16
533	313	12
534	313	11
535	313	3
536	314	12
537	314	11
538	314	10
539	314	3
540	315	12
541	315	11
542	315	3
543	316	1
544	316	17
545	316	10
546	317	1
547	317	18
548	318	2
549	319	2
550	319	3
551	320	1
552	320	17
553	320	10
554	321	2
555	321	6
556	321	10
557	321	5
558	321	19
559	321	3
560	321	15
561	321	20
562	322	2
563	322	6
564	322	10
565	322	5
566	322	19
567	322	3
568	322	15
569	322	20
570	323	5
571	323	2
572	323	6
573	323	15
574	323	20
575	323	10
576	323	19
577	323	3
578	324	2
579	325	5
580	325	2
581	325	15
582	325	20
583	325	10
584	325	19
585	325	3
586	326	5
587	326	2
588	326	6
589	326	15
590	326	20
591	326	10
592	326	19
593	326	3
594	327	2
595	327	3
596	328	2
597	328	3
598	330	1
599	330	20
600	330	10
601	330	18
602	331	1
603	332	15
604	332	10
605	333	15
606	333	10
607	334	5
608	334	2
609	334	6
610	334	15
611	334	20
612	334	10
613	334	19
614	334	3
615	335	1
616	335	10
617	336	1
618	336	17
619	336	10
620	336	18
621	337	1
622	338	18
623	339	1
624	339	15
625	339	10
626	339	14
627	340	5
628	340	2
629	340	6
630	340	10
631	340	3
632	341	5
633	341	2
634	341	6
635	341	10
636	341	19
637	341	3
638	342	5
639	342	2
640	342	6
641	342	10
642	342	3
643	343	5
644	343	2
645	343	6
646	343	10
647	343	19
648	343	3
649	344	5
650	344	2
651	345	1
652	345	19
653	346	2
654	346	15
655	346	19
656	347	5
657	347	2
658	347	6
659	347	15
660	347	20
661	347	10
662	347	3
663	348	5
664	348	2
665	348	6
666	348	15
667	348	20
668	348	10
669	348	19
670	348	3
671	349	5
672	349	2
673	349	6
674	349	15
675	349	20
676	349	10
677	349	19
678	349	3
679	350	2
680	350	6
681	350	15
682	350	20
683	350	10
684	350	3
685	351	5
686	351	2
687	351	6
688	351	15
689	351	20
690	351	10
691	351	19
692	351	3
693	352	5
694	352	2
695	352	6
696	352	15
697	352	20
698	352	10
699	352	19
700	352	3
701	353	5
702	353	2
703	353	6
704	353	15
705	353	20
706	353	10
707	353	19
708	353	3
709	354	1
710	354	21
711	355	1
712	355	22
713	355	23
714	355	18
715	356	1
716	356	10
717	357	24
718	357	25
719	359	10
720	359	23
721	360	23
722	363	1
723	363	6
724	363	23
725	363	8
726	364	1
727	364	6
728	364	23
729	364	8
730	365	1
731	365	22
732	365	23
733	365	18
734	366	23
735	366	1
736	366	18
737	366	22
738	367	1
739	368	17
740	368	23
741	369	6
742	369	23
743	370	1
744	370	14
745	370	26
746	371	1
747	371	14
748	371	26
749	372	1
750	372	14
751	372	26
752	373	1
753	373	6
754	373	23
755	373	8
756	374	1
757	374	6
758	374	23
759	374	8
760	375	23
761	375	1
762	375	18
763	375	22
764	376	17
765	376	23
766	376	8
767	377	1
768	377	6
769	377	23
770	378	1
771	378	6
772	378	23
773	379	17
774	379	23
775	380	23
776	380	1
777	380	18
778	380	22
779	381	17
780	381	23
781	382	1
782	382	22
783	382	23
784	382	18
785	382	8
786	383	1
787	383	22
788	383	23
789	383	18
790	385	23
791	385	1
792	386	1
793	386	23
794	386	8
795	387	1
796	387	22
797	387	23
798	387	18
799	388	1
800	388	22
801	388	23
802	388	18
803	389	6
804	389	23
805	390	1
806	390	14
807	390	26
808	391	17
809	391	23
810	392	1
811	392	2
812	392	3
813	392	22
814	393	22
815	393	26
816	394	1
817	394	27
818	394	26
819	395	1
820	395	2
821	395	21
822	395	22
823	396	1
824	396	3
825	396	22
826	396	26
827	397	22
828	397	26
829	398	27
830	398	10
831	398	26
832	399	1
833	399	21
834	400	22
835	400	26
836	401	1
837	401	3
838	401	22
839	401	26
840	402	1
841	402	26
842	402	27
843	403	22
844	405	2
845	405	26
846	406	2
847	406	21
848	407	1
849	407	2
850	407	22
851	407	21
852	408	2
853	408	26
854	409	2
855	409	21
856	410	1
857	410	22
858	410	23
859	410	18
860	410	8
861	411	1
862	411	22
863	411	23
864	411	18
865	412	1
866	413	1
867	414	1
868	416	1
869	416	22
870	416	23
871	416	18
872	416	8
873	417	1
874	417	22
875	417	23
876	417	18
877	417	8
878	418	1
879	419	1
880	419	6
881	420	1
882	421	1
883	421	8
884	422	1
885	422	8
886	423	1
887	423	8
888	424	1
889	425	1
890	425	8
891	426	1
892	427	1
893	427	8
894	428	1
895	429	1
896	430	1
897	431	21
898	431	23
899	433	21
900	433	23
901	435	1
902	435	14
903	435	26
904	436	1
905	436	6
906	436	18
907	437	1
908	437	6
909	438	1
910	438	6
911	439	1
912	439	6
913	440	1
914	440	8
915	441	1
916	442	1
917	442	6
918	443	1
919	444	1
920	444	8
921	445	1
922	446	1
923	446	6
924	447	1
925	447	6
926	448	1
927	448	6
928	449	1
929	449	6
930	450	23
931	450	1
932	450	10
933	451	1
934	451	10
935	451	23
936	452	1
937	452	10
938	452	23
939	453	23
940	453	1
941	453	10
942	454	1
943	454	10
944	454	23
945	455	23
946	455	1
947	455	10
948	456	23
949	456	1
950	456	10
951	457	1
952	457	10
953	457	23
954	458	23
955	458	1
956	458	10
957	459	5
958	459	15
959	459	20
960	459	27
961	460	6
962	460	5
963	460	27
964	460	15
965	460	20
966	461	13
967	461	6
968	461	10
969	461	5
970	462	5
971	462	13
972	462	15
973	462	20
974	463	5
975	463	13
976	463	6
977	463	15
978	463	27
979	463	10
980	464	13
981	464	6
982	464	10
983	464	5
984	465	1
985	465	6
986	465	23
987	465	18
988	466	1
989	466	6
990	466	23
991	466	18
992	467	1
993	467	6
994	467	23
995	467	18
996	468	15
997	469	5
998	469	27
999	469	15
1000	469	20
1001	470	1
1002	470	23
1003	471	1
1004	471	22
1005	471	23
1006	471	18
1007	472	24
1008	472	18
1009	473	1
1010	473	6
1011	473	19
1012	473	24
1013	473	26
1014	474	1
1015	474	21
1016	474	23
1017	475	1
1018	475	6
1019	475	19
1020	475	24
1021	475	26
1022	476	23
1023	476	10
1024	477	1
1025	477	6
1026	477	19
1027	477	24
1028	477	26
1029	478	1
1030	478	23
1031	478	8
1032	479	24
1033	479	18
1034	480	1
1035	480	22
1036	480	23
1037	480	18
1038	481	23
1039	481	10
1040	482	1
1041	482	21
1042	482	23
1043	483	23
1044	483	10
1045	484	28
1046	484	6
1047	484	21
1048	484	22
1049	486	1
1050	486	27
1051	487	13
1052	487	5
1053	487	27
1054	488	1
1055	488	13
1056	488	18
1057	488	10
1058	488	27
1059	488	16
1060	489	13
1061	489	15
1062	489	27
1063	490	13
1064	490	27
1065	490	15
1066	491	1
1067	491	13
1068	491	10
1069	491	27
1070	491	15
1071	491	16
1072	492	1
1073	492	27
1074	492	8
1075	494	1
1076	494	13
1077	494	18
1078	494	10
1079	494	27
1080	494	16
1081	496	1
1082	496	13
1083	496	15
1084	496	20
1085	496	10
1086	496	5
1087	497	1
1088	497	13
1089	497	16
1090	497	10
1091	497	18
1092	498	1
1093	498	13
1094	498	10
1095	498	18
1096	499	1
1097	499	13
1098	499	18
1099	499	10
1100	499	16
1101	500	1
1102	500	27
1103	501	1
1104	502	1
1105	503	1
1106	504	13
1107	504	14
1108	504	27
1109	504	15
1110	505	5
1111	505	13
1112	505	15
1113	505	20
1114	505	27
1115	505	14
1116	505	25
1117	506	5
1118	506	13
1119	506	27
1120	507	5
1121	507	13
1122	507	15
1123	507	20
1124	507	27
1125	507	14
1126	507	25
1127	508	5
1128	508	13
1129	508	15
1130	508	20
1131	508	27
1132	508	14
1133	508	25
1134	509	5
1135	509	13
1136	509	27
1137	510	5
1138	510	13
1139	510	15
1140	510	20
1141	510	27
1142	510	14
1143	510	25
1144	511	13
1145	511	15
1146	511	27
1147	511	14
1148	512	5
1149	512	6
1150	513	1
1151	513	6
1152	515	5
1153	515	6
1154	515	16
1155	518	5
1156	520	5
1157	520	6
1158	520	16
1159	521	10
1160	521	23
1161	522	10
1162	522	23
1163	523	10
1164	523	23
1165	526	1
1166	526	6
1167	527	6
1168	527	5
1169	527	16
1170	529	5
1171	530	1
1172	531	5
1173	531	6
1174	531	16
1175	533	1
1176	533	6
1177	535	5
1178	535	6
1179	535	16
1180	537	1
1181	538	1
1182	538	6
1183	539	5
1184	539	6
1185	539	16
1186	540	6
1187	540	5
1188	540	16
1189	546	1
1190	546	6
1191	546	10
1192	546	20
1193	547	1
1194	547	6
1195	547	10
1196	547	20
1197	548	1
1198	548	6
1199	548	10
1200	548	20
1201	549	1
1202	549	6
1203	549	10
1204	549	20
1205	550	1
1206	550	6
1207	550	20
1208	550	10
1209	551	1
1210	551	6
1211	551	10
1212	551	20
1213	552	1
1214	552	6
1215	552	10
1216	552	20
1217	559	5
1218	559	13
1219	559	15
1220	559	27
1221	559	29
1222	559	19
1223	561	5
1224	561	13
1225	561	15
1226	561	27
1227	561	29
1228	561	19
1229	562	5
1230	562	13
1231	562	15
1232	562	27
1233	562	29
1234	562	19
1235	563	5
1236	563	13
1237	563	15
1238	563	27
1239	563	29
1240	563	19
1241	564	5
1242	564	13
1243	564	15
1244	564	27
1245	564	29
1246	564	19
1247	565	13
1248	565	15
1249	565	20
1250	566	13
1251	566	5
1252	566	27
1253	566	15
1254	566	20
1255	567	13
1256	567	27
1257	567	15
1258	567	20
1259	568	13
1260	568	5
1261	568	27
1262	568	15
1263	568	20
1264	569	13
1265	569	27
1266	569	15
1267	569	20
1268	570	1
1269	570	13
1270	570	6
1271	570	10
1272	570	15
1273	570	20
1274	571	1
1275	571	6
1276	572	1
1277	572	6
1278	574	23
1279	574	20
1280	575	1
1281	575	6
1282	578	20
1283	579	20
1284	580	23
1285	580	20
1286	581	23
1287	581	20
1288	582	1
1289	582	6
1290	583	20
1291	584	20
1292	585	1
1293	585	6
1294	586	6
1295	587	6
1296	588	21
1297	588	23
1298	590	18
1299	590	6
1300	590	30
1301	591	6
1302	592	6
1303	593	21
1304	593	23
1305	595	23
1306	596	8
1307	597	1
1308	598	1
1309	598	6
1310	598	24
1311	598	23
1312	599	8
1313	602	1
1314	602	6
1315	602	18
1316	605	23
1317	606	23
1318	606	8
1319	607	25
1320	608	23
1321	608	2
1322	609	23
1323	609	8
1324	610	1
1325	610	6
1326	611	1
1327	611	24
1328	611	25
1329	612	23
1330	613	23
1331	614	20
1332	615	20
1333	616	23
1334	616	2
1335	617	23
1336	617	2
1337	618	23
1338	618	1
1339	618	6
1340	618	21
1341	619	1
1342	619	26
1343	619	14
1344	620	1
1345	620	24
1346	620	25
1347	621	6
1348	624	6
1349	624	30
1350	625	6
1351	625	30
1352	626	25
1353	627	6
1354	629	23
1355	629	1
1356	629	21
1357	630	23
1358	630	1
1359	630	21
1360	631	20
1361	632	1
1362	632	6
1363	632	30
1364	632	8
1365	633	6
1366	634	1
1367	634	10
1368	636	6
1369	636	23
1370	641	6
1371	642	2
1372	642	23
1373	642	30
1374	644	17
1375	644	23
1376	644	25
1377	645	6
1378	645	30
1379	647	6
1380	647	23
1381	650	1
1382	650	22
1383	650	23
1384	650	18
1385	651	23
1386	651	1
1387	651	6
1388	652	6
1389	653	23
1390	653	1
1391	653	6
1392	654	23
1393	654	24
1394	654	21
1395	655	1
1396	655	18
1397	655	6
1398	655	10
1399	656	24
1400	656	21
1401	656	23
1402	657	17
1403	657	30
1404	658	17
1405	658	30
1406	659	17
1407	659	30
1408	660	21
1409	660	23
1410	662	30
1411	663	22
1412	663	21
1413	663	23
1414	663	25
1415	664	24
1416	664	21
1417	664	23
1418	665	24
1419	665	21
1420	665	23
1421	666	1
1422	666	6
1423	666	30
1424	667	23
1425	668	23
1426	668	24
1427	668	21
1428	669	24
1429	669	21
1430	669	23
1431	670	25
1432	671	25
1433	672	6
1434	672	30
1435	672	18
1436	674	25
1437	675	25
1438	676	23
1439	678	23
1440	678	25
1441	679	17
1442	679	23
1443	680	25
1444	681	25
1445	682	23
1446	682	25
1447	683	25
1448	684	25
1449	685	25
1450	686	25
1451	687	23
1452	687	21
1453	687	22
1454	691	24
1455	691	25
1456	692	6
1457	693	24
1458	693	25
1459	694	24
1460	694	25
1461	695	6
1462	696	25
1463	697	22
1464	697	21
1465	697	23
1466	697	25
1467	698	23
1468	698	2
1469	699	2
1470	699	23
1471	700	23
1472	700	2
1473	702	6
1474	702	30
1475	703	2
1476	703	23
1477	704	24
1478	704	21
1479	704	23
1480	705	23
1481	705	2
1482	706	2
1483	706	23
1484	706	30
1485	707	2
1486	707	23
1487	708	23
1488	708	24
1489	708	21
1490	709	23
1491	709	2
1492	709	30
1493	710	23
1494	710	24
1495	710	21
1496	711	10
1497	711	23
1498	712	24
1499	712	21
1500	712	23
1501	713	13
1502	713	17
1503	713	15
1504	713	27
1505	713	10
1506	714	15
1507	714	27
1508	714	10
1509	715	13
1510	715	10
1511	715	27
1512	715	15
1513	717	10
1514	717	27
1515	717	15
1516	718	15
1517	718	27
1518	718	10
1519	719	1
1520	719	13
1521	719	15
1522	719	20
1523	719	10
1524	720	1
1525	720	13
1526	720	15
1527	720	20
1528	720	10
1529	720	5
1530	721	1
1531	721	5
1532	721	13
1533	721	15
1534	721	20
1535	721	10
1536	722	17
1537	722	15
1538	722	10
1539	722	18
1540	723	1
1541	723	13
1542	723	10
1543	723	5
1544	723	15
1545	723	20
1546	724	15
1547	724	12
1548	724	16
1549	724	10
1550	724	14
1551	724	25
1552	725	1
1553	726	15
1554	726	10
1555	726	18
1556	727	17
1557	727	15
1558	727	10
1559	727	18
1560	728	1
1561	728	5
1562	728	13
1563	728	15
1564	728	20
1565	728	10
1566	729	17
1567	729	15
1568	730	1
1569	730	13
1570	730	10
1571	730	5
1572	730	15
1573	730	20
1574	731	1
1575	731	5
1576	731	13
1577	731	15
1578	731	20
1579	731	10
1580	732	1
1581	732	5
1582	732	13
1583	732	15
1584	732	20
1585	732	10
1586	733	13
1587	733	15
1588	733	10
1589	734	13
1590	734	15
1591	734	10
1592	735	13
1593	735	15
1594	735	10
1595	736	13
1596	736	15
1597	736	10
1598	737	13
1599	737	15
1600	737	10
1601	738	1
1602	738	13
1603	738	10
1604	738	5
1605	738	15
1606	738	20
1607	739	22
1608	740	2
1609	740	22
1610	741	2
1611	741	22
1612	742	2
1613	742	22
1614	743	2
1615	743	22
1616	743	31
1617	744	2
1618	744	22
1619	744	31
1620	745	2
1621	745	22
1622	745	31
1623	746	2
1624	746	22
1625	747	2
1626	747	22
1627	747	31
1628	748	2
1629	748	22
1630	749	2
1631	749	10
1632	750	2
1633	750	10
1634	751	2
1635	751	22
1636	751	31
1637	752	2
1638	752	10
1639	753	2
1640	753	22
1641	753	31
1642	754	1
1643	754	22
1644	754	28
1645	755	1
1646	755	12
1647	755	22
1648	756	1
1649	756	12
1650	756	22
1651	757	12
1652	757	1
1653	757	22
1654	758	1
1655	758	28
1656	758	22
1657	759	1
1658	759	28
1659	759	22
1660	760	1
1661	760	22
1662	760	28
1663	761	1
1664	761	22
1665	761	28
1666	762	1
1667	762	28
1668	762	22
1669	763	1
1670	763	12
1671	763	22
1672	764	12
1673	764	1
1674	764	22
1675	765	1
1676	765	28
1677	765	22
1678	766	12
1679	766	10
1680	766	21
1681	767	1
1682	767	22
1683	767	28
1684	768	1
1685	768	2
1686	768	12
1687	768	22
1688	769	12
1689	769	1
1690	769	2
1691	769	22
1692	770	2
1693	770	22
1694	770	21
1695	771	12
1696	771	1
1697	771	2
1698	771	22
1699	772	2
1700	772	12
1701	772	22
1702	772	21
1703	773	2
1704	773	12
1705	773	22
1706	773	21
1707	774	2
1708	774	21
1709	774	22
1710	775	12
1711	775	10
1712	776	21
1713	776	31
1714	777	28
1715	777	22
1716	778	1
1717	778	28
1718	778	22
1719	779	1
1720	779	22
1721	779	28
1722	780	10
1723	780	21
1724	781	2
1725	781	12
1726	781	21
1727	782	2
1728	782	12
1729	782	21
1730	783	10
1731	783	21
1732	784	2
1733	784	12
1734	784	21
1735	785	10
1736	785	21
1737	786	12
1738	786	22
1739	787	12
1740	787	22
1741	788	12
1742	788	22
1743	789	2
1744	789	12
1745	789	19
1746	789	22
1747	789	21
1748	789	31
1749	789	32
1750	790	12
1751	790	22
1752	790	21
1753	791	12
1754	791	22
1755	791	21
1756	792	12
1757	793	2
1758	793	12
1759	794	22
1760	795	2
1761	795	12
1762	795	19
1763	796	2
1764	796	12
1765	796	22
1766	796	21
1767	797	12
1768	797	24
1769	797	2
1770	797	21
1771	797	22
1772	798	12
1773	798	24
1774	798	22
1775	799	12
1776	799	24
1777	799	2
1778	799	19
1779	799	21
1780	800	12
1781	800	24
1782	800	33
1783	800	21
1784	801	2
1785	801	12
1786	801	19
1787	801	24
1788	801	21
1789	802	2
1790	802	12
1791	802	19
1792	802	24
1793	802	22
1794	802	21
1795	802	31
1796	803	28
1797	803	24
1798	803	33
1799	803	21
1800	804	12
1801	804	19
1802	804	24
1803	804	22
1804	804	21
1805	805	12
1806	805	19
1807	805	24
1808	805	22
1809	805	21
1810	806	12
1811	806	19
1812	806	24
1813	806	22
1814	807	28
1815	807	24
1816	807	33
1817	807	21
1818	808	12
1819	808	19
1820	808	24
1821	808	22
1822	809	2
1823	809	12
1824	809	24
1825	809	33
1826	810	28
1827	810	24
1828	810	33
1829	810	21
1830	811	12
1831	811	19
1832	811	24
1833	811	22
1834	812	28
1835	812	33
1836	812	24
1837	812	21
1838	813	28
1839	813	33
1840	813	24
1841	813	21
1842	814	12
1843	814	24
1844	814	33
1845	814	21
1846	815	28
1847	815	33
1848	815	24
1849	815	21
1850	816	28
1851	816	24
1852	816	33
1853	816	21
1854	817	12
1855	817	24
1856	817	22
1857	817	33
1858	818	12
1859	818	24
1860	818	33
1861	818	21
1862	819	2
1863	819	12
1864	819	19
1865	819	24
1866	819	21
1867	820	28
1868	820	33
1869	820	24
1870	820	21
1871	821	28
1872	821	24
1873	821	33
1874	821	21
1875	822	12
1876	822	24
1877	822	33
1878	822	21
1879	823	12
1880	823	24
1881	823	33
1882	823	21
1883	824	12
1884	824	24
1885	824	33
1886	824	21
1887	825	12
1888	825	19
1889	825	24
1890	825	22
1891	825	21
1892	827	12
1893	827	24
1894	827	2
1895	827	19
1896	827	22
1897	828	12
1898	828	33
1899	828	24
1900	828	21
1901	829	28
1902	829	24
1903	829	33
1904	829	21
1905	830	12
1906	830	19
1907	830	24
1908	830	22
1909	830	21
1910	831	28
1911	831	33
1912	831	24
1913	831	21
1914	832	12
1915	832	19
1916	832	24
1917	832	22
1918	832	33
1919	833	28
1920	833	33
1921	833	24
1922	833	21
1923	834	28
1924	834	24
1925	834	33
1926	834	21
1927	835	2
1928	835	28
1929	835	22
1930	835	21
1931	836	12
1932	836	22
1933	837	12
1934	837	2
1935	837	21
1936	838	12
1937	838	22
1938	839	12
1939	839	21
1940	840	12
1941	840	2
1942	841	28
1943	841	12
1944	841	10
1945	841	22
1946	842	12
1947	842	10
1948	842	22
1949	842	21
1950	843	12
1951	843	10
1952	843	21
1953	843	22
1954	844	28
1955	844	2
1956	844	21
1957	844	22
1958	845	12
1959	845	21
1960	845	22
1961	846	12
1962	846	2
1963	847	2
1964	847	28
1965	847	22
1966	847	21
1967	848	2
1968	848	12
1969	848	21
1970	849	22
1971	849	8
1972	850	26
1973	851	22
1974	851	32
1975	851	12
1976	851	21
1977	852	21
1978	852	26
1979	853	26
1980	854	26
1981	855	2
1982	855	12
1983	855	21
1984	856	2
1985	856	12
1986	856	21
1987	857	2
1988	857	12
1989	857	21
1990	858	12
1991	858	21
1992	858	22
1993	859	12
1994	860	12
1995	860	22
1996	860	21
1997	861	12
1998	861	22
1999	862	12
2000	862	22
2001	862	21
2002	863	12
2003	863	2
2004	863	21
2005	864	28
2006	864	2
2007	864	21
2008	864	22
2009	865	12
2010	865	22
2011	865	21
2012	866	12
2013	866	2
2014	867	12
2015	867	2
2016	868	12
2017	868	22
2018	868	21
2019	869	12
2020	869	2
2021	870	2
2022	870	12
2023	870	22
2024	870	21
2025	871	12
2026	871	22
2027	871	21
2028	872	2
2029	872	12
2030	872	22
2031	872	21
2032	873	12
2033	873	22
2034	873	21
2035	874	12
2036	875	28
2037	875	2
2038	875	21
2039	875	22
2040	876	12
2041	876	24
2042	876	21
2043	877	28
2044	877	2
2045	877	19
2046	877	21
2047	877	22
2048	878	2
2049	878	28
2050	878	19
2051	878	22
2052	878	21
2053	879	2
2054	879	28
2055	879	19
2056	879	22
2057	879	21
2058	880	2
2059	880	12
2060	880	19
2061	880	22
2062	880	21
2063	881	2
2064	881	28
2065	881	19
2066	881	22
2067	881	21
2068	882	2
2069	882	12
2070	882	19
2071	882	22
2072	882	21
2073	883	2
2074	883	28
2075	883	19
2076	883	22
2077	883	21
2078	884	2
2079	884	28
2080	884	19
2081	884	22
2082	884	21
2083	885	2
2084	885	28
2085	885	19
2086	885	22
2087	885	21
2088	886	2
2089	886	12
2090	886	19
2091	886	21
2092	887	2
2093	887	12
2094	887	19
2095	887	21
2096	888	2
2097	888	12
2098	888	19
2099	888	21
2100	889	2
2101	889	12
2102	889	19
2103	889	21
2104	890	2
2105	890	12
2106	890	19
2107	890	21
2108	891	2
2109	891	12
2110	891	19
2111	891	21
2112	892	2
2113	892	12
2114	892	19
2115	892	21
2116	893	2
2117	893	12
2118	893	19
2119	893	21
2120	894	2
2121	894	12
2122	894	19
2123	894	21
2124	895	2
2125	895	12
2126	895	19
2127	895	21
2128	896	2
2129	896	12
2130	896	19
2131	896	21
2132	897	2
2133	897	12
2134	897	19
2135	897	21
2136	898	2
2137	898	12
2138	898	19
2139	898	21
2140	899	2
2141	899	12
2142	899	19
2143	899	21
2144	900	2
2145	900	12
2146	900	19
2147	900	21
2148	901	2
2149	901	12
2150	901	19
2151	901	21
2152	902	2
2153	902	12
2154	902	19
2155	902	21
2156	903	5
2157	904	12
2158	904	22
2159	904	21
2160	905	12
2161	906	12
2162	907	12
2163	908	12
2164	909	12
2165	910	28
2166	910	10
2167	910	22
2168	911	12
2169	912	12
2170	913	23
2171	914	12
2172	914	2
2173	914	21
2174	914	22
2175	915	17
2176	915	2
2177	915	12
2178	915	22
2179	916	12
2180	916	10
2181	916	22
2182	918	26
2183	919	12
2184	919	22
2185	920	12
2186	920	2
2187	920	21
2188	920	22
2189	921	2
2190	921	12
2191	921	21
2192	922	12
2193	922	2
2194	922	21
2195	922	22
2196	923	23
2197	924	12
2198	924	2
2199	924	21
2200	924	22
2201	925	21
2202	925	12
2203	926	21
2204	926	12
2205	927	23
2206	928	12
2207	928	22
2208	929	12
2209	929	22
2210	930	12
2211	930	21
2212	931	23
2213	932	12
2214	932	24
2215	932	2
2216	932	21
2217	932	22
2218	933	12
2219	933	2
2220	933	21
2221	933	22
2222	934	12
2223	934	2
2224	934	21
2225	934	22
2226	935	23
2227	936	2
2228	936	12
2229	936	24
2230	936	21
2231	937	2
2232	937	12
2233	937	24
2234	937	22
2235	937	21
2236	938	2
2237	938	12
2238	938	24
2239	938	22
2240	938	21
2241	939	2
2242	939	12
2243	939	24
2244	939	33
2245	939	21
2246	940	12
2247	940	24
2248	940	22
2249	940	21
2250	941	12
2251	941	24
2252	942	2
2253	942	12
2254	942	24
2255	942	21
2256	943	2
2257	943	12
2258	943	24
2259	943	33
2260	943	21
2261	944	12
2262	944	24
2263	944	22
2264	944	21
2265	945	28
2266	945	24
2267	945	2
2268	945	21
2269	945	22
2270	946	2
2271	946	12
2272	946	24
2273	946	33
2274	946	21
2275	950	2
2276	950	12
2277	950	24
2278	950	22
2279	950	21
2280	951	21
2281	951	31
2282	952	1
2283	952	28
2284	952	10
2285	952	22
2286	953	1
2287	953	28
2288	953	10
2289	953	22
2290	954	1
2291	954	28
2292	954	10
2293	954	22
2294	955	28
2295	955	10
2296	955	22
2297	956	1
2298	956	28
2299	956	10
2300	956	22
2301	957	28
2302	957	10
2303	957	22
2304	958	16
2305	958	32
2306	959	24
2307	959	22
2308	960	32
2309	960	16
2310	961	24
2311	961	22
2312	962	23
2313	963	32
2314	963	16
2315	964	32
2316	964	16
2317	965	24
2318	965	22
2319	966	24
2320	966	22
2321	967	23
2322	968	23
2323	969	23
2324	970	23
2325	971	5
2326	971	13
2327	971	2
2328	971	6
2329	971	28
2330	971	16
2331	971	27
2332	971	10
2333	971	19
2334	971	21
2335	973	23
2336	974	6
2337	975	2
2338	975	12
2339	975	19
2340	975	24
2341	975	22
2342	975	21
2343	976	21
2344	976	31
2345	978	26
2346	980	23
2347	980	8
2348	981	23
2349	981	8
2350	982	23
2351	983	23
2352	984	23
2353	985	23
2354	986	23
2355	987	23
2356	988	23
2357	989	2
2358	989	12
2359	989	24
2360	989	21
2361	990	5
2362	990	15
2363	990	20
2364	990	10
2365	991	5
2366	991	6
2367	993	15
2368	993	20
2369	993	12
2370	995	5
2371	995	10
2372	996	5
2373	996	15
2374	996	20
2375	996	10
2376	997	13
2377	997	15
2378	997	20
2379	997	16
2380	998	13
2381	998	15
2382	998	20
2383	998	16
2384	999	13
2385	999	15
2386	999	16
2387	1000	5
2388	1000	6
2389	1001	12
2390	1002	12
2391	1002	33
2392	1002	24
2393	1002	21
2394	1003	12
2395	1003	2
2396	1003	21
2397	1003	22
2398	1005	28
2399	1005	2
2400	1005	19
2401	1005	21
2402	1005	22
2403	1006	2
2404	1006	12
2405	1006	19
2406	1006	21
2407	1007	2
2408	1007	12
2409	1007	19
2410	1007	24
2411	1007	22
2412	1008	2
2413	1008	12
2414	1008	19
2415	1008	24
2416	1008	22
2417	1009	2
2418	1009	12
2419	1009	19
2420	1009	21
2421	1010	28
2422	1010	2
2423	1010	19
2424	1010	21
2425	1010	22
2426	1011	12
2427	1011	2
2428	1011	21
2429	1011	22
2430	1012	12
2431	1012	2
2432	1012	21
2433	1012	22
2434	1013	12
2435	1013	2
2436	1013	21
2437	1013	22
2438	1014	2
2439	1014	12
2440	1014	22
2441	1015	2
2442	1015	12
2443	1015	19
2444	1015	24
2445	1015	22
2446	1016	12
2447	1016	2
2448	1016	21
2449	1016	22
2450	1017	2
2451	1017	28
2452	1017	22
2453	1017	21
2454	1018	12
2455	1018	24
2456	1018	33
2457	1018	21
2458	1019	2
2459	1019	12
2460	1019	19
2461	1019	24
2462	1019	22
2463	1020	12
2464	1020	2
2465	1020	21
2466	1020	22
2467	1021	12
2468	1021	2
2469	1021	21
2470	1021	22
2471	1022	2
2472	1022	28
2473	1022	19
2474	1024	28
2475	1024	4
2476	1025	2
2477	1025	28
2478	1025	19
2479	1027	12
2480	1027	4
2481	1028	12
2482	1028	4
2483	1031	12
2484	1031	4
2485	1032	12
2486	1032	4
2487	1033	12
2488	1033	4
2489	1034	12
2490	1034	4
2491	1035	28
2492	1035	19
2493	1035	4
2494	1036	19
2495	1037	28
2496	1037	19
2497	1037	4
2498	1038	28
2499	1038	19
2500	1038	4
2501	1039	12
2502	1039	34
2503	1039	4
2504	1040	12
2505	1040	4
2506	1041	12
2507	1041	4
2508	1042	28
2509	1042	4
2510	1043	12
2511	1043	4
2512	1044	12
2513	1044	4
2514	1045	28
2515	1045	4
2516	1046	12
2517	1046	4
2518	1047	12
2519	1047	4
2520	1048	12
2521	1048	4
2522	1049	12
2523	1049	4
2524	1050	12
2525	1050	4
2526	1052	4
2527	1057	17
2528	1057	10
2529	1057	18
2530	1058	34
2531	1058	4
2532	1059	10
2533	1059	34
2534	1059	4
2535	1059	18
2536	1060	17
2537	1060	10
2538	1060	18
2539	1061	10
2540	1061	34
2541	1061	4
2542	1061	18
2543	1062	17
2544	1062	10
2545	1063	17
2546	1063	10
2547	1064	34
2548	1064	4
2549	1065	34
2550	1065	4
2551	1066	34
2552	1066	4
2553	1067	34
2554	1067	4
\.


--
-- Name: product_tags_prod_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('product_tags_prod_tag_id_seq', 2554, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY products (product_id, name, description, weight, unit, price, price_per, per_unit, aisle, category, img, icon_id, color, search_term, search_strength) FROM stdin;
69	Valencia Orange Duo	Valencia Oranges are the ultimate off-season citrus. They produce in the summer, while most citrus fruits in the winter. They're a lower acid, high sugar citrus that are great for juicing.	2	count	2.79	2.79	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/lHTh80VOSDK8adxQIrHU_20160708-BernardRanch_Valencia_Duo_MG_4979.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
76	Organic Limequats	The Limequat is, as its name suggests, the result of a cross between a Key Lime and a Kumquat that dates back to 1909.  It's aromatic like a lime, with the texture of a kumquat.  Very few cocktails wouldn't benefit from a Limequat garnish.	0.5	lb	3.99	7.98	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/jhPMkDXHSuMR8RMLywEe_Limequat_Deer_Creek_Heights_Ranch_Buck_Brand.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
119	Organic Medium Artichoke Duo	The Santa Cruz and Watsonville region is world renowned for it's artichoke production, and Rodoni Farms has led the way in growing them organically. Artichokes are surprisingly versatile. While they are easily enjoyed by boiling with lemon and eating with a garlic aioli, one should experiment with soups, dips and using the hearts to top a home baked pizza.	2	count	3.99	3.33	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/O3CPwDCWScm9GbBhNyOB_artichokes.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
194	Pre-Washed Organic Salad Mix	A delightfully fresh mix of sweet, tender baby lettuces with other baby salad greens. You might find small leaves of frisee, tatsoi, radicchio, escarole, baby beet greens and other greens with earthy, spicy and/or bitter flavors.Comes pre-washed, though we always suggest an extra rinse!	0.5	lb	3.79	7.58	lb	Produce	Greens	http://goodeggs1.imgix.net/product_photos/Y1yIPH3RpaFIgUJuiJcw__BWnWRQNxD3qcTNVtBFGuNAFEJdOd4_b71bNdP75Wtw.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
197	Organic Pre-Washed Salanova Salad Mix	Salanova is a beautiful mix of baby Red and Green Butter and Oak Leaf Lettuce varieties. Sweet and tender, perfect for a beautiful salad. Wash, dress and serve!Comes pre-washed, but we always suggest an extra rinse!	0.5	lb	3.99	7.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/odG1Xm0CRnDOzfnmx9RO_salad_mix_05.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
201	Organic Chioggia Radicchio	Crisp, tender, and slightly bitter, this radicchio makes a tasty addition to a cool-season salad and is also delicious gently braised in a salty, vinegary broth.	1	head	3.99	7.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/JZGNqJxQSg4mPJiGZoWZ_FK1A9469.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
202	Pre-Washed Aquaponic Salad Mix	Farmers Choice!  We harvest the freshest heads each week to delight your senses with a unique and delicious combination of flavors, textures and colors.  Contains 3-5 of the following varieties: By buying our lettuce mix, you just saved 7+ gallons of water compared to a similar mix grown in soil!Red ButterGreen ButterRed Oakleaf Green OakleafRed CrispGreen CrispRed IncisedGreen IncisedGalacticBreen	0.5	lb	3.99	7.98	lb	Produce	Greens	http://goodeggs1.imgix.net/product_photos/MKNtr8BS600raInGOZcA_lettuce_04.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
203	Organic Salad Mix	A colorful mix of red and green leaf baby lettuces.	0.5	lb	3.99	7.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/pVbwHzcvQEqR44iddFC9_wsmW-glvIbktwfADV_AehykT7clLJ-dzvMCvY3pHBHA.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
204	Pre-Washed Family-Sized Aquaponic Salad Mix	Enough delicious salad mix to serve the whole family a few nights in a row, or perfect for your next large dinner party! We harvest the freshest heads each week to delight your senses with a unique and delicious combination of flavors, textures and colors.  By buying our lettuce mix, you just saved 42+ gallons of water compared to a similar mix grown in soil! Contains 3-5 of the following varieties: Red ButterGreen ButterRed Oakleaf Green OakleafRed CrispGreen CrispRed IncisedGreen IncisedGalacticBreen	3	lb	22.99	7.66	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/83RdURTKj5POdN61sYAb_salad_mix_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
216	Organic Escarole	Escarole is one of the sweetest of the characteristically bitter chicory family.  This beautifully blanched head of escarole can be braised, grilled or chopped up raw into a salad.  Top it with some fat, salt and acidity to turn what little bitterness this winter veggie has into a bright and lively symphony of flavors.	1	head	3.99	7.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/g51zrTliQpTlEFKIMawN_Escarole.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
218	Organic Salad Mix	A combination of some of your favorite New Natives micro and baby greens. Sunflower Greens, Pea Shoots, and our Micro Arugula, Broccoli, Kale, Kohlrabi, and Daikon Radish ready to mix straight into your salad bowl. With New Natives' Salad Mix it is easier than ever to bolster your salad with great nutrition and amazing flavor.From the USDA Agricultural Research Service: In general, microgreens contained considerably higher levels of vitamins and carotenoids—about five times greater—than their mature plant counterparts, .......http//en.wikipedia.org/wiki/Micro_greens 	4	oz	4.99	1.25	oz	Produce	Greens	http://goodeggs1.imgix.net/product_photos/OmGkEWwUREGvDRPcZiBp_T2kwFO0Vo4x3v-x7bMif-0IxJiiipEJbLbue5fJfeHQ.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
219	Organic Pea Shoots (4oz)	Very young green pea shoots with a fresh pea flavor for salads, wraps, quick stir fry, or wilting with hot water. Eat fresh in salads for that fresh pea flavor all year. Great crunch in a fresh spring roll. For an Asian noodle dish, place pea shoots in the colander and drain the hot noodle over them for the perfect wilt. For your stir fry drop the pea shoots in to retain some crunch. All young greens concentrate the nutrition of the mature vegetable.Packed with vitamins A, C and folic acid, Pea Shoots are a delicious, nutritious modern slant on the classic British garden pea. Lyndel Costain, B.Sc.RD, award winning dietitian and author of Super Nutrients Handbook, says, “Pea Shoots are a nutritious leaf with high levels of vitamin C and vitamin A. A 50g bag of these tasty greens offers more than half of the RDA for vitamin C, a quarter of the RDA for vitamin A and significant amounts of folic acid. It is great news that this healthy and simple to prepare vegetable leaf is readily available to consumers.”From http://www.peashoots.com/peashoots-nutrition.htm	4	oz	3.99	1.0	oz	Produce	Greens	http://goodeggs1.imgix.net/product_photos/8re0JSqSYyDfeB9uxwbI_UYqaOC-Tum2HJrBVLxp_fBox5ZfHFN0FyyHSxBjCxDk.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
224	Organic Micro Mix	Amazing flavors unfolding on your tongue with this mix. From solid yummy broccoli to zinger arugula, and a few in between. Get all the different nutritional benefits that micro greens offer individually, combined in every mouthful.From the USDA Agricultural Research Service: In general, microgreens contained considerably higher levels of vitamins and carotenoids—about five times greater—than their mature plant counterparts, .......http//en.wikipedia.org/wiki/Micro_greens 	2.5	oz	4.49	1.8	oz	Produce	Greens	http://goodeggs1.imgix.net/product_photos/bIuHJ3Tq6gJaXWRiIFLw_YInwhLt1EKnEmmkOVCfozeC5F0j51FdsQaDpTE_dMx4.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
230	Organic Purslane	Purslane, otherwise known as Pigweed or Verdolaga, is a succulent that often grows as a weed, but is harvested for consumption by adventurous cooks. Its taste is slightly sour and cool, somewhat like a bright cucumber, with a bit of salinity. Its leaves are great added to summer salads. As a succulent, it has a somewhat mucilaginous quality, making it an excellent (and delicious) thickener for soups and stews.Purslane is also extremely nutritious! It contains a huge amount of omega-3 fatty acids and many essential vitamins and minerals, including vitamin A, vitamin B, vitamin C, vitamin E, carotenoids, calcium, magnesium, potassium, and iron.	0.5	lb	2.99	5.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/s9BSYfA1SequdOdPv4S1_purslane_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
227	Organic Sprouted Wheat	With highly-touted nutritional benefits, this Sprouted Wheat can be a healthy addition, chewy, and hearty addition to any salad.	8	oz	2.99	0.37	oz	Produce	Greens	http://goodeggs2.imgix.net/product_photos/p5hhYdfZQdOd5akXXtFj_20160910-GreenSkies_SproutedWheat_MG_0695.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	288	\N	\N	\N
300	Mixed Mini Decorative Gourd Trio	Nothing says autumn like Decorative Gourds. With Oak Hill Farm's mini versions of this festive, decorative curcurbit, you'll be able to make your table beautiful while leaving plenty of room for the food!	3	count	7.99	4.0	lb	Produce	Flowers	http://goodeggs1.imgix.net/product_photos/hOz3sblLSJCIXEyhwQqz_20161003-Oakhill_GourdTrio_MG_2542.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
312	Raw Coconut Meat (Frozen)	You can now get the raw coconut meat that we cut fresh out of the young thai coconuts. The meat is immediately packaged and frozen with a shelf life of at least 6 months. Add to: Smoothies!Vegan WrapsYogurtPuddingCurriesPiesIce CreamOr, you can dry it and make Coconut ChipsIngredients: raw frozen young thai coconut meat100% Raw and VeganNo Preservatives or AdditivesDairy, Soy, Carrageenan, and Gluten FreeHealthy and Delicious!   Raw coconut meat naturally contains many viable living enzymes, which are helpful for digestion and metabolism.  It is high in lauric acid, which is used by the body to make disease-fighting fatty acids. Raw coconut meat is also high in essential fat burning energy giving Medium Chain Fatty Acids as well as concentrated trace minerals: Manganese-Potssium-Copper.The coconut meat has no preservatives, so if you are not ready to consume, please keep it frozen at all times.  The frozen coconut meat can keep for at least six months in the freezer, but we recommend consuming it within 9 months from purchase.To Consume: Please place coconut meat pouch to defrost in the refrigerator.  Once the coconut meat is completely defrosted in the refrigerator, unopened, the coconut meat may last up to 4 days in the refrigerator.  For faster defrost, place the frozen coconut meat pouch into a cold water bath. When it is defrosted, please consume right away or place it back into the fridge while the coconut meat pouch is still cold to touch.	12	oz	4.49	5.99	lb	Produce	Frozen Fruit & Vegetables	http://goodeggs2.imgix.net/product_photos/wFdpzK48RLKaqUV7VAlG_coconutsale.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
322	Sun Dried Peaches (7oz)	Our organic, sun-dried peaches are sulfur-free and soaked with\nCalifornia sunshine. We call ‘em ‘good and ugly’. The peaches are grown at \nFull Belly Farm, a certified organic grower in Guinda, CA. Absolutely \nnothing is added: no salt, no oil, no sugar. All of our products use ONLY organic ingredients.Our products are packaged in resealable, reusable zip bags for your convenience.	7	oz	10.49	1.5	oz	Produce	Fruit & Veggie Snacks	http://goodeggs2.imgix.net/product_photos/UUqX69UdTrqfhGcPXnKG_FK1A7346.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
323	Raisins (7oz)	Our Red Flame Raisins provide a natural energy booster anytime of the day. The plump and juicy Red Flame variety raisins are not coated in any oil, unlike most raisins on the market. Benzler Farms in Fresno, CA is a certified organic grower and are a third generation farm. All of our products use ONLY organic ingredients. They are packaged in resealable, reusable zip bags for your convenience.	7	oz	3.69	0.53	oz	Produce	Fruit & Veggie Snacks	http://goodeggs1.imgix.net/product_photos/2qJ9riOZQCSj0AiubEbs_FK1A3114.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
299	Organic Holiday Bouquet	A beautiful mix of seasonally changing blooms, these bouquets are sure to spruce up any holiday table.	1	count	24.99	\N	\N	Produce	Flowers	http://goodeggs2.imgix.net/product_photos/al4TQdFESyuvPEvgJU3z_20161102-ThomasFarm_LargeHolidayBouquet_MG_5969%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	318	\N	\N	\N
106	Georgia Jet Sweet Potatoes	Buttery soft and super sweet, this orange fleshed sweet potato has a deep red skin. Perfect for baking, stuffing, or mashing. These pluots are grown by Kibo Farm in Sonoma County, CA, and are brought to chefs and retailers throughout the Bay Area by F.E.E.D. Sonoma.	2	lb	5.99	3.0	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/xayoa8ARnufZOgtA80Lq_unspecified-5.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	255	\N	\N	\N
348	Four Mix	Our Four Mix is singularly yummy. The almonds are the flavorful Carmel variety, our plump\n and un-coated raisins are Red Flames, our walnuts are Chandler & \nHartleys and our sun-dried, sulfur-free peaches are heirloom \nSuncrest and O'Henrys. Absolutely nothing is added: no salt, no oil, no \nsugar. All of our products use ONLY organic ingredients and are packaged in resealable, reusable zip bags for \nyour convenience.Ingredients: almonds*, raisins*, walnuts*, peaches* (organic ingredients*). Contains: tree nuts.	7	oz	7.29	1.04	oz	Produce	Dried Fruit & Nuts	http://goodeggs1.imgix.net/product_photos/nk5phK2KTQC0XarwbVwY_FK1A7309.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
349	Three Mix (16oz)	Our Three Mix  provides a super combo of protein, omega 3 fatty acids \nand essential minerals. The almonds are the flavorful Carmel variety, \nour plump\n and un-coated raisins are Red Flame's & our walnuts are Chandler \n& \nHartley's. Absolutely nothing is added: no salt, no oil, no \nsugar.All of our products use ONLY organic ingredients. Our products are packaged in resealable, reusable zip bags for \nyour convenience.	16	oz	13.59	0.85	oz	Produce	Dried Fruit & Nuts	http://goodeggs1.imgix.net/product_photos/2U7jtEIbSIE8nUKen3wV_FK1A7282.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
350	Three Mix (2.4oz)	Our Three Mix  provides a super combo of protein, omega 3 fatty acids and essential minerals. The almonds are the flavorful Carmel variety, our plump\n and un-coated raisins are Red Flame's & our walnuts are Chandler & \nHartley's. Absolutely nothing is added: no salt, no oil, no \nsugar.All of our products use ONLY organic ingredients. Our products are packaged in resealable, reusable zip bags for \nyour convenience.	2.4	oz	2.99	1.25	oz	Produce	Dried Fruit & Nuts	http://goodeggs1.imgix.net/product_photos/2U7jtEIbSIE8nUKen3wV_FK1A7282.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
351	Four Mix (2.2oz)	Our Four Mix is singularly yummy. The almonds are the flavorful Carmel variety, our plump\n and un-coated raisins are Red Flame's, our walnuts are Chandler & \nHartley's and our sun-dried, sulfur-free peaches are heirloom \nSuncrest and O'Henry's. Absolutely nothing is added: no salt, no oil, no \nsugar.All of our products use ONLY organic ingredients. Our products are packaged in resealable, reusable zip bags for \nyour convenience.	2.2	oz	2.99	1.36	oz	Produce	Dried Fruit & Nuts	http://goodeggs1.imgix.net/product_photos/nk5phK2KTQC0XarwbVwY_FK1A7309.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
352	Two Mix (3.5oz)	Our Two Mix provides a natural\nenergy booster anytime of the day. The almonds are the flavorful Carmel variety & \nour plump\n and un-coated raisins are Red Flame's. Absolutely nothing is added: no salt, no oil, no \nsugar.All of our products use ONLY organic ingredients. Our trail mixes are packaged in resealable, reusable zip bags for \nyour convenience.\n	3.5	oz	3.69	1.05	oz	Produce	Dried Fruit & Nuts	http://goodeggs1.imgix.net/product_photos/vrhIdFKuTT6nuVYBcrUQ_FK1A7165.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
353	Three Mix (7oz)	Our Three Mix  provides a super combo of protein, omega 3 fatty acids \nand essential minerals. The almonds are the flavorful Carmel variety, \nour plump\n and un-coated raisins are Red Flame's & our walnuts are Chandler \n& \nHartley's. Absolutely nothing is added: no salt, no oil, no \nsugar.All of our products use ONLY organic ingredients. Our products are packaged in resealable, reusable zip bags for \nyour convenience.	7	oz	7.19	1.03	oz	Produce	Dried Fruit & Nuts	http://goodeggs1.imgix.net/product_photos/2U7jtEIbSIE8nUKen3wV_FK1A7282.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
361	Harbison	Harbison is named for Anne Harbison, affectionately known as the grandmother of Greensboro. Along with breathtaking views, traditions and people are part of what makes Vermont's working landscape special; we're proud to honor Ms. Harbison's contribution with this cheese.Harbison is a soft-ripened cheese with a rustic, bloomy rind. Young cheeses are wrapped in strips of spruce cambium, the tree's inner bark layer, harvested from the woodlands of Jasper Hill. The spoonable texture begins to develop in our vaults, though the paste continues to soften on the way to market. Harbison is woodsy and sweet, balanced with lemon, mustard, and vegetal flavors.Harbison is a great excuse to gather a few friends and scoop into a decadent treat. When a bit younger, the bark can be peeled away for sliced portioning. If the bark has fused with a more loosened paste, then the best approach is to leave the bark intact and spoon out portions from the top. Pair with oaked white wine, or barrel-aged sour beer. Fruit mostarda and crusty bread make nice accompaniments.Ingredients: Pasteurized cows milk, rennet, cultures, salt, 	10	oz	16.49	26.38	lb	Dairy	T-Day Essentials	http://goodeggs1.imgix.net/product_photos/PLGcM8X0RqyYfcMy13eQ_20160921-JasperHill_Harbison_MG_1519.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
362	"Best of the West" Cheese Plate	From creamy, earthy Mt. Tam to Pt. Reye's tangy, sharp Original Blue, our Good Eggs cheese specialist Erin carefully selected each one to bring you a deliciously balanced cheese board. Whether your favorite is hard cheese or soft, salty cheese or sweet, you can't go wrong with this all-star tour of West Coast cheeses and crackers. Perfect for wowing your friends at a holiday party, and for pairing with your favorite wine or beer!Mt. Tam from Cowgirl Creamery, 8 ozOriginal Blue Cheese from Pt. Reyes Farmstead, 6 ozRioly Run from Stepladder Creamery, 8 ozAtika from Tomales Farmstead Creamery, 5 ozBlack Eyed Susan from Garden Variety Cheese, 4 ozWalnut Pan Forte Crostini from Rustic Bakery , 5 ozActual products may vary from those featured in photograph, but products listed here will always be accurate.Contains: Milk, tree nuts, wheat.	1	count	61.99	\N	\N	Dairy	T-Day Essentials	http://goodeggs2.imgix.net/product_photos/7C13LBW1RmCvtImQfhLO_20161028-CheesePlates_BestofTheWest_MG_5670.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
385	Organic Half and Half	Clover Organic Half & Half is creamy, fresh and sweet. It's rBST and antibiotic-free, and the dairy has been certified by the American Humane Association since 2000. Made of equal parts cream and delicious fresh milk, this Organic Half & Half is perfect for splashing into tea and coffee or adding to baking projects, mashed veggies, soups, and gratins.Ingredients: organic milk, organic cream.Contains: milk.	1	pint	2.49	0.16	fl oz	Dairy	Cream	http://goodeggs2.imgix.net/product_photos/lRTcZGSsS7R0d6c3Lbsg_FK1A2031.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
386	Organic Half and Half	Clover Organic Half & Half is creamy, fresh and sweet. It's rBST and antibiotic-free, and the dairy has been certified by the American Humane Association since 2000. Made of equal parts cream and delicious fresh milk, this Organic Half & Half is perfect for splashing into tea and coffee or adding to baking projects, mashed veggies, soups, and gratins.Ingredients: organic milk, organic cream.Contains: milk.	1	quart	4.29	0.13	fl oz	Dairy	Cream	http://goodeggs2.imgix.net/product_photos/xuDRxQsOT9Kej7cydZGL_FK1A0595.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
387	Organic Half & Half	Straus Family Creamery's Half & Half is creamy, fresh and sweet. It's made up of their organic milk and organic cream and has an 11% butterfat content, giving it a rich and delicious flavor. It's lightly homogenized and pasteurized. Perfect for adding to your morning coffee and tea, for baking, or for stirring into soups, veggie mashes, and gratins.Ingredients: organic milk, organic cream.Contains: milk.	1	pint	2.99	0.19	fl oz	Dairy	Cream	http://goodeggs1.imgix.net/product_photos/pBJgDwveSY2Jepu1ekGK_FK1A5774.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
388	Organic Half & Half	Straus Family Creamery's Half & Half is creamy, fresh and sweet. It's made up of their organic milk and organic cream and has an 11% butterfat content, giving it a rich and delicious flavor. It's lightly homogenized and pasteurized. Perfect for adding to your morning coffee and tea, for baking, or for stirring into soups, veggie mashes, and gratins.Ingredients: organic milk, organic cream.Contains: milk.	1	quart	4.79	0.15	fl oz	Dairy	Cream	http://goodeggs1.imgix.net/product_photos/9ZeDfFMMSgLuLp91BRxF_XyGXMnUr5X1F7mWXySCfkUoDIERjWiAjxq89NqMeVeU.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
389	Grade A Cultured Low Fat Buttermilk	Cultured with lactic acid bacteria for flavor and thickness.Ingredients: Nonfat milk, milk, culture and salt	1	quart	1.79	0.06	fl oz	Dairy	Cream	http://goodeggs1.imgix.net/product_photos/S6bBoHRuQT2xXDVSqZaV_FK1A9924.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
391	Half & Half	Clover sources its rBST and anti-biotic-free milk and cream from a select group of small family farms on the North Coast of California. Our milk and cream arrive at the plant the same day the cows are milked and it is fresh pasteurized* to ensure quality while preserving its fresh farm taste and nutritional value. We do this so your family can enjoy Clover Milk and Cream products in a good conscience and good health!Ingredients: Milk and cream	1	quart	2.79	0.09	fl oz	Dairy	Cream	http://goodeggs2.imgix.net/product_photos/iZCABPCpT2aWVgPyTqBH_20160422-Clover_OneQuart_HalfNHalf_MG_7823.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
301	Frozen Strawberries	Treat yourself to these Oregon strawberries – deep red through and through, delicate and deliciously sweet.	10	oz	4.79	7.66	lb	Produce	Frozen Fruit & Vegetables	http://goodeggs1.imgix.net/product_photos/7T8cFUOtRaCYeCaQqzWm_FK1A9918.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	348	\N	\N	\N
123	Organic Spaghetti Squash	This incredible squash has spaghetti-like flesh! Bake the squash, fork out the stringy flesh and sauté with onions, garlic and parsley for a unique take on aglio olio!	1	count	4.99	1.43	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/VeD3MIkxT1aShR7918sM_squash_spaghetti_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	346	\N	\N	\N
527	Malted Vanilla with Peanut Brittle	This flavor combines malted vanilla ice cream with house make peanut brittle (made with Virginia peanuts) and TCHO milk chocolate pieces. (This flavor is co-owner Anne Walker’s favorite).Cream*, Milk*, Sugar*, Egg Yolks*, Malt Powder*, Milk Chocolate*, Tapioca Syrup*, Peanuts, Vanilla Beans, Butter, Salt, Baking Soda  (*= organic)Proudly made with Straus Family Creamery organic dairy located in Marshall, in West Marin, only 35 miles away.	1	pint	8.99	0.56	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/cYKxtaPSSrONXFoC25US_FK1A9349.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
151	Organic Pink Beauty Radishes	Crunchy with a slight kick, these beautifully vibrant radishes will add some pizazz to your next green salad.	1	bunch	1.99	7.96	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/q1wdqvezQC6A7YnAV5Bx_radish_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	319	\N	\N	\N
553	Boozy Sauce Duo	Fernet Fudge and Bourbon Caramel are even better together. Break these out at dessert and you'll be the star of your Thanksgiving dinner!Ingredients: Bourbon caramel: sugar, water, bourbon, tapioca syrup, salt. Fernet chocolate sauce: water, sugar, tapioca syrup, cocoa powder, salt, 72% chocolate, Fernet.	2	count	19.99	1.11	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/pfjyhRocRm6Sibn7STkE_20161103-HumphreySlocombe_SauceDuo_MG_6159.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
185	Organic Large Green Cabbage	Sweet and hearty, Lakeside Organic's green cabbage is perfect for soups, stews and slaws!	1	head	2.99	1.2	lb	Produce	Greens	http://goodeggs1.imgix.net/product_photos/SaQTwWuaT3OwtbZWp7KY_GreenCabbage-1.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	327	\N	\N	\N
236	Fresh Organic Tree Oyster Mushrooms	Tree Oyster mushrooms have a mild flavor with a velvet-like texture.  They have a 3-4 day shelf life and only need to be sauteed for a few minutes.	6	oz	4.49	11.97	lb	Produce	Mushrooms	http://goodeggs1.imgix.net/product_photos/HuY27cmGRz6Yyu2NS9lp_FK1A4420.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	342	\N	\N	\N
572	Organic Sliced Havarti	Havarti is a deliciously mild, very creamy, natural, semi-soft cheese.Rumiano Cheese Company is California's oldest family-owned cheese company, dedicated to the manufacture and distribution of the highest quality cheese. Their main focus is providing their customers with the utmost service and quality. Their success is measured by their loyalty to their employees and vendors and to the success of their customers.Ingredients: Natural Cheese made from pasteurized cultured organic milk, sea salt, enzymes.	6	oz	3.79	10.11	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/6ZRksyHNTw6IvPJyX9SI_FK1A9338.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
595	Mascarpone	Italian-style Cream Cheese Mascarpone is the magic ingredient in the Italian dessert Tiramisu. Not long ago, the word mascarpone would draw quizzical looks. Nowadays, the distinctly Italian-sounding name is the only thing obscure about this velvety, rich cream cheese.It was only a matter of time before Allison Hooper and Bob Reese, co-founders of Vermont Creamery, were asked by chefs to create mascarpone locally. The fresh, high quality Vermont cream from the local St. Albans Cooperative is cooked at a high temperature until it is thick, smooth, and sweet. For desserts, whip, sweeten, and serve with fresh berries, or poached pears. Swirl it into soups or fold it into risotto and polenta, mix it with Parmesan cheese and fill raviolis or layer it in lasagna.Ingredients: cream, milk solids, glucono delta lactone (natural acidulant).Ingredients: cream, milk solids, glucono delta lactone (natural acidulant).contains dairy	8	oz	4.99	9.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/M1QDKdVaTHirI90hagpx_FK1A5831.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
632	Mt. Tam	Mt Tam, Cowgirl Creamery's signature cheese, is a smooth, creamy, elegant, 8 oz triple-cream. It is made with organic milk from the Straus Family Dairy. Mt Tam is firm, yet buttery with a mellow, earthy flavor reminiscent of white mushrooms.2nd Place - Original Recipe / Open Category Made From Cow's Milk - 2010 ACS competitionIngredients: organic pasteurized milk, organic pasteurized cream, salt, cultures, and enzymes.Contains: milk.Contains Dairy	8	oz	13.99	27.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/lTncgIUcRAaG0mQTomkV_unspecified.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
302	Frozen Health Berry Blend	For this super-premium berry blend, we selected the berries richest in color.  Add to smoothies for a rich breakfast.Ingredients: Marion Blackberries, Blueberries, and Black Raspberries.	10	oz	4.79	7.66	lb	Produce	Frozen Fruit & Vegetables	http://goodeggs2.imgix.net/product_photos/bKQWfQ2YQBqCvoW3Oj1o_FK1A0693.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	409	\N	\N	\N
627	Cabrillo	Cabrillo is a Spanish style cheese created from a blend of goat's and cow's milk named for the iconic HW1 that runs along the rugged California coastline minutes from our farmstead. It has a rich, nutty character and golden color and pairs great with Pinot, almonds, and figs. Cabrillo is a cheese we make predominantly in the fall as our goats' production wanes and their milk takes on a stronger characterIngredients: Pasteurized goat & cows milk, salt, calcium chloride, cultures, and rennet.	8	oz	15.99	31.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/JKWnqBqdTLiYRqEwWJyC_20160914-Stepladder_Cabrillo_MG_1019.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
633	Red Hawk	Cowgirl Creamery captures the essence of West Marin with its Red Hawk, a triple-cream, washed-rind, fully-flavored cheese made from organic cow's milk. Aged four weeks and washed with a brine solution that tints the rind a sunset red-orange, Red Hawk won Best-In-Show at the American Cheese Society's Annual Conference in 2003 and a Gold Ribbon and 2nd Best-in-Show in 2009.Ingredients: Organic pasteurized milk, organic pasteurized cream, salt, cultures, and enzymes.Contains: milk. 	8	oz	13.99	27.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/ceiRTfprR4GuXgnHcfX8_FK1A0601.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
634	Organic Weybridge	Weybridge is an organic, lactic-set cheese with a delicate bloomy rind. The lightly aged style is meant to showcase the Scholtens’ rich and complex Dutch Belt cow's milk. The thin rind surrounds a delicate cream-line, showing a toasty, mushroomy flavor in contrast to the bright acidity of the dense, milky core. The small medallion format appeals to any occasion—a snack for two or a garnish for a larger spread—and the rich, creamy flavor makes it an ideal breakfast cheese alongside berry preserves and freshly-baked bread. Classic beverage pairings include dry, bubbly white wine, sparkling apple cider or a crisp German pilsner.Ingredients: pasteurized cows milk, rennet, cultures, salt.Contains: milk.	4	oz	6.99	27.96	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/GvC4x8mFQ5iOWj9VYyc7_20160921-JasperHill_Waybridge_MG_1502.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
637	Willoughby	Willoughby is an original creation of Marisa Mauro’s Ploughgate Creamery, a Cellars collaborator that ceased production of the cheese after a creamery fire in 2011. With Marisa’s blessing we resurrect this pudgy little washed-rind and have continued to develop the recipe at Jasper Hill Creamery. This succulent and buttery washed-rind cheese has aromas of peat, roasted beef and onions – a strong and complex front for the subtle milky, herbal, ripe-peach flavors within. Willoughby has a thin, tender, rosy-orange rind, which adds earthy dimension to the texture and flavors of the gooey interior.Willoughby’s small format is ideal for selling whole on the retail counter, or quickly rotating through a professional kitchen. The pudding-like texture may become softer with age, but should remain sliceable for portioning until 9 weeks after its production date. Pair with juicy rose, funky saison beer or raw floral honey.Ingredients: Pasteurized cows milk, rennet, cultures, salt, 	8	oz	12.99	25.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/dzzDUsy9R9yAS8H7aon7_20160921-JasperHill_Willoughby_MG_1523.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
640	Petite Truffle	Petit Truffle is specked with Urbani Italian Black Truffles for the irresistibly earthy aroma of mushrooms balanced with sweet milk. Pair with California sparkling wine or Champagne.Ingredients: Pasteurized cultured cow’s milk, pasteurized cream,\nBlack Truffle (3%), salt and microbial enzymes.	4	oz	6.99	27.96	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/MA8i4qbiTSciNXMWKHF9_FK1A6735.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
641	Ragged Point	"This triple creme from Stepladder Creamery is like the Lucille Bluth of cheese. Sophisticated,  luxurious, and at it's best when enjoyed with bubbly."- Erin, Grocery BuyerThis little cloud of deliciousness will melt in your mouth. With a rich, decadent mouth feel this salty, butter triple cream is perfect spread on a baguette, eaten with your favorite seasonal fruit, and a perfect partner for some bubbles. Ingredients: Pasteurized cows milk, salt, calcium chloride, cultures, and rennet.	3.5	oz	8.99	41.1	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/HfOuMMlS5iqthI9zwMvg_20160705-StepLadder_RaggedPoint_MG_4306.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
642	Original Blue Wedge	Made from raw milk and aged for six months, Original Blue is creamy and tangy with a medium punch of blue flavor, and a perfect balance of salt. The cheese’s rich, unique flavors are attributed to the high quality of the farm’s pastures and their proximity to the ocean. Original Blue is wonderful on a cheese plate, crumbled into a salad, or served alongside a grilled steak.Ingredients: cultured raw cow's milk, salt, enzymes, penicillium roqueforti.Contains: milk.	6	oz	8.99	23.97	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/0lA8Iu7R8yyOkLBThAVi_FK1A0481.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
987	Loukanika	Greek style salami with vivid flavors of cumin and hints of orange zest based on the family recipe of Salumist Elias Cairo. Natural, edible hog casings and authentic molds.Ingredients: Pork, pork fat, salt. Contains 2% or less of dextrose, orange zest, garlic, sodium nitrite, sodium nitrate, spices, lactic acid starter culture, water.	4.2	oz	9.99	38.06	lb	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/dUtE8DpS0aSHje3PLtPQ_FK1A1174.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
643	Point Reyes' Bay Blue	Savory & Sweet. Try the newest addition to our product line. Inspired by the sheer natural beauty of our coastal climate and locale, Bay Blue is a rustic-style blue cheese reminiscent of Stilton. It is known for its mellow flavor and sweet, salted-caramel finish.Fudgy Texture with a gorgeous natural rind. All natural and made with pasteurized milk, Bay Blue is gluten-free and aged 90 days. Tasting Note: Mild and mellow blue-mold flavor with earthy notes and a salted-caramel finish.Uses: A great Cheese Course blue, paired with toasted hazelnuts. In recipes it complements mushrooms beautifully -- especially melted in pasta or risotto.Ingredients: Cultured, Pasteurized Cows Milk (MILK), Salt, Enzymes and Penicillium Roqueforti.	5.34	oz	9.29	27.84	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/E1FnnTMFSduhT8admIZN_FK1A0053.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
645	Crescenza	Rich and buttery with stiff notes of tart yeast to balance it, Crescenza is modeled after the centuries-old Italian cheese, Stracchino di Crescenza. Bellwether's Crescenza is a soft-ripened cow's milk cheese without a rind to hold back the luscious ooze. Spread it over crackers, bread, fruit—anything you want imbued with creamy intensity.Cindy Callahan, a nurse by training, was in her 50s when she first began raising sheep as a way to keep pasture grasses under control. She soon began milking her flock, and before long, her son Liam joined her as a cheesemaker. Today, Bellwether Farms makes an array of fresh and aged Italian-style sheep and cow's milk cheeses.	6	oz	5.99	15.97	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/pEwiyS3cQWULiXvbVRG5_IIwtlzATsvLJ5ANKwB6Ot5y9X1RhlmvspDzpls0rZr0.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
646	Marinated Labneh	To create this award-winning Mediterranean soft cheese, Brush Creek Creamery makes yogurt with pasteurized cow's milk and drains it through cheesecloth until the texture is thick and perfectly creamy. It's spiced up with fresh garlic, parsley and salt, then shaped and stored in olive oil with peppercorns, fresh herbs and dried red pepper. Delicious on pita bread and crackers, or as a dip for vegetables. Be sure to save the oil—it makes a great salad dressing or dip in its own right.This cheese won first place at the 2016 American Cheese Society awards.Ingredients: pasteurized milk, olive oil, garlic, peppercorns, red chile pepper, fresh herbs, culture, salt.Contains milk	9	oz	8.99	15.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/bsRvKe74SeObAzxbjbCr_20161109-CreamofCrop_Labneh_MG_6468.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
647	Schloss	Fashioned after an Austrian style washed rind cheese named “castle” we’ve been making Marin French Schloss since the early 1900s for a loyal (and growing) following of cheese lovers who crave its pungent aroma, robust flavor and rich smooth texture.Pair with hearty California red wines, aromatic whites , cider, or a sour beer. Ingredients: Cultured Pasteurized Milk, Pasteurized Cream, Salt and\nMicrobial Enzymes. Marin French cheeses are made with fresh local\nmilk that is guaranteed rBST free. All of our milk is pasteurized, and\nwe use only vegetarian approved rennet (no animal rennet). Contains Dairy	8	oz	9.99	19.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/na3XkH34T7eQsSyOqUj2_FK1A7396-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
648	Foggy Morning	Foggy Morning from Nicasio Valley Cheese Company is a hand ladled cheese made using 100% organic farmstead cow's milk. This soft, delicate cheese with a subtle tang has sour-cream flavour. It can be spread on bagels, toast or pizza or eat with any sweet or savory dish.Ingredients: Organic cow's milk, animal rennet, salt.	6.5	oz	8.99	22.13	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/dKTkRO0VT3CpnN8dwIDc_FK1A1559.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
673	Beemster X.O	Aged 26 monthBeemster Extra Aged is revered by cheese connoisseurs for its complex and deep notes of butterscotch, whiskey and pecan. The flavor develops through natural aging of no less than 26 months in our historic warehouses. Due to the unique milk and craftsmanship used in each wheel, Beemster Extra Aged stays creamy, producing a delectable flavor and texture that is more enjoyable than other extra-aged Dutch cheeses. • Extra Aged, Hard & Robust. With a deep, long-lasting taste.• Pairs well with elegant wines, olives, and nuts. Ingredients: Pasteurized cow’s milk, salt, cheese culture, rennet, annatto. Contains: milk	5.34	oz	8.99	26.94	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/5BgJsm8RpG9fAvurRv6W_FK1A9985.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
663	Cosmos	"Cosmos is one of my favorite feta-style cheeses! It's the perfect summer cheese! Make a melon or stonefruit salad, mix in some prosciutto, and top with some Cosmos! It's goes with all the summer seasonal fruits and veggies!" - Erin, Grocery BuyerCosmos is a raw sheep milk Feta-style cheese, brined aged for 2 months. Rich and tangy, with a creaminess that stands up to the salty brine. Use it on salads, pasta, roasted vegetables, pizza--anything that needs a little something!Ingredients: Raw Sheep milk, salt, rennet, cultures.	4	oz	8.79	35.16	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/8V9FBHTTQO6CGy0nrr58_File0405.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
664	Ricottage	This cheese is an Orland Farmstead creation. It is a blend between a ricotta and a cottage cheese. Ricottage can be used as a snack like cottage cheese or to take the place of ricotta in dishes such as lasagna.  	8	oz	5.99	11.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/SexNegvKSyyG0EH7y0a3_FK1A2977.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
665	Ricottage with Garlic and Dill	This cheese is an Orland Farmstead creation. It is a mild cheese like Cottage, with a dryer texture like Ricotta.  Ricottage with garlic and dill is great as a dip or spread.  Ricottage can be used as a snack like cottage cheese or to take the place of ricotta in dishes such as lasagna or Manicotti  The garlic dill Ricottage is great with Pita chips.	8	oz	6.29	12.58	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/mWTcocYJTkaK00iW4rWV_FK1A2984.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
666	Organic Fromage Blanc	Used like cream cheese, fromage blanc is a staple of the French diet. Because Cowgirl Creamery Fromage Blanc is made with whole milk instead of cream, it contains 30% less fat than cream cheese and about 80% more flavor, making it a favorite with Bay Area restaurant chefs.Flavor notes: Smooth and silky, a spoonful to be savored.Ingredients: Organic pasteurized whole milk, organic cream, salt, cultures, and enzymes.	8	oz	3.99	7.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/IKMdqqtxRTmLWDPgh06y_FK1A3888.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
667	Quark	German for “fresh curd,” quark is a fresh and slightly drained cows’ milk cheese that is similar to old-fashioned cream cheese. Inspired by its versatility and at the request of European chefs, co-founders Allison Hooper and Bob Reese crafted their first batch in 1985.At the creamery, Quark is made from fresh local milk that is coagulated overnight into fresh curd, then drained in cheesecloth and whipped with a trace of crème fraîche. Its low butterfat content and smooth texture make it a great base for fluffy cheesecakes and mousse. Top with granola for breakfast or mix with anything from mashed potatoes to boysenberries, and it earns its keep with flair. Ingredients: Pasteurized cows' milk, salt, cultures, enzymes. contains dairy	8	oz	4.69	9.38	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/E2H0b7QFTnKK9NjS3aVn_FK1A4545.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
668	Fromage Blanc	Our Fromage Blanc won the 2014-2015 World Cheese Gold Award!A creamy, spreadable cheese that can be used in place of cream cheese. It has a tangy, lemon flavor that can be used in sweets, such as cheese cakes or brownies, or in savory dishes such as lasagna, ravioli or any pasta. It makes a great spread on crackers or broiled on top of french or sourdough bread.Stock up and Save, Fromage Blanc freezes great!	8	oz	5.29	10.58	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/6AMRMuJtTMmjOrwX4jso_FK1A2963.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
670	Parmigiano Reggiano	Parmigiano Reggiano is a hard Italian cheese made from partly skimmed, unpasteurized milk. It is only allowed to be produced in the provinces of Parma, Reggio-Emilia and Modena, as well as parts of Emilia-Romagna. Its nuttiness and intense savory flavors  are guaranteed to impress on any cheese board, spice up any broth, and compliment pasta and risotto. Ingredients: Part-skim milk, salt, rennet.Contains: milk.	6	oz	7.49	19.97	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/SBzWN6VKSaX7MFdSAwhk_FK1A7890.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
672	Pt. Reyes Farmstead Toma	Point Reyes Farmstead Cheese Company - Marin CountyToma is a creamy semi-firm cheese with a pleasant tangy finish. It's easily the highlight of any cheeseboard & pairs well with hoppy beers, pinot noir, or chardonnays. It melts perfectly in an omelette & is a favorite for grilled cheese sandwiches. Hand cut & wrapped in compostable cheese paper.Pasteurized Cow's MilkVegetarian RennetCertified Kosher & Gluten Free	6	oz	7.49	19.97	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/X8i01xcXSS2ffoVMPkZq_toma.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
303	Frozen Raspberries	Our raspberries are sweet, plump and delicate in flavor. Enjoy this healthy treat right out of the bag!	10	oz	4.79	7.66	lb	Produce	Frozen Fruit & Vegetables	http://goodeggs2.imgix.net/product_photos/sZzpsFgYTVCtXonwBSsN_FK1A9752.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	299	\N	\N	\N
674	Comté	Comté is a French cheese produced in the Jura Massif region of Eastern France. The unpasteurised cow's milk used is mainly from Montbeliarde Cattle or French simmental (or cross breeds of the two). This hard mountain cheese is matured to perfection in the silence and darkness of special caves where the cheese gets its unique taste, texture and color. There are several maturing cellars in the region where Comté is ripened for a minimum of 4 months to 18 or 24 months. Comté was one of the first few cheeses to receive an AOC (Appellation d'origine controlee) status in 1958. It is one of the most popular AOC cheeses in France with around 40,000 tones of annual production.Considered one of the finest cheeses in the world, a wedge of Comte reveals a pale yellow interior and a texture that can vary from silky, flabby to crystalline.There are practically 83 flavours, which can be savored while tasting Comté. But the main aromatic flavours that delicately linger on the palate are a balance of brown-butter and roasted-nut aromas and a sweet finish.Its ability to melt easily means Comté goes well with many recipes right from fondues to Croque Monsieur. The cheese pairs well with Rhone reds, a Palo Cortado or off-dry Amontillado sherry from Spain.	5.34	oz	9.99	29.93	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/uYJB6dAhRWaUQgpWjPiF_FK1A0070.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
675	Shaved Parmigiano-Reggiano	You know what's better than great Parmigiano Reggiano? Great Parmigiano Reggiano that's already shaved, so you can spend your time cooking with it (or snacking on it) instead. The salty nuttiness of this cheese will add a great savory finish to any meal you are serving. Ingredients: Part-skim milk, salt, rennet.Contains: Milk.	3.5	oz	5.79	26.47	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/FNePybCSXSPUItudAa5j_20161109-CreamofCrop_ShavedParmesan_MG_6480.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
676	Carmody	Our Carmody was also inspired by a trip to Italy. We had an opportunity to watch\nGorgonzola being made near Milan. Many Gorgonzola makers are secretive and limit\naccess to their cheese making but our contact was able to get us inside for a short\ntour. After watching the cheese make we went into a ripening room they had at the\nfacility to see some of the early stages of Gorgonzola aging. In one of the rooms there\nwere some small wheels of cheese on an out of the way shelf. We were able to try\na wheel and found it to be a very mild but creamy cheese that still had a great deal\nof fresh milk flavor. We never saw the cheese made but began to notice similar table\ncheeses wherever we bought cheese. They were marketed under a variety of names\nbut meant for local consumption. It occurred to us that a cheese of this type might\nappeal to our customers in the US as an alternative to the young Cheddars or Jack\ncheeses that dominated the market. Once we returned from the trip I began working\non the cheese by using our pecorino recipe as a starting point and making changes\nin response to the flavors and texture of the cheese. Eventually we found a combination\nwe liked. Carmody is meant to highlight the buttery flavors or Jersey milk. At that\npoint we gave it a name with local meaning—Carmody is the road that runs adjacent\nto the farm.\nIngredients:\nPasteurized Jersey Cows Milk, Vegetable Rennet, Cultures and Salt\nTexture: Semi-Firm\nAged: Minimum of 6 weeks\nRind: Natural	7	oz	8.59	19.63	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/6lGfmlFfTVG4vzKXCyAP_FK1A2882.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
677	Ossau Iraty	Ossau-Iraty is probably the least known 'Appelation d'Origine Controlee' (A.O.C) cheese. The Ossau-Iraty unites two regions of France in the Western Pyrénées: Ossau in the valley of the Bearn, and Iraty in the beech forests of the Pays Basque. The Ossau-Iraty is full of a delicious, nutty, robust taste if it is produced during the period from June to September when the herds move up to the high mountain meadows. Covered by a thick orange to grey rind, the pâte is white, supple and ceamy. It becomes more firm as the maturing period is longer. An artisan pate may have small holes and should not stick to the palate.Made by the Onetik dairy cooperative with the raw milk of Manech and Basco-Bearnaise sheep and aged for 90 days, Ossau Iraty is unctuous, nutty, sweet, and slightly gamey. And if you’re so inclined, it melts like a dream.	5.34	oz	8.99	26.94	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/c6ZCHvLKRc1JiVb7hEuQ_FK1A0029.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
678	Emmentaler	"This classic Swiss cheese is my go to for turkey sandwiches, grilled cheeses, or snacking with apples and almonds." Erin, Good Eggs BuyerThis is the original Swiss cheese, world famous for its distinctive holes\n􏰀􏰁􏰂􏰃􏰄􏰁􏰅􏰆􏰄􏰇􏰆􏰀􏰆􏰈􏰉􏰁􏰂􏰃􏰊􏰀and one-of-a kind flavor.  First produced􏰋􏰀􏰁􏰂􏰃􏰄􏰁􏰅􏰆􏰄􏰇􏰆􏰀􏰆􏰈􏰉􏰁􏰂􏰃􏰊􏰀􏰋􏰄􏰌􏰍􏰃􏰎􏰉􏰌􏰏􏰐􏰃􏰑􏰌􏰄􏰂􏰒􏰓􏰅􏰂􏰃\nmore than eight centuries ago in the\ncanton of Bern in the valley of the\nEmme River, Emmentaler AOP is still made in giant 200-pound wheels.Emmentaler is always made from fresh, raw milk produced by grass-fed cows in sustainable meadows on family farms. Expert cheesemakers age it for a minimum of 120 days in the microclimate of the Emmi cellars. 􏰡􏰚􏰉􏰏􏰃􏰅􏰁􏰂􏰔􏰅􏰏􏰏􏰔􏰟􏰃􏰑􏰄􏰑􏰒􏰔􏰀􏰌􏰃􏰓􏰚􏰅􏰅􏰏􏰅􏰃􏰑􏰔􏰀􏰟􏰏􏰃This endlessly popular cheese plays an essential role in Swiss communities,\ncommerce and culture—and in American\n􏰓􏰒􏰉􏰏􏰉􏰁􏰅􏰃􏰄􏰇􏰃􏰕􏰀􏰁􏰟􏰃􏰈􏰉􏰁􏰂􏰏􏰍 cuisine of many kinds.Ingredients:  Raw cultured cow's milk and\nnonfat milk, salt, enzymes\nContains milk\n 	6	oz	5.49	14.64	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/oMn3X8H1QTCEGghXQDAv_20160512-Emmi_EmmenthalerWedge_MG_9469.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
679	Grand Cru Wedge	By combining the finest Wisconsin milk and crafting in authentic copper vats, we’ve created an original alpine-style cheese unmatched in America. Careful crafting brings out light floral notes, nutty undertones, a hint of fruitiness and a mellow finish. Perhaps that’s why Grand Cru has been awarded year after year by the American Cheese Society and in the World Champion Cheese Contest. It's perfect for fondue, french onion soup, croque monsieur, and as  a topping to any kind of potato. Pairs perfectly with apples, pears, grapes, and apple cider. Ingredients: Pasteurized Cow's milk, salt, enzymes.Contains milk	6	oz	5.49	14.64	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/gBzWgCoyRnm8jUwHrQyy_20160512-Emmi_GrandCru_MG_9472.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
691	Everton	Everton is aged 8-12 months, styled after Alpine style cheeses, with a firm, creamy texture and a savory, sweet flavor that gets sharper with age. Good Food Awards Winner 2014.Because we use the freshest milk from our own grass-fed cows, our specialty cheeses have a delicious flavor unique to our farm.  Our cheeses are hand crafted with care using our own specially-developed artisan recipes and the freshest grass-fed ingredients.   We know you will taste the difference.Ingredients: Raw cow's milk, cultures, salt.Contains dairy	8	oz	12.99	25.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/A7oHHiFTRSRhmCcb8PVe_20161004-JacobsBrichford_Everton_MG_2640.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
692	Rioly Run	This sweetly nutty, funky cheese comes from Stepladder Creamery in Cambria, CA. The rind is washed in saison beer, giving it a orangey color and a fragrant aroma. It slices beautifully on a cheese plate, and its creamy texture also lends itself well to heating under a broiler or open flame for traditional Swiss raclette until the cheese bubbles, melts, and is scraped onto a plate to be devoured. This is a cheese for all occasions, with enough complexity to keep you coming back for more.Ingredients: pasteurized cow's milk, beer, salt, calcium chloride, cultures, and rennet.Contains: milk.	8	oz	12.99	25.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/QYvm6c6QZ2tK7Xcs3rrg_20160705-SteppLadder_RiolyRun_MG_4284.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
693	Briana	Briana is a semi-firm, smear-ripened cheese, dense and easily melted.  It is carefully aged for a minimum of 90 days to develop a wonderfully complex flavor.Because we use the freshest milk from our own grass-fed cows, our specialty cheeses have a delicious flavor unique to our farm.  Our cheeses are hand crafted with care using our own specially-developed artisan recipes and the freshest grass-fed ingredients.   We know you will taste the difference.Ingredients: Raw cow's milk, cultures, salt.Contains dairy	8	oz	12.99	25.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/HUF2tn3sRASLjFY7LBjA_20161004-JacobsBrichford_Briana_MG_2642.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
694	Briana	Briana is a semi-firm, smear-ripened cheese, dense and easily melted.  It is carefully aged for a minimum of 90 days to develop a wonderfully complex flavor.Because we use the freshest milk from our own grass-fed cows, our specialty cheeses have a delicious flavor unique to our farm.  Our cheeses are hand crafted with care using our own specially-developed artisan recipes and the freshest grass-fed ingredients.   We know you will taste the difference.Ingredients: Raw cow's milk, cultures, salt.Contains dairy	6	oz	9.79	26.11	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/HUF2tn3sRASLjFY7LBjA_20161004-JacobsBrichford_Briana_MG_2642.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
695	Rioly Run	This sweetly nutty, funky cheese comes from Stepladder Creamery in Cambria, CA. The rind is washed in saison beer, giving it a orangey color and a fragrant aroma. It slices beautifully on a cheese plate, and its creamy texture also lends itself well to heating under a broiler or open flame for traditional Swiss raclette until the cheese bubbles, melts, and is scraped onto a plate to be devoured. This is a cheese for all occasions, with enough complexity to keep you coming back for more.Ingredients: pasteurized cow's milk, beer, salt, calcium chloride, cultures, and rennet.Contains: milk.	7	oz	11.49	26.26	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/QYvm6c6QZ2tK7Xcs3rrg_20160705-SteppLadder_RiolyRun_MG_4284.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
696	Fontina Val d'Aosta	This is the real deal Fontina, made from the raw milk of cows grazing in 6,500 foot high Alpine pastures. Today, milk for production comes from the Valdaostana cows that graze on the Alpine pastures (which are dotted with wildflowers and native herbs) at the foot of Mont Blanc. This semi-firm is washed weekly helps develop its signature funk. The uniquely rich and nutty flavor is reminiscent of truffles, with a subtle fruity, grassy aroma and supple texture. Flavors of Fontina are subtle but complex, and while it makes an excellent and versatile cheese for cooking, it is also delicious for straightforward eating. There are savory notes of fruit, grass, earth and cellar, balanced by a gentle sweetness.	5.34	oz	7.29	21.84	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/jsdtjg3xSW6I5hwjMN7G_FK1A0006.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
697	Moonflower	Moonflower is a raw sheep milk cheese aged 2 to 4 months. It is creamy and firm, with a rich nutty flavor. Moonflower melts nicely and makes a great omelet. It is also lovely with fresh cherries and berries.Ingredients: Raw Sheep milk, salt, rennet, cultures.	4	oz	9.79	39.16	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/HvSxbWtQkC4JDP6EHl9q_FK1A1699.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
59	Organic Pink Lady Apples	The Pink Lady, with it's delicate balance of both sweet and tart, almost effervescent flavor, has quickly become a customer favorite. And what a beauty it is! This cross between a Golden Delicious and Lady Williams variety is the only truly pink apple on the market. Great for baking and fantastic for applesauce!	2	lb	6.99	3.5	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/Zeo0utFgTdWN8O4BdEqq_apples_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
705	Cabecou	Our California original Cabecou is a goat cheese button, aged slightly to give it a nutty flavor and dense texture. Then we marinate the discs in a mixture of savory herbs, organic canola oil and California extra virgin olive oil.Ingredients: Cultured Pasteurized Goat Milk, Salt, Enzymes, Herbs, Canola Oil, Extra Virgin Olive Oil.	6.2	oz	8.29	21.39	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/yyaOgVQZ6r0TLHPqTxiA_FK1A7349.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
706	Humboldt Fog Mini	The subtle, tangy flavor and distinctive layer of edible vegetable ash are a prized combination in this iconic American original. You'll enjoy buttermilk and fresh cream, complemented with floral notes, herbal overtones and a clean citrus finish. As Humboldt Fog matures, the layer of proteolysis just under the rind will increase developing a more intense flavor.Serving Suggestions:Drizzle with honey and serve with prosciutto, tart apple and marcona almonds.Crumble atop mixed baby greens and roasted beets and serve with a simple vinaigrette.Pairing Suggestions:Wheat Beer, IPA, Pale Ale, and StoutsSauvignon Blanc, bubbly, Rosé, and Pinot NoirIngredients: Pasteurized cultured goat milk, salt, enzymes, vegetable ash.Contains: milk.	16	oz	21.99	21.99	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/lkKQhNTMTLafKq7X5ueV_20160825-CypressGrove_GoatHumboltFog_MG_8750.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
709	Purple Haze	Purple Haze is Cypress Grove's lush and fluffy chevre, sprinkled with tender purple buds of lavender and fennel pollen. The lavender and fennel pollen add an ethereal quality to the already rich goat cheese; floral and piquant, Purple Haze tastes like spring air after a long rain.Recipe Suggestions:Stuff into pitted Medjool dates and wrap with prosciutto.Crumble on fresh mixed baby greens; add sliced strawberries, toasted pecans and balsamic reduction.Purple Haze® CheesecakeFromage Blanc FrostingIngredients: Pasteurized goat milk, salt, fennel pollen, lavender, cultures and enzymes.Awards:2nd Place, American Cheese Society, 2013Best of Show, California State Fair Cheese Competition, 2009Best of Class, U.S. Cheese Championship 2011Third Place, World Championship Cheese Contest 2014	4	oz	6.79	27.16	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/x05v8TEqRkOd0nTs7GyI_0WwMrbuIFw969E82sSg9TCQD_Qyf1YKjM-jmzDJij0c.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
711	Bijou	"Vermont Creamery's Bijou is my go-to goat cheese for snacking. Grab some apples or other fruit and this two pack and you have your 3pm snack for all week." Erin, BuyerAn American line of French-style ripened goat cheeses wouldn’t be complete without a small Bijou-like Crottin. Bijou is French for “jewel” and epitomizes all that is special about goats’ milk and the making and caring for a small cheese. This geotrichum-rinded cheese has a unique sweet and yeasty flavor.Made with fresh pasteurized goats’ milk from family farms, Bijou curd coagulates overnight, drains in cheese cloth and is then shaped into little buttons. Dried, and ripened for one week, Bijou evolves with time, gaining a sharpness and complexity after thirty days. Serve toasted on baguette with a salad for a traditional French Bistro Chevre Chaud or on a cheeseboard.Ingredients: Pasteurized goats' milk, salt, cultures, enzymes.contains dairy	4	oz	10.99	43.96	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/d8YDvdAQSWgY9YjndJ3w_FK1A4643.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
716	Aged English Smoked Farmhouse	A semi-hard wheel with rich, smoky and sharp tones that linger on your tongue. Best served at room temperature with crackers, warm in sandwiches, or added to sauces.Free of cholesterol, lactose, egg, gluten and soy. Non-GMOIngredients: Organic Cashews, Filtered Water, Organic Chickpea Miso (Organic Chickpeas, Organic Rice Koji, Sea Salt, Water, Koji Spores), Nutritional Yeast, Sea Salt, Cultures	6.5	oz	10.99	27.05	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/E15nILg3Qw6VApm7WEuM_FK1A0412.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
104	Organic Red Beets	Boiled or roasted, there's no wrong way to eat these delicious roots. Pair with citrus or creamy flavors. Use in salads or for juicing.	1	lb	1.99	1.99	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/uEeUhzQARRChak6F1RJk_unspecified-9.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	399	\N	\N	\N
749	Broad Breasted Turkey (20-22 lb)	BN Ranch's Broad-Breasted Turkeys are raised free-range, with plenty of room to roam outdoors and enjoy the sunshine in Ballico, CA. Their healthy environment and Non-GMO Project Verified vegetarian feed helps these birds grow slowly and naturally. These birds have a higher ratio of white to dark meat than the Heritage flock, and will roast (or fry, or grill!) up to a bronzed, flavorful delight.Your turkey will arrive "hard chilled" and will be fully thawed in the refrigerator overnight.	20	lb	94.99	4.75	lb	Meat	Turkeys & More	http://goodeggs2.imgix.net/product_photos/PesZxQCLQC9MJiCCgVSJ_20161021-Broadbreasted_Turkey_MG_4667.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
740	Broad Breasted Turkey (12-14 lb)	BN Ranch's Broad-Breasted Turkeys are raised free-range, with plenty of room to roam outdoors and enjoy the sunshine in Ballico, CA. Their healthy environment and Non-GMO Project Verified vegetarian feed helps these birds grow slowly and naturally. These birds have a higher ratio of white to dark meat than the Heritage flock, and will roast (or fry, or grill!) up to a bronzed, flavorful delight.Your turkey will arrive "hard chilled" and will be fully thawed in the refrigerator overnight.	12	lb	64.99	5.42	lb	Meat	Turkeys & More	http://goodeggs2.imgix.net/product_photos/PesZxQCLQC9MJiCCgVSJ_20161021-Broadbreasted_Turkey_MG_4667.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
741	Broad Breasted Turkey (16-18 lb)	BN Ranch's Broad-Breasted Turkeys are raised free-range, with plenty of room to roam outdoors and enjoy the sunshine in Ballico, CA. Their healthy environment and Non-GMO Project Verified vegetarian feed helps these birds grow slowly and naturally. These birds have a higher ratio of white to dark meat than the Heritage flock, and will roast (or fry, or grill!) up to a bronzed, flavorful delight.Your turkey will arrive "hard chilled" and will be fully thawed in the refrigerator overnight.	16	lb	79.99	5.0	lb	Meat	Turkeys & More	http://goodeggs2.imgix.net/product_photos/PesZxQCLQC9MJiCCgVSJ_20161021-Broadbreasted_Turkey_MG_4667.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
742	Broad Breasted Turkey (8-10 lb)	BN Ranch's Broad-Breasted Turkeys are raised free-range, with plenty of room to roam outdoors and enjoy the sunshine in Ballico, CA. Their healthy environment and Non-GMO Project Verified vegetarian feed helps these birds grow slowly and naturally. These birds have a higher ratio of white to dark meat than the Heritage flock, and will roast (or fry, or grill!) up to a bronzed, flavorful delight.Your turkey will arrive "hard chilled" and will be fully thawed in the refrigerator overnight.	8	lb	49.99	6.25	lb	Meat	Turkeys & More	http://goodeggs2.imgix.net/product_photos/PesZxQCLQC9MJiCCgVSJ_20161021-Broadbreasted_Turkey_MG_4667.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
743	Heritage Turkey (12-14 lb)	BN Ranch's Heritage Turkey flock is hatched and raised enjoying the sunshine and fresh air of Ballico, CA. The birds are fed Non-GMO Project Verified vegetarian feed and raised using the highest environmental and humane standards. With an even balance of dark and white meat, the Heritage Turkey is the most flavorful and delicious Thanksgiving dinner you'll ever enjoy.Your turkey will arrive "hard chilled" and will be fully thawed in the refrigerator overnight.	12	lb	104.99	8.75	lb	Meat	Turkeys & More	http://goodeggs2.imgix.net/product_photos/RLGuRANuTyyTWnDPCbWP_20161021-Heritage_Turkey_MG_4653.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
744	Heritage Turkey (14-16 lb)	BN Ranch's Heritage Turkey flock is hatched and raised enjoying the sunshine and fresh air of Ballico, CA. The birds are fed Non-GMO Project Verified vegetarian feed and raised using the highest environmental and humane standards. With an even balance of dark and white meat, the Heritage Turkey is the most flavorful and delicious Thanksgiving dinner you'll ever enjoy.Your turkey will arrive "hard chilled" and will be fully thawed in the refrigerator overnight.	14	lb	119.99	8.57	lb	Meat	Turkeys & More	http://goodeggs2.imgix.net/product_photos/RLGuRANuTyyTWnDPCbWP_20161021-Heritage_Turkey_MG_4653.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
745	Heritage Turkey (6-8 lb)	BN Ranch's Heritage Turkey flock is hatched and raised enjoying the sunshine and fresh air of Ballico, CA. The birds are fed Non-GMO Project Verified vegetarian feed and raised using the highest environmental and humane standards. With an even balance of dark and white meat, the Heritage Turkey is the most flavorful and delicious Thanksgiving dinner you'll ever enjoy.Your turkey will arrive "hard chilled" and will be fully thawed in the refrigerator overnight.	6	lb	56.99	9.5	lb	Meat	Turkeys & More	http://goodeggs2.imgix.net/product_photos/RLGuRANuTyyTWnDPCbWP_20161021-Heritage_Turkey_MG_4653.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
746	Broad Breasted Turkey (10-12 lb)	BN Ranch's Broad-Breasted Turkeys are raised free-range, with plenty of room to roam outdoors and enjoy the sunshine in Ballico, CA. Their healthy environment and Non-GMO Project Verified vegetarian feed helps these birds grow slowly and naturally. These birds have a higher ratio of white to dark meat than the Heritage flock, and will roast (or fry, or grill!) up to a bronzed, flavorful delight.Your turkey will arrive "hard chilled" and will be fully thawed in the refrigerator overnight.	10	lb	54.99	5.5	lb	Meat	Turkeys & More	http://goodeggs2.imgix.net/product_photos/PesZxQCLQC9MJiCCgVSJ_20161021-Broadbreasted_Turkey_MG_4667.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
747	Heritage Turkey (10-12 lb)	BN Ranch's Heritage Turkey flock is hatched and raised enjoying the sunshine and fresh air of Ballico, CA. The birds are fed Non-GMO Project Verified vegetarian feed and raised using the highest environmental and humane standards. With an even balance of dark and white meat, the Heritage Turkey is the most flavorful and delicious Thanksgiving dinner you'll ever enjoy.Your turkey will arrive "hard chilled" and will be fully thawed in the refrigerator overnight.	10	lb	89.99	9.0	lb	Meat	Turkeys & More	http://goodeggs2.imgix.net/product_photos/RLGuRANuTyyTWnDPCbWP_20161021-Heritage_Turkey_MG_4653.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
748	Broad Breasted Turkey (18-20 lb)	BN Ranch's Broad-Breasted Turkeys are raised free-range, with plenty of room to roam outdoors and enjoy the sunshine in Ballico, CA. Their healthy environment and Non-GMO Project Verified vegetarian feed helps these birds grow slowly and naturally. These birds have a higher ratio of white to dark meat than the Heritage flock, and will roast (or fry, or grill!) up to a bronzed, flavorful delight.Your turkey will arrive "hard chilled" and will be fully thawed in the refrigerator overnight.	18	lb	89.99	5.0	lb	Meat	Turkeys & More	http://goodeggs2.imgix.net/product_photos/PesZxQCLQC9MJiCCgVSJ_20161021-Broadbreasted_Turkey_MG_4667.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
750	Broad Breasted Turkey (22-24 lb)	BN Ranch's Broad-Breasted Turkeys are raised free-range, with plenty of room to roam outdoors and enjoy the sunshine in Ballico, CA. Their healthy environment and Non-GMO Project Verified vegetarian feed helps these birds grow slowly and naturally. These birds have a higher ratio of white to dark meat than the Heritage flock, and will roast (or fry, or grill!) up to a bronzed, flavorful delight.Your turkey will arrive "hard chilled" and will be fully thawed in the refrigerator overnight.	22	lb	103.99	4.73	lb	Meat	Turkeys & More	http://goodeggs2.imgix.net/product_photos/PesZxQCLQC9MJiCCgVSJ_20161021-Broadbreasted_Turkey_MG_4667.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
751	Heritage Turkey (22-24 lb)	BN Ranch's Heritage Turkey flock is hatched and raised enjoying the sunshine and fresh air of Ballico, CA. The birds are fed Non-GMO Project Verified vegetarian feed and raised using the highest environmental and humane standards. With an even balance of dark and white meat, the Heritage Turkey is the most flavorful and delicious Thanksgiving dinner you'll ever enjoy.Your turkey will arrive "hard chilled" and will be fully thawed in the refrigerator overnight.	22	lb	164.99	7.5	lb	Meat	Turkeys & More	http://goodeggs2.imgix.net/product_photos/RLGuRANuTyyTWnDPCbWP_20161021-Heritage_Turkey_MG_4653.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
752	Broad Breasted Turkey (24-26 lb)	BN Ranch's Broad-Breasted Turkeys are raised free-range, with plenty of room to roam outdoors and enjoy the sunshine in Ballico, CA. Their healthy environment and Non-GMO Project Verified vegetarian feed helps these birds grow slowly and naturally. These birds have a higher ratio of white to dark meat than the Heritage flock, and will roast (or fry, or grill!) up to a bronzed, flavorful delight.Your turkey will arrive "hard chilled" and will be fully thawed in the refrigerator overnight.	24	lb	109.99	4.58	lb	Meat	Turkeys & More	http://goodeggs2.imgix.net/product_photos/PesZxQCLQC9MJiCCgVSJ_20161021-Broadbreasted_Turkey_MG_4667.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
753	Heritage Turkey (24-26 lb)	BN Ranch's Heritage Turkey flock is hatched and raised enjoying the sunshine and fresh air of Ballico, CA. The birds are fed Non-GMO Project Verified vegetarian feed and raised using the highest environmental and humane standards. With an even balance of dark and white meat, the Heritage Turkey is the most flavorful and delicious Thanksgiving dinner you'll ever enjoy.Your turkey will arrive "hard chilled" and will be fully thawed in the refrigerator overnight.	24	lb	174.99	7.29	lb	Meat	Turkeys & More	http://goodeggs2.imgix.net/product_photos/RLGuRANuTyyTWnDPCbWP_20161021-Heritage_Turkey_MG_4653.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
929	Bockwurst (Frozen)	PRMC’s Bockwurst is a traditional Munich-style Weisswurst\n(white sausage), made with milk, eggs and fresh spices including Italian\nparsley and cinnamon. The fine mousse is a perfect pair with your favorite\nhigh-quality mustard, a crusty roll, and of course, a stein of Bavarian\nbeer.  Kids love this one too – It is a\ntrue staff favorite. Arrives fully cooked for easy prep. \n \nIngredients: Pork\n(Food Alliance Certified), Milk, Water, Eggs, Sea Salt, Organic Evaporated Cane\n	0.75	lb	7.49	9.99	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/A5icPzRORva7zZB400mg_FK1A0954.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
764	Organic Party Wings (Frozen)	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	2	lb	9.59	4.8	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/Uvwrtf84SkyVVho6Wlxw_Good%20Eggs_111515-17.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
775	Ground Dark Meat Turkey (Frozen)	100% dark meat ground turkey for optimal flavor- sub for beef or pork in all your favorite recipes!BN Ranch White Broad Breasted Turkeys possess the classic mild flavor of turkey, but with all the benefits of BN Ranch's humane, environmental, and quality standards. Our broad breasted turkeys are fed a Non-GMO Project Verified diet of vegetarian feed formulated for a slower, more natural growth pattern. The turkeys are raised in a free-range environment with plenty of room to roam outdoors from the time they are six weeks old. Raised to the highest standards of humane care and environmental consideration, BN Ranch Broad Breasted turkeys redefine this Thanksgiving staple.	1	lb	9.49	9.49	lb	Meat	Poultry	http://goodeggs2.imgix.net/product_photos/HKDmWd7aQAmqjT9FJBto_FK1A3435.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
776	Smoked Turkey Breast (Frozen)	Smoking Goose Smoked Turkey Breast is all natural, free range birds. Brined in organic herbs and spices and smoked over fruit woods. This subtly smoked turkey has texture and body yet remains juicy. It tastes like you are thinly carving turkey right off the bone! Perfect for that "Thanksgiving-style" sandwich!All Smoking Goose recipes begin on the farm. They carefully curate farm sources based on research, site visits, flavor, and personal relationships with farmers. The base requirements for all Smoking Goose farm sources: Small Family Owned Farm, No factory Farms, No Gestation Pens,  Antibiotic Free, 100% Vegetarian Feed, No Growth Promotants, Humanely Slaughtered. Source codes printed in the bottom right corner of each smoking goose package. To find out more about the farm please visit their Raw Resource Sheet.Ingredients: Whole breast of turkey, thyme, cloves, orange peel.	6.43	lb	142.99	22.24	lb	Meat	Poultry	http://goodeggs2.imgix.net/product_photos/XGeJDRltQFOvx9ofAOMv_20160914-SmokingGoose_WholeTurkey_MG_1004.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
796	Guanciale (Frozen)	Jowl bacon- the king of all bacons, the classic ingredient to many an Italian dish (Carbonara anyone? all'Amatriciana?), guanciale adds that silky smooth feel and beautiful porky flavor to your pasta sauce. Or just fry some for breakfast, that's cool too.Ingredients: Pork, Sea Salt, Cane & Maple Sugars, Celery Powder.	0.3	lb	8.99	29.97	lb	Meat	Bacon	http://goodeggs1.imgix.net/product_photos/0gbApB3cQDK6CVZWhwHB_unspecified.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
798	Ground Beef (Frozen)	Prather Ranch Meat Company is proud to offer our legendary Prather Ranch\nground beef at Good Eggs. Prather Ranch ground beef is known far and wide for\nits exceptional flavor (even our ground beef is dry-aged!), quality, and single\nanimal traceability. The grind is 85/15 lean to fat. Once you try it you’ll be hooked! Prather beef is grass fed and \nbarley/alfalfa hay finished, then dry-aged for 16-21 days. Certified Humane Raised and Handled, GMO free, and Food Alliance Certified.	1	lb	8.99	8.99	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/Y3EMJRBmQbOvlMt568aQ_FK1A4975.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
799	Grass-fed Ground Beef (Frozen)	Our son, Jack, orders a hamburger if it's on the menu, no matter where he is. Raised on a cattle ranch and eating good meat his whole life, this kid knows his ground beef. Although some have come close, Jack claims he has yet to find one that beats a Morris Grassfed burger (and as anyone with teenagers knows, he's got a mind of his own, and would not be afraid to offend us!) Grilled outdoors on your barbecue, or made into delicious sauces, chili, meat loafs or casseroles, you just can't beat locally-raised 100% Morris Grassfed Beef. Raised & finished on pastures of the Central Coast of California and dry aged for 14-21 days. We aim for a fat content of 10-15%.	1	lb	9.99	9.99	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/JAGD7J64SbyGBQNGxiI7_NlrWW_i2w_z_Owya9Vw__7CMctrSLnsaWlxMlYtj584.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
804	Grass-fed Chuck Steak (Frozen)	100% Grass-fed and Finished Chuck Eye SteakPRATHER RANCH MEAT CO is proud to introduce Lost Coast Grass-Fed Beef into its repertoire of high quality, sustainably and humanely raised meat offerings.Lost Coast Grassfed beeves are raised on the lush grass pastures of Humbolt County they are 100% grassfed and finished, and are never treated with hormones or antibiotics.	0.7	lb	6.99	9.99	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/y8M6X99Q6ShGT01sX0VU_FK1A7974.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
805	Grass-fed Top Sirloin Steak (Frozen)	100% Grass-fed and Finished Top Sirloin SteakPRATHER RANCH MEAT CO is proud to introduce Lost Coast Grass-Fed Beef into its repertoire of high quality, sustainably and humanely raised meat offerings.Lost Coast Grassfed beeves are raised on the lush grass pastures of Humbolt County they are 100% grassfed and finished, and are never treated with hormones or antibiotics.	0.75	lb	11.99	15.99	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/fPSCiierTjGQof3f7rJc_FK1A4398.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
808	Filet Mignon (Frozen)	Looking for\nthe most tender, lean, delicious steak available? Prather Ranch Filet Mignon is the\nticket. Filet lovers all over the Bay Area come to our farmers markets to pick\nup our filets - the perfect combination of dry-aged tenderness, flavor and low\nfat. Prather beef is grass fed and \nbarley/alfalfa hay finished, then dry-aged for 16-21 days. Certified Humane Raised and Handled, GMO free, and Food Alliance Certified.	0.5	lb	14.49	28.98	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/LsCsq2RMRMylLRE6eJt9_FK1A4861.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
811	Ribeye (Frozen)	It’s no wonder why Prather Ranch Rib-Eyes have become a\nBay Area steak lover’s dream. Prather beef is grass fed and barley/alfalfa hay finished, then dry-aged for 16-21 days. Well marbled and tender, these steaks are simply addicting. Certified Humane Raised and Handled, GMO free, and Food Alliance Certified.	0.75	lb	17.99	23.99	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/1YMCFzdQ5KzVft5Ui1VA_FK1A4836.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
814	Filet Mignon (Frozen)	Grass-fed, Grain Finished Filet Mignon Steaks- from Rancho Llano Seco, Chico, CAOur cattle are pasture-raised on our untouched, gently rolling lands. As part of a unique partnership with US Fish & Wildlife and the agricultural and conservation easements secured with them, our rotational grazing system promotes native grassland restoration and eradicates the invasive weed population. Cows spend their entire lives on pasture and are finished on a highly nutritious blend of locally grown organic grains developed specifically for our herds by an animal nutritionist, as we believe strongly in maintaining the highest health standards possible for our animals. Our beef has all the complexity of a grass-fed animal with the tenderness and marbling of a grain-fed animal. By promoting pasture health through our grazing, we continue to rejuvenate a nearly lost California landscape through sustainable and responsible animal husbandry practices.	1.25	lb	47.49	37.99	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/VIBmaMNHRymwFZH9FAPA_20161110-LlanoSeco_FiletMignon_MG_6908.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
817	Sirloin Tip (Frozen)	Quick and easy to cook, the sirloin tip is a lean cut off the top sirloin. Great to pan fry and versatile in application. Feeling fancy? Slice them up for a stir fry or kabobs!	0.6	lb	6.59	10.98	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/i7vCGNT27bUdfATKMOQc_FK1A4793.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
825	Grass-fed Chuck Roast (Frozen)	100% Grass-fed and Finished Chuck RoastPRATHER RANCH MEAT CO is proud to introduce Lost Coast Grass-Fed Beef into its repertoire of high quality, sustainably and humanely raised meat offerings.Lost Coast Grassfed beeves are raised on the lush grass pastures of Humbolt County they are 100% grassfed and finished, and are never treated with hormones or antibiotics.	2.25	lb	22.49	10.0	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/LHGLxOnLSVegx5mJpz7E_FK1A8239.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
826	Marinated Maui Ribs (Frozen)	Prather Ranch Dry-Aged\ncross-cut short ribs are marinated in soy sauce, toasted sesame oil, ginger and\nred chili paste.  Grill them quickly over high heat to a\nperfect medium-rare. Great for parties, this item is a summer classic.\nIngredients: Prather Ranch\nDry-Aged Cross-Cut Short Ribs, Soy Sauce, Toasted Sesame Oil, Ginger, Sugar,\nChili Paste, Scallions.	2	lb	21.99	11.0	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/acEYOC3RIiQV79OG19dh_FK1A6953.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
832	Chateaubriand (Frozen)	A great cut to share with a few friends, pan sear and finish in a hot oven to medium rare. Often served with a rich sauce, a great meal for a small dinner party.Certified Humane Raised and Handled, GMO-free, and Food Alliance Certified.	2	lb	31.89	15.95	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/LIVuTB82TV2svdpvzZmL_FK1A0207.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
852	Guanciale	Heavily spiced with bay leaves, garlic, juniper berries, sea salt, brown sugar and black peppercorns, these cured hog jowls bring a rich flavor and more dense texture than their belly-cut cousin, pancetta.All Smoking Goose recipes begin on the farm. They carefully curate farm sources based on research, site visits, flavor, and personal relationships with farmers. THe base requirements for all Smoking Goose farm sources: Small Family Owned Farm, No factory Farms, No Gestation Pens,  Antibiotic Free, 100% Vegetarian Feed, No Growth Promotants, Humanely Slaughtered. Source codes printed in the bottom right corner of each smoking goose package. To find out more about the farm please visit their Raw Resource Sheet. Ingredients: pork jowl, bay leaves, juniper berries, garlic, black peppercorns	8	oz	14.29	28.58	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/bOkPeOOQOKMGYeLz3oip_20160415-SmokingGoose_Tasso_MG_6978.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
617	Graziers Raw Milk White Medium Cheddar	A milder, cheddar cheese flavor the kids will love! Graziers Raw Medium Cheddar Cheese is made from milk from Certified Graziers at Alderson and Belo Dairies. Enjoy the benefits of grass-fed and raw milk! 	8	oz	4.99	9.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/Ki988hkTQDE9dwnHv0BJ_File0205.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
951	Sliced Smoked Turkey Breast	Smoking Goose Smoked Turkey Breast is all natural, free range birds. Brined in organic herbs and spices and smoked over fruit woods. This subtly smoked turkey has texture and body yet remains juicy. It tastes like you are thinly carving turkey right off the bone! Perfect for that "Thanksgiving-style" sandwich!All Smoking Goose recipes begin on the farm. They carefully curate farm sources based on research, site visits, flavor, and personal relationships with farmers. The base requirements for all Smoking Goose farm sources: Small Family Owned Farm, No factory Farms, No Gestation Pens,  Antibiotic Free, 100% Vegetarian Feed, No Growth Promotants, Humanely Slaughtered. Source codes printed in the bottom right corner of each smoking goose package. To find out more about the farm please visit their Raw Resource Sheet.Ingredients: Whole breast of turkey, thyme, cloves, orange peel.	12	oz	16.99	22.65	lb	Meat	Deli Meat	http://goodeggs2.imgix.net/product_photos/k87azxPYQv21HzBTfPTu_20160617-SmokingGoose_TurkeyBreast_MG_3020.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
952	Smoked Turkey	Slowly smoked and seasoned with spices and a hint of brown sugar and sea salt. Our pre-sliced turkey is fantastic in sandwiches, appetizers, or just as a grab-and-go snack!How Our Deli Meats Stack UpNo gluten, casein, carrageenan, phosphates, MSG, artificial ingredients, or preservativesNo added nitrates or nitritesNo antibiotics, growth stimulants, or hormonesTurkeys are fed a 100% Vegetarian DietOnly whole muscle meat used. No fillers!NON-GMO Project VerifiedAll animals are humanely raised on GAP-rated sustainable family farms and ranches.Ingredients: Organic turkey breast, water, sea salt, organic brown sugar, sodium bicarbonate, organic spices, organic garlic powder, and natural flavorings.	6	oz	5.99	15.97	lb	Meat	Deli Meat	http://goodeggs2.imgix.net/product_photos/51zvWX9OSWCTcK63Oidu_FK1A7373.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
953	Organic Honey Roasted Turkey	Organic Pre-Sliced Honey Turkey: Our oven-roasted turkey with a drizzle of honey. (We use locally sourced honey whenever possible.) Our pre-sliced turkey is fantastic in sandwiches, appetizers, or just as a grab-and-go snack!How Our Deli Meats Stack UpLow SodiumNo gluten, casein, carrageenan, phosphates, MSG, artificial ingredients, or preservativesNo added nitrates or nitritesNo antibiotics, growth stimulants, or hormonesTurkeys are fed a 100% Vegetarian DietOnly whole muscle meat used. No fillers!NON-GMO Project VerifiedAll animals are humanely raised on GAP-rated sustainable family farms and ranches.Ingredients: Organic turkey breast, water,  organic honey, sea salt, sodium carbonate, and natural flavorings.	6	oz	6.49	17.31	lb	Meat	Deli Meat	http://goodeggs2.imgix.net/product_photos/XRvvBc4aR7ScFSItdKzw_FK1A9549.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
954	Organic Oven Roasted Turkey	Slowly Roasted with a pinch of sea salt to bring out that old-fashioned flavor. Our pre-sliced turkey is fantastic in sandwiches, appetizers, or just as a grab-and-go snack!No added nitrates or nitritesNo antibiotics, growth stimulants, or hormonesTurkeys are fed a 100% Vegetarian DietOnly whole muscle meat used. No fillers!NON-GMO Project VerifiedAll animals are humanely raised on GAP-rated sustainable family farms and ranches.Ingredients: Organic turkey breast, sea salt, sodium carbonate, and natural flavoring.	6	oz	6.49	17.31	lb	Meat	Deli Meat	http://goodeggs1.imgix.net/product_photos/fvkG8E6CQwqM3X9dEwAP_FK1A2042.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
955	Pastrami Seasoned Turkey	Ingredients: Turkey breast, water, sea salt, organic garlic, sodium carbonate, molasses, organic brown sugar, citric acid, lemon oil and natural flavorings.How Our Deli Meats Stack UpNo gluten, casein, carrageenan, phosphates, MSG, artificial ingredients, or preservativesNo added nitrates or nitritesNo antibiotics, growth stimulants, or hormonesTurkeys are fed a 100% Vegetarian DietOnly whole muscle meat used. No fillers!NON-GMO Project VerifiedAll animals are humanely raised on GAP-rated sustainable family farms and ranches.Ingredients: Turkey breast, water, sea salt, organic garlic, sodium carbonate, molasses, organic brown sugar, citric acid, lemon oil, and natural flavorings.	6	oz	5.99	15.97	lb	Meat	Deli Meat	http://goodeggs1.imgix.net/product_photos/EACaZW8dTvmueZdUrxfU_FK1A9558.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
956	Herb Roasted Turkey	A savory blend of herbs and spices give our roasted breast a delicate flavor.How Our Deli Meats Stack UpNo gluten, casein, carrageenan, phosphates, MSG, artificial ingredients, or preservativesNo added nitrates or nitritesNo antibiotics, growth stimulants, or hormonesTurkeys are fed a 100% Vegetarian DietOnly whole muscle meat used. No fillers!NON-GMO Project VerifiedAll animals are humanely raised on GAP-rated sustainable family farms and ranches.Ingredients: Turkey breast, water, sea salt, sodium carbonate, and natural flavorings.	6	oz	5.99	15.97	lb	Meat	Deli Meat	http://goodeggs1.imgix.net/product_photos/N0zsNWr9SS2Us2oLIFYq_FK1A9573.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
972	Pancetta	A traditional Italian staple, pancetta is often used in pasta dishes and on pizzas—fried up like bacon, it looks like a crispy little pinwheel. It's made of pork belly rolled into a log and cured. La Quercia uses vegetarian-fed, antibiotic-free pork from Heritage Acres Foods and cures it with sea salt, juniper berries, and bay leaves, giving the sweet meat an herbal kick. Slice it into cubes or lardons for classic carbonara, or render it for roasts and pan sauces.Ingredients: pork, sea salt, pepper, rosemary, bay leaf, juniper berries.	3	oz	8.99	47.95	lb	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/NCys5WZtT5W4Ox8KQ7zM_FK1A7260.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
962	Petite Pierre Pepperettes	Pork Stick?  Yes Please. We've been smoking pork sticks (with really good pork, in natural casings, over hickory and apple woods) since the beginning.  If you've been to our restaurants, you've probably had one of the long, thin, delicious sticks elegantly gracing the top of the deli case.  This pepperette is a French inspired pork stick flavored with juniper and sea salt in a natural sheep's casing. Last fall, we started making these little shorties and wrapped them up all cute in a pocket-sized box.  Perfect for snacks, travel, pocket meat, and little gifts to say, "I love you... and you love meat."  Olympia Provisions' Petite Pierre Pepperettes are shorty pepperoni sticks made with pork in natural casings, and smoked over hickory and apple woods. Petite Pierre variety is flavored with juniper, white pepper and red wine.Ingredients: Pork, pork fat, salt. Contains 2% or less of dextrose, red wine (contains sulfites), spices, garlic, sodium nitrite, potassium sorbate, lamb casing. 	1.7	oz	3.99	37.55	lb	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/Chf8ImJMSSCReanlMWfV_FK1A6826.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
967	Flaco Paco Pepperette	Pork Stick?  Yes Please. We've been smoking pork sticks (with really good pork, in natural casings, over hickory and apple woods) since the beginning.  If you've been to our restaurants, you've probably had one of the long, thin, delicious sticks elegantly gracing the top of the deli case.  This pepperette is a Spanish inspired pork stick flavored with paprika and garlic in a natural sheep's casing. Last fall, we started making these little shorties and wrapped them up all cute in a pocket-sized box.  Perfect for snacks, travel, pocket meat, and little gifts to say, "I love you... and you love meat." Olympia Provisions, Flaco Paco Pepperettes are shorty pepperoni sticks made with pork in natural casings, and smoked over hickory and apple woods. Flaco Paco variety is made with paprika, oregano and garlic.Ingredients: Pork, pork fat, paprika, salt. Contains 2% or less of spices, garlic, sodium nitrite, potassium sorbate, lamb casing. 	1.7	oz	3.99	37.55	lb	Meat	Charcuterie	http://goodeggs2.imgix.net/product_photos/lvDgxgFLQLCacb9W0qDt_FK1A6816.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
968	Kleine Schweine Pepperette	Pork Stick?  Yes Please. We've been smoking pork sticks (with really good pork, in natural casings, over hickory and apple woods) since the beginning.  If you've been to our restaurants, you've probably had one of the long, thin, delicious sticks elegantly gracing the top of the deli case.  This pepperette is a German inspired pork stick flavored with caraway and coriander in a natural sheep's casing. Last fall, we started making these little shorties and wrapped them up all cute in a pocket-sized box.  Perfect for snacks, travel, pocket meat, and little gifts to say, "I love you... and you love meat." Olympia Provisions' Kleine Schweine Pepperettes are shorty pepperoni sticks made with pork in natural casings, and smoked over hickory and apple woods. Kleine Schweine variety is made with caraway, coriander and chili flake. Ingredients: Pork, pork fat, salt. Contains 2% or less of dextrose, spices, garlic, sodium nitrite, potassium sorbate, lamb casing. 	1.7	oz	3.99	37.55	lb	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/KayWN3ODRgeMwmIFQWsj_FK1A6820.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
969	Soppressatta	A truly classic charcuterie, Soppressata is a classic salami that is enjoyed around the word. Olympia Provisions crafts their version with a little heat, fresh garlic, and a bit of clove for aroma. The casings are natural and edible! Slice thinly onto cheese platters and antipasto, layer into sandwiches, or scatter atop pizza and focaccia breads.Ingredients: pork, salt, 2% or less of dextrose, garlic, sodium nitrite, sodium nitrate, lactic acid starter culture, water.	4.2	oz	9.99	38.06	lb	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/Pz7xLDtsQIiwwWw3Cw6F_FK1A1220.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
974	Pancetta	Fra’ Mani Pancetta is a salted and dried skinless pork belly, made according to the traditional Italian production method of “pancetta arrotolata” (rolled pancetta). Hand trimmed, hand salted and slowly aged, our Pancetta is characterized by a balanced proportion of lean and fat and the aromas of garlic, clove, bay leaf, and black pepper.Marcella Hazan calls this Pancetta the "best in the country."Ingredients: Pork, Sea Salt, and contains 2% or less of Celery Juice, Garlic, Spices, Dextrose, Starter Culture.	16	oz	14.99	14.99	lb	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/yc5Li6DSQmu3usdyLM0B_FK1A0839.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
976	Capicola	This dry-cured, premium Italian-style salami is sourced from heritage-breed pigs humanely raised on pasture at local family farms. Savor these luxuriously thin slices on an Italian sub, mixed in with some arugula and stone fruit, or paired perfectly with a hard cheese. The delicately seasoned, slightly spicy flavor will have you asking for more!All Smoking Goose recipes begin on the farm. They carefully curate farm sources based on research, site visits, flavor, and personal relationships with farmers. The base requirements for all Smoking Goose farm sources: Small Family Owned Farm, No factory Farms, No Gestation Pens,  Antibiotic Free, 100% Vegetarian Feed, No Growth Promotants, Humanely Slaughtered. Source codes printed in the bottom right corner of each smoking goose package. To find out more about the farm please visit their Raw Resource Sheet. Ingredients: Uncured pork collar salame, paprika, white wine	12	oz	14.49	19.32	lb	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/FbL0Yj5IR6CKYnNVlzOU_20160617-SmokingGoose_Capocollo_MG_3012.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
977	'Nduja	'Njuda is a specialty of Calabria. Traditionally considered a peasant food, the Italian version is made from "poor cuts" of pork preserved with Calabrian pepper. La Quercia's 'Njuda Americana is made with prosciutto and speck-- quite the opposite of poor cuts! A delicious spreadable blend of La Quercia cured meat spiced with American red pepper, it marries rich umami to abundant heat.Extremely versatile! Spice up a pasta sauce, grilled cheese, burger, pizza, crostini, or taco. Wonderful just slathered on warm bread or a cracker.Ingredients: Fully cured prosciutto and speck, sea salt, red chili pepper.	5	oz	7.99	25.57	lb	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/ADxTG5Y5QPSyrAPRj3WZ_FK1A6824.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
978	'Nduja	Pronounced "in-doo-yah," 'nduja is made by grinding and blending pork shoulder, belly and jowl, spiked with Calabrian chiles and smoked for 10 days in Smoking Goose's gravity-fed cold smoker. That layer of sweet smoke rounds out the delicious bite of spicy, floral, and earthy Calabrian peppers. The soft center of this salame is spreadable on warm bread for a simple first course, or can top a pizza, dress a salad or soup, stir into a pasta sauce, or spice up eggs and omelettes at breakfast.This item is stored frozen. Please use within 30 days of defrosting.Ingredients: pork, calabrian peppers, paprika.	8	oz	13.99	27.98	lb	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/ONF4WVVDQgSbIf98WTwi_20160914-SmokingGoose_Njuda_MG_1012.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
979	Smoked Delaware Fireball Crepinette	One of the OG salumis created at Goose the Market, Smoking Goose’s butcher shop on Delaware Street in Indianapolis, this crepinette salame is spicy! Coarse ground pork is blended with crushed red pepper, black pepper, espellette, and cayenne, then hand wrapped in caul fat before getting cold smoked over hickory and aged. Easy to slice and ideal for snacking, try paired with blue cheese to temper the heat on your next charcuterie board!Ingredients: uncured pork salame, red chilies, espelette, caul fat, cold-smoked.	5	oz	13.99	44.77	lb	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/DTxvFPVtQbmkONbtvLuS_20160820-SmokingGoose_DelawareFireball_MG_8512.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
982	Sauccison D'Arles	Our most elemental and simple salami: just pork and sea salt. Natural, edible hog casings and authentic molds.Ingredients: Pork, pork fat, salt. Contains 2% or less of dextrose, sodium nitrite, sodium nitrate, lactic acid starter culture, water.	4.5	oz	9.99	35.52	lb	Meat	Charcuterie	http://goodeggs2.imgix.net/product_photos/QIATqtU5RCOPHCfJdLgF_FK1A1188.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
983	Saucisson aux Noisette	French for salami with hazelnuts and here in Oregon we grow 99% of North America's crop. Enjoy this simple saucisson seasoned only with sea salt and studded with whole roasted Oregon hazelnuts. Natural, edible hog casings, authentic molds. Ingredients: Pork, pork fat, salt, hazelnuts. Contains 2% or less of dextrose, sodium nitrite, sodium nitrate, lactic acid starter culture, water.	4.2	oz	9.99	38.06	lb	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/XEAwqIcQZmJpdQCxkAqR_FK1A1166.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
984	Finocchiona	Traditional Italian salami with fresh garlic, cracked black pepper and fennel seed. Natural, edible hog casings and authentic molds. Ingredients: Pork, pork fat, salt. Contains 2% or less of dextrose, garlic, sodium nitrite, sodium nitrate, lactic acid starter culture, water.	4.2	oz	9.99	38.06	lb	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/R5skjPCTYihqZAgQGfhQ_FK1A1202.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
998	Akka's Curry Paste - South Indian Style	Craving for a fresh tasting curry with authentic flavors without the hassle of shopping for ingredients and making them? Akka's Curry Paste is the simple solution! Made with 16 ingredients including fresh tomato, onion, coconut, ginger, garlic, curry leaf, turmeric, coriander, and spices is easy to use. This is inspired by my mother who used to make a curry paste before we went on our annual pilgrimage to a distant village when I as growing up in India. We bring this product to not so distant Silicon Village San Francisco, for everyone's enjoyment.All you do is brown 2 lbs of chicken breast or thigh meat. Transfer the full jar of curry paste to the pot. Add two cups of liquid - chicken broth, coconut milk, or water, and 1 lb of chopped vegetable like potato, carrots. Bring to boil and simmer for 15 minutes until chicken is cooked. Serve with rice, nan, paratha, or bread with a spoon full of Akka's Mango Chutney in the side.To make vegetarian curry: chop and boil three cups of vegetables like potatoes, carrots, green beans, cauliflower in water. Add three to four tablespoons of curry paste to the vegetable and simmer for few minutes. Serve with rice, chapathi, paratha, or bread with a spoon full of Akka's Meyer Lemon Relish in the side.Ingredients: tomato, onion, coconut, ginger, garlic, coriander powder, chili powder, safflower oil, curry leaf, spices, salt	6.7	oz	10.49	1.57	oz	Meat	Rubs & Marinades	http://goodeggs2.imgix.net/product_photos/Hkgn1St3SjS22fZfSAM1_FK1A2641.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
1007	Grass-fed Oxtail (Frozen)	100% Grass-fed and Finished Oxtail- from Morris Grassfed, San Juan BautistaBraise away!  Take your time, fill your home with beautiful aromas and enjoy mouth-watering 100% locally-grown Morris Grass-fed beef and gravy during the fall and winter.  The perfect comfort food, oxtail is possibly the ultimate braising cut.Morris Grassfed provides 100% grass-fed & finished (no antibiotics or added hormones) beef to customers throughout California. Our beef is dry-aged for 21 days, processed in USDA inspected facilities, cut & wrapped by small-scale, artisan butchers and delivered directly to you via Good Eggs.We are an independent, family-owned company. We practice holistic management on the rangelands we manage, taking into account the land, animals, and people affected by our decisions. We invite you to take a tour of our operations here and to learn about the social, ecological and health benefits of 100% grass finished beef.	2.25	lb	29.99	13.33	lb	Meat	Bones & Offal	http://goodeggs1.imgix.net/product_photos/HhKS70yhSOcXi5xgSTBk_20160611-SonomaMeatCo_Oxtail_MG_1976%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
1008	Grass-fed Oxtail (Frozen)	100% Grass-fed and Finished Oxtail- from Morris Grassfed, San Juan BautistaBraise away!  Take your time, fill your home with beautiful aromas and enjoy mouth-watering 100% locally-grown Morris Grass-fed beef and gravy during the fall and winter.  The perfect comfort food, oxtail is possibly the ultimate braising cut.Morris Grassfed provides 100% grass-fed & finished (no antibiotics or added hormones) beef to customers throughout California. Our beef is dry-aged for 21 days, processed in USDA inspected facilities, cut & wrapped by small-scale, artisan butchers and delivered directly to you via Good Eggs.We are an independent, family-owned company. We practice holistic management on the rangelands we manage, taking into account the land, animals, and people affected by our decisions. We invite you to take a tour of our operations here and to learn about the social, ecological and health benefits of 100% grass finished beef.	2	lb	25.99	13.0	lb	Meat	Bones & Offal	http://goodeggs1.imgix.net/product_photos/HhKS70yhSOcXi5xgSTBk_20160611-SonomaMeatCo_Oxtail_MG_1976%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
105	Organic Red Norland Potatoes	Organic Red Norland Potatoes are beautiful red potatoes and the accompaniment to your main dish. They do well with any task they are given, be it frying, steaming, roasting, stewing, grilling or baking. Pairs well with any herb.	1	lb	2.49	2.49	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/YAHSXXpDTH6iXMGzrGbt_potatoes_red.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	255	\N	\N	\N
1036	Fresh Fish Sampler for Two	New & Improved Fresh Fish Sampler includes 2 servings (0.66+ lbs) of 1 or 2 varieties of fish.  Possible varieties include:King Salmon (May-October)Steelhead TroutArctic Char California HalibutCalifornia White SeabassPetrale SoleBlack CodLing CodRock CodTrue CodSand DabsAlbacore TunaSea Scallops The concept of the Fresh Fish Sampler is based on another system that connects farms to the people called a CSA (Community Supported Agriculture).  But, In this case, fish.  You (the community) support the local fishermen, & me (the fishmonger).  Select either one-time, weekly (best choice!) or monthly.  You benefit by getting more than your moneys worth & a chance to try new fish.	0.66	lb	12.99	19.68	lb	Fish	Fish	http://goodeggs2.imgix.net/product_photos/vrEjQdldSYCsJuBvvUxz_FK1A9573.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
1038	Half Pound Fresh Wild California White Seabass	Fresh Wild California White Seabass is a thick, delicious fish. California White Seabass is caught off the Santa Barbara Coast, periodically coming north to San Francisco.  White Seabass is mild flavored, with large flakes.  Best on grill or broiled.  Just add lemon.	0.5	lb	12.49	24.98	lb	Fish	Fish	http://goodeggs1.imgix.net/product_photos/dB8hXxpTzWSEx5QaovwR_FK1A9277.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
1045	Half Pound Fresh Wild Sea Scallops	Fresh Wild Sea Scallops that I declare "Best in the World"...delicious, easy to quickly prepare & sear.Half-order (1/2 lb) includes 6-9 Sea Scallops.  Fresh out of the shell, dry-packed (no preservative liquid).Preparation & Cooking:4 minutes in a pan medium high with some kind of combination of garlic, butter, oil, salt & pepper.These Scallops are sourced from M&B Sea Products a leader in SUSTAINABLE FISHING PRACTICES.Here is information from their website www.freshseascallops.com:M&B Sea Products has deep ties to the seas of the North Atlantic. Each coming from generations of fishermen, John F Murray and Herman Bruce, came together in 1993 to found the company.With years of knowledge and experience in the scallop industry, we established our business in historic New Bedford, Massachusetts, home to the largest scallop fleet in the world, and set out to provide the freshest scallops available. We operate our own fleet, allowing us to bring you some of the best sea scallops and seafood available!It is our mission to ensure that you receive the finest scallops available, M&B Sea Products make quality and freshness our priority—because we operate our own fishing vessels, we can control our quality and set the same standards for our partner vessels. While observing sustainable fishing practices, we strive to deliver you the most high-quality sea scallops at competitive prices.We go above and beyond to adhere to our strict standards. This attention to detail and expertise, coupled with our supreme customer service, ensures we provide the highest quality, environmentally sustainable scallops on the market.M&B Sea Products is dedicated to ensuring sustainable fishing practices. In addition to strictly adhering to all rules and regulations of the fishing industry, we also have specially designed our gear to catch only scallops and minimal amounts of bycatch (the accidental capture of untargeted species). Both our owners are members of the board for Fisheries Survival Fund and we offer our fleet to be used in scientific discovery trips. We have great interest in protecting the New England fishery, which is not only our most valuable fishery, but also the most valued wild scallop fishery in the world.The Atlantic sea scallop program is one of the most successful of its kind. Sustainably harvested scallops can self-replenish on a yearly basis. The Atlantic sea scallop population is near record highs as the fishery continues to operate at sustainable levels. The collaborative efforts of scallop fishermen, scientists, fishery managers, and environmentalists are responsible for keeping this fishery sustainable for today and the future.To learn more about sustainable fishing practices, visit SMAST Fisheries and NOAA Fish Watch	0.5	lb	14.99	29.98	lb	Fish	Shellfish	http://goodeggs2.imgix.net/product_photos/BNQ8nPMhRk2BVWlUwE2u_FK1A9438.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N	\N	\N
31	Organic Red Seedless Grapes	Tart and sweet Organic Red Seedless Grapes are the perfect snacking fruit. Great for kids!When none of the farms we work with directly have Organic Red Grapes, we work with our neighbor and trusted distributed partner, Earl's Organic to source us the highest quality produce they can. These Organic Red Grapes are coming from Sunview Farms Earlimart and Delano, California.	1	lb	3.99	3.99	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/KqZD6PSWuRByCBT4rrgi_unspecified.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	301	\N	\N	\N
1	Organic Blackberries	Sweet and tart, these delicious blackberries are the perfect fall fruit. Whether you like them sweet in a bowl of yogurt, oatmeal, or fruit salad, or prefer them on the savory side in pan sauces or roasts, no fruit basket is complete without blackberries.When none of the farms we work with directly has Organic Blackberries, we rely on our neighbor and trusted distributor, Earl's Organic Produce, to source us the most delicious berries in California. This week's Blackberries are coming from Rancho Don Antonio in Nipomo, CA.	6	oz	3.99	0.67	oz	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/NmgHoSgSqmShNF10cLni_blackberries_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	241	\N	\N	\N
2	Organic Red Flame Grapes	Grape season is here! Enjoy the crisp texture and excellent, sweet-tart flavor of our Organic Red Flame variety. A perfect between-meal snack, grapes are also a refreshing addition to both fruit and vegetable salads. Keep a stash on hand in your freezer for a deliciously sweet treat without the extra sugar and calories! Grapes are an outstanding source of health promoting poly-phenolic antioxidants, vitamins and minerals.	2	lb	6.99	3.5	lb	Produce	New & Peak Season	http://goodeggs1.imgix.net/product_photos/W8yH5WQdS6GEKHpClDQW_lRZ_3Vy0jB72bLviUNRIIhmMxMHtE-MyA6YyjfcxwCQ.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	301	\N	\N	\N
3	Organic Princess Seedless Grapes	Organic Princess Seedless Grapes! These large, luscious, light green berries are a perfect blend of sweet and tart. Gobble them by the handful while you enjoy their satisfying crunch and slight floral character. Kids especially love frozen grapes as a refreshing treat on those warm summer days.	2	lb	6.99	3.5	lb	Produce	New & Peak Season	http://goodeggs1.imgix.net/product_photos/Hw7KQ4eSQmGC5I6ld3pA_xLKNUloLvGi2c0DPg-zPwQowoJFqmX5R0peONf8gqAI.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	301	\N	\N	\N
4	Organic Fresh Cranberries (Canada)	These little berries are super-tart and deliciously sweet, not to mention a fantastic source of Vitamin C, manganese, and other naturally-occurring vitamins and minerals. Cranberries are great for roasting or braising alongside veggies and meat, blending into smoothies, cooking down into sauces or compotes, or (of course!) baking into a perfect apple-cranberry pie.	8	oz	2.99	5.98	lb	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/7Lmvq7bTVyydDqRDOi2g_20161110-CranberryPatienceIMG_5781.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	230	\N	\N	\N
5	Organic Broccoli	Swanton's coastal-grown Broccoli is tender and sweet. Enjoy it roasted or simply steamed!You can eat this Broccoli with the knowledge that you're supporting a farm that's on the forefront of good agricultural labor practices.  Employees of Swanton Berry Farm are proudly unionized under United Farm Workers and the Agricultural Justice Project has certified them as Food Justice Certified. Read more about Swanton's industry-leading labor practices here!	1	lb	2.99	2.99	lb	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/k3YhI9rwQVGywq3eYBSG_broccoli_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	298	\N	\N	\N
6	Organic Small Fuji Apples	Hikari Farm's late season Organic Small Fuji Apples are the best snacking apples around! They are perfectly sweet with a mild tartness. They are crisp and juicy like Fuji Apples should be. The small size makes them perfect for packing in lunches or for snacking.	1	lb	1.79	1.79	lb	Produce	New & Peak Season	http://goodeggs1.imgix.net/product_photos/7Lc23WlQ7qpAefPlyvCJ_20160803-Devoto_PinkBlushApple_MG_7099%20%2823f7ee1404a450fb9b42364c5ce127fb27c5beb6%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
7	Red Little Gem Lettuces	Martin's Red Little Gems are always crunchy and always sweet. Use as the base of your next salad, coarsely chopped or torn.	1	lb	5.99	5.99	lb	Produce	New & Peak Season	http://goodeggs1.imgix.net/product_photos/3WS3Dw1DRDe2k1mytnFg_lettuce.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
8	Organic Large Celery	Beautiful large heads of un-topped celery from the coastal fields of Swanton Berry Farm. Don't forget to save the pungently-flavored greens for soups of all sorts!	1	count	1.99	0.8	lb	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/akE0VEpbQ7yZm4kiM1qE_celery_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	226	\N	\N	\N
9	Fresh Wild Chanterelle Mushrooms	Wild Golden Chanterelles from the Pacific North West are considered some of the finest mushrooms in the world.  With hints of apricots and pepper, Chanterelles are a wonderful highlight to any dish.  We recommend sautéing them with eggs and keeping it simple!	6	oz	8.99	23.97	lb	Produce	New & Peak Season	http://goodeggs1.imgix.net/product_photos/FXmXdvxlRymsg4fPcg8M_FK1A2151.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	342	\N	\N	\N
10	Foraged Chanterelle Mushrooms	Freshly foraged from forests of the the Pacific Northwest, these delicious wild mushrooms are meaty and sweet. Simply sautéed with a bit of butter and a pinch of fresh rosemary, Fresh Chanterelles are some of the most delicious wild-harvested mushrooms around. The season is dependent upon the rains in Washington and Oregon, so don't miss out on this short season!Connie from Wineforest has been working for decades with some of the most professional foragers in the country, all of whom harvest sustainably in order to ensure abundant harvests for generations to come.	1	lb	19.99	19.99	lb	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/008We1UTMGZlIi4blRxh_20161006-Wineforest_Chantrelles_1pd_MG_3154save4.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	342	\N	\N	\N
11	Organic Delicata Winter Squash	Delicata Squash has a golden flesh with a sweet, tangy, and nutty flavor. It is by far the easiest of the winter squashes to prepare because the skin is edible! Slice it up, scoop out the seeds, and season- then you're ready to roast!	2	lb	2.99	1.5	lb	Produce	New & Peak Season	http://goodeggs1.imgix.net/product_photos/VTDVdmo7Q8qf5Rd1TDJV_unspecified-10.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	346	\N	\N	\N
12	Organic Fresh Turmeric Root	Juicers and curry-makers rejoice! A new harvest of freshly-dug, barely-cured turmeric is upon is.This fresh turmeric root is brighter in flavor than its powdered counterpart.  Prepare it as you would ginger and add to fresh curries to brighten them up with a slight kick.  Turmeric also contains high levels of curcumin, a natural anti-inflammatory compound, making it a much sought-after item for adding to fresh fruit and veggie juices.Almost all commercially available fresh organic turmeric is imported from Peru or Hawaii, but we're lucky to have Whiskey Hill Farms growing this special treat for us just down the road in the Watsonville area. The wonders of heated greenhouses!	4	oz	4.99	1.25	oz	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/7vfp3quZSiKVGFaE8lIw_20161014-Tumeric_MG_4239.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	410	\N	\N	\N
13	Organic Karinata Kale	Karinata Kale from Full Belly Farm is a very special and unique green. It is a cross between Mustard Greens and Red Russian Kale and has a mildly spicy flavor with the texture and characteristics of a kale. Its leaves have a beautiful deep purple and green color. Get this special treat while it lasts. Only 3 farms that we know of anywhere grow this beautiful kale variety: Full Belly Farm, Good Humus Produce and the UC Davis student farm, so come get your kale bragging rights right here!	1	bunch	1.99	3.98	lb	Produce	New & Peak Season	http://goodeggs1.imgix.net/product_photos/2zyXMi5QSlmm6ZY231dt_kale_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	206	\N	\N	\N
14	Organic Sweet Wickson Crab Apples	The Wickson Crab Apple is small, like other crab apples, but different in every other way. They're sweet, with a tangy acidity. They're amazing for cider and perfect for a bite-sized snack.	3	lb	11.99	4.0	lb	Produce	New & Peak Season	http://goodeggs1.imgix.net/product_photos/cbiEb4A7Q5Cy4aGEO5zg_20161102-Filigreen_WicksonApples_3pd_MG_save3.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
15	Yellow Barhi Dates	Barhi dates are nature's caramel. Sensual, velvety, and buttercream-sweet, these dates will please more than any candy bar, ice cream, or pie.When they're picked fresh off the palm tree, dates have a firmer, almost foam-like texture. While they can be used to pickle or chopped very small and used as a subtle sweetener to hearty grain salads, before they dry, they're very tannic. They're most commonly allowed to dry out to the point where the dates have a very apparent translucent quality to them, at which point their tannins have given way to an incredibly rich sweetness that can only be found in this short period of the fresh Date season.	8	oz	5.99	0.75	oz	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/yUF4Fer3Qee86AptPXsW_20160912-YellowBarhiDates_MG_0758.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	392	\N	\N	\N
16	Organic Chocolate Persimmons	Shaped more like a Hachiya than a Fuyu, this rare Persimmon variety has brown streaks throughout its flesh. It can be eaten somewhat firmer than a Hachiya without fear of that awful astringency that makes firm, underripe Hachiyas so devastatingly unappealing. You can also wait for the Chocolate Persimmon to soften up to a jelly-like stage and enjoy with a spoon. In either stage, it's got a pumpkin-apricot flavor with a hint of holiday spice.	5	count	6.99	4.99	lb	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/5r6DXl8ZRVuH9Bcvc2OV_20161021-FullBelly_ChocolatePersimmons_MG_4723.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	356	\N	\N	\N
17	Organic Green Garlic	Rick and Kristie Knoll grow some of the most beautiful green garlic in the Bay Area on their 18-acre, diversified fruit and vegetable farm in Brentwood, CA.  Green Garlic is the spring (or sometimes fall) version of the cured bulbs you're used to seeing year-round at the grocery store. If left to grow further, the garlic greens would die off in the heat of the summer, after the bulbs has rounded out, and, when hung up to dry, the familiar papery cellulose layers around and between the cloves would form a protective layer that enables the garlic heads to stay in storage for up to a year. At this stage in the plant's life, the whole plant is edible and can be chopped up much like a scallion. It has a sweeter, milder flavor than when the bulbs are fully cured.Try using green garlic in a stir-fry or chopped up with eggs.  For a quick (and delicious) kitchen project, use green garlic instead of basil in your next batch of pesto.	0.5	lb	4.99	9.98	lb	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/vHO29vDVSwS8Fkm7FGA4_FK1A1742.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	389	\N	\N	\N
18	Baby Spigariello Kale	These baby leaves of the Spigariello plant--an heirloom Italian Broccoli variety--have the Brassica sweetness of Broccoli with the tenderness of a Baby Kale.  It's great in hearty white bean soups or quickly sautéed with some olive oil, garlic and shallots, then hit with a bit of lemon juice at the end to bring out the sweetness. For a hearty salad, massage the Spigariello Greens with some buttery olive oil and let it soak in, covered in the fridge, for an hour or two.  Top with a pungent goat cheese, some slivered or toasted almonds, raw or pickled shallots, and a hit of lemon juice.	0.5	lb	3.99	7.98	lb	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/Wy7NQ9B9R1yEZoKswAJH_MartinB_Spigariello_Greens_Half_Pound.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	206	\N	\N	\N
19	Foraged Matsutake Mushrooms	Freshly harvested from Oregon, these delicious wild mushrooms boast a peppery, earthy flavor. Try shaving them into a hot, salty miso soup right before removing it from the heat.Please note: Matsutake should be consumed within 48 hours of delivery. They're a very delicate mushroom, with all sorts of microbial forest flora and fauna, so they can can break down fairly quickly.	8	oz	14.99	29.98	lb	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/NfrYkGCRzGzaMhWt82YQ_FK1A4624.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	342	\N	\N	\N
20	Hachiya Persimmon Trio	Hachiyas are often the reason people think they hate Persimmons. Eaten before it's fully ripe, it's got an awful, astringent quality that'll dry your mouth out and make you swear off these otherwise delicious fruits forever. But, when the Hachiya reaches a stage of extreme softness--an almost jelly-like state where the skin and flesh taken on an translucent quality and it must be handled very gently to not break the delicate skin--its tannins give way to sugars, and the Hachiya becomes one of the sweetest fruits around. Eat (messily) out of hand, or if you're trying to impress your guests, you can place the persimmon stem-side down, slice off the tip, and serve with a spoon.	3	count	5.99	4.28	lb	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/zr7UoOaQSBm7brcGynnc_persimmon_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	356	\N	\N	\N
21	Organic Seasonal Bouquet	We can guarantee that each and every one of Thomas Farm's unique seasonal bouquets will be beautiful, but please note that due to their seasonal nature, the bouquet might not look exactly the same as the one pictured.	1	bunch	13.99	\N	\N	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/PiNV3Ma1SZuy53TSmNaw_unspecified-3.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	318	\N	\N	\N
22	Jumbo Pink Banana Squash	Autumn's huge winter squash harvest at RobinSong produced some amazing looking and amazing tasting squashes, and we'd love to share the abundance with you. This Pink Banana Squash, despite its enormous size, is mostly flesh, with a fairly small seed cavity. Its flesh is fragrant and rich, and it can be used in soups, stews, or roasted alone. It pairs well with rich flavors like butter, cream and truffles. It'll store for months, so feel free to use it as a dining room table centerpiece until you're ready to use it!Please note: this is a very big squash. It weighs 7.5-12.5 lb and is approx. 15-25" long.	1	count	17.99	2.4	lb	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/olqLQD9vRu62Yps3IddU_FK1A8448.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	346	\N	\N	\N
23	Jumbo Blue Hubbard Squash	Blue Hubbards can become a bit more of a Beige, Grey or Pink Hubbard in storage, but they'll taste delicious for months and months. Blue Hubbards are often used as a replacement for Pumpkins in cooking and baking, due to their sweet flavor, fine texture, and slightly nutty undertones. It's also popular in soups and stews. It'll store for months, so feel free to use it as a dining room table centerpiece until you're ready to use it!Please note: this is a very big squash. It weighs between 7.5-12.5 lb, and is almost the size of a basketball.	1	count	17.99	2.4	lb	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/oNQeEhgtQjK4jHl2ijdv_20161103-RobinsonFarm_GiantBlueHubbard_MG_5987%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	346	\N	\N	\N
24	Jumbo Jarrahdale Squash	Autumn's huge winter squash harvest at RobinSong produced some amazing looking and amazing tasting squashes, and we'd love to share the abundance with you. Jarrahdales have a deliciously nutty flavor, with very firm and non-stringy flesh. It'll store for months, so feel free to use it as a dining room table centerpiece until you're ready to use it!Please note: this is a fairly large squash. It weighs 7.5-12.5 lb and is approx. 12-15" in diameter.  It can also vary in color: it starts out blue-ish or green-ish grey and then begins to turn a bit more of a tan or pink in storage. It'll taste equally delicious no matter how it looks on the outside!	1	count	17.99	2.4	lb	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/nNKvqtCRQ2E1bLAvIiof_20161102-ThomasFarm_JarrahdaleSquash_MG_5956.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	346	\N	\N	\N
25	Organic Ugly Seasonal Juicing Box	The Good Eggs Juice Box is a weekly selection of fresh, juice-able (yet still totally snack-worthy) produce from the Good Eggs Farmers you have come to know and love. Each week we will feature a new selection of organic fruits and veggies in bulk for you to blend, press, or simply munch on for the week.	1	count	12.99	1.62	lb	Produce	New & Peak Season	http://goodeggs1.imgix.net/product_photos/74TTOpnDSsKPwx6HAnov_2016-04-14.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	303	\N	\N	\N
26	Organic Brussels Sprouts	Brussels Sprouts are small, delicious members of the brassica family of veggies (it also includes cabbages, cauliflower, broccoli, and more). They're as good for you as they are delicious, high in many essential vitamins and nutrients. Try them halved and roasted on a sheet pan in a very hot oven with a splash of olive oil and a sprinkle of salt, bake them into a rich and cheesy gratin, or keep 'em raw and slice them thinly for a cole slaw or a fresh, crunchy salad.	1	lb	5.99	5.99	lb	Produce	New & Peak Season	http://goodeggs1.imgix.net/product_photos/9ljUV7XlReymG9yT122L_brussels_sprouts_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	369	\N	\N	\N
27	Organic Green Beans	Green Beans are crisp, snappy, and perfect for any and all holiday preparations. Grilled, roasted, fried, sautéed, baked into a casserole or washed and served raw for the kid's table—there's no wrong way to prepare this versatile veggie.	1	lb	3.99	3.99	lb	Produce	New & Peak Season	http://goodeggs2.imgix.net/product_photos/fSuISH0hRWC6AXON2IIO_green_beans_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	310	\N	\N	\N
28	Organic Green Beans (Bulk)	Green beans are crisp, snappy, and perfect for any and all holiday preparations. Grilled, roasted, fried, sautéed, baked into a casserole or washed and served raw for the kid's table—there's no wrong way to prepare this versatile veggie, and now you can get it in a 3 lb bag big enough to serve the whole table.	3	lb	9.99	3.33	lb	Produce	New & Peak Season	http://goodeggs1.imgix.net/product_photos/7ybu4ZtTC51SJw5pEvdg_20161102-GreenBeans_3pd_MG_5945.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	310	\N	\N	\N
29	Organic Fuyu Persimmons	Of the many varieties of persimmon enjoyed worldwide, the Fuyu is by far the most popular. Fuyus are sweet, rich in flavor, and unlike their astringent Hachiya cousins, they are ready to consume while still crisp, like munching on an Autumn apple. Enjoy these seedless wonders sliced in salad, with yogurt, or right out of hand. They also make fabulous seasonal decorations!	1	lb	3.99	3.99	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/Np9IHpeR26ZcLyhPLaIw_unspecified-17.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	356	\N	\N	\N
30	Fuyu Persimmons	Jeremy Murdock's Fuyu Persimmons are some of the most delicious we've ever had. Grown in Winters, CA, just 70 miles from our San Francisco Food Hub, these Fuyus are harvested ripe and ready to eat. Though not certified organic, Jeremy--a former CCOF inspector--knows how to grow these Persimmons to perfection without the use of any pesticides or fertilizers whatsoever. The squat, tomato-shaped Fuyu variety--unlike the acorn-shaped Hachiya variety--can be eaten firm like an apple for a mildly sweet crunchy treat, or can be left to soften to a gel-like stage for an intensely sweet experience.	1	lb	3.99	3.99	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/wK1ZQFRiSsSnHcnBNzb3_20161012-FuyuPersimmon_Duo_MG_3518.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	356	\N	\N	\N
32	Organic Fuyu Persimmon Trio	Of the many varieties of persimmon enjoyed worldwide, the Fuyu is by far the most popular. Fuyus are sweet, rich in flavor, and unlike their astringent Hachiya cousins, they are ready to consume while still crisp, like munching on an Autumn apple. Enjoy these seedless wonders sliced in salad, with yogurt, or right out of hand. They also make fabulous seasonal decorations!	3	count	3.79	4.74	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/YhuCf67mRO2cQseC8am2_persimmon_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	356	\N	\N	\N
33	Organic Pomegranates	Pomegranates are the darling of fall fruit, as they hide in their caverns tiny jeweled arils that bring color to otherwise drably colored fall dishes. To easily access the arils with minimum mess, try quartering the fruit and removing arils in a bowl of water.	2	lb	4.99	2.5	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/XsiebQSsRrGDniRmkP8L_unspecified-10.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	386	\N	\N	\N
34	Six Organic Bananas	We've heard from hundreds of you that you'd love for us to offer Bananas, and we're proud to now offer a very different kind of banana than what you'll generally find at the supermarket.These Organic and Fairtrade Bananas are grown by the San Miguel de Brasil Cooperative in El Oro, Ecuador are many things: they're a perfectly healthy on-the-go snack, they're a naturally sweet base to your morning smoothie, and if all else fails, they're the frozen inspiration behind your next batch of banana bread. For all the things these bananas can be, we decided early on in our search for an ethically-grown banana that one thing they will never be is a product of the prevailing global banana industry that has both historically and even recently wreaked ecological, social and political havoc in regions of the world in which bananas grow.The 134 small growers of the Cooperative work together to pack, market and ship their bananas directly to international buyers, which allows them to receive a higher price for their fruit and have more control over the process than going through one of the larger banana labels. These bananas are Certified Organic, Global GAP Certified and Fairtrade Certified by Fairtrade International.	6	count	3.99	1.6	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/NjWf2hI8TPlY4wk93SBy_FK1A8104.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	339	\N	\N	\N
35	Organic Banana	We've heard from hundreds of you that you'd love for us to offer Bananas, and we're proud to now offer a very different kind of banana than what you'll generally find at the supermarket.These Organic and Fairtrade Bananas are grown by the San Miguel de Brasil Cooperative in El Oro, Ecuador are many things: they're a perfectly healthy on-the-go snack, they're a naturally sweet base to your morning smoothie, and if all else fails, they're the frozen inspiration behind your next batch of banana bread. For all the things these bananas can be, we decided early on in our search for an ethically-grown banana that one thing they will never be is a product of the prevailing global banana industry that has both historically and even recently wreaked ecological, social and political havoc in regions of the world in which bananas grow.The 134 small growers of the Cooperative work together to pack, market and ship their bananas directly to international buyers, which allows them to receive a higher price for their fruit and have more control over the process than going through one of the larger banana labels. These bananas are Certified Organic, Global GAP Certified and Fairtrade Certified by Fairtrade International.	1	count	0.69	1.97	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/ZvQsVECTTdu9bUWhEdKe_FK1A8096.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	339	\N	\N	\N
36	Organic Hayward Kiwis	Also known as Chinese Gooseberries, these Hayward Kiwis are fuzzy and bland on the outside, yet bright as a gem on the inside. Once the fuzzy skin is shaved off, the fruit that remains is a perfect balance of sweet-tart deliciousness. The California Kiwi season is short, so get em while you can!As we're currently near the beginning of the California Harvest, so the Kiwis may be on the firmer side and may need up to a week to fully ripen.	1	lb	3.99	3.99	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/4YJe7mLcRAa05v3hantp_kiwis_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	340	\N	\N	\N
37	Organic Baby Dragonfruit	With a refreshingly mild, tropical flavor (think Kiwi mixed with Banana mixed with Honeydew), this unique fruit -- rarely grown in California -- has a striking exterior and an even more striking flesh. Juiced or blended, the Dragonfruit can serve as an amazing color addition and mild sweetener.These dragonfruit is grown by Devine Growers in Fallbrook, CA, and brought to us by our trusted distributor partner, Veritable Vegetiable.	1	count	4.99	14.26	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/33x6oRhXQnafI9oWgs7R_20161102-DevineGrowers_BabyDragonfruit_MG_5892.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	329	\N	\N	\N
38	Bulk Organic Hayward Kiwis	Also known as Chinese Gooseberries, these Hayward Kiwis are fuzzy and bland on the outside, yet bright as a gem on the inside. Once the fuzzy skin is shaved off, the fruit that remains is a perfect balance of sweet-tart deliciousness. The California Kiwi season is short, so get em while you can!As we're currently near the beginning of the California Harvest, so the Kiwis may be on the firmer side and may need up to a week to fully ripen.	3	lb	9.99	3.33	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/Z1qoTHg9TpSqAzvJBgHx_20161104-Kiwi_3pd_MG_6239save2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	340	\N	\N	\N
39	Organic Mexican Guavas	With a mild pineapple flavor and a creamy orange flesh, these unique fruits will turn from green to yellow when ripe. They've got very firm white seeds that should be avoided.	1	lb	4.99	4.99	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/PkRggjgSMqFBcu14OzDq_20161014-BeckGrove_MexicanGuava_MG_4049.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	215	\N	\N	\N
40	Organic Lemon	Juicy and acidic, lemons are a must-have for any kitchen. Use it on fish or to add some life to your next salad dressing.When none of the farms we work with directly has lemons, we rely on our trusted distributor, Veritable Vegetable, to source us the highest quality organic lemons around. These Organic Lemons are grown in Riverside Co. by Corona-College Heights.	1	count	0.99	3.3	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/m1XSgyCBTXaatVP9HF5f_lemons_01%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	374	\N	\N	\N
41	Lime	Sustainably grown, these first-of-the-season Limes offer a bright acidity to liven up tacos, pho or any earthy, nutty grain salad.	1	count	0.59	2.95	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/MPMLcMrtQ9XjLwpS6fug_limes_03%20copy.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	328	\N	\N	\N
42	Organic Limes	A must have for salsas, guacamole, fish dishes and thai food. 	1	count	0.79	3.95	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/alDvXiZbQyarV634fYIA_limes_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	328	\N	\N	\N
43	Limes	Sustainably grown, these first-of-the-season Limes offer a bright acidity to liven up tacos, pho or any earthy, nutty grain salad. With this 2 lb bulk sizing, you'll have plenty of juice for desserts or limeade.	2	lb	4.99	2.5	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/jzFHOdtESlWc5adHZPNp_bag_limes.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	328	\N	\N	\N
44	Organic Finger Limes	Known as the "caviar of citrus," this tiny fruit grows in a thorny citrus bush, making it a pain to harvest, but oh-so worth it. It contains tiny round segments bursting with an acidic, lime-like juice, making it great for coating the rim of cocktails, replacing caviar on sushi, and adding a textural pop to your next taco.	1.75	oz	5.99	3.42	oz	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/PSJRA9SXRiibU9Lj0qhT_finger_limes_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	328	\N	\N	\N
45	Organic Meyer Lemons	The Meyer Lemon is less tart than other lemon varieties. It also has a noticeably more floral taste, making it perfect for desserts and salad dressings. These lovely lemons are from Guru Ram Das Farm.	1	lb	3.99	3.99	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/Zh1XKGGeSguiRGkM0ZVI_unspecified-13.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	374	\N	\N	\N
46	Organic Makrut Limes	Also known as Kaffir Limes, Makrut limes are the secret ingredient to your next homemade curry paste. The zest from these limes is what really sets authentic South East Asian cooking apart from the imitations.	0.5	lb	3.99	7.98	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/MqHBOuVTW6AI63m08Sle_GKJNrALSWCvVGHSetZdX_limes_kafir_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	328	\N	\N	\N
47	Organic Meyer Lemons	These Meyers aren't the gorgeous, glossy Meyers of peak season, but their zest and juice are perfect for baking, making cocktails, and finishing off a salad dressing. Meyer lemons are sweeter and more fragrant than other varieties of lemons, with a slightly lower but perfectly balanced acid content, making them exceptional in flavor for lemonade and juicing. Also delicious zested onto desserts such a lemon bars and cream pies.	1	lb	5.99	5.99	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/lodymfjxQOaYUK4kyeKH_lemons_meyer_4_1.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	374	\N	\N	\N
48	Organic & Biodynamic Bosc Pear Duo	With their long, elegant neck, and beautifully golden russeted skin, Bosc pears are as much of a delight for the eyes as they are for the mouth. The flesh is sweet even before it fully ripens up, so these pears are ideal for slicing into salads, poaching or broiling.	2	count	2.29	2.69	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/YIAdIlT0aN9v3Y9MnOtg_MtHoodOrganics_Bosc_Pear_Duo_80ct.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	292	\N	\N	\N
49	Organic Pink Lady Apples	The Pink Lady, with it's delicate balance of both sweet and tart, almost effervescent flavor, has quickly become a customer favorite. And what a beauty it is! This cross between a Golden Delicious and Lady Williams variety is the only truly pink apple on the market. Great for baking and fantastic for applesauce!	1	lb	3.49	3.49	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/KnKv4EeNTUaTBBJifpoI_Apples_PinkLady.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
50	Organic Fuji Apples	Delicious, crisp and sweet, Stan's Fujis showcase what the Sebastopol climate and his crew's dedicated care and collective green thumb.	1	lb	2.99	2.99	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/RaUtxCh9RcyXklf4GGow_JvPpnrPl0QbuPp0P86Wv969AkmedfI7m4Ze93hiNbLk.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
51	Organic Fuji Apples	Perfect for on-the-go snacking these Fujis are on the smaller side, but pack a sweet punch nonetheless. Mostly on the sweet side, these apples are great for throwing into salads or eating with peanut butter.	4	lb	7.99	2.0	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/idBYd9NRTbSG5cJuIMD3_xzemHBTxj3-pY7qj_myMXTyD5VVhSNK5GGm3PgSWg6Q.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
52	Organic Granny Smith Apples	These Granny Smith Apples are far from your standard supermarket wax-covered apple. They're grown in Sebastopol's coastal climate, in which they slowly mature, concentrating all of their flavors into a more compact fruit, dense with sweet-tart flavor. They develop a light green, occasionally yellow tint, and are wonderful for eating and, of course, for baking projects. When Grannies are in town, they are not to be missed.	1	lb	2.99	2.99	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/IDwaDPUSwSqSIhNIUd9C_Apples_Gingergold_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
53	Bulk Organic Small Fuji Apples	Hikari Farm's late season Organic Small Fuji Apples are the best snacking apples around! They are perfectly sweet with a mild tartness. They are crisp and juicy like Fuji Apples should be. The small size makes them perfect for packing in lunches or for snacking. Order them in bulk so you can snack on them all week!	4	lb	6.99	1.75	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/Da2ROavJQb6UvR8hIOHe_apples_bulk_1024.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
54	Organic Newton Pippin Apples	As brightly colored as they are flavored, these Newton Pippins are the perfect choice for the tart apple lover, delicious eaten fresh and paired with mild cheeses. They have a tart-sweet flavor and a crisp, dense texture that holds up well to baking, makes them ideal for use in desserts.	1	lb	2.49	2.49	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/Q0RIy4W9TiuAwaBy5edz_TUVReWJMRKyAZSjpPn3c_LsSxwrkARMF4g1xaqi7CwECAYqGB-2Lp-UdIpZzIEeI.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
55	Organic Jonagold Apples	A very popular commercial variety, with exceptional flavour. Inherits many of the good qualities of its parents -- Jonathan and Golden Delicious. This variety has a sharp and refreshing taste!	1	lb	2.99	2.99	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/9RJfufXHRvSIsawK1WRz_Good%20Eggs%20010715-13.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
56	Organic Rome Beauty Baking Apples	What a beautiful apple!  Rome beauties are very firm at the beginning of the harvest, but already have exceptional flavorful.  These apples sweeten as their short season progresses, and they are renowned for the baking qualities as they maintain their shape when cooked.	1	lb	3.99	3.99	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/524VyaD3SZaCtLD6Z1VV_apples_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
57	Organic Jumbo Mountain Rose Apple Trio	Deliciously tart, these gorgeous, pink-fleshed apples are great for baking into pies or galettes. They're also wonderful for eating out of hand, or pairing with a nicely aged gouda or cheddar.	3	count	9.49	7.59	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/YLN2J1lCSGeiuGr5j0Py_20161019-HiddenStar_PinkApple_MG_4526-1.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
58	Organic Sweet Wickson Crab Apples	The Wickson Crab Apple is small, like other crab apples, but different in every other way. They're sweet, with a tangy acidity. They're amazing for cider and perfect for a bite-sized snack.	1	lb	4.99	4.99	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/sdldTnRGTF25LkJrbFOF_20161102-Filigreen_WicksonApples_3pdMG_5924.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
60	Organic & Biodynamic Cascade (Red Comice) Pear	The Cascade Pear is a Comice variety with a red blush to its skin. Its buttery flesh is sweet and juicy, making it the perfect holiday cheese platter addition. The best way to test for ripeness is the apply gentle pressure to the neck of the pear, looking for the flesh to yield ever so slightly.	1	count	1.29	2.74	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/cPB2SC5ITkiAubRD4q3L_20161102-MtHood_CascadePearRedComice_1ct_MG_5936.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	292	\N	\N	\N
61	Organic Royal Gala Apples	The Royal Gala is a crisp and juicy early-season variety. It has enough acidity to balance the sweetness, but isn't too tart, making it a kids' favorite. Live Earth is packing their smaller apples into 4 lb bags, so you can enjoy them throughout the week. They store best kept in the refrigerator, but take them out a few at a time if you want to enjoy them at room temperature.Regular price: $9.99. Sale price: $7.99!	4	lb	7.99	2.0	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/eF25N2t5RCu4rVHjhp0u_apples_bulk_with_bag%20save2.jpeg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
62	Organic & Biodynamic d'Anjou Pear	The d'Anjou pear (sometimes known as the Anjou pear), is sweet and juicy when ripe, with hints of a citrusy brightness, but the flesh is dense enough to hold up well to baking or poaching. The best way to test for ripeness is the apply gentle pressure to the neck of the pear, looking for the flesh to yield ever so slightly.	1	count	1.29	2.87	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/2iiVq3MqSXSrpPAFGaQ6_20161104-MtHood_DAnjou_1ct_MG_6193.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	292	\N	\N	\N
63	Organic & Biodynamic D'Anjou Pear Duo	The d'Anjou pear (sometimes known as the Anjou pear), is sweet and juicy when ripe, with hints of a citrusy brightness, but the flesh is dense enough to hold up well to baking or poaching.  Unlike the more familiar Bartlett pear, the d'Anjou barely changes color at all when ripe (perhaps a bit more yellow, but still pretty green), so the best way to test for ripeness is the apply gently pressure to the neck of the pear, looking for the flesh to yield ever so slightly.	2	count	2.99	2.72	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/YqxNOtgSLucUbIK8dwog_D%27Anjouy_Pear_Duo_60ct_MtHood.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	292	\N	\N	\N
64	Organic & Biodynamic Small Bosc Pear	With their long, elegant neck, and beautifully golden russeted skin, Bosc pears are as much of a delight for the eyes as they are for the mouth. The flesh is sweet even before it fully ripens up, so these pears are ideal for slicing into salads, poaching or broiling.	1	count	0.99	2.47	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/YWB0qPDfQdadlyOzEBl7_20161104-MtHood_Bosc_1ct_MG_6188.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	292	\N	\N	\N
65	Organic & Biodynamic Small Bosc Pear Trio	With their long, elegant neck, and beautifully golden russeted skin, Bosc pears are as much of a delight for the eyes as they are for the mouth. The flesh is sweet even before it fully ripens up, so these pears are ideal for slicing into salads, poaching or broiling.	3	count	2.79	2.33	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/5rkpW5VbTuWsOteJYJQV_20161104-MtHood_Bosc_3ct_MG_6174.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	292	\N	\N	\N
66	Organic Sierra Beauty Apples	 With a robust flavor, and a crisp and juicy yellow flesh, there's no better use for this apple than eating out-of-hand (though we won't stop you from using it in a pie). This Biodynamically Grown Sierra Beauty is everything one could ever want out of a snacking apple. 	1	lb	4.99	4.99	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/KELTVr13T0G74aVXgadn_OYJbcpt4QNWe4Ifad9kS_apples_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
67	Assorted Organic Sauce Apples	Before we send them to your door, we sort through all our apples to pull out any bruised ones, cut ones, scarred ones, or slightly-nibbled-on ones, so that you get only the best of the best. We hate the idea of throwing out a delicious apple because of one of these defects, so we're offering them to you at a discounted price for use in sauces, juicing, dehydrating, or, for those willing to eat around a bruise or a small worm-hole, snacking!These Apples are a mix of this week's seasonal varieties, all certified organic, from any of the following farms: Devoto Orchards, Hidden Star Orchards, and Filigreen Farm.	5	lb	6.99	1.4	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/A4Ygu6WRw2v8ppckXAEt_20160812-Apples_MixedSeconds_MG_7927.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
68	Organic Bulk Satsuma Mandarin	Side Hill Citrus's Satsuma Mandarins have a tangy level of acidity that brings light to its incredibly sweet flavor.  You won't be able to stop eating this easy-to-peel, seedless fruit.	3	lb	9.99	3.33	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/OgcVMOCVQvKtInlmwaWQ_bag_satsumas.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	283	\N	\N	\N
70	Cosmetically-Challenged Organic Valencia Oranges	Valencias are great for juicing, salads, cocktails and eating out of hand.These cosmetically-challenges fruits might be a bit scarred up on the outside, but they're just as sweet on the inside!These oranges were grown by Pauma Valley Citrus in Valley Center, CA, and brought to us by our trusted distributor Veritable Vegetable.	5	lb	6.99	1.4	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/eQQL9m7dTRORBZP6xozy_Capay%20Organic%20Ugly%20Juicing%20Orange%2010lb.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	245	\N	\N	\N
71	Organic Rio Grapefruit	Powerfully tart with a bit of sweetness, these Organic Rio Grapefruits are great for eating raw or broiling with a bit of brown sugar on top.They were grown by farmers in or near Riverside County, who sell to Corona-College Heights Orange and Lemon Association, a packing and marketing association with almost 600 grower members, 80% of whom operate on 20 acres or less. They were brought to us by our trusted distributor partner, Veritable Vegetable.	2	count	2.49	2.08	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/bxFjwrWaQBaMMIMizBnW_unspecified-7.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	228	\N	\N	\N
72	Bulk Valencia Oranges	Valencia Oranges are the ultimate off-season citrus. They produce in the summer, while most citrus fruits in the winter. They're a lower acid, high sugar citrus that are great for juicing.	5	lb	9.99	2.0	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/M5daQVkRQHS4b5Az3mrw_20160708-BernardRanch_Valencia_5lb_MG_4972.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	245	\N	\N	\N
73	White Marsh Grapefruit Duo	Lightly acidic with plenty of sugars to balance it out, these delicious White Marsh Grapefruit from Bernard Ranches in Riverside County are the perfect healthy snack.  Try broiling the halved grapefruit with a bit of honey or brown sugar on top for a sweet and tart dessert!Note: the White Marsh can vary in flesh color from light pink to yellow-white.	2	count	3.79	2.23	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/F55rewYaTV2UBbRzTnIB_20161003-BernardRanches_GrapefruitDuo_MG_2595.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	228	\N	\N	\N
74	White Marsh Grapefruit	Lightly acidic with plenty of sugars to balance it out, these delicious White Marsh Grapefruit from Bernard Ranches in Riverside County are the perfect healthy snack.  Try broiling the halved grapefruit with a bit of honey or brown sugar on top for a sweet and tart dessert!Note: the White Marsh can vary in flesh color from light pink to yellow-white.	5	lb	9.99	2.0	lb	Produce	Fruit	http://goodeggs1.imgix.net/product_photos/csIKBVdQq621d79rFjTq_20161003-BernardRanches_Grapefruit5pd_MG_2577.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	228	\N	\N	\N
75	Organic Juicing Satsuma Mandarin	These oddly shaped or oddly sized Satsumas might not be the prettiest, but the juice inside them is just as sweet and tangy as their more aesthetically pleasing brethren.  Some of these are fine to be eaten out of hand, while others may need a small soft-spot cut off before juicing.  And the price on these is perfect for making you and your loved ones tangy Satsuma juice for the next few breakfasts!	25	lb	49.99	2.0	lb	Produce	Fruit	http://goodeggs2.imgix.net/product_photos/R7o2i425RSqcson31PsQ_Satsuma%20%232%20Jucing%20Side%20Hill%2025%23.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	283	\N	\N	\N
77	Large Gwen Avocado	The Gwen is a tasty, green-skinned avocado--it doesn't darken as it ripens.  A cousin of the Hass, it is among the highest in oil content, which comes through in its rich flavor. It also oxidizes slowly, so its flesh looks bright green long after it has been cut open.  Bye-bye brown guacamole!	1	count	2.99	4.78	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/hheR8zaS2SI2wJNEz8hg_avocados_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	224	\N	\N	\N
78	Organic Fuerte Avocado	The Fuerte Avocado is your grandmother's avocado.  In fact, it wasn't so long ago that the Hass held little to no commercial appeal because it turned black when ripe.  In the 1950's, before the Hass reigned supreme, the Fuerte accounted for nearly two-thirds of all California avocado production, so people were more used to this thinner- and green-skinned avocado.  And even though the Hass is pretty much the only domestic avocado you find anymore outside of California and Florida, the Fuerte has a thriving fan club in the Golden State.  Once you spread some creamy Fuerte goodness over a thick slab of hearty toast, you'll understand why.	1	count	2.49	4.98	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/m7q4dgsRR8aF30BUbA8w_Fuerte_Avocado_Duo_Rancho_Vazquez_36ct.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	224	\N	\N	\N
79	Extra Large Gwen Avocado	The Gwen is a tasty, green-skinned avocado--it doesn't darken as it ripens.  A cousin of the Hass, it is among the highest in oil content, which comes through in its rich flavor. It also oxidizes slowly, so its flesh looks bright green long after it has been cut open.  Bye-bye brown guacamole!	1	count	3.99	5.7	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/68gHm9JjTtG4G17OLS1E_unspecified-16.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	224	\N	\N	\N
80	Organic Persian Cucumbers	With its thin skin, this lightly seeded cuke is sweet and juicy.	1	lb	3.99	3.99	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/LPdORPPfQuuh3YZVcUQH_cucumbers_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	364	\N	\N	\N
81	Organic Sugar Snap Peas	Pie Ranch's coastal microclimate allows them to grow this spring treat well into summer. Sweet crunchy and (almost) entirely edible, these delicious pods are great raw or sautéed.	1	lb	6.99	6.99	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/NNQ29s8LTdqW6MsqpbRs_Peas_Sugar_Snap.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	388	\N	\N	\N
82	Organic English Shelling Peas	Inside these fibrous, inedible pods, are some incredibly sweet, adorable little peas. They're delicious raw, but cooking them converts their starches into sugars and makes them even sweeter. Pie Ranch's coastal microclimate allows them to grow this spring treat well into summer.	1	lb	4.99	4.99	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/JCW980BQeFduuVEJ37w6_peas_english.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	388	\N	\N	\N
83	Organic Japanese Cucumber	Hikari Farms is known for their amazing Japanese Cucumbers. Thin-skinned and virtually seedless, these cukes lack the bitterness often associated with thick-skinned, rigid, heavily-seeded slicer cucumbers you'd generally find at the supermarket. Perfect for cutting into thin spears and dipping into hummus or chopped roughly into your next fresh green salad. Springtime may have just started, but it's already summer in Janet and Akira's magical greenhouses in Watsonville, CA.	1	lb	5.49	5.49	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/LibzqbVgTXON4EUIPJPW_Hikari_Japanese_Cucumber_Trio.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	364	\N	\N	\N
84	Organic Mixed Summer Squash	Summer squash makes a great grilling addition, as the Sunburst, Eight Ball, and Zucchini varieties are perfect for slicing, dressing with olive oil, and tossing over the flame.	1	lb	3.99	3.99	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/4QdvBNYwQyuZgxIjz6d1_squash_mix.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	346	\N	\N	\N
85	Organic Small Slicing Cucumber	Slice into salads or layer onto sandwiches, these all-purpose cukes are sweet and crunchy.These Organic Cucumbers were grown by the Sanchez Brothers in Carpinteria, CA.	1	count	1.79	3.58	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/z8HqBCT8uuU1q3THOzw6_20160518-Lakeside_Cucumber_MG_0046.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	364	\N	\N	\N
86	Organic Zucchini	Zucchini is a versatile warm weather veg with lots of nutty flavor. Quick sautée as a side, toss into scrambled eggs with a little parmesan cheese, or shave raw into a salad.	2	lb	4.99	2.5	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/Rb2TtPvsSaSHZEBVbT5o_TjTPPS9lQeO3F0tjCUAh_48BEFSLxQZSmja9GF77v_Zucchini_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	381	\N	\N	\N
87	Organic Watermelon Gherkins	These tiny members of the Cucumber family are slightly sour, with a taste between a Watermelon rind and a Lemon Cucumber. Also known as Mouse Melons, they're great pickled or as a healthy, crunch snack.	0.5	lb	4.99	9.98	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/P9bLiHCdRnm4my9AEoS4_MexicanSourGherkin-1%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	247	\N	\N	\N
88	Organic Globe Eggplants	Grilled, sautéed or baked into a classic eggplant parmesan, now's the time to enjoy these beautiful nightshades before the season is over!	1	lb	3.99	3.99	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/wUzudKgDRpaT8C0pAtz5_eggplant_04.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	313	\N	\N	\N
89	Organic Carrots	Sweet and crisp, these carrots are tasty cooked and raw. Try them roasted whole for a fancy side-dish, or sweep them through your favorite dip for an easy snack.	1	bunch	2.99	4.98	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/KKM5jIDZTDeVoB7uvVHJ_Medium%20Bunched%20Carrots%20Happy%20Boy.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	367	\N	\N	\N
90	Organic Carrots	Crunchy and sweet Organic Carrots. Great for shaving into salads or steaming and topping with dill for a healthy and hearty side.	1	lb	1.49	1.49	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/pWksMSO2TyZ4gUT4SciN_carrots_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	367	\N	\N	\N
91	Organic Purple Carrots	Crunchy and colorful, these carrots are great cooked or used raw--sliced, shaved or grated--in a salad.When we can't find Organic Carrots from the farms we source from directly, we rely on our trusted distributor partner Veritable Vegetable to source from the best and closest farms around. This week's Organic Purple Carrots are coming from Ralph's Organic Greenhouses in Mount Vernon, Washington.	1	lb	1.49	1.49	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/mF6sU4J0QjupgfFDyhcH_20161006-PurpleCarrots_MG_3171%20%283eefbeb30fb2465ae1c800ab78e77a63c8477844%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	367	\N	\N	\N
92	Organic Fennel	Fennel is great in soups alongside chicken and mushroom, and delicious in rigatoni or baked, seasoned and covered in parmesan. Try it in salads and casseroles as well.	1	head	2.49	2.49	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/3qMY9zUJThiNwxF3yH6L_S994FmSr0wpl6gfH9_l4-be-ZKqh1U5mKlGDENYs_l8.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	211	\N	\N	\N
93	Rainbow Carrots	As delicious as they are beautiful, Martin's Rainbow carrots are great for shaving raw into salads or roasting for a multi-colored side dish.	1	lb	2.49	2.49	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/pdd4QhpVRwaI3vDKQqtn_20161006-MixedCarrots_MG_3182.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	367	\N	\N	\N
94	Organic Tango Celery	Firm, juicy stalks with a healthy green sheen have that sweet, potent flavor that make this Tango Celery perfect in any classic preparation. Adding crunch to autumn salads or that elusive background flavor to any soup, we've come to love this old vegetable anew, growing with flavor quality rather than poundage in mind. One medium-sized bunch.	1	bunch	2.49	1.99	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/En1BKZ4GTZWT7jbOjJAa_ewZz1rmcTIStS71420yA_celery.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	226	\N	\N	\N
95	Organic Baby Carrots	Sweet and tender, these baby carrots (either Nelson or Mokum variety) are exceptionally fresh. Ideal as a raw snack or shredded into salads, but also thin enough to roast whole in the oven with a touch of oil and salt as a side dish that speaks for itself. Sold as 1 bunch, size and number highly variable, but typically 7-12 carrots.	1	bunch	2.49	\N	\N	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/dCLSMw26T4qYs6XINtXA_Baby%20Orange%20Carrots%20Countyline.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	367	\N	\N	\N
96	Organic Cosmetically-Challenged Juicing Carrots	Misshapen, too short, too thin, or slightly split, these Organic Carrots may not be the most beautiful in many supermarkets' eyes, but we know that their true beauty is in their flavor. These carrots are just fine for cooking or eating raw, but they're a great deal for those who want to add them to their fresh juice!These Carrots were grown by Ralph's Greenhouse in Mt. Vernon and brought to us by our trusted distributor partner, Veritable Vegetable.	3	lb	3.99	1.33	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/2jGAcPExQnGuyxLFPPK3_20161007-OrangeCarrots_MG_3194.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	367	\N	\N	\N
97	Small Aquaponic Calypso Celery	A staple for soups, a crunchy addition to fresh salads, and a healthy vehicle for peanut butter and raisins, these heads of celery can do it all. Aquaponically grown celery differs from its traditionally grown counterpart by having a distinctly balanced sweet and salty flavor to it, while being far juicier. Further differentiating itself from more traditional celery is the fact that this celery comes packed with the leaves of the plant, which can be tossed with salad greens, thrown into a stir-fry, as well as used for stocks, soups, and sauces. Toss the tender leaves with salad greens and vinaigrette. Throw them into stir-fries, stocks, soups, and sauces.	1	count	2.99	4.98	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/frWWo2YrQ6SOFH3mnbea_20160713-Ourboros_AquaponicCelery_MG_5301.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	226	\N	\N	\N
98	Organic Celery	What's a kitchen without Celery? Crisp, mild, and slightly peppery, celery can be diced for a mirepoix to make broth and soup, stuffed into your turkey, shaved into salads, or sliced and eaten as a snack. The leaves are edible too, and a bit more strongly flavored than the stalks.	1	count	2.99	1.5	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/IQKpuWwbTROFR8KglqKg_celery_04.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	226	\N	\N	\N
99	Organic Carrots	Who doesn't love carrots? These sweet, crunchy root veggies can be harvested all year round, and they can be prepared in an endless number of ways. Invaluable for stock, soup, stuffing your turkey, roasting, baking, juicing, mashing, slicing raw, and shredding for carrot cake.	1	bunch	2.49	2.49	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/enWpMEkgTKgGim6l8Y3c_Medium%20Bunched%20Carrots%20Happy%20Boy.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	367	\N	\N	\N
100	"Just a Few" Organic Celery Stalks	What's a kitchen without Celery? Crisp, mild, and slightly peppery, celery can be diced for a mirepoix to make broth and soup, stuffed into your turkey, shaved into salads, or sliced and eaten as a snack. No need to buy the whole head only to have it go to waste: we'll send you just a few stalks so you have enough for your recipe without a ton of extra.	0.25	lb	0.49	1.96	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/Dn0iFc1AQXSvJchSAVaH_20160816-SingleStalkCelery_MG_8028.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	226	\N	\N	\N
101	Organic Japanese Sweet Potatoes	These sweet potatoes have a firm, white flesh! These babies cook a little differently than their orange-fleshed cousins, so if you're unfamiliar read on: while orange sweet potatoes become soft and fluffy when cooked, white sweet potatoes remain dense and firm, making them an excellent candidate for dishes like a breakfast hash, oven roasted sweet potato fries, or chopped into chunks and added to hearty soups or stews.	1	lb	2.99	2.99	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/F62B1mB0S6aMLYT2FQ9R_jcWyBZvB5Dqbug3SNkrewYssa657h2iMDhee-4NdwuY.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	255	\N	\N	\N
102	Organic Stokes Purple Sweet Potatoes	Somewhat drier and starcher than the more common, orange-fleshed Garnet variety, the purple flesh of the Stokes darkens as it cooks, making them perfect for adding a color splash to your sweet potato fries, mashed sweet potatoes or simply roasted with some of their orange- and white-fleshed counterparts.These Stokes Purple Sweet Potatoes were grown in California by Freida's and brought to us by our trusted distributor partner Earl's Organic Produce.	2	lb	5.99	3.0	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/BuA6VgkQv6k6UHiWO9bK_20161108-PurpleSweetPotatoes_IMG_5736.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	255	\N	\N	\N
103	Yellow Potatoes	Martin grows a number of heirloom German potato varieties, and this yellow-skinned, yellow-fleshed variety is one of his favorites. Great for roasting.	1	lb	3.49	3.49	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/6ShHtiSRY217Dpobfkxw_potatoes_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	255	\N	\N	\N
107	Organic New Red Lasoda Potatoes	Full Belly Farm's Organic Red Lasoda Potatoes are fresh, thin-skinned, and creamy new potatoes! These potatoes are coming from this year's new crop, not out of last year's storage crop, so they should be stored in the refrigerator rather than your kitchen pantry for optimum freshness. Perfect for potato salads or roasting with your favorite herb.  These lovelies are red skinned and white-fleshed. These are smaller potatoes, ranging in diameter from dime-sized to quarter-sized.	1	lb	4.99	4.99	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/mLotDKukQl6MI93mOXMF_unspecified-7.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	255	\N	\N	\N
108	Covington Sweet Potatoes	This classic sweet potato is a bit more starchy than creamy, but still very sweet. This is a good roasting potato and pairs well with savory flavors. Great for gratins!These Sweet Potatoes are grown by Kibo Farm in Sonoma County, CA, and are brought to chefs and retailers throughout the Bay Area by F.E.E.D. Sonoma.	2	lb	5.99	3.0	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/PiHf0NuUTvq8fOW2smzd_unspecified-6.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	255	\N	\N	\N
109	Organic Gold Beets	Boiled or roasted, there's no wrong way to eat these delicious golden roots. Pair with citrus or creamy flavors. Use in salads or for juicing.	1	lb	1.99	1.99	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/K3NRzRhkTUiiwIfCZRwa_unspecified-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	399	\N	\N	\N
110	Red Beets	With their blood red color, these beets are richly sweet. Boiled or roasted, these beets are great simply topped with butter or chopped into a fresh salad.	1	lb	2.99	2.99	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/ASlZxFUsTyyS9b0tnEfw_beets_loose_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	399	\N	\N	\N
111	Organic New Bintje Potatoes	Organic New Bintje Potatoes are beautiful golden potatoes and the perfect all-around crowd pleaser. They do well with any task they are given, be it frying, steaming, roasting, stewing, grilling or baking. Because these are fresh, hand-dug new potatoes, store them in the refrigerator until you're ready to eat.	1	lb	4.99	4.99	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/suQpWuvmTmCKx8GglpoQ_unspecified-6.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	255	\N	\N	\N
112	Large Kennebec Potatoes	Martin grows a number of heirloom German potato varieties, and this yellow-skinned, yellow-fleshed variety is a classic potato for mashing and frying.	2	lb	4.99	2.5	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/w2ZMN6CnQC6aLQodmKqQ_yukon_gold_potatoes_a_size_td_willey_2_pounds_1024.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	255	\N	\N	\N
113	Organic Chioggia Beets	Chioggia beets have a beautiful pink skin and when cut open on the diagonal display white and pink concentric circles. They are considerably lighter, less intense, and do not stain as intensely as the red beets. We recommend preparing the different colors of beets separately from each other in order to maintain their individual colors and flavors!Don't forget to save those stems, as these relatives of chard have a very similar flavor!	1	bunch	3.49	6.98	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/nLmKXywT0yAvcR6OdPoO_FK1A3602.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	399	\N	\N	\N
114	Organic Red Beets	This is perhaps the most familiar of the beet varieties and has the most distinct earthy beet flavor. Red beets will stain your life a beautiful hue of magenta! We recommend preparing red beets separately from any other color of beet you are cooking as the reds will take over both in flavor and color. Roasting is our preferred method of preparation!	1	bunch	3.49	5.82	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/y0bWAtRYSXK6QM4LqGwq_beets_red_bunch_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	399	\N	\N	\N
115	Organic Bunched Gold Beets	These Organic Beets have golden-yellow roots and deliciously edible greens.Try them roasted or boiled, and don't forget to save the tops for a quick sautéed side similar to chard!	1	bunch	2.49	3.32	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/wu8LD7iERS2OgRhkOjDI_beets_gold_bunch_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	399	\N	\N	\N
116	Organic Russet Potato	Russet or "Idaho" potatoes are large and starchy, with relatively dry white flesh that is perfectly suited to baking, mashing, or frying. Slice them into long wedges and bake with olive oil and salt for a healthier take on a French fry, or chop them up and boil the pieces, then mash them with butter, salt, and pepper for a classic rustic mashed potato.	1	count	0.79	1.58	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/mTyslwP5QkmO1YU8zHTy_Russet_Potato_90ct.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	255	\N	\N	\N
117	Organic Russet Potatoes (Bulk)	Russet or "Idaho" potatoes are large and starchy, with relatively dry white flesh that is perfectly suited to baking, mashing, or frying. Slice them into long wedges and bake with olive oil and salt for a healthier take on a French fry, or chop them up and boil the pieces, then mash them with butter, salt, and pepper for a classic rustic mashed potato. This 3 lb bulk bag of potatoes should be enough for all of your Thanksgiving guests!	10	count	4.99	1.0	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/LQxWbx3lSmWYU6H8KN9S_20161102-RussetPotatoes_10ct_MG_5952.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	255	\N	\N	\N
118	Organic Green Beans	Green beans are a versatile side dish that go with any main. Prepare them any way you want to - braised, stir fried, or stewed- you can't go wrong!	1	lb	4.99	4.99	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/zNi5oNVSOek8r7DNzMuG_unspecified-8.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	310	\N	\N	\N
120	Organic Baby Green Kabocha Squash Duo	These mini squashes from Pie Ranch are the perfect size squashes for stuffing! Kabocha squash doesn't carry as much sweetness as some of the other winter squashes. This velvety and golden - fleshed squash has a chestnut-like flavor. It packs a punch of umami that makes it the most supremely flavorful of all winter squashes. Goes great in soups, roasts, and curry.	2	count	3.99	2.0	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/k7OaEYnRQYWGrzPWkGKp_unspecified-8.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	346	\N	\N	\N
121	Organic Honey Nut Squash	Honey Nut squash are mini Butternut Squash. They have a flavor similar to a butternut but sweeter and have a deep orange color.	2	lb	4.99	2.5	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/unyhipVaTfeBMSGSUyO4_squash_honey-nut.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	346	\N	\N	\N
122	Organic Large Butternut Squash	Butternut Squash has a nutty flavor and is sweet like a pumpkin. When ripe, the flesh turns increasingly deep orange, and becomes sweeter and richer. It has a long shelf life and is great countertop kitchen staple. Butternut squash pairs well with sage. Caramelize your sage in butter and drizzle upon your perfectly roasted squash for an incredible treat.	1	count	3.99	1.33	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/GRa5tfq8RjKYtpAGOC80_unspecified.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	346	\N	\N	\N
124	Organic Brussels Sprouts	Rodoni Farms is well known for their organic Brussels sprouts -- both for their amazingly consistent flavor and quality as well as for their innovations in growing them organically and at scale. Brussels sprouts are a winter must-have and are excellent quickly sautéed with browning butter and pancetta.Please note: it is next to impossible to grow Brussels Sprouts organically without a few aphids catching on to the deliciousness. While we do our best to send out only the cleanest sprouts and clean up whatever we need to, but you may fine an aphid or two on a few sprouts.	1	lb	7.99	7.99	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/FjniZtHFTIqbnUwL82WJ_f8B1p9An1YyfRtR9bJf7h-0SztEcfaUZfjQiEKdXyUU.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	369	\N	\N	\N
125	Organic Spring Red Torpedo Onions	Rick and Kristie Knoll grow some of the most beautiful alliums in the Bay Area on their 18-acre, diversified fruit and vegetable farm in Brentwood, CA.  Spring Onions are the spring (or sometimes fall) versions of the cured bulbs you're used to seeing year-round at the grocery store. If left to grow further, the onion greens would die off in the heat of the summer, and then after the bulbs had thickened up a bit, they'd be hung up to dry, and the familiar papery cellulose layers would form a protective layer that enables the onion to stay in storage for a few months up to a year, depending upon the variety. At this stage in the plant's life, the whole plant is edible and can be chopped up much like a scallion. It has a sweeter, milder flavor than when the bulbs are fully cured.	1	bunch	3.49	13.96	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/YaAyiZTxed18onFlcR4w_20161029-RedOnion_MG_5733.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	253	\N	\N	\N
126	Wild Nettles	Wild nettles are a unique seasonal delicacy, sprouting up with the rain for very short season in the late fall and early spring. They grow like a weed on the edges of the farm and are hand harvested only in their prime.They're delicious on their own brewed into a bright-green tea, added to soup stocks or stews for a delightfully rich earthy/briny flavor, or steamed and added to your favorite enchilada/pizza/lasagna recipe. They pair especially well with seafood and with eggs and pack a big nutritional punch to boot! Nettles are sometimes called "seaweed of the land" because of their complete spectrum of trace minerals and soft salty flavor.	0.2	lb	3.49	17.45	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/URYj5GFVTzSm1XZTdbFV_9Xn9siVKQXuANHFNscTf_nettles_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	325	\N	\N	\N
127	Organic Red Kuri Squash	These hubbard-type squash has a distinctly chestnutty flavor that pairs well with alliums, bay leaves and bright sweetnesses like cranberries. The Red Kuri can be hard to skin raw, so it's best cooked with the skin on or cubed and roasted. When fully cooked, the skin is edible, just like a Delicata! It has a smooth, silky orange flesh.	1	count	4.99	1.66	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/qtOd4xxnQbKeGiqnUuNg_squash_2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	346	\N	\N	\N
128	Enormous Pink Banana Squash	Autumn's huge winter squash harvest at RobinSong produced some amazing looking and amazing tasting squashes, and we'd love to share the abundance with you. This Pink Banana Squash, despite its enormous size, is mostly flesh, with a fairly small seed cavity. Its flesh is fragrant and rich, and it can be used in soups, stews, or roasted alone. It pairs well with rich flavors like butter, cream and truffles. It'll store for months, so feel free to use it as a dining room table centerpiece until you're ready to use it!Please note: this is a very big squash. It weighs 17.5-22.5 lb and is approx. 20-30" long.	1	count	24.99	1.43	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/jVM5Mz2jTsKTOXkyWCcS_20161103-RobinsonSong_PinkBananaSquash_MG_5985.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	346	\N	\N	\N
129	Organic Jack-o-Lantern Pumpkin	These beautiful carving pumpkins will ready your stoop, porch or window for Halloween! While many markets that sell mostly organic produce will source conventional Pumpkins for carving, we feel strongly about supporting sustainable growing practices even when the fruit, vegetable or flower isn't being ingested. We still want everyone who touches the produce--from seed to harvest to delivery--to work in a safe environment, free of harmful pesticides, and we still want to protect the immediate and regional environments from synthetic fertilizers.	1	count	4.99	1.0	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/jEqtEu4iShCnPVx5WtpG_pumpkin.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	235	\N	\N	\N
130	Organic Cinderella Pumpkin	These large, beautiful, lobed Pumpkins have a red-orange skin with a creamy, rich flesh. They sometimes have a dark green webbing to them and the occasional (spooky!) scarring, but that just makes them look all the cooler and shouldn't affect their flavor at all. They're beautiful enough to replace your standard Jack-O-Lantern Pumpkin, and delicious enough to roast into your next pumpkin pie filling.	1	count	14.99	1.5	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/cQLSIgzOS6C4ci5dWdtK_20161027-CinderellaPumpkinTrio_MG_5377.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	235	\N	\N	\N
131	Organic Cardoons with Greens	The leaf stalks of the Cardoon plant have an artichoke-like flavor. They are in the thistle family, like sunchokes, sunflowers and artichokes.  They need to be cooked before being eaten, or they are very bitter.  To cook cardoons, take off any leaves with a peeler, as these tend to be too fibrous.  In order to prevent discoloration, place them in acidulated water, They can then be braised or boiled into a stew. In New Orleans, they're frequently battered and deep fried. Larger stalks can sometimes take up to an hour to soften, but the wait is well worth your while when you can add that artichoke-y sweetness to any dish.	1	lb	2.99	2.99	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/fP90d9iUQzWiK9ZL6oDE_FK1A1770.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
132	Organic Fava Greens	An essential part of many farms' cover-cropping program, and the bearing of some of springtime's most delicious fresh beans, the Fava plant also has velvety soft leaves that boast a sweet, nutty and earthy flavor. Use them raw in a salad with a grassy olive oil, or throw them on top of a pizza. Fava Greens are a springtime treat that you won't want to miss out on!	0.25	lb	2.99	11.96	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/TdnF184zSvOFQ0NIIdlL_fava_leaves.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
133	Organic Baby Red Kuri Squash Duo	These mini squashes from Pie Ranch are the perfect size squashes for stuffing! Red Kuri Squash has a bright red flesh that is slightly nutty and a little bit sweet.This mellow squash is great with butter and herbs.	2	count	3.99	2.0	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/kmkBpN5xT2y7XLiiUKOU_unspecified-9.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	346	\N	\N	\N
134	Organic Carnival Squash Duo	Festive and decorative, this variety of squash will color your home until you bake it off. The flesh has a sweet, nutty flavor, and is a great size for stuffing.	2	count	3.99	2.0	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/HlzeaqGVRtmy04P14tNr_pESmL06ZQPyH5AR0DNO4_squash_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	346	\N	\N	\N
135	Organic Lunch-Box Peppers	Our Organic Lunch-Box Peppers are the perfect sweet pepper for any purpose.Use them as their namesake in your lunch as a fresh, crunchy snack, or sauté them. Blend them into a tomato - pepper soup or reduce that down to an unforgettable pasta sauce.If you really want to get creative, bake and stuff them with your choice selection of rice, egg, meat and seasoning for a fantastic international dish you'll remember.	1	lb	5.99	5.99	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/iQvSgdWRIWQH8MgupyjS_20160803-Eatwell_LunchboxPeppers_MG_7090.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	287	\N	\N	\N
136	Organic Roma Tomatoes	Roma Tomatoes are a classic sauce tomato. Small, fleshy, and packed with flavor, stew these tomatoes down with garlic and basil for pasta sauce or dice them to use for topping off a salad. They are sweet and tart with a little more umami flavor than a slicing tomato.	1	lb	2.99	2.99	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/qTBpflQ8RiOCX44LKsmS_unspecified-4.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	380	\N	\N	\N
137	Organic Serrano Pepper Trio	Hot Peppers! Perfect for salsa and great in Thai food.	3	count	0.99	0.99	oz	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/u5ZaAEOQTmyZJuDlaZLq_peppers_serrano%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	287	\N	\N	\N
138	Organic Padron Peppers	Padron Peppers are a Spanish appetizer that took hold in our part of the globe over the past ten years. They're a crowd-pleaser with the easiest preparation: simply sauté on high heat in a well-oiled pan until the skin is blistered. Salt, serve, and dig in!	0.5	lb	4.99	9.98	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/rjGimZzjQKgjs9UD6KSW_20160726-FullBelly_Padron_1-2pd_MG_5819%20%283%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	287	\N	\N	\N
139	Organic Jalapeño Peppers	Jalapeños are your classic peppers for chiles rellenos, with their thick, sturdy walls, rich flavor, and mild-to-medium kick. They can also be added to a mix of fajita veggies for a bit of spice!	3	count	0.79	6.32	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/bb06giIZRS6lFPxhbXBy_peppers_jalepenos.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	287	\N	\N	\N
140	Organic Carmen Italian Frying Peppers	Widely considered one of the best flavored peppers on the market, these Carmens are sweet and robust.	1	lb	5.99	5.99	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/5gGNcqFSDCeUsZFoy3rb_peppers_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	287	\N	\N	\N
141	Organic Cayenne Peppers	These gorgeous, long and ethereal looking peppers should not be passed by. Hang to dry and color your kitchen, or mince while fresh to enhance any dish calling for cayenne.	4	oz	2.99	0.75	oz	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/6CI5QhfnSaOxBBlowvZQ_x6yurmJhLN73fxEVZAwgWKpY6U5VnFn1RXohFV0uSAE.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	287	\N	\N	\N
142	Organic Padron Peppers	Impress the whole party with enough of this salty, savory, sometimes spicy appetizer for dozens of guests or a few very hungry padron fans!Padron Peppers are a Spanish appetizer that took hold in our part of the globe over the past ten years. They're a crowd-pleaser with the easiest preparation: simply sauté on high heat in a well-oiled pan until the skin is blistered. Salt, serve, and dig in!	2	lb	14.99	7.5	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/s665tI8SSgGgVLyDOG00_20160726-FullBelly_Padron_2pd_MG_5827%20%282%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	287	\N	\N	\N
143	Organic Purple Bell Peppers	Add some beautiful color to your next green salad or complete the rainbow in your next fajita mix with these Organic Purple Bell Peppers! They're refreshingly sweet, crunchy and juicy.	1	lb	4.99	4.99	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/vBel6SJRQvWOBbnDxIfz_bell_pepper_purple.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	287	\N	\N	\N
144	Organic Green Bell Peppers	Deliciously crunchy with a just a touch of sweetness, these Organic Green Bell Peppers are perfect for stir-fries, fajita veggies or sliced raw into a salad.	1	lb	2.99	2.99	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/OyGTUbBuTrSEnfbnkD77_20160629-Lakeside_PepperDuo_MG_3980-2%20%28ad084adf5901d75c4583aacd4c4ffed01a345fb8%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	287	\N	\N	\N
145	Organic Jimmy Nardello Peppers	Delightful fresh or fried, this pepper is one of the sweetest peppers there is. These pepper are a vibrant red when fully ripe and are as beautiful as they are delicious. This Italian heirloom that was preserved by the Nardello family after immigrating to the United States in 1887.	1	lb	7.99	7.99	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/KtKX5WKHR6eHb25fTZ4H_unspecified-5.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	287	\N	\N	\N
146	Organic Red Bell peppers	Perfect for chopping raw into salads or charred into your next fajita mix, these Red Bell Peppers are the most mature and sweetest of the Bell Peppers.	1	lb	4.99	4.99	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/CGNBzU62RgmW8A9XvV5g_redbellpeppers.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	287	\N	\N	\N
147	Organic Fresh Cayenne Peppers	Hang and dry these bunches of Fresh Cayenne Peppers to enjoy a spicy kick through the colder months. While most of the hot peppers will be coming out of Mexico for the off-season, you'll be able to enjoy the local flavor of the Capay Valley one pepper at a time. Hang upside down in a windowsill with plenty of ventilation to dry.	1	bunch	7.99	15.98	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/3MZR8398Q4ibnDcYLC4p_20161006-FullBelly_CayennePeppers_MG_3121.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	287	\N	\N	\N
148	Organic Green Bell Peppers	Harvested when the peppers are on the less mature side to maintain that tangy peppery flavor without being too sweet, these Green Bells are delicious on the grill, flash-fried in a fajita mix, or sliced raw into a salad.	1	lb	4.99	4.99	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/yWNDVVrOR3azjQB8Pvct_20160629-Lakeside_PepperDuo_MG_3980-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	287	\N	\N	\N
149	Baby French Breakfast Radishes	Martin picks his French Breakfast Radishes small, so they're all sweet, without the bitterness often associated with overgrown radishes. Chefs love working with radishes this small for their tenderness and sweetness.Try them thinly sliced on a piece of toast with butter, salt and pepper.	1	bunch	2.49	9.96	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/u0VPQInuSueaWy6VZek2_radish_breakfast_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	319	\N	\N	\N
150	Organic Jerusalem Artichoke	Great for gratins, mashes and roasted vegetable medleys, Jerusalem Artichokes (aka Sunchokes) are a deliciously sweet tuber of a plant in the sunflower family.  They have a sweetness reminiscent of artichokes, with a texture closer to that of a potato, but a bit less starchy.	1	lb	5.99	5.99	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/mgCclCTTVKbTsicPzQrQ_sunchoke_04.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	212	\N	\N	\N
152	Watermelon Radishes	With its gorgeous neon pink interior and its mild kick, these gorgeous fall radishes will brighten up any salad. For a new adventure with these beautiful roots, try roasting them with a bit of salt and olive oil, along with turnips, rutabagas and other root veggies.	1	lb	4.99	4.99	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/BmxgRHfFQYaxAYrLq3tE_radish_watermelon_03%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	319	\N	\N	\N
153	Organic Purple Top Turnips	Riverdog Farm's Purple Top Turnips are crunchy, creamy, and ever-so-slightly bitter. They are high in Vitamins B6 and C, as well as folate, iron, potassium and calcium. They are considered a "blood builder" (promote red blood cell growth) as well as a blood detoxifier, and are a potent ally when fighting a cough or relieving a sore throat. Try mashing some in with your potatoes or roasted under a chicken. 	1	lb	3.99	3.99	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/M0wDAEASmyI7th49Dm3w_RC5GNwzQTOSYjW3dyDli_Turnip-Purple-Top.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	272	\N	\N	\N
154	Organic Hukurei Tokyo Turnips	Fresh, juicy and never woody, Tokyo Turnips are as delicious raw as they are roasted. Try them shaved into your next salad.	1	bunch	2.99	3.99	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/UZz9ZgqTnOHYsY7urFMa_unspecified-14.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	272	\N	\N	\N
155	Organic Loose Scarlet Queen Turnips	These vibrant and beautiful turnips can be boiled, roasted, steamed, or eaten raw. Their flavor is among the freshest of all root veggies, as they're a little sweet, and somehow very light on the palette. Mash some up with other roots for a bit of a kick, slice them up and put them on your salad for some extra zip, roast them along side your root medley and they won't disappoint.	1	lb	2.79	2.79	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/M9N7zadoQfKr3JU5imlw_turnips_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	272	\N	\N	\N
156	Organic Black Spanish Radish	These black radishes have a white interior and a spicy taste. Slice thin for a green salad, thicker pieces in a cold, prepared salad or snack on them raw with with a pinch of salt.	1	lb	3.79	3.79	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/5imUZsvtRCO1Y4Yt7Tra_9EsatC25Tkyrve1rJey6_Radishes-Black.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	319	\N	\N	\N
157	Organic Kongo Kohlrabi	Green kohrabi is an old-world, versatile vegetable in the broccoli/cabbage family.  It's crisp white root can be enjoyed raw or roasted, while it's leaves can be braised or cooked like cabbage or tender collard greens.  It's broccoli-like flavor is nutty and slightly sweet. Kohlrabi wins the Most Alien Vegetable prize!	1	bunch	3.79	\N	\N	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/pqTGvIv9RnAiNwIZkCCc_kohlrabi_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	385	\N	\N	\N
158	Organic Black Spanish Radishes	Crunchy with a pungently spicy skin, these Organic Black Spanish Radishes are as delicious as they are beautiful.	1	lb	3.99	3.99	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/4MoBkdszR2Ul3GdoChDK_Radishes-Black_cut.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	319	\N	\N	\N
159	Organic Sugar Pie Pumpkin	These little sugar babies from Live Earth Farm are the perfect size for a family meal! Try them roasted and then baked into pies or whizzed into creamy, dreamy pumpkin soups. Tis the season!	1	count	2.99	1.5	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/65uF2A4iTIS3wwxg9JbZ_hdXkIBhVT9eSMkfwjZhg_BiabuV2oKAQZEl2q22YnNnbQTJQ0KDHTnwT6pqZnleQ.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	235	\N	\N	\N
160	Organic Celery Root with Tops	Don't be fooled by the gnarly attached to this fledgling celery plant: its flavor is anything but! With the delicious sweetness and slight salinity of a celery stalk, but a texture closer to a not-too-starchy potato, Celery Root (aka Celeriac) is a great vegetable for soups, mashes or roasting medleys.	1	head	2.29	2.86	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/aIVFp2PwRuWtVWnAqWIV_celeriac%202%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	226	\N	\N	\N
161	Piracicaba Broccoli	This broccoli has beautiful, nearly open florets and long, tender and entirely stems. Quick sauté with a little garlic, olive oil and red pepper flakes for a sweet, delicious addition to any meal.	0.4	lb	3.49	8.73	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/aZKXH2rpQVuYjQBZwEyv_17m_IhG0Ny-vZk_O8svvIvu8lpcKy6FryUB2d2X8f8Y.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	298	\N	\N	\N
162	Organic Large Cauliflower	This beautiful Brassica can be roasted or added to any stir-fry.  Lakeside Organics grows these large cauliflower heads down in Watsonville, CA.	1	head	5.99	2.4	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/fpp8dkzSPiJ6S8PIut8Q_cauliflower_01%20copy.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	290	\N	\N	\N
163	Organic White Cloud Cauliflower	Deliciously sweet and beautiful White Cauliflower. Roast it, mash it, fry it!	1	count	4.99	3.33	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/xcDxGwa7TgyX5VWijQKU_cauliflower_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	290	\N	\N	\N
164	Organic Rapini	This bitter green, also known as broccoli raab, is classically prepared in a quick sauté with garlic, olive oil, red pepper flakes and salt. It makes a fantastic post-bake pizza topping!	1	bunch	2.99	\N	\N	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/ka430sSG2WzbZtIQowMs_broccoli_raab_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	403	\N	\N	\N
165	Organic Happy Rich Broccolini	Happy Rich Broccolini is the tender, juicy-stemmed, sweet side shoots that grow off the broccoli plant. Enjoy this flavorful vegetable in a variety of ways -- sauteed in olive oil and garlic, it is the perfect addition to pasta and rice-based dishes, or as a side to compliment a steak or filet. Delivered in a 1 lb quantity.	1	lb	4.99	\N	\N	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/AOby9hy1QziZGjVaJE5e_oDuiNd57QmiyRFAATJdD_live_earth_broccoli%20rabe_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	298	\N	\N	\N
166	Organic Broccolini Trio	When none of the farms we source from directly have Baby Broccoli, we rely on our trusted distributors--like Earl's Organic Produce--to source the highest quality Cailifornia-grown Organic Baby Broccoli around. This week's Baby Broccoli is grown by Josie's Organics.	3	bunch	4.99	3.99	lb	Produce	Vegetables	http://goodeggs1.imgix.net/product_photos/cgPz5cLtQ6SyA3OjTIxU_broctriosave250.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	298	\N	\N	\N
167	Organic Broccoli Di Ciccio	This heirloom Italian variety of Broccoli is perfectly suited for a high heat pan and a pinch of oil. The florets and leaves may get a bit of brown on them, which gives it all the flavor! Di Ciccio is especially delicious on top of a pizza!	0.5	lb	4.99	9.98	lb	Produce	Vegetables	http://goodeggs2.imgix.net/product_photos/X2Ljan4TPioUhF7xcyeC_20160620-DiCiccio_3-4pd_MG_3117.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	298	\N	\N	\N
168	Organic Baby Dino Kale	Dino Kale, Lacinato Kale, Tuscan Kale, Cavolo Nero or Blue Kale: whatever you call it, we call it delicious! These tiny leaves are harvested from very young plants, so they are extra tender and sweet. They will cook much more quickly than large kales and are also delicious raw!	0.5	lb	3.99	7.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/iwYQyKlTSsKpWTfXt2Ix_q5LaXlxKkCJ3Ef_FSIXriiBv2B4OkXRqAkh_xZFk3pU.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	206	\N	\N	\N
169	Organic Bunched Spinach	Full Belly Spinach has a deep green color and a springy, crisp texture that makes it perfect for a fresh salad or sandwich topping.  It has a sweet flavor that melts in your mouth! Not to mention, its hearty leaves holds up in most recipes that call for spinach—from soups and dips to lasagnas and quiches!	1	bunch	2.99	5.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/fxtIjG8eTAKIBplXMih9_Spinach.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	307	\N	\N	\N
170	Organic Baby Spinach	Baby spinach is an incredibly versatile staple: throw it in your smoothies, omelettes, salads or pasta dishes.	0.5	lb	3.99	7.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/j8lRB0U1Q8WYMzAdga9D_VrIxsV9UiPLYp_spJWYMbrvbY51u1T9voTSQ3To3uFg.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	307	\N	\N	\N
171	Organic Spinach	With a deeper flavor than the more ubiquitous Baby Spinach, these hearty bunches feature larger leaves and more sizable stems that can withstand a quick sauté without losing texture.	1	bunch	2.49	4.98	lb	Produce	Greens	http://goodeggs1.imgix.net/product_photos/cfaYKd4QhCEMTmrkPc3E_Riverdog_Bunched%2BSpinach.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	307	\N	\N	\N
172	Organic Green Curly Kale	Tender and sweeter than the more common Lacinato Kale, Green Curly Kale can be made into the perfect raw salad. Massage with olive oil and salt and top with a bit of lemon. Add some slivered almonds and a mild goat cheese, and enjoy!	1	bunch	2.49	4.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/NJMDJiAGQcG3N89IVClJ_Ouroboros_Aquaponic_Green_Curly_Kale.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	206	\N	\N	\N
173	Organic Mixed Baby Kale	The Knolls are at it again with another one of their delicious greens: this time, it's a mix of baby kales! Exact varieties may vary week to week, but they'll always be delicious!	0.5	lb	4.99	9.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/sJYoL7AeRIh70eYMB2bw_kale_baby_mix_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	206	\N	\N	\N
174	Organic Red Russian Kale	The tender leaves of this Red Russian Kale are sweet and nutritious.	1	bunch	2.79	\N	\N	Produce	Greens	http://goodeggs1.imgix.net/product_photos/lNZVLEcSl6aZlVGab1hA_JD0s-JmzIa_rQVwzRVb9AEXaPsZIh9F_7AsJSSAc-Cs.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	206	\N	\N	\N
175	Organic Lacinato Kale	Fun fact:Lacinato Kale is also known as Tuscan kale, Tuscan cabbage, Italian kale, Dinosaur kale, Cavolo Nero, black kale, flat back cabbage, palm tree kale, or black Tuscan palm.	1	bunch	2.49	4.15	lb	Produce	Greens	http://goodeggs1.imgix.net/product_photos/7yTwiLNYTfSMJppKJl6K_kale_05.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	206	\N	\N	\N
176	Organic Juicing Lacinato Kale	Too small to bunch, slightly sunburnt, a small hole or tear: there are many reasons Lacinato Kale might end up getting tossed instead of sold on the retail shelf. We're happy to partner with Alba Organics to find a happy home for these perfectly delicious loose leaves of Lacinato Kale. They're great for juicing, making chips, or even sautéing!	0.5	lb	1.79	3.58	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/UKof4UH9T4GuYrJGkIQg_Kale_dino_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	206	\N	\N	\N
177	Organic Lacinato Kale	Lacinato kale has been cultivated for centuries and is a true staple of our kitchens. Also known as dinosaur kale, Italian kale, or cavolo nero, its earthy and slightly bittersweet flavor lends itself perfectly to salads, sautés, soups, casseroles, gratins, and smoothies. Try pairing it with a salty, strong cheese like parmigiano or manchego and a sweet dried fruit for a delicious and nutritious salad that deserves a place on the Thanksgiving table.	1	bunch	2.29	4.58	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/zmmRZRRPQRWzOJF9pwZb_kale_lacinato_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	206	\N	\N	\N
178	Organic Lacinato Kale Trio	Lacinato Kale has been cultivated for centuries and is a true staple of our kitchens. Also known as dinosaur kale, Italian kale, or cavolo nero, its earthy and slightly bittersweet flavor lends itself perfectly to salads, sautés, soups, casseroles, gratins, and smoothies. Try pairing it with a salty, strong cheese like parmigiano or manchego and a sweet dried fruit for a delicious and nutritious salad that deserves a place on the Thanksgiving table.	1	bunch	4.99	9.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/Pb07Yl4oS5y2Uof7fOb7_20160607-Lacinato_KaleTrio_MG_1384%20Save1.jpeg?w=380&h=238&fm=jpg&q=41&fit=crop	206	\N	\N	\N
179	Organic Rainbow Chard	As tasty as it is colorful, Rainbow Chard  has a balanced, slightly savory flavor. Try pickling the stems for a delightful, beautiful snack.	1	bunch	2.99	5.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/ZXZwEw3uRCWQXar7L4on_CPk4j0uNlyfgouMO2QZvofrY6CxPgAd3TQJLZpHihEg.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	395	\N	\N	\N
180	Organic Baby Bok Choy	Sweet, tender and crunchy, Lakeside's beautiful Baby Bok Choy can be the main ingredient in your next stir-fry. Chop up the stem coarsely and throw it in a hot pan 60 seconds before the leaves, then remove from heat before any of the Bok Choy gets too soft. Pairs well with soy sauce and garlic.	1	lb	2.99	2.99	lb	Produce	Greens	http://goodeggs1.imgix.net/product_photos/UcIoK9IDTJqkwU6AYsps_bokchoy_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	314	\N	\N	\N
181	Organic Baby Rainbow Chard	Baby Mixed chard is the younger leaves of the chard plant. The younger shoots are more delicate and sweet than the mature versions which makes this mix great for adding to a salad or lightly sauteing.	0.5	lb	3.99	7.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/vIJi0XDSSH2HLVqGashN_wywVnMioQdii2c4n87w1_mixed_chard_04.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	395	\N	\N	\N
182	Organic Green Cabbage	Sweet and crunchy cabbage adds texture to any dish. It's great raw or cooked!	1	count	2.49	1.25	lb	Produce	Greens	http://goodeggs1.imgix.net/product_photos/xCKqivZBTWmPWWFJr88C_unspecified-5.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	327	\N	\N	\N
183	Organic Red Jewel Cabbage	Long lasting, sweet, and versatile, Red Cabbage is a fantastic investment in your future fish tacos, cole slaws, or kraut.	1	head	3.49	1.99	lb	Produce	Greens	http://goodeggs1.imgix.net/product_photos/wMAbyRJRTgmfllFKEV2d_IMG_0880.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	327	\N	\N	\N
184	Organic Collard Greens	Beautiful organic Collard Greens from Full Belly Farm. The collard plant produces large, dark-colored, edible leaves. These greens are high in vitamin C and soluble fiber, and contain multiple nutrients with potent anticancer properties! Collards are closely related to cabbage and broccoli. We like to pair them with fresh black eyed peas!	1	bunch	2.29	4.58	lb	Produce	Greens	http://goodeggs1.imgix.net/product_photos/UwD66Yw7RcCPMSWWuKzw_Collards.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
186	Organic Mizuna Greens	Mizuna is a Japanese mustard green with thin, delicate leaves. It has a very mild radish flavor and is often used in salad mixes or with many Japanese dishes such as sashimi or in soups.  It's best used raw or very lightly cooked.Mizuna is high in vitamins C, A, K, Calcium and Fiber.100g of Mizuna contains: 70 mg of vitamin C (100% dv)151 mcg vitamin A (30% dv)257 mcg vitmain K (200%)1790 mcg beta carotene115 mg Calcium (14% dv)3.2g fiber	1	bunch	3.49	11.63	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/0LLZF5ijSl6jsol1ifJi_Hikari_Mizuna_Tender_Bunch.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
187	Savoy Cabbage	Savoy cabbage is tender and sweet, perfect for a quick stir-fry or in an Asian-inspired slaw. It's also great for salads or vegetable wraps.	1	count	5.29	1.51	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/X0DpUjdQVS3feHfqBonN_4y-NsCExYvuI185hV-3MEB2rL7XC1vkNnxXuXEN5zPs.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	327	\N	\N	\N
188	Bull's Blood Beet Greens	Bull's Blood Beet Greens are beautiful, red greens that can be used fresh or cooked down. They have a naturally sweet-tangy and savory flavor that set them apart from other braising greens.	0.5	lb	3.99	7.98	lb	Produce	Greens	http://goodeggs1.imgix.net/product_photos/BnYYRfxlSGCPjlUS67cj_Screen%20Shot%202016-10-27%20at%207.46.17%20PM.png?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
189	Organic Pea Greens	These early season Pea Greens are sweet and tender.  They taste just like the pods or peas themselves, but a bit grassier. Sauté them quickly with some Green Garlic and Spring Onions and salt to taste.  Pea Greens are also delicious coarsely chopped into a raw salad.From time to time, Rick Knoll will harvest his Pea Greens in their flowering stage, and you can occasionally see baby peas just beginning to form from the edible flower!	0.5	lb	4.99	9.98	lb	Produce	Greens	http://goodeggs1.imgix.net/product_photos/yyWdodrTRPuGvaXupQfx_Knoll_Farms_Flowering_Pea_Greens_Half_Pound.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
190	Organic Komatsuna Greens	These amazingly tender Japanese mustard greens have a spinach-y taste with a mild radish-y kick.  It can be eaten raw or cooked.  It's great for stir-fries--garlic and shiitake mushrooms go amazingly well with Komatsuna--or hotpot dishes. They were greenhouse grown, giving them a light flavor and a delicate texture.They're high in vitamins C, A, K, Calcium and Fiber.100g of Komtsuna contains: 130mg of vitamin C (162% dv)495mcg vitamin A (61% dv)210mg Calcium (21% dv)2.8g fiber	1	bunch	3.49	6.98	lb	Produce	Greens	http://goodeggs1.imgix.net/product_photos/fzNtDId1SqmUAAaxUCsP_Hikari_Komatsuna_Tender_Bunch.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
191	Organic Napa Cabbage	Napa Cabbage is sweeter and more tender than its waxier, rounder cousins. It's great for raw applications or for making kimchi.	1	count	1.99	1.99	lb	Produce	Greens	http://goodeggs1.imgix.net/product_photos/SDUq2pCmQJyDpEj0dkIM_cabbage_napa_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	327	\N	\N	\N
192	Stinging Nettles	Nettles grow like a weed, and are often discarded as such, but can be used as the base of pesto, as an addition to a hearty marinara sauce, or in soups and stews. Their flavor is similar to spinach, but with an earthier or nuttier tone.Do not eat Nettles raw or handle them bare-handed! Nettle leaves and stems have tons of stinging hairs (trichomes), whose tips act as needles when touched, injecting natural compounds that can cause painful stings. Nettles must be soaked in water or cooked to remove the chemicals from the plant, allowing them to be handled and eaten without risk of stinging.Nettles are rich in vitamins A and C, iron, potassium, manganese, and calcium. Nettles can also be composed of up to 25% protein by dry weight, which is very high for a leafy green.	0.25	lb	2.99	11.96	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/8zRKeuVpQx2xEBjOXPdw_nettles_01%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	325	\N	\N	\N
193	Organic Spigariello Riccia	Spigariello is an heirloom broccoli plant with sweet and tender leaves.  Riccia is a curly-leafed Italian Spigariello variety that has it all: the classic sweetness of a winter-grown Brassica, a slight mustardy kick, reminiscent of Broccoli Raab, a substantial stem that's crunchy, not woody, and all that manifested in a beautifully serrated dark green leaf.  Move over, Kale, Spigariello's here.To cook Spigariello, start by adding shallots and garlic or any other allium to a cast iron with high heat oil.  Chop up the stems first and throw them into the pan once the shallots and garlic have begun to sweat a bit. After two minutes, add the leaves, coarsely chopped.  Shake the pan around to make sure the shallots don't burn, then remove from heat after 3-4 minutes, before the greens are full cooked.  They'll continue to wilt and become more tender after.  Season to taste, and add some red pepper flakes for an extra kick or some raisins or dried cranberries to bring out the Spigariello's natural sweetness.	1	bunch	2.49	6.23	lb	Produce	Greens	http://goodeggs1.imgix.net/product_photos/J5MxlTmYQt6XJDc19ZoI_GoodEggs027644.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	252	\N	\N	\N
195	Organic Belgian Endive	"EN-dive," "on-DEEV," no matter how you pronounce it, this crunchy, sweet veggie is perfect for boats, or sliced into salads.Belgian Endive is part of the chicory family, along with Radicchio, Frisée, Escarole, and Dandelion Greens, but because their secondary growth period happens indoors, without any light, they have only a very mild amount of the characteristic bitterness of that family.	0.5	lb	3.99	7.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/oDyfJ6LLQc2eQQlY3zHi_endive.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	239	\N	\N	\N
196	Organic Romaine Lettuce	Crisp Romaine Lettuce has sturdy leaves that are perfect for any salad, but are classicly used to make Caesar salads. This lettuce grows in tall heads with a firm rib down the center of each leaf. Unlike most lettuces, it can tolerate some heat. Try using the outside leaves for a loose salad and grill the romaine heart! Simply cut the romaine heart in half and brush with a herb vinaigrette, then throw it on the grill! It's delicious and versatile.	1	head	2.29	4.58	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/M8jiDnCvSjWComch9L6K_lettuce_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
198	Organic Watercress	A little peppery with a delightful tang, watercress is an awesome, versatile green. It makes a lively addition to any salad, or can be blended with potatoes, onions, and garlic into a light soup.	1	bunch	3.49	\N	\N	Produce	Greens	http://goodeggs1.imgix.net/product_photos/yjdRKBPUTy2UFnIRiP1w_watercress.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	394	\N	\N	\N
199	Aquaponic Watercress	Watercress is one of the oldest known leaf vegetables consumed by humans, noteworthy for its peppery, tangy, zesty flavor.Our watercress is quite spicy with an almost horseradish like flavor to it.  Watercress contains significant amounts of iron, calcium, iodine, and folic acid in addition to vitamins A and C.  Watercress is also a significant source of omega-3 fatty acids and antioxidants and is believed also to have antianglogenic cancer-suppressing properties	1	bunch	3.29	36.56	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/21RSYpmeR1C1POaMyhIJ_QJEzlqdmWapOia5j5VVK9J57GveI9yaVK1-yqtq6wmQ.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	394	\N	\N	\N
200	Baby Arugula	Martin grows some of the most delicious Arugula in the world. Because it's greenhouse-grown, it's delicate and tender, but it doesn't skimp on having a nice spice to it. Chefs at some of San Francisco's most renowned restaurants swear by Martin's Arugula, and once you try some, you'll swear by it, too.	0.5	lb	4.99	9.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/IfNzA1XISDiO3PlIVrRr_FK1A6779.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	323	\N	\N	\N
205	Aquaponic Deluxe Salad Fixings	All the delicious extras that turn Ouroboros' famous Aquaponic Salad Mix into their even more delicious Aquaponic Deluxe Salad Mix.The Deluxe Fixings are usually a mix of Ruby Streaks Mustard, Mizuna, Hearts of Fire, Watercress and Tatsoi.	4	oz	2.49	0.62	oz	Produce	Greens	http://goodeggs1.imgix.net/product_photos/okUhtetQLKN4op43eSoj_Ouroboros_Deluxe_Fixings.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	284	\N	\N	\N
206	Aquaponic Green Living Butter Lettuce	Butter lettuce is named for its smooth buttery texture and delicate flavors.  Excellent as a stand alone salad or mixed with other types to create a variety of textures, flavors and colors.  Our lettuce comes with the roots still attached for maximum freshness and flavor!By buying our Green Butterhead, you just saved 7+ gallons of water compared to similar lettuce grown in soil.	1	head	2.99	8.54	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/DoDBnwzZTOmPM8566fxQ_20161013-Ourboros_GreenButterhead_MG_3652.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
207	Aquaponic Red Living Butter Lettuce	Butter lettuce is named for its smooth buttery texture and delicate flavors.  Excellent as a stand alone salad or mixed with other types to create a variety of textures, flavors and colors.  Our lettuce comes with the roots still attached for maximum freshness and flavor!By buying our Red Butterhead Lettuce, you just saved 7+ gallons of water compared to similar lettuce grown in soil.	1	head	2.99	8.54	lb	Produce	Greens	http://goodeggs1.imgix.net/product_photos/imN9lTSvqizVYMvSupg8_20161013-Ourborous_RedButterhead_MG_3649.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
208	Organic Red Butter Lettuce	Smooth with a toothsomeness not present in crisper lettuces, Butter Lettuces should be dressed directly before consuming.This Red Butter Lettuce is coming from Blue Heron Farm in Fallbrook, CA.	1	count	1.99	3.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/BfbVNOJQuCN5lCtQIdhx_lettuce_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
209	Aquaponic Living Baby Lettuce Trio	A trio of our freshest, most delicious baby head lettuces.  Baby lettuces add a tenderness and sweetness to any salad combination.  We include three different varieties to provide a mixture of flavors, textures and colors to make your salad mix exceptional!By buying out Baby Lettuce Trio, you just saved 12+ gallons of water compared to lettuce grown in soil!	3	head	4.19	\N	\N	Produce	Greens	http://goodeggs2.imgix.net/product_photos/AjFdA1XVSWaO8wZtxp3h_HaXtfUA7n5WWwosQm_qAvn9ttVRLPzoAjq2n6GoIzio.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
210	Organic Sorrel (Kid Spinach)	Sorrel goes by many names but the one that I like best is "kid spinach".  That's what I call it because it's one of the only green leaves that my kids will eat !!!  If your kids are finicky eaters, than sorrel will probably win them over with its lemony taste.It's great for adults also.  Sorrel can be used in soups to make a green borscht, in salads and stews or on a sandwich.  I love to use the leaves like a tortilla, filling them with a little refried beans, panela cheese or even a thin slice of jicama.  It's also awesome in pesto, as a straight substitute for basil.  I am sure you can come up with other uses as well. Each "bunch" weighs approximately a quarter-pound, so it is enough to keep you happy.   We hope that you'll try it and love it.	1	bunch	2.79	11.16	lb	Produce	Greens	http://goodeggs1.imgix.net/product_photos/kQWC7qsURWqN6CnoS50h_FK1A7646.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	307	\N	\N	\N
211	Organic Wasabi Arugula	Crisp, green leaves with the same wasabi flavor as in the Japanese condiment.  An intense peppery flavor as well as a a slight hint of arugula.  They come from the mustard family, along with broccoli, cabbage, radish and collard greens.They're high in vitamins C, A, Calcium and Iron.Wasabi Arugula is most popular eaten raw, as it loses its peppery taste when cooked.  It's often used as an accent in salads, with Ahi Tuna, or in sushi.  Add it to your favorite green salad--it's great paired with sweet, creamy dressings--or include in wraps or sandwiches. For a quick project and a special treat, substitute Wasabi Arugula for basil to make a peppery pesto.Enjoy!	1	count	4.99	1.81	oz	Produce	Greens	http://goodeggs1.imgix.net/product_photos/BXTCTsRpSmirW13DnSBg_Hikari_Wasabi_Arugula_Clamshell.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	323	\N	\N	\N
212	Arugula	Arugula adds a spicy kick\nto your salad or sandwich. Mix it with fava leaves, green garlic, and Meyer\nlemons for a great spring pesto.	1	bunch	2.99	\N	\N	Produce	Greens	http://goodeggs1.imgix.net/product_photos/ZwKJkVIqQMWdMyHnNSZZ_3t_9iGzvBox1ScvUOKZAMxvRu2PUoN2FC1Fjouqk0yI.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	323	\N	\N	\N
213	Organic Red-Ribbed Dandelion Greens	Red-Ribbed Dandelion greens are equally as pungent as the green variety with a slight peppery taste.  Pair with rich fatty foods (such as bacon or a flavorful cheese) or acid (meyer lemon or balsamic vinegar) to help ease the bitter taste.  Dandelion greens are rich in vitamins and minerals and are one of the most nutritious leafy greens that you can eat! Great for the liver!	1	bunch	3.49	\N	\N	Produce	Greens	http://goodeggs2.imgix.net/product_photos/eruDs8ifQT4mdQqufxWj_dandelion_red_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
214	Little Gem Lettuces	Martin's Little Gems are always crunchy and always sweet. Use as the base of your next salad, coarsely chopped or torn.	1	lb	6.99	6.99	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/6VFOE8pVThOllSEPBGOW_lettuce_little_gems_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
215	Organic Red Butter Lettuce	Butter Lettuces are just as their name suggests, like butter! Their soft cup shaped leaves have a buttery, velvety texture. They are loosely shaped, often resemble a flowering rose and will make a beautiful and tasty salad.	1	count	2.49	4.98	lb	Produce	Greens	http://goodeggs2.imgix.net/product_photos/d3kRoRdQsKjBO9wcNXuC_Lettuce_Red_Leaf.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
217	Organic Protein Crunch (Sprouted Mixed Beans)	Protein crunch is a mighty mix of germinated peas, lentils, adzuki and mung beans. Enjoy this protein-packed crunchy treat raw or cooked. USDA Certified OrganicAdd some protein to your salad Add to soupsRoast or pan fry (when lightly oiled)Substitute them for chickpeas in hummusFor more recipes and nutritional info please visit www.localgreensfarm.com	8	oz	4.99	0.62	oz	Produce	Greens	http://goodeggs2.imgix.net/product_photos/WPqmRJe6TjW6adxcM9FW_FK1A7465.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	310	\N	\N	\N
220	Organic Micro Broccoli	This is the really, really nutritious one and it tastes great! Top off a salad, soup, rice bowl, sandwich, or just eat em out of the container. Crunchy, fresh, and full of flavor.	2.5	oz	4.49	1.8	oz	Produce	Greens	http://goodeggs1.imgix.net/product_photos/6ANVIwotQNS9h0DI48wu_nEVAZCOBVtqfEa8kEpqgB8adHd7ho6jfrfFggAyluy4.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	298	\N	\N	\N
221	Organic Micro Arugula	Very Arugula!! Super packed with flavor and nutrition. Sprinkle our little greens on your salad, pasta just before you serve it, or try them on sandwiches and in wraps. From the USDA Agricultural Research Service: In general, microgreens contained considerably higher levels of vitamins and carotenoids—about five times greater—than their mature plant counterparts, .......http//en.wikipedia.org/wiki/Micro_greens 	2.5	oz	4.49	1.8	oz	Produce	Greens	http://goodeggs1.imgix.net/product_photos/gb8VcfESt6uxDZhPgkya_AhBdUmeQyVzkhsC_4BPN0lfPTTd2v78g_nrkYjEFpnk.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	323	\N	\N	\N
222	Organic Baby Radish Greens	Baby Radish Greens (aka Kaiware, or daikon sprouts), are great tasting, versatile and super nutritious for you.  They are an excellent base for your salad, added to a soup, put onto a sandwich or as a garnish for tacos.  They are a must for sushi.  These little guys add a great spicy kick to whatever they are accompanying.   For some people, eating them raw is a little too intense.  In that case, or for a change of pace, they can  also be lightly cooked in a soup or saute and this will mellow out the flavor and spice considerably.Kaiware has been studied recently in Japan for its ability to fight cancer and results have been very promising.  One study called kaiware "a naturally multipotent chemopreventive agent".We hope you'll try it for yourself.... I don't think that you'll be disappointed.	2	oz	2.99	1.5	oz	Produce	Greens	http://goodeggs1.imgix.net/product_photos/4bkIRv0gS8ywJq7uCEMv_Baby%20Radish%20Greens%202oz%20Green%20Skies%20Vertical.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	319	\N	\N	\N
223	Organic Micro Kale	Local Greens' Micro Kale  it's USDA Certified Organic and hydroponically-grown.USDA Certified OrganicHydroponically-grown in Berkeley, CAGrown using 1 cup of waterPerfect for adding to a green salad mix or for topping eggs, soups or any other dishFor more recipes and nutritional info please visit www.localgreensfarm.com	2	oz	4.99	2.5	oz	Produce	Greens	http://goodeggs2.imgix.net/product_photos/LUVw8K7wSLeR6YfrAoVF_FK1A7508.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	206	\N	\N	\N
225	Organic Sunflower Greens (4oz)	Nutty Sunflower Greens are perfect for salads, green smoothies, wraps, or sandwiches. Sunflower seed flavor in a crunchy green. \n\n\n\n\n\n\n\nNutritional info:\nVitamins A, B, C and E\nCalcium, Chlorophyll, Iron, Magnesium, Niacin, Phosphorus, Potassium\nAmino Acids\nProtein: 20-25%	4	oz	3.99	1.0	oz	Produce	Greens	http://goodeggs1.imgix.net/product_photos/og0Jo9faS5uUFlGjEdLh_Broccoli%20%20IMG_7566.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	254	\N	\N	\N
226	Organic Salading	Local Greens' Salading is combination of three of their best products: Pea Shoots, Protein Crunch (a mighty mix of germinated peas, lentils, adzuki and mung beans) and Sunflower Shoots. It's USDA Certified Organic and hydroponically-grown.USDA Certified OrganicHydroponically-grown in Berkeley, CAGrown using 1 cup of waterPerfect for an on-the-go salad, or to add to a green salad mix.For more recipes and nutritional info please visit www.localgreensfarm.com	4	oz	4.99	1.25	oz	Produce	Greens	http://goodeggs2.imgix.net/product_photos/hkHFkwN9RlckG5cQiZV7_FK1A7524.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	331	\N	\N	\N
228	Organic Germinated Peas	Sprouted Peas are just newly germinated, nutritionally-dense peas.  Enjoy this protein-packed crunchy treat raw or cooked. USDA Certified OrganicAdd some protein to your salad Add to soupsRoast or pan fry (when lightly oiled)Substitute them for chickpeas in hummusFor more recipes and nutritional info please visit www.localgreensfarm.com	9	oz	4.99	0.55	oz	Produce	Greens	http://goodeggs2.imgix.net/product_photos/RvvZbq0FQmGbc9X07cro_20160429-LocalGreeen_GerminatedPeas_MG_8501.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	388	\N	\N	\N
229	Organic Super Salad	Enjoy this mighty mix of Organic baby radish greens, baby kale and sorrel.  The super salad has a base of baby radish greens topped with a touch of sorrel and kale to make it the perfect salad mix.  The radish greens are zesty, but mellow out when eaten with an oil based dressing.Upon harvest, our super salad is packed into a plastic bag and refrigerated. We don't rinse the salad before packaging because it stays fresher that way. Please rinse before enjoying.	9	oz	8.75	0.97	oz	Produce	Greens	http://goodeggs2.imgix.net/product_photos/oNdaGRrRTbCJhigJRnhv_522e24663d92f70200000134_standard.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	331	\N	\N	\N
231	Organic Crimini Mushrooms	The classic Crimini is widely versatile, as many dishes can benefit from their rich, meaty, and earthy flavors. A quickly sauté with butter, garlic, and your favorite herb always amounts to a tasty starter, or add a few to your next late night grilled cheese, vegetarian nut roast, or lasagna.	8	oz	2.99	5.98	lb	Produce	Mushrooms	http://goodeggs2.imgix.net/product_photos/e4LG13KjSfWv1IkxjbW3_r8dVolYMQAu1nt8clGF9_s9gy2ycTTsCfDYLiJ77d_z6_ky29DCzM-yRUzrxvFEsY6lkSI7-uK4UFifIJd4vk.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	342	\N	\N	\N
232	Fresh Organic Shiitake Mushrooms	Shiitake is also known as "black mushroom" of Oriental cuisine.  They are full-bodied with a meaty texture and distinctively woodsy flavor. They are one of the most versatile mushrooms for a novice of exotic mushrooms and high in both protein and vitamin D.	6	oz	5.79	15.44	lb	Produce	Mushrooms	http://goodeggs1.imgix.net/product_photos/dNIfB5RoRyerIt9qJMzl_FK1A4406.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	342	\N	\N	\N
233	Organic White Button Mushrooms	White Mushrooms are the same species as Criminis, but younger, resulting in a closed cap and a meatier texture. They have a clean, fresh flavor that makes them great candidates for eating raw.	8	oz	2.79	5.58	lb	Produce	Mushrooms	http://goodeggs2.imgix.net/product_photos/LqZVvgoTtKUcNuKgPxLW_p9MJXXLkQTWA6S00j2DR_jmseGhEy-tm8FssZRSiV8qOROVghhW2GtLBBhrC9MMg.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	342	\N	\N	\N
234	Fresh Organic Exotic Mix Mushrooms	Throughout our daily harvest, we hand pick the finest mushrooms from our largest crops and place them in this clamshell.  Shiitake, Tree Oyster, King Trumpet, Lions Mane, Maitake, Yellow Oyster, Pink Oyster, Nameko and Pioppini may be found in this versatile pack.  If you’re looking for a pleasant surprise or a unique mix for your soup, sauté, stir-fry or risotto, check out this mystery box and enjoy	6	oz	6.99	18.64	lb	Produce	Mushrooms	http://goodeggs1.imgix.net/product_photos/kNpandRKTg6sVKZlul02_FK1A7434.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	342	\N	\N	\N
235	Organic Garnet Sweet Potatoes (Bulk)	The classic Garnet sweet potato has deep burgundy skin and bright orange flesh. Starchy and sweet, they are high in healthy complex carbohydrates, beta carotene, and vitamins. Whether your family likes their sweet potatoes baked, fried, as raw "noodles," in a gratin, a casserole, or a pie, they're a great choice for holiday and every day. This 3 lb bulk bag should be enough potatoes to go around the table!	3	lb	14.99	5.0	lb	Produce	Mushrooms	http://goodeggs1.imgix.net/product_photos/jKxJOXqcQpmmHffGHUwK_20161104-MediumGarnetSweet_3pd_MG_6229.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	255	\N	\N	\N
237	Organic Portabella Mushroom Duo	Did you know that the Portabella Mushroom is just a Crimini Mushroom that's been given a few more days to grow?  It's got a somewhat earthier flavor and a much meatier texture. Enjoy it grilled whole or chopped up into a stir-fry!	2	count	6.99	9.99	lb	Produce	Mushrooms	http://goodeggs1.imgix.net/product_photos/pCZNEt6cSh6BA7gGK8Q4_Portabella_Duo_Monterrey_Mushroom_One_Pound_Gils.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	342	\N	\N	\N
238	Fresh Organic King Trumpet Mushrooms	Our Organic King Trumpets are sweet and hardy.  Usually used as a replacement for Porcini, these mushrooms are best grilled whole or cut thin and cooks with greens.  We like to cut then into long strips and use them as a noodle substitute.	6	oz	5.99	15.97	lb	Produce	Mushrooms	http://goodeggs2.imgix.net/product_photos/ldu0VLTKSJy5Wlklo6kw_HdZwkxSbUmqyInszrzYYlcqr-RSn_zYrKAMrkjr1gAU.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	342	\N	\N	\N
239	Dried Porcini Mushrooms	Flavor­-loaded dried porcini should be on every single pantry shelf. Our dried porcini are picked and dried here in Northern California. We know where these mushrooms are picked because we’ve been sustainably harvesting in the same forests for decades. Our little family is a fussy bunch, and the care we take in harvesting and handling make these dried wild mushrooms state­ of­ the­ art.Having our large tube of dried porcini is the equivalent of always having over a pound of fresh porcini or boletes in the house. Porcini's legendary rich flavor is just a 15 minute water or broth soak away. Once tender they are ready for a quick sauté and bring intense, rich earthiness to to everything, from endless pasta sauces, to soups. Porcini will elevate something as simple as meatloaf into something extraordinary.	0.8	oz	8.49	10.61	oz	Produce	Mushrooms	http://goodeggs1.imgix.net/product_photos/viWuNEo8QnSoy5InsidB_20160505-WineForest_Porcini_MG_8880.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	342	\N	\N	\N
240	Dried Chanterelles	Our Wine Forest Dried Chanterelles have a mild, earthy mushroom flavor with a hint of dried apricot, and will rehydrate with the intensity of flavor dried mushrooms provide plus a wonderful meaty texture that make them ideal for incorporation into vegan dishes, soups and stews.At Wine Forest, we’ve haunted the Western woods hunting wild mushrooms for over three decades now. Chefs like Thomas Keller, Michael, Mina, Traci des Jardin and a herd of others have been devoted to the wild fruits of our work. There simply are no better wild mushrooms.	0.96	oz	8.99	9.36	oz	Produce	Mushrooms	http://goodeggs1.imgix.net/product_photos/mH4uVqIQBGD02lVIvzSc_20160505-WineForest_Chanterelles_MG_8886.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	315	\N	\N	\N
241	Dried Porcini Mushrooms	Flavor­-loaded dried porcini should be on every single pantry shelf. Our driedporcini are picked and dried here in Northern California. We know where these mushrooms are picked because we’ve been sustainably harvesting in the same forests for decades. Our little family is a fussy bunch, and the care we take in harvesting and handling make these dried wild mushrooms state­ of­ the­ art.Having our large tube of dried porcini is the equivalent of always having over a pound of fresh porcini or boletes in the house. Porcini's legendary rich flavor is just a 15 minute water or broth soak away. Once tender they are ready for a quick sauté and bring intense, rich earthiness to to everything, from endless pasta sauces, to soups. Porcini will elevate something as simple as meatloaf into something extraordinary.	1.6	oz	10.99	6.87	oz	Produce	Mushrooms	http://goodeggs1.imgix.net/product_photos/GQTs5R28R6isxX7gYX0w_20160505-WineForest_Porcini_MG_8896.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	342	\N	\N	\N
242	Dried Chanterelles	Our Wine Forest Dried Chanterelles have a mild, earthy mushroom flavor with a hint of dried apricot, and will rehydrate with the intensity of flavor dried mushrooms provide plus a wonderful meaty texture that make them ideal for incorporation into vegan dishes, soups and stews.At Wine Forest, we’ve haunted the Western woods hunting wild mushrooms for over three decades now. Chefs like Thomas Keller, Michael, Mina, Traci des Jardin and a herd of others have been devoted to the wild fruits of our work. There simply are no better wild mushrooms.	1.92	oz	11.49	5.98	oz	Produce	Mushrooms	http://goodeggs1.imgix.net/product_photos/7You7B5TtKj7XIwT4wIw_20160505-WineForest_Chanterelles__MG_8889.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	315	\N	\N	\N
243	Organic Medium Yellow Onion	Once the supply of storage onions starts to dwindle at the farms we work with directly, we rely heavily on our trusted distributor, Veritable Vegetable, to source the highest quality organic onions they can find.  These onions may be grown by one of the few trusted growers and labels Veritable Vegetable works with, including Hummingbird, Peri & Sons, Pinnacle/Foster Farms, and Heger Farms. We'll do our best to update you as Veritable Vegetable's source changes.Today's Organic Yellow Onions are coming from: Anderson Organics, in Washington____________________________________________Veritable Vegetable: A Unique Organic DistributorAs an organic produce distributor with over 40 years of experience, Veritable Vegetable has benefited from the creativity and hard work of our employees, and the deep relationships we’ve formed with our growers. We’re proud of our reputation for quality and integrity. As a mission–driven company, we make every business decision based on a set of core values. Because we believe in supporting our growers, we maintain visibility for each of the 200+ farm labels we carry and communicate the distance each grower is from our warehouse in San Francisco. Our environmental initiatives are vast: not only do we transport our organic produce via an award winning, environmentally sustainable green fleet of trucks and trailers; we also divert 99% of our waste stream through a vigorous waste management program and the use of reusable pallets, crates and fabric wraps. Additionally, our solar array generates 70% of our electricity needs. We actively support our community by creating unique partnerships with local and national organizations, donating time, produce, and resources to sustainability efforts, and by weighing in on policy initiatives that impact sustainable food systems. Veritable Vegetable is a woman-owned, certified B Corporation, using the power of business to solve social and environmental challenges.	1	count	0.49	1.96	lb	Produce	Garlic & Onions	http://goodeggs1.imgix.net/product_photos/Halqe4MiQxyBQuBf52sz_onion_large_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	253	\N	\N	\N
244	Organic Garlic	Affectionately called "the stinking rose," garlic is powerfully flavorful and medicinal! Anti-inflammatory, antimicrobial, antioxidizing and anti-cancerous, it truly is a wonder of the culinary world. Garlic was first cultivated over 5,000 years ago, making it one of the oldest known vegetables, and is now a staple in every kitchen around the world.Please note: Christopher Ranch has run out of their storage crop of California-grown Organic Garlic. Instead of sourcing conventionally-grown garlic, we've decided to stick with an organically-grown crop that Christopher Ranch sources from Argentina.	1	head	0.99	5.82	lb	Produce	Garlic & Onions	http://goodeggs1.imgix.net/product_photos/qtarMs0HSTidkMzNnvEM_TYBfi1hKTnKuwrqQzk30_Garlic-Jumbo.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	389	\N	\N	\N
245	Organic Large Red Onion	Sweet with a bit of a kick, this kitchen staple is great raw and sliced thin or added to stir-fries.When none of the farms we work with directly have Organic Red Onions, we work with our neighbor and trusted distributed partner, Earl's Organic to source us the highest quality produce they can. This week's Red Onions were grown by Peri & Sons in California's Imperial Valley.	1	count	0.99	1.65	lb	Produce	Garlic & Onions	http://goodeggs2.imgix.net/product_photos/JMH6bUZgRCJSlD7FltpQ_Hummingbird_Medium_Red_Onion2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	253	\N	\N	\N
246	Organic Senmoto Negi Green Onion	This Green Onion variety from southern Japan, is known as Senmoto Negi. It has a have a very intense, almost garlicky aroma and is very tender. Unlike most green onions, which tend to be a bit on the milder side, this variety is so pungent, it will make your eyes water when cutting!	1	bunch	3.49	13.96	lb	Produce	Garlic & Onions	http://goodeggs1.imgix.net/product_photos/2sw0x5lZREKOQfx56hWl_20160531-Hikari_SenmotoGreenOnion_MG_0769.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	253	\N	\N	\N
247	Organic Leeks	Our spring-planted, medium-large sized Pandora leeks with 1-2 inches of white flesh are nothing but young and succulent. Classic soup aside, these leeks also crisp up nice when separated into rings and roasted in the oven with a touch of oil and salt.	1	lb	2.99	2.99	lb	Produce	Garlic & Onions	http://goodeggs1.imgix.net/product_photos/IjTQbzC9SHux8P7pCWJ1_leeks_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	281	\N	\N	\N
248	Organic Yellow Onion	Cured and ready for storage, Yellow Onions are the ultimate kitchen staple.	1	count	0.99	1.98	lb	Produce	Garlic & Onions	http://goodeggs1.imgix.net/product_photos/AZYtBYbySkaYWkSU6ym9_onion_large_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	253	\N	\N	\N
249	Purplette Small Red Onions	Mild and sweet compared to other Red Onions, these Purplettes are perfect for raw applications or pickling projects.	1	lb	3.79	3.79	lb	Produce	Garlic & Onions	http://goodeggs1.imgix.net/product_photos/46EAladAQ1eLwrCFitr8_Onions_Red.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	253	\N	\N	\N
250	Organic Small Red Onions	Stock up on these sweet members of the Allium family! These small sizes are perfect for being able to use the whole thing in one sitting.Once the supply of storage onions starts to dwindle at the farms we work with directly, we rely heavily on our trusted distributor, Veritable Vegetable, to source the highest quality organic onions they can find.  These onions may be grown by one of the few trusted growers and labels Veritable Vegetable works with, including Hummingbird, Peri & Sons, Pinnacle/Foster Farms, and Heger Farms. We'll do our best to update you as Veritable Vegetable's source changes.Today's Organic Red Onions are coming from: Hummingbird.____________________________________________Veritable Vegetable: A Unique Organic DistributorAs an organic produce distributor with over 40 years of experience, Veritable Vegetable has benefited from the creativity and hard work of our employees, and the deep relationships we’ve formed with our growers. We’re proud of our reputation for quality and integrity. As a mission–driven company, we make every business decision based on a set of core values. Because we believe in supporting our growers, we maintain visibility for each of the 200+ farm labels we carry and communicate the distance each grower is from our warehouse in San Francisco. Our environmental initiatives are vast: not only do we transport our organic produce via an award winning, environmentally sustainable green fleet of trucks and trailers; we also divert 99% of our waste stream through a vigorous waste management program and the use of reusable pallets, crates and fabric wraps. Additionally, our solar array generates 70% of our electricity needs. We actively support our community by creating unique partnerships with local and national organizations, donating time, produce, and resources to sustainability efforts, and by weighing in on policy initiatives that impact sustainable food systems. Veritable Vegetable is a woman-owned, certified B Corporation, using the power of business to solve social and environmental challenges.	5	lb	7.99	1.6	lb	Produce	Garlic & Onions	http://goodeggs2.imgix.net/product_photos/EbNM2eqpRJSvfPIbJ4zh_RedOnionsBulk-1.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	253	\N	\N	\N
251	Organic Large White Onion	Once the supply of storage onions starts to dwindle at the farms we work with directly, we rely heavily on our trusted distributor, Veritable Vegetable, to source the highest quality organic onions they can find.  These onions may be grown by one of the few trusted growers and labels Veritable Vegetable works with, including Hummingbird, Peri & Sons, Pinnacle/Foster Farms, and Heger Farms. We'll do our best to update you as Veritable Vegetable's source changes.Today's Organic White Onions are coming from: Peri & Sons.____________________________________________Veritable Vegetable: A Unique Organic DistributorAs an organic produce distributor with over 40 years of experience, Veritable Vegetable has benefited from the creativity and hard work of our employees, and the deep relationships we’ve formed with our growers. We’re proud of our reputation for quality and integrity. As a mission–driven company, we make every business decision based on a set of core values. Because we believe in supporting our growers, we maintain visibility for each of the 200+ farm labels we carry and communicate the distance each grower is from our warehouse in San Francisco. Our environmental initiatives are vast: not only do we transport our organic produce via an award winning, environmentally sustainable green fleet of trucks and trailers; we also divert 99% of our waste stream through a vigorous waste management program and the use of reusable pallets, crates and fabric wraps. Additionally, our solar array generates 70% of our electricity needs. We actively support our community by creating unique partnerships with local and national organizations, donating time, produce, and resources to sustainability efforts, and by weighing in on policy initiatives that impact sustainable food systems. Veritable Vegetable is a woman-owned, certified B Corporation, using the power of business to solve social and environmental challenges.	1	count	0.99	1.98	lb	Produce	Garlic & Onions	http://goodeggs2.imgix.net/product_photos/wvTOsnbFQy12R7WgT09o_Peri_and_Sons_Jumbo_White_Onion2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	253	\N	\N	\N
252	Organic Yellow Onion	Yellow onions are the workhorses of the allium family. With rich flavor and a subtle, aromatic sweetness that increases when cooked, these are one staple you won't want to be without. Dice them for a mirepoix to make broth and soup, quarter them to stuff your turkey, or slice and add them to any roasting pan for an extra boost of flavor. As a bonus, they can be substituted for any other type of onion (white, Vidalia, red) your recipe might call for.	1	count	0.69	1.38	lb	Produce	Garlic & Onions	http://goodeggs2.imgix.net/product_photos/Mw8ht7cSFqQng2igiBrE_onion_large_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	253	\N	\N	\N
253	Organic Yellow Onions (Bulk)	Yellow Onions are the workhorses of the allium family. With rich flavor and a subtle, aromatic sweetness that increases when cooked, these are one staple you won't want to be without. Dice them for a mirepoix to make broth and soup, quarter them to stuff your turkey, or slice and add them to any roasting pan for an extra boost of flavor. As a bonus, they can be substituted for any other type of onion (white, Vidalia, red) your recipe might call for.	3	lb	3.99	1.33	lb	Produce	Garlic & Onions	http://goodeggs2.imgix.net/product_photos/W8P8ODDYSWsq4JfoFMt1_onions_bulk.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	253	\N	\N	\N
254	Shallots	One of the sweetest and mildest cured alliums, the Shallot is perfect for adding a subtle kick to a vinaigrette. It is also great for caramelizing by using some low and slow heat.	1	lb	5.99	5.99	lb	Produce	Garlic & Onions	http://goodeggs1.imgix.net/product_photos/HwSFztVFTkuTjZmE0EOY_unspecified-3.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	390	\N	\N	\N
255	Organic White Spear Onions	Beautiful white bulbs, with deliciously edible greens, these spring alliums are sweet and juicy, making them perfect for the grill.	1	bunch	3.49	4.65	lb	Produce	Garlic & Onions	http://goodeggs1.imgix.net/product_photos/RqKja5PlRIumTIwrcjRc_Onion-Cipolini.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	253	\N	\N	\N
256	Organic Elephant Garlic Cloves	Elephant Garlic is actually a variant of a garden leek, but has a garlicky bite to it, but less pungent and often less juicy than other varieties of garlic. Its large-sized cloves make it perfect for making garlic chips or roasting whole.Note: sometimes the outer layer of the cloves will fall off or be cracked enough to expose the flesh of the clove, which causes the outside of the clove to harden a bit. But don't worry, this garlic is perfectly safe and delicious to eat!	0.5	lb	4.99	9.98	lb	Produce	Garlic & Onions	http://goodeggs2.imgix.net/product_photos/uMIK3kzvTYywU0qXgFkP_FK1A6593.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	389	\N	\N	\N
257	Organic Gold Pearl Onions	This quintessential addition to any roast. Toss them in along with your favorite roasting cut and let them stew in the fat and flavor. When none of the farms we work with directly have Organic Red Onions, we work with our neighbor and trusted distributed partner, Earl's Organic to source us the highest quality produce they can. These Organic Red Pearl onions are coming from the third generation family-owned garlic and onion farm, Christopher Ranch. Christopher Ranch is based out of Gilroy, California.	1	count	2.49	0.31	oz	Produce	Garlic & Onions	http://goodeggs1.imgix.net/product_photos/08xJ9PgqQpSl4CVsRjQi_unspecified-1.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	253	\N	\N	\N
258	Organic Red Pearl Onions	The quintessential addition to any roast. Toss them in along with your favorite roasting cut and let them stew in the fat and flavor. When none of the farms we work with directly have Organic Red Onions, we work with our neighbor and trusted distributed partner, Earl's Organic to source us the highest quality produce they can. These Organic Red Pearl onions are coming from the third generation family-owned garlic and onion farm, Christopher Ranch. Christopher Ranch is based out of Gilroy, California.	1	count	2.49	0.31	oz	Produce	Garlic & Onions	http://goodeggs2.imgix.net/product_photos/sSao7L7ETSikfz4chQ6v_unspecified.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	253	\N	\N	\N
259	Organic Leeks	A crucial ingredient in stocks, soups, sautés, braises, gratins, and savory pies, leeks have a mild onion-y flavor that helps enhance savory notes in other foods. Halve the stalk lengthwise and then chop it into thin half-moons, being sure to wash them well (sandy soil can get trapped in the layers).	1	lb	2.49	2.49	lb	Produce	Garlic & Onions	http://goodeggs1.imgix.net/product_photos/rFsrPLnaSsu40ftATuAJ_leeks_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	281	\N	\N	\N
260	Organic Ginger Root	Warming and spicy, this root is the quintessential flavoring to a number of sweet and savory dishes. Organically grown in Hawaii. It is great in curry, juices, and cookies.This Ginger is grown by Kolo Kai in Kauai, Hawaii. They are a small family farm that only distributes directly to small retailers, in order to insure that the final consumer receives the product within 10 days or less. 	4	oz	3.99	1.0	oz	Produce	Herbs	http://goodeggs2.imgix.net/product_photos/kcY9byYfSUWaJRERaov9_unspecified-1.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	359	\N	\N	\N
261	Organic Thyme	A classic herb sure to intrigue dinner guests, thyme is amazing on roasted pork or chicken. Try it mixed in with dill and cream sauce to drizzle on top of salmon. Thyme is also great added to sautéd mushrooms or mushroom based sauces.	1	bunch	2.29	\N	\N	Produce	Herbs	http://goodeggs2.imgix.net/product_photos/jvLfForQLChJzRDE3akZ_thyme_04.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	209	\N	\N	\N
262	Organic Basil	Knoll's basil is looking beautiful right now! Full leaves of pungent, bright basil, just waiting for some sliced Heirloom Tomatoes and fresh Mozzarella. 	1	bunch	2.49	0.62	oz	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/M0VDe27hTumvLi4d2IvF_basil_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	338	\N	\N	\N
263	Organic Rosemary	Rosemary is a hearty perennial herb that'll bring a liveliness and depth to winter roasts of root veggies or beef. If you only need a couple of sprigs, strip the bottom leaves first, and leave the rest in a cup of water in the fridge!	1	bunch	1.49	\N	\N	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/6MFm2ENQDeQbwyFL7l8p_rosemary_08.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	262	\N	\N	\N
264	Organic Sage	Great in a brie and sage stuffed chicken breast and terrific on roasted broccoli. Try it in creamed onions or on roasted pork! Sage is amazing and versatile. For a real treat try spareribs with a savory sage rub including garlic, thyme, lemon, pepper and rosemary.	1	bunch	1.99	\N	\N	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/XOZe7CmAQeiMiwYvAx9Y_sage_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	208	\N	\N	\N
265	Organic Cilantro	Deliciously pungent and very versatile! Store in the refrigerator in a plastic bag or on the counter in a glass of water for a fragrant bouquet.	1	bunch	2.29	9.16	lb	Produce	Herbs	http://goodeggs2.imgix.net/product_photos/gd26blPyQbe7v0mBD4tk_cilantro_05.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	219	\N	\N	\N
266	Organic Spearmint	Our organic mint is a great addition to a salad, drinks or desert.   So refreshing !   Or, for a pot of tea, to relax after a difficult day.  Our mint is grown in a water based system so it is super green and fresh all year round, even in the hot summer months.  For tea, we suggest rinsing the mint with water, then chopping finely with a butcher's knife.  Then, add to your tea pot, fill with boiling water and let steep for a few minutes.  It's also great combined with our peppermint.  We hope you enjoy it!	1	bunch	1.99	\N	\N	Produce	Herbs	http://goodeggs2.imgix.net/product_photos/4IfcCfW9T62itD1TrzH8_mint.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	350	\N	\N	\N
267	Organic Chives	Excellent tossed with potatoes or thrown atop scrambled eggs!Due to the drought, this perennial herb is flowering more frequently than other, wetter years. Don't fear the flowers though: they are lovely and mild in flavor, and make a beautiful garnish and are delicious (and delightful!) when tossed into salads.	1	bunch	1.99	\N	\N	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/1Q8CWwDS3GLpSBpbB9ih_Chives_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	237	\N	\N	\N
268	Genovese Basil	Local Greens' 1 oz. package of Genovese Large Leaf basil contains very little stems so you get the best part of the plant. They grow basil in a protected environment in Berkeley, CA, all year round using non-GMO organic seeds and natural nutrients. If you trim the stems and place in a cup of water, they'll last for over a week!Their basil is the one product that isn't currently certified organic--the nutrients they used to use in their aquaponic system for basil, though ecologically sustainable, weren't recognized by OMRI's list--but they are excited to announce that their organic certification for this crop is 3-4 months out!	1	oz	3.99	3.99	oz	Produce	Herbs	http://goodeggs2.imgix.net/product_photos/MPPwgn7TAW8J2z0MnGQO_FK1A7489.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	338	\N	\N	\N
269	Organic Dill	Feathery and slightly pungent, never underestimate the power of fresh dill in your favorite dishes. Mix with sour cream for a delicious dip, use on your favorite fish, sprinkle on some roasted new potatoes, and don't forget to add it to bean, potato and chicken salads.	1	bunch	1.79	\N	\N	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/2l5HLJ2PQRKGWW814tRs_Si_AFImrxhzs6tU_G9YzJEFs7CaTITQYqhiX9EJ7Uh8.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	361	\N	\N	\N
270	Organic Dill	This beautiful dill from County Line provides the perfect lightness to hearty or rich salads.	1	bunch	2.49	\N	\N	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/BJMZzS7VQajqJ4TKW84h_Countyline_Dill.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	361	\N	\N	\N
298	Organic Cutie Seasonal Bouquet	We can guarantee that each and every one of Thomas Farm's unique seasonal bouquets will be beautiful, but please note that due to their seasonal nature, the bouquet might not look exactly the same as the one pictured.	1	count	9.99	\N	\N	Produce	Flowers	http://goodeggs2.imgix.net/product_photos/3tu8qhucTy6r34P9gomX_20160407_Thomas_Farm_Cutie-291.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	318	\N	\N	\N
271	Organic Curly Parsley	Slightly bitter and slightly salty, this essential herb is perfect for livening up any salad, green or grain. This curly variety's extra nooks and crannies make it perfect for crisping up under a broiler when added to shrimp or scallops.This Organic Curly Parsley was grown by JTF Organics in Hollister, CA, and brought to us by Coke Farms.	1	bunch	1.49	0.75	oz	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/pVzFQTmUTCq1dVZTS84Q_Parsley_Curly.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	333	\N	\N	\N
272	Organic Flat Leaf Parsley	An essential herb for many stews and soup, great for roasted veggies, and a great way to add some bright and slightly salty herbaceous flavor to hearty grain salads, this Flat Leaf Italian Parsley is a kitchen staple.	1	bunch	2.49	1.25	oz	Produce	Herbs	http://goodeggs2.imgix.net/product_photos/hNRpPTUITECNWtvgW4FX_parsley.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	333	\N	\N	\N
273	Organic Oregano	The great, classic, Italian herb. The go-to spice for pizza, for pastas and Italian style breads, oregano is also amazing on roasted tomatoes. Try it mixed into a breadcrumb with parmesan or just sprinkle it across the top of a nice feta with olive oil as an appetizer.	1	bunch	1.99	\N	\N	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/NOR6OfFZQ8aAGnSEBJni_oregano_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	265	\N	\N	\N
274	Organic Thyme	Thyme is an indispensable herb in cuisines around the world, lending an aromatic, earthy flavor to dishes. Tuck whole sprigs into a roasting dish alongside meat and vegetables or into the cavity of your turkey, add them to a sauté pan with mushrooms or mirepoix, or pluck the leaves off and add them to sauces and soups.	1	bunch	2.99	\N	\N	Produce	Herbs	http://goodeggs2.imgix.net/product_photos/GG5EgLNORwSsse7GgoCT_thyme_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	209	\N	\N	\N
275	Organic Italian Flatleaf Parsley	A truly essential herb, Italian or flatleaf parsley has a clean, bright flavor with a hint of saltiness that adds depth to any salad, soup, or roast. Chop the leaves coarsely to top grains, pasta, or potato dishes and keep the stems to use in gravy, broth, or for stuffing your turkey—they have a slightly more intense flavor than the leaves.	1	bunch	2.29	0.57	oz	Produce	Herbs	http://goodeggs2.imgix.net/product_photos/lnMH3EaHRsCWREyRrPPd_parsley_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	333	\N	\N	\N
276	Organic Bay Leaves	Fresh Bay Leaves are pungent and slightly bitter, adding herbal, floral aromas to dishes. Use the leaves whole in soups, stews, and sauces, in a pot of beans, rice, and other grains, or on roasting meat to add flavor. Remove the leaves before serving; they won't hurt you, but they are tough and bitter to bite into whole.	1	bunch	1.99	1.99	oz	Produce	Herbs	http://goodeggs2.imgix.net/product_photos/c3TwmpJITRmyLSec9CQo_eat_well_bay_leaf.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	306	\N	\N	\N
277	Organic Rosemary	Rosemary is one of the most strongly scented herbs out there, with a pungent notes of lemon and pine. Tuck whole sprigs around meat and vegetables in a roasting pan, infuse them into olive oil for a fragrant dip, or pull the needle-like leaves off the stem and chop them finely to add to rubs, marinades, and stuffing.	1	bunch	1.99	1.99	oz	Produce	Herbs	http://goodeggs2.imgix.net/product_photos/fvHLtV0kTaiorrjRaFQY_rosemary.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	262	\N	\N	\N
278	Organic Bay Leaf	An irreplaceable ingredient in your favorite hearty soups and stews like split pea, chicken or even a moroccan vegetable  soup.Picked fresh from the tree just for you.	1	bunch	1.99	\N	\N	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/1oDawwRkSmKtUgNqxwYO_eat_well_bay_leaf.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	279	\N	\N	\N
279	Organic Dried Lavender	These beautiful dried bunches of Lavender grown by Capay Organic in the heart of Yolo County, CA, will add a wonderful fragrance to any kitchen. Hang these up, or put them in a waterless vase, for some rustic beautification.  Enjoy the subtle scent of this wonderful herb for months to come.	1	bunch	9.99	\N	\N	Produce	Herbs	http://goodeggs2.imgix.net/product_photos/3tBHI0AsQm2TfPfjcJlw_20160921-Capay_DriedLavendar_MG_1602.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	269	\N	\N	\N
280	Organic Garlic Chives	This chive variety has a slightly garlicky kick, and is great for stir-fries or for adding, coarsly chopped, into salty, brothy soups.	1	bunch	2.29	\N	\N	Produce	Herbs	http://goodeggs2.imgix.net/product_photos/mx0RepiFRiPDGnVplQyQ_garlic_chives.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	389	\N	\N	\N
281	Organic Peppermint	Peppermint is here !!!  This is the mint that chef's love for all their dishes.  Using peppermint instead of spearmint takes mint to the next level because it has menthol, making the experience that more intense.  Great in desserts and savory dishes as well or just to chew on, as a calming snack.Our certified organic peppermint is grown in a water based system so it is super green and fresh all year round, even in the hot summer months. It's also great for a pot of tea, to relax after a difficult day.  For tea, we suggest rinsing the mint with water, then chopping finely with a butcher's knife.  Next, add to your tea pot, fill with boiling water and let steep for a few minutes.  It's also great combined with our spearmint.  We hope you enjoy it!	1	bunch	2.59	\N	\N	Produce	Herbs	http://goodeggs2.imgix.net/product_photos/IgmCuEYNTT2S4TA76iPQ_ken5beg5uXSRGnHh2QbXc8mAZqZkygSpw26szVxz3v8.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	355	\N	\N	\N
282	Organic Lemongrass	Lemongrass is a staple for Vietnamese cooking. Hikari's lemongrass is tender and not too fibrous.	1	count	1.49	1.49	oz	Produce	Herbs	http://goodeggs2.imgix.net/product_photos/IKPQn9lYRkeuMx8wzL4g_Ouruboros_Lemongrass.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	275	\N	\N	\N
283	Dried Culinary Bouquet	Krysia at Oak Hill Farm of Sonoma has put together a most gorgeous kitchen bouquet with lovingly gathered safflower, dried chiles, yarrow, bay and lavender. Amazingly colorful for a dried bouquet, this makes a perfect gift for a cook!	1	bunch	12.99	\N	\N	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/Ot39ybnVQ9muXj0bWGkV_IMG_8421.JPG?w=380&h=238&fm=jpg&q=41&fit=crop	318	\N	\N	\N
284	Organic Horseradish Root	Knoll's horseradish root is generally thinner and a bit gnarlier looking than you might generally see in the supermarket, but it's certainly not lacking in flavor.Horseradish root contains highly volatile oils that are released when root cells break down by grating.  Vinegar can be added immediately to freshly ground or grated horseradish to stabilize the flavor before it gets too hot, or if you want three minutes to add the vinegar, you'll end up with a very hot paste. Fresh horseradish can also be finely shaved and used to top a plate of steak, potatoes or anything else that could benefit from a slight kick.Fresh horseradish should be scrubbed thoroughly before being grated or thrown into a blender, but as a whole root, it can last for many weeks (if not months) in the fridge in a plastic bag.	0.5	lb	3.99	7.98	lb	Produce	Herbs	http://goodeggs2.imgix.net/product_photos/4hAt5CwUTUeTvmZ69kd6_FK1A1656.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	336	\N	\N	\N
285	Aquaponic Living Red-Veined Sorrel	Sweet with a bright, citric tartness, this Red-Veined Sorrel's flavor is as complex and intriguing as its leaves are beautiful. Use Sorrel to brighten up any heavy potato or egg dish or to accent a creamy soup. Chop it thinly and add it to a green salad, and it'll add enough brightness to leave the vinegar out of your vinaigrette!	1	count	1.49	\N	\N	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/HVY4hWjzSBeVs4Xwbsbd_20160603-RedSorrell_MG_1212.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	341	\N	\N	\N
286	Organic Lemon Verbena	Because it lacks the acidity of lemons but still has a great lemony flavor, it's truly exceptional when used in desserts, as a flavoring in ice creams or jams, or for adding to simple syrup. It can also be used to make a truly unique pesto or to brighten a pork chop brine. Enjoy!	1	bunch	2.49	2.49	oz	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/GP8fBz0vQpebpkueyu3i_lemon_verbena_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	374	\N	\N	\N
287	Organic Flowering Cilantro	Little known secret: if you let Cilantro bolt and flower, eventually it'll produce seeds, which we call Coriander. If you cut the Cilantro plant before it seeds out, you can eat the mild and sweet flowers and fine, ferned-out leaves. They impart both beauty and a the flavor of cilantro into salads, tacos, and even desserts.	1	bunch	3.99	\N	\N	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/FRLxBpFAQ2Gux9DrihKP_Dirty_Girl_Produce_Cilnatro_Flower.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	219	\N	\N	\N
288	Aquaponic Lemongrass	An absolute must for many a Thai dish and in other Asian cuisines, Lemongrass will give you the a sweet depth of flavor you can't do without. Ken's aquaponically-grown lemongrass is incredibly tender and flavorful, with plenty of juice in prized bottom half.	1	count	1.49	\N	\N	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/Flf6FoCOSGyBs3RONS6c_FK1A4659.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	275	\N	\N	\N
289	Bulk Organic Turmeric Root (3 lbs.)	Juicers and curry-makers rejoice! This fresh turmeric root is brighter in flavor than its powdered counterpart.  Prepare it as you would ginger and add to fresh curries to brighten them up with a slight kick.  Turmeric also contains high levels of curcumin, a natural anti-inflammatory compound, making it a much sought-after item for adding to fresh fruit and veggie juices.Almost all commercially available fresh organic turmeric is imported from Peru or Hawaii, but we're lucky to have Whiskey Hill Farms growing this special treat for us just down the road in the Watsonville area. The wonders of heated greenhouses!This 3 lbs. bag of Turmeric is perfect for serious juicers.  And fear not, just like Ginger, Turmeric can hold for several weeks in the refrigerator, so you'll have plenty of time to use it all up!	3	lb	49.99	1.04	oz	Produce	Herbs	http://goodeggs2.imgix.net/product_photos/bCrUtiZiTOqCua7muT4R_FK1A7063.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	410	\N	\N	\N
290	Chervil	This beautiful Chervil has the light salinity and rich bitterness of of parsley and the licorice sweetness of tarragon. It's great as a topping for dark, rich flavors like risotto or gratins. Martin harvests just the tops of the plants, so you're getting almost no stem.	0.5	oz	1.79	3.58	oz	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/AX9NQ5CgRzqm2LsSKDJh_FK1A7328.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	362	\N	\N	\N
291	Aquaponic Living Genovese Basil	A living Genovese basil plant fresh out of our system, harvested just for you.  Young, tender leaves, fresh and full of flavor will add a unique and dynamic experience to any dish prepared with this most popular of basils.	1	bunch	3.99	\N	\N	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/GTIqvdKCRiwly2coyExG_YN1G9sNAL19uNWylh_uHncLBagK-uzXsouZ68OaInJ0.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	338	\N	\N	\N
292	Aquaponic Living Purple Opal Basil	This\n hybrid basil variety has a slightly stronger anise flavor, with mild ginger \nundertones and a potent aroma compared to common green sweet basil.   Opal basil is considered savory when \ncompared to the standard sweet basil and is used for it flavor as well \nas its color. Fresh out of our system and harvested just for you.  Young, tender leaves,\n fresh and full of flavor will add a unique and dynamic experience to \nany dish.	1	bunch	3.99	\N	\N	Produce	Herbs	http://goodeggs1.imgix.net/product_photos/i2r40UDRfa1qSPO8KQTw_NkSJW0TeCeKf1QnY_QSv_Jf32SAyPT7fV4-E4v0yyxg.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	338	\N	\N	\N
293	Organic CSA Box	The best of the week of seasonal organic produce from our small farm! Our farm boxes often include, but are not limited to: a mix of bunched greens, roots, squash, and herbs.  Don't forget to check out our Facebook page for news and updates on the farm!Shop the Good Eggs market to add our Organic Pastured Soy-Free Eggs and meet all of your kitchen needs!	1	count	22.99	\N	\N	Produce	Produce Boxes & Bulk	http://goodeggs1.imgix.net/product_photos/B08HFVNITjG1Pgwd8k2f_3o2UTAQUtDZkhb86ZD8IZT7SubgOx9HBNZ3nY7HaXEQ.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	303	\N	\N	\N
294	Medium Farm-to-Vase Bouquet	Oak Hill Farm calls these medium sized bouquets "Posies", and they're as cute and colorful as they sound! Amongst the greens are some of the finest fall flowers still blooming in Sonoma County.Chuy, the flower production manager at Oak Hill, selects different flowers each week, depending upon what's looking good. So the Posy you get might not look exactly like the one pictured, but it'll be equally as beautiful.In order to give your bouquet the longest life, give each stem a diagonal fresh cut and place in a jar of clean water. (The diagonal cut increases the surface area for each stem to uptake water.) Every couple of days, change out the water and give another fresh cut. Warm water works best.	1	bunch	11.99	\N	\N	Produce	Flowers	http://goodeggs1.imgix.net/product_photos/WTdp1fugRZqGwMsimw7R_20160606-FullBelly_SeasonalBouquet_MG_1232.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	318	\N	\N	\N
295	Baby Blue Eucalyptus	Beautiful to look at and intoxicating to smell, these large bunches of Baby Blue Eucalyptus are quite long-lasting. Try tying a bunch up somewhere near your shower head so that steam (but no water) hits the leaves, releasing its wonderful aroma.	1	bunch	9.99	\N	\N	Produce	Flowers	http://goodeggs2.imgix.net/product_photos/9HVNv3DyTRGhK1g8u2IN_20161014-Oakhill_Eucalyptus_MG_4055.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	397	\N	\N	\N
296	Eucalyptus Wreath	This hand-made wreath is made of festive, fragrant and sustainable Spiral Eucalyptus. While its scent will fade, the Eucalyptus Wreath will stay beautiful for months on your door.	1	count	34.99	\N	\N	Produce	Flowers	http://goodeggs2.imgix.net/product_photos/j21EEU6TR6mHCcrxhxM9_20161019-HolidayWreath_MG_4536.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	207	\N	\N	\N
297	Silver Dollar Eucalyptus	Papery flat silver dollar sized leaves make this variety of Eucalyptus special. It has a soft texture that takes on a cheerful air from the polka-dot feeling of the leaves. It is easy to imagine the sound of them rustling when you look at them. They smell fresh and clean like camphor.	1	bunch	7.99	\N	\N	Produce	Flowers	http://goodeggs1.imgix.net/product_photos/PMVO2CD6SaqEVJdIkI6C_unspecified-18.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	397	\N	\N	\N
304	Frozen Transitional Organic Cranberries	Starvation Alley's no-spray cranberries are transitional organic, meaning that the farms growing the cranberries are in the process of being certified organic and are producing amazingly delicious, flavorful fruit while they do so. Cranberries are super-tart and deliciously sweet, not to mention a fantastic source of Vitamin C, manganese, and other naturally-occurring vitamins and minerals. Bake them into pies or quickbreads with other fall fruit like pears and apples, or use in savory dishes—we like to throw a handful into the pan when roasting meat or veggies. And of course, you can't make cranberry sauce without using a few (or many!) cranberries!Ingredients: Cranberries.	10	oz	3.49	5.58	lb	Produce	Frozen Fruit & Vegetables	http://goodeggs1.imgix.net/product_photos/qCbpEmnAT5edqhT75MAF_20161021-StarvationAlley_Cranberries_MG_4762.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	230	\N	\N	\N
305	Frozen Marion Blackberries	Like a fine wine, these deeply hued berries boast complex layers of flavor and fragrance.Located in the heart of Oregon's lush Willamette Valley, Stahlbush Island Farms is an environmentally friendly farm and food processor committed to sustainable agriculture. Our philosophy is that farming practices should leave the soil, air, water, plant life, animals and people healthier. For us, sustainability is a continuing journey.What does it mean to be sustainable? Good question! At Stahlbush, we think it’s important to explain to people what we mean when we use this term to describe our way of farming and producing food. We define sustainable as “meeting the needs of the present without compromising the ability of future generations to meet their own needs” (based on “Report of the World Commission on Environment and Development,” United Nations, 1987). We like this definition because it shows the quest for sustainability is a philosophy. Our philosophy of sustainability guides our farming practices and affects the way we use energy and care for soil, water, people and wildlife.	10	oz	4.79	7.66	lb	Produce	Frozen Fruit & Vegetables	http://goodeggs1.imgix.net/product_photos/SZv6AdhkT7qpmFp4negy_FK1A4859.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	241	\N	\N	\N
306	Frozen Blueberries	We ensure our blueberries are sweet, plump and rich in antioxidants by flash freezing them straight from the field.Located in the heart of Oregon's lush Willamette Valley, Stahlbush Island Farms is an environmentally friendly farm and food processor committed to sustainable agriculture. Our philosophy is that farming practices should leave the soil, air, water, plant life, animals and people healthier. For us, sustainability is a continuing journey.What does it mean to be sustainable? Good question! At Stahlbush, we think it’s important to explain to people what we mean when we use this term to describe our way of farming and producing food. We define sustainable as “meeting the needs of the present without compromising the ability of future generations to meet their own needs” (based on “Report of the World Commission on Environment and Development,” United Nations, 1987). We like this definition because it shows the quest for sustainability is a philosophy. Our philosophy of sustainability guides our farming practices and affects the way we use energy and care for soil, water, people and wildlife.	10	oz	4.79	7.66	lb	Produce	Frozen Fruit & Vegetables	http://goodeggs1.imgix.net/product_photos/zgptmpMTpaQMNMPdJlWk_FK1A9940.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	220	\N	\N	\N
307	Frozen Green Peas	A favorite among our tasting table donations to the local schools, our sweet tasting green peas even get kids excited about eating veggies.  Try combining them with basil, olive oil, garlic, lemon juice, and Parmesan cheese for a fantastically simple pesto dish.	10	oz	2.69	4.3	lb	Produce	Frozen Fruit & Vegetables	http://goodeggs1.imgix.net/product_photos/PZ3d3ETQwSJvxqs71CVw_FK1A9833.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	388	\N	\N	\N
308	Frozen Sweet Corn	Flash-frozen straight from the field, our corn retains its summertime on-the-cob flavor.  Try combining it with our Cut Spinach, red pepper, garlic, and a little olive oil for the perfect stir-fry.	10	oz	2.69	4.3	lb	Produce	Frozen Fruit & Vegetables	http://goodeggs2.imgix.net/product_photos/EV8UqWEoSUyIGHA149gm_FK1A0673.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	293	\N	\N	\N
309	Frozen Spinach	Frozen within an hour of harvest, our farm-fresh spinach tastes just like it came from your garden at home.  It’s great for breakfast omelets and scrambles, dips, and savory side dishes.  Try combining it with a bag of our super sweet corn, red pepper, garlic, and a little olive oil for the perfect stir-fry.	10	oz	2.79	4.46	lb	Produce	Frozen Fruit & Vegetables	http://goodeggs1.imgix.net/product_photos/Gpjcq0lmQNqdrFdg0qb2_FK1A9934.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	307	\N	\N	\N
310	Frozen Broccoli	Tender and bright green, our broccoli florets have a rich farm-fresh flavor.  They are the perfect addition to soups and side dishes or add to macaroni and cheese for a great variation.	10	oz	2.79	4.46	lb	Produce	Frozen Fruit & Vegetables	http://goodeggs2.imgix.net/product_photos/MuD3N03qT1iEO8Z6Sg7S_FK1A9789.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	298	\N	\N	\N
311	Frozen Sweet Potatoes	Equally at home in both sweet and savory dishes, we love these bite-size sweet potatoes for their versatility. Ingredients: Non-GMO Sweet Potatoes	10	oz	2.79	4.46	lb	Produce	Frozen Fruit & Vegetables	http://goodeggs2.imgix.net/product_photos/xCCYuchmRMmXQrZ2dkyQ_FK1A7627.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	255	\N	\N	\N
313	Frozen Cauliflower	With a subtle nutty flavor and satisfying crunch, our cauliflower florets have been carefully frozen to lock in their farm-fresh flavor. A great substitute for heavier starches like potatoes (try them mashed!) or as the base of a creamy soup.Ingredients: Non-GMO Cauliflower	10	oz	2.79	4.46	lb	Produce	Frozen Fruit & Vegetables	http://goodeggs1.imgix.net/product_photos/jO52KnwWTaSfEYvuov5Q_FK1A7618.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	290	\N	\N	\N
314	Frozen Sliced Beets	A great addition to salads or paired with goat cheese, these sliced beets pack all the earthy richness you expect from farm-fresh produce, without the time and stains that accompany preparing beets from scratch. Ingredients: Non-GMO Beets	10	oz	2.79	4.46	lb	Produce	Frozen Fruit & Vegetables	http://goodeggs1.imgix.net/product_photos/L04CwxtASl29ahRodqnb_FK1A7648.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	399	\N	\N	\N
315	Frozen Butternut Squash	Our peeled, diced butternut squash takes the work out of preparing this scrumptious fall favorite.  Try roasting it in the oven with a little olive oil and fresh thyme for a quick, nutritious side dish.	10	oz	2.79	4.46	lb	Produce	Frozen Fruit & Vegetables	http://goodeggs1.imgix.net/product_photos/CAwRk5x2TKuP0Sr4wkw1_FK1A9864.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	346	\N	\N	\N
329	Marcona Almonds	Marcona Almonds are fatter, rounder and have a more buttery taste than any other almond varietal—almost like a cross between an almond and a macadamia nut. They are savored all over the world. Marcona almonds are traditionally blanched, or fried in olive oil & salted. Enjoy them by the handful with cheese, wine, or beer, or chop them into salads and grain dishes.Ingredients: Spanish Marcona almonds, olive oil, salt.Contains: tree nuts.	4	oz	7.49	1.87	oz	Produce	Dried Fruit & Nuts	http://goodeggs2.imgix.net/product_photos/QlJIdePHSua9zlxeJmu0_FK1A1896.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	271	\N	\N	\N
316	Organic Dried Mango	Peeled Snacks' Much-Ado-About-Mango® makes the perfect alternative to sugary filled snacks. Starting with whole organic mangoes harvested at the peak of ripeness, this gently sun dried snack has been preserves with no added sugar, preservatives or oils. Rich in flavor, vitamins and a variety of phytonutrients, with Peeled Snacks’ mango you can snack your way to a healthy new you.\nTo source the mangos for this snack, Peeled works directly with Mexican growers in the Western Sinaloa region. Through initiatives such as the implementation of solar panels on farms, increasing overall organic acreage in the region, and supporting cooperative organizing of workers, Peeled is a proud steward of fair labor and sustainable practices that encourage clean food production and sustain healthy communities.\nIngredients: Organic Mango	2.8	oz	3.99	1.43	oz	Produce	Fruit & Veggie Snacks	http://goodeggs1.imgix.net/product_photos/qPzg4TbNRlmQFTK4ooAg_20160713-Peeled_DriedMango_MG_5175.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	405	\N	\N	\N
317	100% Organic Mini Medjool Dates	Our smallest Medjool grade of the season. The minis tend to be slightly drier and chewier than the larger medjool date grades we offer.	4	oz	4.99	1.25	oz	Produce	Fruit & Veggie Snacks	http://goodeggs1.imgix.net/product_photos/qrVaqlhpR02nk6Wq00ES_FK1A2069.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	392	\N	\N	\N
318	Dried Bing Cherries	Our sun-dried Bing cherries bring you the sweet taste of summer with every chewy bite. Add zing to an entree, brighten a salad or intensify a sauce. Their delicious, earthy flavor blends well with both sweet and savory dishes. Packed with powerful antioxidants, dried Bing cherries are a perfect snack and a popular ingredient in baking. Don't miss out on these little jewels!	1	pint	7.99	0.89	oz	Produce	Fruit & Veggie Snacks	http://goodeggs1.imgix.net/product_photos/ElfaMpi1RxqpeqmQElIv_FK1A9642.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	264	\N	\N	\N
319	Barhi Dates	Barhi dates are nature's caramel. Sensual, velvety, and buttercream-sweet, these dates will please more than any candy bar, ice cream, or pie.	8	oz	4.99	0.62	oz	Produce	Fruit & Veggie Snacks	http://goodeggs2.imgix.net/product_photos/ITBUZ3YDTKK4UEEd2BoJ_Good%20Eggs5415.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	392	\N	\N	\N
320	Organic Dried Apples	Bursting with flavor, these gently-dried organic apples are an excellent source of fiber and vitamins without any added sugar, preservatives or oils. With recipes for dried apples documented as far back as 1700 BC Mesopotamia, Peeled Snacks' Apple-2-The-Core® honors the storied tradition of preserving the sweet, subtly tart flavor of fresh apples so they can be enjoyed conveniently on the go.  An essential ingredient of Peeled Snacks’ ethos is building long lasting relationships with organic farms and suppliers. In supporting the organic food revolution, Peeled is committed to advancing fair labor and sustainable farming practices that encourage clean food production and healthy producer communities worldwide. \nIngredients: Organic Apples. 	2.8	oz	3.99	1.43	oz	Produce	Fruit & Veggie Snacks	http://goodeggs2.imgix.net/product_photos/NcUyD9FfRMCgsVv82VH3_20160713-Peeled_DriedApple_MG_5190.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
321	Lil' Apricots	Our sun dried ‘Lil Apricots have a mega sweet & tangy\nflavor. They are the Royal Blenheim variety which have a long history in\nCalifornia as the queens of apricots. The growers, Good Humus Produce, have been organic farming in Capay Valley since 1977 . We take their apricots, re-hydrate them to a chewy\ntexture and then cut them into bit-size bits. Great snack for kids of any age!\n\n\n\n\n\nAll of our products use ONLY organic ingredients. They are packaged in resealable, reusable zip bags for your convenience.	1.5	oz	2.99	1.99	oz	Produce	Fruit & Veggie Snacks	http://goodeggs2.imgix.net/product_photos/edDISDETRJCPKOkarZoC_20160421-YoloFarmstead_Apricots_MG_7599%202.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	222	\N	\N	\N
324	Flame Raisins	Our Flame Raisins are a seriously sweet and tasty bite. Large, moist and chewy, they add a delicious burst of fruit to your favorite muffin or raisin bread recipe. Perfect in all kinds of desserts and savory dishes. Flames are considered the sweetest of raisins. Go ahead and satisfy your candy cravings with this scrumptious, guilt-free snack!	1	pint	5.99	0.67	oz	Produce	Fruit & Veggie Snacks	http://goodeggs2.imgix.net/product_photos/sQ9MYohwTcmR584d8dVw_FK1A9600.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	344	\N	\N	\N
325	Raisins	Our Red Flame Raisins provide a natural energy booster anytime of the\n day. The plump and juicy Red Flame variety raisins are not coated in \nany oil, unlike most raisins on the market. Benzler Farms in Fresno, CA \nis a certified organic grower and are a third generation farm. All of our products use ONLY organic ingredients. They are packaged in resealable, reusable zip bags for your convenience.Ingredients: raisins.	16	oz	6.99	0.44	oz	Produce	Fruit & Veggie Snacks	http://goodeggs1.imgix.net/product_photos/2qJ9riOZQCSj0AiubEbs_FK1A3114.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	344	\N	\N	\N
326	Peachies - Bite-Size Sun Dried Peaches	Peachies are 'cut to bits' organic sun dried peaches grown by Annie & Jeff Main at Good Humus, certified organic growers in Capay Valley. They're not so pretty but man, are they sweet! They are a great morning or afternoon snack and the perfect complement to our raw almonds if you're looking for a protein/sweet combo. And bonus - they are kid tested so try them in their lunch or on your next visit to the playground! Absolutely \nnothing is added: no salt, no salt, no sugar.                                                                                                                                           All of our products use ONLY organic ingredients. They are packaged in resealable, reusable zip bags for your convenience.	1.5	oz	2.99	1.99	oz	Produce	Fruit & Veggie Snacks	http://goodeggs2.imgix.net/product_photos/8tzRjOq7Q32FSz2N6v3P_FK1A4676.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	210	\N	\N	\N
327	Khadrawi Dates	The Khadrawi Date is absolutely delicious! It's chewy and caramely with a very satisfying flavor. it would fit right in in a box of chocolates.	8	oz	5.99	0.75	oz	Produce	Fruit & Veggie Snacks	http://goodeggs2.imgix.net/product_photos/HNsxqiUrQA6vOmGxn7yv_20160912-KhadrawiDates_MG_0822.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	392	\N	\N	\N
328	Fresh Medjhool Dates	While the Medjhool may be the most common date variety grown commercially in California, the flavor of Flying Disc Ranch's Medjhool Dates is anything but common. These dates are large and pillowy. When freshly harvested and not fully dried, these dates have a huge amount of moisture left in them. If their skin breaks slightly and their sugars seep out a bit, they might form some crystallized sugars as they dry, which can sometimes be confused with mold, but are perfectly safe (and delicious!) to eat!	8	oz	6.99	0.87	oz	Produce	Fruit & Veggie Snacks	http://goodeggs2.imgix.net/product_photos/IlG40LCxRcWXD4dlQDvg_20161013-FlyingDisc_SoftMedjhoolDates_MG_3640.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	392	\N	\N	\N
330	Organic Raw Pecans	Our certified organic US grown pecans are raw for ultimate versatility in your favorite dishes and baked goods. Grind them to make nut butter and flour, or toast them and chop into cookies, salads, granola, pies, and more.Ingredients: pecans.Contains: tree nuts.	8	oz	7.99	15.98	lb	Produce	Dried Fruit & Nuts	http://goodeggs1.imgix.net/product_photos/Qw9wOpvtTSy3y11hQWHx_Good%20Eggs_111515-9.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	240	\N	\N	\N
331	Organic Unsalted Cashews	Equal Exchange works directly with co-operative farmers in India to bring you these sustainably farmed organic cashews. Founded in 2006, the 4,500 members of Fair Trade Alliance Kerala utilize Fair Trade premiums to improve their local community through initiatives that improve local school facilities, support clean drinking water programs, and protect both elephants and crops with elephant-friendly fencing. Ingredients: organic cashews. Contains: tree nuts (cashews).Packaged in a facility that also handles milk, peanuts, tree nuts, wheat and soy products.	8	oz	7.99	1.0	oz	Produce	Dried Fruit & Nuts	http://goodeggs1.imgix.net/product_photos/6lMxtYDDTw2pOexZ8XK0_20160909-EqualExchange_NaturalCashews_MG_0616.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	330	\N	\N	\N
332	Organic Almonds	Our certified organic California almonds are steam pasteurized to only the extent required by the FDA at our solar powered processing facility in Salinas county. A great snack on their own, or add roasted to your favorite recipes.Ingredients: organic almonds.Contains: tree nuts.	8	oz	7.49	14.98	lb	Produce	Dried Fruit & Nuts	http://goodeggs1.imgix.net/product_photos/whXL7kWnR46Z3iKaqKYV_FK1A9496.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	271	\N	\N	\N
333	Mediterranean Pine Nuts	Sunridge's premium quality pine nuts are sorted and lightly toasted at their solar powered facility in Salinas, CA. A great way to add crunch and buttery flavor to soups and salads, or as the base of your favorite pesto recipe! Product of Turkey.Ingredients: pine nuts.Contains: tree nuts.	4	oz	14.69	\N	\N	Produce	Dried Fruit & Nuts	http://goodeggs1.imgix.net/product_photos/78vNtKqxQNW29lhCDOdx_Good%20Eggs_111515-13.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	376	\N	\N	\N
334	Walnut Halves	These Chandler Walnut Halves from Yolo Farmstand are raw with absolutely nothing added: only their natural delicious flavor and creamy texture. Toast them for stuffing, cookies, cakes, and quickbreads, add them to your cheese plates and appetizer spreads, or eat them raw by the handful.Ingredients: Chandler walnuts.Contains: tree nuts.	16	oz	16.99	1.06	oz	Produce	Dried Fruit & Nuts	http://goodeggs2.imgix.net/product_photos/zbYVbNYLR4ge07j7ucXQ_FK1A7240.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	282	\N	\N	\N
335	Organic Raw Hazelnuts	Sunridge's raw Organic Hazelnut kernels are sourced from the Willamette Valley of Oregon, America's largest producing region of hazelnuts. These rich, flavorful nuts are ready to roast for snacking, grind into nut butter (or homemade Nutella!), chop into cookie, toss into salads, and more.Ingredients: organic hazelnuts.Contains: tree nuts.	8	oz	7.99	15.98	lb	Produce	Dried Fruit & Nuts	http://goodeggs1.imgix.net/product_photos/uVAHePgAT7irs7L0u7lz_Good%20Eggs_111515-10.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	375	\N	\N	\N
336	Organic Black Chia Seeds	An exceptional source of omega-3 fatty acids, protein, fiber, and nutrients, chia seeds are incredibly versatile and can be incorporate into many of your favorite recipes thanks to their mild flavor and texture. Try mixed into yogurt or smoothies for an extra boost, and even in salads when you desire a satisfying crunch. We particularly love them rehydrated in coconut water (although any liquid will do) for a hydrating pick me up. To rehydrate soak 1 part chia to 10 parts liquid and let sit for 10 minutes until consistency changes to a gel. Edison Grainery travels the world to identify and partner with transparent small scale producers committed to sustainable growing and fair labor practices. Having visited the source farms in person, they are excited to offer you these quality organic chia seeds from Mexico and Bolivia. Ingredients: Organic Black Chia Seeds. Processed in a dedicated gluten-free facility in Oakland, CA that also handles tree nuts.	16	oz	9.99	9.99	lb	Produce	Dried Fruit & Nuts	http://goodeggs2.imgix.net/product_photos/xNvrDVuQRuaTCBXxzxMw_20160520-Edison_ChaiSeeds_MG_0245.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	310	\N	\N	\N
337	Organic Golden Flaxseed	Similar nutritional value to brown flax, it’s used in the same ways as well. Be sure to grind the seeds so your body can benefit from the low-carb, high fiber, vitamins, minerals, and antioxidants. Get your flax straight. Golden Flax has the same benefits as Brown Flax and can be used in the same creative ways. Try it ground up orsprinkled on top of your breakfast cereal, yogurt or fresh fruit.Stuff to know:High in Omega 3 fatty acidsHigh in dietary fiberEat whole, sprouted or ground for optimal health benefits Country of Origin: USA	1	lb	3.99	3.99	lb	Produce	Dried Fruit & Nuts	http://goodeggs2.imgix.net/product_photos/KwueBRfqTFi2TL0tZ3gK_FK1A0232.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	260	\N	\N	\N
338	Hulled Hemp Seed Hearts	With a pleasant nut-like flavor and creamy texture, these raw hulled hulled hemp seeds are a nutritious and delightful addition to hot cereal and smoothies. Their light flavor allows them to blend easily into desserts, breads, pancakes, granola bars and other baked goods. Try them sprinkled on salads and blended into pilafs, you’ll find hemp seeds to be a delightful, nutritious enhancement to almost any dish.Hemp seeds are raw and are not toasted or salted. Because of their high oil content, hemp seeds should be stored in an airtight container in the fridge or freezer to keep fresh.Ingredients: hulled hemp seed. Manufactured in a facility that also uses tree nuts, soy, wheat & milk. 	12	oz	13.49	1.12	oz	Produce	Dried Fruit & Nuts	http://goodeggs2.imgix.net/product_photos/iLOEeiSFS1dpj5NQnTQT_20160803-BobsRedmill_HempSeedHearts_MG_7237.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	408	\N	\N	\N
339	Organic Spicy Raw Lemon Almonds	This Low-Glycemic snack is a divine spin on your everyday trail mix. Soaked in lemon and dehydrated at low temps for optimal digestion this spicy snack can get you through any hunger hurdles during a long day.Sprouted Almonds*, Lemon Juice*, Cayenne*, Himalayan Pink Salt	2	oz	5.99	3.0	oz	Produce	Dried Fruit & Nuts	http://goodeggs2.imgix.net/product_photos/9TFDoiWWRwIOwmCv1fCA_FK1A3779.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	374	\N	\N	\N
340	Toasted Almonds (3.5oz)	Our toasted almonds are incredibly flavorful. Eat just one? Forget it! Great to pair with variety of cheeses - sharp to soft! We use Carmel variety almonds & roast them at 350º just short of burning. This retains their oil for moisture but intensifies their flavor. There is nothing like it available anywhere.Our grower, Baugher Ranch \nOrganics, is a certified organic grower in Orland, CA. We use only \norganic ingredients in all our products.Our products are packaged in resealable, reusable zip bags for your convenience.	3.5	oz	4.99	1.43	oz	Produce	Dried Fruit & Nuts	http://goodeggs2.imgix.net/product_photos/s8U45iyNRAOSS5zWoNHr_FK1A8758.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	271	\N	\N	\N
341	Raw Almonds (7oz)	Our raw almonds are the nonpareil variety from the 2014 \nharvest, steam-pasteurized to retain maximum nutrients & \nflavor. They are a complete protein and simply good. Absolutely nothing \nis added: no salt, no oil, no sugar.Our grower, Baugher Ranch \nOrganics, is a certified organic grower in Orland, CA. We use only \norganic ingredients in all our products.Our products are packaged in resealable, reusable zip bags for your convenience.	7	oz	9.19	1.31	oz	Produce	Dried Fruit & Nuts	http://goodeggs2.imgix.net/product_photos/Fe7Fu0GpQgaAXCQmQag9_FK1A7204.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	271	\N	\N	\N
342	Roasted Almonds (7oz)	Our roasted almonds are the Carmel variety which are packed with \nflavor - slow roasted at 310 degrees - delicious alone or as the perfect\n complement to a wide variety of fruits & cheeses. They are a \ncomplete protein and simply good. Absolutely nothing is added: no salt, \nno oil, no sugar. Our grower, Baugher Ranch \nOrganics, is a certified organic grower in Orland, CA. We use only \norganic ingredients in all our products.Our products are packaged in resealable, reusable zip bags for your convenience.	7	oz	9.59	1.37	oz	Produce	Dried Fruit & Nuts	http://goodeggs1.imgix.net/product_photos/oOTSZDJcR6aRWWRQWPvS_FK1A7196.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	271	\N	\N	\N
343	Raw Almonds (16oz)	Our raw almonds are the nonpareil variety from the 2014 \nharvest, steam-pasteurized to retain maximum nutrients & \nflavor. They are a complete protein and simply good. Absolutely nothing \nis added: no salt, no oil, no sugar.Our grower, Baugher Ranch \nOrganics, is a certified organic grower in Orland, CA. We use only \norganic ingredients in all our products.Our products are packaged in resealable, reusable zip bags for your convenience.	16	oz	17.99	1.12	oz	Produce	Dried Fruit & Nuts	http://goodeggs2.imgix.net/product_photos/Fe7Fu0GpQgaAXCQmQag9_FK1A7204.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	271	\N	\N	\N
344	Roasted Walnuts	We've taken our creamy good, super natural chandler walnuts and slow roasted them at 300 degrees for 20 - 22 mins. This gives them a delicious, roasted crunch. Great for salads, over ice cream, with your with your favorite granola & bananas  or just plain out of the bag. Our walnuts are grown at Fillmore Farms, a certified organic grower near Gridley, CA.Ingredients: walnuts.Contains: tree nuts.	3.5	oz	5.49	1.57	oz	Produce	Dried Fruit & Nuts	http://goodeggs1.imgix.net/product_photos/m7BWeVeXSouJ7wNiPniQ_R_00NGJ3uGb2ehHPutsZNfNaXBm8o52H1zrIFJNSCPQ%2CY4x8sk2n2GQeoHNhKToaP5eub8MMC6mzEmPOQBUmZ6c.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	297	\N	\N	\N
345	Organic In Shell Chandler Walnuts	Old Dog Ranch proudly grows organic Chandler Walnuts, known for their large size and mild flavor, on a 5th generation family farm located in San Joaquin County. A durable variety favored amongst California farmers, the thin shells crack easily to reveal meaty nut halves inside. Ingredients: Organic Chandler Walnuts. Contains: Tree Nuts (Walnuts)	16	oz	6.99	0.44	oz	Produce	Dried Fruit & Nuts	http://goodeggs1.imgix.net/product_photos/xQgcbZbUTUe1NJVkmi5V_BsgDlLi1ROqI8R7cwTtJ_FK1A7459.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	297	\N	\N	\N
346	Transitional Organic Raw Walnut Halves	Old Dog Ranch grows Chandler Walnuts, a varietal of the English Walnut. These large and light colored nuts have a mild flavor and are high in Omega 3s. Sustainably grown in San Joaquin County on transitional land in the process of obtaining organic certification. Ingredients: Certified Transitional Walnuts. Contains: Tree Nuts (Walnuts).	16	oz	15.99	1.0	oz	Produce	Dried Fruit & Nuts	http://goodeggs1.imgix.net/product_photos/sJbggJTKSq2B8uovW8N6_FK1A0628.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	282	\N	\N	\N
347	Snack Pack (5 Bag Sampler)	The snack pack provides a delicious & different snack for every day of the week. The almonds are Carmel & nonpareil varieties, our plump and un-coated raisins are Red Flame, our walnuts are Chandler & Hartley and our sun-dried, sulfur-free peaches are mostly the heirloom Suncrest and O'Henry. Absolutely nothing is added: no salt, no oil, no sugar. Our products are packaged in resealable, reusable zip bags for your convenience.All of our products use ONLY organic ingredients.Includes one bag each of the following:Raw Almonds (2 oz)Roasted Almonds (2 oz)Two Mix (2.5 oz): Raisins & Raw AlmondsThree Mix (2.4 oz): Raisins, Raw Almonds & WalnutsFour Mix (2.2 oz): Raisins, Raw Almonds, Walnuts & Peaches	5	count	14.49	1.31	oz	Produce	Dried Fruit & Nuts	http://goodeggs1.imgix.net/product_photos/M9GsaYCOTBe7bnjnCpxk_FK1A7857.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	259	\N	\N	\N
354	Organic Pasture Raised Eggs (Large)	Mary's Organic Pasture Raised Chicken Eggs are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. The chickens are fed a healthy non-GMO verified, gluten-free, vegetarian diet and have continuous access to pasture where they can spread their wings and explore. There's no wrong way to enjoy these eggs: scrambled, fried, hard-boiled, baked into a frittata, or as a crucial baking ingredient for your favorite family recipes.	1	dozen	7.99	\N	\N	Dairy	T-Day Essentials	http://goodeggs2.imgix.net/product_photos/ynrbcfrSS16cvaYIRVuU_FK1A9532.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	285	\N	\N	\N
355	Organic Whole Milk	Straus Family Creamery sells their milk un-homogenized and quickly pasteurized (held at 171°F for 18 seconds) so that you can enjoy that deliciously creamy, farm-fresh flavor of minimally processed milk. Shake vigorously to emulsify the cream into the milk, or scoop it out with a teaspoon before anyone else gets to it—we won't tell. Non-GMO Project Verified, certified kosher and gluten-free.Recyclable, reusable glass bottles.Ingredients: Pasteurized Organic Milk.Contains: Milk.	1	half gallon	4.99	0.08	fl oz	Dairy	T-Day Essentials	http://goodeggs1.imgix.net/product_photos/az8cr19SNS7CqAp4G1sX_FK1A5733.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
356	Organic Egg Nog	A favorite for your holiday season, our old-fashioned Organic Eggnog is made with simple, organic ingredients and finished with a touch of organic nutmeg. No emulsifiers or thickeners are ever used in this rich, delicious blend of organic milk, organic cream, organic sugar and organic, pasteurized egg yolks. It's absolutely delicious and worth waiting all year for, since this seasonal product is only available in January.Recyclable, reusable glass bottles. Price includes $1.50 bottle deposit.Ingredients: Pasteurized Organic Milk, Organic Cream, Organic Cane Sugar, Organic Egg Yolk, Organic Nutmeg.Contains: Milk, egg.	1	quart	6.79	0.21	fl oz	Dairy	T-Day Essentials	http://goodeggs1.imgix.net/product_photos/EYta75dRTgu2ngY6noid_FK1A3326.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	244	\N	\N	\N
357	Briana with Truffles	Briana with Truffles is a semi-firm cheese, dense and easily sliced or melted. It's made with Italian truffle oil and black truffles throughout, enhancing its rich flavor with a deep, earthy funkiness. It's an American Cheese Society 2016 award-winner and a favorite here at Good Eggs. Add it to a cheese plate and watch it disappear! If you have any left, we strongly recommend using it for grilled cheese sandwiches or shaving it over a pan of mac'n'cheese.Ingredients: raw milk, cultures, salt, truffle paste (truffles, water, salt), truffle oil.Contains: milk.	8	oz	15.59	31.18	lb	Dairy	T-Day Essentials	http://goodeggs1.imgix.net/product_photos/WYFuqPwRE6ZkIkQL1mTQ_20161004-JacobsBrichford_BriancaTruffle_MG_2624.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	383	\N	\N	\N
358	McEvoy Olive Oil Ice Cream	You've never experienced an ice cream like this one. Smooth, velvety olive oil ice cream with a hint of citrus zest to set it off. Deliciously refreshing!Ingredients: olive oil, ice cream base (cream, nonfat milk, sugar, egg yolk, buttermilk), salt, orange zest.Contains: milk, eggs.	1	pint	9.99	0.62	oz	Dairy	T-Day Essentials	http://goodeggs1.imgix.net/product_photos/xQFOuoG4TW8BZ02gQrCw_20161103-HumphreySlocombe_McEvoysOiliveOil_MG_6095.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
359	Sea Salt Cultured Butter Basket	Vermont Creamery uses the freshest, highest-quality cream from their local St. Albans Cooperative, a co-op of family farms in Northeast Vermont. It's churned in small batches into a rich European-style butter with 86% butterfat content and a very low moisture content, making it perfect for pastry and cookies as it gives incredible flakiness and texture, or for high-temperature pan searing. Then coarse Celtic sea salt crystals are folded into the rich butter, giving it an unmatched texture and flavor. This butter is flavorful enough to set out on a cheese board, or to use as a main ingredient in sandwiches and tartines.Ingredients: pasteurized cream, sea salt, cultures.Contains: milk.	6	oz	6.99	18.64	lb	Dairy	T-Day Essentials	http://goodeggs2.imgix.net/product_photos/qpod2HiUQYOSGWbyjIHT_FK1A4567.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	407	\N	\N	\N
360	Crème Fraîche	Crème fraîche is an exquisitely rich cultured cows’ cream with a thick, creamy texture and a tart, slightly nutty flavor. Incredibly versatile, crème fraîche can be used as a base for dips and sauces, as an ingredient in baking, or as a simple topping for pies and soups. Unlike other cream based products, crème fraîche will not curdle over high heat or separate when mixed with wine or vinegar; it retains a rich, smooth texture and adds depth of flavor. It can also be whipped and sweetened for desserts. Ingredients: Pasteurized cows' cream, culture. contains dairy	8	oz	5.99	11.98	lb	Dairy	T-Day Essentials	http://goodeggs2.imgix.net/product_photos/LfmOQHhDRcyswpDkHUpa_FK1A4547.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	257	\N	\N	\N
363	Organic Whole Milk	Clover Organic Vitamin D Milk is creamy, fresh and sweet. It's rBST and antibiotic-free, and the dairy has been certified by the American Humane Association since 2000. Enjoy it by the glassful as a nutritious and delicious drink, or add it to your coffee, tea, baking projects and more.Ingredients: organic milk, vitamin D3.Contains: milk.	1	half gallon	4.49	0.07	fl oz	Dairy	Milk	http://goodeggs1.imgix.net/product_photos/zNv1C63zSVeKUREEH0Zj_FK1A9922.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
364	Organic Whole Milk	Clover Organic Farms sources its rBST and antibiotic-free milk and cream from a select group of small, organic family farms on the North Coast of California. Our milk and cream arrives at the plant the same day the cows are milked and it is fresh pasteurized to ensure quality while preserving its fresh farm taste and nutritional value. In 2000, we became the first U.S. dairy processor to be awarded the American Humane Certified label for humanely produced dairy products by the American Humane Association. We invite you to enjoy Clover Organic Farms Milk and Cream products in a good conscience and good health!OrganicrBST and antibiotic-freeFresh pasteurized to ensure the qualityGluten freeLow sodiumExcellent source of calciumIngredients: Organic grade A milk, vitamin D3	1	gallon	7.99	0.06	fl oz	Dairy	Milk	http://goodeggs2.imgix.net/product_photos/cV82b2TSTdO2azipp9v3_FK1A7554.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
365	Organic Whole Milk	Please note that this milk comes in plastic containers that can be recycled or reused. One gallon is 128 oz.Our Organic, Cream Top Whole Milk is the way it used to be, with the cream on the top. The cream in our organic milk floats naturally to the top because it non-homogenized.Straus Family Creamery Organic Whole Milk is pasteurized at 171°F for 18 seconds. Unlike most milk, which is ultra-pasteurized (at or above 280°F for at least two seconds), we preserve the true flavor of our cows’ diet.The pasture grasses our cows graze on tend to be sweeter out here in Northern California’s Marin and Sonoma County Coasts. The first thing you’ll notice when you pop the top of our cream-top milk is its beautiful aroma. Milk is supposed to have an aroma and a fresh taste. Enjoy!All of Straus Family Creamery’s certified organic milk products are Non-GMO Project Verified, certified kosher and gluten-free.Ingredients: Pasteurized Organic Milk.	1	gallon	8.49	0.07	fl oz	Dairy	Milk	http://goodeggs1.imgix.net/product_photos/F6IiAC6fQKm3RXweQWnt_FK1A5721.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
366	Organic Whole Milk	Our Organic, Cream Top Whole Milk is the way it used to be, with the cream on the top. The cream in our organic milk floats naturally to the top because it is non-homogenized.Straus Family Creamery Organic Whole Milk is pasteurized at 171°F for 18 seconds. Unlike most milk, which is ultra-pasteurized (at or above 280°F for at least two seconds), we preserve the true flavor of our cows’ diet.All of Straus Family Creamery’s certified organic milk products are Non-GMO Project Verified, certified kosher and gluten-free.Recyclable, reusable glass bottles.Ingredients: Pasteurized Organic Milk.	1	quart	3.29	0.1	fl oz	Dairy	Milk	http://goodeggs1.imgix.net/product_photos/P5r4upAZSdafhLe9vaIK_FK1A2603.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
367	Organic Whole Jersey Milk	The Jersey cows at Saint Benoît Creamery are outside year-round, grazing on their acres of pasture in Sonoma. Their diet is healthy and natural, yielding a milk that's rich and flavorful, with grassy and earthy notes that change with the seasons. High in protein, healthy fats, and naturally occurring vitamins A and D, this non-homogenized pasteurized milk is perfect for drinking by the glassful or adding to cream and coffee.Ingredients: organic milk.Contains: milk.	1	liter	3.99	0.12	fl oz	Dairy	Milk	http://goodeggs2.imgix.net/product_photos/C8dgCZu0Tqqv56JlN96X_FK1A5755.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
368	Whole Milk	Clover sources its rBST-free and anti-biotic-free milk and cream from a select group of small family farms on the North Coast of California. Our milk and cream arrive at the plant the same day the cows are milked and it is fresh pasteurized* to ensure quality while preserving its fresh farm taste and nutritional value. We do this so your family can enjoy Clover Milk and Cream products in a good conscience and good health!Ingredients:  Milk, vitamin D3 added	1	half gallon	2.49	0.04	fl oz	Dairy	Milk	http://goodeggs2.imgix.net/product_photos/kVup6FxcS6ySAjxVh6MI_20160422-Clover_HalfGallon_MilkWhole_MG_7831.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
369	Organic Eggnog	Our rich and creamy eggnog is perfect by itself, or as part of your favorite family recipe!Ingredients: Organic milk and organic cream, organic sugar, organic nonfat milk powder, organic egg yolks, organic tapioca starch, organic nutmeg, salt, carrageenan, organic natural flavor, organic annatto & organic turmeric (for color)	1	quart	5.99	0.19	fl oz	Dairy	Milk	http://goodeggs2.imgix.net/product_photos/e63ZHEeOQyCuFKAmCRkm_FK1A7095.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	305	\N	\N	\N
370	Organic Whole Raw Milk	OPDC raw milk is alive with fully active enzymes, a broad spectrum of\n naturally occurring beneficial bacteria, all 22 essential amino acids, \n18 good fatty acids, metabolically available vitamins, immunoglobulins, \nminerals, antioxidants, and CLA.The milk is never damaged or \nchanged by pasteurization, homogenization, or other processing. Organic \nPastures produces 100% USDA certified organic, Grade A, raw milk of \nsuper premium quality. USDA organic standards require that cows be pasture grazed just four months out of the year. OPDC goes far beyond this standard and grazes our cows on green pastures every day. In addition to green pastures, our cows are fed: a specially formulated organic mineral supplement, free choice salt and trace mineral blocks, high test organic alfalfa, and some sweet organic corn to keep them healthy and strong. A disease free life: a life with optimal health starts with a strong immune system - and raw milk is the finest immune system support food available.	1	quart	5.99	0.19	fl oz	Dairy	Milk	http://goodeggs1.imgix.net/product_photos/J6xDwjpQ6gHyZYmwKRwu_FK1A1943.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
371	Organic Whole Raw Milk	OPDC raw milk is alive with fully active enzymes, a broad spectrum of\n naturally occurring beneficial bacteria, all 22 essential amino acids, \n18 good fatty acids, metabolically available vitamins, immunoglobulins, \nminerals, antioxidants, and CLA.The milk is never damaged or \nchanged by pasteurization, homogenization, or other processing. Organic \nPastures produces 100% USDA certified organic, Grade A, raw milk of \nsuper premium quality. USDA organic standards require that cows be pasture grazed just four months out of the year. OPDC goes far beyond this standard and grazes our cows on green pastures every day. In addition to green pastures, our cows are fed: a specially formulated organic mineral supplement, free choice salt and trace mineral blocks, high test organic alfalfa, and some sweet organic corn to keep them healthy and strong. A disease free life: a life with optimal health starts with a strong immune system - and raw milk is the finest immune system support food available.	1	half gallon	9.99	0.16	fl oz	Dairy	Milk	http://goodeggs1.imgix.net/product_photos/0l2S1nG3TB6VlJhLuo6c_FK1A1924.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
372	Organic Whole Raw Milk	OPDC raw milk is alive with fully active enzymes, a broad spectrum of naturally occurring beneficial bacteria, all 22 essential amino acids, 18 good fatty acids, metabolically available vitamins, immunoglobulins, minerals, antioxidants, and CLA.The milk is never damaged or changed by pasteurization, homogenization, or other processing. Organic Pastures produces 100% USDA certified organic, Grade A, raw milk of super premium quality. USDA organic standards require that cows be pasture grazed just four months out of the year. OPDC goes far beyond this standard and grazes our cows on green pastures every day. In addition to green pastures, our cows are fed: a specially formulated organic mineral supplement, free choice salt and trace mineral blocks, high test organic alfalfa, and some sweet organic corn to keep them healthy and strong. A disease free life: a life with optimal health starts with a strong immune system - and raw milk is the finest immune system support food available.	1	gallon	17.99	0.14	fl oz	Dairy	Milk	http://goodeggs2.imgix.net/product_photos/OQ5xJ8nNSKW99lscb2NR_FK1A1913.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
373	Organic 2% Reduced Fat Milk	Clover Organic Farms sources its rBST and antibiotic-free milk and cream from a select group of small, organic family farms on the North Coast of California. Our milk and cream arrives at the plant the same day the cows are milked and it is fresh pasteurized* to ensure quality while preserving its fresh farm taste and nutritional value. In 2000, we became the first U.S. dairy processor to be awarded the American Humane Certified label for humanely produced dairy products by the American Humane Association. We invite you to enjoy Clover Organic Farms Milk and Cream products in a good conscience and good health!OrganicrBST and antibiotic-freeFresh pasteurized to ensure the qualityGluten freeLow sodiumExcellent source of calciumIngredients:  Certified organic grade A reduced fat milk, certified organic nonfat dry milk, vitamin A palmitate, vitamin D3	1	half gallon	4.49	0.07	fl oz	Dairy	Milk	http://goodeggs1.imgix.net/product_photos/J35OVXygQgaO8P5e73qT_FK1A9909.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
374	Organic 2% Reduced Fat Milk	Clover Organic Farms sources its rBST and antibiotic-free milk and cream from a select group of small, organic family farms on the North Coast of California. Our milk and cream arrives at the plant the same day the cows are milked and it is fresh pasteurized to ensure quality while preserving its fresh farm taste and nutritional value. In 2000, we became the first U.S. dairy processor to be awarded the American Humane Certified label for humanely produced dairy products by the American Humane Association. We invite you to enjoy Clover Organic Farms Milk and Cream products in a good conscience and good health!OrganicrBST and antibiotic-freeFresh pasteurized to ensure the qualityGluten freeLow sodiumExcellent source of calciumIngredients:  Certified organic grade A reduced fat milk, certified organic nonfat dry milk, vitamin A palmitate, vitamin D3	1	gallon	7.99	0.06	fl oz	Dairy	Milk	http://goodeggs1.imgix.net/product_photos/ZPr0RMbqS0WodT0eJIBQ_FK1A9932.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
375	Organic 2% Reduced Fat Milk	The cream floats to the top, just like in our Organic Whole Milk.Our Organic, Cream Top 2% Reduced Fat milk is pasteurized at 171°F for 18 seconds. Unlike most milk, which is ultra-pasteurized (at or above 280°F for at least two seconds), we preserve the true flavor of milk that results from our cows’ diet.The pasture grasses our cows graze on tend to be sweeter out here in Northern California’s Marin and Sonoma County Coasts. The first thing you’ll notice when you pop the top of our cream-top milk is its beautiful aroma. Milk is supposed to have an aroma and a fresh taste. Enjoy!Ingredients: Pasteurized Organic Reduced Fat Milk, Vitamin A Palmitate.	1	half gallon	4.99	0.08	fl oz	Dairy	Milk	http://goodeggs1.imgix.net/product_photos/fG4sVGJ9SxyGB0GGQ2o7_FK1A5738.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
376	2% Reduced Fat Milk	Clover sources its rBST and anti-biotic-free milk and cream from a select group of small family farms on the North Coast of California. Our milk and cream arrive at the plant the same day the cows are milked and it is fresh pasteurized* to ensure quality while preserving its fresh farm taste and nutritional value. We do this so your family can enjoy Clover Milk and Cream products in a good conscience and good health!Ingredients: Milk, nonfat milk, vitamin A palmitate, vitamin D3	1	half gallon	2.49	0.04	fl oz	Dairy	Milk	http://goodeggs2.imgix.net/product_photos/CG8lzeDSLKVz7A0K6b9A_20160422-Clover_HalfGallon_2percentMilk_MG_7830.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
390	Organic Raw Cream	OPDC Raw Cream is skimmed from the rich raw milk. This incredibly delicious raw cream provides all of the benefits found in raw milk and raw butter, but can be made into whipped cream or raw ice cream, and is ideal for pouring over fruit or cereal. Raw cream is perfect for culturing into crème fraîche or sour cream and makes the most delicious cream cheese you have ever tasted!	1	pint	12.79	0.8	fl oz	Dairy	Cream	http://goodeggs2.imgix.net/product_photos/Pxy6t0WZQCqLNa3PVTvB_FK1A5460.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
377	Organic 1% Low Fat Milk	Clover Organic Farms sources its rBST and antibiotic-free milk and cream from a select group of small, organic family farms on the North Coast of California. Our milk and cream arrives at the plant the same day the cows are milked and it is fresh pasteurized to ensure quality while preserving its fresh farm taste and nutritional value. In 2000, we became the first U.S. dairy processor to be awarded the American Humane Certified label for humanely produced dairy products by the American Humane Association. We invite you to enjoy Clover Organic Farms Milk and Cream products in a good conscience and good health!OrganicrBST and antibiotic-freeFresh pasteurized to ensure the qualityGluten freeLow fatExcellent source of calciumGood for reduced calorie dietsIngredients: Certified organic grade A low fat milk, certified organic nonfat dry milk, vitamin A palmitate, vitamin D3Contains Dairy	1	half gallon	4.49	0.07	fl oz	Dairy	Milk	http://goodeggs1.imgix.net/product_photos/nGGvW18IQzqgQgA7YT78_FK1A9914.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
378	Organic 1% Low Fat Milk	Clover Organic Farms sources its rBST and antibiotic-free milk and cream from a select group of small, organic family farms on the North Coast of California. Our milk and cream arrives at the plant the same day the cows are milked and it is fresh pasteurized to ensure quality while preserving its fresh farm taste and nutritional value. In 2000, we became the first U.S. dairy processor to be awarded the American Humane Certified label for humanely produced dairy products by the American Humane Association. We invite you to enjoy Clover Organic Farms Milk and Cream products in a good conscience and good health!OrganicrBST and antibiotic-freeFresh pasteurized to ensure the qualityGluten freeLow fatExcellent source of calciumGood for reduced calorie dietsIngredients: Certified organic grade A low fat milk, certified organic nonfat dry milk, vitamin A palmitate, vitamin D3Contains Dairy	1	gallon	7.99	0.06	fl oz	Dairy	Milk	http://goodeggs1.imgix.net/product_photos/048Dyg4T9yHfWaRMIuXT_FK1A9928.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
379	Low Fat Chocolate Milk	"This is a new product and we’re excited about it because-- well who doesn't love chocolate milk?" Erin, Good Eggs Buyer.Clover sources its rBST and anti-biotic-free milk and cream from a select group of small family farms on the North Coast of California. Our milk and cream arrive at the plant the same day the cows are milked and it is fresh pasteurized* to ensure quality while preserving its fresh farm taste and nutritional value. We do this so your family can enjoy Clover Milk and Cream products in a good conscience and good health!Ingredients:  Nonfat Milk, Milk Evaporated Cane Juice, Cocoa (Processed with Alkali), Corn Starch, Salt, Carrageenan, Guar gum, Vanilla, Vitamin A Palmitate, and Vitamin D3.	1	half gallon	3.99	0.06	fl oz	Dairy	Milk	http://goodeggs1.imgix.net/product_photos/Q6Gng6mkQWYlS7dfTAwu_20160422-Clover_HalfGallon_ChocolatetMilk_MG_7842.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
380	Organic 1%  Lowfat Milk	The only Organic 1% Lowfat Milk available with cream on top!Our Organic, Cream Top Lowfat milk is pasteurized at 171°F for 18 seconds. Unlike most milk, which is ultra-pasteurized (at or above 280°F for at least two seconds), we preserve the true flavor of milk that results from our cows’ diet.The pasture grasses our cows graze on tend to be sweeter out here in Northern California’s Marin and Sonoma County Coasts. The first thing you’ll notice when you pop the top of our cream-top milk is its beautiful aroma. Milk is supposed to have an aroma and a fresh taste. Enjoy!Ingredients: Pasteurized Organic Lowfat Milk, Vitamin A Palmitate.	1	half gallon	4.99	0.08	fl oz	Dairy	Milk	http://goodeggs1.imgix.net/product_photos/0XqeB1kGTv6BucEaJvHI_FK1A5736.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
381	1% Low Fat Milk	Clover sources its rBST and anti-biotic-free milk and cream from a select group of small family farms on the North Coast of California. Our milk and cream arrive at the plant the same day the cows are milked and it is fresh pasteurized* to ensure quality while preserving its fresh farm taste and nutritional value. We do this so your family can enjoy Clover Milk and Cream products in a good conscience and good health!Ingredients:  Nonfat milk, milk, vitamin A palmitate, vitamin D3	1	half gallon	2.49	0.04	fl oz	Dairy	Milk	http://goodeggs1.imgix.net/product_photos/ouhvVn2ET8WHH5lOvNj7_20160422-Clover_HalfGallon_1percentMilk_MG_7828.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
382	Organic Nonfat Milk	Please note that this milk comes in plastic containers that can be recycled or reused. One gallon is 128 ounces.Most people agree that our Organic Nonfat Milk is sweeter and richer than any skim milk they've ever tasted. It's the skim milk with the full-bodied flavor of low fat milk.Our Organic Nonfat Milk is pasteurized at 171°F for 18 seconds. Unlike most milk, which is ultra-pasteurized (at or above 280°F for at least two seconds), we preserve the true flavor of milk that results from our cows’ diet.The pasture grasses our cows graze on tend to be sweeter out here in Northern California’s Marin and Sonoma County Coasts. The first thing you’ll notice when you pop the top of our cream-top milk is its beautiful aroma. Milk is supposed to have an aroma and a fresh taste. Enjoy!All of Straus Family Creamery’s certified organic milk products are Non-GMO Project Verified, certified kosher and gluten-free.Ingredients: Pasteurized Nonfat Milk, Vitamin A Palmitate.	1	gallon	8.49	0.07	fl oz	Dairy	Milk	http://goodeggs2.imgix.net/product_photos/oE1WF6EOQjuOHQIZ7o7J_FK1A1809.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
383	Organic Nonfat Milk	Most people agree that our Organic Nonfat Milk is sweeter and richer than any skim milk they've ever tasted. It's the skim milk with the full-bodied flavor of low fat milk.Our Organic Nonfat Milk is pasteurized at 171°F for 18 seconds. Unlike most milk, which is ultra-pasteurized (at or above 280°F for at least two seconds), we preserve the true flavor of milk that results from our cows’ diet.All of Straus Family Creamery’s certified organic milk products are Non-GMO Project Verified, certified kosher and gluten-free.Recyclable, reusable glass bottles.Ingredients: Pasteurized Nonfat Milk, Vitamin A Palmitate.	1	half gallon	4.99	0.08	fl oz	Dairy	Milk	http://goodeggs1.imgix.net/product_photos/0C62QH2wTziKGBP3r3YD_FK1A5740.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
384	100% Sheep's Milk	"Haverton is the only sheep dairy on the West Coast to bottle their sheep milk! This mild milk will have you fighting for the layer of creamy fat at the top of the bottle!" - Erin, BuyerTastes great and is good for you! Sheep’s milk is naturally homogenized, easily digestible and is the perfect alternative for people with lactose intolerance.  Containing almost double the protein and calcium compared to cows milk. Sheep’s milk is high in mono and poly unsaturated fats, and contains substantial amounts of vitamins A, D, E, B12, Folic acid and minerals like zinc, magnesium and phosphorous.  All this plus a mild, creamy flavor make Haverton Hill 100% Sheep’s Milk the healthy choice.Our milk is provided in glass bottles that are re-usable with BPA free tamper evident caps.  Our glass bottles are odor free, providing you with farm fresh cold milk. Not only is our milk nutritious but we are environmentally friendly too.	1	quart	9.29	0.29	fl oz	Dairy	Milk	http://goodeggs1.imgix.net/product_photos/EgHwYlfqQXTM9Jf1qS4Q_FK1A8300.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
392	Organic Cage Free Brown Eggs (Large)	Many of our customers have expressed a desire for cage-free eggs. After careful consideration and in collaboration with our producer community, we have chosen to offer organic, cage-free eggs from Glaum Egg Ranch in Aptos, CA—just south of Santa Cruz.  Glaum goes beyond the letter of the law when it comes to their layers.  These birds have outdoor access from both ends of the barn, constant access to organic feed and water, and space within the barn to spread their wings, scratch and dust bathe. The sides of the barns are screened and can be opened to allow in natural sunlight and the fresh sea breeze.A true family business, Glaum has been far ahead of the game for generations (four, to be precise) when it comes to cage-free eggs and sustainable ranching. They are the first egg ranch in California to be Certified Humane by Humane Farm Animal Care, and have produced zero manure waste since 1988. Glaum is also a member of CAAF (Community Alliance with Family Farmers), and certified organic by the USDA National Organic Program, and are well regarded within the egg producing community, even coming at the recommendation of some of our current egg producers.Follow this link to check out a video of Glaum's organic layers in action: https://www.youtube.com/watch?v=VSyxtcsSaNc&feature=youtu.beClick here to learn more about egg labeling standards	1	dozen	5.49	\N	\N	Dairy	Eggs	http://goodeggs2.imgix.net/product_photos/tFaJ9FjFS2mbP2mtXCX7_20160708-Glaum_DozenEggsMG_4926.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	285	\N	\N	\N
393	Pasture Raised Eggs (Large)	Living out in the pasture, our hens are free to explore, chase bugs and snack on hearty green grasses. Three times a day, we serve them freshly mixed non-GMO feed. In the their spacious mobile coops, they lay beautiful eggs and roost for the evening."Appreciate Nature's Perfection"	1	dozen	8.29	\N	\N	Dairy	Eggs	http://goodeggs2.imgix.net/product_photos/fCQYz1HcSKeqWItobqnU_FK1A9515.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	285	\N	\N	\N
394	Organic Soy Free Pasture Raised  Eggs (Large)	These eggs are from our pasture-raised, roaming hens.  In addition to the bugs and vegetables in our fields, these hens eat a certified organic feedstock free of soy, herbal tonics, lacto-fermented dairy and grains.  Our attention to detail and natural low-stress environment produces a flock of happy hens and healthy eggs.  Please visit our website to understand more about how our hens and crops function in an integrated agricultural system.This special flock of soy-free hens was inspired by our CSA members with severe soy allergies or other concerns about soy.	1	dozen	9.99	\N	\N	Dairy	Eggs	http://goodeggs1.imgix.net/product_photos/UZYjRSnQaG4Zb7b6BTAv_FK1A0962.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	285	\N	\N	\N
395	Organic Pasture Raised Eggs (Medium)	Coastal Hill Farm eggs are as natural as can be.  The hens are allowed to feed on grasses, insects, and seeds, as well as given ample feed and space. These conditions make our birds comfortable and happy, which is reflected in their eggs.  Typically, the good cholesterol and omega-3 fatty acid levels are higher in chickens that are allowed to feed on greens such as grasses.Local Certified Organic Pasture Raised EggsCoastal Hill Farm, PetalumaMedium Grade AA, one dozen eggsCertified Organic by MOCA	1	dozen	8.79	\N	\N	Dairy	Eggs	http://goodeggs1.imgix.net/product_photos/G1kQkvASruj6LpXUE41m_FK1A9561.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	285	\N	\N	\N
396	Organic Pasture Raised Eggs (Large)	Hands down some of the best eggs we've ever tasted, these hens are part of a multi-species rotational grazing system, moving twice every week onto fresh green grass all year round. "5-egg" ranking from the Cornucopia Institute, certified organic, and really, really delicious! Read more about Alexandre Kids eggs here!All of the hens are raised on organic pastures under the watchful eyes of the Alexandre dairy cows and Great Pyrenees guard dogs. The hens graze on green, lush organic grass and have room to roam in the fresh coastal air and sunshine. They intermingle with the dairy cows and enjoy a natural farm life setting where they can produce the most nutritious organic eggs. Hens are housed in mobile “egg-mobiles,” designed and constructed by the Alexandre Family. The “egg-mobiles” are moved to new areas of pasture twice a week so the pasture gets desired fertilizer and to prevent overgrazing. The chickens eat certified organic feeds; irrigated dairy pastures consisting of 50 to 100 variety of plant species ranging from grasses, forbs, herbs and clovers; oyster shell, with limited daily feeding of mixture of organic grains and minerals. We never add any chemicals, hormones or antibiotics. Collected eggs are processed daily at the Alexandre Kids egg ranch.	1	dozen	8.99	\N	\N	Dairy	Eggs	http://goodeggs1.imgix.net/product_photos/PGDjEUTQzaCYRQd8Cxjr_20160908-AlexanderKids_DozenEggs_MG_0398.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	285	\N	\N	\N
397	Pasture Raised Eggs (Medium)	Living out in the pasture, our hens are free to explore, chase bugs and snack on hearty green grasses. Three times a day, we serve them freshly mixed non-GMO feed. In the their spacious mobile coops, they lay beautiful eggs and roost for the evening."Appreciate Nature's Perfection"	1	dozen	6.79	\N	\N	Dairy	Eggs	http://goodeggs2.imgix.net/product_photos/C6bRX2pBRvtnzV6s1gYw_FK1A9548.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	285	\N	\N	\N
398	Soy Free Pasture Raised Eggs (Medium)	These eggs come to you from Lost Marbles Ranch via the Capay Valley Farmshop.Lost Marbles RanchHi, My name is Lora Murray. Along with my husband I run a small farm playfully named Lost Marbles Ranch near Capay, northern Yolo County. My chickens are free range on irrigated pasture that has no herbicieds, pesticides or fertilizers applied. The feed they are given is GMO and soy free. I get many compliments on their eggs at farmers markets, I hope you enjoy them as well. Feel free to visit the Lost Marbles Ranch Facebook page. Thank you!	1	dozen	6.99	\N	\N	Dairy	Eggs	http://goodeggs2.imgix.net/product_photos/w79bZoLKRea6wg2yWd1N_FK1A7612.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	285	\N	\N	\N
399	Organic Pasture Raised Eggs (Large)	Mary's Organic Pasture Raised Chicken Eggs are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. The chickens are fed a healthy non-GMO verified, gluten-free, vegetarian diet and have continuous access to pasture where they can spread their wings and explore. There's no wrong way to enjoy these eggs: scrambled, fried, hard-boiled, baked into a frittata, or as a crucial baking ingredient for your favorite family recipes.	1	half dozen	4.29	\N	\N	Dairy	Eggs	http://goodeggs2.imgix.net/product_photos/LyhxSQURQGmIl1SpPADG_FK1A9403.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	285	\N	\N	\N
400	Pasture Raised Eggs (Large)	Living out in the pasture, our hens are free to explore, chase bugs and snack on hearty green grasses. Three times a day, we serve them freshly mixed non-GMO feed. In the their spacious mobile coops, they lay beautiful eggs and roost for the evening."Appreciate Nature's Perfection"	1	half dozen	4.29	\N	\N	Dairy	Eggs	http://goodeggs1.imgix.net/product_photos/UTAVlvPR4uSi2ygCiKyQ_FK1A9589.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	285	\N	\N	\N
401	Organic Pasture Raised Eggs (Jumbo)	Alexandre Kids Organic Pasture Raised Large Eggs- from Alexandre Family EcoDairy Farms, Crescent City, CAHands down some of the best eggs we've ever tasted, these hens are part of a multi-species rotational grazing system, moving twice every week onto fresh green grass all year round. "5-egg" ranking from the Cornucopia Institute, certified organic, and really, really delicious! Read more about Alexandre Kids eggs here!All of the hens are raised on organic pastures under the watchful eyes of the Alexandre dairy cows and Great Pyrenees guard dogs. The hens graze on green, lush organic grass and have room to roam in the fresh coastal air and sunshine. They intermingle with the dairy cows and enjoy a natural farm life setting where they can produce the most nutritious organic eggs. Hens are housed in mobile “egg-mobiles,” designed and constructed by the Alexandre Family. The “egg-mobiles” are moved to new areas of pasture twice a week so the pasture gets desired fertilizer and to prevent overgrazing. Our chickens eat certified organic feeds; irrigated dairy pastures consisting of 50 to 100 variety of plant species ranging from grasses, forbs, herbs and clovers; oyster shell, with limited daily feeding of mixture of organic grains and minerals. We never add any chemicals, hormones or antibiotics. Collected eggs are processed daily at the Alexandre Kids egg ranch.	1	half dozen	4.99	\N	\N	Dairy	Eggs	http://goodeggs1.imgix.net/product_photos/fQWhXRbyQBWakK5i5fOe_20160908-AlexanderKids_HalfDozenEggs_MG_0405.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	285	\N	\N	\N
402	Organic Soy Free Pasture Raised Eggs (Large)	These eggs are from our pasture-raised, roaming hens.  In addition to the bugs and vegetables in our fields, these hens eat a certified organic feedstock free of soy, herbal tonics, lacto-fermented dairy and grains.  Our attention to detail and natural low-stress environment produces a flock of happy hens and healthy eggs.  Please visit our website to understand more about how our hens and crops function in an integrated agricultural system.This special flock of soy-free hens was inspired by our CSA members with severe soy allergies or other concerns about soy.	1	half dozen	5.79	\N	\N	Dairy	Eggs	http://goodeggs2.imgix.net/product_photos/iRSF1OVSY2n2QX4MYLLw_FK1A0985.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	285	\N	\N	\N
403	Pasture Raised Eggs (Small)	Four times a year we have a new flock start laying.  These new eggs are fabulous for baking.Living out in the pasture, our hens are free to explore, chase bugs and snack on hearty green grasses. Three times a day, we serve them freshly mixed non-GMO feed. In the their spacious mobile coops, they lay beautiful eggs and roost for the evening."Appreciate Nature's Perfection"	1	dozen	4.99	\N	\N	Dairy	Eggs	http://goodeggs1.imgix.net/product_photos/zVxD6q68QfxPX2w8n4Cw_FK1A9542.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	285	\N	\N	\N
404	Basket Staples: Milk and Eggs	You buy them every week, now get them in one click! Our Milk and Eggs Bundle contains:Organic whole milk from Straus Family Creamery, 1 half gallonPastured large eggs from St. John Family Farm, 1 dozen	1	count	14.29	\N	\N	Dairy	Eggs	http://goodeggs1.imgix.net/product_photos/441mf2yHQYicDSuAE67K_FK1A9218.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	407	\N	\N	\N
405	Extra Large Pasture Raised Duck Eggs	Enjoy extra large duck eggs with deep orange yolks from hens that forage freely on certified organic pasture and swim in a half acre pond in Marin County's beautiful Chileno Valley.	1	half dozen	6.99	\N	\N	Dairy	Eggs	http://goodeggs2.imgix.net/product_photos/iw5HWatTaWX65HZMIU63_UvavzzUSBScOQlsnTQEJ_tNu5XNYvAwrhcs0xAiKVqF6P_iQ_q1fDuli-9R8UlLY.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	326	\N	\N	\N
406	Large Pasture Raised Duck Eggs	Enjoy large duck eggs with deep orange yolks from hens that forage freely on certified organic pasture and swim in a half acre pond in Marin County's beautiful Chileno Valley.	1	dozen	9.99	\N	\N	Dairy	Eggs	http://goodeggs1.imgix.net/product_photos/PiCEWIRx2HSWI3KA3rkA_FK1A8467.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	326	\N	\N	\N
407	Duck Eggs	These delicious duck eggs come from Salmon Creek Ranch and are certified organic.  No hormones, GMO's, antibiotics or other additives are used, ever!  Salmon Creek Ranch ducks are free-ranging, cage-free and pasture raised!	1	dozen	10.99	\N	\N	Dairy	Eggs	http://goodeggs2.imgix.net/product_photos/OzI6AEXfQkW957MWETQt_PiCEWIRx2HSWI3KA3rkA_FK1A8467.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	326	\N	\N	\N
408	Extra Large Pasture Raised Duck Eggs	Enjoy extra large duck eggs with deep orange yolks from hens that forage freely on certified organic pasture and swim in a half acre pond in Marin County's beautiful Chileno Valley.	1	dozen	10.99	\N	\N	Dairy	Eggs	http://goodeggs1.imgix.net/product_photos/PtBwwUNDSiiZqEKJW61H_1lPc526NtLGqGFVBhRWPESWQzGippCn8DoGsNujePqg.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	326	\N	\N	\N
409	Jumbo Pasture Raised  Duck Eggs	Enjoy jumbo duck eggs with deep orange yolks from hens that forage freely on certified organic pasture and swim in a half acre pond in Marin County's beautiful Chileno Valley.	1	dozen	12.99	\N	\N	Dairy	Eggs	http://goodeggs1.imgix.net/product_photos/2osOtfwhQBmBFOtQ2lAz_PtBwwUNDSiiZqEKJW61H_1lPc526NtLGqGFVBhRWPESWQzGippCn8DoGsNujePqg.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	326	\N	\N	\N
410	Organic Plain Whole Milk Yogurt	Our Organic, Plain Whole-Milk Yogurt is smooth, tart and creamy.  And, it’s our bestseller.Made only with Organic Whole Milk and live cultures. No thickeners or additives are used, yet the consistency is so smooth it pours beautifully out of the container. It’s a great choice for breakfast cereals, for smoothies or as a substitute for sour cream.All Straus Family Creamery’s certified organic yogurts are Non-GMO Project Verified, certified kosher and gluten-free.Ingredients: Pasteurized Organic Whole Milk, Organic Sweet Cream Buttermilk, Living Yogurt Cultures.	32	oz	5.29	0.17	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/hK3rJY6rRPyAPtKNpWOy_FK1A5708.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
411	Organic Vanilla Whole Milk Yogurt	Smooth and creamy with a pure, delicious vanilla taste.Made with Organic Whole Milk, live cultures, organic cane sugar and organic vanilla. These simple ingredients combine to make the most delicious organic vanilla yogurt you’ll ever taste!  It’s creamy, smooth and it pours right out of the container.All Straus Family Creamery’s certified organic yogurts are Non-GMO Project Verified, certified kosher and gluten-free.Ingredients: Pasteurized Organic Whole Milk, Organic Cane Sugar, Organic Sweet Cream Buttermilk, Organic Vanilla Extract, Living Yogurt Cultures.	32	oz	5.29	0.17	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/NIag4ELtT56TwJlD3AjM_FK1A5697.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
412	Organic French-Style Plain Yogurt	We use wholesome pasture-fed organic cow's milk from John Mattos’ family farm in Two Rock (near Petaluma) in Sonoma county. Our Yogurt culture comes from France where it has been used for decades to produce sweet, mild and smooth yogurts. Unlike most producers, we add no thickeners, stabilizers or preservatives. Just milk and culture, that’s it!Ingredients: Whole Organic Jersey Milk, Living Cultures. 	23	oz	7.49	0.33	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/QwXNXh0rTZOsXm1ybxXK_032116_GoodEggs-4737.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
413	Organic French-Style Meyer Lemon Yogurt	We use wholesome pasture-fed organic cow's milk from John Mattos’ family farm in Two Rock (near Petaluma) in Sonoma county. We use local jams for our fruit-at-the-bottom flavors. They come from farms in Sonoma county that grow the fruit organically and make the jam by hand.  Our Yogurt culture comes from France where it has been used for decades to produce sweet, mild and smooth yogurts. Unlike most producers, we add no thickeners, stabilizers or preservatives. Just milk and culture, that’s it!Ingredients: Whole Organic Jersey Milk, Meyer Lemon Spread (Organic Meyer Lemon, Organic Sugar), Living Cultures. 	23	oz	7.49	0.33	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/YijASihRST6t3GcOe2Nr_FK1A4734.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	374	\N	\N	\N
414	Organic French-Style Vanilla Yogurt	We use wholesome pasture-fed organic cow's milk from John Mattos’ family farm in Two Rock (near Petaluma) in Sonoma county. Our Yogurt culture comes from France where it has been used for decades to produce sweet, mild and smooth yogurts. Unlike most producers, we add no thickeners, stabilizers or preservatives. Just milk and culture, that’s it!Ingredients: Whole Organic Jersey Milk, Organic Vanilla Sauce (Organic Cane Sugar, Organic Milk, Organic Vanilla Beans), Living Cultures.	23	oz	7.49	0.33	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/9kcLNRsmR0iJHbI7ybyM_032116_GoodEggs-4741.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
415	Organic Plain Nonfat Yogurt	This Organic, Plain Nonfat Yogurt is made from Organic Nonfat Milk and live cultures.No thickeners or additives are used, yet the consistency is so smooth it pours beautifully out of the container. It is great in smoothies, on cereals or as a substitute for sour cream. This is our bestselling nonfat yogurt.All Straus Family Creamery’s certified organic yogurts are Non-GMO Project Verified, certified kosher and gluten-free.Ingredients: Pasteurized Organic Nonfat Milk, Organic Sweet Cream Buttermilk, Living Yogurt Cultures.	32	oz	5.29	0.17	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/k8yDztaqQPyE6j9HFMxp_FK1A5693.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
416	Organic Whole Greek Yogurt	Just two simple ingredients go into our yogurt: organic milk and live, active cultures. Rich, creamy and packed with probiotic goodness, our Greek yogurt is unforgettable. Our cows graze on pasture grass on the beautiful hillsides of Marin and Sonoma Counties in the coastal region of Northern California, for a difference you can taste. Our organic Greek yogurt is certified kosher, gluten-free and is the only Non-GMO Project Verified organic Greek yogurt on the market.Ingredients: Pasteurized organic whole milk, live yogurt cultures.	32	oz	7.99	0.25	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/VpCXMmPCQfKlMmEG0ObN_FK1A5703.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
417	Organic Nonfat Greek Yogurt	Enjoy an extra $1.00 off Straus Organic Nonfat Greek Yogurt for the month of October!Just two simple ingredients go into our yogurt: organic milk and live, active cultures. Rich, creamy and packed with probiotic goodness, our Greek yogurt is unforgettable. Our cows graze on pasture grass on the beautiful hillsides of Marin and Sonoma Counties in the coastal region of Northern California, for a difference you can taste. Our organic Greek yogurt is certified kosher, gluten-free and is the only Non-GMO Project Verified organic Greek yogurt on the market.Ingredients: Pasteurized organic nonfat milk, live yogurt cultures.	32	oz	7.99	0.25	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/9ZxocAGVSc2G6V6wJLfl_FK1A5711.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
418	Organic Nonfat  Plain Greek Yogurt	Crafted with the perfect balance of creaminess and tang, our Plain Greek Yogurt is anything but plain. Starring fresh Clover Organic Nonfat Milk direct from the happy cows on our family-owned dairy farms, this thick, rich yogurt has a luxurious mouth-feel and texture perfect in its pure form, or used to enhance other foods.We think that if you can't make it right, you shouldn't make it at all. And we've found a way to make it right: in our organic, authentically strained Greek yogurt, with nonfat milk and 22 grams of protein per serving. For decades we've partnered with a handful of humane, family-owned farms where the cows are raised in open pastures to produce our organic milk. Clo even gave her approval. Ingredients: Cultured Organic Pasteurized Nonfat Grade A Milk. Live cultures: Lactobacillus bulgaricus, Streptococcus thermophilus, Lactobacillus acidophilus, Bifidus, Lactobacillus casei.	32	oz	8.29	0.26	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/iwAvZoCdRlS1x4H9vEHp_FK1A0485.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
419	Organic Plain Lowfat Greek Yogurt	These lowfat Greek yogurts are authentically strained, rich in protein, and made with premium organic ingredients. In addition to straining, a traditional, unhurried cooking process is used to develop the texture of these yogurts naturally and authentically—bringing you a Greek yogurt that’s not only organic, but unparalleled in taste.Ingredients:Strained Yogurt (Organic Cultured Pasteurized Lowfat Milk)Live Active Cultures:L. acidophilus, L. bulgaricus, S. thermophilus, bifidus.	16	oz	4.99	0.31	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/WYqtu0oTyqj7xhrjLNgW_FK1A5780.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
420	Organic Nonfat  Vanilla Greek Yogurt	America’s favorite flavor just got better! We’ve blended fresh Clover Organic Nonfat Milk with aromatic vanilla bean, then strained it for a creamy consistency and rich, tantalizing taste that’s perfect for breakfast, a healthy snack, or a nutritious smoothie.We think that if you can't make it right, you shouldn't make it at all. And we've found a way to make it right: in our organic, authentically strained Greek yogurt, with nonfat milk and 22 grams of protein per serving. For decades we've partnered with a handful of humane, family-owned farms where the cows are raised in open pastures to produce our organic milk. Clo even gave her approval. Ingredients: Cultured Organic Pasteurized Nonfat Grade A Milk, Vanilla Blend (Organic sugar, pectin  natural flavors, organic locust bean gum, organic lemon juice concentrate, vanilla beans, tricalcium citrate). Live cultures: Lactobacillus bulgaricus, Streptococcus thermophilus, Lactobacillus acidophilus, Bifidus, Lactobacillus casei.	32	oz	8.29	0.26	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/sleXx6YVSXGB9yP80NfH_FK1A0481.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
421	Organic Cream on Top Peach Yogurt	Clover Organic Farms Yogurts are produced by culturing a mixture of fresh, organic milk from our local family farms along with fresh, organic fruit, sweeteners, and the addition of vitamin A. This particular yogurt has a deliciously rich layer of cream on top. Ingredients: Organic Pasteurized Milk, Organic Pasteurized Cream, Organic Nonfat Pasteurized Milk, Organic Peaches, Organic Cane Sugar, Pectin, Organic Corn Starch, Natural Flavor and Live Active Cultures.	6	oz	1.29	0.22	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/CQCXTtvQSKCXX0uJAcAt_FK1A1881.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
422	Organic Cream on Top Strawberry Yogurt	Clover Organic Farms Yogurts are produced by culturing a mixture of fresh, organic milk from our local family farms along with fresh, organic fruit, sweeteners, and the addition of vitamin A. This particular yogurt has a deliciously rich layer of cream on top. Ingredients: Organic Pasteurized Milk, Organic Pasteurized Cream, Organic Strawberries, Organic Evaporated Cane Juice, Pectin, Organic Corn Starch, Natural Flavor and Live Active Cultures.	6	oz	1.29	0.22	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/LHxlag8S8ydEHQClVJ9w_FK1A1877.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
423	Organic Cream on Top Vanilla Yogurt	Clover Organic Farms Yogurts are produced by culturing a mixture of fresh, organic milk from our local family farms along with fresh, organic fruit, sweeteners, and the addition of vitamin A. This particular yogurt has a deliciously rich layer of cream on top. Ingredients: Organic Pasteurized Milk, Organic Pasteurized Cream, Organic Nonfat Milk, Organic Cane Sugar, Organic Vanilla Extract, Pectin Organic Corn Starch and Live Active Cultures.	6	oz	1.29	0.22	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/7yMY04B0R1mBFwt1sa2P_FK1A1869.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
424	Organic French-Style Vanilla Yogurt	We use wholesome pasture-fed organic cow's milk from John Mattos’ family farm in Two Rock (near Petaluma) in Sonoma county. Our Yogurt culture comes from France where it has been used for decades to produce sweet, mild and smooth yogurts. Unlike most producers, we add no thickeners, stabilizers or preservatives. Just milk and culture, that’s it!Ingredients: Whole Organic Jersey Milk, Organic Vanilla Sauce (Organic Cane Sugar, Organic Milk, Organic Vanilla Beans), Living Cultures.	4.75	oz	2.49	0.52	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/wVCbxHWTlOXCZEOIXUFQ_Vanilla_GoodEgg-4747.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
425	Organic Cream On Top Blueberry Yogurt	Clover Organic Farms Yogurts are produced by culturing a mixture of fresh, organic milk from our local family farms along with fresh, organic fruit, sweeteners, and the addition of vitamin A. This particular yogurt has a deliciously rich layer of cream on top. Ingredients: Organic Pasteurized Milk, Organic Pasteurized Cream, Organic Nonfat Pasteurized Milk, Organic Blueberries, Organic Cane Sugar, Pectin, Organic Corn Starch, Natural Flavor and Live Active Cultures.	6	oz	1.29	0.22	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/ep403NrSQQKJr0Zcy5AS_FK1A1871.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
426	Organic French-Style Meyer Lemon Yogurt	We use wholesome pasture-fed organic cow's milk from John Mattos’ family farm in Two Rock (near Petaluma) in Sonoma county. We use local jams for our fruit-at-the-bottom flavors. They come from farms in Sonoma county that grow the fruit organically and make the jam by hand.  Our Yogurt culture comes from France where it has been used for decades to produce sweet, mild and smooth yogurts. Unlike most producers, we add no thickeners, stabilizers or preservatives. Just milk and culture, that’s it!\nIngredients: Whole Organic Jersey Milk, Meyer Lemon Spread (Organic Meyer Lemon, Organic Sugar), Living Cultures. 	4.75	oz	2.49	0.52	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/Zy6CX4S5SeKHbpi5GhtT_lemon_GoodEgg-4746.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	374	\N	\N	\N
427	Organic Cream On Top Forest Berry Yogurt	Clover Organic Farms Yogurts are produced by culturing a mixture of fresh, organic milk from our local family farms along with fresh, organic fruit, sweeteners, and the addition of vitamin A. This particular yogurt has a deliciously rich layer of cream on top. Ingredients: Organic Pasteurized Milk, Organic Pasteurized Cream, Organic Nonfat Pasteurized Milk, Organic Raspberries, Organic Strawberries, Organic Blueberries, Organic Cane Sugar, Pectin, Organic Corn Starch, Natural Flavor and Active Cultures.	6	oz	1.29	0.22	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/GzBP7ktRBWHNI5J7R9ap_FK1A1874.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
428	Organic Cream On Top Plain Yogurt	Clover Organic Farms Yogurts are produced by culturing a mixture of fresh, organic milk from our local family farms along with fresh, organic fruit, sweeteners, and the addition of vitamin A. This particular yogurt has a deliciously rich layer of cream on top. Ingredients: Organic Pasteurized Milk, Organic Pasteurized Cream, Pectin, Organic Corn Starch and Live Active Cultures.	6	oz	1.29	0.22	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/iod0CMRlTAWuX41F6Iad_FK1A1879.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
429	Organic French-Style Strawberry Yogurt	We use wholesome pasture-fed organic cow's milk from John Mattos’ family farm in Two Rock (near Petaluma) in Sonoma county. We use local jams for our fruit-at-the-bottom flavors. They come from farms in Sonoma county that grow the fruit organically and make the jam by hand.  Our Yogurt culture comes from France where it has been used for decades to produce sweet, mild and smooth yogurts. Unlike most producers, we add no thickeners, stabilizers or preservatives. Just milk and culture, that’s it!\nIngredients: Whole Organic Jersey Milk, Organic Strawberry Spread (Organic Strawberries, Organic Sugar, Pectin), Living Cultures. 	4.75	oz	2.49	0.52	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/C1oOhoIT6a4l3LF6YDjG_Straw_GoodEgg-4745.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
430	Organic French-Style Plain Yogurt	We use wholesome pasture-fed organic cow's milk from John Mattos’ family farm in Two Rock (near Petaluma) in Sonoma county. Our Yogurt culture comes from France where it has been used for decades to produce sweet, mild and smooth yogurts. Unlike most producers, we add no thickeners, stabilizers or preservatives. Just milk and culture, that’s it!\nIngredients: Whole Organic Jersey Milk, Living Cultures. 	4.75	oz	2.49	0.52	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/d30ZPIwwQ9e8N1dKZsRG_PLAINGoodEgg-4748.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
431	Plain Sheep's Milk Yogurt	Our sheep's milk yogurt is sweeter than goat's milk, tastier than soy and richer than cow's milk! Made with naturally homogenized sheep milk, our yogurt contains no antibiotics or growth hormones. For an added benefit, sheep milk could be the answer for those who are lactose intolerant. Did you know that Bellwether Farms tasty Sheep Milk Yogurt is…Made from 100% pure sheep milkMade from milk from healthy, pastured animals and active cultures L.bulgaricus, S. themophilus, L. acidophilus, and Bifidus – all very good for the body’s proper functioning.Is an excellent source of B vitamins, including B12, as well as calcium and riboflavin.Ingredients: Pasteurized Sheep Milk, Live, Active Cultures: S. Thermophilus, L. Bulgaricus, L. Acidophilus, & Bifidus.	16	oz	6.29	0.39	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/CNewEwHQZa1w7ILaiI49_FK1A5852.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
548	Organic Orange Cashew Ice Cream	This ice cream is like a creamsicle with salty cashew bits. It is Organic Orange ice cream with roasted salted cashew. It’s crunchy, exciting, and refreshing all in one.Ingredients: Organic Milk, Organic Cream, Organic Egg Yolks, Organic Sugar, Organic Roasted Salted Cashew, Organic Orange Flavor	12	oz	9.29	0.77	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/UEJugScvTV6Eoq17uMrJ_FK1A7780.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
432	Plain Goat's Milk Yogurt	Enjoy the delicious, velvety simplicity of Plain Goat Yogurt!Redwood Hill Farm Goat Milk Yogurt is a gold medal-winning European-style yogurt made with the highest-quality Grade A un-homogenized whole goat milk. The slight cream layer at the top can either be enjoyed or removed if you prefer a lower fat yogurt. We add a special blend of living cultures with acidophilus and bifidus to promote healthy digestion, and create a classic yogurt flavor.Ingredients: Grade A Pasteurized whole goat milk, tapioca starch, pectin.Live active cultures: S. Thermophilus, L. Bulgaricus, L. Acidophilus & Bifidus	6	oz	2.29	0.38	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/GF7fCOQfG4ZYWR48ToBQ_FK1A1739.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
433	Blackberry Sheep's Milk Yogurt	With superb Northwestern blackberries.Our sheep's milk yogurt is sweeter than goat's milk, tastier than soy and richer than cow's milk! Made with naturally homogenized sheep milk, our yogurt contains no antibiotics or growth hormones. For an added benefit, sheep milk could be the answer for those who are lactose intolerant. Did you know that Bellwether Farms tasty Sheep Milk Yogurt is…Made from 100% pure sheep milkMade from milk from healthy, pastured animals and active cultures L.bulgaricus, S. themophilus, L. acidophilus, and Bifidus – all very good for the body’s proper functioning.Is an excellent source of B vitamins, including B12, as well as calcium and riboflavin.Ingredients: Pasteurized Sheep Milk, Live, Active Cultures: S. Thermophilus, L. Bulgaricus, L. Acidophilus, & Bifidus.	6	oz	2.49	0.42	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/4x6mKdYT6OaSllxK8uSQ_FK1A7713.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
434	Organic Plain Kefir	Clover Organic Farms kefir starts with organic milk from small, family-run dairies on the North Coast of California. Ten beneficial live and active probiotic kefir cultures are added to the milk along with the freshest fruit available to create this tasty and healthy-for-your-body beverage. Drinking kefir is an excellent way to promote improved wellbeing and a balanced immune system and is great for those with milk sensitivities.  Enjoy Clover Organic Farms Kefir in good conscience and good health.Ingredients: Certified Organic Nonfat Milk, Organic Milk, Vitamin A Palmitate, and Cultures.	1	quart	4.79	0.15	fl oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/tlB0ea4RSa12A3v6W0UA_FK1A1840.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	366	\N	\N	\N
435	Organic Raw Milk Kefir	Our delicious raw kefir, made from our raw skim milk, is easy to digest, probiotic, tummy-friendly and immune-building! Twelve live and active cultures are added to make the most delicious and nutritious kefir around. USDA organic standards require that cows be pasture grazed just four months out of the year. OPDC goes far beyond this standard and grazes our cows on green pastures every day. In addition to green pastures, our cows are fed: a specially formulated organic mineral supplement, free choice salt and trace mineral blocks, high test organic alfalfa, and some sweet organic corn to keep them healthy and strong.	1	quart	4.99	0.16	fl oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/sWRXZ1FzTvG4hGERH6j0_FK1A1939.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	366	\N	\N	\N
436	Organic Lactose Free Plain Kefir	Simple delicious cultured flavor makes plain kefir a natural for recipes and anything calling for buttermilk as an ingredient: from soups and sauces, to smoothies and desserts. And, because there is no added sugar, (the sugar listed is the naturally-occuring milk sugar), you can feel good that you are enjoying the healthful nutrition of cultured dairy and nothing else.Green Valley Organics' lactose-free dairy is made by Redwood Hill Farm & Creamery in Sebastopol CA. Ingredients: Organic Lowfat Pasteurized Milk, Lactase Enzyme, Vitamin A and Flourish Live Active Cultures: L. Bulgaricus, L. Acidophilus, L. Casei, L. Rhamnosus, L. Lactis, L. Diacetylactis, S. Thermophilus, L. Cremoris, Leuconostoc Cremoris and B. Bifidum.	1	quart	5.29	0.17	fl oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/yWUeqeUhTpiAj09r7JEA_greenvalley_plain%20kefir.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	366	\N	\N	\N
437	Organic Vanilla Whole Milk Greek Yogurt	"Full fat, vanilla goodness! Perfect to snack on any time of the day!" Erin, Good Eggs' BuyerWallaby Organic Whole Milk Greek yogurt is rich and creamy. While maintaining the traditional, unhurried cooking process and authentic straining, the process starts with whole milk. This offers a slightly richer taste, giving you consistent flavor in every spoonful.Ingredients:Organic Cultured Pasteurized Milk and Cream, Organic Cane Sugar, Natural Flavor, Organic Locust Bean Gum, Pectin, Organic Vanilla Beans.Live Active Cultures:L. acidophilus, L. bulgaricus, S. thermophilus, bifidus.	5.3	oz	1.99	0.38	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/ielVXwaT2ywkNiwhgKEV_FK1A5791.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
438	Organic Strawberry Lowfat Greek Yogurt	These lowfat Greek yogurts are authentically strained, rich in protein, and made with premium organic ingredients. In addition to straining, a traditional, unhurried cooking process is used to develop the texture of these yogurts naturally and authentically—bringing you a Greek yogurt that’s not only organic, but unparalleled in taste.Ingredients:STRAINED YOGURT: Organic Cultured Pasteurized Lowfat Milk.STRAWBERRY FRUIT PREPARATION (20%): Organic Strawberries, Organic Cane Sugar, Organic Lemon Concentrate, Organic Locust Bean Gum, Pectin, Natural Flavors, Fruit and Vegetable Juice for Color.Live Active Cultures:L. acidophilus, L. bulgaricus, S. thermophilus, bifidus.	5.3	oz	1.99	0.38	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/aIPVffOuRIySLDt0vYU6_FK1A5799.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
439	Organic Blueberry Whole Milk Greek Yogurt	Wallaby Organic Whole Milk Greek yogurt is rich and creamy. While maintaining the traditional, unhurried cooking process and authentic straining, the process starts with whole milk. This offers a slightly richer taste that is further complimented by the blending of premium organic fruit throughout each and every cup, giving you consistent flavor in every spoonful.Ingredients:Organic Cultured Pasteurized Milk and Cream, Organic Blueberries, Organic Cane Sugar, Natural Flavor, Organic Locust Bean Gum, Pectin.Live Active Cultures:L. acidophilus, L. bulgaricus, S. thermophilus, bifidus.	5.3	oz	1.99	0.38	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/He8XvYHJR4gAjn1ggojG_FK1A5789.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
447	Organic Dark Chocolate Lowfat Greek Yogurt	These lowfat Greek yogurts are authentically strained, rich in protein, and made with premium organic ingredients. In addition to straining, a traditional, unhurried cooking process is used to develop the texture of these yogurts naturally and authentically—bringing you a Greek yogurt that’s not only organic, but unparalleled in taste.Ingredients:STRAINED YOGURT: Organic Cultured Pasteurized Lowfat Milk.CHOCOLATE PREPARATION: Organic Cane Sugar, Organic Chocolate Liquor, Organic Locust Bean Gum, Organic Vanilla ExtractLive Active Ingredients:L. acidophilus, L. bulgaricus, S. thermophilus, bifidus.	5.3	oz	1.99	0.38	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/lvslsFkMT5OUpMUv4qV0_FK1A5809.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
440	Organic Nonfat  Vanilla Greek Yogurt	America’s favorite flavor just got better! We’ve blended fresh Clover Organic Nonfat Milk with aromatic vanilla bean, then strained it for a creamy consistency and rich, tantalizing taste that’s perfect for breakfast, a healthy snack, or a nutritious smoothie.We think that if you can't make it right, you shouldn't make it at all. And we've found a way to make it right: in our organic, authentically strained Greek yogurt, with nonfat milk and 22 grams of protein per serving. For decades we've partnered with a handful of humane, family-owned farms where the cows are raised in open pastures to produce our organic milk. Clo even gave her approval. Ingredients: Cultured Organic Pasteurized Nonfat Grade A Milk, Vanilla Blend (Organic sugar, pectin  natural flavors, organic locust bean gum, organic lemon juice concentrate, vanilla beans, tricalcium citrate). Live cultures: Lactobacillus bulgaricus, Streptococcus thermophilus, Lactobacillus acidophilus, Bifidus, Lactobacillus casei.	5.3	oz	1.79	0.34	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/3tW44UtTSeVXZe7GL66P_FK1A0470.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
441	Organic Nonfat  Peach Greek Yogurt	Organic Peach: Savor the fresh-picked essence of sweet, sun-kissed peaches plucked from the tree and perfectly paired with fresh Clover Organic Nonfat Milk. It’s a creamy treat that’s just plain peachy!We think that if you can't make it right, you shouldn't make it at all. And we've found a way to make it right: in our organic, authentically strained Greek yogurt, with nonfat milk and 22 grams of protein per serving. For decades we've partnered with a handful of humane, family-owned farms where the cows are raised in open pastures to produce our organic milk. Clo even gave her approval. Ingredients: Cultured Pasteurized Organic Nonfat Grade A Milk, Organic Peaches, Organic Sugar, Pectin, Natural Flavor, Organic Locust Bean Gum, Organic Annatto (color), Calcium Chloride, Citric Acid. Live Cultures: Lactobacillus bulgaricus, Streptococcus thermophilus, Lactobacillus acidophilus, Bifidus, Lactobacillus casei.	5.3	oz	1.79	0.34	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/9oPJ2ReZGR8kh4oszgk0_FK1A0472.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
442	Organic Blueberry Lowfat Greek Yogurt	These lowfat Greek yogurts are authentically strained, rich in protein, and made with premium organic ingredients. In addition to straining, a traditional, unhurried cooking process is used to develop the texture of these yogurts naturally and authentically—bringing you a Greek yogurt that’s not only organic, but unparalleled in taste.Ingredients:STRAINED YOGURT: Organic Cultured Pasteurized Lowfat MilkBLUEBERRY FRUIT PREPARATION (20%): Organic Blueberries, Organic Cane Sugar, Natural Flavor, Organic Locust Bean Gum, Pectin, Organic Lemon Concentrate.Live Active Cultures:L. acidophilus, L. bulgaricus, S. thermophilus, bifidus.	5.3	oz	1.99	0.38	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/crIyXsxQXi4uPPHpXIxl_FK1A5796.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
443	Organic Nonfat  Plain Greek Yogurt	Crafted with the perfect balance of creaminess and tang, our Plain Greek Yogurt is anything but plain. Starring fresh Clover Organic Nonfat Milk direct from the happy cows on our family-owned dairy farms, this thick, rich yogurt has a luxurious mouth-feel and texture perfect in its pure form, or used to enhance other foods.We think that if you can't make it right, you shouldn't make it at all. And we've found a way to make it right: in our organic, authentically strained Greek yogurt, with nonfat milk and 22 grams of protein per serving. For decades we've partnered with a handful of humane, family-owned farms where the cows are raised in open pastures to produce our organic milk. Clo even gave her approval. Ingredients: Cultured Organic Pasteurized Nonfat Grade A Milk. Live cultures: Lactobacillus bulgaricus, Streptococcus thermophilus, Lactobacillus acidophilus, Bifidus, Lactobacillus casei.	5.3	oz	1.79	0.34	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/xLQVck84R1bVKhNAUSSP_FK1A0465.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
444	Organic Nonfat  Black Cherry Greek Yogurt	Get ready to fall in love with this burst of flavorful tart organic cherries paired with creamy Clover Organic Nonfat Milk and subtle floral notes of cassis and fresh-baked pie.We think that if you can't make it right, you shouldn't make it at all. And we've found a way to make it right: in our organic, authentically strained Greek yogurt, with nonfat milk and 22 grams of protein per serving. For decades we've partnered with a handful of humane, family-owned farms where the cows are raised in open pastures to produce our organic milk. Clo even gave her approval. Ingredients: Cultured Pasteurized Organic Nonfat Grade A Milk, Organic Cherries, Organic Sugar, Pectin, Organic Juice (Black Currant, Apple, Black Carrot) (color), Natural Flavor, Citric Acid, Tricalcium Phosphate. Live Cultures: Lactobacillus bulgaricus, Streptococcus thermophilus, Lactobacillus acidophilus, Bifidus, Lactobacillus casei.	5.3	oz	1.79	0.34	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/WtVROvL9TqKlkTCxdOi0_FK1A0477.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
445	Organic  Nonfat Blueberry Greek Yogurt	Sweet and tangy come together in this classic flavor that combines the floral, jammy notes of Organic Blueberries and Elderberry married with fresh Clover Organic Nonfat Milk.We think that if you can't make it right, you shouldn't make it at all. And we've found a way to make it right: in our organic, authentically strained Greek yogurt, with nonfat milk and 22 grams of protein per serving. For decades we've partnered with a handful of humane, family-owned farms where the cows are raised in open pastures to produce our organic milk. Clo even gave her approval. Ingredients: Cultured Pasteurized Organic Nonfat Grade A Milk, Organic Blueberries, Organic Sugar, Pectin, Natural Flavor, Organic Locust Bean Gum, Organic Elderberry Juice Concentrate (color), Calcium Chloride, Citric Acid. Live Cultures: Lactobacillus bulgaricus, Streptococcus thermophilus, Lactobacillus acidophilus, Bifidus, Lactobacillus casei.	5.3	oz	1.79	0.34	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/DfPcsUoSTIS2IS39LQeM_FK1A0466.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
446	Organic Mixed Berry Nonfat Greek Yogurt	These Greek yogurts are so thick and creamy, you might find it hard to believe they're nonfat. Wallaby Organic Greek nonfat yogurts are authentically strained, rich in protein, and made with premium organic ingredients. In addition to straining, a traditional, unhurried cooking process is used to develop the texture of these yogurts naturally and authentically—bringing you a Greek nonfat yogurt that's not only organic, but unmatched in taste and quality.Ingredients:STRAINED YOGURT: Organic Cultured Pasteurized Nonfat Milk.MIXED BERRY FRUIT PREPARATION: Organic Cane Sugar, Organic Strawberries, Organic Blueberries, Organic Raspberries, Natural Flavors, Organic Locust Bean Gum, Pectin, Organic Lemon Juice Concentrate, Fruit and Vegetable Juice for Color.Live Active Cultures:L. acidophilus, L. bulgaricus, S. thermophilus, bifidus.	5.3	oz	1.99	0.38	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/v7VhjcPsRDiJhcA6Ys0V_FK1A5805.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
448	Organic Peach Nonfat Greek Yogurt	These Greek yogurts are so thick and creamy, you might find it hard to believe they're nonfat. Wallaby Organic Greek nonfat yogurts are authentically strained, rich in protein, and made with premium organic ingredients. In addition to straining, a traditional, unhurried cooking process is used to develop the texture of these yogurts naturally and authentically—bringing you a Greek nonfat yogurt that's not only organic, but unmatched in taste and quality.Ingredients:STRAINED YOGURT: Organic Cultured Pasteurized Nonfat Milk.PEACH FRUIT PREPARATION: Organic Peaches, Organic Cane Sugar, Organic Lemon Juice Concentrate, Organic Locust Bean Gum, Pectin, Natural Flavor, Organic Turmeric and Annatto Extract for Color.Live Active Cultures: L. acidophilus, L. bulgaricus, S. thermophilus, bifidus.	5.3	oz	1.99	0.38	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/PNz7DL6fTQiZgDMAyRMH_FK1A5794.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
449	Organic Plain Nonfat Greek Yogurt	These Greek yogurts are so thick and creamy, you might find it hard to believe they're nonfat. Wallaby Organic Greek nonfat yogurts are authentically strained, rich in protein, and made with premium organic ingredients. In addition to straining, a traditional, unhurried cooking process is used to develop the texture of these yogurts naturally and authentically—bringing you a Greek nonfat yogurt that's not only organic, but unmatched in taste and quality.Ingredients:STRAINED YOGURT: Organic Cultured Pasteurized Nonfat Milk.Live Active Cultures:L. acidophilus, L. bulgaricus, S. thermophilus, bifidus.	6	oz	1.99	0.33	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/kSDE39vQhyKjAUv5zykg_FK1A5802.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
450	Organic Whole Milk Vanilla Icelandic Yogurt	Smári yogurt has more protein per serving than any other yogurt in the US. It's thicker than most other yogurt. Creamier, also. It's thick because we strain off most of the water, and leave the yogurt. It's concentrated. It takes four cups of whole milk to make one cup of Smári.Ingredients: Organic grade A pasteurized skim milk, organic grade A pasteurized whole milk, organic cane sugar, organic vanilla extract, organic vanilla bean, live and active cultures.	5	oz	1.99	0.4	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/ndnj07xLSAiRXYRbPQmy_FK1A4456.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
451	Organic Whole Milk Cherry Chia Icelandic Yogurt	Smári yogurt has more protein per serving than any other yogurt in the US. It's thicker than most other yogurt. Creamier, also. It's thick because we strain off most of the water, and leave the yogurt. It's concentrated. It takes four cups of whole milk to make one cup of Smári.Ingredients: Organic grade A pasteurized skim milk, organic grade A pasteurized whole milk, organic black cherries, organic cane sugar, water, pre-hydrated organic chia seeds, organic cherry flavor, pectin, organic fruit and vegetable juice concentrate for color, organic lemon juice concentrate, live and active cultures.	5	oz	1.99	0.4	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/kabf1goTR6aBSUpUv3LO_FK1A4460.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
452	Organic Whole Milk Pure Icelandic Yogurt	Smári yogurt has more protein per serving than any other yogurt in the US. It's thicker than most other yogurt. Creamier, also. It's thick because we strain off most of the water, and leave the yogurt. It's concentrated. It takes four cups of whole milk to make one cup of Smári.Ingredients: Organic grade A pasteurized skim milk, organic grade A pasteurized whole milk, live and active cultures	5	oz	1.99	0.4	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/G18FdsgmSBHH1wjANxDQ_FK1A4466.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
453	Organic Nonfat Strawberry Icelandic Yogurt	Smári yogurt has more protein per serving than any other yogurt in the US. It's thicker than most other yogurt. Creamier, also. It's thick because we strain off most of the water, and leave the yogurt. It's concentrated. It takes four cups of whole milk to make one cup of Smári.Ingredients: Organic grade A pasteurized skim milk, organic strawberries, organic cane sugar, water, pectin, organic fruit and vegetable juice for color, live and active cultures.	5	oz	1.99	0.4	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/DGqqJmH0SbCR716sVoNc_FK1A7294.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
454	Organic Nonfat Peach Icelandic Yogurt	Smári yogurt has more protein per serving than any other yogurt in the US. It's thicker than most other yogurt. Creamier, also. It's thick because we strain off most of the water, and leave the yogurt. It's concentrated. It takes four cups of whole milk to make one cup of Smári.Ingredients: Organic grade A pasteurized skim milk, organic peaches, organic cane sugar, water, pectin, live and active cultures.	5	oz	1.99	0.4	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/ibqK2pjQEYzhyBoZAbpg_FK1A4458.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
455	Organic Nonfat Coconut Icelandic Yogurt	Smári yogurt has more protein per serving than any other yogurt in the US. It's thicker than most other yogurt. Creamier, also. It's thick because we strain off most of the water, and leave the yogurt. It's concentrated. It takes four cups of whole milk to make one cup of Smári.Ingredients: Organic grade A pasteurized skim milk, water, organic cane sugar, organic dehydrated coconut, pectin, organic coconut flavor, organic lemon juice, live and active cultures.	5	oz	1.99	0.4	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/TSXRQVQyQD2W1btas139_FK1A4462.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
456	Organic Nonfat Blueberry Icelandic Yogurt	Smári yogurt has more protein per serving than any other yogurt in the US. It's thicker than most other yogurt. Creamier, also. It's thick because we strain off most of the water, and leave the yogurt. It's concentrated. It takes four cups of whole milk to make one cup of Smári.Ingredients: Organic grade A pasteurized skim milk, organic blueberries, organic cane sugar, water, pectin, organic blueberry juice concentrate, live and active cultures.	5	oz	1.99	0.4	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/eeJURAnaSqGFOFOQtRIc_FK1A7281.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
457	Organic Nonfat Pure Icelandic Yogurt	Smári yogurt has more protein per serving than any other yogurt in the US. It's thicker than most other yogurt. Creamier, also. It's thick because we strain off most of the water, and leave the yogurt. It's concentrated. It takes four cups of whole milk to make one cup of Smári.Ingredients: Organic grade A pasteurized skim milk. Contains live and active cultures.	5	oz	1.99	0.4	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/aUge9aY4TDuwXpGRqfL6_FK1A7286.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
458	Organic Nonfat Vanilla Icelandic Yogurt	Smári yogurt has more protein per serving than any other yogurt in the US. It's thicker than most other yogurt. Creamier, also. It's thick because we strain off most of the water, and leave the yogurt. It's concentrated. It takes four cups of whole milk to make one cup of Smári.Ingredients: Organic grade A pasteurized skim milk, organic cane sugar, organic vanilla extract, organic vanilla bean, live and active cultures.	5	oz	1.99	0.4	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/pZFQprRmQjK2Wu87Yl6u_FK1A7298.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
459	Lemon Coconut & Almond Yogurt	Lemon non-dairy yogurt made from almond and coconut milk. From one of our customers:"Hi ,Just wanted to say I LOVE YOUR PRODUCT!!!! I have tried every non-dairy yogurt on the market and found them barely palatable at best. I can't get enough of Crunch Culture... SO good I even eat them as a dessert in the afternoon and evenings! I've been ordering them in my regular Good Eggs delivery..."Lemon Yogurt ingredients: almond milk, coconut milk*, sugar*, lemon juice, tapioca flour, agar agar, live active bacteria (Bifidobacterium bifidum, Lactobacillus acidophilus, Lactobacillus casei, Lactobacillus delbrueckii subsp bulgarcus, Lactobacillus rhamnosus, Streptococcus thermophiles) *OrganicAlmond Milk Contains Less Than 1% Of The Following: Vitamin/Mineral Blend (Calcium Carbonate, Vitamin A, Vitamin E, Vitamin D2, Vitamin B12, Vitamin B2, Zinc), Gellan Gum, Carrageenan, Potassium Citrate, Sunflower Lecithin, Natural Flavors, Sea Salt.	16	oz	7.29	0.46	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/OOmeUJ7iRB6NYt5nWl8J_FK1A1911.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	374	\N	\N	\N
460	Lavender Coconut & Almond Yogurt	Lavender infused non-dairy yogurt made from almond and coconut milk. From one of our customers:"Hi ,Just wanted to say I LOVE YOUR PRODUCT!!!! I have tried every non-dairy yogurt on the market and found them barely palatable at best. I can't get enough of Crunch Culture... SO good I even eat them as a dessert in the afternoon and evenings! I've been ordering them in my regular Good Eggs delivery..."\nLavender-infused Yogurt ingredients: almond milk, coconut\nmilk*, sugar*, lavender, tapioca flour, agar agar, live active bacteria\n(Bifidobacterium bifidum, Lactobacillus acidophilus, Lactobacillus casei,\nLactobacillus delbrueckii subsp bulgarcus, Lactobacillus rhamnosus,\nStreptococcus thermophiles) *Organic\nAlmond Milk Contains Less\nThan 1% Of The Following: Vitamin/Mineral Blend (Calcium Carbonate, Vitamin A,\nVitamin E, Vitamin D2, Vitamin B12, Vitamin B2, Zinc), Gellan Gum, Carrageenan,\nPotassium Citrate, Sunflower Lecithin, Natural Flavors, Sea Salt. 	16	oz	7.29	0.46	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/tGuHr5vSiKR7Up4UZdXA_FK1A1898.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	269	\N	\N	\N
461	Almond & Coconut Milk Strawberry Yogurt	Almond & OrganicCoconut milk basil-infused yogurt with dried strawberry, slivered almond granola.Strawberry Balsamic Granola: oats*, coconut, sugar*, brown rice syrup*, coconut oil*, almonds, dried strawberries, balsamic vinegar*, salt.Basil-Infused Non-dairy Yogurt: almond milk, coconut milk*, basil*, sugar*, tapioca flour, agar agar, live active bacteria (Bifidibacterium difidum, Lactobacillus acidophilus, Lactobacillus casei, Lactobacillus delbrueckii subsp bulgarius, Lactobacillus rhamnosus, Streptococcus thermophilus) *OrganicAlmond Milk Contains Less Than 1% Of The Following: Vitamin/Mineral Blend (Calcium Carbonate, Vitamin A, Vitamin E, Vitamin D2, Vitamin B12, Vitamin B2, Zinc), Gellan Gum, Locust Bean Gum, Potassium Citrate, Sunflower Lecithin, Natural Flavors, Sea Salt.	7	oz	4.79	0.68	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/0ORfJ68ERTuHR5ydUaOu_FK1A1879.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
462	Maple Coconut & Almond Yogurt	Maple non-dairy yogurt made from almond and organic coconut milk.Maple Non-dairy Yogurt:\n almond milk, coconut milk*, pure maple extract (alcohol, water, natural\n caramel color, glycerine, maple concentrate), sugar*, tapioca flour, \nagar agar,\n live active bacteria (Bifidibacterium difidum, Lactobacillus \nacidophilus, Lactobacillus casei, Lactobacillus delbrueckii subsp \nbulgarius, Lactobacillus rhamnosus, Streptococcus thermophilus) *OrganicAlmond\n Milk Contains Less Than 1% Of The Following: Vitamin/Mineral Blend \n(Calcium Carbonate, Vitamin A, Vitamin E, Vitamin D2, Vitamin B12, \nVitamin B2, Zinc), Gellan Gum, Carrageenan, Potassium Citrate, Sunflower\n Lecithin, Natural Flavors, Sea Salt.	16	oz	7.29	0.46	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/8JhAbHuR52Qrm8MEtTgZ_FK1A1889.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
463	Almond & Coconut Milk Lavender Yogurt	Almond & Organic Coconut milk lavender-infused yogurt with coconut-candied citrus peel and pistachio granola.Coconut Candied Citrus Peel Granola: oats*, coconut, sugar*, brown rice syrup*, coconut oil*, lemons, pistachios, salt.Lavender-Infused Non-dairy Yogurt: almond milk, coconut milk*, lavender, sugar*, tapioca flour, agar agar, live active bacteria (Bifidibacterium difidum, Lactobacillus acidophilus, Lactobacillus casei, Lactobacillus delbrueckii subsp bulgarius, Lactobacillus rhamnosus, Streptococcus thermophilus) *OrganicAlmond Milk Contains Less Than 1% Of The Following: Vitamin/Mineral Blend (Calcium Carbonate, Vitamin A, Vitamin E, Vitamin D2, Vitamin B12, Vitamin B2, Zinc), Gellan Gum, Locust Bean Gum, Potassium Citrate, Sunflower Lecithin, Natural Flavors, Sea Salt.	7	oz	4.79	0.68	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/PmdiG1mdTG2XGmVh2Fw2_FK1A1876.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	269	\N	\N	\N
464	Almond & Coconut Milk Lemon Yogurt	Almond & Organic Coconut milk lemon yogurt with candied ginger, slivered almond granola.Candied Ginger  Granola: oats*, sugar*, brown rice syrup*, coconut oil*, almonds, candied ginger (ginger, sugar), salt.Lemon Non-dairy Yogurt: almond milk, coconut milk*, natural lemon juice, sugar*, tapioca flour, agar agar, live active bacteria (Bifidibacterium difidum, Lactobacillus acidophilus, Lactobacillus casei, Lactobacillus delbrueckii subsp bulgarius, Lactobacillus rhamnosus, Streptococcus thermophilus) *OrganicAlmond Milk Contains Less Than 1% Of The Following: Vitamin/Mineral Blend (Calcium Carbonate, Vitamin A, Vitamin E, Vitamin D2, Vitamin B12, Vitamin B2, Zinc), Gellan Gum, Locust Bean Gum, Potassium Citrate, Sunflower Lecithin, Natural Flavors, Sea Salt.	7	oz	4.79	0.68	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/d9ExSZMQa6u9fEU5NWVR_2gR3VJm9Uve2VOjhAV-JBiYYbdLFn64RREUE4Iqa1tY.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	374	\N	\N	\N
465	Organic Lactose Free Vanilla Yogurt	The aromatic flavor notes of organic vanilla beans from Madagascar complement the subtle sweetness and enhance the natural creaminess of the fresh yogurt. The rich, delicious taste is accented by a clean, crisp finish, which makes this yogurt one you will want to enjoy often. Whether you have a lactose restriction or not, this is as good as real vanilla can get.Green Valley Organics' lactose-free dairy is made by Redwood Hill Farm & Creamery in Sebastopol CA. Ingredients: Organic Lowfat Pasteurized Milk, Organic Evaporated Cane Juice, Organic Vanilla Extract, Lactase Enzyme, Pectin, Flourish 10 Live and Active Cultures.	6	oz	1.79	0.3	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/tyKcHhvbQXafzJxaM1Hi_FK1A5826.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
466	Organic Lactose Free Strawberry Yogurt	Real organic strawberries add a rich complexity of fruit flavors, which balance perfectly with the subtle tartness of the yogurt cultures. The creaminess of the organic milk marries the flavors in a luscious harmony.Green Valley Organics' lactose-free dairy is made by Redwood Hill Farm & Creamery in Sebastopol CA. Ingredients: Organic Lowfat Pasteurized Milk, Organic Fruit (Organic Evaporated Cane Juice, Organic Strawberries, Water, Pectin, Organic Locust Bean Gum, Natural Flavor, Vegetable Juice), Lactase Enzyme, Pectin, Flourish 10 Live and Active Cultures.	6	oz	1.79	0.3	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/f4pHkgOVRdCHJbEf6rKf_FK1A5816.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
467	Organic Lactose Free Blueberry Yogurt	Green Valley Organics' favorite yogurt flavor is made from luscious blueberries. You will never miss the lactose because this blueberry is loved by the tolerant and intolerant alike. The tanginess of the yogurt and the berries enhance one another. Whether you like to stir-it-up or dig-in-deep, it will astound your taste buds.Green Valley Organics' lactose-free dairy is made by Redwood Hill Farm & Creamery in Sebastopol CA.   Ingredients: Organic Lowfat Pasteurized Milk, Organic Fruit (Organic Evaporated Cane Juice, Water, Organic Blueberries, Natural Flavors, Pectin, Organic Locust Bean Gum), Lactase Enzyme, Pectin, Flourish 10 Live and Active Cultures.	6	oz	1.79	0.3	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/SOkpmI83SWinmZ5GkOZo_FK1A5821.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
468	Almond & Organic Milk Maple Yogurt	Almond & Organic Coconut milk maple yogurt with cinnamon walnut granola.Cinnamon Walnut Granola: oats*, coconut, sugar*, brown rice syrup*, coconut oil*, walnut, cinnamom, salt.Maple Non-dairy Yogurt:\n almond milk, coconut milk*, pure maple extract (alcohol, water, natural caramel color, glycerine, maple concentrate), sugar*, tapioca flour, agar agar,\n live active bacteria (Bifidibacterium difidum, Lactobacillus \nacidophilus, Lactobacillus casei, Lactobacillus delbrueckii subsp \nbulgarius, Lactobacillus rhamnosus, Streptococcus thermophilus) *OrganicAlmond\n Milk Contains Less Than 1% Of The Following: Vitamin/Mineral Blend \n(Calcium Carbonate, Vitamin A, Vitamin E, Vitamin D2, Vitamin B12, \nVitamin B2, Zinc), Gellan Gum, Locust Bean Gum, Potassium Citrate, Sunflower\n Lecithin, Natural Flavors, Sea Salt.	7	oz	4.79	0.68	oz	Dairy	Yogurt	http://goodeggs2.imgix.net/product_photos/k5tudAp9T0ux2M1zTdzP_FK1A1939.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	246	\N	\N	\N
469	Basil Coconut & Almond Yogurt	Basil infused non-dairy yogurt made from almond and coconut milk. From one of our customers:"Hi ,Just wanted to say I LOVE YOUR PRODUCT!!!! I have tried every non-dairy yogurt on the market and found them barely palatable at best. I can't get enough of Crunch Culture... SO good I even eat them as a dessert in the afternoon and evenings! I've been ordering them in my regular Good Eggs delivery..."\nBasil Yogurt Ingredients: almond milk, coconut milk*, sugar*,\nbasil*, tapioca flour, agar agar, live active bacteria (Bifidobacterium\nbifidum, Lactobacillus acidophilus, Lactobacillus casei, Lactobacillus\ndelbrueckii subsp bulgarcus, Lactobacillus rhamnosus, Streptococcus\nthermophiles) *Organic  \nAlmond Milk Contains Less\nThan 1% Of The Following: Vitamin/Mineral Blend (Calcium Carbonate, Vitamin A,\nVitamin E, Vitamin D2, Vitamin B12, Vitamin B2, Zinc), Gellan Gum, Carrageenan,\nPotassium Citrate, Sunflower Lecithin, Natural Flavors, Sea Salt.	16	oz	7.29	0.46	oz	Dairy	Yogurt	http://goodeggs1.imgix.net/product_photos/9xrPOkybRhmLmsIdrXNw_FK1A1906.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	338	\N	\N	\N
470	Organic Unsalted Butter	Clover Organic Farms quality butters are made in small batches with rich, organic milk and cream from a select group of family farms on the North Coast of California. They do not use antibiotics or growth hormones, and are certified by the American Humane Association. Clover's Organic Unsalted Butter is sweet and flavorful, perfect for cooking, baking, or spreading on a good piece of toast.Ingredients: organic cream, cultures.Contains: milk.	16	oz	7.79	7.79	lb	Dairy	Butter	http://goodeggs1.imgix.net/product_photos/65G9e9rlShKnNuMIKBqk_FK1A0581.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	396	\N	\N	\N
471	Organic Unsalted Butter	Straus Family Creamery's Unsalted Butter is rich, sweet and creamy, with 85% butterfat content and extremely low moisture levels. This means that your pastry will be flakier and rise higher—plus the butter has a higher smoke point and won't burn while you're cooking pancakes or searing meat. It's made European-style, in small batches using Straus' old-fashioned 1950s butter churn. It is also certified kosher and gluten-free. Use as is for all your baking needs, or spread on toast, sandwiches, and biscuits with a sprinkle of coarse sea salt on top.Ingredients: organic pasteurized cream.Contains: milk.	16	oz	9.99	9.99	lb	Dairy	Butter	http://goodeggs2.imgix.net/product_photos/IIggguphQUCfAkpWatFd_FK1A5947.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	396	\N	\N	\N
472	Graziers Unsalted Grass-Fed Butter	This European-style cultured butter is made only from grass-fed cream, rich and flavorful with 83% butterfat. Sierra Nevada Cheese Co. vat-cultures the butter for at least 16 hours, giving it a complex, sweet, and delicious taste. Try spreading it on warm, crusty bread and you'll never go back to plain old butter again! Ingredients: cream.Contains: milk.	8	oz	4.79	9.58	lb	Dairy	Butter	http://goodeggs2.imgix.net/product_photos/ehkIOsJQQXWkZ7C79OhV_FK1A5629.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	396	\N	\N	\N
473	Organic Grass-Fed Ghee	Ghee is a premium cooking oil, the result of a clarification process that removes all the moisture, milk solids and impurities from butter. The absence of milk solids and water in ghee make it completely shelf stable and give it a 485ºF smoke point, making it a great choice for high-temperature cooking. Ancient Organics Ghee is always made by hand in small batches, using only organic sweet cream butter from Straus Family Creamery. Keep ghee away from moisture and sunlight. Store refrigerated after opening for the longest shelf life.Ingredients: organic butter.Contains: milk.	8	fl oz	13.99	1.75	fl oz	Dairy	Butter	http://goodeggs2.imgix.net/product_photos/9d3SBv6ZSE6JcU7dxw86_FK1A7505.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	231	\N	\N	\N
474	Organic Unsalted Butter	Our famous butter made in the European style. We separate the cream, then let it set for 3 days with the culture before churning it just like in the old days. This sweet butter is a chef favorite! You can use for all of your cooking and baking for amazing results.Ingredients: USDA Organic Culture Pasteurized Grade A Jersey Brand Cream, Enzymes.	8	oz	4.99	9.98	lb	Dairy	Butter	http://goodeggs2.imgix.net/product_photos/nnkcPiS7RRu09V5erkqh_FK1A5978.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	396	\N	\N	\N
475	Organic Grass Fed Ghee	Ghee is a premium cooking oil, the result of a clarification process that removes all the moisture, milk solids and impurities from butter. The absence of milk solids and water in ghee make it completely shelf stable and give it a 485ºF smoke point, making it a great choice for high-temperature cooking. Ancient Organics Ghee is always made by hand in small batches, using only organic sweet cream butter from Straus Family Creamery. Keep ghee away from moisture and sunlight. Store refrigerated after opening for the longest shelf life.Ingredients: organic butter.Contains: milk.	16	fl oz	19.99	1.25	fl oz	Dairy	Butter	http://goodeggs2.imgix.net/product_photos/4U2PPEBXRVu9wFozcShW_FK1A7510.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	231	\N	\N	\N
523	Snickerdoodle & Salted Caramel Ice Cream Sandwich	A perfect, soft cinnamon and sugar cookie paired with Maldon sea salt and caramel ice cream. Together they create the Caramia Lehrer.Ingredients: Unbleached all-purpose flour, cane sugar, butter, cinnamon, natural vanilla extract, baking soda, fruit juice, dextrin, milk, cream, Maldon sea salt, maltodextrin, skimmed milk powder, dextrose, guar gum, locust bean gum. Contains dairy	5.8	oz	4.69	0.81	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/b1tl3tlyT2G4oW3brmgK_Good%20Eggs%20072314-063.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
476	Unsalted Cultured Butter	This Unsalted Butter log is perfect for baking with its 86% butterfat content. Cut into your scones or pie dough for a delicate crumb and super flaky texture. While working on a dairy farm in Brittany, France, Allison Hooper took careful note of what happened to the milk. After each milking, she set the cream aside. Natural, lactic bacteria took over, ripening it into cultured cream—or crème fraîche. When the thick result was churned into butter, she knew she had learned something valuable. Inspired by this lesson, our cream is churned in small batches becoming a rich European-style butter with a unique farm-fresh taste. Ingredients: cream, culture.contains dairy	8	oz	4.99	9.98	lb	Dairy	Butter	http://goodeggs2.imgix.net/product_photos/8cRduvahTSu7yfQotM7d_FK1A5293.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	396	\N	\N	\N
477	Organic Grass Fed Ghee	Ghee is a premium cooking oil, the result of a clarification process that removes all the moisture, milk solids and impurities from butter. The absence of milk solids and water in ghee make it completely shelf stable and give it a 485ºF smoke point, making it a great choice for high-temperature cooking. Ancient Organics Ghee is always made by hand in small batches, using only organic sweet cream butter from Straus Family Creamery. Keep ghee away from moisture and sunlight. Store refrigerated after opening for the longest shelf life.Ingredients: organic butter.Contains: milk.	32	fl oz	39.99	1.25	fl oz	Dairy	Butter	http://goodeggs2.imgix.net/product_photos/4U2PPEBXRVu9wFozcShW_FK1A7510.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	231	\N	\N	\N
478	Organic Salted Butter	Clover Organic Farms quality butters are made in small batches with rich, organic milk and cream from a select group of family farms on the North Coast of California. They do not use antibiotics or growth hormones, and are certified by the American Humane Association. Clover's Organic Salted Butter is creamy, tangy and flavorful, perfect for cooking, baking, or spreading on a good piece of toast.Ingredients: organic cream, sea salt, cultures.Contains: milk.	16	oz	7.79	7.79	lb	Dairy	Butter	http://goodeggs1.imgix.net/product_photos/buKuaA23ROWlzxucWmdg_FK1A0587.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	396	\N	\N	\N
479	Graziers Salted Grass-Fed Butter	This European-style cultured butter is made only from salt and grass-fed cream, rich and flavorful with 83% butterfat. Sierra Nevada Cheese Co. vat-cultures the butter for at least 16 hours, giving it a complex, savory and delicious taste. Try spreading it on warm, crusty bread and you'll never go back to plain old butter again! Ingredients: cream, salt.Contains: milk.	8	oz	4.79	9.58	lb	Dairy	Butter	http://goodeggs1.imgix.net/product_photos/lYWszO1LTfyMYSbBGFch_FK1A5634.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	396	\N	\N	\N
480	Organic Salted Butter	Straus Family Creamery's Lightly Salted Butter is rich, sweet and creamy, with 85% butterfat content and extremely low moisture levels. This means that your pastry will be flakier and rise higher—plus the butter has a higher smoke point and won't burn while you're cooking pancakes or searing meat. It's made European-style, in small batches using Straus' old-fashioned 1950s butter churn. It is also certified kosher and gluten-free. Stock up for your holiday baking projects or all your everyday cooking needs.Ingredients: organic pasteurized cream, salt.Contains: milk.	16	oz	9.99	9.99	lb	Dairy	Butter	http://goodeggs1.imgix.net/product_photos/tPTkTzA0SDKEZSFy8tUC_FK1A5946.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	396	\N	\N	\N
481	Lightly Salted Cultured Butter	While working on a dairy farm in Brittany, France, Allison Hooper took careful note of what happened to the milk. After each milking, she set the cream aside. Natural, lactic bacteria took over, ripening it into cultured cream—or crème fraîche. When the thick result was churned into butter, she knew she had learned something valuable.Inspired by this lesson, our cream is churned in small batches becoming a rich European-style butter with 86% butterfat content and unique farm-fresh taste. Use this cultured butter at high temperatures for a perfect pan sear, or smear on toasted sourdough with jam.Ingredients: pasteurized cows' cream (milk), salt, cultures. contains dairy	8	oz	4.99	9.98	lb	Dairy	Butter	http://goodeggs2.imgix.net/product_photos/aNEkWlNgSkyhsEdO1Vqu_FK1A5304.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	396	\N	\N	\N
482	Organic Salted Butter	Our famous butter made in the European style. We separate the cream, then let it set for 3 days with the culture before churning it just like in the old days. Very lightly salted, with French “Guerande” sea salt, to bring out its flavor.This butter will give you a lot of satisfaction. Try it on your favorite bread or English muffin in the morning!Ingredients: USDA Organic Culture Pasteurized Grade A Jersey Brand Cream, Salt, Enzymes.	8	oz	4.99	9.98	lb	Dairy	Butter	http://goodeggs1.imgix.net/product_photos/QKemTH62QmO6xXcUfZjg_FK1A5972.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	396	\N	\N	\N
483	Sea Salt Cultured Butter Roll	While working on a dairy farm in Brittany, France, Allison Hooper took careful note of what happened to the milk. After each milking, she set the cream aside. Natural, lactic bacteria took over, ripening it into cultured cream — or crème fraîche. When the thick result was churned into butter, she knew she had learned something valuable.Ingredients: Pasteurized cows' cream(milk), sea salt, salt, cultures.contains dairy	4	oz	3.69	14.76	lb	Dairy	Butter	http://goodeggs1.imgix.net/product_photos/l53m8OPHSjCzVpBhAjzA_FK1A5321.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	396	\N	\N	\N
484	Sheep Butter with Sea Salt	Farmstead Cream | Slowly Churned | Lightly Salted | Small Batch | Hand-packedHaverton Hill 100% Sheep’s Milk Butter is handcrafted in small batches using our fresh farmstead sheep cream produced at the source on our farm in Petaluma.  Our fresh cream  is slowly churned while delicious fine sea salt is lightly sprinkled throughout each batch creating our signature  European - style uncultured butter .  A creamy white appearance with an 85% butterfat and it's rich, smooth and mildly sweet flavor make Haverton Hill award winning 100% sheep butter a perfect addition to any meal.  Enjoy!2015 American Cheese Society WinnerIngredients: Sheep cream and sea salt	8	oz	13.99	27.98	lb	Dairy	Butter	http://goodeggs1.imgix.net/product_photos/EcZv5DQTEe1Ey4KKsfyk_X07aQEqt1B3i59vT9ZtUV9cLeF7zneaaNhYWTPQnvQI.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	396	\N	\N	\N
485	European Style Cultured Vegan Butter	Melts, cooks, bakes, spreads and tastes like butter. Made with Organic Coconut Oil & Organic Cashews. Made without palm oil or milk products.Free of cholesterol, lactose, egg, gluten and soy. Non-GMO product.Ingredients: Organic Coconut Oil, Water, Organic Safflower Oil or Sunflower Oil, Organic Cashews, Soy Lecithin, Sea Salt, Cultures.	8	oz	7.99	15.98	lb	Dairy	Butter	http://goodeggs2.imgix.net/product_photos/Q0Qgn4CuTqu9gDKMAFeD_FK1A0515.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	396	\N	\N	\N
549	Organic Coconut Ice Cream	We call this pillows of heaven. This coconut ice cream is loaded with coconut flakes and full flavor. A classic staff favorite for sure! Not too sweet and so much coconut flavor and texture. Ingredients: Organic Milk, Organic Cream, Organic Light Coconut Milk, Organic Coconut Flakes, Organic Egg Yolks, Organic Sugar	12	oz	9.29	0.77	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/xP4RK85XT9WXYe4UvKyb_FK1A7977.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
486	Organic Unsweetened Almond Milk	Our unsweetened almond milk is the true staple for your fridge. Four simple, organic ingredients create everything you need, and nothing you don’t. We start with single-source spring water and blend it with delicious organic almonds. Then we add just a touch of sea salt for balance, and organic acacia gum to make sure it actually comes back together when you shake it. Our unsweetened almond milk is just like you would make in your own kitchen. Simple, delicious, and good for just about anything.Ingredients: Organic Almondmilk (Spring Water, Organic Almonds), Organic Acacia Gum, Sea SaltContains AlmondsGluten-free, soy-free, produced in a peanut-free facility	28	fl oz	6.29	0.22	fl oz	Dairy	Nut & Soy Milk	http://goodeggs1.imgix.net/product_photos/QC4Kab8YRguvBzytG71H_FK1A3553.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
487	Almond Milk	Organic Ingredients: organic sprouted almonds, filtered water.Marin Living Foods strives to be a 100% organic company, with that in mind our ingredients are of the highest quality in our almond milk drinks.  Our almonds are in a raw and sprouted state before we make our almond milk drinks. Almond milk is one of the most nutritious milk substitutes available. Almond milk does not need to be fortified as almonds are naturally very nutritious, containing vitamin E, omega-3 fatty acids, manganese, selenium, magnesium, potassium, zinc, iron, fiber, phosphorous, calcium and flavonoids.Our almond milk is prepared free of preservatives and is 100% healthy.  The nut's soft texture, milk flavor, and light colouring makes for an efficient analog to dairy, and a soy-free choice for lactose intolerant people and vegans. Please shake well before enjoying our drinks. 	32	fl oz	10.99	0.34	fl oz	Dairy	Nut & Soy Milk	http://goodeggs2.imgix.net/product_photos/n6WuRFd9QeVvc9MMnuDy_FK1A5246.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
488	Organic Unsweetened Almond Milk	We take organic almonds and add a gentle roast to allow their natural flavor to shine through. The result is our signature taste that’s a pleasure to drink by the glass and blends perfectly in your recipes.     INGREDIENTS: Almond Base* (Water, Almonds*)Rice Starch*Sea SaltVanilla*Natural FlavorCarrageenanRiboflavin (B2)Vitamin A PalmitateVitamin D2	32	fl oz	3.49	0.11	fl oz	Dairy	Nut & Soy Milk	http://goodeggs1.imgix.net/product_photos/9tG7YGHTtSTeT06dle5A_FK1A0438.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
489	Organic Unsweetened Vanilla Almond Milk	By popular customer demand!  Our smooth almondmilk flavored with real vanilla is perfect in cereal, coffee, or anywhere you might use milk.  Consisting only of almonds and vanilla, Three Trees Unsweetened Vanilla Almondmilk is pure and healthy deliciousness.Simple, quality ingredients and tons of almonds – that’s how we achieve the pure deliciousness in every bottle. A slightly modified recipe of the original, Three Trees now mimic milk more closely. Three Trees is perfectly satisfying as a light meal, after a workout, or anytime you’re craving nourishing, clean energy.Ingredients: Filtered Water, Organic Almonds, Organic Vanilla Extract.	33.8	fl oz	8.99	0.27	fl oz	Dairy	Nut & Soy Milk	http://goodeggs1.imgix.net/product_photos/R5ZDmBGWQ0C2BETO06D5_032116_GoodEggs-4733.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
490	Organic Unsweetened Almond Milk	Taste the difference of true almondmilk.  We never use any additives, so what you're getting is a true almondmilk. The smooth, rich taste of our almond milks comes only from more almonds – that's the Three Trees difference.Simple, quality ingredients and tons of almonds – that’s how we achieve the pure deliciousness in every bottle. A slightly modified recipe of the original, Three Trees now mimic milk more closely. Three Trees is perfectly satisfying as a light meal, after a workout, or anytime you’re craving nourishing, clean energy.Ingredients: Filtered Water, Organic Almonds.	33.8	fl oz	8.99	0.27	fl oz	Dairy	Nut & Soy Milk	http://goodeggs2.imgix.net/product_photos/Cz9C7yqRnqMRUjb1wYB6_032116_GoodEggs-4728.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
491	Organic Original Almond Milk	We take organic almonds and add a gentle roast to allow their natural flavor to shine through. The result is our signature taste that’s a pleasure to drink by the glass and blends perfectly in your recipes.     INGREDIENTSAlmond Base* (Water, Almonds*)Dried Cane Syrup*Potassium CitrateSea SaltCarrageenanRiboflavin (B2)Vitamin A PalmitateVitamin D2 	32	fl oz	3.49	0.11	fl oz	Dairy	Nut & Soy Milk	http://goodeggs1.imgix.net/product_photos/JRIeDIgtQtmKAaXuoNHH_FK1A7360.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
492	Organic Almond Milk	Our sweetened almond milk is made just like you would make it at home. We start with single-source spring water and blend it with delicious organic almonds. Then we add just a touch of maple syrup and sea salt to give it the perfect balanced taste. Finally, we use organic acacia gum to make sure it actually comes back together when you shake it. Our sweetened almond milk is perfect for people who love the taste of regular dairy milk, but with only 7 grams of sugar. It is perfect for drinking straight out of a glass.Ingredients: Organic Almondmilk (Spring Water, Organic Almonds), Organic Maple Syrup, Organic Acacia Gum, Sea SaltContains AlmondsGluten-free, soy-free, produced in a peanut-free facility	28	fl oz	6.29	0.22	fl oz	Dairy	Nut & Soy Milk	http://goodeggs2.imgix.net/product_photos/YaNo3vG7RmiBilPZ8rav_FK1A3544.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
493	Classic Almond Milk	Classic Almond Milk Ingredients: organic blanched almonds, dates, vanilla bean, filtered waterIn two simple words our vegan milks are absolutely scrumptious! We are really reinventing the wheel here. Yes nut and rice milks have been made and consumed by vegans and the dairy intolerant for years, but when was the last time you had a nut milk infused with organic cacao and rose water? The Living Apothecary is hard at work, coming up with mouth watering vegan milk libations that are not only good for you in in-numerous ways, but are also so tasty they are impossible to resist. We pride ourselves on pushing the boundaries in just about every imaginable way in the world of living vegan. Our vegan milks are no exception. Every ingredient is made from scratch. Every combination, painstakingly taste tested. They are a perfect yang to our cold pressed juice and kefir water tonic's yin. After all, life is all about balance. 	32	fl oz	12.29	0.38	fl oz	Dairy	Nut & Soy Milk	http://goodeggs2.imgix.net/product_photos/wngfgcNoS8iTbgOK8ntg_FK1A2669.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
494	Organic Unsweetened Vanilla Almond Milk	We take organic almonds and add a gentle roast to allow their natural flavor to shine through. The result is our signature taste that’s a pleasure to drink by the glass and blends perfectly in your recipes.        INGREDIENTSAlmond Base* (Water, Almonds*)Rice Starch*Vanilla*Sea SaltNatural FlavorCarrageenanRiboflavin (B2)Vitamin A PalmitateVitamin D2	32	fl oz	3.49	0.11	fl oz	Dairy	Nut & Soy Milk	http://goodeggs2.imgix.net/product_photos/DFNNe2acQlejzd2UtREw_FK1A0431.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
495	Unsweetened Classic Almond Milk	Classic Almond Milk (Unsweetened)Ingredients: organic blanched almonds, filtered waterIn two simple words our vegan milks are absolutely scrumptious! We are really reinventing the wheel here. Yes nut and rice milks have been made and consumed by vegans and the dairy intolerant for years, but when was the last time you had a nut milk infused with organic cacao and rose water? The Living Apothecary is hard at work, coming up with mouth watering vegan milk libations that are not only good for you in in-numerous ways, but are also so tasty they are impossible to resist. We pride ourselves on pushing the boundaries in just about every imaginable way in the world of living vegan. Our vegan milks are no exception. Every ingredient is made from scratch. Every combination, painstakingly taste tested. They are a perfect yang to our cold pressed juice and kefir water tonic's yin. After all, life is all about balance. 	32	fl oz	12.29	0.38	fl oz	Dairy	Nut & Soy Milk	http://goodeggs2.imgix.net/product_photos/wngfgcNoS8iTbgOK8ntg_FK1A2669.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
496	Organic Soy Milk	This is as pure and simple as it \ngets – just soybeans and water.  Hodo Organic Soymilk is rich, creamy, and full of goodness. Good soybeans make good milk and we make our non-dairy milk the artisan way - a fine grind, boiled, triple pressed and strained -  using the \nfinest organic, non-GMO whole soybeans.  Unsweetened.Ingredients: Water, Organic Non-GMO SoybeansRecipe ideas: Best in it's pure form!  Or, add a splash of ginger vanilla syrup, or whisk in some matcha green tea.	1	half gallon	5.49	0.09	fl oz	Dairy	Nut & Soy Milk	http://goodeggs2.imgix.net/product_photos/rIVsPBMgT4ShAHUPNmNt_FK1A1359.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
497	Organic Unsweetened Soy Milk	Eden's Organic Unsweetened Soy Milk is smooth, delicious, and high in protein and essential fatty acids. It's made using only Non-GMO Verified soybeans grown on family farms in the Midwest and processed at Eden's own organic facility in Michigan, with no carageenan added. Their packaging is compostable and the soy milk can be stored unrefrigerated until opened. A great addition to your non-dairy pantry!Certified Gluten-Free, Carageenan Free.Ingredients: Purified Water, Organic SoybeansContains: Soy	32	fl oz	3.69	0.12	fl oz	Dairy	Nut & Soy Milk	http://goodeggs1.imgix.net/product_photos/Nj3avKES7GhXJIOaU7c5_20161007-EdenSoy_UnsweetenedOrigianl_MG_3285.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
498	Organic Original Soy Milk	Eden's Organic Original Soy Milk is naturally sweetened to create a delicious and nutritious drink, high in protein and essential fatty acids. It's made using only Non-GMO Verified soybeans grown on family farms in the Midwest and processed at Eden's own organic facility in Michigan, with no carageenan added. Their packaging is compostable and the soy milk can be stored unrefrigerated until opened.Carageenan Free, Non-GMO Verified.Ingredients: Purified Water, Organic Soybeans, Naturally Malted Organic Wheat and Barley Extract, Calcium Carbonate, Kombu Seaweed, Sea SaltContains: Soy	32	fl oz	3.69	0.12	fl oz	Dairy	Nut & Soy Milk	http://goodeggs2.imgix.net/product_photos/flu7OyT5SpqL8qorKYoz_20161007-EdenSoy_Original_MG_3283.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
499	Organic Vanilla Almond Milk	We take organic almonds and add a gentle roast to allow their natural flavor to shine through. The result is our signature taste that’s a pleasure to drink by the glass and blends perfectly in your recipes.      INGREDIENTSAlmond Base* (Water, Almonds*)Dried Cane Syrup*Potassium CitrateSea SaltNatural Vanilla Flavor With Other Natural FlavorsCarrageenanRiboflavin (B2)Vitamin A PalmitateVitamin D2	32	fl oz	3.49	0.11	fl oz	Dairy	Nut & Soy Milk	http://goodeggs1.imgix.net/product_photos/zw9NpbqSQbmRtsIjWzVM_FK1A7350.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
500	Organic Vanilla Almond Milk	Our vanilla almond milk is unlike anything you’ve ever tasted. In a good way. We start with single-source spring water and blend it with delicious organic almonds. Then we add just a touch of maple syrup and sea salt to give it the perfect balanced taste. Next, we use organic acacia gum to make sure it actually comes back together when you shake it. And, finally, we add organic vanilla extract, which gives it the signature vanilla flavor. Our vanilla almond milk is the favorite of kids everywhere. Some even say it takes like a milkshake. Try it in cereal, cold-brew coffee, or right out of bottle.Ingredients: Organic Almondmilk (Spring Water, Organic Almonds), Organic Maple Syrup, Organic Vanilla Extract, Organic Acacia Gum, Sea Salt.Contains AlmondsGluten-free, soy-free, produced in a peanut-free facility	28	fl oz	6.29	0.22	fl oz	Dairy	Nut & Soy Milk	http://goodeggs1.imgix.net/product_photos/eNW33BRR14PgnnW4pRpg_FK1A3549.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
501	Organic Nuts & Vanilla	A luscious blend of cashews, almonds and oats scented with cinnamon and ground vanilla beans, plus just a hint of sweetness from dates. This drink provides products that deliver high levels of healthy unsaturated fats, protein, antioxidants and phytochemicals and are great as a low sugar grab-and-go snack.Ingredients: Cashew milk (filtered water, cashews*), Almond milk (filtered water, almonds*), Oatmilk (Filtered water, gluten-free oats*), Dates*, Fermented corn sugar*, Vanilla bean*, Cinnamon*, Sea salt. *Organic Ingredients. Contains: Tree Nuts (Cashews, and Almonds)	16	fl oz	6.99	0.44	fl oz	Dairy	Nut & Soy Milk	http://goodeggs1.imgix.net/product_photos/5mbYKR3MRHOmgBfq6PEk_20160422-Forager_NutsVanilla_MG_7821.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	376	\N	\N	\N
502	Organic Unsweetened Cashew Milk	Pure, honest, and artfully crafted using heart healthy, 100% organic cashews. Our simple, subtle recipe sings the praises of whatever it accompanies.Forager’s 100% organic nut milks are perfect for people seeking to make their daily routine a little healthier. Light and creamy, all of our nut milk products are made using organic, unfiltered cashews. This product is unsweetened but there is some naturally occurring sugar from the cashews -- one ounce of cashews has 1.7g of sugar.We have added fermented corn sugar to our nut drinks to help naturally preserve product quality. Fermented corn sugar inhibits the growth of bacteria and spoilage organisms. It is Organic, non-GMO and makes up less than 0.5% of the overall product. It does not change the flavor or nutrition panel of the final product, it is not added as a sweetener and there is no additional grams of sugar as a result of its inclusion.Ingredients: Cashewmilk (filtered water, cashews*), Cassava root*, Vanilla extract*, Fermented corn sugar*, Sea salt.*Organic ingredients	28	fl oz	6.99	0.25	fl oz	Dairy	Nut & Soy Milk	http://goodeggs1.imgix.net/product_photos/XJiQMDo3SDWJj3bpAFMU_20161025-Forager_PlainCashewMilk_MG_4866.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
535	Coffee Toffee Ice Cream	Starting with organic dairy from Straus Family Creamery in Marshall (West Marin), we then blend in locally roasted Ritual Roasters coffee for a charged base that pairs exceptionally with crunchy bits of house made almond toffee mixed throughout. Ingredients: Cream*, Milk*, Egg Yolks*, Sugar*, Ritual Roaster’s Coffee, Butter, Tapioca Syrup*, Almonds, Vanilla, Salt. Contains: Dairy, Tree Nuts (Almonds) *Organic Ingredients	1	pint	9.99	\N	\N	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/8a5lgMMPT92VAEZiuY1M_FK1A9227.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
503	Organic Original Cashew Milk	Still pure and simple, a dash of fiber rich dates makes our delicious and carefully crafted original a slightly sweeter symphony of subtle goodness.Forager’s 100% organic nut milks are perfect for people seeking to make their daily routine a little healthier. Light and creamy, all of our nut milk products are made using organic, unfiltered cashews. We use dates to provide sweetness with meaning while organic cacao delivers powerful antioxidants. These Paleo-pleasing products are also vegan, gluten-free and soy-free.Ingredients: Cashewmilk (filtered water, cashews*), Dates*,Cassava root*, Fermented corn sugar*, Sea salt.	28	fl oz	6.99	0.25	fl oz	Dairy	Nut & Soy Milk	http://goodeggs2.imgix.net/product_photos/whCapRNNQpeWLmXcS3AH_20161025-Forager_OriginalCashewMilk_MG_4868.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
504	Raw Coconut Almond Milk (Quart)	Ingredients: young coconut water paired with sprouted almonds, filtered water, organic vanilla and pink himalayan sea salt 100% Raw and VeganNo Preservatives or AdditivesDairy, Soy, Carrageenan, and Gluten FreeHealthy and Delicious!   4 day shelf life (delivered fresh to GOOD EGGS on Saturday AM)Always Shake Well and Keep Refrigerated	32	fl oz	13.99	0.44	fl oz	Dairy	Nut & Soy Milk	http://goodeggs2.imgix.net/product_photos/l0P2rs1NSM6ntQEv53yL_FK1A1392.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
505	Vanilla Bean Almond Milk	Our vanilla bean almond milk is light, refreshing and naturally nutritious. It is 100% pure, raw, organic and abundant in almonds. Ideal for breakfast, as a post-workout drink, or a delicious and wholesome on-the-go beverage. Ingredients: organic almonds, organic medjool date, vanilla bean, purified water, pink himalayan salt	10.75	fl oz	4.99	0.46	fl oz	Dairy	Nut & Soy Milk	http://goodeggs1.imgix.net/product_photos/8aXVcu1jS728rry4vX1w_FK1A3454.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
506	Almond Vanilla Chia Milk	Organic Ingredients: sprouted almond milk, sprouted chia seeds, hemp seeds, vanilla extract, agave nectar, pink himalayan salt, filtered water.Marin Living Foods strives to be a 100% organic company, with that in mind our ingredients are of the highest quality in our almond milk drinks.  Our almonds are in a raw and sprouted state before we make our almond milk drinks. Our Almond Vanilla Chia Milk is a lightly sweetened milk with the ancient super-seed, the chia.  Each bottle contains 2 tablespoons of chia which has 24% RDI for magnesium and 50% RDI for manganese.  These tiny seeds are truly magical.Almond milk is one of the most nutritious milk substitutes available.  Almond milk does not need to be fortified as almonds are naturally very nutritious, containing vitamin E, omega-3 fatty acids, manganese, selenium, magnesium, potassium, zinc, iron, fiber, phosphorous, calcium and flavonoids.Our almond milk is prepared free of preservatives and is 100% healthy.  The nut's soft texture, milk flavor, and light colouring makes for an efficient analog to dairy, and a soy-free choice for lactose intolerant people and vegans. Please shake well before enjoying our drinks. 	10	fl oz	6.99	0.7	fl oz	Dairy	Nut & Soy Milk	http://goodeggs1.imgix.net/product_photos/Xh0HK43QCKc92fbnAv8Z_FK1A5251.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
507	Cold Brew Coffee Almond Milk	Our cold brew coffee almond milk is made from the finest Ritual cold brewed coffee, combined with the refreshing taste of lightly sweetened almond milk. It is 100% pure, raw, organic, and up to 67% less acidic than conventional coffee. A healthful and delicious alternative to your daily brew.Ingredients: organic almonds, organic medjool date, cold brew coffee, purified water, pink himalayan salt	10.75	fl oz	4.99	0.46	fl oz	Dairy	Nut & Soy Milk	http://goodeggs2.imgix.net/product_photos/vSgpH9J9SuMM2onytPZs_FK1A3440.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
508	Cacao Almond Milk	Our cacao almond milk has the delicious taste of raw cacao, lightly spiced with cinnamon. It is 100% pure, raw, organic and abundant in almonds. Ideal for breakfast, as a post-workout drink, or a delicious and nutritious on-the-go beverage. Ingredients: organic almonds, organic medjool date, organic cacao, organic cinnamon, purified water, pink himalayan salt	10.75	fl oz	4.99	0.46	fl oz	Dairy	Nut & Soy Milk	http://goodeggs1.imgix.net/product_photos/NGi9GbodTle2E0d8nrBV_FK1A3425.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
509	Cacao Almond Smoothie	Organic Ingredients: sprouted almond milk, raw cacao, agave nectar, vanilla extract, maca, pink himalayan salt.Marin Living Foods strives to be a 100% organic company, with that in mind our ingredients are of the highest quality in our almond milk drinks.  Our almonds are in a raw and sprouted state before we make our almond milk drinks. Our Cacao Almond Smoothie is made with raw cacao that is rich in magnesium and with the great Incan super food, Maca.  Maca is loaded with Vitamin B1, B2, B6, B12, fiber and so much more.  This chocolate milk will definitely make your taste buds chasse across the dance floor.  Enjoy!  Almond milk is one of the most nutritious milk substitutes available.  Almond milk does not need to be fortified as almonds are naturally very nutritious, containing vitamin E, omega-3 fatty acids, manganese, selenium, magnesium, potassium, zinc, iron, fiber, phosphorous, calcium and flavonoids.Our almond milk is prepared free of preservatives and is 100% healthy.  The nut's soft texture, milk flavor, and light colouring makes for an efficient analog to dairy, and a soy-free choice for lactose intolerant people and vegans. Please shake well before enjoying our drinks. 	10	fl oz	6.99	0.7	fl oz	Dairy	Nut & Soy Milk	http://goodeggs1.imgix.net/product_photos/LOCm79yRO6JxTf8LvaTw_FK1A5266%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	223	\N	\N	\N
510	Chai Spice Almond Milk	Our chai spice almond milk is lightly spiced, delicately sweet and naturally nutritious. It is 100% pure, raw, organic and abundant in almonds. Ideal for breakfast, as a post-workout drink, or a delicious and wholesome on-the-go beverage. Ingredients: organic almonds, organic medjool date, vanilla bean, organic cinnamon, organic cardamom, organic ginger, organic turmeric, purified water, pink himalayan salt	10.75	fl oz	4.99	0.46	fl oz	Dairy	Nut & Soy Milk	http://goodeggs1.imgix.net/product_photos/xpf0Bh1vSMCrunEAGh56_FK1A3432.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
511	Raw Coconut Almond Milk (Pint)	Ingredients: young coconut water paired with sprouted almonds, filtered water, organic vanilla and pink himalayan sea salt 100% Raw and VeganNo Preservatives or AdditivesDairy, Soy, Carrageenan, and Gluten FreeHealthy and Delicious!   4 day shelf life (delivered fresh to GOOD EGGS on Saturday AM)Always Shake Well and Keep Refrigerated	16	fl oz	9.99	0.62	fl oz	Dairy	Nut & Soy Milk	http://goodeggs1.imgix.net/product_photos/Lj0mNvYTiCzUQ3WQ89QR_FK1A1401.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
547	Organic White Pepper Chocolate Chip Ice Cream	This was one of Tara’s first flavors. Inspired by Asian cooking with White Pepper and the love of dark chocolate.  This ice cream has many layers to the flavor. It starts with sweet cream, then turns into the pepper spice, & it is rounded out with the dark chocolate bits.Be sure to try this one! It's a party in your mouth. Ingredients: Organic Milk, Organic Cream, Organic Egg Yolk, Organic Sugar, Organic White Pepper, Organic Dark Chocolate Chip	12	oz	9.29	0.77	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/e5fUuWgSqGuJof2MfI7P_FK1A7971.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
512	Pumpkin Cheesecake & Graham Cracker Ice Cream	This is a seasonal favorite from Bi-Rite Creamery. Tangy, creamy pumpkin cheesecake ice cream is studded with delicious chunks of graham cracker for a scoop to fulfill your wildest holiday dreams. It won't be around for long, so grab a pint while you can!Ingredients: Cream*, Milk*, Sweet Buttermilk*, Egg Yolks*, Pumpkin*, Cream Cheese, Brown Sugar, Flour*, Graham Flour*, Butter, Honey, Kosher Salt, Vanilla*, Ginger*, Cardamom*, Cinnamon*, Baking Soda. *Organic Ingredient Contains: Milk, eggs, wheat.	1	pint	8.99	0.56	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/9FgPYVV8Qh2enWeOlPG0_FK1A4872.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
513	Organic Vanilla Bean Ice Cream	We brought this most traditional ice-cream flavor back to the basics and to perfection: The six certified organic ingredients of cream, milk, sugar, egg yolks, vanilla extract and flecks of real vanilla bean are carefully blended. It will remind you of freshly churned ice cream you'd make at home. All Straus Family Creamery’s gourmet organic ice creams are Non-GMO Project Verified, certified kosher and gluten free.Ingredients: Pasteurized Organic\n  Cream And Organic Nonfat Milk, Organic Cane Sugar, Organic Egg Yolk, Organic\n  Vanilla Extract, Organic Ground Vanilla Bean.	1	pint	5.59	0.35	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/xdrBj9OYQAq1OAGnoswn_FK1A1773.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
514	Crème Fraîche Ice Cream	Humphry Slocombe uses local crème fraîche from Cowgirl Creamery in this brand-new, limited edition flavor. Its sweet tang is just what your pie is calling out for: fantastic with fall fruit galettes, tarts, or frankly just by the spoonful. It's only here in November, so snag a pint (or three) while you can!Ingredients: crème fraîche, sour cream, tapioca syrup, sugar, salt, buttermilk, vanilla extract. Contains: milk, eggs.	1	pint	9.99	0.62	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/rlisGANQ2LaPvewXEEfw_20161103-HumphreySlocombe_CremeFraiche_MG_6114.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
515	Mint Chip Ice Cream	Our mint chip is made with Seely Farm’s mint oil from Oregon and TCHO chocolate chips we make ourselves to ensure they are thin and delicate.Cream*, Milk*, Egg Yolks*, Sugar*, TCHO Bittersweet Chocolate, Seely Farm’s Mint Oil*, Rice Bran Oil, Salt (*= organic)Proudly made with Straus Family Creamery organic dairy located in Marshall, in West Marin, only 35 miles away.	1	pint	8.99	0.56	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/F0coyQZNQ8uvHx16xaBL_FK1A9240.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
516	Secret Breakfast Ice Cream	Bourbon ice cream with Cornflakes CookiesIngredients: Milk, cream, sugar, sweetened condensed milk (milk, sugar), bourbon alcohol, bleached enriched flour (bleached wheat flour, malted barley flour, niacin, iron, thiamin mononitrate, riboflavin, folic acid), butter (pasteurized cream, natural flavors), brown sugar, salt, corn flakes (milled corn, sugar, malt flavor, 2% or less salt, BHT added for freshness), eggs, baking soda, vanilla bean. Contains alcohol, dairy, gluten.	1	pint	9.99	0.62	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/UEsGel8cRmCaYri8u9I6_20160617-HumphrySlocombe_SecretBreakfast_MG_2941.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
517	Organic Mint Confetti Ice Cream	Mint chip enthusiasts rejoice! With flecks of the finest chocolate swirled throughout a smooth peppermint base, this is the most refined version we've ever tasted. Refreshing and indulgent!Ingredients: Organic Milk, Organic\n  Cream, Organic Evaporated Cane Juice, Organic Chocolate Chips (Organic Cane\n  Sugar, Organic Cocoa Paste, Organic Cocoa Butter, Non Gmo Soy Lecithin\n  (Emulsifier)), Organic Egg Yolks, Organic Nonfat Milk, Organic Vanilla\n  Extract, Organic Peppermint Extract, Organic Soybean Oil.	1	pint	4.99	0.31	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/aESGq1ohTnadh41DygIO_FK1A0528.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
518	Organic Sea Salted Caramel Ice Cream	Salted caramel is the new neutral and for good reason. Sweet and salty, it lends even more richness to this already creamy blend of milk, sugar, and eggs. Three Twin's signature heavy does of Madagascar vanilla really takes this one over the top!Ingredients: Organic Milk, Organic\n  Cream, Organic Evaporated Cane Juice, Caramel (Organic Sugar, Organic Cream,\n  Organic Non Fat Milk, Organic Tapioca Syrup, Organic Caramelized Sugar, Sea\n  Salt), Organic Egg Yolks, Organic Non Fat Milk, Organic Vanilla Extract.	1	quart	7.49	0.23	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/W94ih7jRxuuQcPPb9lCm_FK1A0473.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
519	Organic Sea Salted Caramel Ice Cream	Salted caramel is the new neutral and for good reason. Sweet and salty, it lends even more richness to this already creamy blend of milk, sugar, and eggs. Three Twin's signature heavy does of Madagascar vanilla really takes this one over the top!Ingredients: Organic Milk, Organic Cream, Organic Evaporated Cane Juice, Caramel (Organic Sugar, Organic Cream, Organic Non Fat Milk, Organic Tapioca Syrup, Organic Caramelized Sugar, Sea Salt), Organic Egg Yolks, Organic Non Fat Milk, Organic Vanilla Extract.	1	pint	4.99	0.31	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/W94ih7jRxuuQcPPb9lCm_FK1A0473.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
520	Salted Caramel Ice Cream	Our number one seller, famous for the deep rich flavor of sweet caramel balanced with just the right amount of salt.Cream*, Sugar*, Milk*, Egg Yolks*, Salt  (*= organic)Proudly made with Straus Family Creamery organic dairy located in Marshall, in West Marin, only 35 miles away.	1	pint	8.99	0.56	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/ZnSlBR1rT4OQIXMnL6GM_FK1A6809.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
521	Chocolate Chip & Tahitian Vanilla Ice Cream Sandwich	A brown sugar-y, chewy-but-soft chocolate chip cookie paired with Tahitian Vanilla Bean (made with the finest vanilla beans) to create the Mies Vanilla Rohe. Ingredients: pastry flour, pure chocolate chips, brown sugar, butter, whole eggs, natural vanilla, salt, baking soda, fruit juice, dextrin, milk, heavy cream, sugar, vanilla bean, salt, stabilizer. Contains dairy	5.8	oz	4.69	0.81	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/cLkFwJcSmC6KXFT1JSyy_Good%20Eggs%20072314-050.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
522	Double Chocolate & Mint Chip Ice Cream Sandwich	A decadent, chewy brownie cookie paired with fresh mint-infused ice cream with semisweet chocolate chips and a hint of brown sugar. Together they create the Mintimalism sandwich. Ingredients: Pastry flour, pure chocolate chips, cocoa powder, brown sugar, butter, whole eggs, natural vanilla, salt, baking soda, water, fruit juice, dextrin, milk, heavy cream, mint leaves, dark brown sugar, stabilizer.Contains dairy	5.8	oz	4.69	0.81	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/4g7CVwPRS2w7CNLFMnFg_Good%20Eggs%20072314-069.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
524	Organic Bittersweet Chocolate Ice Cream	Bittersweet Chocolate is Three Twins' standard chocolate ice cream, but there's really nothing standard about it. An abundance of organic cocoa makes it darker than most chocolate ice creams, and it also adds an incredibly rich flavor and texture. The milk, cream, sugar and eggs that Three Twins uses to make their clean, simple base form a blank palette on which to build this enticing flavor. They then add more organic cocoa than is standard. And, the twist: At a point where others consider their chocolate ice cream finished, they add the same organic vanilla extract that helps make so many of their other flavors so darn good. In fact, they actually add as much vanilla to their Bittersweet Chocolate as they put in their Madagascar Vanilla. Ingredients: Organic Milk, Organic\n  Cream, Organic Fair Trade Certified Cane Sugar, Organic Fair Trade Certified\n  Cocoa Powder Processed With Alkali, Organic Egg Yolks, Organic Nonfat Milk,\n  Organic Fair Trade Certified Vanilla Extract.	1	quart	7.49	0.23	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/2WaRow5QZWQzBVW1boD3_FK1A0476.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
525	Organic Bittersweet Chocolate Ice Cream	Bittersweet Chocolate is Three Twins' standard chocolate ice cream, but there's really nothing standard about it. An abundance of organic cocoa makes it darker than most chocolate ice creams, and it also adds an incredibly rich flavor and texture. The milk, cream, sugar and eggs that Three Twins uses to make their clean, simple base form a blank palette on which to build this enticing flavor. They then add more organic cocoa than is standard. And, the twist: At a point where others consider their chocolate ice cream finished, they add the same organic vanilla extract that helps make so many of their other flavors so darn good. In fact, they actually add as much vanilla to their Bittersweet Chocolate as they put in their Madagascar Vanilla. Ingredients: Organic Milk, Organic Cream, Organic Fair Trade Certified Cane Sugar, Organic Fair Trade Certified Cocoa Powder Processed With Alkali, Organic Egg Yolks, Organic Nonfat Milk, Organic Fair Trade Certified Vanilla Extract.	1	pint	4.99	0.31	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/1esWkcxjQvi24IU3e5SO_FK1A2126.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
526	Organic Dutch Chocolate Ice Cream	Lusciously rich, this organic ice cream is a chocolate lover’s delight. Dutch Cocoa is paired with only five simple, certified organic ingredients: Cream, milk, sugar, egg yolks and vanilla extract. No gums, fillers or artificial colorings get in the way of the rich, chocolate flavor. All Straus Family Creamery’s gourmet organic ice creams are Non-GMO Project Verified, certified kosher and gluten free.Ingredients: \n\n\n\n\n\n\n\n\n\n\n\n\n\n \n \n\n  Pasteurized Organic\n  Cream And Organic Nonfat Milk, Organic Cane Sugar, Organic Dutch Cocoa\n  (Processed With Alkali), Organic Egg Yolk, Organic Vanilla Extract.\n\n \n	1	pint	5.59	0.35	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/29nSUPMERRa8YtwWuDrL_FK1A1714.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
528	Malted Milk Chocolate Ice Cream	Rich, Guittard Milk Chocolate ice cream with MaltIngredients: Cream, non-fat milk, sugar, bittersweet chocolate (chocolate liquor processed with alkali, sugar, cocoa butter, milk fat, soy lecithin, vanilla), milk chocolate (sugar, whole milk powder, cocoa butter, soy lecithin, vanilla), egg yolk, sweet cream buttermilk, wheat and malted barley extracts, dry whole milk, salt, sodium bicarbonate. Contains egg, dairy, soy, gluten.	1	pint	9.99	0.62	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/XWCHYUBcTjC7oU7lYljz_20160617-HumphrySlocombe_MaltedMilkChoclate_MG_2959.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
529	Organic Vanilla Bean Ice Cream	Anything but Plain Jane, this staple flavor really showcases all the beautiful, fragrant nuance of truly world-class vanilla extract. The perfect companion for birthday cake and berry pie, this is also just perfect all on its own. Ingredients: \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n \n \n\n  Organic Milk, Organic\n  Cream, Organic Evaporated Cane Juice, Organic Egg Yolks, Organic Nonfat Milk,\n  Organic Vanilla Extract.	1	quart	7.49	0.23	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/ffD2fFGsSmWBEvxrnQ3J_FK1A0470.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
530	Organic Vanilla Bean Ice Cream	Anything but Plain Jane, this staple flavor really showcases all the beautiful, fragrant nuance of truly world-class vanilla extract. The perfect companion for birthday cake and berry pie, this is also just perfect all on its own. Ingredients:  Organic Milk, Organic Cream, Organic Evaporated Cane Juice, Organic Egg Yolks, Organic Nonfat Milk, Organic Vanilla Extract.	1	pint	4.99	0.31	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/jc2hBaBySaO4J68qd25r_FK1A2137.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
531	Vanilla Ice Cream	We use two types of vanilla in our recipe, both from Madecasse, to create the most vanilla-intense flavor we could make.Cream*, Milk*, Egg Yolks*, Sugar*, Madecasse Vanilla Beans and Extract, Salt (*=organic)Proudly made with Straus Family Creamery organic dairy located in Marshall, in West Marin, only 35 miles away.	1	pint	8.99	0.56	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/ZrxYQCcRSDSgmQOqI0NH_FK1A9436.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
532	Tahitian Vanilla Ice Cream	Vanilla ice cream with fresh hand-scraped Tahitian Vanilla BeansIngredients: Cream, non-fat milk, sugar, egg yolk, sweet cream buttermilk, wheat and malted barley extracts, dry whole milk, salt, vanilla, sodium bicarbonate, vanilla extract. Contains egg, dairy, gluten.	1	pint	9.99	0.62	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/zShO37I0TeROq4P2AAtv_20160617-HumphrySlocombe_TahitianVanillaMG_2930.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
533	Organic Coffee Ice Cream	Just a hint of organic Dutch Cocoa is blended with organic, decaffeinated, ground coffee bean. The result is a lusciously, rich taste that comes from just cream, milk, sugar, egg yolks, and decaffeinated organic coffee beans. It’s a coffee lover's delight.All Straus Family Creamery’s gourmet organic ice creams are Non-GMO Project Verified, certified kosher and gluten free.Ingredients: Pasteurized Organic\n  Cream And Organic Nonfat Milk, Organic Sugar, Organic Egg Yolk, Organic\n  Decaffeinated Freeze Dried Coffee, Organic Dutch Cocoa (Processed With\n  Alkali), Organic Vanilla Extract.	1	pint	5.59	0.35	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/IF6VEFFTpa3fpwTe0vSw_FK1A1516.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
534	Blue Bottle Vietnamese Coffee Ice Cream	Traditional\nVietnamese Coffee with Chicory, Sweetened Condense Milk and Giant Steps blend\nBlue Bottle CoffeeIngredients: Milk, cream, sugar, coffee, salt, chicory. Contains dairy.	1	pint	9.99	0.62	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/itohR4VVR94fLFruCbSg_20160617-HumphrySlocombe_BlueBottleVietnameseCoffee_MG_2935.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
536	Organic Lemon Cookie Ice Cream	An ice cream with a cult following! Three Twins combines their notoriously creamy lemon ice cream with chunks of vanilla sandwich cookies turning the classic cookies and cream combo on its head. Ingredients: Organic Milk, Organic\n  Cream, Organic Evaporated Cane Juice, Organic Sandwich Cookies (Organic Wheat\n  Flour, Organic Powdered Sugar With Organic Corn Starch, Organic High Oleic\n  Sunflower Oil, Organic Sugar, Organic Oat Flour, Organic Molasses, Baking\n  Soda, Sea Salt, Organic Vanilla Extract, Soy Lecithin, Natural Flavor),\n  Organic Egg Yolks, Organic Nonfat Milk, Organic Lemon Flavor.	1	pint	4.99	0.31	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/XYLbqBENRPPmvkBT6uUL_FK1A0512.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	374	\N	\N	\N
537	Organic Raspberry Ice Cream	This flavor tastes like a bowl of raspberries and cream...which it is!  No gums, stabilizers or colorings disturb the fresh, tangy flavor of organic raspberries in this blend of all-organic ingredients.All Straus Family Creamery’s gourmet organic ice creams are Non-GMO Project Verified, certified kosher and gluten free.Ingredients: Pasteurized Organic\n  Cream And Organic Nonfat Milk, Organic Sugar, Organic Raspberry Puree,\n  Organic Egg Yolk, Organic Vanilla Extract.	1	pint	5.59	0.35	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/Y4hNuDJtTSevRwhdvj9O_FK1A1637.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
538	Organic Caramel Toffee Crunch Ice Cream	This newest organic ice-cream flavor combines sea-salt infused toffee and caramel to create a delicious mix of sweet and savory flavors. The caramel is made with Straus's own Organic Butter and Organic Cream. All Straus Family Creamery’s gourmet organic ice creams are Non-GMO Project Verified, certified kosher and gluten free.Ingredients: Pasteurized Organic Cream And Organic Nonfat Milk, Organic Cane Sugar, Organic Dark Brown Sugar, Organic Cream [Organic Cream], Organic Egg Yolks, Water, Sea Salt, Organic Soy Lecithin (Non-Gmo, Added As An Emulsifier).	1	pint	5.59	0.35	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/BsSGQhBUQQmz3QDNvnuv_FK1A1825.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
539	Cookies and Cream Ice Cream	We make our Cookies and Cream with Newman O’s, hand chopped,  and mixed in to our ice cream. One of the most popular flavors we make for our younger guests.Cream*, Milk*, Sugar*, Eggs, Flour*, Palm Fruit Oil*, Rice Bran Oil, Cocoa, Chocolate*, Baking Soda, Soy Lecithin, Vanilla Extract, Salt (*= organic)Proudly made with Straus Family Creamery organic dairy located in Marshall, in West Marin, only 35 miles away.	1	pint	8.99	0.56	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/j5uP1dFvQ8G5tpnTVuHL_c9z2zEjVVOEMDFu6HdxTc8W3qB9wdFxLxxk8Se4BrPE.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
540	Honey Lavender Ice Cream	Made with local honey from Sonoma and organic dried lavender for a classic Provencal combination.Cream*, Milk*, Egg Yolks*, Sugar*, Local Honey, Lavender*, Salt   (*= organic)Proudly made with Straus Family Creamery organic dairy located in Marshall, in West Marin, only 35 miles away.	1	pint	8.99	0.56	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/5RMGEoYSEesvsRT0jv31_FK1A9323.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
541	Maple Walnut Ice Cream	Intensely maple-y ice cream folded with toasted walnuts combines autumnal sweetness and toasty crunch. Try it with Humphry Slocombe's Bourbon Caramel sauce. We promise you won't regret it!Ingredients: maple syrup, brown sugar, milk, salt, ice cream base (cream, nonfat milk, sugar, egg yolk, buttermilk), maple extract, vanilla extract, walnuts.Contains: milk, eggs, tree nuts.	1	pint	9.99	0.62	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/GS6aAlrJQdqsG7EkfcXt_20161103-HumphreySlocombe_MapleWalnut_MG_6097.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
542	Dark Chocolate Smoked Sea Salt Ice Cream	Dark Guittard chocolate is paired with a touch of smoked sea salt for the the perfect balance of savory and (not too) sweet that is sure to please even the most particular chocolate lovers. Since 2008 Humphry Slocombe has been handcrafting small batch ice cream with the best stuff available so everything tastes like it’s supposed to, but better—grab a spoon, this pint is calling!\nIngredients: Ice Cream Base (Cream, Nonfat Milk, Sugar, Egg Yolk, Buttermilk), Dark Chocolate (Cacao Beans, Pure Cane Sugar, Cocoa Butter, Sunflower Lecithin, Vanilla Beans), Tapioca Syrip, Sugar, Water, Cocoa Powder, Smoked Sea Salt. Contains: Milk, and Egg. Manufactured on equipment that also processes peanuts and tree nuts. Keep Fozen	1	pint	9.99	0.62	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/g8psgbxS0GHLx9LY9h2A_20160617-HumphrySlocombe_DarkChocolateSeaSalt_MG_2967.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
543	Harvey Milk and Honey Graham Ice Cream	Milk\nand Raw Blackberry Honey ice cream with Housemade Graham CrackersIngredients: Cream, non-fat milk, cane sugar, honey, egg yolk, sweet cream buttermilk, bleached enriched flour (wheat flour, malted barley flour, niacin, iron, thiamin mononitrate, riboflavin, folic acid), whole wheat flour, salt, graham flour, baking soda, cinnamon. Contains egg, dairy, gluten.	1	pint	9.99	0.62	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/H8dfRwalTqGdRgNGltrM_20160617-HumphrySlocombe_HoneyGraham_MG_2920.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
544	Matchadoodle Ice Cream	Generous chunks of cinnamon-y house-made snickerdoodle cookies are mixed throughout creamy matcha green tea ice cream. Don’t take our word for it, this one-of-a-kind pairing is one take on tea time you don’t want to pass up. Since 2008 Humphry Slocombe has been handcrafting small batch ice cream with the best stuff available so everything tastes like it’s supposed to, but better—grab a spoon, this pint is calling!\nIngredients: Ice Cream Base (Cream, Nonfat Milk, Sugar, Egg Yolk, Buttermilk), Snickerdoodle [All Purpose Flour (Bleached Wheat Flour, Malted Barley Flour), Unsalted Butter, Sugar, Brown Sugar, Eggs, Salt, Vanilla Extract (Water, Alcohol, Sugar, Vanilla Bean Extractives), Ground Cinnamon, Baking Soda, Cream of Tartar, Matcha Powder, Salt. Contains: Milk, Egg, and Wheat. Manufactured on equipment that also processes peanuts and tree nuts. 	1	pint	9.99	0.62	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/XleadbHTmSR7SEMwN1AW_20160617-HumphrySlocombe_MatchaDoodle_MG_2974.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
545	Peanut Butter Fudge Ripple Ice Cream	Peanut butter ice cream with a dark chocolate fudge swirlIngredients: Cream, peanut butter, fudge (corn syrup, sugar, water, butter, bittersweet chocolate, cocoa powder, salt, vanilla extract) salt. Contains dairy, egg, nuts	1	pint	9.99	0.62	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/4LKvSRbUQziXWcIDnOdT_20161103-HumphreySlocombe_PeanutButterFudge_MG_6121.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	396	\N	\N	\N
546	Organic Jasmine Green Tea Ice Cream	This delectable Organic Tea is made from freshly picked green tea leaves semi-fermented within fresh Jasmine flowers to impart a distinct floral aroma and flavor. A fragrant and delightful, creamy ice cream. It's like putting milk in your aromatic tea. So soothing and divine. Ingredients: Organic Milk, Organic Cream, Organic Egg Yolks, Organic Sugar, Organic Jasmine Green Tea	12	oz	9.29	0.77	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/s8kONWCGRC2RQ2kjtCyJ_FK1A7922.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
550	Organic Black Sesame Ice Cream	We lightly toast the Sesame Seeds and grind them for each batch. This ice cream is packed with antioxidants. The flavor is of light, toasty aroma, with a hearty, warming essence. We love this flavor especially in cold weather. It also makes a great combo with Coconut. Curl up with a container and enjoy.Ingredients: Organic Milk, Organic Cream, Organic Egg Yolks, Organic Sugar, Organic Black Sesame Seeds	12	oz	9.29	0.77	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/xRie9g8jTdyZmIcWC6C0_FK1A7946.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
551	Organic Lavender Ice Cream	Organic Lavender lends a floral and slightly sweet flavor. This ice cream is made from dried Organic Provence ~ French Lavender Flowers. It is so soothing, relaxing, delicate, and divine. Also it is often used as aromatherapy for relaxation. Close your eyes, put your feet up and pretend your at the ice cream spa. Or try it on grilled stone-fruit. Peaches, plums, or nectarine! Either way it's delicious. Ingredients: Organic Milk, Organic Cream, Organic Egg Yolks, Organic Sugar, Organic Dried Lavender Flowers	12	oz	9.29	0.77	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/0l5k9zuRmOriXSrNBx59_vEi0-oypiMlziBi7se4K9KDgvlY0bBV5pLkeWMVfMdk.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
552	Organic Basil Ice Cream	Made from fresh local Organic Basil this flavor is refreshing, savory, and bright. It makes a great a la mode on chocolate anything, fruit pie, crisp, or cobbler. Think of it as the new mint. Ingredients: Organic Milk, Organic Cream, Organic Egg Yolks, Organic Sugar, Organic Basil	12	oz	9.29	0.77	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/xTT2kypKSFisMOQkXLmD_FK1A7832.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	337	\N	\N	\N
554	Burnt Caramel Sauce	Our signature Burnt Caramel Sauce has an intense, smoky flavor with a \nlingering, buttery finish. Serve over fresh fruit, poached fruit or pie \nand ice cream.INGREDIENTS: Sugar, cream, butter. Contains Milk. Made in a facility that processes peanuts and tree nuts.	9	oz	10.99	1.22	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/yOyWOtMSzySkVrxAvotZ_FK1A8368.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	233	\N	\N	\N
555	Bourbon Caramel Sauce	A Humphry Slocombe classic: Bourbon Caramel. What more could you want? (Go ahead, put some in your coffee. We won't tell.)Ingredients: sugar, water, bourbon, tapioca syrup, salt.	9	oz	10.99	1.22	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/hEap1ZjQZsiGTXaX0fPg_20161103-HumphreySlocombe_BourbonCarmel_MG_6148.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	233	\N	\N	\N
556	Fernet Fudge Sauce	Dark chocolate is even better when paired with SF's favorite Fernet. The result: minty, herbal, indulgent deliciousness. This intensely chocolatey sauce is thick at room temperature, so we recommend warming it gently in a small saucepan or in a bowl in the microwave.Ingredients: water, sugar, tapioca syrup, cocoa powder, salt, 72% chocolate, Fernet.	9	oz	10.99	1.22	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/ar9gcghNS1uSKYNtQXvU_20161103-HumphreySlocombe_FernetFudge_MG_6150.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	233	\N	\N	\N
557	Extra-Bitter Chocolate Sauce	Our Extra-Bitter Chocolate Sauce is made with Michael's smoky custom \nblend of 64% dark chocolate, creating an extra thick consistency, and is\n finished with vanilla to enhance the roasted cacao profile of this \nchocolaty sauce! Warm to serve.INGREDIENTS: Dark chocolate ( cocoa beans, sugar, cocoa butter, soya lecithin\n(emulsifier), natural vanilla extract),\nsugar, cream, natural vanilla extract, cocoa\npowder. Contains\nMilk. Made in a facility that processes peanuts and tree nuts.	9	oz	10.99	1.22	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/Aq7ZMbyMTMyoRb5XdNdd_FK1A8372.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	233	\N	\N	\N
558	Sauce Duo	Turn plain old ice cream into heaven on a spoon. Mix and match with \nBurnt Caramel Sauce and Extra-Bitter Chocolate Sauce from our gourmet \ndessert Sauce Duo. (Two 9 oz jars).	2	count	21.99	1.22	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/Z4Q6BlmtSpy9RhEeE4bb_FK1A8973.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	233	\N	\N	\N
559	Vanilla Bean Paleo Gelato	Organic Bourbon vanilla beans have been cold extracted to capture their delicate intensity providing this non-dairy frozen dessert with a beautiful vanilla flavor throughout. Hand-packed and made in a dedicated Gluten and Nut-Free facility in the Dogpatch, San Francisco, all of Jöne’s Gelato delicious flavors are paleo, vegan, diabetic friendly, and free of the top 8 allergens.\nIngredients: Organic Coconut Milk (Organic Coconut, Water), Birch Tree Xylitol, Organic Vanilla Extract, Organic Vanilla Bean, Sea Salt, Agar Agar	12	oz	9.29	0.77	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/z7xATYjnT2Qrbievq2C6_20160421-JonesGelato_VanillaBean_MG_7777.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	401	\N	\N	\N
560	POG Tropical Fruit Sorbet	A true tropical vacation in a scoop, enjoy layers of flavor from passion fruit, orange and guava in this non-dairy dessert. Where the guava lends a pear-like mouth feel, it's the passionfruit that really stands out contributing a caramel complexity that helps cut back against the sweetness. Inspired by the seasons and their imaginations, Humphry Slocombe has been crafting inventive flavors with only the best ingredients since 2008—grab a spoon, this pint is calling!\nIngredients: Water, Sugar, Guava Paste (Guava Pulp, Sugar, Citric Acid, Pectin), Passionfruit Puree, Orange Juice, Tapioca Syrup, Lime Juice, Apple Cider Vinegar, Salt, Guar Gum. Manufactured on equipment that also processes peanuts and tree nuts.	1	pint	9.99	0.62	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/Uek40FpTQKREZraO6zdo_20160617-HumphrySlocombe_PogSorbet_MG_2952.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	267	\N	\N	\N
561	Dark Chocolate Paleo Gelato	Made with PASCHA’s 100% Cacao Chocolate Chips (certified vegan) this non-dairy frozen dessert has a rich and full-bodied flavor with a smooth mouth feel. Hand-packed and made in a dedicated Gluten and Nut-Free facility in the Dogpatch, San Francisco, all of Jöne’s Gelato delicious flavors are paleo, vegan, diabetic friendly, and free of the top 8 allergens. Ingredients: Organic Coconut Milk (Organic Coconut, Water), Organic Cacao Mass, Birch Tree Xylitol, Organic Raw Cacao, Sea Salt, Agar Agar	12	oz	9.29	0.77	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/tf7T6jBETOq0PMTXYm8D_20160421-JonesGelato_DarkChocolate_MG_7716.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	401	\N	\N	\N
562	Strawberry Paleo Gelato	Summer has arrived! Enjoy the bright and luscious flavor of peak-season local organic strawberries in Jöne's latest non-dairy frozen dessert offering. No added colors—just real strawberry goodness with a touch of vanilla to balance it all out. Hand-packed and made in a dedicated Gluten and Nut-Free facility in the Dogpatch district of San Francisco, all of Jöne’s Gelato delicious flavors are paleo, vegan, diabetic friendly, and free of the top 8 allergens.\nIngredients: Coconut Milk* (Coconut*, Water), Strawberries*, Birch Tree Xylitol, Vanilla Extract*, Sea Salt, Agar Agar. Contains: Coconut 	12	oz	9.29	0.77	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/2tNApaOS86SBzyq7LnJw_20160617-JonesGelato_Strawberry_MG_2990.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	401	\N	\N	\N
563	Masala Chai Paleo Gelato	Steeped with Samovar’s organic masala chai, this non-dairy frozen dessert has the deep spice and subtle sweetness of chai with a smooth and creamy mouth feel. Hand-packed and made in a dedicated Gluten and Nut-Free facility in the Dogpatch, San Francisco, all of Jöne’s Gelato delicious flavors are vegan, diabetic friendly, and free of the top 8 allergens. Ingredients: Organic Coconut Milk (Organic Coconut, Water), Birch Tree Xylitol, Organic Masala Chai (Organic black tea, organic cinnamon, organic cardamom, organic ginger, organic black pepper, organic clove), Sea Salt, Agar Agar. Contains: Coconut	12	oz	9.29	0.77	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/UsuZwgvuTUCxtfDrCYzQ_20160421-JonesGelato_MasalaChai_MG_7748.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	401	\N	\N	\N
564	Roasted Banana Paleo Gelato	Crafted with roasted organic bananas at their ripest, this non-dairy frozen dessert has a satisfying sweetness with notes of caramel and a smooth mouth feel. Hand-packed and made in a dedicated Gluten and Nut-Free facility in the Dogpatch, San Francisco, all of Jöne’s Gelato delicious flavors are vegan, diabetic friendly, and free of the top 8 allergens. \nIngredients: Organic Coconut Milk (Organic Coconut, Water), Organic Bananas, Birch Tree Xylitol, Organic Vanilla Extract, Sea Salt, Agar Agar	12	oz	9.29	0.77	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/miNClqIRQLOunHFsGAJT_20160421-JonesGelato_RoastedBanana_MG_7788.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	401	\N	\N	\N
565	Madagascar Vanilla Dairy-Free Gelato	Genuto's Madagascar Vanilla is made by blending their organic cashew base with organic Madagascar vanilla extract. It produces a perfectly sweet, creamy vegan and gluten-free scoop with a wonderful aroma of vanilla. Perfect for topping your holiday pies, blending into shakes, or enjoying on its own!Ingredients: water, cashews*, cane sugar*, Madagascar vanilla extract*, guar gum*, gum acacia* (organic ingredient*). Contains: tree nuts.	12	oz	9.99	0.83	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/Iu6G2IqbRbSx6ZQ7mSyE_vanilla.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	401	\N	\N	\N
566	Chocolate Raspberry Dairy-Free Gelato	We blend our organic cashew base with organic cacao powder and organic raspberry for a rich and bright treat!No air is introduced during our production process, so that our 12 oz container often weighs more than a pint of traditional ice cream.Ingredients:  Water, Organic Cashews, Organic Cane Sugar, Organic Cacao Powder, Organic Raspberry Extract, Organic Guar Gum, Organic Gum Acacia. Contains: Tree Nuts (Cashews)	12	oz	9.99	0.83	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/uKRvnq17TcmzKH28SxrP_chocraspberry.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	401	\N	\N	\N
567	Strawberry Rose Water Dairy-Free Gelato	Starting with our organic cashew base, we add strawberries and a dash of Bulgarian rose water.  The resulting rich creamy gelato is bursting with strawberry flavor with a hint of rose water.  Our newest flavor, it has quickly become one of our best sellers.No air is introduced during our production process, so that our 12 oz container often weighs more than a traditional pint of ice cream.Ingredients:  Water, Organic Cashews, Organic Cane Sugar, Strawberry Puree, Bulgarian Rose Water, Organic Guar Gum, Organic Gum AcaciaContains: Tree Nuts (Cashews)	12	oz	9.99	0.83	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/cZYzONf9SrOaCysiZRxM_strawberryrose.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	401	\N	\N	\N
568	Salted Date Caramel Non-Dairy Gelato	A creamy blend of our date caramel nut emulsion with organic roasted cacao nibs. A rich and creamy treat with a distinctive crunch!No air is introduced during our production process, so that our 12 oz container often weighs more than a pint of traditional ice cream.Ingredients:  Water, Organic Cashews, Organic Cane Sugar, Organic Dates, Organic Cacao Nibs, Natural Flavors, Organic Guar Gum, Organic Gum Acacia. Contains: Tree Nuts (Cashews)	12	oz	9.99	0.83	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/CHLc9CwYQfqHc5CZs1tq_salteddate.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	401	\N	\N	\N
569	Simply Dark Chocolate Dairy-Free Gelato	A dark chocolate lover's delight!  We blend our creamy organic cashew base with organic Peruvian cacao for a flavor sure to satisfy your chocolate cravings.No air is introduced during our production process, so that our 12 oz container often weighs more than a pint of traditional ice cream.Ingredients:  Water, Organic Cashews, Organic Cane Sugar, Organic Cacao Powder, Organic Vanilla Extract, Organic Guar Gum, Organic Gum AcaciaContains: Tree Nuts (Cashews)	12	oz	9.99	0.83	oz	Dairy	Ice Cream	http://goodeggs2.imgix.net/product_photos/zoeJkhguTaYnAWlSI43o_simplydark.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	401	\N	\N	\N
570	Organic Mango Agave Sorbet	Mangos are cultivated all over the world.  In tropical and subtropical climates. India is where it originated and it is considered sacred. There are so many varieties of mango trees and cuisines that utilize this delectable fruit. The creamy, pulpy, meat of the mango makes a rich and smooth sorbet. Sometimes the fruit is more tart and sometimes sweet, but always delicious and full flavor.Ingredients: Organic Mango, Organic Light Agave, Organic Lemon Juice, Water	12	oz	9.29	0.77	oz	Dairy	Ice Cream	http://goodeggs1.imgix.net/product_photos/saJvTmiQY6ajpj5dT5q3_FK1A7849.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	405	\N	\N	\N
571	Organic Sliced Sharp Cheddar	Perfect for cheeseburgers on Memorial Day!Our sharp organic cheddar has a full flavor with a balanced sharpness that's perfect for cheese lovers! Cheddar Cheese is a hard pale yellow to orange smooth textured cheese originally made in the English village of Cheddar, in Somerset. Cheddar flavors vary depending on length of aging and its origin. Sharp cheddar is aged for one to two years. This cheese is Certified Organic, Kosher, American Humane Certified and Non-GMO Verified.Rumiano Cheese Company is California's oldest family-owned cheese company, dedicated to the manufacture and distribution of the highest quality cheese. Their main focus is providing their customers with the utmost service and quality. Their success is measured by their loyalty to their employees and vendors and to the success of their customers.Ingredients: Natural Cheese made from pasteurized cultured organic milk, sea salt, enzymes.	6	oz	3.79	10.11	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/P1MZ1IsLS3OHWxcCeNwp_FK1A9351.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
573	Shredded Sharp Cheddar	For nine long months, we wait. That’s what it takes to produce the full-bodied, naturally-aged sharpness of Tillamook Sharp Cheddar. For our farmer-owners, patience isn’t just a virtue, it’s a value, and it guides the cheesemaking process. Maybe that’s why the United States Championship Cheese Contest® voted it ‘America’s Best’. We think you’ll agree when you use it to zing up your appetizers, main dishes, and sandwiches.Contains no animal rennet (vegetarian)Ingredients: Cultured Milk, Salt, Enzymes, Annatto (color), Potato Starch and Cellulose Powder (added to prevent caking), Natamycin (natural mold inhibitor).Allergens: Contains milk	8	oz	4.29	8.58	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/u2giT5MnRmikAqhmLs0h_FK1A6744.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
574	Shredded Mexican 2 Cheese	Tillamook Medium Cheddar and Pepper Jack Cheese team up to pack twice the flavor into this shredded blend. And neither is short on flavor alone. Our Medium Cheddar is aged naturally for 60 days, just like its century-old recipe calls for. And our Pepper Jack is laced with real bits of peppers. Uno, open the bag. Dos, use it to top tacos, enchiladas, and nachos. Olé!Ingredients:  Pepper Jack Cheese (cultured pasteurized milk, jalapeno peppers, salt, enzymes), Medium Cheddar Cheese (cultured milk, salt, enzymes, annatto [color]), Potato Starch and Cellulose Powder (added to prevent caking), Natamycin (natural mold inhibitor).Allergens: Contains Milk	8	oz	4.29	8.58	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/OxM8R9d3RimRiqif0Rq3_FK1A2832.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
575	Organic Sliced Monterey Jack	A California original, Monterey Jack was originally made by Franciscan monks of Monterey, California during the 1800’s and later marketed by businessman David Jacks, hence the name Monterey Jack. This organic version is a pale yellow semi-hard cheese, with a creamy texture and a mild flavor. Rumiano’s organic Monterey Jack color is a direct result from the high butterfat organic Jersey cow’s milk that it is made from. Rich Jersey cow’s milk also gives it a creamy buttery texture and mild flavor. Organic Monterey Jack is a versatile cheese eaten as a snack with bread or crackers or used in cooked foods. This cheese is Certified Organic, Kosher, American Humane Certified and Non-GMO Verified.Rumiano Cheese Company is California's oldest family-owned cheese company, dedicated to the manufacture and distribution of the highest quality cheese. Their main focus is providing their customers with the utmost service and quality. Their success is measured by their loyalty to their employees and vendors and to the success of their customers.Ingredients: Natural Cheese made from pasteurized cultured organic milk, sea salt, enzymes.	6	oz	3.79	10.11	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/UK3gIlJIQpem3ecW9vNV_FK1A9318.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
576	Organic Sliced Mild Cheddar	This semi-soft organic mild cheddar has a mild cheddar flavor and is a favorite on its own, as well as in many cooking recipes. Cheddar Cheese is a hard pale yellow to orange smooth textured cheese originally made in the English village of Cheddar, in Somerset. Cheddar flavors vary depending on length of aging and its origin. Mild is typically aged for less than 6 months. This cheese is Certified Organic, Kosher, American Humane Certified and Non-GMO Verified.Rumiano Cheese Company is California's oldest family-owned cheese company, dedicated to the manufacture and distribution of the highest quality cheese. Their main focus is providing their customers with the utmost service and quality. Their success is measured by their loyalty to their employees and vendors and to the success of their customers.Ingredients: Natural Cheese made from pasteurized cultured organic milk, sea salt, enzymes.	6	oz	3.79	10.11	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/55BveA13QhWNvPYF0zNi_FK1A9333.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
577	Shredded Medium Cheddar	A century in the eating, Tillamook Medium Cheddar is still made from the same recipe we’ve used for over 100 years. While our equipment might look a little different these days, we use only four simple ingredients and age every batch naturally for at least 60 days. No wonder it was voted 'America's Best' at the 2015 International Cheese Awards.Contains no animal rennet.Ingredients: Cultured Milk, Salt, Enzymes, Annatto (color), Potato Starch and Cellulose Powder (added to prevent caking), Natamycin (natural mold inhibitor).Allergens: Milk	8	oz	4.29	8.58	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/W5nQmaWORQWQEDCso2He_FK1A2833.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
578	Sliced Sharp Cheddar	Tillamook's Sliced Sharp Cheddar is aged for nine months, resulting in a full-bodied and naturally aged sharpness. From next-level grilled cheese sandwiches to a perfectly balanced omelette, you'll find a hundred and one perfect ways to use this flavorful cheese.Contains no animal rennet (vegetarian)Ingredients: Cultured Milk, Salt, Enzymes, Annatto (color).Allergens: Milk	8	oz	4.99	9.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/M33raeiBQNC2hasSpgN6_20161012-Tillamook_SharpCheddarSlices_MG_3587.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
579	Sliced Medium Cheddar	Aged naturally for at least 60 days, Tillamook's Sliced Medium Cheddar is made using the same recipe they've used for over 100 years. A great balanced flavor from a classic cheese for sandwiches, melting or easy shredding for use in other recipes. Contains no animal rennet (vegetarian)Ingredients: Cultured Milk, Salt, Enzymes, Annatto (color).Allergens: Milk	8	oz	4.99	9.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/qID6jHJDTE6y61T4GVmH_20161012-Tillamook_MediumCheddarSlices_MG_3592.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
580	Shredded Italian 3 Cheese	Tillamook Italian Blend Shredded Cheese combines Mozzarella and Parmesan—the rich and creamy building blocks of any great Italian dish. Every shred is made with pure and natural milk from cows not treated with artificial growth hormones.* Plus, it comes in an easy-to-use, re-sealable bag. Now that’s Tillamook quality and convenience. Perfetto!Contains no animal rennet (vegetarian)Ingredients: Mozzarella Cheese (cultured pasteurized part-skim milk, salt, enzymes), Parmesan Cheese (cultured pasteurized part-skim milk, salt, enzymes), Potato Starch and Cellulose Powder (added to prevent caking), Natamycin (natural mold inhibitor).Allergens: Contains milk	8	oz	4.29	8.58	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/jMj5pbSNRrOrz4GJMA16_FK1A2872.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
581	Shredded Mozzarella Cheese	Creamy and mild, Tillamook Mozzarella was made to do exactly what you want it to: melt atop scrumptious dishes. That’s because we make it with the highest-quality, farm-fresh milk. Our facilities even use larger pipes than most to transport our milk so that we’re extra gentle to it. Use our Mozzarella to crown pizzas, fold it between layers of lasagna, or melt it atop pasta. It goes from shreds to gooey meltedness before you can even say cheese.Contains no animal rennet (vegetarian)Ingredients: Cultured Pasteurized Part-Skim Milk, Salt, Enzymes, Potato Starch and Cellulose Powder (added to prevent caking), Natamycin (natural mold inhibitor).Allergens: Contains Milk	8	oz	4.29	8.58	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/cM90U9iMSm27C231joOp_FK1A2824.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
605	Tillamoos Medium Cheddar	A century in the eating, Tillamook Medium Cheddar is still made from the same recipe we’ve used for over 100 years. While our equipment might look a little different these days, we use only four simple ingredients and age every batch naturally for at least 60 days. No wonder it was voted 'America's Best' at the 2015 International Cheese Awards.Ingredients: Cultured Milk, Salt, Enzymes, Annatto (color).	7.5	oz	4.99	10.65	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/EstegN8sRyKzfPGIYhat_tillamoos_2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
582	Organic Sliced Mozzarella	The classic Italian mozzarella is made fresh with our best organic ingredients. Resembling Monterey Jack in color and texture, this stirred curd organic Mozzarella is available in a whole milk version. Mozzarella is a favorite ingredient in Italian dishes such as pizza, lasagna, and caprese salad. This cheese is Certified Organic, Kosher, American Humane Certified and Non-GMO Verified.Rumiano Cheese Company is California's oldest family-owned cheese company, dedicated to the manufacture and distribution of the highest quality cheese. Their main focus is providing their customers with the utmost service and quality. Their success is measured by their loyalty to their employees and vendors and to the success of their customers.Ingredients: Natural Cheese made from pasteurized cultured organic milk, sea salt, enzymes.	6	oz	3.79	10.11	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/HDY15RavRRKiUlmyvbBX_FK1A9345.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	309	\N	\N	\N
583	Sliced Swiss Cheese	A bit nutty and a bit sweet, this 75-day aged Tillamook Swiss Cheese is as holey as anyone could ask for. Neatly sliced for perfect sandwiches, cheeseburgers or just eating out of hand.Contains no animal rennet (vegetarian).Ingredients: Cultured Part-Skim Milk, Salt, Enzymes.Allergens: Milk	8	oz	4.99	9.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/9110XCrQR3W131HoR8iP_20161012-Tillamook_SwissSlices_MG_3602.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
584	Sliced Colby Jack	A long-time favorite, Tillamook's Colby Jack is a two-time winner of the US Championship Cheese Contest. We're happy to bring it to you in this sliced version, a perfect mellow blend of flavors. We think it'll win you over, too.Contains no animal rennet (vegetarian)Ingredients: Cultured Pasteurized Milk, Salt, Enzymes, Annatto (color).Allergens: Milk	8	oz	4.99	9.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/eWwtsXSZSqkM2354ISZD_20161012-Tillamook_ColbyJAckSlices_MG_3600.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
585	Organic Sliced Pepper Jack	Perfect for cheeseburgers on Memorial Day!This spicy organic variation of our classic Monterey Jack includes hot peppers for added flavor. Rumiano Cheese Company is known for popularizing the term of the use "pepper jack" for this spicy style of Monterey Jack cheese. Organic Pepper Jack cheese is made using only the finest organic green and red jalapeno peppers. These ingredients combined with the creamy organic Monterey Jack create a zesty flavor that is sure to have any fan of spice coming back for more. This cheese is Certified Organic, Kosher, American Humane Certified and Non-GMO Verified.Rumiano Cheese Company is California's oldest family-owned cheese company, dedicated to the manufacture and distribution of the highest quality cheese. Their main focus is providing their customers with the utmost service and quality. Their success is measured by their loyalty to their employees and vendors and to the success of their customers.Ingredients: Natural Cheese made from pasteurized cultured organic milk, organic jalapeno peppers, sea salt, enzymes.	6	oz	3.79	10.11	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/5L9C1OmVS1CoyRiomrYh_FK1A9308.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	287	\N	\N	\N
586	Ciliegine Mozzarella	Excellent for quick appetizers and salads with cherry size tomatoes. Fun for kids!	8	oz	4.99	9.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/nGN5SJASRKaJkc7puJKJ_FK1A1803.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	309	\N	\N	\N
587	Burrata	Burrata is a small bag of mozzarella, filled with cream and more mozzarella. Belfiore's flavor is milky-creamy-gooey goodness, much like the flavor of fresh milk. Adding olive oil and a pinch of salt is a straight trip to an Italian trattoria.Ingredients: Pasturized cow's milk, cream, vinegar, sea salt, cultures, vegetarian rennet. 	8	oz	5.99	11.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/bqrFSvAOQdazhLvnGuUD_FK1A7351.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	256	\N	\N	\N
588	Jersey Cow's Milk Ricotta	Traditionally in Italy ricotta is made only using the finest milk. Unlike other American ricotta that uses whey, Bellwether honors Italian cheesemaking by only using fresh Jersey Cow's milk. The rich and decadent texture is due to the high fat content in the milk. Want to spruce up a lackluster recipe? Add this ricotta! Alternatively, take advantage of the ice cream like texture and add honey, fruit, nuts, or chocolate. It's the perfect cure to any after dinner sweet tooth!Ingredients: Cultured Grade A Pasteurized Jersey Cow’s Milk, Salt Contains: Dairy	12	oz	6.99	9.32	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/oNih4E13Qv2j08ogUjAF_FK1A1883.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	216	\N	\N	\N
589	Organic Mozzarella	The classic Italian mozzarella is made fresh with our best organic ingredients. Resembling Monterey Jack in color and texture, this stirred curd organic Mozzarella is available in a whole milk version.Mozzarella is a favorite ingredient in Italian dishes such as pizza, lasagna, and caprese salad. This cheese is Certified Organic, Kosher, American Humane Certified and Non-GMO Verified.Rumiano Cheese Company is California's oldest family-owned cheese company, dedicated to the manufacture and distribution of the highest quality cheese. Their main focus is providing their customers with the utmost service and quality. Their success is measured by their loyalty to their employees and vendors and to the success of their customers.Ingredients: Natural Cheese made from pasteurized cultured organic milk, sea salt, enzymes.	8	oz	5.49	10.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/4KYtO87fTTV37vRpDlUg_FK1A0997.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	309	\N	\N	\N
590	Pt. Reyes Farmstead Fresh Mozzarella	Fresh Mozzarella Cheese - Pt Reyes Farmstead Cheese CompanyThe best fresh mozzarella we've tried, ready to be melted on a pizza or sliced for a caprese salad.  Light & pillowy soft, the ball comes packed with water in a recyclable plastic container.Pasteurized Cow's MilkVegetarian RennetCertified Kosher & Gluten Free	8	oz	7.99	15.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/zQL12PA8QEeZPiT1n5U8_FK1A1935.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	309	\N	\N	\N
591	Fior di Latte Fresh Mozzarella	Belfiore Cheese Company is one of the few remaining small, family-owned cheese making operations in the Bay Area. All Belfiore products are made 100% naturally without any additives or preservatives. The operation was established in 1987 as one of first pioneers producing hand crafted Italian-style Mozzarella, Fior di Latte (or Fresh Mozzarella in water) here inAmericaIn 1989, new owners, pursuing the same dreams of perfection in cheese making, took over the small operation and continued the same traditional cheese making techniques with a passion to preserve the genuine quality and homemade style that has become the signature of the Belfiore Cheese brand.Ingredients: Pasteurized cow's milk , vinegar, sea salt, cultures, vegetarian rennet.Contains dairy	8	oz	5.99	11.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/2xq0yI5PQs2PQ8UxoubF_FK1A1757.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	309	\N	\N	\N
592	Ricotta	Made with fresh whole cow's milk. Creamy and delicious, perfect for lasagna and other pasta dishes.Belfiore Cheese Company is one of the few remaining small, family-owned cheese making operations in the Bay Area. All Belfiore products are made 100% naturally without any additives or preservatives. The operation was established in 1987 as one of first pioneers producing hand crafted Italian-style Mozzarella, Fior di Latte (or Fresh Mozzarella in water) here inAmericaIn 1989, new owners, pursuing the same dreams of perfection in cheese making, took over the small operation and continued the same traditional cheese making techniques with a passion to preserve the genuine quality and homemade style that has become the signature of the Belfiore Cheese brand.Ingredients: Whole milk and wheyContains Dairy	16	oz	4.99	4.99	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/GdrNlD1hSDufzeOv2nZx_FK1A1839.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	232	\N	\N	\N
593	Sheep's Milk Ricotta	This fluffy, decadent ricotta is reminiscent of homemade marshmallows or a meringue. In order to ensure that there is no waste at Bellwether, they mix the drained off whey from the production of their harder cheeses and fresh sheep's milk. It is soft and light. Because of it's rich texture we suggest using it as a perfect substitute for cream cheese, creme fraiche, or fromage blanc! Or just open up the package, add some honey, grab a spoon, and dig in!Ingredients: Cultured Pasteurized Sheep Whey, Pasteurized Sheep Milk, SaltContains: Dairy	12	oz	10.99	14.65	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/y3wbFUDoTASwA1O2DhiY_FK1A0969.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	232	\N	\N	\N
594	Ricotta Salata	"I always keep this in my fridge. Perfect for crumbling on any dish. Cheese kitchen staple for sure!" Erin, Good Eggs BuyerRicotta Salata is an Italian cheese made from the whey part of sheep milk, which is pressed, salted and aged for at least 90 days. It is milky white in colour with firm texture and salty taste. The cheese is often used in salads and ideal for slicing, crumbling and grating.	5.34	oz	4.99	14.95	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/f4FafCmhTba0CpVtKzzU_FK1A0105.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	232	\N	\N	\N
596	Plain Cream Cheese	House-made cream cheese. Ingredients: cream, milk.	8	oz	5.99	11.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/9VQYbSAuRieFIE2z8CHy_FK1A4607.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
597	Organic Farmhouse Cream Cheese	Made with only milk & cream and sea salt (no gums or fillers), this Best of Show award-winning cheese is vat-cultured, drained in muslin bags, and hand-rotated to produce a unique flavor & texture that you’ll find delightfully addictive!Sierra Nevada Cheese Company strives to bring you the best products free from artificial ingredients or hormones. Our organic dairy partners achieve American Humane Association animal welfare standards.Ingredients: Organic Pasteurized Cultured Milk and Cream, Sea Salt	7	oz	4.29	9.81	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/gC7IHWHuSQO7IBkMTBpz_FK1A8543.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
598	Organic Jersey Cow's Milk Cream Cheese	"Tomales Farmstead now has Organic Jersey cow's milk cream cheese that is decadent and delicious. I suggest making a spinach and artichoke dip with it or just spread it on a bagel. Either way it's the perfect cream cheese" - Erin, Grocery BuyerThe first and only Bay Area organic, cream cheese. The jersey milk comes from a farmer friend in the town of Tomales. No added gums or fillers. Several of us were sitting around kevetching about the lack of a great local cream cheese and our love for our Sunday lox and bagels so we decided to just make it happen.Luscious and velvety with the sweetness of Jersey milk from the gorgeous pastures of West Marin to your bagel! Enjoy!Ingredients: Organic pasteurized jersey cow's milk, cream cheese cultures, rennet, salt. Contains dairy	8	oz	7.99	15.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/AurSigbSUCFsIRQmCinr_20160429-TomalesFarmstead_CreamCheese_MG_8494.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
599	Scallion Cream Cheese	Sliced chives mixed with cream cheese.Ingredients: Chives, Cream, Milk.	8	oz	6.99	13.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/hn1OTeDvTlaxOaONqQlD_vmri3CGjcxmXqO8FyN8melFetvugRaIM24A32LwGUdU.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
600	Jalapeño Cream Cheese	House-made cream cheese blended together with local farm fresh jalapeños. Ingredients: jalapeños and cream cheese.	8	oz	6.99	13.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/ezx7nV1aQJO92y0t0RZH_FK1A4571.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
601	Vegetable Cream Cheese	House-made cream cheese together with local farm fresh vegetables. Ingredients: Green, Red bell peppers, Carrot, Cucumber, Red onion, and cream cheese.	8	oz	6.99	13.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/R9lLe8MrTRSUvIzwwPdS_FK1A4593.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
602	Organic Lactose Free Cream Cheese	Green Valley Organics® lactose-free cream cheese has a superb cheesy flavor, is lower in salt, and has a thick, creamy texture. Enjoy this minimally-processed, real dairy cream cheese on a bagel, in baking, as a spread, in dips, and in creamy sauces and soups.Green Valley Organics' lactose-free dairy is made by Redwood Hill Farm & Creamery in Sebastopol CA. Ingredients: organic cream, sea salt, lactase enzyme and live, active cultures	8	oz	3.39	6.78	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/1sq8vPbBSiOiU8TaKUrY_greenvalley_creamcheese.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
603	Lox Cream Cheese	House-made cream cheese blended together with house-cured salmon. Ingredients: cream cheese, lox. Lox ingredients:  Fresh salmon, kosher salt, brown and white sugar, pint peppercorn, lemon and fresh herbs.	8	oz	7.99	15.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/qPGk0BZMRA26wNE9QS2c_FK1A4616.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
604	Oaxacan String Cheese	This string cheese comes from Cesar's Cheese company out of Columbus, WI. Cesar and his family moved to Wisconsin from Oaxaca and started making the cheeses that Cesar's learned how to make as a young boy. In 2008, after Cesar earned his cheesemaking license, his company opened. Oaxaca cheese is traditionally pulled by hand and Cesar and his wife Heydi continue this tradition by pulling all the string cheese by hand. This string cheese has a beautiful chewy texture and the perfect amount of salt. Pack in your lunch, eat on the run, or have an afternoon snack. This Oaxacan string cheese knows no age limits so adults and kids enjoy!Ingredients: Pasteurized cow's milk, enzymes, cultures, salt ( and love!).Contains dairy	8	oz	7.99	15.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/aID1SChzR8WDz5imI8Fg_20160825-Cesar_StringCheese_MG_8754.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
616	Graziers Raw Milk White Sharp Cheddar	This sharp cheddar cheese will be a fridge staple!Graziers Raw Milk Sharp Cheddar Cheese is made from milk from Certified Graziers at Alderson and Belo Dairies. Enjoy the benefits of grass-fed and raw milk! 	8	oz	4.99	9.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/8ZXdGk1QniY5dq2qqKSX_File0219.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
606	Sharp White Cheddar Tillamoos	For nine whole months, Sharp White Cheddar waits. It waits and it waits because that’s how we make cheese—without rushing it out the door. Once its full, sharp flavor has just enough bite to pair magically with crackers, meats, smoked fish, nuts, and wine—we’re satisfied. And if that sounds like a feast, it’s because nine months of preparation deserves a celebration.Ingredients: Cultured Milk, Salt, Enzymes.Contains milk 	7.5	oz	4.99	10.65	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/nLlttVRcT6qm9XAjPpHv_tilamoos_whitecheddar.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
607	Gruyere	While Switzerland is the country most people associate with Gruyere's origin, its history actually encompasses several European countries. About a thousand years ago, the Holy Roman Empire extended its wily grip around all of what we now know as France, Switzerland, and some of Germany, and the forests of this area were called "gruyeres." Charlemagne's men sold wood to the cheesemakers of the area to power their curd cooking kettles, and the cheesemakers paid for the wood with their cheeses. These are the cheeses that we now know, eat and love as Comte and Gruyere. Gruyere is smooth in texture and has rich, beefy flavors that are tempered by hints of apples and pears. Famously used in fondue recipes, this cheese melts fabulously and is amazing in grilled cheese sandwiches, gratins, sauces or just for snacking.	6	oz	8.49	22.64	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/S9BqwRgGR8KFc6txpHRM_FK1A2398.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	243	\N	\N	\N
608	Graziers Raw Milk Monterey Jack	Monterey Jack is a very mild, buttery tasting cheese perfect for melting on everything from sandwiches to omelets!Graziers Raw Milk Sharp Cheddar Cheese is made from milk from Certified Graziers at Alderson and Belo Dairies. Enjoy the benefits of grass-fed and raw milk! 	8	oz	4.99	9.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/KvUaZdASQi6hA5QYLsm8_File0201.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
609	Tillamoos Colby Jack	A century in the eating, Tillamook Medium Cheddar is still made from the same recipe we’ve used for over 100 years. While our equipment might look a little different these days, we use only four simple ingredients and age every batch naturally for at least 60 days. No wonder it was voted 'America's Best' at the 2015 International Cheese Awards.Ingredients: Cultured Pasteurized Milk, Salt, Enzymes, Annatto (color).Contains milk Contains no animal rennet (vegetarian)	7.5	oz	4.99	10.65	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/8xBd53SFQYSzwzUkC5cy_FK1A7752.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
610	Organic Monterey Jack	This is our classic organic Monterey Jack, a semihard cheese with a fresh, mild flavor. A California original, Monterey Jack was originally made by Franciscan monks of Monterey, California during the 1800’s and later marketed by businessman David Jacks, hence the name Monterey Jack. This organic version is a pale yellow semi-hard cheese, with a creamy texture and a mild flavor. Rumiano’s organic Monterey Jack color is a direct result from the high butterfat organic Jersey cow’s milk that it is made from. Rich Jersey cow’s milk also gives it a creamy buttery texture and mild flavor. Organic Monterey Jack is a versatile cheese eaten as a snack with bread or crackers or used in cooked foods.Rumiano Cheese Company is California's oldest family-owned cheese company, dedicated to the manufacture and distribution of the highest quality cheese. Their main focus is providing their customers with the utmost service and quality. Their success is measured by their loyalty to their employees and vendors and to the success of their customers.Ingredients: Natural Cheese made from pasteurized cultured organic milk, sea salt, enzymes.	8	oz	5.49	10.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/moKJ4kcFTNehbzeIeXYG_FK1A9291.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
611	Organic Meadow Gold Monterey Jack Cheese	Steckler Grassfed 'Meadow Gold' is an  Organic Jack Cheese is produced from 100% grass-fed, raw, organic milk, fresh from our own Dutch Belted dairy herd. Each batch of jack is made by hand on our farm in our new creamery, which has been inspected and approved by the Indiana State Board of Animal Health.Our farmstead artisan cheese is aged for a minimum of 60 days to develop its delicious, nutty flavor and creamy texture. Fresh raw milk from grass-fed cows produces cheese that has a uniquely complex flavor profile. Steckler Grassfed Jack is packed with nutrition that comes naturally from grass-fed raw milk. Our cheddar includes a balanced blend of omega 3 and omega 6 fats, as well as digestible vitamins and minerals.Ingredients: Organic Raw Whole Milk, salt, cultures, enzymes.Contains dairy	8	oz	11.99	23.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/KLu1SPwkT7WZXjAothEH_20160809-StrecklersGrassfed_monterayJack_MG_7583.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
612	Sharp Cheddar	This sharp cheddar is aged for nine long months. That’s what it takes to produce the full-bodied, naturally-aged sharpness of Tillamook Sharp Cheddar. For their farmer-owners, patience isn’t just a virtue, it’s a value, and it guides the cheesemaking process. Maybe that’s why the United States Championship Cheese Contest® voted it ‘America’s Best’. You can use it to zing up your appetizers, main dishes, and sandwiches.Ingredients: Cultured Milk, Salt, Enzymes, Annatto (color)	2	lb	13.99	7.0	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/wH6GMuIeSme5DBygIgRg_FK1A0920.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
613	Medium Cheddar	Perfect for cheeseburgers on Memorial Day!A century in the eating, Tillamook Medium Cheddar is still made from the same recipe they’ve used for over 100 years. While their equipment might look a little different these days, they use only four simple ingredients and age every batch naturally for at least 60 days. No wonder it was voted 'America's Best' at the 2015 International Cheese Awards.Ingredients: Cultured Milk, Salt, Enzymes, Annatto (color).	2	lb	13.99	7.0	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/eWz2jxXGTAi62P0fd3d4_FK1A0916.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
614	Sharp Cheddar	Tillamook's Sharp Cheddar is aged for at least nine months in order to bring you this intensely savory, sharp flavor. Easy to slice for sandwiches or shred for quesadillas and omelettes!Contains no animal rennet (vegetarian)Ingredients: Cultured Milk, Salt, Enzymes, Annatto (color).Allergens: Milk	8	oz	4.49	8.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/kiuo1srITniXfTujEmA7_20161012-Tillamook_SharpCheddar_MG_3579.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
615	Medium Cheddar	Aged at least 60 days, this Medium Cheddar cheese from Tillamook has a delicious and easy-to-love balance of mellow nuttiness and sharp flavor.Contains no animal rennet (vegetarian)Ingredients: Cultured Milk, Salt, Enzymes, Annatto (color).Allergens: Milk	8	oz	4.49	8.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/nOgnytk9S9mGiSdHNjuU_20161012-Tillamook_MediumCheddar_MG_3580.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
618	Organic Sharp White Cheddar	Creamy in texture and aged to medium sharpness, this is a cheese to always have on hand. The secret is the milk of Jersey cows, which contains a high butterfat content, creating an incomparably rich and creamy cheese. We use only milk, salt and natural enzymes to create our cheeses; never any growth hormones, additives or preservatives. Ingredients: USDA organic culture pasteurized grade A Jersey milk, salt, enzymes.	8	oz	6.99	13.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/yA9Y37SHOBQmSZqCtZYQ_FK1A7567.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
619	Organic Truly Raw Milk Cheddar Cheese	Our raw cheddar cheese is North America's first truly raw pasture fed cheddar cheese. Unlike most other raw cheeses, Truly Raw is never heated above 105 degrees (Fahrenheit) during the cheese making procedure.Why Say “Truly Raw”?Many so called raw cheeses are actually heated to temperatures "just under" legal pasteurized temperatures of 161 degrees, denaturing enzymes and killing beneficial bacteria. It is done primarily to offset the poor quality of milk used to make raw cheese in the conventional market and to increase the activity of the cultures that are added. The cheddar cheese is aged a minimum of 60 days.USDA organic standards require that cows be pasture grazed just four months out of the year. OPDC goes far beyond this standard and grazes our cows on green pastures every day. In addition to green pastures, our cows are fed: a specially formulated organic mineral supplement, free choice salt and trace mineral blocks, high test organic alfalfa, and some sweet organic corn to keep them healthy and strong. Ingredients: Organic Whole Raw Milk, Vegetable Rennet, Cultures, Salt	8	oz	8.49	16.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/puIfo2YjTluse2qpYf03_FK1A5474.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
620	Bright Meadow Extra Sharp Organic Cheddar	Steckler Grassfed 'Bright Meadow' Organic Cheddar Cheese is produced from 100% grass-fed, raw, organic milk, fresh from our own Dutch Belted dairy herd. Each batch of cheddar is made by hand on our farm in our new creamery, which has been inspected and approved by the Indiana State Board of Animal Health.Our farmstead artisan cheese is aged for a minimum of 60 days to develop its delicious, nutty flavor and smooth texture. Fresh raw milk from grass-fed cows produces cheese that has a uniquely complex flavor profile. Steckler Grassfed Cheddar is packed with nutrition that comes naturally from grass-fed raw milk. Our cheddar includes a balanced blend of omega 3 and omega 6 fats, as well as digestible vitamins and minerals.Ingredients: Organic Raw Whole Milk, salt, cultures, enzymes.Contains dairy	8	oz	11.99	23.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/S01DUdGkQ6OSZR4pW0NS_20160512-Strecklers_BrightMeddow_MG_9498.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
621	Cambria Clothbound Cheddar	A medium format natural-rind bandaged cow's milk cheddar with a crumbly but creamy texture. The flavor is savory more than sweet, and has a distinct sharpness on the mouth-watering finish. As this cheese matures beyond four months, it develops distinct tyrosine crystals. Our cheddar pairs well with Cabernet, hoppy beers, and cider.Ingredients: Pasteurized cows milk, salt, calcium chloride, cultures, and rennet.	8	oz	12.99	25.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/x3bafYRKWovM60a4mCAk_20160705-StepLadder_CambriaClothbound_MG_4287.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
622	Jasper Hill's Cabot Clothbound Cheddar	IN 2003, Cabot Creamery asked the Cellars of Jasper HIll to age a special batch of cheddar, sparking a revolutionary collaboration. Clothbound's milk is sourced exclusively from George Kempton's farm in Peacham, Vermont. After it comes to the Jasper Hill where they coat the young cheese in lard and add an additional layer of cloth. The cheeses age for 10-15 months in their Cellars, where they are constantly brushed, turned, and monitored for quality.SENSORY NOTES  - Clothbound is an approachable but complex natural-rind, bandaged cheddar with a crumbly texture and nutty aroma. The flavor is deeply savory and slightly tangy with caramel sweetness to the finish.PAIRING AND SERVICE  - Clothbound has a signature tang and caramel nuttiness with a rustic crystalline texture that becomes creamy on the palate. This savory-sweet balance of flavor makes a perfect match for charcuterie, apple jelly, or a rich chestnut honey. Pair with an off-dry sparkling apple cider, hoppy ale, or an oaked Cabernet Sauvignon. Clothbound is an award winning cheese, including American Cheese Society's 2006 Best in Show.	5.34	oz	9.99	29.93	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/GYpkJawKS6sgfgEbYGQW_FK1A0891.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
623	Organic Truly Raw Shredded Cheddar	Our TRULY RAW cheddar cheese is made with 100% organic, Grade A, raw whole milk from cows that pasture-graze, daily. This creamy cheddar has a delicious milk aroma, with a delightful flavor that offers a rich cheese tasting experience. Our raw cheddar is handcrafted; artisan made using traditional cheese making techniques, and only seasoned with kosher sea salt. We believe in keeping our products TRULY raw, which is why we never warm our raw milk above 102 degrees F. Many so-called “raw cheeses” are actually heated to temperatures just under legal pasteurized temperatures of 161 F, denaturing proteins, enzymes, and killing beneficial bacteria. While doing new product research, our team strongly agreed that if there was a way to never add cellulose and natamycin to the shredded cheese product, then we would strongly prefer keeping it OUT of our products. WE ARE PROUD to announce that we have NO cellulose and natamycin in our delicious, healthy, and probiotic Truly Raw Cheddar Cheese Shredded Bags!	8	oz	7.99	15.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/yKwHexqGRc2jbTIpDhlo_FK1A4715.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
624	Goat Cheddar	Our goat milk cheddar pairs a smooth texture with a sweet, mild flavor. Free of the pungent aromas and flavors associated with most rind-ripened goat cheeses, this cheddar is a great introduction into the world ofgoat cheese. Perfect as a table cheese with pears, apples or just as is, Goat Milk Cheddar cheese is also versatile, a wonderful melting cheese, ideal for quesadillas, baked into enchiladas, mixed into polenta or melting onto vegetables like cauliflower. Good on its own, Smoked Goat Cheddar also lends itself well to two other American classics, the hamburger and grilled cheese.Goat Cheddar cheese can last up to a year unopened in your refrigerator where they continue to age gaining sharpness and flavor complexity. Re-wrap after opening in plastic or cheese wrap and keep refrigerated.Ingredients: Aged Goat Cheddar Pasteurized cultured goat milk, sea salt and vegetable enzyme.	6	oz	7.99	21.31	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/8Zy0i69AS9OKwoMZyWYD_FK1A3629.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
840	Ground Pork (Frozen)	Ground pork is a staple in most households.  Our ground pork is a 80/20 meat to fat ratio.  Our sows are Yorkshires crossed on either a Duroc or Berkshire boar. The\n sows are pastured along with their piglets until the piglets are \nweaned. The weaned piglets are then finished with whole milk, whole \ngrain breads, brewers grain, and tortillas, producing what we believe to\n be a superior product.	1	lb	5.99	5.99	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/Ww7BZxTnCG5iIEGrs3lQ_-j7UmdqpVqoH0ddCHjnzNGQDrmwFf8Iwc2ZkWQhMHa4.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
625	Smoked Goat Cheddar	A goat cheese for tailgate parties has arrived! Our twist on an American classic, Smoked Goat Cheddar, has a smoky flavor strong enough to hold its own with salty chips, zesty salsas and hoppy beers. Like our Aged Goat Milk Cheddar this smoked version possesses an even, smooth texture and milky flavor with a rich smoky taste. Aged five to six months, this cheddar possesses a complex flavor, with a firm, smooth texture.Serving & Storage SuggestionsPerfect as a table cheese with pears, apples or just as is, Goat Milk Cheddar cheese is also versatile, a wonderful melting cheese, ideal for quesadillas, baked into enchiladas, mixed into polenta or melting onto vegetables like cauliflower. Good on its own, Smoked Goat Cheddar also lends itself well to two other American classics, the hamburger and grilled cheese.Goat Cheddar cheese can last up to a year unopened in your refrigerator where they continue to age gaining sharpness and flavor complexity. Re-wrap after opening in plastic or cheese wrap and keep refrigerated.Ingredients: Smoked Goat Cheddar Pasteurized cultured goat milk, sea salt and vegetable enzyme, natural smoke flavor.	6	oz	7.99	21.31	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/0U3GSoBTyy3Fla0c2zkS_FK1A3658.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
626	Raw Goat's Cheddar	A sweet, aged, fruity raw milk cheddar. Great for Cheese boards, appetizers, cube for salads, shredding and melting. Melt in grilled cheese, mac and cheese, over burgers, shred over salads, or pasta. Pair with Fruity Whites, Dry Reds or Champagne or Belgium Lagers. Ingredients: Whole raw goat milk, culture,\n Enzymes & SaltContains milk	6	oz	6.49	17.31	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/ZXlAceEWS4GXlU181O5B_20161109-CreamofCrop_GoatCheddar_MG_6414.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	242	\N	\N	\N
628	Graziers Raw Milk Jalapeno Jack	Jalapeño Jack is made with locally sourced red and green Jalapeños. This cheese packs a punch! Great for stacking on sandwiches and melty quesadillas!Graziers Raw Milk Jalapeño Jack is made from milk from Certified Graziers at Alderson and Belo Dairies. Enjoy the benefits of grass-fed and raw milk!	8	oz	4.99	9.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/68kHaGfTRKHJhwzpOCdb_File0191.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
629	Organic Plain Fresh Curds	This is Cheddar before it’s been pressed and aged. Because it is freshly made, the enzymes in it are still very active and will help your digestive system. This healthy snack tastes amazing! Its “squeaky” texture makes it great to eat as is, and will also go well in salads and melts, similar to Mozzarella.Ingredients: USDA Organic Culture Pasteurized Grade A Jersey Brand Milk, Salt, Enzymes.	8	oz	6.29	12.58	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/SQDmC0Y3TxiwneyOWkwg_FK1A5882.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	229	\N	\N	\N
630	Organic Garlic Fresh Curds	This is Cheddar before it’s been pressed and aged. Because it is freshly made, the enzymes in it are still very active and will help your digestive system. This healthy snack tastes amazing! Its “squeaky” texture makes it great to eat as is, and will also go well in salads and melts, similar to Mozzarella.Ingredients: USDA Organic Culture Pasteurized Grade A Jersey Brand Milk, Salt, Enzymes.	8	oz	6.29	12.58	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/t1vdrhnKQG6rdRMK1l2W_FK1A5892.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	389	\N	\N	\N
631	Swiss Cheese	Tillamook's Swiss Cheese is a European-style recipe, aged for 75 days to create a full-bodied, delicious flavor. This holey cheese is perfect for snacking, slicing into sandwiches, or melting.Contains no animal rennet (vegetarian)Ingredients: Cultured Part-Skim Milk, Salt, Enzymes.Allergens: Milk	16	oz	7.99	7.99	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/HHSoUjZhQUWQ1JMZrCqS_20161012-Tillamook_Swiss_MG_3572.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
635	Petite Crème	Petite Crème rich and smooth Brie-style cheese. It spreads beautifully across crusty bread or crisp crackers, and pairs well with dry sparkling wines,  Petite Syrah or IPA.Ingredients: pasteurized cultured cow’s milk, pasteurized cream,\nsalt and microbial enzymes.contains dairy	4	oz	4.99	19.96	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/aIWr7kKtRZWbV0Du9uax_FK1A6717.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	349	\N	\N	\N
636	Triple Crème Brie	With a rich and smooth texture, slightly sweet flavor and blooming with fluffy white rind, Marin French Triple Crème Brie expresses the high quality milk from neighboring Marin County dairies. Crowned World Cheese Awards Champion in 2005 – the first time an American cheese topped the French in an International competition for Brie cheese. This remarkable 1st place honor was repeated in 2010.Ingredients: pasteurized cultured cow’s milk, salt and microbial enzymes.	8	oz	9.99	19.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/7446rHWnTfWO5qMmkdW0_FK1A4352.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	217	\N	\N	\N
638	Jalapeño Baking Brie	Who can resist the melty, buttery, richness of warm baked Brie with a spicy kick? Marin French Cheese Jalapeño Baking Brie is a ready-to-bake Brie in its microwave-safe, oven-safe elegant wooden cup. Jalapeño Baking Brie is perfect for snacking or as an appetizer, and ready in only 12 minutes in the traditional oven or 1 minute 30 seconds in the microwave oven. 	8	oz	10.99	21.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/y1B9jRSOTi6km1gmhDj1_FK1A0118.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	217	\N	\N	\N
639	Petite Breakfast Cheese	Marin French Breakfast Cheese is a California original – a fresh unripened Brie made in our Marin creamery since the late 1800’s. Petite Breakfast has been selected a Winner in the 2015 Good Food Awards. Look for it with the vintage-style label ‘1865’ during our 150th Anniversary year, 2015. Pairs with California Sauvignon Blanc, Wheat Beer or Hard Cider.Ingredients: pasteurized cultured cow’s milk,\nsalt, and microbial enzymes. Contains dairy	4	oz	5.99	23.96	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/6ZKKdfTwqim5IoRubIAQ_FK1A6707.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
644	Buttermilk Blue Cheese Crumbles	Made in small batches from the freshest milk, our rich, creamy blue is beautifully balanced, sultry and seductive, with piquant and earthy flavors. Delicately laced and veined. Higher butterfat for the creamiest texture. Tangy with a touch of mellow. Bold with a bit of restraint. Finishes clean and sweet. Roth Buttermilk Blue lets you experience and explore the deliciously creamy, tangy tastes that can only come from our little corner of the world. Perfect form mixing into salads, crumbling over steaks and burgers, and making the best blue cheese dip or dressing. Pairs perfectly with raw veggies, figs, pears, dark chocolate, and Riesling.Ingredients: Raw cultured cow's milk, salt, enzymes, penicillium roqueforti.Contains milk	4	oz	3.69	14.76	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/p10JhQldQoSx0WBentrO_20160513-Roth_ButtermilkBlue_MG_9521.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
649	"American Favorites" Cheese Plate	From meltingly soft Teleeka to sharp, grassy Everton, our Good Eggs cheese specialist Erin carefully selected each one to bring you a deliciously balanced cheese board. Whether your favorite is hard cheese or soft, nutty or sharp, you can't go wrong with this all-star tour of American cheeses and crackers. Perfect for wowing your friends at a holiday party, and for pairing with your favorite wine or beer!Weybridge from Jasper Hill Cellars, 8 ozEverton from Jacob's and Brichford, 8 oz Teleeka from Tomales Farmstead Creamery, 8 ozSea Salt & Olive Oil Crackers from Rustic Bakery, 5 ozActual products may vary from those featured in photograph, but products listed here will always be accurate.Contains: Milk, wheat.	1	count	38.99	\N	\N	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/7PMpzkFjQjOvoRdDehiZ_20161028-CheesePlates_AmericanFavorites_MG_5700.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
650	Organic Sour Cream	Straus Family Creamery Organic Sour Cream is rich and delicious with the perfect balance of sweet and tangy. Made with only three ingredients, this sour cream is slowly cultured, using a traditional 16-hour process. This creates a naturally thick texture and pure, rich flavor. Use it as a base for dips and dressings or as the perfect spoonful of luxury on a baked potato. No fillers, additives or stabilizers, ever.Straus Family Creamery’s certified Organic Sour Cream is Non-GMO Project Verified, certified kosher and gluten-free.Ingredients: Cultured Pasteurized Grade A Nonfat Milk and Cream, Enzymes.Contains: milk.	1	pint	4.29	0.27	oz	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/xpuVDxrtQmWICjaGuoWP_FK1A5763.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
651	Organic Small Curd Cottage Cheese	Clover Organic Farms Cottage Cheeses are produced by introducing non-animal rennet , a natural enzyme, to fresh, organic milk from our local family farms. The rennet causes the milk to separate into curds and whey. The curds are then drained to separate them from the whey, and then a small amount of whey is added back in for texture and flavor.  We invite you to enjoy Clover Organic Farms Cottage Cheese in good conscience and good health. Great for salads, with fruit and in all your favorite family recipes!Ingredients: Cultured pasteurized grade A organic nonfat milk, pasteurized grade A organic milk, pasteurized organic cream, salt, stabilizer (organic guar gum, xanthan gum, carageenan, organic locust bean gum), carbon dioxide (to maintain freshness)	16	oz	5.29	0.33	oz	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/6sECVFnTj6NSBMTXWGaQ_FK1A9938.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
652	Feta	Delightful table cheese. Delicate salt and pungent flavor balance for any recipe or pizza topping	12	oz	5.49	7.32	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/dDoYqkFZQCEA0Q2Mhq8x_FK1A3140.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	377	\N	\N	\N
653	Organic Low Fat Cottage Cheese	Clover Organic Farms Cottage Cheeses are produced by introducing non-animal rennet , a natural enzyme, to fresh, organic milk from our local family farms. The rennet causes the milk to separate into curds and whey. The curds are then drained to separate them from the whey, and then a small amount of whey is added back in for texture and flavor.  We invite you to enjoy Clover Organic Farms Cottage Cheese in good conscience and good health. Great for salads, with fruit and in all your favorite family recipes!Ingredients: cultured pasteurized grade A organic nonfat milk, pasteurized organic grade A milk, salt, stabilizer (organic guar gum, xanthan gum, carrageennan, organic locust bean gum), vitamin A palmitate, carbon dioxide (to maintain freshness).	16	oz	5.29	0.33	oz	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/QosxonuUQCutuju6qNRN_goaI8UjWTEOejqaPZPfr_A4LaMCWUQyCdDtKabd6QDA9WuG94YDMrNmH8uoeI-9c.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
654	Feta	Made with fresh cow's and goat's milk, our feta has a lighter flavor than goat or sheep milk feta.It is lightly salted to bring out the flavor of the cheese, without being as strong as a Mediterranean style feta. 	8	oz	5.99	11.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/SeIwLb9T1qoXrxfScmBi_FK1A2989.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	377	\N	\N	\N
655	Organic Lactose Free Sour Cream	Delicious and rich, with the cultured, slightly sweet and nutty flavor that characterizes the best crème fraîche, Green Valley Organics Lactose Free Sour Cream will quickly become a staple in your kitchen. This is real dairy with all the flavor and versatility but none of the lactose. Add to sauces and soups, blend into bread or cakes for a delectable, tender crumb. Or simply whip gently, add sweetener or flavor of your choice, and top seasonal fresh fruit … the possibilities are endless. Enjoy!Green Valley Organics' lactose-free dairy is made by Redwood Hill Farm & Creamery in Sebastopol CA. Ingredients: Organic Pasteurized Cream, Lactase Enzyme, Live Active Cultures.	12	oz	3.69	0.31	oz	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/NoI3xzY6SSqnggJpIKv2_greenvalley_sourcream.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
656	Queso Fresco	This traditional fresh Mexican cheese has a creamy texture, but because we press the curds, the cheese can be easily crumbled and softens well when heated.Queso Fresco can be used in many Mexican dishes, such as enchiladas and empanadas, or crumbled over soups and salads.	8	oz	5.99	11.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/8sRTrCrzQ1mDbs0V76XG_QuesoFresco.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	225	\N	\N	\N
657	Smoked Sea Salt & Rosemary Chevre	This delicate chèvre is hand-blended with smoked sea salt and cracked pepper and marinated in a rosemary-infused extra virgin olive oil blend. An accessible and fresh flavor with bright briny notes, it's great for spreading on toasted bread for sandwiches or dipping into with crackers.Ingredients: Goat Cheese (Pasteurized Goat Milk, Smoked Sea Salt, Salt, Cracked Pepper, Cultures, Enzymes), Oil Infusion (Non-GMO Canola Oil, Extra Virgin Olive Oil, Rosemary), Pink PeppercornsContains: Milk.	7.1	oz	8.99	20.26	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/YDcam4DRCi9Zar6tpLkQ_20160825-ChevooSaltRosemary_MG_8777.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	262	\N	\N	\N
658	California Dill Pollen & Garlic Chevre	"Good Eggs and Chevoo are stoked about our new partnership! Chevoo has been a favorite of mine since it launched and I am so excited to sell (and be able to buy!) on Good Eggs! To celebrate this partnership  we are offering $2 off each jar for a limited time!"- Erin, Grocery BuyerA taste of Northern California. Fresh chèvre hand-blended with locally harvested dill pollen, marinated in a light garlic-infused extra virgin olive oil blend. Subtle highlights that quietly echo the rolling hills of Wine Country.Ingredients: Goat Cheese (Pasteurized Goat Milk, Salt, Dill Pollen, Dill Weed, Cultures, Enzymes), Oil Infusion (Non-GMO Canola Oil, Extra Virgin Olive Oil, Garlic),Pink PeppercornsContains dairy	7.1	oz	8.99	20.26	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/gIFmwMpoQIqzIJsfpcjB_20160825-Chevoo_DillGarlic_MG_8764.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	389	\N	\N	\N
659	Aleppo-Urfa Chili & Lemon Chevre	"Good Eggs and Chevoo are stoked about our new partnership! Chevoo has been a favorite of mine since it launched and I am so excited to sell (and be able to buy!) on Good Eggs! To celebrate this partnership  we are offering $2 off each jar for a limited time!"- Erin, Grocery BuyerVelvety chèvre hand-blended with Aleppo and Urfa chili peppers, marinated in a delicate lemon-infused extra virgin olive oil blend. A sophisticated mix of heat and citrus, with a hint of old world charm.Ingredients: Goat Cheese (Pasteurized Goat Milk, Salt, Aleppo Chili, Urfa Chili, Cultures,Enzymes), Oil Infusion (Non-GMO Canola Oil, Extra Virgin Olive Oil, Lemon),Pink PeppercornsContains dairy	7.1	oz	8.99	20.26	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/wJjkOYqRReME0peSjTAO_20160825-Chevoo_ChiliLemon_MG_8769.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	374	\N	\N	\N
660	Crème Fraîche	This classic, French-style cultured cream has a rich, nutty flavor with an appealing tart edge. A basic pantry item in French kitchens, it is an ingredient used by fine cooks in many cuisines. Pour over fruit, whip into soups, stir into sauces; Créme Fraîche never curdles while cooking.Ingedients: pasteurized cream, salt.Contains: milk.	7.5	oz	5.49	11.71	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/dWlrD0blRWaDlwMBpuJf_FK1A9023.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	257	\N	\N	\N
661	Sheep's Milk Feta	"This new feta from Haverton made it's debut about 1 month ago. It's bright and salty flavor is most comparable to Bulgarian feta. Crumble on top of a salad or mix with your favor warm pasta to make a rich creamy sauce." Erin, Good Eggs BuyerHaverton Hill Creamery sheep milk feta is produced from our fresh sheep milk and produced on site at our farm in Petaluma. Handcrafted in small batches, each batch is delicately crafted by hand to create a classic + traditional feta. Made to order using only 100% sheep milk creates a creamery soft texture with a classic salty finish. There's an appealingly “barnyard” tang versus the more mild, grassy taste and crumbly texture of cow milk feta. Enjoy.Ingredients: Pasteurized sheep's milk, sea salt, cultures, enzymes.	8	oz	10.99	21.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/kOnKzq0RCmZqK81Vnijs_20160810-HavertonHill_SheepFeta_MG_7598.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	377	\N	\N	\N
662	Goat Milk Feta	With a long history throughout the Balkan Peninsula, especially in Greece, Feta is traditionally made from a combination of sheep and goat milk. Redwood Hill Farm’s award winning feta, is made with pure goat milk. We gently cut the curd and form it into blocks by hand. Then it is brined in a natural, salt water brine before aging.  Try it sliced or cubed, sprinkled with fresh cracked pepper and drizzled with olive oil, or on top of a salad. Serve with assorted olivesStorage & Serving SuggestionsLeft in its packaging it will last refrigerated for 6 months or more. After opening, re-wrap your cheese in fresh plastic or cheese wrap and keep it refrigerated. Redwood Hill Farm Feta is fabulous sliced or cubed, sprinkled with fresh cracked pepper and organic oregano and then drizzled with your best olive oil. Serve with assorted olives.Ingredients: Cultured goat milk, sea salt and vegetable enzyme.	6	oz	8.79	23.44	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/DknwNWeSge1VfbWGcv3Z_goat%20feta%20photo.jpeg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
669	Fromage Blanc Tomato Pesto Spread	Orland Creamery makes their traditional fromage blanc by hand using milk from their own herd of pastured dairy cows. It's a creamy, slightly lemony-tart fresh cheese paired here with sun dried tomatoes and a freshly made basil and pine nut pesto. Savory and tangy, this dip is fantastic on a cheese board with warm, toasty bread, olives, crackers, charcuterie, and fresh vegetables. It's also fantastic as a filling for ravioli and lasagna, a spread in sandwiches along with salty cured meat or leftover turkey, or a truly revelatory add-in for an omelette. Ingredients: pasteurized milk, salt, enzymes, basil, olive oil, parmesan cheese, garlic, lemon juice, crushed tomatoes, sun dried tomatoes, canola oil, walnuts, pine nuts, herbs, spices, salt. Contains: milk, tree nuts.	8	oz	8.99	17.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/YlL00FPMT4SgjihQxoed_FromageBlanc.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	335	\N	\N	\N
671	Pecorino Romano	A hearty, full flavored, unpasteurized sheep's milk cheese. The milk is rich and fat and in protein. It has a bold, salty flavor that is perfect for grating over any dish and eaten with some honey.	6	oz	6.79	18.11	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/2sLSO5QSScaGZpsFPnLd_FK1A2388.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	295	\N	\N	\N
680	Emmentaler	With its nearly cherry-sized holes and pale, creamy color, Emmentaler appellation d'origine protégée (AOP) cheese is arguably the most iconic Swiss cheese. It's often renowned for its mild flavor; however, cheese connoisseurs know that cave-aged Emmentaler AOP (subjected to a longer maturation period) reveals sophisticated nuttiness and tang. Emmentaler AOP from Mifroma’s Cavern's range of specialty cheeses is aged for 11 months, resulting in a full-bodied taste. Spotting naturally-formed salt crystals in the holes of this cheese guarantees an aged product of excellent quality.Ingredients: Raw Part-Skim Cow's Milk, Cheese Culture, Salt and Enzymes.Contains: Milk.	8	oz	10.99	21.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/1JEJQSwSCiTs2NUGJ7cR_20161109-CreamofCrop_Emmentaler_MG_6402.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	321	\N	\N	\N
681	Emmentaler	With its nearly cherry-sized holes and pale, creamy color, Emmentaler appellation d'origine protégée (AOP) cheese is arguably the most iconic Swiss cheese. It's often renowned for its mild flavor; however, cheese connoisseurs know that cave-aged Emmentaler AOP (subjected to a longer maturation period) reveals sophisticated nuttiness and tang. Emmentaler AOP from Mifroma’s Cavern's range of specialty cheeses is aged for 11 months, resulting in a full-bodied taste. Spotting naturally-formed salt crystals in the holes of this cheese guarantees an aged product of excellent quality.Ingredients: Raw Part-Skim Cow's Milk, Cheese Culture, Salt and Enzymes.Contains: Milk.	6	oz	8.29	22.11	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/1JEJQSwSCiTs2NUGJ7cR_20161109-CreamofCrop_Emmentaler_MG_6402.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	321	\N	\N	\N
682	Gruyere	Aged for a minimum of 12 months, Kaltbach Le Gruyère AOP is recognized instantly by the color of its rind – an unmistakable rustic brown patina – and its flavor, which is just as distinctive. Compared with traditional Le Gruyère, the extended aging in its unique environment makes for complex, slightly more assertive flavors. The notes of dried stone fruit, spice, black tea and hazelnuts with an earthy depth will captivate your taste buds.Ingredients: Raw cultured cow's milk and\nnonfat milk, salt, enzymes.\nContains: milk.\n 	6	oz	6.49	17.31	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/qql6TF6Tgq22n6dF2V8C_20160512-Emmi_GruyereWedge_MG_9470.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	243	\N	\N	\N
683	Comté	This traditional French Comté is appellation d'origine contrôlée (AOC) Affineur Seignemartin. It is made with milk from the Jura's Montbéliard herd and then aged 10-12 months in the silence and darkness of special caves where the cheese gets its unique taste, texture and color. Easy to melt but also perfect for eating out of hand, this rich, slightly sweet, nutty cheese deserves a place on any cheese plate or dish. Ingredients: Raw cow's milk, cultures, rennet, salt.Contains: Milk.	8	oz	10.79	21.58	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/SsoQeD83QX6rS6eJ0OIy_20161109-CreamofCrop_Comte_MG_6411.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	257	\N	\N	\N
684	Comté	This traditional French Comté is appellation d'origine contrôlée (AOC) Affineur Seignemartin. It is made with milk from the Jura's Montbéliard herd and then aged 10-12 months in the silence and darkness of special caves where the cheese gets its unique taste, texture and color. Easy to melt but also perfect for eating out of hand, this rich, slightly sweet, nutty cheese deserves a place on any cheese plate or dish. Ingredients: Raw cow's milk, cultures, rennet, salt.Contains: Milk.	6	oz	8.49	22.64	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/SsoQeD83QX6rS6eJ0OIy_20161109-CreamofCrop_Comte_MG_6411.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	257	\N	\N	\N
685	Gruyère	Emmi Kaltbach's Le Gruyère appellation d'origine protégée (AOP) matures slowly under the watchful care of their Master Affineur in the Caves, where a perfect balance of humidity, temperature, and mineral-rich air helps this cheese attain great depth of flavor. Instantly recognizable by the color of its rind—an unmistakable rustic brown patina—the extended cave aging gives Kaltbach's Le Gruyère a complex, assertive flavor with a dense, smooth texture and occasional crunchy salt crystals.Ingredients: Raw Part-Skim Cow's Milk, Cheese Culture, Salt and Enzymes.Contains: Milk.	8	oz	11.49	22.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/diMh9D1ZTKicBJaWOwVZ_20161109-CreamofCrop_Gruyere_MG_6408.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	243	\N	\N	\N
686	Gruyère	Emmi Kaltbach's Le Gruyère appellation d'origine protégée (AOP) matures slowly under the watchful care of their Master Affineur in the Caves, where a perfect balance of humidity, temperature, and mineral-rich air helps this cheese attain great depth of flavor. Instantly recognizable by the color of its rind—an unmistakable rustic brown patina—the extended cave aging gives Kaltbach's Le Gruyère a complex, assertive flavor with a dense, smooth texture and occasional crunchy salt crystals.Ingredients: Raw Part-Skim Cow's Milk, Cheese Culture, Salt and Enzymes.Contains: Milk.	6	oz	8.69	23.17	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/diMh9D1ZTKicBJaWOwVZ_20161109-CreamofCrop_Gruyere_MG_6408.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	243	\N	\N	\N
687	Black Eyed Susan	Black Eyed Susan is a raw sheep milk cheese aged 2 to 4 months. It is dry and sharp with a rich buttery flavor. It is perfect for grating over pasta or risotto or just nibbled on with some salami and beer.	4	oz	9.79	39.16	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/dqHO1O1mQ3G89cNoztNB_FK1A1719.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	354	\N	\N	\N
688	Young Gouda	Oakdale's Young Gouda is a throwback to a classic dutch gouda. Soft, mild, creamy, and buttery. Perfect for snacking and for melting! Pack it in a picnic basket, add some apples, or even a hard cider, and enjoy!Four days a week we start the 11 week process of making Gouda.  The cheesemaker's work begins the night before when he makes sure that the fresh milk we receive from a local dairy is properly transferred and chilled.  Before the sun rises the next morning, he starts the pasteurization process and adds cheese cultures to the milk.  Within a few hours, curds start to form and the whey is separated from the batch.  Shortly after, the curds are pressed into a large block and cut into 10 pound pieces which are placed in their molds, fitted with a lid and pressed into wheels.  The next day, the wheels are transferred to a brine solution to cure.  Two days later, the cheese is transferred to wooden drying racks, coated with wax, and begins the aging process where it matures to perfection.Ingredients: Pasteurized whole milk, salt, annatto coloring, and enzymes. Contains dairy	8	oz	9.49	18.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/RNC40OMQOG6T3H5kjW7Z_20160513-Oakdale_YoungGouda_MG_9612.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	274	\N	\N	\N
689	Aged Gouda	Oakdale's Aged Gouda is aged to perfection for 7 months. It's nutty flavor is balanced with a sweet finish. Serve alone, with fruit, or nuts. Pair with a hard, dry cider or a sour beer to bring out the caramel notes on the finish. Four days a week we start the 11 week process of making Gouda.  The cheesemaker's work begins the night before when he makes sure that the fresh milk we receive from a local dairy is properly transferred and chilled.  Before the sun rises the next morning, he starts the pasteurization process and adds cheese cultures to the milk.  Within a few hours, curds start to form and the whey is separated from the batch.  Shortly after, the curds are pressed into a large block and cut into 10 pound pieces which are placed in their molds, fitted with a lid and pressed into wheels.  The next day, the wheels are transferred to a brine solution to cure.  Two days later, the cheese is transferred to wooden drying racks, coated with wax, and begins the aging process where it matures to perfection.Ingredients: Pasteurized whole milk, salt, annatto coloring, and enzymes. Contains dairy	8	oz	12.49	24.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/RKptd8etQTa6wDC4gj2L_20160513-Oakdale_AgedGouda_MG_9601.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	274	\N	\N	\N
690	Aged Gouda	Oakdale's Aged Gouda is aged to perfection for 7 months. It's nutty flavor is balanced with a sweet finish. Serve alone, with fruit, or nuts. Pair with a hard, dry cider or a sour beer to bring out the caramel notes on the finish. Four days a week we start the 11 week process of making Gouda.  The cheesemaker's work begins the night before when he makes sure that the fresh milk we receive from a local dairy is properly transferred and chilled.  Before the sun rises the next morning, he starts the pasteurization process and adds cheese cultures to the milk.  Within a few hours, curds start to form and the whey is separated from the batch.  Shortly after, the curds are pressed into a large block and cut into 10 pound pieces which are placed in their molds, fitted with a lid and pressed into wheels.  The next day, the wheels are transferred to a brine solution to cure.  Two days later, the cheese is transferred to wooden drying racks, coated with wax, and begins the aging process where it matures to perfection.Ingredients: Pasteurized whole milk, salt, annatto coloring, and enzymes. Contains dairy	9.5	oz	14.99	25.25	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/RKptd8etQTa6wDC4gj2L_20160513-Oakdale_AgedGouda_MG_9601.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	274	\N	\N	\N
913	Pork Breakfast Sausage	Our Breakfast Sausage contains 100% pork seasoned with fresh sage and real Grade B (which is best) maple syrup.There are six, 2oz sausages per package.Product is fully cooked. INGREDIENTS: Pork shoulder, pork fatback, salt, milk powder, white and black pepper, ginger, mustard powder, nutmeg, sage, maple syrup.	0.75	lb	5.99	7.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/Ecf2tqhaQVixiswfUazB_FK1A6843.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
698	Goat Cheese Log	Our deliciously fresh goat cheese logs are mild flavored with a soft, spreadable texture made in the traditional French elongated shape. Laura Chenel’s Log is the original cheese, when sliced into rounds, breaded and baked, that adorned the iconic Mixed Greens and Goat Cheese Salad made famous at Chez Panisse restaurant in Berkeley, California.Slice the log into rounds, coat with fine homemade bread crumbs, chopped toasted walnuts or pecans, and bake until browned. Serve atop dressed salad greens – and dream that you are at Chez Panisse sitting in those perfect seats at the front with light streaming in through the windows.Ingredients: Cultured Pasteurized Goat Milk, Salt, Enzymes.	8	oz	6.49	12.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/MLRZJ3wT0mlk5n4dck6y_FK1A7444.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
699	Chef Chevre	The name ‘Chef’s Chèvre’ is one indication of the 20-year popularity this cheese has had with chefs, caterers and quality foodservice operations. Chef’s Chèvre is our highest moisture, very freshest cheese. It is clean-tasting, smooth, light, tangy and spreadable. The texture of Chef’s Chèvre is very similar to cream cheese and the cooking applications are as diverse, with the benefit of being lower in calories and cholesterol and higher in protein than cream cheese.For professionals or “home chefs,” Chef’s Chèvre melts perfectly into sauces for pasta and poultry dishes. It mixes well with herbs for topping crostini or filling ravioli and tortellini. Chef’s Chèvre is the preferred cheese in fluffy goat cheesecakes.Ingredients: Cultured Pasteurized Goat Milk, Salt, Enzymes.	8	oz	6.99	13.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/cMs7PIhiRauRxvpnmEfy_FK1A7522.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	213	\N	\N	\N
700	Honey Goat Log	" Tiny white flowers bloom on California’s orange trees each spring imparting a fragrant fresh citrus scent to local honey. We blend just the right balance of orange blossom honey and fresh chèvre for natural sweetness. Like cream cheese, Honey Log is spreadable- ready for breakfast, lunch or dessert any time.AWARDS: CalExpo State Fair 2014, Gold; CalExpo State Fair 2013, Silver Ingredients: Made with Cultured, Pasteurized Goat Milk, Honey, Salt, Enzymes.	5.4	oz	5.49	16.27	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/0ByjV4VCSSGzD7AUQJzb_FK1A7420.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
701	Plain Chèvre	Chèvre is a fresh, light-textured, rindless goat cheese that is similar to cream cheese but softer and fluffier with only 1/3 of the fat and calories. Made in the French style, Redwood Hill's chevre is light, fluffy and sumptuously spreadable. It offers notes of citrus, balanced by a mild earthiness that makes it delicious in both savory and sweet dishes.Ingredients: Pasteurized cultured Grade A goat milk, sea salt and vegetable enzyme.	4	oz	5.69	22.76	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/Fi3jTmWCRCyK8WD4TIaO_FK1A0873.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	213	\N	\N	\N
702	Garlic and Chive Chèvre	Chèvre is a fresh, light-textured, rindless goat cheese that is similar to cream cheese but softer and fluffier with only 1/3 of the fat and calories. Made in the French style, Redwood Hill's Garlic and Chive chevre is light and fluffy with hints of minced garlic and chopper chives.Storage & Serving SuggestionsMild and fresh with a complex flavor, Fresh Chèvre  is versatile and can be used in both savory and sweet dishes. Try in a roasted beet salad, over pasta, in a cheesecake or simply spread on a bagel.Try this delicious goat cheese spread, one of our favorite recipes!Opened cheese will last 7-10 days stored at 38-42 degrees in your refrigerator.Ingredients: Garlic Chive Chèvre Pasteurized cultured Grade A goat milk, chives, organic garlic, sea salt and vegetable enzyme.	4	oz	5.99	23.96	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/BwkvVdrSyOiieuBvYFmz_FK1A4415.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	213	\N	\N	\N
703	Black Truffle Goat Log	The coveted Italian black summer truffle is sure to enhance any recipe. The truffle’s earthy perfume is balanced with bright fresh goat cheese for creamy, rich-textured appetizers or gratins.AWARDS: CalExpo State Fair 2013 & 2014, SilverIngredients: Made with Cultured, Pasteurized Goat Milk, Black Truffles, Salt, Enzymes.	5.4	oz	5.79	17.16	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/kF4snnrvQTq8SsKdVrma_FK1A7907.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
704	Liwa Goat Cheese	Liwa is a fresh, 3 day goat cheese from West Marin, modeled after a European style farmer's cheese. This cheese is amazing paired with just about anything. Customers love it on their morning toast, in salads, on fruit or in a steak sandwich. Very versatile! http://www.tolumafarms.com/ 	12	oz	13.99	18.65	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/kcMWrQqbQneY4p5Im5Ry_20160602-TamalesFarmstead_Liwa_MG_1037.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
707	Goat Brie	This is a new product from Laura Chenel made in a Brie-style using goat's milk. After again between 9-14 days the cheese develops a bloomy rind with a delicious, buttery inside.Ingredients: Cultured pasteurized Goat milk, salt and microbial enzymes.	5	oz	7.99	25.57	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/ubSR7LaJQmK30m5m1wRy_FK1A7451.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
708	Teleeka Goat, Sheep & Cow's Cheese	Teleeka, named for the Miwok word for "three," blends farmstead goat, sheep and a neighbor's cow milk into a bloomy-rinded soft-ripened cheese. The flavor profile of this award winning cheese is buttery, creamy and rich with deep afternotes. Pairs well with figs, fruit, prosecco/champagne, beer and cider. Leave at room temperature before serving/eating, gets nice and gooey!	8	oz	12.99	25.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/bzbzQPReTqK0ppqKFs7X_FK1A0278.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
710	Atika Goat & Sheep Cheese	Atika is a blend of sheep and goat milk in roughly equal parts, this 3- to 4-pound tomme smells like warm melted butter and crème fraiche. The rind is hard, dry and deeply marked by the draining basket. The firm, dry paste has numerous small openings, and the flavor is buttery and tart. - review by Janet Fletcher.  Atika is aged between 3 and 6 months.  This a farmstead cheese, the goats and sheep are raised and milked on the same farm that the cheese is made thus the milk is as fresh as it can possibly be. Pairs well with local, crisp apples.  Atika was a 2014 Good Food Award winner.  This award means a great deal to us since it is judging on both taste and the overall sustainability of our farm and creamery.  This is to say how we treat the land, animals, people and food!  This cheese also won a 2nd place ribbon in its class in 2014 at the American Cheese Society conference.  	5	oz	10.29	32.93	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/1DNJOEs0SQO39V554YJJ_FK1A0847.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
935	Pork Bratwurst	Our Gourmet Bratwurst contains 100% pork seasoned with white pepper, ginger, and nutmeg.  Super traditional and super amazing!! Authentically made by salumist Elias Cairo. INGREDIENTS: Pork shoulder, pork fatback, salt, milk powder, white and black pepper, ginger, mustard powder, nutmeg.CONTAINS DAIRY	0.75	lb	6.79	9.05	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/FpAWMsa6RRSyhmQjuptN_FK1A6845.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
712	Kenne Goat Cheese	"This is one of my favorite cheeses to put on a summer time cheese plate! It's an all goat soft-ripen cheese reminiscent of a robiola. I like to pair this with some local honey, bubbly, or a nice, light refreshing kolsch"- Erin, Grocery BuyerKenne (pronounced “kennay”) is a farmstead cheese made entirely from goat’s milk – the word “kenne” is the term the area’s early inhabitants, the Miwoks, used for “one.” It has a dense, creamy texture and a delicate wrinkly rind, which are meant to conjure the Italian soft-ripened cheeses. The high quality of the milk is perfectly showcased in the paste’s mild, slightly earthy flavors. kenne pairs well with beer, champagne, fruit and nuts.We are thrilled to see this cheese in so many of our favorite Bay Area restaurants.http://www.tolumafarms.com/ 	8	oz	12.99	25.98	lb	Dairy	Cheese	http://goodeggs2.imgix.net/product_photos/AyxYSOTxS9C8tQkGWWeH_20160602-TamalesFarmstead_Kenne_MG_1031.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
713	Fresh VeganMozz  Vegan Cheese	Just like traditional mozzarella di bufalo, our cashew-based vegan version is the perfect answer for everything from pizzas, to caprese salad, to paninis. Creamy, smooth, and with just the perfect amount of springiness. Melts and Browns. Delicious Hot or Cold. Ingredients: Water, Organic Coconut Oil, Organic Cashews, Organic Tapioca Starch, Agar, Sea Salt, Cultures.	8	oz	8.79	17.58	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/5Aboc9FcRW2Y2kmYXBmU_20160421-Miyokos_veganMozz_MG_7624.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	316	\N	\N	\N
714	Classic Double Cream Chive Vegan Cheese	This versatile round packs a buttery, savory, mild herbal garlic flavor. The creamy delight is a crowd pleaser enjoyed by everyone from kids to sophisticated foodies. Serve on crackers or use as a delicious sandwich spread. Free of cholesterol, lactose, egg, gluten and soy. Non-GMO product.Ingredients: cashews*, filtered water, coconut oil*, chives*, chickpea miso* (chickpeas*, rice kohi*, sea salt, koji spores), sea salt, nutritional yeast, cultures (organic ingredient*). Contains: tree nuts.	6.5	oz	9.99	24.59	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/mJGCAXwqTsOfTQe9SGUJ_FK1A0467.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
715	Plain Cream Cheese Style Spread	Our cream cheese style spreads are made with all natural ingredients to create a complex flavor and a velvety smooth texture. Each batch is cultured to add depth, sweetness, and a subtle tang. Our spread is great smeared on a bagel, or served alongside fresh fruit or grilled vegetablesOur plain cream cheese style spread also works as a sour cream substitute, and can be used in any recipe that calls for dairy-based cream cheese.Ingredients: Almond milk (water, almonds), salt, enzyme, vinegar, xanthan gum, locust bean gum, guar gum, cultures.Contains Tree Nuts (Almonds)	8	oz	5.99	11.98	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/6JSM64YISPi6YhSpf161_20160601-KiteHill_CreamCheese_MG_0940.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	371	\N	\N	\N
717	Double Cream Sundried Tomato Garlic Vegan Cheese	A creamy, robust, and pungent wheel filled with deep Mediterranean flavors. Serve as is with crackers, or toss with pasta for an instant creamy sauce. Free of cholesterol, lactose, egg, gluten and soy. Non-GMO.Ingredients: Organic Cashews, Filtered Water, Organic Coconut Oil, Organic Dried Tomatoes, Organic Chickpea Miso (Organic Chickpeas, Organic Rice Koji, Sea Salt, Water, Koji Spores), Sea Salt, Nutritional Yeast, Organic Garlic Powder, Cultures	6.5	oz	9.99	24.59	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/wbxklJadRoC54ohgnVmE_FK1A0445.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	389	\N	\N	\N
718	Double Cream Garlic Herb Vegan Cheese	Buttery and savory, a classic combination of garlic and herbs in a creamy base makes for delightful eating on crackers, melted on a baked potato, or as a schmear for bagels. Free of cholesterol, lactose, egg, gluten and soy. Non-GMO product.Ingredients: Organic Cashews, Filtered Water, Organic Coconut Oil, Organic Parsley, Organic Chickpea Miso (Organic Chickpeas, Organic Rice Koji, Sea Salt, Water, Koji Spores), Sea Salt, Organic Garlic, Nutritional Yeast, Organic Herbs, Cultures	6.5	oz	9.99	24.59	lb	Dairy	Cheese	http://goodeggs1.imgix.net/product_photos/R312hF9kSMqQAxyqCh9t_FK1A0457.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	389	\N	\N	\N
719	Organic Firm Tofu	"This tofu is a great consistency. I like to marinate in sesame oil, ponzu, minced garlic and rice vinegar, then fry lightly in peanut oil to use in noodle or cabbage salads!" - Darren, Grocery BuyerOur Organic Firm Tofu is made with our rich soymilk that is\nsweet and creamy. We brew our soymilk with just the right amount of water and\nsoybeans. Then we bring it to a specific temperature in order to produce the\nperfect consistency of texture and flavor.  Precision and accuracy is how we make our tofu\nin order to provide the best quality from our family to yours. \nWe are the largest and oldest family (three generations)\nowned and operated manufacturer in Northern California. \nWe take great pride in our tofu that is made with our family\nrecipe for over 90 years.  Our tofu and\nsprouts are produced with only the highest quality ingredients and care.   We use a high quality organic soybean that\nare grown in the USA and is USDA approved non-GMO. Wo Chong Company, Inc.  has\ndeveloped, maintains and administers a HACCP-based Good Manufacturing Practices\n(GMPs) Food Safety Program.For firm tofu, we recommend marinating the tofu with your favorite sauces or leave it as it is, then grill, bake, or stir fry it to add to your salad, sandwich or rice. \nIngredients: Water, Organic Soybeans, Calcium Sulphate	14	oz	1.99	0.14	oz	Dairy	Ready to Eat	http://goodeggs1.imgix.net/product_photos/0GqGYVJURg6bnnl2g4q2_FK1A5646.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	320	\N	\N	\N
720	Organic Hodo Braised Tofu	At\nHodo, we use time-honored, artisan methods to make a creamy, higher protein\nsoymilk that is the foundation of all our hand-crafted tofu. The result is more\ncomplexity and depth of flavor to our firm tofu. \n To make Hodo Braised Tofu, we braise our signature Hodo Firm Tofu in a light Chinese Five-Spice blend and caramel sauce that imparts a lovely fragrance and rich flavor. A fully cooked product, you can enjoy Hodo Braised Tofu straight, in a salad or as a filling for sandwiches and omelets. We love to add it to stir-frys, congee, and noodle soups. All organic and gluten-free, there’s a freshness you can actually taste. Ingredients: Organic Firm Tofu* (Water, Organic,  Soybeans, Calcium Sulfate), Water, Sea Salt,\nFive-Spice* (Star Anise*, Cinnamon*, Fennel*, Cloves*, Black Pepper*), Brown\nSugar**OrganicRecipes: http://goo.gl/SQN42W	8	oz	4.19	0.52	oz	Dairy	Ready to Eat	http://goodeggs2.imgix.net/product_photos/bwjAWf3SSHyQpJRoqTRG_853404002220.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	320	\N	\N	\N
841	Ground Pork (Frozen)	Ground Pork- Pure Country Pork (Ephrata, WA), from Prather Ranch Meat CompanyThese Verified Non-GMO and Food Alliance Certified black hogs are fed a Non-GMO verified diet consisting of barley, wheat, triticale, field peas, and flax. They are never treated with antibiotics. The pork quality is distinctive with it’s European small grain finish giving it a great taste.	1	lb	7.49	7.49	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/NYMUAB7dQJGfavknJjqT_FK1A0952.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
721	Organic Hodo Firm Tofu	Taste the difference in Hodo\nFirm Tofu. At Hodo, we use time-honored, artisan methods to make\na creamy, higher protein soymilk that is the foundation of all our hand-crafted\ntofu. The result is our tofu has more complexity and depth of flavor. Hodo Firm Tofu has a subtle nutty aroma and\nbuttery smooth texture.  Compared to\naverage market brands, Hodo Firm Tofu has 50% higher protein per serving. Our hand-crafted tofu is made from organic, non-GMO, US-grown, whole\n\nsoybeans.\nHodo Firm Tofu is a favorite staple in\nstir-frys, stews and curries.  A fully cooked\nproduct, you can add Hodo Firm Tofu directly to your favorite\nsalad or crumble it into scrambles and chilis. \n\nTo\nfully savor Hodo Firm Tofu’s fresh flavor and superior texture, slice thinly\nand dip with a good olive oil and sea salt. We love to\nmarinate the tofu and grill or broil it.  Ingredients: Water, Organic, Non-GMO Soybeans, Calcium Sulfate.Recipes: http://goo.gl/u7Wwua	12	oz	4.19	0.35	oz	Dairy	Ready to Eat	http://goodeggs2.imgix.net/product_photos/FYuO75k2QDGriDQYTcqN_853404002213.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	320	\N	\N	\N
722	Mushroom Risotto Veggie Burger	This veggie burger contains a mix of mushrooms, arborio rice, peas, parsley & truffle oil. It's dense texture and earthy flavor will satisfy any craving. Ingredients: Cooked\narborio rice (arborio rice, water), cooked\nbrown rice (brown rice, water), roasted button\nmushrooms, button mushrooms,\nexpeller pressed canola oil, potato flakes,peas, carrots, onions, cooked\nwild rice (wild rice, water), kale,\nroasted portobello mushrooms, celery, roasted garlic, arrowroot powder, sea salt, parsley, brown rice\nflour, truffle oil (olive oil,\nnatural truffle extract, natural flavoring,\nwhite truffles), black pepper\n\n	10	oz	3.99	0.4	oz	Dairy	Ready to Eat	http://goodeggs2.imgix.net/product_photos/3NSQPhXRSnqmLctZmcIZ_20160708-DrPraeger_MushroomVeggie_MG_5012.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	342	\N	\N	\N
723	Organic Hodo Thai Curry Tofu Nuggets	Hodo Thai Curry Tofu Nuggets are flavorful and fragrant\nmorsels of tofu cubes that we fry then braise in an aromatic curry of lemongrass and warm, exotic spices that impart\na slightly spicy and wonderful flavor explosion in your mouth. Hodo Thai Curry Nuggets\nare juicy, slightly spicy and tasty, and have a chewy texture.  Hodo Thai Curry Nuggets are\ncertified organic and gluten-free. Try\nthem cold or hot, straight out of the package or as the star in a salad, pasta\nor a sauté. We particularly love the\nnuggets in a sandwich with sliced apples. Toss some into your lunch box as a\nhealthy snack!.This product was formerly named Hodo Curry NuggetsIngredients:Hodo Organic Tofu Puffs (Hodo Organic Tofu [Water, Organic\nSoybeans, Calcium Sulfate], Soybean Oil*), Water, Evaporated Cane Juice*, Sea\nSalt, Curry Powder* (Coriander*, Cumin*, Turmeric*, Mustard*, Black Pepper*,\nFenugreek*, Cayenne*), Garlic Powder*, Sesame Oil*, Chilies*, Cayenne*,\nLemongrass**OrganicRecipes: http://goo.gl/I0Azi5	8	oz	5.49	0.69	oz	Dairy	Ready to Eat	http://goodeggs2.imgix.net/product_photos/sZfqxLqwQY6IYErmRnLA_853404002695.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	320	\N	\N	\N
724	Classic Tempeh	Fresh, unpasteurized, handcrafted organic tempeh!  Perfectly tender for sandwiches, stir fries, soups, salads and more. GMO-free, wheat-free and fermented with love. Try our tasty tempeh recipes at http://www.aliveandhealing.com/recipes.  Ingredients: Organic GMO Free Soybeans, Organic Rice Vinegar, Organic Tempeh Culture, Organic Tapioca StarchCONTAINS: SOY	8	oz	3.99	7.98	lb	Dairy	Ready to Eat	http://goodeggs1.imgix.net/product_photos/528AhCL5Qq55OY5C5IzG_FK1A0266.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	353	\N	\N	\N
725	Organic Hodo Sichuan Mapo Tofu	Hailed as one of the most popular Chinese\ndishes ever, the legendary Mapo tofu is a spicy stir fry of our signature tofu,\nwith the heady, floral fragrance and tongue-tingling bite of Sichuan peppercorn.  We added miso and mushrooms for a richer\nflavor.  Hodo Sichuan Mapo Tofu is a quick, easy\nand  delicious entrée. ll organic, non-GMO, and ready-to-serve.  The entrée is all vegan and made with\ngluten-free ingredients.  \nHodo\nSichuan Mapo Tofu is ready-to-eat!  Just\nsimply reheat the entrée and serve over rice or noodles.  For a traditional option, brown and cook\nground meat in a skillet, then add Hodo Sichuan Mapo Tofu and stir to combine.   Ingredients: Hodo Organic Firm Tofu (Water Organic Soybeans,\nCalcium Sulfate), Water, Soybean Oil*, Miso*, (Cultured White Rice*, Soybeans*,\nWater, Sea Salt), Garlic*, Ginger*, Rice Vinegar* (Water, Rice*), Dried\nMushrooms*, Paprika*, Sichuan Peppercorn*, Sea Salt, Chilies*, White Pepper*Contains soy* Organic	10	oz	5.49	0.55	oz	Dairy	Ready to Eat	http://goodeggs1.imgix.net/product_photos/wjDvE67XRfWYyS1CZkUr_20160504-HodoSoy_SichuanTofu_MG_8616.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	320	\N	\N	\N
726	California Veggie Burger	The California Veggie burger is the OG veggie burger from Dr. Praeger's. It's packed full of carrots, peas, broccoli and spinach. Bake it, toast it, or pan-fry this patty. It doesn't matter how you choose to cook it, the full flavor will help you understand why this is Dr. Praeger's most popular veggie burger. Ingredients:\nCarrots, onions, string beans, oat bran, soybeans, zucchini,\nexpeller pressed canola oil, peas, broccoli, corn, soy flour, spinach, red\npeppers, arrowroot powder, corn starch, garlic, corn meal, sea salt, parsley,\nblack pepper.Contains soy	10	oz	3.99	0.4	oz	Dairy	Ready to Eat	http://goodeggs1.imgix.net/product_photos/JiauWVZFT2qBpWpi8cai_20160708-DrPraeger_CaliforniaBurger_MG_5020.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	270	\N	\N	\N
727	Super Green Veggie Burger	If you need to up your daily green intake this veggie burger is perfect for you! It's full of 6 different greens and a hint of ginger and cayenne to add a little kick of spice. Ingredients: Collard\ngreens, cooked quinoa (quinoa, water), kale, swiss chard, turnip greens,\nmustard greens, spinach, expeller pressed canola oil, potato flakes, onions,\napples, arrowroot powder, cooked teff (teff, water), parsley, roasted garlic,\nginger, sea salt, hemp protein, black pepper, cayenne pepper, coriander\n	10	oz	3.99	0.4	oz	Dairy	Ready to Eat	http://goodeggs2.imgix.net/product_photos/z3oMjoXNTl2p6qQgLvji_20160708-DrPraeger_SuperGreens_MG_5018.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	270	\N	\N	\N
728	Organic Hodo Tofu Veggie Burger	Hodo Tofu Veggie Burgers are flavorful, juicy and ‘meaty’ tofu patties studded with a mirepoix of carrots, onions and cabbage. Unlike most other veggie burgers, ours is free of soy protein isolates and fillers - we simply use our whole bean, organic, non-GMO tofu as a base. We grind our signature firm tofu, fold in fresh cut vegetables, and season it with umami-rich, ground shiitake mushroom. Wholesome, and awesome, these fully-cooked hearty vegan burgers will tempt even the most serious of carnivores. And here’s the beef on our vegan burger -- each serving of the Tofu Veggie Burger is a whopping 40% of your daily protein needs and rivals any traditional quarter pounders in the protein department. All vegan, organic and nopn-GMO, and gluten-free.Each pack contains two 4oz patties. Buns and trimmings are not included.Ingredients: Hodo Organic Firm Tofu*, Carrots*, Cabbage*, Onions*, Seasalt,\nShiitake Mushroom*, Garlic Powder*, White Pepper*, Soy Oil"* OrganicRecipes: http://goo.gl/u7Wwua	8	oz	5.49	0.69	oz	Dairy	Ready to Eat	http://goodeggs1.imgix.net/product_photos/ATCJgg41TVeR5nfzNtl9_853404002268.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	320	\N	\N	\N
729	Brown Rice Spring Roll Wrappers	Also known as "rice paper," these healthy and gluten-free Brown Rice Spring Roll Wrappers just need to be moistened briefly with warm water to create a tasty and flexible wrap for any combo of veggies, herbs, meat, tofu, and noodles. Serve up a fun DIY spring roll dinner where everyone can pick their favorite ingredients (we like a combo of lettuce, thinly sliced carrots and cucumbers, fresh herbs like shiso, mint, or basil, and grilled meat) or pack them pre-made for nutritious school snacks and work lunches. For a healthy and kid-friendly dessert, wrap a quartered banana in rice paper and fry it lightly in coconut oil or butter until golden and crispy. Versatile and super speedy, this is one pantry staple we'll never be without.Package contains 12 spring roll wrappers.Ingredients: brown rice, cassava, water, organic green tea, salt.	8	oz	3.99	0.5	oz	Dairy	Ready to Eat	http://goodeggs2.imgix.net/product_photos/ZGeKbdFPSR2FMz1SqfrQ_FK1A5237.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	382	\N	\N	\N
730	Organic Hodo Sesame Yuba Noodles	Hodo Sesame Yuba Noodles are a delectable meal of hand-cut\nyuba strips.  Yuba is the\nthin veil that forms on the surface as the cream rises in heated soymilk. To\nmake our delicious Hodo Sesame Yuba Noodles, we first marinate our yuba, and then sear to bring out\nits amazing natural flavors. We then hand\ncut the yuba into ribbons and glaze them with a savory, creamy and luscious tahini dressing, which\nis delightfully rich with fruity and nutty undertones.  \nHodo Sesame Yuba Noodles are certified organic, gluten-free and are protein-rich with zero cholesterol. The noodles are great\neaten cold or hot. Enjoy the strips\nstraight, on a salad, or as the star in a wrap or\npasta. Simply serve as a side dish for a quick and delicious meal.This product was formerly called as Hodo Sesame Yuba Strips.Ingredients: Hodo Organic Yuba (Water, Organic Soybeans), Water,\nTahini* (Sesame Paste*), Gluten-Free Tamari* (Water, Soybeans*, Salt,\nAlcohol*), Rice Vinegar* (Water, Rice*), Evaporated Cane Juice*, Sesame Oil*, Brown\nSugar*, Cornstarch*, Soybean Oil*, Garlic*, Ginger** OrganicRecipes: http://goo.gl/vvl1fp	8	oz	6.99	0.87	oz	Dairy	Ready to Eat	http://goodeggs2.imgix.net/product_photos/XT60uOy4RLm0jrVPN8oN_853404002718.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	373	\N	\N	\N
731	Organic Hodo Spicy Yuba Noodles	Hodo Spicy Yuba Noodles are a delectable meal of hand-cut\nyuba strips. Yuba is the\nthin veil that forms on the surface as the cream rises in heated soymilk. To\nmake our delicious Hodo Spicy Yuba Noodles, we first marinate our yuba, and then sear to bring out\nits amazing natural flavors. We then hand\ncut the yuba into ribbons and glaze them with a spicy teriyaki sauce, which packs\na kick and lots of umami.\nHodo Spicy Yuba Noodles are certified organic, gluten-free and are protein-rich with zero cholesterol. The strips are great\neaten cold or hot.  Enjoy the noodles straight, on a salad, as a sandwich filling or as a stir-fry or pasta\ningredient.  This product was formerly called Spicy Yuba Strips. Ingredients: Hodo Organic Yuba (Water, Organic Soybeans), Soybean\nOil*, Water, Rice Vinegar* (Water, Rice*), Gluten-Free Tamari* (Water,\nSoybeans*, Salt, Alcohol*), Evaporated Cane Juice*, Sesame Oil*, Chilies*,\nCornstarch*, Brown Sugar*, Cayenne*,  Garlic*,\nGinger*, Orange Peel*, Licorice*.Recipes: http://goo.gl/vvl1fp	8	oz	6.99	0.87	oz	Dairy	Ready to Eat	http://goodeggs2.imgix.net/product_photos/C2WLKZb8RRaaTHTi35Yl_853404002701.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	373	\N	\N	\N
732	Organic Hodo Fresh Handmade Yuba	Yuba is a delicacy. Also known as “bean curd sheet,” yuba is the\nthin veil that forms on the surface as the cream rises in heated soymilk. At Hodo, we hand harvest the yuba, one sheet\nat a time. Hodo Yuba has a creamy, nutty and subtly complex flavor,\nwith a firm bite. Hodo Yuba is\ngluten-free, protein-rich and has zero cholesterol. All Hodo Yuba is made from organic, non-GMO, US-grown whole soybeans.Hodo Yuba comes in thin sheets that can be cut\ninto noodles and makes for a great all-organic, gluten-free pasta dish. Hodo Yuba is perfect for wraps and spring\nrolls or as a wonderful addition into stews, soups and sautés.Ingredients: Water, Organic Non-GMO Soybeans.Recipes: http://goo.gl/ExABmN	5	oz	6.99	1.4	oz	Dairy	Ready to Eat	http://goodeggs2.imgix.net/product_photos/gNveqFRSJOuVdRiXDlGg_853404002237.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	218	\N	\N	\N
733	Chorizo Seitan	Seitan (pronounced “say-tan”) is a traditional Japanese food created by using water to wash the starch away from wheat flour and retaining the wheat protein. With an impressively meat-like texture and robust flavor, Upton’s Naturals Seitan is both high in protein and oil-free. This mildly spicy Seitan is an oil-free version of a traditional ground sausage. Enjoy it on tacos, nachos, over rice, or in a breakfast scramble.Keep refrigerated or frozen. Heat and serve. Enjoy within 5 days of opening. Can be baked into your favorite recipes or for best results pan fry with a small amount of oil.Ingredients: Water, vital wheat gluten, soy sauce (water, wheat, soybeans, salt), apple cider vinegar, garlic, guajillo, sea salt, onion, cumin, black pepper.Allergens: Wheat, soy	8	oz	4.49	0.56	oz	Dairy	Ready to Eat	http://goodeggs1.imgix.net/product_photos/H6lVvt6HRTetdUDC04yo_20160712-Uptons_ChorizoSeitan_MG_5121.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	404	\N	\N	\N
734	Traditional Seitan	Seitan (pronounced “say-tan”) is a traditional Japanese food created by using water to wash the starch away from wheat flour and retaining the wheat protein. With an impressively meat-like texture and robust flavor, Upton’s Naturals Seitan is both high in protein and oil-free. This highly versatile variety of Seitan comes in minimally seasoned larger chunks just waiting for you to exercise your culinary creativity. Goes well on sandwiches, in a marinade, over a salad or in a wrap.Keep refrigerated or frozen. Heat and serve. Enjoy within 5 days of opening. Can be baked into your favorite recipes or for best results pan fry with a small amount of oil.Ingredients: Water, vital wheat gluten, soy sauce (water, wheat, soybeans, salt), whole wheat flour, garlic, sea salt, onion.Allergens: Wheat, soy	8	oz	4.49	0.56	oz	Dairy	Ready to Eat	http://goodeggs2.imgix.net/product_photos/9TT2zgFMSdWqHg5QA8VH_20160712-Uptons_TraditionalSeitan_MG_5124.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	404	\N	\N	\N
735	Bacon Seitan	Seitan (pronounced “say-tan”) is a traditional Japanese food created by using water to wash the starch away from wheat flour and retaining the wheat protein. With an impressively meat-like texture and robust flavor, Upton’s Naturals Seitan is both high in protein and oil-free. Cook this seitan bacon a little or cook it a lot (for you extra crispy vegan Bacon lovers). This smoky seitan makes a great BLT, salad or pizza topping, or enjoy it as a side. A portion of all proceeds from Bacon Seitan retail packages go to keeping happy pigs, happy at Farm Sanctuary!Keep refrigerated or frozen. Heat and serve. Enjoy within 5 days of opening. Can be baked into your favorite recipes or for best results pan fry with a small amount of oil.Ingredients: Water, vital wheat gluten, soy sauce (water, wheat, soybeans, salt), whole wheat flour, natural hickory smoke concentrate, paprika, sea salt, onion. Allergens: Wheat, soy	5	oz	4.49	0.9	oz	Dairy	Ready to Eat	http://goodeggs1.imgix.net/product_photos/WGgj2nNzT4esvoy5dqPt_20160712-Uptons_BaconSeitan_MG_5140.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	404	\N	\N	\N
736	Chili Lime Carnitas Jackfruit	Jackfruit is native to Asia. It is recognizable for its spiky exterior and notable for its many stages of maturity, each of which yields a different texture and flavor. Our young, green Jackfruit has a texure similar to that of shredded meat and is available pre-seasoned and ready-to-eat. This seasoned Jackfruit has a little bit of chili and a hefty dose of lime. Enjoy it in tacos, fajitas, salads, nachos or over rice.Pan Fry: Remove product from pouch, place in pan over medium heat with a small amount of oil (optional) and cook for 5-7 minutes or until thoroughly heated, stirring occasionally. For finer shreds, break up in pan.Ingredients: Jackfruit, onion, chili, vinegar, lime, evaporated cane juice, sea salt, garlic, black pepper, cumin, coriander.(Produced on dedicated allergen-free equipment in a facility that also processes peanuts and sesame). Refrigeration required after opening. Enjoy within 5 days of opening. For best results, mix product first.	10.6	oz	5.49	0.52	oz	Dairy	Ready to Eat	http://goodeggs2.imgix.net/product_photos/q0tqxr5Tg6GkSxP9K3bg_20160712-Uptons_ChiliLimeJackFruit_MG_5152.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	328	\N	\N	\N
737	Bar-B-Que Jackfruit	Jackfruit is native to Asia. It is recognizable for its spiky exterior and notable for its many stages of maturity, each of which yields a different texture and flavor. Our young, green Jackfruit has a texure similar to that of shredded meat and is available pre-seasoned and ready-to-eat. We season with a tangy Bar-B-Que sauce, this Jackfruit makes a great sandwich topped with a cabbage slaw, in a salad or wrap, or over rice. For a sweeter sauce, add brown sugar, agave or maple syrup.Pan Fry: Remove product from pouch, place in pan over medium heat with a small amount of oil (optional) and cook for 5-7 minutes or until thoroughly heated, stirring occasionally. For finer shreds, break up in pan.Ingredients: Jackfruit, tomato paste, vinegar, molasses, filtered water, onion, evaporated cane juice, sea salt, (Produced on dedicated allergen-free equipment in a facility that also processes peanuts and sesame). Refrigeration required after opening. Enjoy within 5 days of opening. For best results, mix product first.	10.6	oz	5.49	0.52	oz	Dairy	Ready to Eat	http://goodeggs2.imgix.net/product_photos/HRxl5Y1QPa85GUuFAMen_20160712-Uptons_BBQJackfruit_MG_5143.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	251	\N	\N	\N
738	Organic Hodo Five-Spice Tofu Nuggets	Hodo Five-Spice Tofu Nuggets are flavorful and fragrant\nmorsels of tofu cubes that we fry then braise in an organic apple cider with an\nAsian five-spice blend, which infuses the tofu with aromatic spices.  Hodo Five-Spice Nuggets\nare juicy and tasty, and have a chewy texture. The\nnuggets are savory with a hint of smoky sweetness.Hodo Five-Spice Nuggets are\ncertified organic and gluten-free.  They are great eaten cold or hot, and makes for a delicious treat\nEnjoy the Nuggets straight, on a salad, as a sandwich filling or as a\nstir-fry or noodle-dish ingredient. We\nparticularly love the Nuggets grilled.  Ingredients: Hodo Organic Tofu Puffs (Hodo Organic Tofu [Water, Organic\nSoybeans, Calcium Sulfate], Soybean Oil*), Water, Apple Juice*, Gluten-Free\nTamari* (Water, Soybeans*, Salt, Alcohol*), Brown Sugar*, Asian Five-Spice* (Star\nAnise*, Cinnamon*, Fennel*, Cloves*, Black Pepper*)*OrganicRecipes: http://goo.gl/ZkNYzv	8	oz	5.49	0.69	oz	Dairy	Ready to Eat	http://goodeggs2.imgix.net/product_photos/Y8bS6euQRIm9QAQWzzPK_853404002688.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	320	\N	\N	\N
739	Uncured Bacon Lardons (Frozen)	Bacon lardons are the perfect addition to a soup or weekend frittata. They also go great crumpled over a salad or baked potato. Ingredients: Llano Seco pork, sea salt, brown sugar, cherry powder, celery powder, turbinado sugar and natural flavorings.Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	1	lb	7.79	7.79	lb	Meat	Turkeys & More	http://goodeggs2.imgix.net/product_photos/aLVVDOPvQf6h6wNcBtmB_20160513-CasaRosa_CottageBacon_MG_9511.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	268	\N	\N	\N
754	Organic Boneless Skinless Chicken Breasts	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1.25	lb	11.89	9.51	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/lKAJdhWHTCwUgmM5sxAN_FK1A3473.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
755	Organic Ground Chicken (Frozen)	Free-Range Organic Ground Chicken, 95% Lean- from Mary'sGround chicken from Mary's! 95% lean ground chicken, no added fat or skin and as you would expect from Mary's: no antibiotics ever, no preservatives, gluten free, non-GMO Project Verified, and certified USDA Organic.	1	lb	9.49	9.49	lb	Meat	Poultry	http://goodeggs2.imgix.net/product_photos/pspKw6X9QqMMxxyH6TKJ_FK1A5379.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
782	Pasture Raised Whole Chicken (Frozen)	Pasture Raised Whole Chicken- from A4 Farms in Santa Rosa, through Sonoma County Meat Co.Whole chickens, perfect for roasting in the oven, spatchcocking and throwing on the grill, or cutting up and using in a soup or stew (or maybe even buttermilk fried chicken? I know, sounds good, right?) These chickens are the conventional "Cornish Cross" breed, so they'll have the proportions most folks are used to these days with all the benefits of being raised on pasture! A4 Farms has deep roots in Santa Rosa; with a longtime family farming history that has included hops, prunes, hay, cattle, and now pasture-raised farm fresh chickens. Jessica and Brian are committed to raising chickens outside and free with no antibiotics, and no hormones. They forage on grasses, and bugs, with access to high quality feed containing essential vitamins and minerals to keep the chickens healthy and vigorous.	3	lb	29.99	10.0	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/O3MofGzCR4aGt2998CIw_chicken_spring.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
756	Organic Boneless Skinless Chicken Breasts (Frozen)	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	2	lb	17.99	8.99	lb	Meat	Poultry	http://goodeggs2.imgix.net/product_photos/DYyR3ZrwTpSvxJTvXsUv_FK1A6571.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
757	Organic Chicken Breast Tenders (Frozen)	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	2	lb	17.99	8.99	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/ecWdJsMjReyKo0trRQZs_Good%20Eggs_111515-16.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
758	Organic Boneless Skinless Chicken Breasts	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1.75	lb	16.59	9.48	lb	Meat	Poultry	http://goodeggs2.imgix.net/product_photos/m1PPbhmR2uDnY2pDDbY1_FK1A3473.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
759	Organic Bone-In Skin-On Chicken Breasts	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1	lb	7.99	7.99	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/pPLivv1ITjq68SdMeurq_FK1A3719.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
760	Organic Boneless Skinless Chicken Thighs	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1	lb	7.99	7.99	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/lKAJdhWHTCwUgmM5sxAN_FK1A3473.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
842	Thin-Cut Pork Chops (Frozen)	These heritage pork chops are juicy, flavorful and easy to\ncook. These are the perfect chops to have on hand for a quick delicious meal.\nNon-GMO Project Verified and Food Alliance Certified.	0.75	lb	9.59	12.79	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/hxRmlun7TLuJUjvDiqz3_FK1A4930.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
761	Organic Whole Chicken Thighs	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1.5	lb	8.99	5.99	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/ow7lddMASXOPpD5IoX55_FK1A4030.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
762	Organic Whole Chicken Thighs	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1.25	lb	7.49	5.99	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/d7Ru4o1IRLaursDlxqGp_FK1A4030.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
763	Organic Chicken Drumsticks (Frozen)	Individually Quick Frozen DrumsticksMary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	2	lb	9.99	5.0	lb	Meat	Poultry	http://goodeggs2.imgix.net/product_photos/KU98MEoATmwGWenNlQus_20160701-Marys_IQFDrumsticks_MG_4269-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
765	Organic Whole Chicken Legs (Fresh)	"This Memorial Day I'm looking forward to grilling these chicken thighs and covering them in Prather Ranch's BBQ Sauce!" Darren, Good Eggs Sourcing ManagerOrganic Free Range Chicken LegsMary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1.25	lb	6.29	5.03	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/TazKHmZETwmGUpEuOc2j_FK1A3464.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
766	Pasture Raised Chicken Legs (Frozen)	Whole chicken legs (leg/thigh quarter), bone-in, skin-on.Prather Ranch Meat Company has built a relationship with Big Bluff Ranch in the Shasta Cascades to bring you pasture-raised chicken with tremendous flavor. A sustainable family farm that goes back two generations, Big Bluff Ranch has been raising poultry with a holistic approach to both animals and the environment for over a decade. Allowed to roam free and forage after 3-6 weeks of brooding, Big Bluff chickens are never treated with hormones or antibiotics.	0.75	lb	6.79	9.05	lb	Meat	Poultry	http://goodeggs2.imgix.net/product_photos/MNaDXTL0RzWV7MZQmymv_FK1A5282.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
783	Pasture Raised Whole Chicken (Frozen)	Prather Ranch Meat Company has built a relationship with Big Bluff Ranch in the Shasta Cascades to bring you pasture-raised chicken with tremendous flavor. A sustainable family farm that goes back two generations, Big Bluff Ranch has been raising poultry with a holistic approach to both animals and the environment for over a decade. Allowed to roam free and forage after 3-6 weeks of brooding, Big Bluff chickens are never treated with hormones or antibiotics.	2.5	lb	19.99	8.0	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/U6MFJ1HoRGGffsFYb854_unnamed-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
843	Thick-Cut Pork Chop (Frozen)	From Non-GMO verified heritage pigs, these\npork chops are bone-in, thick, juicy, flavorful and easy to cook. Cut 2”-thick,\nthey are great for the grill, skillet or oven. \n\nNon-GMO Project Verified and Food Alliance\nCertified	0.75	lb	9.59	12.79	lb	Meat	Pork	http://goodeggs1.imgix.net/product_photos/xWmUo7IgSPK2jMP05Er9_FK1A5582.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
767	Organic Whole Chicken Legs	Organic Free Range Chicken LegsMary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1.5	lb	7.49	4.99	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/TazKHmZETwmGUpEuOc2j_FK1A3464.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
768	Organic Whole Duck Legs (Frozen)	Mary’s Free-Range Ducks are beautiful animals to raise. The Pekin Duck are raised naturally in the beautiful weather in California. They live year round with access to outdoors. We watch them everyday to make sure they are comfortable and happy. We make every effort to treat our ducks as humanely as possible throughout the production process. No Antibiotics EverRaised Without Added Hormones*No Preservatives or Additives*Federal Regulations Prohibit The Use Of Hormones In DuckFed a Vegetarian Diet (65% Corn, 25% Soybean Meal, 5% Vitamins and Nutrients, 5% Wheat)	0.8	lb	8.69	10.86	lb	Meat	Poultry	http://goodeggs2.imgix.net/product_photos/g9U4TxZgSVeLKWHlp8oA_FK1A6310.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	326	\N	\N	\N
769	Organic Duck Breast (Frozen)	Mary’s Free-Range Ducks are beautiful animals to raise. The Pekin Duck are raised naturally in the beautiful weather in California. They live year round with access to outdoors. We watch them everyday to make sure they are comfortable and happy. We make every effort to treat our ducks as humanely as possible throughout the production process. No Antibiotics EverRaised Without Added Hormones*No Preservatives or Additives*Federal Regulations Prohibit The Use Of Hormones In DuckFed a Vegetarian Diet (65% Corn, 25% Soybean Meal, 5% Vitamins and Nutrients, 5% Wheat)	1	lb	19.99	19.99	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/edH5YHnGQ3WJgm2bGRMj_FK1A6307.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	326	\N	\N	\N
770	Pasture Raised Duck (Frozen)	Whole Pasture-Raised Duck, free of GMOs, corn, soy, and antibiotics.  Healthy, happy ducks raised on the beautiful coast just a short drive South of San Francisco.Each duck is cryo-vac'd and flash-frozen to preserve the highest quality and freshness.Early Bird ducks are a truly gourmet treat.  Their life on our fertile pastures gives their rich and tender meat deep flavors, making these ducks a perfect example of the exceptional food that the beautiful coastal pastures south of San Francisco can produce.  This is a seasonal product, once it's gone, it's gone!  Early Bird ducks live outside in mobile pasture shelters that are moved every day onto fresh grasses that haven't been grazed by poultry for at least a full year. They have constant access to water, and enjoy splashing and bathing several times a day.To help them grow, we supplement their diet with a high-quality feed free of GMOs, corn, soy, and antibiotics. Their healthy outdoor lifestyle and balanced and diverse diet produces a tender, juicy, and flavorful bird that will be the highlight of any meal!	3.5	lb	31.49	9.0	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/u15znALOShKHoo5ULngz_FK1A4104.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	326	\N	\N	\N
771	Organic Whole Duck (Frozen)	Mary’s Free-Range Ducks are beautiful animals to raise. The Pekin Duck are raised naturally in the beautiful weather in California. They live year round with access to outdoors. We watch them everyday to make sure they are comfortable and happy. We make every effort to treat our ducks as humanely as possible throughout the production process. No Antibiotics EverRaised Without Added Hormones*No Preservatives or Additives*Federal Regulations Prohibit The Use Of Hormones In DuckFed a Vegetarian Diet (65% Corn, 25% Soybean Meal, 5% Vitamins and Nutrients, 5% Wheat)	4	lb	35.69	8.92	lb	Meat	Poultry	http://goodeggs2.imgix.net/product_photos/0F5NUIOTSXGAVj1HDqek_FK1A6364.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	326	\N	\N	\N
772	Pasture Raised Pekin Duck (Frozen)	Pasture Raised Pekin DuckOur ducks have been raised in our orchard, in batches of 50 per “duck schooner” with lots of green grass and a wading pool. Their diet is a certified GMO free grain mix that includes organic corn, peas, wheat, barley, distillers grains and the minerals and vitamins they need to grow, along with wheat sprouts and the planted forages in the orchard including wheat, rye, and peas. They are harvested at 7 1/2 weeks, and frozen immediately for optimum freshness. Young duck is the most decadent poultry you will ever eat. The meat is moist, tender and will flake off the bone. The skin is crispy. The fat is melt in your mouth delicious. The broth made from the bones is better than chicken broth. Don’t forget to reserve the fat in your baking dish to fry up some potatoes. We fried up some delicious baby German potatoes from our garden to eat with our roast duck, along with a spring pasta salad we made with rocket arugula, easter egg radishes, marinated in our apricot vinegar and olive oil. Try a duck today, you’ll be glad you did! (Don’t be intimidated by all those fancy recipes on the internet. I roasted ours just like a chicken.) - says Rachel, Casa Rosa Farms	2.5	lb	22.49	9.0	lb	Meat	Poultry	http://goodeggs2.imgix.net/product_photos/lMYXnoLQQAWxrFbFVtEC_20160701-CasaRosa-Duck_MG_4234.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	326	\N	\N	\N
773	Pasture Raised Pekin Duck (Frozen)	Pasture Raised Pekin DuckOur ducks have been raised in our orchard, in batches of 50 per “duck schooner” with lots of green grass and a wading pool. Their diet is a certified GMO free grain mix that includes organic corn, peas, wheat, barley, distillers grains and the minerals and vitamins they need to grow, along with wheat sprouts and the planted forages in the orchard including wheat, rye, and peas. They are harvested at 7 1/2 weeks, and frozen immediately for optimum freshness. Young duck is the most decadent poultry you will ever eat. The meat is moist, tender and will flake off the bone. The skin is crispy. The fat is melt in your mouth delicious. The broth made from the bones is better than chicken broth. Don’t forget to reserve the fat in your baking dish to fry up some potatoes. We fried up some delicious baby German potatoes from our garden to eat with our roast duck, along with a spring pasta salad we made with rocket arugula, easter egg radishes, marinated in our apricot vinegar and olive oil. Try a duck today, you’ll be glad you did! (Don’t be intimidated by all those fancy recipes on the internet. I roasted ours just like a chicken.) - says Rachel, Casa Rosa Farms	2.75	lb	21.99	8.0	lb	Meat	Poultry	http://goodeggs2.imgix.net/product_photos/lMYXnoLQQAWxrFbFVtEC_20160701-CasaRosa-Duck_MG_4234.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	326	\N	\N	\N
774	Pasture Raised Duck (Frozen)	Whole Pasture-Raised Duck, free of GMOs, corn, soy, and antibiotics.  Healthy, happy ducks raised on the beautiful coast just a short drive South of San Francisco.Each duck is cryo-vac'd and flash-frozen to preserve the highest quality and freshness.Early Bird ducks are a truly gourmet treat.  Their life on our fertile pastures gives their rich and tender meat deep flavors, making these ducks a perfect example of the exceptional food that the beautiful coastal pastures south of San Francisco can produce.  This is a seasonal product, once it's gone, it's gone!  Early Bird ducks live outside in mobile pasture shelters that are moved every day onto fresh grasses that haven't been grazed by poultry for at least a full year. They have constant access to water, and enjoy splashing and bathing several times a day.To help them grow, we supplement their diet with a high-quality feed free of GMOs, corn, soy, and antibiotics. Their healthy outdoor lifestyle and balanced and diverse diet produces a tender, juicy, and flavorful bird that will be the highlight of any meal!	3.25	lb	29.19	8.98	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/u15znALOShKHoo5ULngz_FK1A4104.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	326	\N	\N	\N
777	Ready to Eat Sous Vide Chicken	Fully Cooked Sous Vide Half Chicken- from Roli Roti in Oakland, Mary's Free-Range ChickenThis chicken comes to you fully cooked and ready to eat—you can add it to a salad or pasta dish as a no-prep protein option and have a complete meal in minutes! Or, for that Roli Roti rotisserie chicken experience in your own kitchen, we recommend you reheat in the oven and in under 20 minutes have a gorgeous, crispy skinned, golden brown roast chicken dinner ready to serve! Ingredients: Mary's Free Range Chicken (antibiotic free, non-GMO diet), SaltReheating Instructions:1. Preheat oven to 400°F.2. Remove chicken from the sous vide packaging and place in an oven safe dish.3. Pat skin dry with a paper towel. If desired, season with olive oil, cracked black pepper or herbs.4. Place in oven for approximately 15-20 minutes until skin is dark golden brown.Note: Because of the sous vide cooking technique, portions of the chicken may appear pink even though it is fully cooked and ready to eat. Best if used within 5 days of delivery.	1.5	lb	9.99	6.66	lb	Meat	Poultry	http://goodeggs2.imgix.net/product_photos/uqvI9dhPQYGgf44QA7Mx_20160726-RoliRoti_SousVideHalfChicken_MG_5808.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
778	Organic Whole Chicken	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	3	lb	11.99	4.0	lb	Meat	Poultry	http://goodeggs2.imgix.net/product_photos/2JiMoxPHQkeBQsDsclbX_FK1A3564.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
779	Organic Whole Chicken (Fresh)	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	4	lb	15.99	4.0	lb	Meat	Poultry	http://goodeggs2.imgix.net/product_photos/lLgEvIUTKWGnr319z7m6_FK1A3564.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
780	Pasture Raised Whole Chicken (Frozen)	Prather Ranch Meat Company has built a relationship with Big Bluff Ranch in the Shasta Cascades to bring you pasture-raised chicken with tremendous flavor. A sustainable family farm that goes back two generations, Big Bluff Ranch has been raising poultry with a holistic approach to both animals and the environment for over a decade. Allowed to roam free and forage after 3-6 weeks of brooding, Big Bluff chickens are never treated with hormones or antibiotics.	2.25	lb	17.99	8.0	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/U6MFJ1HoRGGffsFYb854_unnamed-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
781	Pasture Raised Whole Chicken (Frozen)	Pasture Raised Whole Chicken- from A4 Farms in Santa Rosa, through Sonoma County Meat Co.Whole chickens, perfect for roasting in the oven, spatchcocking and throwing on the grill, or cutting up and using in a soup or stew (or maybe even buttermilk fried chicken? I know, sounds good, right?) These chickens are the conventional "Cornish Cross" breed, so they'll have the proportions most folks are used to these days with all the benefits of being raised on pasture! A4 Farms has deep roots in Santa Rosa; with a longtime family farming history that has included hops, prunes, hay, cattle, and now pasture-raised farm fresh chickens. Jessica and Brian are committed to raising chickens outside and free with no antibiotics, and no hormones. They forage on grasses, and bugs, with access to high quality feed containing essential vitamins and minerals to keep the chickens healthy and vigorous.	2.25	lb	22.49	10.0	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/O3MofGzCR4aGt2998CIw_chicken_spring.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
806	Fajita Meat (Frozen)	One of our go-to favorites, this stir fry meat is great and easy to sautée. It works well with a favorite marinade or simply garnished with a little salt and pepper. Certified Humane Raised and Handled and GMO-free.	0.7	lb	10.49	14.99	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/iEpnjysRHSoaK0r4UaGC_FK1A2681.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	250	\N	\N	\N
784	Pasture Raised Whole Chicken (Frozen)	Pasture Raised Whole Chicken- from A4 Farms in Santa Rosa, through Sonoma County Meat Co.Whole chickens, perfect for roasting in the oven, spatchcocking and throwing on the grill, or cutting up and using in a soup or stew (or maybe even buttermilk fried chicken? I know, sounds good, right?) These chickens are the conventional "Cornish Cross" breed, so they'll have the proportions most folks are used to these days with all the benefits of being raised on pasture! A4 Farms has deep roots in Santa Rosa; with a longtime family farming history that has included hops, prunes, hay, cattle, and now pasture-raised farm fresh chickens. Jessica and Brian are committed to raising chickens outside and free with no antibiotics, and no hormones. They forage on grasses, and bugs, with access to high quality feed containing essential vitamins and minerals to keep the chickens healthy and vigorous.	2.5	lb	24.99	10.0	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/O3MofGzCR4aGt2998CIw_chicken_spring.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
785	Pasture Raised Whole Chicken (Frozen)	Prather Ranch Meat Company has built a relationship with Big Bluff Ranch in the Shasta Cascades to bring you pasture-raised chicken with tremendous flavor. A sustainable family farm that goes back two generations, Big Bluff Ranch has been raising poultry with a holistic approach to both animals and the environment for over a decade. Allowed to roam free and forage after 3-6 weeks of brooding, Big Bluff chickens are never treated with hormones or antibiotics.	2.75	lb	21.99	8.0	lb	Meat	Poultry	http://goodeggs1.imgix.net/product_photos/U6MFJ1HoRGGffsFYb854_unnamed-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
786	Uncured Rustic Bacon (Frozen)	This is the same famous, sugar-free, uncured Rustic\nBacon found at our farmers’ markets: brined with sea salt and hickory smoked\nwithout added nitrites. This is pure, savory bacon at its finest. Sliced and\nready for breakfast, a BLT or pasta. Ingredients: Pork, Water, Sea Salt, Cultured Celery Juice	0.75	lb	10.69	14.25	lb	Meat	Bacon	http://goodeggs2.imgix.net/product_photos/TqqFaON9QmOFSkNDULLx_FK1A5774.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	268	\N	\N	\N
787	Uncured Smoked Maple Bacon (Frozen)	This is the same popular, delicious, uncured sliced Maple\nBacon found at our farmers’ markets: brined with sea\nsalt and real, organic maple syrup, then hickory smoked with no added\nnitrites. This maple bacon has a classic flavor and aroma that is delicious\npaired with breakfast or savory dishes.  Ingredients: Pork, Water, Organic Evaporated Cane Syrup, Sea Salt, Organic Maple Syrup, Cultured Celery Juice	0.75	lb	11.29	15.05	lb	Meat	Bacon	http://goodeggs1.imgix.net/product_photos/ynxIEhpRQewbezCWg1gL_FK1A5745.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	268	\N	\N	\N
788	Hardwood Smoked Bacon (Frozen)	Handcrafted with maple sugar in small batches, this bacon is a personal favorite, not just because of the flavor but because it is sliced reasonably thick and retains some chew and texture after being crisped up in the skillet (cast iron, start it cold, flip once).Prepare yourself for the wonder of our locally hand-made bacon now using 100% Duroc pork, also known as "red pig." This heritage breed originated in the U.S. in the 1800s. It is a cornerstone for charcuterie in niche markets from California to Spain. Our bacon is made with pork that is farmed humanely with outdoor access and vegetarian diets; no gestation crates, no antibiotics, no hormones, no growth promotants, and no animal byproduct feeds.Ingredients: Pork, Water, Sugar, Sea Salt, Maple Sugar, Spices, Sodium Erythorbate, Sodium Nitrite.	0.75	lb	8.99	11.99	lb	Meat	Bacon	http://goodeggs1.imgix.net/product_photos/vx2WVpJRMKSNeiEVHAth_FK1A5363.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	268	\N	\N	\N
789	Uncured Sugar-Free Bacon (Frozen)	Truly uncured, Paleo-friendly bacon. Made from pasture raised Walnut Keep pork belly, no sugar, nitrites or nitrates added, no celery juice powder, no nothing. Just pure smoked porky goodness.Ingredients: Pork, Salt, Spices, "Sliced bacon, artisanally made in Sonoma County.""Here's the story of a lovely lady, and a very handsome butcher man.Established in 2014, with a valiant team, they make the best meats in the land.Wood smoked in the most amazing smokehouse, fill your plate, clap your hands."	0.75	lb	11.99	15.99	lb	Meat	Bacon	http://goodeggs2.imgix.net/product_photos/Je193VuQTyGHlSYo7sUn_Pork_Bacon1.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	268	\N	\N	\N
790	Uncured Bacon (Frozen)	Our hickory and maple smoked bacon is just slightly sweet and slightly smokey, nothing too overpowering and just the right amount of flavor for your morning pork fix. Ingredients: Llano Seco pork, water, sea salt, brown sugar, cherry powder, celery powder, turbinado sugar, and natural flavorings.Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	0.75	lb	8.99	11.99	lb	Meat	Bacon	http://goodeggs2.imgix.net/product_photos/rhsiBzAVRZqMrynX6O6V_FK1A7697.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	268	\N	\N	\N
791	Pasture Raised Honey Lavender Bacon (Frozen)	Handcrafted with lavender in small batches, Sonoma County Meat Co. brings you your new favorite bacon. Slightly sweet with just the tiniest hint of lavender, this bacon has got to be tasted!Prepare yourself for the wonder of our locally hand-made bacon now using 100% Duroc pork, also known as "red pig." This heritage breed originated in the U.S. in the 1800s. It is a cornerstone for charcuterie in niche markets from California to Spain. Our bacon is made with pork that is farmed humanely with outdoor access and vegetarian diets; no gestation crates, no antibiotics, no hormones, no growth promotants, and no animal byproduct feeds.Ingredients: Pasture Raised Pork, Sugar, Salt, Granulated Honey, Lavender Powder, Spices, Sodium Nitrite"Heritage breed pigs prance to create this bounty, free-ranging outdoors, raised by farmers who respect this land profoundly. Dry cured, hickory smoked, by the valiant team in Sonoma County. Fill your plate, clap your hands, for this bacon we share proudly."	0.75	lb	11.49	15.32	lb	Meat	Bacon	http://goodeggs1.imgix.net/product_photos/ePo7iwRoCusyDsu0Gxwh_FK1A5370.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	269	\N	\N	\N
839	Avocado Fed Ground Pork (Frozen)	Our goal at Stepladder Avocado Fed Pork is to create Hog Heaven. Our heritage Gloucester Old Spots roam 200 acres of forest with incredibly low density, and no fences. They are chaperoned by our livestock guardian dog, Gus, and free to forage, root, and just be happy pigs. They return to a small paddock in a gulch where they find water, a small amount of non-GMO, vegetarian grain ration, and all of the avocados we find on the ground of our orchards.  Heritage pigs have slightly smaller cuts than modern breeds, but the marbling and fat content makes up for it ten-fold.	1	lb	12.99	12.99	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/6fse32HRSQCQyBHl5hat_F1PS6rffS0y8PvkI2GB8_FK1A8581.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
792	Smoked Pepper Bacon (Frozen)	This is the bacon that changed everything.  With it's cult-like following at the Farmer's Markets, we are proud to offer you our Smoked Pepper Bacon.  Thick cut, lots of fat (which of course you keep to cook your veggies in) and quite possibly the best bacon ever.  Our sows are Yorkshires crossed on either a Duroc or Berkshire boar. The\n sows are pastured along with their piglets until the piglets are \nweaned. The weaned piglets are then finished with whole milk, whole \ngrain breads, brewers grain, and tortillas, producing what we believe to\n be a superior product.Ingredients: Pork, Salt, Cane & Maple Sugars, Pepper, Celery PowderNatural Bacon, No Nitrates	0.75	lb	11.49	15.32	lb	Meat	Bacon	http://goodeggs1.imgix.net/product_photos/TU7YLRzcRJiXfjbpqRPA_NHrp9OyCq2Fm75VdkEtleov4rmg3ojXg_p9JqKB0FeM.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	287	\N	\N	\N
793	Smoked Maple Bacon (Frozen)	If you're looking for that classic bacon flavor, sweet and savory that just hits that bacon spot, congratulations, you've found your new best friend.  DG-Langley Farms is proud to offer our Maple Sugar bacon.  This is what real bacon tastes likes folks.Our sows are Yorkshires crossed on either a Duroc or Berkshire boar. The\n sows are pastured along with their piglets until the piglets are \nweaned. The weaned piglets are then finished with whole milk, whole \ngrain breads, brewers grain, and tortillas, producing what we believe to\n be a superior product.Ingredients: Pork, Salt, Cane & Maple Sugars, Celery PowderNatural Bacon, No Nitrates	0.75	lb	12.79	17.05	lb	Meat	Bacon	http://goodeggs2.imgix.net/product_photos/d4BYkvqYQlSREIJCH2jF_gSQBG6aK_Dq3hTMBCsiTGBm16p8SsZOE4N3zY9sZhAc.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	268	\N	\N	\N
794	Uncured Bacon Ends and Pieces (Frozen)	Our bacon ends and pieces are the perfect addition to a soup or weekend frittata. They also go great crumpled over a salad or baked potato.Ingredients: Llano Seco pork, sea salt, brown sugar, cherry powder, celery powder, turbinado sugar and natural flavorings.Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	1	lb	7.79	7.79	lb	Meat	Bacon	http://goodeggs2.imgix.net/product_photos/2mhUOKZJSXyT9g161LNQ_FK1A0368.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	268	\N	\N	\N
795	No Sugar PALEO Bacon (Frozen)	That's right, you read it correctly, a true No Sugar Bacon, perfect for those trying to fill their bacon desires and maintain the Paleo life.  Our sows are Yorkshires crossed on either a Duroc or Berkshire boar. The\n sows are pastured along with their piglets until the piglets are \nweaned. The weaned piglets are then finished with whole milk, whole \ngrain breads, brewers grain, and tortillas, producing what we believe to\n be a superior product.Ingredients: Pork, Salt, Nutmeg, Paprika, Celery PowderNatural Bacon, No Sugar, No Nitrates	0.75	lb	11.99	15.99	lb	Meat	Bacon	http://goodeggs1.imgix.net/product_photos/54WiMb93TFZj91Q37WAX_wt2x6gajJUyGFBX8GMmau3H1ZPQAXN4jIxpjZUapiCg.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	268	\N	\N	\N
797	Grass Fed Beef Bacon (Frozen)	Our grassfed beef brisket makes wonderful beef bacon. Smoked with alder \nwood from the North Coast, and cured with a traditional sea salt and \nmaple sugar rub, this bacon is full flavored and smoky. Try our beef \nbacon instead of pork bacon for a less fatty breakfast treat, and get \nall the benefits of grass-fed beef with the flavor of bacon.Ingredients: sea salt, maple and non-GMO cane sugars, sodium nitrite (naturally occurring in celery salt). Smoked, fully cooked.	0.4	lb	11.19	27.98	lb	Meat	Bacon	http://goodeggs1.imgix.net/product_photos/eUGszMpySqCw7XUkr0VS_FK1A9615.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	268	\N	\N	\N
800	Beef Stew Meat	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. "Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	1	lb	9.99	9.99	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/43GRBRc4SUued8xhx1bp_FK1A4454.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	250	\N	\N	\N
801	Grass Fed Beef Burger Patties (Frozen)	Our delicious 1/4 lb burger patties are now available just in time for sunny weather. Roll out that bbq, grab a beer and get grilling!(4) 1/4 lb burgers in a pack. We raise our Limousin steers on certified organic rotational pasture and native grasslands within 2 hours of the Bay Area in the beautiful Capay Valley. We take the time to alfalfa finish all our animals. We truly believe that in order for consistency in a grass fed, grass-finished product, each producer must choose the best method for their farm and its local ecology. We grow our own pesticide free, non-GM alfalfa on our family's fields to produce high quality beef. You will find our farm's beef to be a very lean red meat with light marbling, yet extra tender. Our beef is dry-aged for a minimum of 16 days, flash frozen, and vacuum sealed. We are a certified USDA Grass Fed Producer and our farm and pastures are certified organic by CCOF. Follow us on our new Instagram feed @casa_rosa_farm and see how our animals really live.	1	lb	12.99	12.99	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/zHhKdpqTU2ZW5aVw8KmA_Beam1U1OTXO8H3qLy8Dg_EiyGkbFGV9EDK6gV8Z4hfCqi-O30OOClDhYyBagPtA0.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	270	\N	\N	\N
802	Grassfed Beef Stew Meat (Frozen)	100% Grass-fed and Finished Longhorn Stew Beef- from Twisted Horn Ranch, Bloomfield, CANote: Grass fed Longhorn beef is VERY lean and cooks 30 -40% faster. Please adjust recipe times accordingly and use a little olive oil on the meat when cooking	1	lb	13.99	13.99	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/CaszwSxET3CaVTvEwD3V_FK1A1335.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	250	\N	\N	\N
803	Ground Beef	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. "Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	0.8	lb	6.39	7.99	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/akGxv23jQeKoLTmASkfY_Beef_Ground_05.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
807	Ribeye Steak	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. The perfect steak for the grill, or sear in hot pan and finish off in the oven to a perfect medium rare."Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	1	lb	22.99	22.99	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/wZbqS4IkSnK91Knsi0pP_FK1A4653.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	261	\N	\N	\N
809	New York Steak (Frozen)	Tender and richly marbled, the New York steak is a classic\ncut. Simply season and grill to perfection.	0.75	lb	18.79	25.05	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/Xnyn88ukRWCDBfTkLS5G_Prather%20New%20York%20Steak.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	261	\N	\N	\N
810	Ribeye Steak	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. The perfect steak for the grill, or sear in hot pan and finish off in the oven to a perfect medium rare."Oak Ridge Angus raises premium grass-fed grain-finished beef in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi in 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pasture raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	0.75	lb	17.19	22.92	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/wZbqS4IkSnK91Knsi0pP_FK1A4653.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	261	\N	\N	\N
812	Filet Mignon Steak	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. "Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	0.7	lb	19.59	27.99	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/5TwObZpMQ5u8dnoX8MQX_FK1A4517.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	261	\N	\N	\N
813	Filet Mignon Steak	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. "Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	0.8	lb	22.39	27.99	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/5TwObZpMQ5u8dnoX8MQX_FK1A4517.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	261	\N	\N	\N
815	Flat Iron Steak	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. \nFor those nights\nwhen you just need a no-nonsense steak; pan sear in a screaming hot cast iron\npan or do a casual weekday grill, either way this steak will satisfy the\ncraving without the time commitment.\n\n"Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	0.25	lb	3.19	12.76	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/Hh0HtdCRqWYbn39SoYAz_FK1A4624.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	261	\N	\N	\N
816	Top Sirloin Steak	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. \nA perfect,\nlow maintenance steak for the beginning grill master! All you need is some\nsalt, fresh ground pepper, and a fire to create a meal to remember.\n\n"Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."Best if used or frozen within 11 days of the "packed on" date printed on the package.	0.5	lb	6.49	12.98	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/nkwpfeMIQCmdSeriRkZg_FK1A4398.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	261	\N	\N	\N
818	Top Sirloin Steak (Frozen)	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. \nA perfect,\nlow maintenance steak for the beginning grill master! All you need is some\nsalt, fresh ground pepper, and a fire to create a meal to remember.\n\n"Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."Best if used or frozen within 11 days of the "packed on" date printed on the package.	0.7	lb	9.09	12.99	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/nkwpfeMIQCmdSeriRkZg_FK1A4398.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	261	\N	\N	\N
819	Grass-fed Hanger Steak (Frozen)	100% Grass-fed and finished Hanger Steak- from Morris GrassfedHanger steaks are one of those cuts good butchers keep for themselves: full of flavor and easy to prepare. It is a thick strip steak from the underside of the beef cow, between the rib and the loin. We like to grill them for fajitas or season with a little dry rub and serve with an arugula salad: delicious!	1.25	lb	19.99	15.99	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/BxDB8NPCTa29fTUmG1s0_0oJVe1RRyopZagaFpAnHyfVen-q50SW4bHmMNm24WxY.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	261	\N	\N	\N
946	Beef Chorizo (Frozen)	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co.Beef chorizo, perfect for all the things chorizo is perfect for- with eggs, in tacos and burritos, in bean and lentil dishes, or just grilled with or without a bun!Ingredients: Beef, Salt, Paprika, Spices, Garlic. Pork casing.	0.7	lb	9.99	14.27	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/zVo5O6SBRU6oEuScb8Ht_FK1A8126.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	391	\N	\N	\N
820	T-Bone Steak	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. Second only to the Porterhouse-perfect for the grill, or sear in hot pan and finish off in the oven to a perfect medium rare. The perfect steak to share with a few friends with a bottle or two of good red wine."Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	2.5	lb	37.99	15.2	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/VInXG3pQd8bIe2Q1yJpA_FK1A0626.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	261	\N	\N	\N
821	Carne Asada	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. \nSliced by\nhand for ease of cooking and to maximize the surface area for your favorite\nspice mix! Cut into strips, douse in spices and use in tacos, fajitas, and\nburritos. \n\n"Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	1.25	lb	14.99	11.99	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/d1YOp4UbQaORRyVRmpkz_FK1A4381.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	218	\N	\N	\N
822	Boneless New York Steak (Frozen)	Grass-fed, Grain Finished Boneless New York Steaks- from Rancho Llano Seco, Chico, CAOur cattle are pasture-raised on our untouched, gently rolling lands. As part of a unique partnership with US Fish & Wildlife and the agricultural and conservation easements secured with them, our rotational grazing system promotes native grassland restoration and eradicates the invasive weed population. Cows spend their entire lives on pasture and are finished on a highly nutritious blend of locally grown organic grains developed specifically for our herds by an animal nutritionist, as we believe strongly in maintaining the highest health standards possible for our animals. Our beef has all the complexity of a grass-fed animal with the tenderness and marbling of a grain-fed animal. By promoting pasture health through our grazing, we continue to rejuvenate a nearly lost California landscape through sustainable and responsible animal husbandry practices.	1	lb	24.99	24.99	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/p2jRbl6QSry1Fv3mEg5D_20161110-LlanoSeco_Steaks_MG_6904.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	261	\N	\N	\N
823	Boneless New York Steak (Frozen)	Grass-fed, Grain Finished Boneless New York Steaks- from Rancho Llano Seco, Chico, CAOur cattle are pasture-raised on our untouched, gently rolling lands. As part of a unique partnership with US Fish & Wildlife and the agricultural and conservation easements secured with them, our rotational grazing system promotes native grassland restoration and eradicates the invasive weed population. Cows spend their entire lives on pasture and are finished on a highly nutritious blend of locally grown organic grains developed specifically for our herds by an animal nutritionist, as we believe strongly in maintaining the highest health standards possible for our animals. Our beef has all the complexity of a grass-fed animal with the tenderness and marbling of a grain-fed animal. By promoting pasture health through our grazing, we continue to rejuvenate a nearly lost California landscape through sustainable and responsible animal husbandry practices.	1.5	lb	36.99	24.66	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/p2jRbl6QSry1Fv3mEg5D_20161110-LlanoSeco_Steaks_MG_6904.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	261	\N	\N	\N
824	Chuck Steak (Frozen)	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. \nBone-In Chuck Steak- A high flavor, low price steak, perfect for the grill or broiler, about 1/2" thick. \n\n"Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."Best if used or frozen within 11 days of the "packed on" date printed on the package.	0.75	lb	7.49	9.99	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/KPOaarGGSJC08JmgKEIG_20160526-SonomaMeatCo_ChuckSteak_MG_0294.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	261	\N	\N	\N
827	Crosscut Beef Shanks (Frozen)	Braise away!  Take your time, fill your home with beautiful aromas and enjoy mouth-watering 100% locally-grown Morris Grassfed beef and gravy during the winter.  The perfect comfort food. The chuck roast is the perfect pot roast, and the short ribs and shanks are bone-in, which adds additional depth to the taste and nutritional value to your meal.Morris Grassfed provides 100% grassfed & finished (no antibiotics or added hormones) beef to customers throughout California. Our beef is dry-aged for 21 days, processed in USDA inspected facilities, cut & wrapped by small-scale, artisan butchers and delivered directly to you via Good Eggs.We are an independent, family-owned company. We practice holistic management on the rangelands we manage, taking into account the land, animals, and people affected by our decisions. We invite you to take a tour of our operations here and to learn about the social, ecological and health benefits of 100% grass finished beef.	2	lb	18.99	9.49	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/3TE831reRUyGm0cdiBGs_beef_shank.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
828	Beef Shanks (Frozen)	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. \nThe\nquintessential braising dish! With a beautiful round of femur in the center\npacked full of succulent marrow, this cut packs two flavor punches in one\npackage!\n\n"Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	0.9	lb	9.49	10.54	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/lMuB7fDTGmQZoZfknpiF_FK1A4468.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
829	Beef Brisket	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. Smoke\nit, roast it, brine it; this classic cut is perfect for trying out that new\nsmoker, or impressing your in-laws on St. Patrick’s Day. "Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	3.25	lb	38.99	12.0	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/YqKB2R2iPnnZgei3xjQd_FK1A6141.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
830	Grass-fed Beef Shank (Frozen)	100% Grass-fed and Finished Cross Cut (Osso Buco) Beef Shank PRATHER RANCH MEAT CO is proud to introduce Lost Coast Grass-Fed Beef into its repertoire of high quality, sustainably and humanely raised meat offerings.Lost Coast Grassfed beeves are raised on the lush grass pastures of Humbolt County they are 100% grassfed and finished, and are never treated with hormones or antibiotics.	1.75	lb	17.49	9.99	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/hd4NvVEST4WoNTtmfdPx_FK1A4468.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
831	Cross Rib Roast	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. Perfect for roast beef- rub with salt and herbs, leave overnight, and roast to perfect medium rare and slice thin."Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	2.75	lb	27.49	10.0	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/4MpYTtaeQ4GccDpe3Vk7_FK1A4691.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	258	\N	\N	\N
833	Chuck Roast	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. Pot roast anyone? A great low-and-slow roast for these short winter days."Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	2.5	lb	28.29	11.32	lb	Meat	Beef	http://goodeggs2.imgix.net/product_photos/4e0Em9fCSpayL629mSrl_FK1A4409.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	258	\N	\N	\N
834	Short Ribs	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. Simmer\nthese nuggets of flavor low and slow for a minimum three hours and you will\ndiscover a whole world of falling-off-the-bone wonder. For best results, simmer\nin a 50/50 mixture of stock and (cheap) red wine; throw in large chunks of\nonion, carrot, celery, salt and whole black peppercorns for extra oomph! Strain\nbroth before serving."Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	1.75	lb	19.19	10.97	lb	Meat	Beef	http://goodeggs1.imgix.net/product_photos/Voz09WwsSHqmsWnfjuFI_FK1A6164.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	360	\N	\N	\N
835	Pasture Raised Ground Pork	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. Ground pork- perfect for meatballs, meatloaf, potstickers, wontons, pasta sauce, and on and on...	1	lb	5.99	5.99	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/gVayrCaQfynKa8txTvqe_FK1A7934.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
836	Pork Stew Meat (Frozen)	Cubes of pork stew meat, all cut up and ready to go in your chili, carnitas, chile verde, pork goulash, etc. A great ingredient to have on hand when you get the hankering for a slow cooker meal!Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	1	lb	9.29	9.29	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/OuyBMwFqSrWZNK4JC61p_20160513-LlanoSeco_PorkStew_MG_9507.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
837	Pasture Raised Ground Pork (Frozen)	Ground Pork from pasture raised pigs!Pasture raised Berkshire cross hogs from the Capay Valley.	1	lb	9.99	9.99	lb	Meat	Pork	http://goodeggs1.imgix.net/product_photos/m3bqQ2QiSgmxiB419XL6_Pork_Ground_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
838	Ground Pork (Frozen)	Our Ground Pork is the perfect ration of fat to lean meat, blended from the most flavorful cuts of the animal. It can be transformed into many dishes: spiced breakfast patties, tacos, ragù, or your very own homemade sausages. Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	1	lb	8.99	8.99	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/rNhbGJibRhq8MX99SRVw_FK1A2932.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
844	Pasture Raised Pork Sirloin Chop	Walnut Keep Farms Pork- from Sonoma County Meat Company\nGrill,\npan-sear or broil until that golden brown crust comes forth and blows away all\nmemories of pork chops so dry you could shingle a house. Paired with apple\nsauce, collard greens, or mashed potatoes, this chop is above and beyond the\nusual. \n\nHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined.	0.75	lb	6.79	9.05	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/ZiHVVaPDTxmHuaFFptCp_FK1A7814.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
845	Bone-In Pork Chops (Frozen)	This pork chop is tender and flavorful, the "other red meat" as we like to say. Whether its put on the grill, the skillet, or in the oven, you're in for a treat. Our pork's fat is supple and full of just as much, if not more, flavor than the meat...be sure not to cut it off before cooking! Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	1.5	lb	19.19	12.79	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/SGrrcmmQki7JIfXxDByX_chop.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
846	Bone-in Pork Chop (Frozen)	These beautiful pork chops are bone-in and cut 1 1/4" thick.Our sows are Yorkshires crossed on either a Duroc or Berkshire boar. The\n sows are pastured along with their piglets until the piglets are \nweaned. The weaned piglets are then finished with whole milk, whole \ngrain breads, brewers grain, and tortillas, producing what we believe to\n be a superior product.  Great for grilling anytime of the year.  We suggest medium high heat, 4-5 minutes per side and another 4-5 minutes tilted up on the bone.	1	lb	10.49	10.49	lb	Meat	Pork	http://goodeggs1.imgix.net/product_photos/pRdcDnvSfecXnzLzEjef_Z1JZxpvES8QNR37h0Mmi9-E9Wcy2Xi70IASWLRnNfR4.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
847	Pasture Raised Pork Sirloin Chop	Walnut Keep Farms Pork- from Sonoma County Meat Company\nGrill,\npan-sear or broil until that golden brown crust comes forth and blows away all\nmemories of pork chops so dry you could shingle a house. Paired with apple\nsauce, collard greens, or mashed potatoes, this chop is above and beyond the\nusual. \n\nHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined.	1	lb	8.99	8.99	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/ZiHVVaPDTxmHuaFFptCp_FK1A7814.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
848	Pasture Raised Pork Loin Chop	Pasture Raised Pork Loin Chops- from Simas Swine and Wine in the Capay Valley.Pasture raised Berkshire cross hogs from the Capay Valley.	1.5	lb	16.49	10.99	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/1ub7CHROyFAj4yJjasQv_ith9SFFVRxadmj9pl7YE_FK1A6986.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
849	City Ham	This version of Smoking Goose's City Ham is made exclusively for Good Eggs! This city ham comes from Gunthorp Farms, which is in the 407 tier of Smoking Goose's sourcing. The most popular variety of this versatile meat. Smoking Goose's City Hams are wet-cured with a brine made of salt, sugar, clover, juniper, bay, and garlic. This brine lends the meat a mild, juicy flavor. Then the ham is hickory smoked for more depth. All Smoking Goose recipes begin on the farm. They carefully curate farm sources based on research, site visits, flavor, and personal relationships with farmers. The base requirements for all Smoking Goose farm sources: Small Family Owned Farm, No factory Farms, No Gestation Pens,  Antibiotic Free, 100% Vegetarian Feed, No Growth Promotants, Humanely Slaughtered. Source codes printed in the bottom right corner of each smoking goose package. To find out more about the farm please visit their Raw Resource Sheet. Ingredients: pork, clove, juniper, bay, garlic, hickory smoked	12	oz	16.99	22.65	lb	Meat	Pork	http://goodeggs1.imgix.net/product_photos/9aQoXik0Ss5ktHnFAN8A_20160415-SmokingGoose_CityHam_MG_6971.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	221	\N	\N	\N
850	Smoked Tasso Ham	By following the Cajun tradition this "ham" is cut from the pork shoulder rather than the hind legs. The rich dense meat is heavily spiced with white pepper, allspice, chilies, and marjoram before hanging in the smokehouse for a thick lick of smoke from the smoldering pecan wood. Traditionally used in cajun cooking adding depth to gumbo, jambalaya and dirty rice but can be used in other styles of cooking too. Add a bit of chopped tasso to creamy dips and fondues for a peppery bite and rich texture. Or add to eggs, greens, soups, or use it as the perfect accompaniment to briny shellfish.All Smoking Goose recipes begin on the farm. They carefully curate farm sources based on research, site visits, flavor, and personal relationships with farmers. The base requirements for all Smoking Goose farm sources: Small Family Owned Farm, No factory Farms, No Gestation Pens,  Antibiotic Free, 100% Vegetarian Feed, No Growth Promotants, Humanely Slaughtered. Source codes printed in the bottom right corner of each smoking goose package. To find out more about the farm please visit their Raw Resource Sheet. This item is stored frozen. Please use within 30 days of defrosting.Ingredients: smoked pork flat iron, cayenne, marjoram	8	oz	10.19	20.38	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/vabu0EFrQ1SdWXzs1xqS_20160415-SmokingGooseGuanciale_MG_6987.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	221	\N	\N	\N
851	Mini Ham (Frozen)	Llano Seco Meats transforms our pork and beef into artisanal salted and smoked products. Harkening back to a time when butchery was a craft and home food preservation was the norm, Llano Seco Products honor the traditions of the historic European and American kitchens of our ancestors. Our line of handcrafted value-added products compliment our primal and sub-primal pork and beef cuts, and alchemizes the deep flavor of our meat into ready-to-eat products. Smoked, salted, spiced, and uncured, meaning no nitrates or nitrates added, just pure meaty goodness.Ingredients: Llano Seco pork, sea salt, sugar, celery powder, cherry powder, sodium carbonate, and flavorings.	1.25	lb	12.49	9.99	lb	Meat	Pork	http://goodeggs1.imgix.net/product_photos/yDFhxOuRJW4JArExag8b_FK1A7587.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	221	\N	\N	\N
867	Boneless Pork Shoulder Roast (Frozen)	These were for made low and slow.  Carnitas anyone?  Pulled Pork Sandwich?  You've found what you've been looking for.Our sows are Yorkshires crossed on either a Duroc or Berkshire boar. The\n sows are pastured along with their piglets until the piglets are \nweaned. The weaned piglets are then finished with whole milk, whole \ngrain breads, brewers grain, and tortillas, producing what we believe to\n be a superior product.	2	lb	15.99	8.0	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/tmfkgzfT8WpuSr56L8FS_wmrB-fkhmvSXr9sTxFB1EkVQ0wItnaDKZ5qu7PIcmeE.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
853	Smoked Tasso Ham	By following the Cajun tradition this "ham" is cut from the pork shoulder rather than the hind legs. The rich dense meat is heavily spiced with white pepper, allspice, chilies, and marjoram before hanging in the smokehouse for a thick lick of smoke from the smoldering pecan wood. Traditionally used in cajun cooking adding depth to gumbo, jambalaya and dirty rice but can be used in other styles of cooking too. Add a bit of chopped tasso to creamy dips and fondues for rich, peppery bite and pleasing texture. Or add to eggs, greens, soups, or use it as the perfect accompaniment to briny shellfish.All Smoking Goose recipes begin on the farm. They carefully curate farm sources based on research, site visits, flavor, and personal relationships with farmers. THe base requirements for all Smoking Goose farm sources: Small Family Owned Farm, No factory Farms, No Gestation Pens,  Antibiotic Free, 100% Vegetarian Feed, No Growth Promotants, Humanely Slaughtered. Source codes printed in the bottom right corner of each smoking goose package. To find out more about the farm please visit their Raw Resource Sheet. This item is stored frozen. Please use within 30 days of defrosting.Ingredients: smoked pork flat iron, cayenne, marjoram	4	oz	5.29	21.16	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/vabu0EFrQ1SdWXzs1xqS_20160415-SmokingGooseGuanciale_MG_6987.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	221	\N	\N	\N
854	Smoked Tasso Ham	By following the Cajun tradition this "ham" is cut from the pork shoulder rather than the hind legs. The rich dense meat is heavily spiced with white pepper, allspice, chilies, and marjoram before hanging in the smokehouse for a thick lick of smoke from the smoldering pecan wood. Traditionally used in cajun cooking adding depth to gumbo, jambalaya and dirty rice but can be used in other styles of cooking too. Add a bit of chopped tasso to creamy dips and fondues for rich, peppery bite and pleasing texture. Or add to eggs, greens, soups, or use it as the perfect accompaniment to briny shellfish.All Smoking Goose recipes begin on the farm. They carefully curate farm sources based on research, site visits, flavor, and personal relationships with farmers. THe base requirements for all Smoking Goose farm sources: Small Family Owned Farm, No factory Farms, No Gestation Pens,  Antibiotic Free, 100% Vegetarian Feed, No Growth Promotants, Humanely Slaughtered. Source codes printed in the bottom right corner of each smoking goose package. To find out more about the farm please visit their Raw Resource Sheet. This item is stored frozen. Please use within 30 days of defrosting.Ingredients: smoked pork flat iron, cayenne, marjoram	12	oz	15.49	20.65	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/vabu0EFrQ1SdWXzs1xqS_20160415-SmokingGooseGuanciale_MG_6987.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	221	\N	\N	\N
855	Sliced Smoked Ham (Frozen)	Ingredients: Pork Legs, Water, Salt, Sugar, and Celery Baste Aid (sea salt, evaporated cane syrup and celery powder).A well balanced, slightly sweet, slightly smoky ham, perfect for sandwiches.Pasture raised Berkshire cross hogs from the Capay Valley.At Simas Swine and Wine we raise pork the old fashion way.  They enjoy an open air environment with 10 acres to roam around on; some pasture, some open lot.  They have shelter to get out of the rain and cold, or sun in the summer.  In the heat of summer we employ a mister system as well as mud wallows to keep them cool.  Piglets are allowed to stay with their mom for at least 5 weeks compared to 3 in a typical system.  They eat a commercially prepared ration with added luxuries in the summer and fall of culled peaches, melons and winter squash.	0.8	lb	10.99	13.74	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/pOiYnqmQZSUlt1btPZIF_FK1A9119.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	221	\N	\N	\N
856	Sliced Smoked Ham (Frozen)	Ingredients: Pork Legs, Water, Salt, Sugar, and Celery Baste Aid (sea salt, evaporated cane syrup and celery powder).A well balanced, slightly sweet, slightly smoky ham, perfect for sandwiches.Pasture raised Berkshire cross hogs from the Capay Valley.At Simas Swine and Wine we raise pork the old fashion way.  They enjoy an open air environment with 10 acres to roam around on; some pasture, some open lot.  They have shelter to get out of the rain and cold, or sun in the summer.  In the heat of summer we employ a mister system as well as mud wallows to keep them cool.  Piglets are allowed to stay with their mom for at least 5 weeks compared to 3 in a typical system.  They eat a commercially prepared ration with added luxuries in the summer and fall of culled peaches, melons and winter squash.	0.9	lb	12.49	13.88	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/pOiYnqmQZSUlt1btPZIF_FK1A9119.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	221	\N	\N	\N
857	Sliced Smoked Ham (Frozen)	Ingredients: Pork Legs, Water, Salt, Sugar, and Celery Baste Aid (sea salt, evaporated cane syrup and celery powder).A well balanced, slightly sweet, slightly smoky ham, perfect for sandwiches.Pasture raised Berkshire cross hogs from the Capay Valley.At Simas Swine and Wine we raise pork the old fashion way.  They enjoy an open air environment with 10 acres to roam around on; some pasture, some open lot.  They have shelter to get out of the rain and cold, or sun in the summer.  In the heat of summer we employ a mister system as well as mud wallows to keep them cool.  Piglets are allowed to stay with their mom for at least 5 weeks compared to 3 in a typical system.  They eat a commercially prepared ration with added luxuries in the summer and fall of culled peaches, melons and winter squash.	1	lb	13.99	13.99	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/pOiYnqmQZSUlt1btPZIF_FK1A9119.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	221	\N	\N	\N
858	Spare Ribs (Frozen)	Anytime of the year these will be a hit.  Our spare ribs are tender and juicy with so many ways to prepare them: we like to dry rub with a mix of salt, cayenne, sugar and fennel, or leave overnight with oil, citrus and fresh herbs.  Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	3.5	lb	20.99	6.0	lb	Meat	Pork	http://goodeggs1.imgix.net/product_photos/dIDSDbWHR4SLJfEExrp9_spare%20rib.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	360	\N	\N	\N
911	Southwestern Chicken Sausage (Frozen)	Ingredients: Hormone free boneless skinless chicken thighs, green chilies, cilantro, garlic, spice blend (no nitrates or preservatives). Pork casing, spicy! Suggested cooking instructions: Add  approx.1/4 inch of water to a skillet or shallow sauce pan, place sausages in covered pan and bring to a boil. Steam for approximately 5 minutes, pour off excess water. Add small amount of oil or butter, lower heat and cook until skins are brown. Enjoy!Excellent grilled as well!	1	lb	10.99	10.99	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/9rijQrChQkSNdV1uNtlz_wMaxkB4s40VWe2XXtRq0wPuXIUluix1RBNd7e91Es3E.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
859	Porchetta Holiday Box (Frozen)	Roli Roti's festive Porchetta Holiday Box includes one beautifully hand-rolled and tied free-range heritage pork loin, stuffed with spices and ready to go, as well as a side of Roli Roti's savory onion marmalade and a container of rosemary salt for extra seasoning. An amazing alternative to roasting a bird, a Porchetta is incredibly easy to roast, carve, and enjoy—not to mention a photo-worthy centerpiece. Cooking instructions are included in the box! Serves 8-10 people.Ingredients: porchetta: pork, spice rub (salt, garlic, lemon juice & zest, white wine, black pepper, rosemary, sage, bay leaf, marjoram). onion marmalade: onion, fennel spice (salt, fennel, coriander), balsamic vinegar. rosemary salt: sea salt, rosemary. 	7.5	lb	104.99	14.0	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/ZfEynwAER0u4GhoGe15J_20161029-RoliRoti_PorchettaBox_MG_5725.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	303	\N	\N	\N
860	Bone-In Shoulder Roast (Frozen)	Bone-In Pork Shoulder (Butt) Roast- from Rancho Llano Seco, Chico CA Our pigs are a cross of Duroc and Yorkshire \nbreeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of\n which are grown on the Rancho. Pigs are raised in deep-bedded hoop \nbarns with continual access to large open air pastures with plenty of \nsunshine and a great view of the California Buttes. All animals are \nconfinement-free for 100% of their lives, humanely treated with best \npractices certified by Global Animal Partnership. Our pigs are never fed\n antibiotics or growth hormones. Llano Seco Pork is the culmination of \nour mission to provide a variety of products while caring for the \npeople, the animals and the land. We pride ourselves in our holistic \napproach to ranching.	2.5	lb	23.49	9.4	lb	Meat	Pork	http://goodeggs1.imgix.net/product_photos/4drumGrITUOSOmQJbkIm_FK1A2923.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	258	\N	\N	\N
861	Pork Tenderloin (Frozen)	Roast this baby in your oven slow and low and surround with your favorite vegetables to caramelize. Make a salsa verde of fresh parsley, mint, arugula and the like, with garlic, lemon juice and olive oil to garnish your lovely loin roast. Slice thin and wow your drooling dinner guests. Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	0.75	lb	14.99	19.99	lb	Meat	Pork	http://goodeggs1.imgix.net/product_photos/QE3j1zoQTyGpcyvmERqX_uJ4TVbCJQuKZ5SDxAYSY_8gmO20za25aZWwqKLqxGYn-3RkvR3F7860NKJL8NABk.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
862	Bone-In Shoulder Roast (Frozen)	Bone-In Pork Shoulder (Butt) Roast- from Rancho Llano Seco, Chico CA Our pigs are a cross of Duroc and Yorkshire \nbreeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of\n which are grown on the Rancho. Pigs are raised in deep-bedded hoop \nbarns with continual access to large open air pastures with plenty of \nsunshine and a great view of the California Buttes. All animals are \nconfinement-free for 100% of their lives, humanely treated with best \npractices certified by Global Animal Partnership. Our pigs are never fed\n antibiotics or growth hormones. Llano Seco Pork is the culmination of \nour mission to provide a variety of products while caring for the \npeople, the animals and the land. We pride ourselves in our holistic \napproach to ranching.	2.75	lb	25.99	9.45	lb	Meat	Pork	http://goodeggs1.imgix.net/product_photos/4drumGrITUOSOmQJbkIm_FK1A2923.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	258	\N	\N	\N
863	Pasture Raised Pork Loin Roast (Frozen)	Bone-In Loin Roast (basically some pork loin chops that haven't been cut apart yet)- brine, sear, finish in the oven for a simple showstopper of a meal.Pasture raised Berkshire-cross hogs from the Capay Valley.At Simas Swine and Wine we raise pork the old fashion way.  They enjoy an open air environment with 10 acres to roam around on; some pasture, some open lot.  They have shelter to get out of the rain and cold, or sun in the summer.  In the heat of summer we employ a mister system as well as mud wallows to keep them cool.  Piglets are allowed to stay with their mom for at least 5 weeks compared to 3 in a typical system.  They eat a commercially prepared ration with added luxuries in the summer and fall of culled peaches, melons and winter squash.	2	lb	29.99	15.0	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/2yI2RHCSaKt2HA1nkVfZ_FK1A3194.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
864	Pasture Raised St. Louis Style Pork Ribs	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. The perfect cut for smoking on the grill, but great in the oven or slow cooker too!	3.5	lb	31.49	9.0	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/LjNojFIT7xWimZCASUxg_FK1A2380.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	360	\N	\N	\N
865	Spare Ribs (Frozen)	Anytime of the year these will be a hit.  Our spare ribs are tender and juicy with so many ways to prepare them: we like to dry rub with a mix of salt, cayenne, sugar and fennel, or leave overnight with oil, citrus and fresh herbs.  Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	4	lb	23.99	6.0	lb	Meat	Pork	http://goodeggs1.imgix.net/product_photos/dIDSDbWHR4SLJfEExrp9_spare%20rib.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	360	\N	\N	\N
866	Boneless Pork Shoulder Roast (Frozen)	These were for made low and slow.  Carnitas anyone?  Pulled Pork Sandwich?  You've found what you've been looking for.Our sows are Yorkshires crossed on either a Duroc or Berkshire boar. The\n sows are pastured along with their piglets until the piglets are \nweaned. The weaned piglets are then finished with whole milk, whole \ngrain breads, brewers grain, and tortillas, producing what we believe to\n be a superior product.	1.5	lb	11.99	7.99	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/tmfkgzfT8WpuSr56L8FS_wmrB-fkhmvSXr9sTxFB1EkVQ0wItnaDKZ5qu7PIcmeE.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
868	Bone-In Shoulder Roast (Frozen)	Bone-In Pork Shoulder (Butt) Roast- from Rancho Llano Seco, Chico CA Our pigs are a cross of Duroc and Yorkshire \nbreeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of\n which are grown on the Rancho. Pigs are raised in deep-bedded hoop \nbarns with continual access to large open air pastures with plenty of \nsunshine and a great view of the California Buttes. All animals are \nconfinement-free for 100% of their lives, humanely treated with best \npractices certified by Global Animal Partnership. Our pigs are never fed\n antibiotics or growth hormones. Llano Seco Pork is the culmination of \nour mission to provide a variety of products while caring for the \npeople, the animals and the land. We pride ourselves in our holistic \napproach to ranching.	2	lb	18.99	9.49	lb	Meat	Pork	http://goodeggs1.imgix.net/product_photos/4drumGrITUOSOmQJbkIm_FK1A2923.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	258	\N	\N	\N
869	Boneless Pork Shoulder Roast (Frozen)	These were for made low and slow.  Carnitas anyone?  Pulled Pork Sandwich?  You've found what you've been looking for.Our sows are Yorkshires crossed on either a Duroc or Berkshire boar. The\n sows are pastured along with their piglets until the piglets are \nweaned. The weaned piglets are then finished with whole milk, whole \ngrain breads, brewers grain, and tortillas, producing what we believe to\n be a superior product.	2.25	lb	17.99	8.0	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/tmfkgzfT8WpuSr56L8FS_wmrB-fkhmvSXr9sTxFB1EkVQ0wItnaDKZ5qu7PIcmeE.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
870	Pasture Raised Pork Shank (Frozen)	Walnut Keep Farms Pasture Raised PorkPork Shank Roast\n\nHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined.	2.25	lb	19.99	8.88	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/6mSOWZVQJaCqjIMBWiXy_20160505-SonomaMeatCo_PorkShank_MG_8952.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
871	Bone-In Shoulder Roast (Frozen)	Bone-In Pork Shoulder (Butt) Roast- from Rancho Llano Seco, Chico CA Our pigs are a cross of Duroc and Yorkshire \nbreeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of\n which are grown on the Rancho. Pigs are raised in deep-bedded hoop \nbarns with continual access to large open air pastures with plenty of \nsunshine and a great view of the California Buttes. All animals are \nconfinement-free for 100% of their lives, humanely treated with best \npractices certified by Global Animal Partnership. Our pigs are never fed\n antibiotics or growth hormones. Llano Seco Pork is the culmination of \nour mission to provide a variety of products while caring for the \npeople, the animals and the land. We pride ourselves in our holistic \napproach to ranching.	2.25	lb	20.99	9.33	lb	Meat	Pork	http://goodeggs1.imgix.net/product_photos/4drumGrITUOSOmQJbkIm_FK1A2923.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	258	\N	\N	\N
872	Pasture Raised Pork Shank (Frozen)	Walnut Keep Farms Pasture Raised PorkPork Shank Roast\n\nHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined.	2.5	lb	22.49	9.0	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/6mSOWZVQJaCqjIMBWiXy_20160505-SonomaMeatCo_PorkShank_MG_8952.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
873	Bone-In Shoulder Roast (Frozen)	Bone-In Pork Shoulder (Butt) Roast- from Rancho Llano Seco, Chico CA Our pigs are a cross of Duroc and Yorkshire \nbreeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of\n which are grown on the Rancho. Pigs are raised in deep-bedded hoop \nbarns with continual access to large open air pastures with plenty of \nsunshine and a great view of the California Buttes. All animals are \nconfinement-free for 100% of their lives, humanely treated with best \npractices certified by Global Animal Partnership. Our pigs are never fed\n antibiotics or growth hormones. Llano Seco Pork is the culmination of \nour mission to provide a variety of products while caring for the \npeople, the animals and the land. We pride ourselves in our holistic \napproach to ranching.	3	lb	28.49	9.5	lb	Meat	Pork	http://goodeggs1.imgix.net/product_photos/4drumGrITUOSOmQJbkIm_FK1A2923.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	258	\N	\N	\N
874	Porchetta Holiday Box (Frozen)	Roli Roti's festive Porchetta Holiday Box includes one beautifully hand-rolled and tied free-range heritage pork loin, stuffed with spices and ready to go, as well as a side of Roli Roti's savory onion marmalade and a container of rosemary salt for extra seasoning. An amazing alternative to roasting a bird, a Porchetta is incredibly easy to roast, carve, and enjoy—not to mention a photo-worthy centerpiece. Cooking instructions are included in the box! Serves 8-10 people.Ingredients: porchetta: pork, spice rub (salt, garlic, lemon juice & zest, white wine, black pepper, rosemary, sage, bay leaf, marjoram). onion marmalade: onion, fennel spice (salt, fennel, coriander), balsamic vinegar. rosemary salt: sea salt, rosemary. 	7	lb	97.99	14.0	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/ZfEynwAER0u4GhoGe15J_20161029-RoliRoti_PorchettaBox_MG_5725.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	303	\N	\N	\N
875	Pasture Raised Pork Belly	Walnut Keep Farms Pork- from Sonoma County Meat CompanyYour\nfavorite ramen would not be the same without those succulent slices of pork\nbelly; fresh and ready for anything you can imagine, this cut is for the cook\nwho wants that extra edge. Flavor is first with this pork, so if you are\nlooking for a good base to your new bacon recipe, or if you are just dipping\nyour toes into the DIY bacon universe, this is the product for you!\n\nHeritage breed pigs are pasture-raised in Suisun Valley and finished on \nwalnuts, giving the fat a rich, creamy texture. Never given antibiotics \nor growth hormones, and never confined.	1.75	lb	13.99	7.99	lb	Meat	Pork	http://goodeggs2.imgix.net/product_photos/tiLV5bjXRdOzxeb3CRl0_FK1A7922.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
876	Grassfed Ground Lamb (Frozen)	Anderson Ranches raises their grass fed lamb for longer periods of time, providing higher quality meat. The lamb is never given antibiotics or hormones. The ranch maintains a low carbon footprint by having the lamb processed at their own facility- which also provides minimal stress for the animals. Humane Certified Raised and Handled.	1	lb	12.99	12.99	lb	Meat	Lamb	http://goodeggs1.imgix.net/product_photos/kKRhIP3PRjBWrxX2Mtg4_9d3nU8dfQpiRydBRlMbA_cnSSrTQVq0OXkPWrKSkQ_J7KkwAKgSTqcDwlrtwjq_FK1A7449.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
912	Apple Bacon Sausage (Frozen)	This is PRMC’s famous breakfast sausage. Made with our own\nmaple bacon, apples and organic spices these links are the perfect combination\nof sweet and smoky for your family’s breakfast table. These links arrive fully\ncooked, so just defrost and heat! Be careful though—they’re truly addicting!Ingredients: Pork (Food Alliance Certified), Water, Uncured\nMaple Bacon (Pork, Water, Organic Evaporated Cane Syrup, Sea Salt, Organic\nMaple Syrup, Cultured Celery Juice) Unsulfured Evaporated Apples, Apple Juice\nConcentrate, Sea Salt, Organic Spices, in Natural Pork Casing	0.75	lb	7.49	9.99	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/F2ltLZdJRwumdL7iKzzf_FK1A0924.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
877	Lamb Stew	Williams Ranches Lamb- from Sonoma County Meat CompanyRaised by the Williams family in the coastal hills of Sonoma County, sheep graze among the abundant wildlife protected by five Great Pyrenees livestock guardian dogs. The Pyrenees guard the sheep from natural predators allowing both to live in harmony with the land.Williams Ranches grows the highest quality lamb, fed on grass, clover and alfalfa with no hormones or antibiotic supplements. The Williams hand select each lamb, determining processing time by the amount of fat cover. This ensures a quality, consistent product that is available year round and lambs that are processed between 5 and 8 months old. This process means you will get a leaner, milder lamb that simply melts in your mouth.Tender, mild, California lamb- stew meat ready for the slow cooker or tagine, or a ragu, or chili, or whatever else you fancy.	1	lb	13.99	13.99	lb	Meat	Lamb	http://goodeggs2.imgix.net/product_photos/SQyr1yw5RpScWpWAKzA9_FK1A3949.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
878	Lamb Rib Chops	Williams Ranches Lamb- from Sonoma County Meat CompanyRaised by the Williams family in the coastal hills of Sonoma County, sheep graze among the abundant wildlife protected by five Great Pyrenees livestock guardian dogs. The Pyrenees guard the sheep from natural predators allowing both to live in harmony with the land.Williams Ranches grows the highest quality lamb, fed on grass, clover and alfalfa with no hormones or antibiotic supplements. The Williams hand select each lamb, determining processing time by the amount of fat cover. This ensures a quality, consistent product that is available year round and lambs that are processed between 5 and 8 months old. This process means you will get a leaner, milder lamb that simply melts in your mouth.Tender, mild, California lamb- elegant little rib chops with long bones attached make an awesome presentation for a special meal.	0.5	lb	8.99	17.98	lb	Meat	Lamb	http://goodeggs1.imgix.net/product_photos/q7qTUWoITij51dWm1kih_FK1A4008.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
879	Boneless Lamb Leg Roast	Williams Ranches Lamb- from Sonoma County Meat CompanyRaised by the Williams family in the coastal hills of Sonoma County, sheep graze among the abundant wildlife protected by five Great Pyrenees livestock guardian dogs. The Pyrenees guard the sheep from natural predators allowing both to live in harmony with the land.Williams Ranches grows the highest quality lamb, fed on grass, clover and alfalfa with no hormones or antibiotic supplements. The Williams hand select each lamb, determining processing time by the amount of fat cover. This ensures a quality, consistent product that is available year round and lambs that are processed between 5 and 8 months old. This process means you will get a leaner, milder lamb that simply melts in your mouth.Tender, mild, California lamb- this roast is all ready to go! Salt overnight, hit it with some garlic and herbs and roast to medium-rare. Maybe sprinkle some potatoes around the roasting pan, or some parsnips, or carrots...	3.75	lb	48.69	12.98	lb	Meat	Lamb	http://goodeggs2.imgix.net/product_photos/43dZXoITkahbjyrOU0Q5_FK1A3867.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
880	Lamb Neck Roast (Frozen)	Williams Ranches Lamb- from Sonoma County Meat CompanyWhole Lamb Neck Roast- maybe the greatest braising cut of meat, ever. Low and slow is the way go with this gem!Raised by the Williams family in the coastal hills of Sonoma County, sheep graze among the abundant wildlife protected by five Great Pyrenees livestock guardian dogs. The Pyrenees guard the sheep from natural predators allowing both to live in harmony with the land.Williams Ranches grows the highest quality lamb, fed on grass, clover and alfalfa with no hormones or antibiotic supplements. The Williams hand select each lamb, determining processing time by the amount of fat cover. This ensures a quality, consistent product that is available year round and lambs that are processed between 5 and 8 months old. This process means you will get a leaner, milder lamb that simply melts in your mouth.	1.75	lb	22.99	13.14	lb	Meat	Lamb	http://goodeggs2.imgix.net/product_photos/gou0SKxS3SbouyFzzuxj_20160526-SonomaMeatCo_LambNeck_MG_0303.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
881	Lamb Rib Chops	Williams Ranches Lamb- from Sonoma County Meat CompanyRaised by the Williams family in the coastal hills of Sonoma County, sheep graze among the abundant wildlife protected by five Great Pyrenees livestock guardian dogs. The Pyrenees guard the sheep from natural predators allowing both to live in harmony with the land.Williams Ranches grows the highest quality lamb, fed on grass, clover and alfalfa with no hormones or antibiotic supplements. The Williams hand select each lamb, determining processing time by the amount of fat cover. This ensures a quality, consistent product that is available year round and lambs that are processed between 5 and 8 months old. This process means you will get a leaner, milder lamb that simply melts in your mouth.Tender, mild, California lamb- elegant little rib chops with long bones attached make an awesome presentation for a special meal.	0.8	lb	14.39	17.99	lb	Meat	Lamb	http://goodeggs1.imgix.net/product_photos/q7qTUWoITij51dWm1kih_FK1A4008.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
882	Boneless Lamb Leg Roast (Frozen)	Williams Ranches Lamb- from Sonoma County Meat CompanyRaised by the Williams family in the coastal hills of Sonoma County, sheep graze among the abundant wildlife protected by five Great Pyrenees livestock guardian dogs. The Pyrenees guard the sheep from natural predators allowing both to live in harmony with the land.Williams Ranches grows the highest quality lamb, fed on grass, clover and alfalfa with no hormones or antibiotic supplements. The Williams hand select each lamb, determining processing time by the amount of fat cover. This ensures a quality, consistent product that is available year round and lambs that are processed between 5 and 8 months old. This process means you will get a leaner, milder lamb that simply melts in your mouth.Tender, mild, California lamb- this roast is all ready to go! Salt overnight, hit it with some garlic and herbs and roast to medium-rare. Maybe sprinkle some potatoes around the roasting pan, or some parsnips, or carrots...	4	lb	52.99	13.25	lb	Meat	Lamb	http://goodeggs2.imgix.net/product_photos/43dZXoITkahbjyrOU0Q5_FK1A3867.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
883	Lamb Neck Roast	Williams Ranches Lamb- from Sonoma County Meat CompanyWhole Lamb Neck Roast- maybe the greatest braising cut of meat, ever. Low and slow is the way go with this gem!Raised by the Williams family in the coastal hills of Sonoma County, sheep graze among the abundant wildlife protected by five Great Pyrenees livestock guardian dogs. The Pyrenees guard the sheep from natural predators allowing both to live in harmony with the land.Williams Ranches grows the highest quality lamb, fed on grass, clover and alfalfa with no hormones or antibiotic supplements. The Williams hand select each lamb, determining processing time by the amount of fat cover. This ensures a quality, consistent product that is available year round and lambs that are processed between 5 and 8 months old. This process means you will get a leaner, milder lamb that simply melts in your mouth.	2	lb	25.99	13.0	lb	Meat	Lamb	http://goodeggs2.imgix.net/product_photos/gou0SKxS3SbouyFzzuxj_20160526-SonomaMeatCo_LambNeck_MG_0303.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
884	Lamb Leg Steak	Williams Ranches Lamb- from Sonoma County Meat CompanyLamb leg steaks are super versatile, great grilled to medium rare, equally good baked,braised or in a curry!Raised by the Williams family in the coastal hills of Sonoma County, sheep graze among the abundant wildlife protected by five Great Pyrenees livestock guardian dogs. The Pyrenees guard the sheep from natural predators allowing both to live in harmony with the land.Williams Ranches grows the highest quality lamb, fed on grass, clover and alfalfa with no hormones or antibiotic supplements. The Williams hand select each lamb, determining processing time by the amount of fat cover. This ensures a quality, consistent product that is available year round and lambs that are processed between 5 and 8 months old. This process means you will get a leaner, milder lamb that simply melts in your mouth.Tender, mild, California lamb- melt in your mouth loin chops cook up quick for an easy, elegant meal.	0.7	lb	9.79	13.99	lb	Meat	Lamb	http://goodeggs2.imgix.net/product_photos/xHEMjCpJQvuZgKRGouFJ_FK1A6390.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
885	Lamb Leg Steak	Williams Ranches Lamb- from Sonoma County Meat CompanyLamb leg steaks are super versatile: great grilled to medium rare, baked, braised, or in a curry!Raised by the Williams family in the coastal hills of Sonoma County, sheep graze among the abundant wildlife protected by five Great Pyrenees livestock guardian dogs. The Pyrenees guard the sheep from natural predators allowing both to live in harmony with the land.Williams Ranches grows the highest quality lamb, fed on grass, clover and alfalfa with no hormones or antibiotic supplements. The Williams hand select each lamb, determining processing time by the amount of fat cover. This ensures a quality, consistent product that is available year round and lambs that are processed between 5 and 8 months old. This process means you will get a leaner, milder lamb that simply melts in your mouth.	0.8	lb	11.19	13.99	lb	Meat	Lamb	http://goodeggs2.imgix.net/product_photos/xHEMjCpJQvuZgKRGouFJ_FK1A6390.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
886	Pasture Raised Boneless Goat Leg Roast (Frozen)	Sonoma Hills Ranch Ground Goat- from Sonoma County Meat CompanyRoast or grill to medium rare, slice thin and serve on bed of arugula- or, this recipe from Mario Batali is a favorite of mine- BBQ'd Goat with Lemon Salad and Almond PestoFrom Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	2	lb	29.99	15.0	lb	Meat	Other Meats	http://goodeggs1.imgix.net/product_photos/1ItauvR8SVqXHwuCVpJd_20160426-SonomaCountyMeat_GoatLoin_MG_7921.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
887	Pasture Raised Goat Shoulder Chop (Frozen)	Sonoma Hills Ranch Ground Goat- from Sonoma County Meat CompanyEqually suited to a hot grill or a low oven braise, goat shoulder chops can be treated the same way you would a lamb shoulder chop with the exception that goat is a bit leaner, so be careful not to over do it if using high heat.From Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	0.5	lb	7.49	14.98	lb	Meat	Other Meats	http://goodeggs1.imgix.net/product_photos/6134pWXsSMmakUfMnRPo_20160426-SonomaCountyMeat_GoatShoulder_MG_7933.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
888	Pasture Raised Goat Shank (Frozen)	Sonoma Hills Ranch Ground Goat- from Sonoma County Meat CompanyA slow and low braise in the oven or on the stove top is the way to go with this flavorful cut. Cover your braise directly with a sheet of parchment paper to keep the top layer from drying out ( a tip gleaned from observing the Good Eggs chefs prepping lunch).From Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	0.8	lb	11.99	14.99	lb	Meat	Other Meats	http://goodeggs2.imgix.net/product_photos/uQnpQLuLQYqDYeYn56tp_20160426-SonomaCountyMeat_GoatShank_MG_7952.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
889	Pasture Raised Goat Shoulder Chop (Frozen)	Sonoma Hills Ranch Ground Goat- from Sonoma County Meat CompanyEqually suited to a hot grill or a low oven braise, goat shoulder chops can be treated the same way you would a lamb shoulder chop with the exception that goat is a bit leaner, so be careful not to over do it if using high heat.From Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	0.3	lb	4.49	14.97	lb	Meat	Other Meats	http://goodeggs1.imgix.net/product_photos/6134pWXsSMmakUfMnRPo_20160426-SonomaCountyMeat_GoatShoulder_MG_7933.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
890	Pasture Raised Boneless Goat Leg Roast (Frozen)	Sonoma Hills Ranch Ground Goat- from Sonoma County Meat CompanyRoast or grill to medium rare, slice thin and serve on bed of arugula- or, this recipe from Mario Batali is a favorite of mine- BBQ'd Goat with Lemon Salad and Almond PestoFrom Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	2.25	lb	33.49	14.88	lb	Meat	Other Meats	http://goodeggs1.imgix.net/product_photos/1ItauvR8SVqXHwuCVpJd_20160426-SonomaCountyMeat_GoatLoin_MG_7921.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
891	Pasture Raised Goat Loin Chop (Frozen)	Sonoma Hills Ranch Goat Loin Chop- from Sonoma County Meat CompanyThese chops are perfect for a quick sear on the grill or in a pan- goat is awesome with Thai and Indian spices and stands up to spicy/sweet/sour marinades incredibly well.From Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	0.7	lb	16.79	23.99	lb	Meat	Other Meats	http://goodeggs2.imgix.net/product_photos/qPaVsWrkSz61kR8wJR96_20160426-SonomaCountyMeat_GoatLoinChops_MG_7908.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
892	Pasture Raised Goat Rib Chop (Frozen)	Sonoma Hills Ranch Goat Rib Chop- from Sonoma County Meat CompanyThese chops are perfect for a quick sear on the grill or in a pan- goat is awesome with Thai and Indian spices and stands up to spicy/sweet/sour marinades incredibly well.From Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	0.2	lb	3.99	19.95	lb	Meat	Other Meats	http://goodeggs1.imgix.net/product_photos/LendiFwqRkaI4CEQi3ny_20160426-SonomaCountyMeat_GoatRibChops_MG_7929.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
893	Pasture Raised Goat Rib Chop (Frozen)	Sonoma Hills Ranch Goat Rib Chop- from Sonoma County Meat CompanyThese chops are perfect for a quick sear on the grill or in a pan- goat is awesome with Thai and Indian spices and stands up to spicy/sweet/sour marinades incredibly well.From Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	0.3	lb	5.99	19.97	lb	Meat	Other Meats	http://goodeggs1.imgix.net/product_photos/LendiFwqRkaI4CEQi3ny_20160426-SonomaCountyMeat_GoatRibChops_MG_7929.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
894	Pasture Raised Goat Shoulder Chop (Frozen)	Sonoma Hills Ranch Ground Goat- from Sonoma County Meat CompanyEqually suited to a hot grill or a low oven braise, goat shoulder chops can be treated the same way you would a lamb shoulder chop with the exception that goat is a bit leaner, so be careful not to over do it if using high heat.From Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	0.4	lb	5.99	14.98	lb	Meat	Other Meats	http://goodeggs1.imgix.net/product_photos/6134pWXsSMmakUfMnRPo_20160426-SonomaCountyMeat_GoatShoulder_MG_7933.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
895	Pasture Raised Goat Rib Chop (Frozen)	Sonoma Hills Ranch Goat Rib Chop- from Sonoma County Meat CompanyThese chops are perfect for a quick sear on the grill or in a pan- goat is awesome with Thai and Indian spices and stands up to spicy/sweet/sour marinades incredibly well.From Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	0.4	lb	7.99	19.97	lb	Meat	Other Meats	http://goodeggs1.imgix.net/product_photos/LendiFwqRkaI4CEQi3ny_20160426-SonomaCountyMeat_GoatRibChops_MG_7929.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
896	Pasture Raised Goat Rib Chop (Frozen)	Sonoma Hills Ranch Goat Rib Chop- from Sonoma County Meat CompanyThese chops are perfect for a quick sear on the grill or in a pan- goat is awesome with Thai and Indian spices and stands up to spicy/sweet/sour marinades incredibly well.From Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	0.5	lb	9.99	19.98	lb	Meat	Other Meats	http://goodeggs1.imgix.net/product_photos/LendiFwqRkaI4CEQi3ny_20160426-SonomaCountyMeat_GoatRibChops_MG_7929.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
897	Pasture Raised Goat Shank (Frozen)	Sonoma Hills Ranch Ground Goat- from Sonoma County Meat CompanyA slow and low braise in the oven or on the stove top is the way to go with this flavorful cut. Cover your braise directly with a sheet of parchment paper to keep the top layer from drying out ( a tip gleaned from observing the Good Eggs chefs prepping lunch).From Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	0.6	lb	8.99	14.98	lb	Meat	Other Meats	http://goodeggs2.imgix.net/product_photos/uQnpQLuLQYqDYeYn56tp_20160426-SonomaCountyMeat_GoatShank_MG_7952.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
898	Pasture Raised Goat Rib Chop (Frozen)	Sonoma Hills Ranch Goat Rib Chop- from Sonoma County Meat CompanyThese chops are perfect for a quick sear on the grill or in a pan- goat is awesome with Thai and Indian spices and stands up to spicy/sweet/sour marinades incredibly well.From Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	0.6	lb	11.99	19.98	lb	Meat	Other Meats	http://goodeggs1.imgix.net/product_photos/LendiFwqRkaI4CEQi3ny_20160426-SonomaCountyMeat_GoatRibChops_MG_7929.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
899	Pasture Raised Goat Loin Chop (Frozen)	Sonoma Hills Ranch Goat Loin Chop- from Sonoma County Meat CompanyThese chops are perfect for a quick sear on the grill or in a pan- goat is awesome with Thai and Indian spices and stands up to spicy/sweet/sour marinades incredibly well.From Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	0.6	lb	14.39	23.98	lb	Meat	Other Meats	http://goodeggs2.imgix.net/product_photos/qPaVsWrkSz61kR8wJR96_20160426-SonomaCountyMeat_GoatLoinChops_MG_7908.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
900	Pasture Raised Goat Shank (Frozen)	Sonoma Hills Ranch Ground Goat- from Sonoma County Meat CompanyA slow and low braise in the oven or on the stove top is the way to go with this flavorful cut. Cover your braise directly with a sheet of parchment paper to keep the top layer from drying out ( a tip gleaned from observing the Good Eggs chefs prepping lunch).From Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	0.7	lb	10.49	14.99	lb	Meat	Other Meats	http://goodeggs2.imgix.net/product_photos/uQnpQLuLQYqDYeYn56tp_20160426-SonomaCountyMeat_GoatShank_MG_7952.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
901	Pasture Raised Goat Shoulder Chop (Frozen)	Sonoma Hills Ranch Ground Goat- from Sonoma County Meat CompanyEqually suited to a hot grill or a low oven braise, goat shoulder chops can be treated the same way you would a lamb shoulder chop with the exception that goat is a bit leaner, so be careful not to over do it if using high heat.From Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	1	lb	14.99	14.99	lb	Meat	Other Meats	http://goodeggs1.imgix.net/product_photos/6134pWXsSMmakUfMnRPo_20160426-SonomaCountyMeat_GoatShoulder_MG_7933.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
902	Pasture Raised Goat Shoulder Chop (Frozen)	Sonoma Hills Ranch Ground Goat- from Sonoma County Meat CompanyEqually suited to a hot grill or a low oven braise, goat shoulder chops can be treated the same way you would a lamb shoulder chop with the exception that goat is a bit leaner, so be careful not to over do it if using high heat.From Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	1.25	lb	18.49	14.79	lb	Meat	Other Meats	http://goodeggs1.imgix.net/product_photos/6134pWXsSMmakUfMnRPo_20160426-SonomaCountyMeat_GoatShoulder_MG_7933.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
903	Uncured Beef Hot Dogs (Frozen)	Naturally cured with celery and salt, we worked hard and long to make a\ngreat tasting hot dog using only the highest quality meat, organic spices and\nno nitrites. THESE DOGS ARE REAL FOOD! Found at our farmers market, retail shop\nand local restaurants, we have upped our dog production to offer this popular\nitem at Good Eggs. We hope you love them as much as we do. Ingredients: Beef, Sea Salt, Organic Evaporated Cane Juice, Organic Paprika, Organic Spices, Organic Garlic, Cultured Celery Juice	1	lb	8.49	8.49	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/YfmKJ3arRzyBy1gRdCoK_FK1A4753.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
904	Bacon Hot Dogs (Frozen)	Ingredients: Pork, Water, Bacon (Pork, water, sea salt, brown sugar, cherry powder, Turbinado sugar, natural flavoring) sea salt, spices, celery powder, turbindado sugar, sodium carbonate, natural flavoring, in a sheep casing.Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	0.75	lb	7.49	9.99	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/tSMJY38JSo2vmNQhXXAb_FK1A8101.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	268	\N	\N	\N
905	Chicken Apple Sausage (Frozen)	Ingredients: Hormone free boneless skinless chicken thighs, applesauce, maple syrup, oats, cinnamon and spices (no nitrates or preservatives).  Lamb casing ,Kid favorite, mild. Suggested cooking instructions: Add  approx.1/4 inch of water to a skillet or shallow sauce pan, place sausages in covered pan and bring to a boil. Steam for approximately 5 minutes, pour off excess water. Add small amount of oil or butter, lower heat and cook until skins are brown. Enjoy!	1	lb	10.99	10.99	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/30BhA8hzTW6QwVTgmq1l_4o4j-dkPSCOPMN1VXz8UmKV3oLXH6rDCC04ogtUzap0.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
906	Spicy Fennel Chicken Sausage (Frozen)	Ingredients: hormone free boneless skinless chicken thighs, fennel seed, aniseed, cayenne peppers, chilis, parsley. (No nitrates or preservatives). Pork casing, spicy!Suggested cooking instructions: Add  approx.1/4 inch of water to a skillet or shallow sauce pan, place sausages in covered pan and bring to a boil. Steam for approximately 5 minutes, pour off excess water. Add small amount of oil or butter, lower heat and cook until skins are brown. Enjoy!Excellent grilled as well !	1	lb	10.99	10.99	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/ryfhiV7lRNmtWus0OnYH_6R0NwO4KKqyTiWUtvNzjHDEeHWs5gy67e_eWQc7paIE.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
907	Tomato Basil Chicken Sausage (Frozen)	Ingredients: Hormone free boneless skinless chicken thighs, sun dried tomatoes, fresh basil, spice blend (no nitrates or preservatives). Pork casing. Mild.Suggested cooking instructions: Add  approx.1/4 inch of water to a skillet or shallow sauce pan, place sausages in covered pan and bring to a boil. Steam for approximately 5 minutes, pour off excess water. Add small amount of oil or butter, lower heat and cook until skins are brown. Enjoy!Excellent grilled as well !	1	lb	10.99	10.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/570qCZpRfmEHVALyqw8Q_upN07XSwsZBOlQ-AsYDM21xDNO-zPFYoKm0eeK9Uam0.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	338	\N	\N	\N
908	Artichoke & Mushroom Chicken Sausage (Frozen)	Ingredients: Hormone-free boneless skinless chicken thighs, porcini mushrooms, artichoke hearts, garlic, onion, spice blend. Pork casing (No preservatives or nitrates.)Suggested cooking instructions: Add  approx.1/4 inch of water to a skillet or shallow sauce pan, place sausages in covered pan and bring to a boil. Steam for approximately 5 minutes, pour off excess water. Add small amount of oil or butter, lower heat and cook until skins are brown. Enjoy!Excellent for grilling as well !	1	lb	10.99	10.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/JPajTl2IRSmDNB1sh2aq_xQ88UrQ5vet0xMr7Ek695lXAt95DBR1xxgLrt-L-qsA.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	342	\N	\N	\N
909	Spinach Mozzarella Chicken Sausage	Ingredients: Hormone free boneless skinless chicken thighs, spinach, mozzarella cheese, spice blend (no nitrates, or preservatives) Pork casing. Mild and Kid approved!Suggested cooking instructions: Add  approx.1/4 inch of water to a skillet or shallow sauce pan, place sausages in covered pan and bring to a boil. Steam for approximately 5 minutes, pour off excess water. Add small amount of oil or butter, lower heat and cook until skins are brown. Enjoy!Excellent grilled as well!	1	lb	10.99	10.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/Hgi4oBxqRJuvgClzXMTV_poht3A1EMQekYZpz0IQbMllHXkqZtevA7nhY_e_WDN0.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	309	\N	\N	\N
910	Turkey Chorizo	Turkey Chorizo: Our Diestel Turkey Chorizo is delicious in a breakfast burrito, casserole, or even just grilled up with veggies! We’ve developed a special seasoning blend that gives our chorizo a nice kick without it being too spicy. It’s versatile, and we know you’ll love it for breakfast, lunch, or dinner!Ingredients: Turkey, water, spices, vinegar, sea salt, granulated garlic and onion powder.Real Turkey AttributesGluten FreeNo artificial ingredients or preservativesNo hormones, antibiotics, or growth stimulantsPure ground turkeyThoughtfully and humanely raised on GAP rated farmsGreat texture and flavor-the way turkey should taste!	16	oz	6.49	6.49	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/u8thBuORR3ebzXKJdGty_FK1A9373.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	391	\N	\N	\N
914	Pasture Raised Pork Breakfast Sausage (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. Ingredients: Walnut Keep Pork, Salt, Sugar, Sage, Sweet Smoked Paprika, Black PepperA savory breakfast sausage with well balanced spices where the pork flavor shines through and the sage is the predominant spice- would be great in an omelette, breakfast scramble, burrito, or frittata.	0.7	lb	8.49	12.13	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/gZH0dvHQRfavKEy4F3AG_FK1A9440.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
915	Breakfast Sausage, Bulk (Frozen)	The morning has never been so enjoyable. A slight sweetness is paired with our unctuous porky flavor to make the perfect accompaniment to your eggs, pancakes, oatmeal...Ingredients: Llano Seco Pork, Sea Salt, Paprika, and Spices.Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	0.75	lb	5.79	7.72	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/yrUIKjHtRaWsx0b0XG85_llanoseco_breakfastsausage.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
916	Turkey Breakfast Sausage (Frozen)	Start your morning off right with Diestel Sausage. Our savory blend of herbs is delicious, and our sausage packs a lean protein punch to power you through the day. Diestel Breakfast Sausage is delicious with eggs or in a breakfast burrito. You can also make breakfast patties with it. For a brunch specialty, try our Diestel Turkey Breakfast Sausage Strata.Ingredients: Turkey, water, sea salt, spices, and turbinado (unrefined sugar)Real Turkey AttributesGluten FreeNo artificial ingredients or preservativesNo hormones, antibiotics, or growth stimulantsPure ground turkeyThoughtfully and humanely raised on GAP rated farmsGreat texture and flavor-the way turkey should taste!	16	oz	7.29	7.29	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/Xl6AmV4eQnO6dJUdrVXd_FK1A9378.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
917	Whiskey Maple Sage Sausage (Frozen)	These fully cooked sausages are made with real whiskey and a\ntouch of maple, but aren't too sweet. Combined with sage and other organic spices\nthese delicious links are versatile and great for breakfast, lunch or dinner. One\nof our most popular market picks. \nIngredients: Pork, Whiskey, Brown Sugar, Sea Salt, Maple\nSyrup, Black Pepper, Sage, Nutmeg, Cayenne Pepper, in Natural Pork Casing	0.75	lb	7.49	9.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/DQGpSGdTScP8dpSkklsU_FK1A0892.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
918	Pasture Raised Pork Breakfast Sausage (Frozen)	These sausages are made from the ham and picnic shoulder. Riverdog hogs live in green, open pasture, under the shade of valley oaks and black walnut trees. The breeds raised at Riverdog include York, Duroc, Chester, Tamworth, Hampshire and European Wild Boar and are developing our own Riverdog Red breed. They are fed a mix of dry-farmed grain, nuts, fruits and veggies from our fields, pelletized organic feed, Cowgirl Creamery whey, and ice cream from Three Twins, reaching full size at 8 months. Riverdog Farm's hogs are CCOF certified organically raised animals. Because meat is processed in a non-organic facility, the pork is not certified organic.Ingredients: Pork, Water, Salt, Black Pepper, Spices and Crushed Red Pepper in a natural pork casing.	0.9	lb	11.69	12.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/ZALl6hQ1SfyMrGAVmZvR_breakfastsausage.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
919	Sweet Italian Sausage (Frozen)	Made using a very traditional European recipe including\nanise, fennel, minced garlic and touch of pepper, our Sweet Italian Sausage is\na true “do it all sausage”. Its great served in a roll, in your favorite pizza\nor pasta recipe, or all by itself. Fully cooked for simple prep. \nIngredients: Pork (Food Alliance Certified), Water, Organic\nSpices, Sea Salt, Organic Evaporated Cane Syrup, Organic Garlic, Organic\nPaprika, in Natural Pork Casing	0.75	lb	7.49	9.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/Y7GVXjmuSLvGYhK8dLTM_FK1A0899.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
920	Pasture Raised Apple Fennel Pork Sausage (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. A nicely balanced sausage, equally great for breakfast or for stuffing an acorn squash!Ingredients: pork, apple, salt, fennel, sugar, onion powder, sage, apple cider vinegar powder	0.7	lb	6.99	9.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/dbgQhkw2SpaYEv9mhoVS_FK1A0653.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	317	\N	\N	\N
921	Pasture Raised Pork Sausage, Bulk (Frozen)	Pasture Raised Pork Sauasage, No Casing- from Simas Swine and Wine in the Capay ValleyGrab some winter squash and start stuffing!A mild sausage with an awesomely rich pork flavor, equally great for both breakfast patties and pasta sauce, probably the most versatile sausage in our lineup!Ingredients: Pork, Water, Salt, Black Pepper, Spices and Crushed Red Pepper.Pasture raised Berkshire cross hogs from the Capay Valley.	1	lb	11.99	11.99	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/mQ6pA8HSVi8cMnhGFiis_FK1A8581.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
922	Pasture Raised Garlic Ginger Pork Sausage (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. Garlic and Ginger sausage- delicious in all the ways that sausage normally is, with the added bonus of making a perfect pot sticker or egg roll filling, or an awesome little meatball for a Pho style soup!Ingredients: pork, salt, garlic powder, dry honey, ginger powder, spices.	0.7	lb	8.39	11.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/OmJWhPm0TamIYu7ABUsi_FK1A3966.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	389	\N	\N	\N
923	Smoked Pork Kielbasa	Our smoked kielbasa contains 100% pork seasoned with mustard seed, garlic, and spices. We smoke these over applewood for hours, so they have a nice smokey flavor. Product is fully cooked. We like to slice it up and put it in a pan with our greens, so the fat and flavors season up the greens.  Serve that up with some mustardy potato salad, Oh Baby!INGREDIENTS: Pork, pork fat back, salt, dextrose, nitrite, milk powder, white and black pepper, mustard powder and seeds, garlic.	0.75	lb	6.79	9.05	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/gSHwGhyyThWQKPIfm4qd_FK1A6872.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
924	Pasture Raised Pork Chorizo Sausage (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. A super flavorful, not too spicy sausage that adds impressive pork flavor to whatever you pair it with- great with eggs, in soups and stews, on the grill or smoker, or in rice or potato dishes.Ingredients: pork, salt, paprika, garlic, spices.	0.7	lb	6.99	9.99	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/zVo5O6SBRU6oEuScb8Ht_FK1A8126.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	391	\N	\N	\N
925	Pasture Raised Mild Italian Pork Sausage (Frozen)	These sausages are made from the ham and picnic shoulder. Riverdog hogs live in green, open pasture, under the shade of valley oaks and black walnut trees. The breeds raised at Riverdog include York, Duroc, Chester, Tamworth, Hampshire and European Wild Boar and are developing our own Riverdog Red breed. They are fed a mix of dry-farmed grain, nuts, fruits and veggies from our fields, pelletized organic feed, Cowgirl Creamery whey, and ice cream from Three Twins, reaching full size at 8 months. Riverdog Farm's hogs are CCOF certified organically raised animals. Because meat is processed in a non-organic facility, the pork is not certified organic.Ingredients: Pork, Salt, Red Wine, Sugar and Spices in a natural pork casing.	0.9	lb	11.69	12.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/LXwpynGTSKsQXMwmsa9e_italiansausage.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
926	Pasture Raised Spicy Italian Pork Sausage (Frozen)	These sausages are made from the ham and picnic shoulder. Riverdog hogs live in green, open pasture, under the shade of valley oaks and black walnut trees. The breeds raised at Riverdog include York, Duroc, Chester, Tamworth, Hampshire and European Wild Boar and are developing our own Riverdog Red breed. They are fed a mix of dry-farmed grain, nuts, fruits and veggies from our fields, pelletized organic feed, Cowgirl Creamery whey, and ice cream from Three Twins, reaching full size at 8 months. Riverdog Farm's hogs are CCOF certified organically raised animals. Because meat is processed in a non-organic facility, the pork is not certified organic.	0.9	lb	11.69	12.99	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/JoFDwnKVRdK02R8dHbBc_spicyitaliansausage.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
927	Pork Ksekrainer	Käsekrainer are the delicacy of sausage stands dotting the towns and cities of Austria. A traditional street food, these plump pork sausages are studded with Emmenthaler cheese and smoked over apple wood. Once warmed through and lightly crisped each slice yields a gooey cheese interior. These are the most decadent cheese dogs you'll ever taste.Package includes three 4 ounce sausages (12 ounce).Ingredients: Pork, pork fat, water, swiss cheese (pasteurized cow's milk, cheese cultures, salt, enzymes), dry milk powder, less that 2% of: salt, dried vinegar, cultured dextrose, fresh garlic, black pepper, dextrose, swiss chard powder, natural flavors, lactic acid cultures. Stuffed in hog casing.Contains: Milk	0.75	lb	6.79	9.05	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/eOqJRsYAQS6AEU6TOZig_FK1A6831.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
928	Rustic Sausage (Frozen)	PRMC’s sugar –free sausage has finally arrived! A very\ntraditional flavored, juicy pork sausage made with PRMC heritage pork and\norganic spices this is a great every day sausage served in a bun, on its own or\nin your favorite sausage based recipe. And NO SUGAR!\nIngredients: Pork, Water, Sea Salt, Spices, Onion, Garlic,\nPaprika, Cayenne, Cultured Celery Extract, In Natural Pork Casing	0.75	lb	7.49	9.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/KH6oEzcyQpm7GcLBpMc1_FK1A4997.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
930	Pasture Raised Pork Bratwurst (Frozen)	These sausages are made from the ham and picnic shoulder. Riverdog hogs live in green, open pasture, under the shade of valley oaks and black walnut trees. The breeds raised at Riverdog include York, Duroc, Chester, Tamworth, Hampshire and European Wild Boar and are developing our own Riverdog Red breed. They are fed a mix of dry-farmed grain, nuts, fruits and veggies from our fields, pelletized organic feed, Cowgirl Creamery whey, and ice cream from Three Twins, reaching full size at 8 months. Riverdog Farm's hogs are CCOF certified organically raised animals. Because meat is processed in a non-organic facility, the pork is not certified organic.Ingredients: Pork, Water, Salt, Pepper, and Spices in a natural pork casing.	0.9	lb	10.79	11.99	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/h1EQZgDwSv21Qv9t65pR_bratwurst.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
931	Smoked Pork Chorizo	Our Basque-inspired, smoked chorizo is made with the finest pork cuts, pimenton, and fresh garlic, then applewood smoked.  Perfect for your Paella, there are three, 4 oz sausages per package.INGREDIENTS: Lean pork shoulder, pork fatback, salt, paprika, milk powder, cayenne, pepper, pimenton, oregano, garlic. 	0.75	lb	6.79	9.05	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/0TpKitJ6RhCl8gQ99RFI_FK1A6849.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	391	\N	\N	\N
932	Pork Linguica (Frozen)	A traditional Portuguese sausage, Linguica is traditionally made with pork, marinated in red table wine, seasoned with garlic, paprika, oregano, basil, and smoked with hickory wood. Mildly spicy, smoky and full of flavor.Ingredients: pork, water, red wine, salt, paprika, vinegar powder, spices, celery powder.1/2 lb package, 2 links per package. Smoked, fully cooked. No added nitrates except for those naturally occurring in celery powder.	0.5	lb	8.99	17.98	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/dENkUcHhRGqWoxMD6Zne_tR2plAkjST2P4PVt58gm_wr8LIVMSvUP-isvxANMDSjfJFAY4zdoFXJWGdLCzFCw.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
933	Pasture Raised Thai Coconut Pork Sausage (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. Thai style pork sausage with coconut- excellent flavor, not too much spice, great grilled with a side of crunchy vegetables, or try it in a curry or stir fry. Or just eat it on a bun, that's good too.Ingredients: Pork, Pork Fat, Shredded Coconut, Salt, Spices, Garlic Powder, Cilantro Powder, Ginger Powder, Lime Peel PowderContains: Coconut, Wheat	0.7	lb	8.39	11.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/dbgQhkw2SpaYEv9mhoVS_FK1A0653.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
934	Pasture Raised Maple Pecan Pork Sausage (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. Ingredients: pork, maple sugar, pecans, salt, onion powder, spices, garlic powder, vinegar powder, ginger powder.	0.8	lb	10.39	12.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/dbgQhkw2SpaYEv9mhoVS_FK1A0653.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
936	Grassfed Lamb Merguez (Frozen)	Lamb Merguez-Williams Ranches Lamb,  from Sonoma County Meat CompanySuper-flavorful, well spiced but not too hot, this 100% lamb merguez cooks up quickly and is an awesome complement to vegetable or grain dishes- especially good with lentils for a one pot no fuss meal!Ingredients: Lamb, Spics, Salt, Garlic Powder, in a Lamb Casing.Williams Ranches grows the highest quality lamb, fed on grass, clover and alfalfa with no hormones or antibiotic supplements. The Williams hand select each lamb, determining processing time by the amount of fat cover. This ensures a quality, consistent product that is available year round and lambs that are processed between 5 and 8 months old. This process means you will get a leaner, milder lamb that simply melts in your mouth.Ingredients: Lamb, Spics, Salt, Garlic Powder, in a Lamb Casing.	0.75	lb	10.49	13.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/zt9hwO7R0W0EnKVIsRHz_20161007-SonomaMeatCo_LambMerguez_MG_3204%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
937	Grass-fed Beef Summer Sausage, Sliced (Frozen)	Going on a picnic this weekend? We've got you covered. Take along a pack of our already sliced summer sausage, some cheese, a baguette and some fruit and you'll be set. We also love our sliced summer sausage on pizza as a healthier alternative to pepperoni.Ingredients: beef, sodium lactate, salt, sugar, brown sugar, granulated garlic, black pepper, mustard seed, sodium nitriteLike all our grass fed meat specialty items, our lean beef summer sausage is made only with meat from cows that we raise ourselves, there are no fillers or other meats.approximately 25 slices in a package, 3/4 lb package.Smoked (fully cooked)Keep refrigerated or frozen until ready to eat. Shelf stable at normal temps for 48 hours.Fun fact: summer sausage is made using a lactic acid fermentation process. In the days before refrigeration, preserving meat was an art form. This sausage was called summer sausage because it was one of the few sausages that would last during the hot months.	0.5	lb	12.99	25.98	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/k1uhMukbRj6KGQEelDLf_FK1A5007.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
938	Grass-fed Beef Summer Sausage (Frozen)	A beautiful little section of summer sausage you can custom slice to your preference, great for a hike or a picnic!Ingredients: beef, sodium lactate, salt, sugar, brown sugar, granulated garlic, black pepper, mustard seed, sodium nitriteLike all our grass fed meat specialty items, our lean beef summer sausage is made only with meat from cows that we raise ourselves, there are no fillers or other meats.Smoked (fully cooked)Keep refrigerated or frozen until ready to eat. Shelf stable at normal temps for 48 hours.Fun fact: summer sausage is made using a lactic acid fermentation process. In the days before refrigeration, preserving meat was an art form. This sausage was called summer sausage because it was one of the few sausages that would last during the hot months.	0.7	lb	17.49	24.99	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/lSN7EO0QhuwOJWzihhRg_FK1A6185.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
939	Sweet Italian Beef Sausage (Frozen)	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co.A classic sausage flavor made with delicious Oakridge Angus beef!Ingredients: Beef, Wine, Salt, Spices, Sugar, Garlic. Pork casing.	0.7	lb	9.99	14.27	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/OmJWhPm0TamIYu7ABUsi_FK1A3966.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
940	Jalapeno Mint Lamb Sausage	Classic flavor pairings all rolled up into one delicious sausage! Grill it, slice it, and put it on banh mi for a killer sandwich experience!Ingredients: Grass-fed Lamb, Jalapeno, Garlic, Salt, Mint, GingerNatural Pork Casing	0.7	lb	13.99	19.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/xcW4i7jFQ6GlJDmCgkJc_20160701-CasaRosa_MintJalepenoLambSausage_MG_4254.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
941	Lamb Sausage (Frozen)	One of our customer favorites, the lamb sausage comes ready to cook and is delicious on a bed of rice. The lamb is sourced from Anderson Ranch in Southern Oregon and is 100% grassfed and Certified Humane.Ingredients: Lamb, Water, Sea Salt, Spices, Onion, Garlic, In Natural Pork Casing.	0.75	lb	11.29	15.05	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/8ieUXFz6RzO8epwxxkIp_FK1A8495.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
942	Grassfed Lamb Merguez (Frozen)	Lamb Merguez-Williams Ranches Lamb,  from Sonoma County Meat CompanySuper-flavorful, well spiced but not too hot, this 100% lamb merguez cooks up quickly and is an awesome complement to vegetable or grain dishes- especially good with lentils for a one pot no fuss meal!Ingredients: Lamb, Spics, Salt, Garlic Powder, in a Lamb Casing.Williams Ranches grows the highest quality lamb, fed on grass, clover and alfalfa with no hormones or antibiotic supplements. The Williams hand select each lamb, determining processing time by the amount of fat cover. This ensures a quality, consistent product that is available year round and lambs that are processed between 5 and 8 months old. This process means you will get a leaner, milder lamb that simply melts in your mouth.Ingredients: Lamb, Spics, Salt, Garlic Powder, in a Lamb Casing.	0.65	lb	9.29	14.29	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/zt9hwO7R0W0EnKVIsRHz_20161007-SonomaMeatCo_LambMerguez_MG_3204%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
943	Beef and Pork Bratwurst (Frozen)	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co.Great beef flavor and juicy pork fat come together to make an exceptional sausage, perfect on a bun!Ingredients: Beef, Pork Fat, Cream, Eggs, Salt, Spices, Sugar.Contains Pork, Dairy, Eggs.	0.7	lb	10.49	14.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/EAXrjnDSJOUOEr6wa5w8_FK1A8120.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
944	Jalapeno Mint Lamb Sausage	Classic flavor pairings all rolled up into one delicious sausage! Grill it, slice it, and put it on banh mi for a killer sandwich experience!Ingredients: Grass-fed Lamb, Jalapeno, Garlic, Salt, Mint, GingerNatural Pork Casing	0.8	lb	15.99	19.99	lb	Meat	Sausage	http://goodeggs2.imgix.net/product_photos/xcW4i7jFQ6GlJDmCgkJc_20160701-CasaRosa_MintJalepenoLambSausage_MG_4254.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
945	Grass-fed Beef Garlic Sausage (Frozen)	Delicious beef sausage seasoned with garlic and red wine. If you're looking for a change from pork sausage, give our beef sausage a try. It's also excellent for seasoning rice dishes or as an addition to a stew like jambalaya. Like all our grass fed meat specialty items, our beef sausage is made only with meat from cattle that we raise ourselves, there are no fillers or other meats.2 links in a package, approximately .5 (1/2) lb each package. Smoked (fully cooked), keep refrigerated or frozen until ready to eat. Heat and serve.Ingredients: beef, wine, water, garlic, salt, celery powder.	0.5	lb	8.99	17.98	lb	Meat	Sausage	http://goodeggs1.imgix.net/product_photos/tfgp1s8CSjWH4LQ14iZ7_tMEEXovKSGuxvn6TRvtS_GzbZjtZ9wXbFT5jthjfS1Zl9DjU8mgSm3WC2kXroMIc.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	389	\N	\N	\N
947	Prosciutto Americano	Humanely raised, antibiotic free\npork from Heritage Acres\nand Niman\nRanch is dry cured with\nsea salt\nand aged for 9-12\nmonths, resulting in a sweet, clean flavor\nand a floral minerality. Add it to cheese and charcuterie platters, tear it into pasta with shaved parmigiano, layer it in sandwiches with bitter greens, or bake it into frittatas and galettes.Ingredients: pork, sea salt.	3	oz	8.49	45.28	lb	Meat	Deli Meat	http://goodeggs1.imgix.net/product_photos/l0dH7Pa9SE2VwxdPM7jq_FK1A0404.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	227	\N	\N	\N
948	Salami Americano	We created this salami with the kitchen in mind. Wonderful in a sandwich with all the fixings or layered on a pizza. We sell it with the casing already removed so no peeling needed!Ingredients: pork, sea salt, dextrose, spices, celery extract, culture.	3	oz	6.99	37.28	lb	Meat	Deli Meat	http://goodeggs2.imgix.net/product_photos/nliHZYmRe2zgGRCqzP8C_FK1A7242.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	227	\N	\N	\N
949	Speck Americano	Speck, a lesser-known variation of prosciutto, is a sweet meat, deep, rich and earthy in texture with a distinct but light applewood-smoked flavor and aroma. Slice it thin to eat alone or with your favorite cheese. Ingredients: Pork, Sea Salt. Smoked over real applewood.	3	oz	6.99	37.28	lb	Meat	Deli Meat	http://goodeggs1.imgix.net/product_photos/AVjP3aynSHKMR1dn8dfS_FK1A7221.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	227	\N	\N	\N
950	Grass-fed Beef Summer Sausage (Frozen)	A beautiful little section of summer sausage you can custom slice to your preference, great for a hike or a picnic!Ingredients: beef, sodium lactate, salt, sugar, brown sugar, granulated garlic, black pepper, mustard seed, sodium nitriteLike all our grass fed meat specialty items, our lean beef summer sausage is made only with meat from cows that we raise ourselves, there are no fillers or other meats.Smoked (fully cooked)Keep refrigerated or frozen until ready to eat. Shelf stable at normal temps for 48 hours.Fun fact: summer sausage is made using a lactic acid fermentation process. In the days before refrigeration, preserving meat was an art form. This sausage was called summer sausage because it was one of the few sausages that would last during the hot months.	0.8	lb	19.99	24.99	lb	Meat	Deli Meat	http://goodeggs1.imgix.net/product_photos/lSN7EO0QhuwOJWzihhRg_FK1A6185.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
957	Peppered Roast Turkey	Oven roasted breast sprinkled with freshly cracked coarse pepper. How Our Deli Meats Stack UpNo gluten, casein, carrageenan, phosphates, MSG, artificial ingredients, or preservativesNo added nitrates or nitritesNo antibiotics, growth stimulants, or hormonesTurkeys are fed a 100% Vegetarian DietOnly whole muscle meat used. No fillers!NON-GMO Project VerifiedAll animals are humanely raised on GAP-rated sustainable family farms and ranches.Ingredients: Turkey breast, water, sea salt, sodium carbonate, natural flavorings, spices.	6	oz	5.99	15.97	lb	Meat	Deli Meat	http://goodeggs1.imgix.net/product_photos/Cf8kMBvHRJWraR5o5F5m_Good%20Eggs_111515-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	258	\N	\N	\N
958	Roasted Sesame Beef Jerky	Toasted sesame seeds, brown sugar and soy make for a super savory, nutty and delicious beef jerky that leaves you wanting more. No preservatives, no added MSG*, no nitrites, no corn syrup.*Except naturally occurring in soy sauce.Ingredients: top round beef, pineapple juice, gluten-free reduced sodium soy sauce, (water, soybeans, salt, alcohol), organic blue agave nectar, brown sugar, water, rice wine, natural liquid smoke flavor, sesame seeds, garlic powder, ginger, sesame seed oil, granulated onion, black pepper.Allergens: contains soy.	2.2	oz	5.99	2.72	oz	Meat	Savory Snacks	http://goodeggs1.imgix.net/product_photos/lC1RkWReQWa2TjNRUbjw_20140924_GoodEggs_017_Jerky-Sesame.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
959	Original Beef Candy	PRMC Beef Candy is a delicious jerky-style product made with\nour high-quality lean beef. It is brined in brown sugar, salt and other spices,\nand then slow-cooked to perfection. The brining process makes the meat tender,\nsweet and juicy—it really is Beef Candy! Makes a great mid-day-snack. \nProduct is shelf-stable just like traditional dried and\nsmoked jerky.\nIngredients: Beef, Brown Sugar, Sea Salt, Spices, Cultured Celery Juice, Garlic, Onion	3	oz	8.49	2.83	oz	Meat	Savory Snacks	http://goodeggs1.imgix.net/product_photos/bInFHyEBTIyPxUqOi4Mu_FK1A1043.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
960	Teriyaki Beef Jerky	It's hard not to love this one. The flavor is a marriage of ginger soy sauce, Asian garlic and onion. Top round beef coupled with brown sugar, honey and a pineapple marinade make for an unforgettable taste that will leave you fighting off friends and family!No preservatives, no added MSG*, no nitrites, no corn syrup.*Except naturally occurring in soy sauce.Ingredients: top round beef, gluten-free reduced sodium soy sauce, (water, soybeans, salt, alcohol), apple juice, brown sugar, pineapple juice, water, natural hickory liquid smoke, rice wine, black pepper, granulated garlic, red wine vinegar, ginger, white pepper, granulated onion.Allergens: contains soy.	2.2	oz	5.99	2.72	oz	Meat	Savory Snacks	http://goodeggs2.imgix.net/product_photos/Ja9aNK2vQeyupLRTZmS1_20140528_GoodEggs_175_TeriyakiBeefJerky.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
961	Cowboy Style Beef Jerky	\nProduct is shelf-stable just like traditional dried and\nsmoked jerky.\nIngredients: Beef, Pineapple Juice, Sea Salt, Yeast, Paprika, Jalapeno Peppers, Black Pepper, Spices, Garlic, Onion, Celery Juice Powder, Lactic Acid Starter Culture	3	oz	10.99	3.66	oz	Meat	Savory Snacks	http://goodeggs2.imgix.net/product_photos/NANuQHPSOGnreK617SSF_FK1A9605.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
963	Original Beef Jerky	A trusted standby that is perfect for any occasion. Our Original flavor is what we are all about—bringing together a culmination of hickory smoke with a black pepper and brown sugar marinade. We think it's a pretty perfect flavor combination.No preservatives, no added MSG*, no nitrites, no corn syrup.*Except naturally occurring in soy sauce.Ingredients: top round beef, gluten-free reduced sodium soy sauce, (water, soybeans, salt, alcohol), apple juice, brown sugar, pineapple juice, water, natural hickory liquid smoke, rice wine, black pepper, granulated garlic, red wine vinegar, ginger, white pepper, granulated onion.Allergens: contains soy.	2.2	oz	5.99	2.72	oz	Meat	Savory Snacks	http://goodeggs1.imgix.net/product_photos/69GWCynwQtyc7uDST3t8_20140528_GoodEggs_182_OriginalBeefJerky.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
964	Honey Spice Beef Jerky	This jerky will definitely get your tastebuds rocking! Its honey sweet start is in perfect harmony with the cayenne pepper finish. Our lean mean cuts marinate for hours in a smoky, yet spicy, cayenne pepper and garlic honey marinade.No preservatives, no added MSG*, no nitrites, no corn syrup.*Except naturally occurring in soy sauce.Ingredients: top round beef, brown sugar, gluten-free reduced sodium soy sauce, (water, soybeans, salt, alcohol), pineapple juice, honey, water, apple juice, rice wine, natural liquid smoke flavor, granulated garlic, ginger, Frank's RedHot (aged cayenne red peppers, vinegar, water, salt, garlic powder), cayenne pepper, granulated onion, black pepper, white pepper.Allergens: contains soy.	2.2	oz	5.99	2.72	oz	Meat	Savory Snacks	http://goodeggs2.imgix.net/product_photos/ewmmThoJS7e3jlF1Qmem_20140528_GoodEggs_189_HoneySpice.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
965	Hot Beef Candy	PRMC Beef Candy is a delicious jerky-style product made with\nour high-quality lean beef. It is brined in brown sugar, salt and other spices,\nand then slow-cooked to perfection. The brining process makes the meat tender,\nsweet and juicy—it really is Beef Candy! Our “Hot” Beef Candy has red chili\nflakes for an additional kick in the pants. Not so hot you’ll run for water,\nbut you will notice it. \nProduct is shelf-stable just like traditional dried and\nsmoked jerky.\nIngredients: Beef, Brown Sugar, Sea Salt, Jalapeno Pepper, Cayenne Pepper, Spices, Cultured Celery Juice, Garlic, Onion	3	oz	8.49	2.83	oz	Meat	Savory Snacks	http://goodeggs2.imgix.net/product_photos/dKrT3QyaSvmP6sQDeJdw_FK1A1095.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
966	Whiskey Maple Beef Jerky	\nProduct is shelf-stable just like traditional dried and\nsmoked jerky.\nIngredients: Beef, Sea Salt, Pineapple Juice, Whiskey, Wine Vinegar,   Paprika, Maple Syrup Powder, Black Pepper, Garlic, Onion, Yeast, Celery Juice Powder, Lactic Acid Starter Culture	3	oz	10.99	3.66	oz	Meat	Savory Snacks	http://goodeggs2.imgix.net/product_photos/eQqGb5x9TVGK64k2XMlt_FK1A9586.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
970	Saucisson Sec	Saucisson Sec is a thick, dried French salami, seasoned with fresh garlic and cracked black pepper. It's perfect to pair with a creamy, aromatic cheese or fresh fruit like apples and pears. The casings are natural and edible!Ingredients: pork, salt, 2% or less of dextrose, garlic, sodium nitrite, sodium nitrate, lactic acid starter culture, water.	4.2	oz	9.99	38.06	lb	Meat	Charcuterie	http://goodeggs2.imgix.net/product_photos/eXmKjgDRJmjCWhyGeuEz_FK1A1153.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	358	\N	\N	\N
971	Chicken Liver Pate	Mission Heirloom's chicken liver pate is rich and creamy, lightened up with smoked applesauce and bright herbs like shiso. Spread it onto toast or crackers, add it to a cheese platter, or use it to liven up a peppery arugula salad. Refrigerate after opening and consume within 5 days.Ingredients: chicken liver, house birch-smoked applesauce, beef fat, thyme, shiso, epazote, salt.	8.1	oz	8.99	1.11	oz	Meat	Charcuterie	http://goodeggs2.imgix.net/product_photos/rAdrmBdFT3WnbRbDcY5z_chix%20liver%20pate.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	214	\N	\N	\N
973	Pork Pistachio Pâtè	This country style pork pate is made with fresh herbs and pistachios, then capped with rendered pig fat. SUGGESTIONS TO ENJOY: Enjoy with your favorite baguette and a stone ground mustard.INGREDIENTS: Pork, liver, salt, nitrite, pepper, sugar, garlic, onion, parsley, thyme, shallot, port wine, cloves, nutmeg, ginger, bread, milk, spices. 	8	oz	9.99	1.25	oz	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/ZhKZsHU1THq8JzBtPL99_FK1A5516-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
975	Grass Fed Beef Sausage Sticks	For a high energy yet healthy snack, try our smoked beef sticks. The spices are black pepper, basil, oregano and garlic.No preservatives, by-products, soy, fillers or conditioners, just 100% grass fed ground beef from our Limousin cross cattle. Carefully smoked with hickory wood in a small facility on the North Coast, the beef sticks are prepared with no added nitrates. Ingredients: beef, salt, sugar, spices, celery powder.Shelf life: If kept refrigerated and unopened, sticks will last a month. If not refrigerated, then 2 weeks. (Not like you're going to be able to keep from eating them right away anyway)	2	oz	3.99	2.0	oz	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/ETLhCi9QROOUlVMA5DCg_ow77QAwDTbu98ATRIU0h_FK1A3187.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
980	Football Summer Sausage	This iconic treat is a "go-anywhere", "pair with everything", "everybody’s favorite" kinda sausage. A classic American favorite Ours has fresh garlic, whole mustard seeds and a bright kick from chili flake. Shelf stable, cased in a custom football casingIngredients: Pork, pork fat, water, salt, spices, dextrose, garlic, vinegar, marjoram, chard powder, natural flavors, lactic acid starter culture	1	lb	14.49	14.49	lb	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/zHpUqhVrS8iHz9Yifmws_20160913-OlympicProvisions_FootballSummerSausage__MG_0887.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
981	Pork Summer Sausage	This iconic treat is a "go-anywhere", "pair with everything", "everybody’s favorite" kinda sausage. Our take on the classic American summer sausage is tangy and mildly spiced with mustard and garlic, wax dipped, and completely delicious.Ingredients: Pork, pork fat, water, salt, spices, dextrose, garlic, vinegar, marjoram, swiss chard powder, natural flavors, lactic acid starter culture, potassium sorbate. 	0.75	lb	10.99	14.65	lb	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/0QhDxbcGTXeI9ol3pHmS_FK1A7723.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	277	\N	\N	\N
985	Chorizo Navarre	A Northern Spanish style chorizo punctuated with Pimentón de la Vera, fresh garlic, and just the right amount of cayenne to imbue a warm heat. Natural, edible hog casings and authentic molds.  Ingredients: Pork, pork fat, salt. Contains 2% or less of dextrose, garlic, sodium nitrite, sodium nitrate, spices, lactic acid starter culture, water.	4.2	oz	9.99	38.06	lb	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/rNO3oXhnToBpWWSwm7eA_FK1A1235.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	302	\N	\N	\N
986	Chorizo Rioja	Our most traditional Spanish style chorizo, flavored with bright smoked and sweet Pimentón de la Vera, earthy garlic and oregano. Natural, edible hog casings and authentic molds. Ingredients: Pork, pork fat, salt. Contains 2% or less of dextrose, garlic, sodium nitrite, sodium nitrate, spices, lactic acid starter culture, water.	4.2	oz	9.99	38.06	lb	Meat	Charcuterie	http://goodeggs2.imgix.net/product_photos/xOg3DaLS4yaUE7N4CtRr_FK1A1224.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	357	\N	\N	\N
988	Pork Liver Mousse	Rich and creamy Pork Liver Mousse, slightly sweetened with Port Wine and capped with rendered pig fat. Enjoy with your favorite baguette, olive oil and fleur de sel, or with a bit of tart marmalade or sweet fig jam alongside.Ingredients: pork liver, lard, cream, egg, port wine, salt, nitrite, pepper, coriander, chili flake.Contains: milk, egg.	8	oz	9.99	1.25	oz	Meat	Charcuterie	http://goodeggs1.imgix.net/product_photos/e8vkjQw3QQCTkHS0OpnQ_FK1A5531-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
999	Akka's Indian Spice Rub	A South India style fresh tasting curry spice rub with authentic flavor is tailored from my family recipe. It pairs well with roasting both meat and vegetable.  Rub meat with generous amount of spice rub, olive oil, and lemon juice. Marinate in refrigerator for 30mins. Roast, grill, or barbeque until the meat is cooked. Serve with rice, bread, or paratha and Akka's mango chutney on the side. Coat chopped vegetables like potato, sweet potato, carrots, shallots, celery stick with the spice rub and olive oil mixture. Roast until cooked. Separately, make or heat tomato sauce on a skillet along with some spice rub. Transfer vegetable to the skillet and mix well. Serve with rice, chapathi, or paratha and Akka's Meyer lemon relish on the side. Mixing with tomato sauce is optional.Ingredients: coriander, ginger, garlic, safflower oil, coconut, turmeric, red chili, spices, salt, curry leaf	3.2	oz	9.99	3.12	oz	Meat	Rubs & Marinades	http://goodeggs1.imgix.net/product_photos/qwG0wPQaRqG1nw1rHyuq_20160809-Akkas_IndianSpiceRubMG_7517.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	291	\N	\N	\N
989	Grassfed Beef Pastrami	Create the ultimate Reuben! Our grass fed beef top round is cured in a sea salt brine for 2 weeks, rubbed with cracked black pepper and hot smoked with almond and fruit wood to perfection. Sliced. Ingredients: Beef Round, Water, Salt, Sugar, Sodium Lactate, Sodium Nitrite, Black Pepper, Dehydrated Garlic, SpicesWe raise our Limousin steers on certified organic rotational pasture and native grasslands within 2 hours of the Bay Area in the beautiful Capay Valley. We take the time to alfalfa finish all our animals. We truly believe that in order for consistency in a grass fed, grass-finished product, each producer must choose the best method for their farm and its local ecology. We grow our own pesticide free, non-GM alfalfa on our family's fields to produce high quality beef. You will find our farm's beef to be a very lean red meat with light marbling, yet extra tender. Our beef is dry-aged for a minimum of 16 days, flash frozen, and vacuum sealed. We are a certified USDA Grass Fed Producer and our farm and pastures are certified organic by CCOF. Follow us on our new Instagram feed @casa_rosa_farm and see how our animals really live.	0.7	lb	18.99	27.13	lb	Meat	Deli Meat	http://goodeggs1.imgix.net/product_photos/g53A9aGbRPyqeRYZEhXf_FK1A9639.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
990	Original Korean BBQ Marinade	"This is an all NEW product from Genuine Grub! As someone who loves Korean BBQ (or K-BBQ as we say in my house) it's awesome to know that I no longer have to wait in line at the K-BBQ spots around the Bay and that I can enjoy the flavors right from my own house" -Erin, Grocery Buyersure, we could tell you that our marinade has tons of great reviews. but most of them are from people we had to pay. like family and friends. but if you’re looking for something new and exciting in life (sorry, we’re referring to food only), we think you’ll love this. besides, it’s made with organic ingredients and stuff. so, c’mon, what've you got to lose? a few dollars, sure, but that's a risk we're willing to take! MADE IN MARIN.ingredients: soy sauce (water,soybean, wheat, salt),* sugar,* sesame oil,* water, apple cider vinegar,* apple cider,* arrowroot,* granulated garlic,* sesame seed,* minced garlic,* green onion,* black pepper.*     * organic 	16	oz	7.99	0.5	oz	Meat	Rubs & Marinades	http://goodeggs1.imgix.net/product_photos/PxwlOyk7SfmyRkCvfN0g_20160824-GenuineGrub_KoreanBBQ_MG_8620.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	273	\N	\N	\N
991	Spiced Molasses BBQ Sauce	A complement to our popular bbq sauce, this new sauce (introduced in July, 2014) is based around molasses, dark cane sugar, a good amount of vinegar for tang and the addition of bourbon, espresso and a variety of spices and peppers that makes it so delicious you can eat it straight out of the jar all by itself. The San Francisco Chronicle wrote: "This latest offering from the San Francisco preserves company offers deep notes of molasses and bourbon in what tastes like the culinary love child of a traditional bbq sauce and a spiced gingerbread cookie (in a good way, of course)."  http://www.sfgate.com/food/article/Barbecue-sauces-for-ribs-wings-chops-or-skewers-5631764.phpIngredients: Vinegar, organic tomatoes, molasses, cane sugar, organic apple cider, bourbon, spices, salt, espresso.	16	fl oz	6.79	0.42	fl oz	Meat	Rubs & Marinades	http://goodeggs2.imgix.net/product_photos/EPMjcWkqQ9KZBo9O5eRP_FK1A6477.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	233	\N	\N	\N
992	Poultry Seasoning	With rubbed sage, white pepper and notes of ginger, green onion and thyme, this poultry seasoning is a classic hit. Rub a few teaspoons on and in a whole turkey or chicken or parts, add sea salt and roast. Great in stuffing, too.	1.1	oz	6.99	6.35	oz	Meat	Rubs & Marinades	http://goodeggs1.imgix.net/product_photos/OiaYcw9mSt2ZtqjVC3Up_FK1A9474.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	266	\N	\N	\N
993	Chimichurri Sauce	Ingredients: Extra Virgin Olive Oil, White Distilled Vinegar, Water, Sea Salt, Oregano, Sage, Red Chili Pepper, Thyme, PeppercornThe perfect accompaniment to a grilled Prather steak, chimichurri is a classic Argentinian sauce to go with grilled meats- but it's also awesome on potatoes, scrambled eggs, steamed veggies, chicken, or over Provoleta (grilled provolone cheese, look it up, you'll thank us...)	9	oz	9.99	1.11	oz	Meat	Rubs & Marinades	http://goodeggs2.imgix.net/product_photos/ObztJtUoTOaMYYtVsLXA_FK1A5450.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	233	\N	\N	\N
994	Montreal Steak and Chop Spice Blend	Whether you’re grilling or pan frying your steak or chop, this blend gives every bite a good dose of pepper and garlic. Use liberally on your meat.Hand-mixed from: Flake Salt, Garlic, Black Pepper, Coriander, Dill Seed, White Pepper, Onion, Caraway Seed, Thyme, Green Onion, and Oregano.	2	oz	5.79	2.9	oz	Meat	Rubs & Marinades	http://goodeggs1.imgix.net/product_photos/FKsEPt8kQtujTjbFrg1V_montreal.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	409	\N	\N	\N
995	Shio Koji, All-Purpose Japanese Marinade	Shio koji is a live food that adds rich savory flavor to your cooking. Use in place of salt in any dish or sauce, giving you a umami-rich way to lower the sodium content.For more ideas on how to use Shio koji, check out this article from SF Gate!Ingredients   Organic rice koji, spring water, sea salt	8	oz	9.99	1.25	oz	Meat	Rubs & Marinades	http://goodeggs2.imgix.net/product_photos/E5c796noReydv5rs8ALM_FK1A6778.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	273	\N	\N	\N
996	Spicy Korean BBQ Marinade	"This is an all NEW product from Genuine Grub! As someone who loves Korean BBQ (or K-BBQ as we say in my house) I am stoked that I can now enjoy flavors from my own couch. This is the spicier version for anyone who wants to walk on the wild side. " -Erin, Grocery Buyerlooking for a spicy marinade that will set your taste buds on fire? well, this ain’t it – but it will add a nice kick to whatever you add it to. and, like our original korean bbq marinade, it’s made with only organic ingredients and stuff. so, c’mon, think of how jealous your family and friends will be of you since it’s a FACT that people who eat spicy foods live spicier lives*…..………(* umm, not a fact whatsoever.) MADE IN MARIN.ingredients: soy sauce (water,soybean, wheat, salt),* sugar, *sesame oil,* water, apple cider vinegar,* apple cider,* cayenne powder,* arrowroot,* granulated garlic,* sesame seed,* minced garlic,* green onion,* black pepper*.     * organic	16	oz	7.99	0.5	oz	Meat	Rubs & Marinades	http://goodeggs2.imgix.net/product_photos/712fcqThQAaY9BmMiPqt_20160824-GenuineGrub_KoreanSpiceyBBQ_MG_8617.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	273	\N	\N	\N
997	Akka's Tandoori Marinade	Make an authentic tandoori chicken with no artificial coloring using Akka's Tandoori Marinade! Just add plain yogurt to the marinade and marinate chicken for two hours or longer. Bake, barbeque, or grill to make a flavorful tandoori chicken. Marinade contains fresh lemon juice, ginger, garlic, oil, salt, turmeric, spices.  No artificial coloring or preservatives.Make vegetarian fare like tandoori sweet potato, potato, or cauliflower. Dice or break the vegetable into a small pieces. Coat with Akka's Tandoori Marinade and bake at 400F for about 15 to 20 minutes. Makes an excellent snack or a side dish.Ingredients: lemon juice, ginger, garlic, safflower oil, spices, salt	6.7	oz	10.49	1.57	oz	Meat	Rubs & Marinades	http://goodeggs2.imgix.net/product_photos/qM3nTx3SRZ6RusTVErzw_FK1A2649.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	273	\N	\N	\N
1000	BBQ Sauce	We've been making this highly addictive sauce/dip for ourselves and tinkering with the recipe since 1999. Not just for bbqs, this can be used instead of ketchup and as a general sauce/dip for any kind of meat or vegetables. We use it in sandwiches, as a dip for fries and roasted potatoes, on burgers and hot dogs. You can even make meat loaf with it. One dish we love to make is pulled bbq chicken or turkey sandwichs with coleslaw as they do in North Carolina - search online lots of recipes! If you are vegetarian, it is perfect seasoning for a wide variety of dishes. Just be creative! It is delicious all year round.Not too spicy, but not too mild. It is a perfect combination of spices, heat, sweetness and tang. The complex, addictive flavor is due to our use of more than seven types of chilies and peppers, and many, many spices. Just measuring out all the ingredients takes an hour! Read the rave review by Food & Wine magazine about it.Our bbq sauce is gluten free and contains organic California grown GMO-free tomatoes, processed by Neil Jones in Hollister, California.Ingredients: organic tomatoes, brown cane sugar, organic vinegar, mustard, organic wheat-free soy sauce, spices, garlic, salt.	16	fl oz	6.99	0.44	fl oz	Meat	Rubs & Marinades	http://goodeggs1.imgix.net/product_photos/YlD5s4PcT8q5ojK7E2rQ_FK1A6460.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	233	\N	\N	\N
1001	Prather Ranch BBQ Sauce	Ingredients: Organic tomatoes, organic ketchup, molasses, brown sugar, apple cider vinegar, onions, garlic, jalapenos, salt, distilled white vinegar, smoked paprika, natural liquid smoke, black pepper.Prather Ranch Meat Company's signature BBQ sauce is a perfect compliment for ribs, brisket, wings and pulled pork. Made in house with natural ingredients, it has a perfect smoky, tangy, spicy, sweet balance.	16	fl oz	9.99	0.62	fl oz	Meat	Rubs & Marinades	http://goodeggs1.imgix.net/product_photos/LfRFhs7LStiRmcUNACdF_FK1A9966.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	233	\N	\N	\N
1002	Beef Bones (Frozen)	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. Perfect for bone broth, Pho, really lucky dogs..."Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	2.8	lb	15.39	5.5	lb	Meat	Bones & Offal	http://goodeggs1.imgix.net/product_photos/Z4uOUaFRwijQVAsbdMOE_FK1A6546.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
1003	Pasture Raised Pork Bones (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. Mixed pork bones, great for broth, stew, or dog treats!	2.8	lb	16.19	5.78	lb	Meat	Bones & Offal	http://goodeggs1.imgix.net/product_photos/1LMynNe2QkqaE5PKP1Fj_FK1A0276.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
1004	Natural Smoked Ham Hocks (Frozen)	This smoked ham hock will be a great addition to your pot of beans or soups. They are meaty and have a wonderful, but not too overpowering, smoke on them. Did we mention we sell beans as well? And we've got a killer recipe for Cuban Black Beans and Ham Hocks if you ask us...Ingredients: Llano Seco pork, sea salt, sugar, celery powder, cherry powder, sodium carbonate, and flavorings.Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	1.5	lb	10.49	6.99	lb	Meat	Bones & Offal	http://goodeggs1.imgix.net/product_photos/tjRnOEYzRF2NKRNRUGP4_FK1A7550.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	221	\N	\N	\N
1005	Lamb Bones (Frozen)	Williams Ranches Lamb- from Sonoma County Meat CompanyRaised by the Williams family in the coastal hills of Sonoma County, sheep graze among the abundant wildlife protected by five Great Pyrenees livestock guardian dogs. The Pyrenees guard the sheep from natural predators allowing both to live in harmony with the land.Williams Ranches grows the highest quality lamb, fed on grass, clover and alfalfa with no hormones or antibiotic supplements. The Williams hand select each lamb, determining processing time by the amount of fat cover. This ensures a quality, consistent product that is available year round and lambs that are processed between 5 and 8 months old. This process means you will get a leaner, milder lamb that simply melts in your mouth.	2	lb	15.99	8.0	lb	Meat	Bones & Offal	http://goodeggs1.imgix.net/product_photos/n0Lj0A7BSuA0NpE9kVwS_FK1A6672.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
1006	Pasture Raised Goat Bones (Frozen)	Sonoma Hills Ranch Goat Rib Chop- from Sonoma County Meat CompanyFrom Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	1.75	lb	8.79	5.02	lb	Meat	Bones & Offal	http://goodeggs1.imgix.net/product_photos/5Ctv2OyySXa1uXcHK2Pp_20160426-SonomaCountyMeat_GoatBones_MG_7955.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
1009	Pasture Raised Goat Bones (Frozen)	Sonoma Hills Ranch Goat Rib Chop- from Sonoma County Meat CompanyFrom Sonoma Hills Ranch: Our goats eat a combination of what nature provides on our hillsides supplemented with alfalfa and orchard grass. During the fall they get an abundance of acorns and leaves, and during the spring our hillside meadows produce grasses for them. Other than providing some mineral supplements via goat blocks we don’t add a thing. No antibiotics, no grain, no pellets. Just happy goats eating primarily what nature provides. We raise primarily purebred Boer goats. They originate from South Africa and are considered the premier meat goat due to their stocky structure, weight gain and beautiful meat/fat blend. Goat fat doesn’t marble, unlike beef, but our goats always produce an extremely delicate layer of fat that makes the local chefs super happy.	2.25	lb	11.29	5.02	lb	Meat	Bones & Offal	http://goodeggs1.imgix.net/product_photos/5Ctv2OyySXa1uXcHK2Pp_20160426-SonomaCountyMeat_GoatBones_MG_7955.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	379	\N	\N	\N
1010	Lamb Bones (Frozen)	Williams Ranches Lamb- from Sonoma County Meat CompanyRaised by the Williams family in the coastal hills of Sonoma County, sheep graze among the abundant wildlife protected by five Great Pyrenees livestock guardian dogs. The Pyrenees guard the sheep from natural predators allowing both to live in harmony with the land.Williams Ranches grows the highest quality lamb, fed on grass, clover and alfalfa with no hormones or antibiotic supplements. The Williams hand select each lamb, determining processing time by the amount of fat cover. This ensures a quality, consistent product that is available year round and lambs that are processed between 5 and 8 months old. This process means you will get a leaner, milder lamb that simply melts in your mouth.	2.25	lb	17.99	8.0	lb	Meat	Bones & Offal	http://goodeggs1.imgix.net/product_photos/n0Lj0A7BSuA0NpE9kVwS_FK1A6672.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	372	\N	\N	\N
1011	Pasture Raised Pork Trotters (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. Step up your pork broth game- Tonkotsu Ramen, anyone?	0.5	lb	2.89	5.78	lb	Meat	Bones & Offal	http://goodeggs2.imgix.net/product_photos/PJcAMxaQT0qjQIr8aDAq_FK1A0643.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
1012	Pasture Raised Pork Trotters (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. Step up your pork broth game- Tonkotsu Ramen, anyone?	1	lb	5.79	5.79	lb	Meat	Bones & Offal	http://goodeggs2.imgix.net/product_photos/PJcAMxaQT0qjQIr8aDAq_FK1A0643.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
1013	Pasture Raised Pork Trotters (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. Step up your pork broth game- Tonkotsu Ramen, anyone?	1.5	lb	8.69	5.79	lb	Meat	Bones & Offal	http://goodeggs2.imgix.net/product_photos/PJcAMxaQT0qjQIr8aDAq_FK1A0643.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
1014	Duck Fat	Rendered Duck FatFried potatoes anyone? How about making your own duck confit? Everything's delicious with duck fat!Arrives frozen, keep frozen or refrigerated.Mary’s Free-Range Ducks are beautiful animals to raise. The Pekin Duck are raised naturally in the beautiful weather in California. They live year round with access to outdoors. We watch them everyday to make sure they are comfortable and happy. We make every effort to treat our ducks as humanely as possible throughout the production process. No Antibiotics EverRaised Without Added Hormones*No Preservatives or Additives*Federal Regulations Prohibit The Use Of Hormones In DuckFed a Vegetarian Diet (65% Corn, 25% Soybean Meal, 5% Vitamins and Nutrients, 5% Wheat)	12	oz	11.89	0.99	oz	Meat	Bones & Offal	http://goodeggs2.imgix.net/product_photos/nynEyNm3RuG8AP4PfyDB_20160429-Marys_DuckFat_MG_8482.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	326	\N	\N	\N
1015	Grass-fed Beef Heart (Frozen)	100% Grass-fed and Finished Beef Heart- from Morris Grassfed, San Juan BautistaMorris Grassfed provides 100% grassfed & finished (no antibiotics or added hormones) beef to customers throughout California. Our beef is dry-aged for 21 days, processed in USDA inspected facilities, cut & wrapped by small-scale, artisan butchers and delivered directly to you via Good Eggs.We are an independent, family-owned company. We practice holistic management on the rangelands we manage, taking into account the land, animals, and people affected by our decisions. We invite you to take a tour of our operations here and to learn about the social, ecological and health benefits of 100% grass finished beef.	2.75	lb	21.99	8.0	lb	Meat	Bones & Offal	http://goodeggs1.imgix.net/product_photos/iQG9ToVRDqfmqL4HZAlC_ZXZUei9qR5iP9qOlpnsH_beef-heart-good-eggs0752.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
1016	Pasture Raised Pork Skin (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat Company\nChicharrones!\nSay hello to golden fried pork skin that will satisfy that urge for crunch.\nLeave in sheets for chip-like chunks, OR slice thin and serve on top of pasta,\nsalad, fried eggs, and rice. The sky is the limit with this delectable, local\nproduct. \n\nHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined.	1.8	lb	8.99	4.99	lb	Meat	Bones & Offal	http://goodeggs2.imgix.net/product_photos/OPgkxsVRk2P5kfhB8KSA_FK1A9373.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
1017	Pasture Raised Pork Head	Walnut Keep Farms Pork- from Sonoma County Meat Company\nIf you're looking at this product we imagine you have some ideas of what you might want to do with it, but here's a few anyway- cabeza tacos, headcheese, guanciale, scrapple...\n\nHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined.	18	lb	49.99	2.78	lb	Meat	Bones & Offal	http://goodeggs1.imgix.net/product_photos/KEBlju0dRHyAKjmujQFj_20160527-PigHead_MG_0480%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
1018	Beef Heart (Frozen)	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. A great beginner organ meat, heart is just lean muscle- great pronounced beef flavor, without any of the mineral flavors associated with other organs. Marinate, slice thin and cook to medium rare in a hot pan or on the grill for tacos, or braise low and slow."Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	2	lb	15.99	8.0	lb	Meat	Bones & Offal	http://goodeggs2.imgix.net/product_photos/M3BSgWGREWQaFWRnUZxA_9yS6a6bGQQWsl4Ff0UNS_ZXZUei9qR5iP9qOlpnsH_beef-heart-good-eggs0752.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
1019	Grass-fed Beef Heart (Frozen)	100% Grass-fed and Finished Beef Heart- from Morris Grassfed, San Juan BautistaMorris Grassfed provides 100% grassfed & finished (no antibiotics or added hormones) beef to customers throughout California. Our beef is dry-aged for 21 days, processed in USDA inspected facilities, cut & wrapped by small-scale, artisan butchers and delivered directly to you via Good Eggs.We are an independent, family-owned company. We practice holistic management on the rangelands we manage, taking into account the land, animals, and people affected by our decisions. We invite you to take a tour of our operations here and to learn about the social, ecological and health benefits of 100% grass finished beef.	3	lb	23.99	8.0	lb	Meat	Bones & Offal	http://goodeggs1.imgix.net/product_photos/iQG9ToVRDqfmqL4HZAlC_ZXZUei9qR5iP9qOlpnsH_beef-heart-good-eggs0752.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	332	\N	\N	\N
1020	Pasture Raised Pork Fat (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat Company\nThis fat is\nfor the home cook who wants to add flavor, not just grease. Perfect for\nsausage-making, rendering, or greasing pans and grills. \n\nHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined.	2.8	lb	11.19	4.0	lb	Meat	Bones & Offal	http://goodeggs2.imgix.net/product_photos/ut3ev4mRSCBfjgIuQHiJ_FK1A9356.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
1021	Pasture Raised Pork Heart (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat Company\n\n\nHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined.	1.25	lb	9.99	7.99	lb	Meat	Bones & Offal	http://goodeggs2.imgix.net/product_photos/lQtBOp8PQXO4IG10G3W8_X7CgAVQGTTS7uOdXe30n_UZmwRPmMuD5c-7qLCo3QaufvyozruojkVaGSYhu38mo.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	263	\N	\N	\N
1022	McFarland Springs Trout, Two Fillets	Missing CA Salmon season? Two X Sea offers an incredible alternative to Atlantic farmed salmon- 100% vegetarian fed, CA raised, McFarland Springs trout! A product that truly has to be tasted to be believed, this is a Good Eggs staff favorite.McFarland Springs Trout is delicious and nutritious. And it's more than unique – it is the world’s first deliberate collaboration to responsibly farm sustainable fish. This product is filleted with the skin on for easy cooking on the grill or on the stove. Arrives fresh, not frozen. For recipe ideas check out our website.About our trout:TwoXSea began testing our fishmeal alternative in 2009 to produce a farmed trout using a nearly pure vegetarian diet of algae, and plant-based products. Originally the feed contained approximately 3% fish oil, which has since been completely eliminated to create a farmed trout that is raised on a 100% vegetarian diet. The results we achieved are stunning and a true culinary delight. The beautifully balanced sweet flavor, superior texture and lighter firm flesh almost perfectly mirror that of a wild trout. The Omega 3 levels are higher than that of wild salmon as well.McFarland Springs is an environmental dream. The water supply comes from the headwaters of a natural spring, extremely cold and free of the pesticides and contaminates found in other water sources. The spring not only provides for the trout, but also generates all of the electricity for the farm though hydroelectric. It is raised locally, lowering carbon footprint and further promoting regional cuisine. The fish is hand harvested and processed, instead of machine processed as is customary.Typically, farmed fish are fed fishmeal which is made up of small fish that are being taken from the ocean at alarming rates. These fish are then ground, dried, and fed to many types of farmed fish in order to increase their growth rates. This practice is an environmental catastrophe and not sustainable. Lastly, the flavor and texture is that of wild trout with a sweet flavor and lighter, firm flesh. The extreme cold created by the natural spring creates slow growth rates, but far better texture.Thanks for your support!-Team TwoXSea 	1	lb	18.99	18.99	lb	Fish	What We Love	http://goodeggs1.imgix.net/product_photos/LXZeml1QTIOPS1FvtBZY_mcfarland%20springs%20trout%20fillet%2010-10-12.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	286	\N	\N	\N
1023	Half Pound Fresh Wild Black Cod Fillet	Fresh Wild Black Cod is a very oily, buttery, delicious fish.  Its real name is Sablefish, though some may call it butterfish.  Prepared in Japanese restaurants with miso, mirin, & sake marinade, it is also great marinated in teriyaki or soy sauce.  Best sautéed, baked, or broiled.Black Cod comes from a small number of fishermen in Half Moon Bay, Fort Bragg & occasionally Pier 45 in San Francisco.	0.5	lb	13.99	27.98	lb	Fish	What We Love	http://goodeggs2.imgix.net/product_photos/WefAINjQW6NwPoda6khZ_FK1A9296.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	312	\N	\N	\N
1024	Half Pound Fresh Wild Alaskan Halibut	Alaskan Halibut is a very mild, sweet-tasting, tender, whitefish. Uncooked, the meat should be almost translucent.  When cooked, it turns snow-white.Halibut is an extremely versatile fish, and the thick, meaty flesh holds up well to a number of cooking methods and sauces. It’s also ideal for skewering as kebabs.  Simply add a lemon, garlic &/or butter sauce.  Salt to taste.Halibut is low in saturated fat and sodium and is a very good source of protein, niacin, phosphorus, and selenium.Commercial fishermen predominantly use longlines to harvest halibut.  Only hook-and-line gear is allowed to target halibut.  The impact on the environment is negligible.  The fisheries are managed by The International Pacific Halibut Commission, who sets the catch limits at a level that will ensure the long-term welfare of the halibut stock.	0.5	lb	14.99	29.98	lb	Fish	What We Love	http://goodeggs1.imgix.net/product_photos/UlBd1xt4To2FeaCxlcv7_FK1A6959.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	406	\N	\N	\N
1025	McFarland Springs Trout, Two Fillets	Missing CA Salmon season? Two X Sea offers an incredible alternative to Atlantic farmed salmon- 100% vegetarian fed, CA raised, McFarland Springs trout! A product that truly has to be tasted to be believed, this is a Good Eggs staff favorite.McFarland Springs Trout is delicious and nutritious. And it's more than unique – it is the world’s first deliberate collaboration to responsibly farm sustainable fish. This product is filleted with the skin on for easy cooking on the grill or on the stove. Arrives fresh, not frozen. For recipe ideas check out our website.About our trout:TwoXSea began testing our fishmeal alternative in 2009 to produce a farmed trout using a nearly pure vegetarian diet of algae, and plant-based products. Originally the feed contained approximately 3% fish oil, which has since been completely eliminated to create a farmed trout that is raised on a 100% vegetarian diet. The results we achieved are stunning and a true culinary delight. The beautifully balanced sweet flavor, superior texture and lighter firm flesh almost perfectly mirror that of a wild trout. The Omega 3 levels are higher than that of wild salmon as well.McFarland Springs is an environmental dream. The water supply comes from the headwaters of a natural spring, extremely cold and free of the pesticides and contaminates found in other water sources. The spring not only provides for the trout, but also generates all of the electricity for the farm though hydroelectric. It is raised locally, lowering carbon footprint and further promoting regional cuisine. The fish is hand harvested and processed, instead of machine processed as is customary.Typically, farmed fish are fed fishmeal which is made up of small fish that are being taken from the ocean at alarming rates. These fish are then ground, dried, and fed to many types of farmed fish in order to increase their growth rates. This practice is an environmental catastrophe and not sustainable. Lastly, the flavor and texture is that of wild trout with a sweet flavor and lighter, firm flesh. The extreme cold created by the natural spring creates slow growth rates, but far better texture.Thanks for your support!-Team TwoXSea 	0.75	lb	13.99	18.65	lb	Fish	What We Love	http://goodeggs1.imgix.net/product_photos/LXZeml1QTIOPS1FvtBZY_mcfarland%20springs%20trout%20fillet%2010-10-12.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	286	\N	\N	\N
1026	Anchovy Fillets	Sourced from Italy in partnership with Market Hall FoodsAn Italian pantry would be incomplete without anchovies. One can see immediately the higher quality of this product: small plump, pink Sicilian anchovy fillets which have been cured for over 12 days in salt and marinated in high quality extra virgin olive oil.Use to top a perfectly made pizza, in panini, on crostini and when making any pasta sauce. Ideal to use on salads or any other preparation where the anchovy fillet will be a "star".Ingredients: anchovies, extra virgin olive oil, salt	3	oz	7.99	2.66	oz	Fish	What We Love	http://goodeggs2.imgix.net/product_photos/zDHRJjs9RuaHoO3Qz7Vo_FK1A2503.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	238	\N	\N	\N
1039	Pacific Albacore Tuna (Frozen)	Sushi Grade Pacific Albacore Tuna (Thunnus Alalunga)  - from Sea to Table, troll caught and landed in Bellingham, WA.Albacore is best known as America's highest grade, "white meat" canned tuna. In fact, it's the only tuna meat allowed to be labeled as "white meat." However, it has also developed a reputation out of the can in fresh and frozen markets- Albacore has a mild, rich taste and a firm, steaky texture, with large, moist flakes.	0.5	lb	9.49	18.98	lb	Fish	Fish	http://goodeggs2.imgix.net/product_photos/07CXwyGbQwiOj6F5J337_20160816-SeatoTable_Albacore_MG_8137.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	393	\N	\N	\N
1027	Wild Giant Gulf Shrimp, Head-On	Wild Gulf Coast Shrimp are one of few wild shrimp still available.  These Texas Shrimp are harvested under a sustainable management plan & follow environmentally safe guidelines. The shrimp are firm, with a mild, sweet flavor.Wild shrimp and farmed shrimp will have their own distinctive flavor profile simply because their diet is different.  Wild shrimp have a more varied diet — they feed on marine organisms, different types of plankton, organic matter.  The fish meal pellets that farmed shrimp are fed contain a lot of grains.  The wild diet naturally gives wild shrimp a more robust flavor profile than a farmed shrimp raised on a bland, unvaried diet.The shrimp have shell and head intact, Individually Quick Frozen (IQF), 8-10 per pound, in 1lb packages that can be kept in the freezer for months.For more information on the processor in Galveston, Texas visit www.galvestonshrimpcompany.com	1	lb	23.99	23.99	lb	Fish	What We Love	http://goodeggs2.imgix.net/product_photos/LRlfRShHROOQPwhdMUlE_20160526-OneOcean_HeadonShrimp_MG_0286%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	308	\N	\N	\N
1028	Wild Gulf Shrimp (Frozen)	Wild Gulf Shrimp, 31/40ct, Peeled and Deveined- from BAMA Shrimp Co. through Sea to TableIngredients: Shrimp, Sodium Phosphate, Sodium BisulfiteStore immediately in freezer until ready to defrost. These shrimp were quick frozen at the peak of flavor.Defrosting: For best results, refresh slowly under refrigeration for 8-10 hours or overnight. When fully thawed, cook and enjoy immediately.	0.5	lb	9.99	19.98	lb	Fish	What We Love	http://goodeggs2.imgix.net/product_photos/wEuX3NT0RFqou8MMFeVd_20160816-SeatoTable_Shrimp_MG_8121.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	308	\N	\N	\N
1029	Half Pound Fresh Steelhead Trout	Harvested in Washington's Columbia River, Steelhead Trout is the salmon lovers' alternative fish. Steelhead is so much like salmon in color, taste, and texture that it's sometimes very difficult to tell the difference.Information on Source:PORTLAND, Ore. – April 29, 2013 – The Pacific Seafood Group, a family owned seafood company based in Portland, Ore., is pleased to announce that their Pacific Aquaculture Steelhead Farm on the Columbia River in Washington State has received Best Aquaculture Practices (BAP) certification. This is the first and only Salmon/Steelhead farm to be BAP certified in the U.S.The Best Aquaculture Practices (BAP) standards address environmental and social responsibility, animal welfare, food safety and traceability in a voluntary certification program for aquaculture facilities. BAP certification defines the most important elements of responsible aquaculture and provides quantitative guidelines by which to evaluate adherence to those practices.	0.5	lb	10.99	21.98	lb	Fish	Fish	http://goodeggs2.imgix.net/product_photos/5v92S2UmRjWTLRjxD8wC_FK1A2389.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	286	\N	\N	\N
1030	Fresh Steelhead Trout	Harvested in Washington's Columbia River, Steelhead Trout is the salmon lovers' alternative fish. Steelhead is so much like salmon in color, taste, and texture that it's sometimes very difficult to tell the difference.Information on Source:PORTLAND, Ore. – April 29, 2013 – The Pacific Seafood Group, a family owned seafood company based in Portland, Ore., is pleased to announce that their Pacific Aquaculture Steelhead Farm on the Columbia River in Washington State has received Best Aquaculture Practices (BAP) certification. This is the first and only Salmon/Steelhead farm to be BAP certified in the U.S.The Best Aquaculture Practices (BAP) standards address environmental and social responsibility, animal welfare, food safety and traceability in a voluntary certification program for aquaculture facilities. BAP certification defines the most important elements of responsible aquaculture and provides quantitative guidelines by which to evaluate adherence to those practices.	1	lb	21.99	21.99	lb	Fish	Fish	http://goodeggs1.imgix.net/product_photos/E03KRaalQKuRHyuvSzvV_FK1A9391.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	286	\N	\N	\N
1031	Wild Alaskan Sockeye Salmon Fillet (Frozen)	\nWild Alaskan Sockey Salmon Fillet- from Kenai Red Fish Co., Cook Inlet, AK/Portland, OR.Premium sockeye salmon caught sustainably in the\nwaters of Cook Inlet, AK. Mostly the famous “Kenai Reds”, our salmon gets to dock\nin Homer, AK within hours of being caught and are filleted, vacuum packed and\nflash frozen (-30 degrees). All by local folks and by hand. 	0.5	lb	8.99	17.98	lb	Fish	Fish	http://goodeggs1.imgix.net/product_photos/BuaxE2r9Szqyhms0jxKa_FK1A8868.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	387	\N	\N	\N
1032	Wild Alaskan Sockeye Salmon Fillet (Frozen)	\nWild Alaskan Sockey Salmon Fillet- from Kenai Red Fish Co., Cook Inlet, AK/Portland, OR.Premium sockeye salmon caught sustainably in the\nwaters of Cook Inlet, AK. Mostly the famous “Kenai Reds”, our salmon gets to dock\nin Homer, AK within hours of being caught and are filleted, vacuum packed and\nflash frozen (-30 degrees). All by local folks and by hand. 	0.6	lb	10.99	18.32	lb	Fish	Fish	http://goodeggs1.imgix.net/product_photos/BuaxE2r9Szqyhms0jxKa_FK1A8868.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	387	\N	\N	\N
1033	Wild Alaskan Sockeye Salmon Fillet (Frozen)	\nWild Alaskan Sockey Salmon Fillet- from Kenai Red Fish Co., Cook Inlet, AK/Portland, OR.Premium sockeye salmon caught sustainably in the\nwaters of Cook Inlet, AK. Mostly the famous “Kenai Reds”, our salmon gets to dock\nin Homer, AK within hours of being caught and are filleted, vacuum packed and\nflash frozen (-30 degrees). All by local folks and by hand. 	0.4	lb	7.29	18.22	lb	Fish	Fish	http://goodeggs1.imgix.net/product_photos/BuaxE2r9Szqyhms0jxKa_FK1A8868.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	387	\N	\N	\N
1034	Frozen Wild Salmon Burger Blend	Wild Salmon Burger Blend- Wild Alaskan Coho and Sockeye salmon from Siren Fish Co., ground and blended.A delicious 50/50 blend of wild Coho and Sockeye salmon, lightly ground and perfect for burgers, meatballs, and stir-fry. This quick thawing blend is the perfect foundation for simple, wholesome meals. Add an egg, a few breadcrumbs and handful of fresh herbs for quick and tasty salmon burgers!Thawing Instructions: It is best to thaw our Wild Salmon Burger Blend slowly under refrigeration. Thaw just what you plan on eating. Cut the corner of the bag and place in a bowl inside your refrigerator. Allow the salmon to thaw for 2 to 6 hours. Cook within 24 hours of thawing.	1	lb	10.99	10.99	lb	Fish	Fish	http://goodeggs1.imgix.net/product_photos/iiFWEggTRMeun3YlpJxX_20160630-SirenFish_SalmonBurger_MG_4027.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	409	\N	\N	\N
1035	Fresh Wild Petrale Sole	Fresh Wild Petrale Sole is a kid-friendly, easy to prepare, delicious fish. Local Petrale Sole is caught near the Farallon Islands in San Francisco, in Fort Bragg, and North along the Pacific Coast into Southern Oregon. Petrale Sole is a thin, flaky, delicate, very mild tasting fish. Best sauteed, just add lemon or breadcrumbs.	1	lb	23.99	23.99	lb	Fish	Fish	http://goodeggs2.imgix.net/product_photos/JihXPT3ySouwX2NIodrc_FK1A3977.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	294	\N	\N	\N
1037	Fresh Wild Rock Cod	Fresh Wild Rock Cod (Rockfish/Snapper) is a versatile delicious fish.  Local Rock Cod is caught near the Farallon Islands off the San Francisco Coast & North along the Pacific Coast into British Columbia.  Rock Cod is best on the grill, sauteed, baked, or broiled.  It has a mildly sweet flavor with large flakes that are great for ceviche, fish tacos, fish n' chips. Just add lemon.	1	lb	15.99	15.99	lb	Fish	Fish	http://goodeggs1.imgix.net/product_photos/zMeZiVzSn2rnwjaOWlhE_FK1A6842.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	312	\N	\N	\N
1040	Frozen Wild Sablefish Fillet	Sometimes the freshest seafood comes from\nthe freezer. \nAs soon as fish leaves the water it\nbegins losing freshness. Your average fillet is several days old by the time it\nreaches your plate, and the taste and texture have already suffered. We use\nfreezing to stop time and preserve the freshness of our fish. We seal our fish\nin vacuum bags that protect the fillets from freezer burn. We freeze our\nindividually vacuum packaged fillets quickly and at a low temperature, which\npreserves the texture of the fish. Most importantly, we freeze our fish immediately\nafter it’s caught. Our fish doesn’t travel the world, it’s landed twenty miles\nfrom where it’s filleted and frozen. Thaw exactly the amount you need right\nbefore you need it, and our fish will always taste like it was reeled in\nyesterday. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\nOur\nsablefish are caught off the coast of Northern California by small-scale fishing\nboats using traps. We rush to make sure that the fish are filleted and frozen immediately,\nso that our sablefish tastes like it was caught yesterday. These rich, buttery\nfish are commonly called Black cod, though they are not technically a part of the\ncod family. You can hold these fillets in your freezer for up to one year.\nThawing Instructions: It is\nbest to thaw our Frozen Wild Sablefish Fillets slowly under refrigeration. Thawing\nslowly keeps the fillets firm. Nobody likes mushy fish. Thaw just what you\nplan on eating. Remove fillets from bags and place in a bowl inside your\nrefrigerator. Allow the fillets to thaw for 8 to 12 hours. Cook fillets within\n24 hours of thawing.\n   	0.5	lb	14.99	29.98	lb	Fish	Fish	http://goodeggs2.imgix.net/product_photos/kMzA60HwTXW9RryV9C8b_FK1A0461.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	280	\N	\N	\N
1041	Rockfish Fillet (Frozen)	Pacific Rockfish (Sebastes Spp.)- from Sea to Table, landed in Astoria, ORMarketed widely as Pacific snapper, these fish have fillets that are mild and slightly sweet tasting. The medium texture means means it fits nicely between firm fish (like swordfish) and delicate fish (like sole).Rockfish is not fishy tasting or oily, like sardines or mackerel. Instead, it's clean taste takes on the flavor of the spices you cook with. Rockfish is an easy substitute for almost any other white fish, including tilapia and bass.	0.5	lb	4.99	9.98	lb	Fish	Fish	http://goodeggs1.imgix.net/product_photos/uC1LLUT66FgkFISLMVgD_20160817-SeatoTable_Rockfish_MG_8147.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	280	\N	\N	\N
1042	Half Pound Fresh Wild Alaskan True Cod	Fresh Alaskan True Cod Our True Cod comes from a MSC certified fishery from Kodiak Alaska. It is a sustainable fishery.  The catch method is a combination of Longline and Trap caught.The U.S. Pacific cod fishery is now often hailed as one of the best managed fisheries in the world. A wealth of true cod are caught during the winter and spring months in the gulf of AK. Pacific True Cod are abundant and the fishery is considered by all means sustainable. These True cod are a Monterey Bay Aquarium Seafood Watch “Best Choice” as they are hook-and-line caught.True cod is the original ‘fish ‘n chip’ fish. True cod have a mild and clean flavor with a perfect flake & large white-meat which allows for a variety of preparations. Though often found in fish and chips, cod is at its healthiest baked or broiled. Other cooking methods that work well with this fish include a nice sauté, fry, stew, or chowder. 	0.5	lb	9.99	19.98	lb	Fish	Fish	http://goodeggs1.imgix.net/product_photos/VquLTdUdSlaCGP4T54E0_FK1A6774.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	312	\N	\N	\N
1043	Cured Salmon Roe (Ikura)	Ikura (Cured) Wild Salmon Roe- Loki Fish Co. from Two X SeaSalmon eggs from wild, troll caught fish are a true gift from Mother Nature. Jam packed with Omega 3's & DHA, they are the perfect snack for expecting mothers or anyone looking to boost their health. Enjoy by the spoonful, or serve with sushi, rice or quinoa.Ingredients: Wild Salmon Roe, Salt.From Seattle, WA.Defrost slowly under refrigeration, best if used within 7 days of defrosting.	4	oz	16.99	4.25	oz	Fish	Fish	http://goodeggs1.imgix.net/product_photos/qQ3OnOlnQGeUm6Y8RhyR_twoxsea_salmonroe.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	387	\N	\N	\N
1044	New England Squid	Catch Method: Purse SeineLocation: Point Judith, RIIndividually quick frozen tubes and tentacles.Squid meat has a firm, chewy texture and mild, somewhat sweet flavor. Chefs love it because it's a near-blank canvas for flavor. Squid easily takes on flavors of any marinade or spices added. It can be grilled for healthy preparations or fried for indulgence.Squid will toughen rapidly if it is overcooked, so take caution when preparing. A high cooking temperature and a short cooking time are recommended to keep the calamari tender.	2.5	lb	27.49	11.0	lb	Fish	Fish	http://goodeggs1.imgix.net/product_photos/98mg7GHXTHOXjtUCZ1Yn_twoxsea_squid3%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	363	\N	\N	\N
1046	Wild Gulf Coast Shell-On Shrimp	Wild Gulf Coast Shrimp are one of few wild shrimp still available.  These Texas Shrimp are harvested under a sustainable management plan & follow environmentally safe guidelines. The shrimp are firm, with a mild, sweet flavor.Wild shrimp and farmed shrimp will have their own distinctive flavor profile simply because their diet is different.  Wild shrimp have a more varied diet — they feed on marine organisms, different types of plankton, organic matter.  The fish meal pellets that farmed shrimp are fed contain a lot of grains.  The wild diet naturally gives wild shrimp a more robust flavor profile than a farmed shrimp raised on a bland, unvaried diet.The shrimp have shell intact, Individually Quick Frozen (IQF), 16-20 per pound, in 1lb packages that can be kept in the freezer for months.For more information on the processor in Galveston, Texas visit www.galvestonshrimpcompany.com	1	lb	24.99	24.99	lb	Fish	Shellfish	http://goodeggs1.imgix.net/product_photos/30CuZPheTTypI3KXUm64_FK1A9516.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	308	\N	\N	\N
1047	Frozen Wild Oregon Bay Shrimp	Wild Oregon Bay shrimp are a sweet, simple appetizer with cocktail sauce or a great addition to salads.These shrimp come pre-cooked and frozen.Oregon's pink shrimp fishery has recently been recommended by Monterey Bay Aquarium's Seafood Watch program as a "Best Choice" for environmentally concerned seafood consumers.For more information on the processor:https://www.pacseafood.com/about-us/the-pacific-advantage	1	lb	15.99	15.99	lb	Fish	Shellfish	http://goodeggs2.imgix.net/product_photos/isveFfVxQyzqnNqMpIRO_FK1A9393.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	308	\N	\N	\N
1048	Frozen Half Pound Wild Bay Shrimp	Wild Oregon Bay shrimp are a sweet, simple appetizer with cocktail sauce or a great addition to salads.These shrimp come pre-cooked and frozen.Oregon's pink shrimp fishery has recently been recommended by Monterey Bay Aquarium's Seafood Watch program as a "Best Choice" for environmentally concerned seafood consumers.For more information on the processor:https://www.pacseafood.com/about-us/the-pacific-advantage	0.5	lb	8.49	16.98	lb	Fish	Shellfish	http://goodeggs2.imgix.net/product_photos/isveFfVxQyzqnNqMpIRO_FK1A9393.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	308	\N	\N	\N
1049	Half Pound Wild Gulf Coast Shell-On Shrimp	Wild Gulf Coast Shrimp are one of few wild shrimp still available.  These Texas Shrimp are harvested under a sustainable management plan & follow environmentally safe guidelines. The shrimp are firm, with a mild, sweet flavor.Wild shrimp and farmed shrimp will have their own distinctive flavor profile simply because their diet is different.  Wild shrimp have a more varied diet — they feed on marine organisms, different types of plankton, organic matter.  The fish meal pellets that farmed shrimp are fed contain a lot of grains.  The wild diet naturally gives wild shrimp a more robust flavor profile than a farmed shrimp raised on a bland, unvaried diet.The shrimp have shell intact, Individually Quick Frozen (IQF), 16-20 per pound, in 1/2lb packages that can be kept in the freezer for months.For more information on the processor in Galveston, Texas visit www.galvestonshrimpcompany.com	0.5	lb	12.99	25.98	lb	Fish	Shellfish	http://goodeggs2.imgix.net/product_photos/w3GK6Tf1QDeSQnkICqJC_FK1A9496.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	308	\N	\N	\N
1050	Wild Gulf Shrimp, Peeled and Cleaned	Large (16/20) Wild Gulf ShrimpIngredients: shrimp, sodium bisulfite (to retain color)Catch Method: Mid-water trawlLocation: Montegut, LAVessel: Anna MarieCaptain Lance Nacio is a true innovator when it comes to sustainably harvesting wild White Shrimp from the Gulf of Mexico. He utilizes modified fishing gear that completely eliminates any "bycatch" of turtles or large fish. He also fishes at night, when shrimp are closest to the surface, which keeps his nets from hitting the ocean floor and causing habitat destruction. Captain Lance and his crew have done the hard work of peeling and de-veining, allowing you to focus on preparing the perfect dish and entertaining your lucky guests.	1	lb	29.99	29.99	lb	Fish	Shellfish	http://goodeggs2.imgix.net/product_photos/yRnlroG7Tdi8CyP1Py1h_twoxsea_gulfshrimp.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	308	\N	\N	\N
1051	Hot Smoked Wild King Salmon	Wild local King salmon brined for 24 hours and smoked for two days. Angelo's Meats and Sausage in Petaluma makes this smoked salmon for us using salt and smoke. Angelo is a smokehouse master and has agreed to make small weekly batches for us so that our salmon is always fresh from the smokehouse. It's immediately flash frozen to maintain that freshness and is defrosted the night before delivery to you!This is a hot smoked fillet, so it will not be sliceable but will flake beautifully. Gobble it up as-is or enjoy on top of a bagel with cream cheese or sprinkled on top of a salad.	8	oz	21.99	2.75	oz	Fish	Smoked	http://goodeggs1.imgix.net/product_photos/HTtg4EDqQMm69vH1HD49_FK1A5438.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	387	\N	\N	\N
1052	Smoked Wild Alaskan Sockeye Salmon	This is salmon from what President Obama deemed a "national treasure" - Bristol Bay.  Brined overnight and then lightly smoked with mesquite. This smoked salmon is the perfect balance of sweet, savory and smoky. So addictive that customers dubbed it "salmon crack". Good thing it's so good for you!	4	oz	8.49	2.12	oz	Fish	Smoked	http://goodeggs1.imgix.net/product_photos/6jmKXiF4RGKzh2w0hinD_FK1A8567.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	387	\N	\N	\N
1053	Hot Smoked Sablefish	Wild local sablefish (black cod) brined for 24 hours and smoked for two days. Angelo's Meats and Sausage in Petaluma makes this rich smoked sablefish for us using salt and smoke. Angelo is a smokehouse master and has agreed to make small weekly batches for us so that our salmon is always fresh from the smokehouse. It's immediately flash frozen to maintain that freshness and is defrosted the night before delivery to you!This is a hot smoked fillet, so it will not be sliceable but will flake beautifully. This smoked fish is delicious and very rich. 8 oz. is enough smoked fish to make a main course salad for two to three people. You won't find a better addition to your bagel or salad.	8	oz	21.99	2.75	oz	Fish	Smoked	http://goodeggs1.imgix.net/product_photos/rOxAIaQsS82VCygvoqvr_FK1A5512.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	345	\N	\N	\N
1054	Spicy Hot Smoked Wild King Salmon	Wild local King salmon brined for 24 hours and smoked for two days. Angelo's Meats and Sausage in Petaluma makes this SPICY smoked salmon for us using salt, smoke, and red pepper flakes. Angelo is a smokehouse master and has agreed to make small weekly batches for us so that our salmon is always fresh from the smokehouse. This is a hot smoked fillet, so it will not be sliceable but will flake beautifully. As you can tell by looking at that coating of red pepper flakes on top of the fillet, this stuff is spicy. Gobble it up as-is or enjoy on top of a bagel with cream cheese or sprinkled over scrambled eggs.	8	oz	21.99	2.75	oz	Fish	Smoked	http://goodeggs2.imgix.net/product_photos/GeU7AEqcRECzrZhNZNmi_FK1A5384.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	387	\N	\N	\N
1055	Sweet Hot Smoked Wild King Salmon	Wild local King salmon brined for 24 hours and smoked for two days. Angelo's Meats and Sausage in Petaluma makes this slightly sweet smoked salmon for us using salt, smoke, and brown sugar. Angelo is a smokehouse master and has agreed to make small weekly batches for us so that our salmon is always fresh from the smokehouse. It's immediately flash frozen to maintain that freshness and is defrosted the night before delivery to you!This is a hot smoked fillet, so it will not be sliceable but will flake beautifully. The sweetness of the brown sugar compliments the salmon and makes this a delicious addition to any cheese plate. Gobble it up as-is or enjoy on top of a bagel with cream cheese or sprinkled on top of a salad.	8	oz	21.99	2.75	oz	Fish	Smoked	http://goodeggs2.imgix.net/product_photos/94M4hPTRtKebjBixei0F_FK1A5406.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	387	\N	\N	\N
1056	Smoked McFarland Springs Trout Fillet	McFarland Springs Trout is delicious and nutritious. And it's more than unique – it is the world’s first deliberate collaboration to responsibly farm sustainable fish. This product is smoked fillets prepackaged with the skin on. Great for use as lox for bagels and cream cheese, on a salad, or just by itself. About our trout:McFarland Springs is an environmental dream. The water supply comes from the headwaters of a natural spring, extremely cold and free of the pesticides and contaminates found in other water sources. The spring not only provides for the trout, but also generates all of the electricity for the farm though hydroelectric. It is raised locally, lowering carbon footprint and further promoting regional cuisine. The fish is hand harvested and processed, instead of machine processed as is customary.Typically, farmed fish are fed fishmeal which is made up of small fish that are being taken from the ocean at alarming rates. These fish are then ground, dried, and fed to many types of farmed fish in order to increase their growth rates. This practice is an environmental catastrophe and not sustainable. With higher levels of healthy Omega-3s than wild salmon, and zero trace of mercury or contaminants, McFarland Springs trout provides exceptional nutrition benefits. Lastly, the flavor and texture is that of wild trout with a sweet flavor and lighter, firm flesh. The extreme cold created by the natural spring creates slow growth rates, but far better texture.Thanks for your support!-Team TwoXSea 	1.25	lb	44.99	2.25	oz	Fish	Smoked	http://goodeggs2.imgix.net/product_photos/vOfMSmTTSuiqBP1VjOYP_FK1A8418.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	286	\N	\N	\N
1057	Wild Pacific Sardines in Extra Virgin Olive Oil	Caught in the Pacific Ocean and rated as the Best Choice for Sustainability by the Monterey Bay Aquarium Seafood Watch® Program, these meaty, firm and flavorful whole sardines are loaded with essential nutrients: Omega 3, protein, calcium, phosphorus, potassium and iron. Each tasty little fish is cleaned, scale free and delectable on a sandwich, as a salad topper, or as an ingredient in our Mediterranean Seafood Antipasto Platter or Sardine Power Lunch. Ingredients: Sardines (Sardinops sagax or Sardinops melanostictus), extra virgin olive oil, water, sea salt, aqueous natural smoke	4.375	oz	2.99	0.68	oz	Fish	Canned & Jarred	http://goodeggs1.imgix.net/product_photos/Gp41DsrPRMqCZHNWQMBd_20160621-WildPlanet_SardinesinEVOO_MG_3180.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	384	\N	\N	\N
1058	Wild Caught Premium Albacore	Our albacore are individually caught using a sustainable hook and line method. Each fish is handled with special care to ensure the finest quality product for you. The fish are carefully loined, hand packed, and pressure cooked, ensuring the nutritional quality is maintained. This premium Albacore Tuna is rich in Omega-3s.All of our fish on our boat, Capriccio, are caught by hook and line and then a portion are canned in a small custom cannery in Charleston, Oregon for sale.  At the cannery, the fish are cleaned, put into the can raw, and the can is sealed. Then, the cans are placed in a pressure cooker where the fish is cooked. This single cooking of the fish retains all the natural juices of the albacore in the can!There is nothing else but albacore in our cans of regular albacore….. SO DO NOT DRAIN the liquid, that’s the healthy rich Omega-3 oil! Mix it back into the fish and use for sandwiches, salads, or whatever else your heart desires!Ingredients: Albacore	7.75	oz	7.29	0.94	oz	Fish	Canned & Jarred	http://goodeggs2.imgix.net/product_photos/UgWlUWcxToOZlijlpR1j_FK1A1072.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	378	\N	\N	\N
1059	Solid Albacore Tuna	Delicious premium albacore tuna, sustainably caught using pole & troll fishing methods. It is hand cut and hand packed tuna is firm, meaty and full of flavor. Perfect for tuna salad, tuna pasta sauce or your family's favorite tuna casserole.Ingredients: Albacore tuna, water and sea salt.	4.1	oz	3.79	0.92	oz	Fish	Canned & Jarred	http://goodeggs2.imgix.net/product_photos/5M0LGXDOQtucTgn8OEpw_20160520-SustainableSeas_Albacore_MG_0231.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	393	\N	\N	\N
1060	Wild Pacific Sardines in Water	Caught in the Pacific Ocean and rated as the Best Choice for Sustainability by the Monterey Bay Aquarium Seafood Watch® Program, these meaty, firm and flavorful whole sardines are loaded with essential nutrients: Omega 3, protein, calcium, phosphorus, potassium and iron. Each tasty little fish is cleaned, scale free and delectable on a sandwich, as a salad topper, or as an ingredient in our Mediterranean Seafood Antipasto Platter or Sardine Power Lunch. Ingredients: Sardines (Sardinops sagax or Sardinops melanostictus), water, sea salt.	4.375	oz	2.99	0.68	oz	Fish	Canned & Jarred	http://goodeggs1.imgix.net/product_photos/f6du0IfRFCW9VCAP5sYg_20160621-WildPlanet_SardinesinWater_MG_3193.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	365	\N	\N	\N
1061	No-Salt Added Solid Albacore Tuna	Delicious premium albacore tuna, sustainably caught using pole & troll fishing methods. It is hand cut and hand packed tuna is firm, meaty and full of flavor. Perfect for tuna salad, tuna pasta sauce or your family's favorite tuna casserole.Ingredients: Albacore tuna and water.	4.1	oz	3.79	0.92	oz	Fish	Canned & Jarred	http://goodeggs2.imgix.net/product_photos/RMEGXjnSk6tIPbpYyCey_20160520-SustainableSeas_AlbacoreNoSalt_MG_0238.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	393	\N	\N	\N
1062	No-Salt Added Wild Pink Salmon	The latest addition to our salmon line, new Wild Alaska Pink Salmon with No Salt Added is sustainably caught in the cold, clear Alaskan waters by local fishing families. Our skinless and boneless fillets are hand packed and cooked just once to retain their nutritional potency and natural juices, containing an average of 340mg EPA and DHA Omega 3 per 2oz serving. Our salmon are canned fresh upon catch, not from previously frozen fish. This provides superior rich flavor and soft texture. Wild Planet Pink Salmon is a perfect choice for sandwiches, a flavorful salmon spread and more.Ingredients: Wild pink salmon (Oncorhynchus gorbuscha).	6	oz	4.69	0.78	oz	Fish	Canned & Jarred	http://goodeggs1.imgix.net/product_photos/yiB7yd9xS3qTLxfDxFU2_20160701-WildPlan%20et_CannedSalmonNoSalt_MG_4207.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	387	\N	\N	\N
1063	Wild Alaska Pink Salmon	Wild Alaska Pink Salmon is sustainably caught in the cold, clear Alaskan waters by local fishing families. Our skinless and boneless fillets are hand packed and cooked just once to retain their nutritional potency and natural juices, containing an average of 340mg EPA and DHA Omega 3 per 2oz serving. Our salmon are canned fresh upon catch, not from previously frozen fish. This provides superior rich flavor and soft texture. Wild Planet Pink Salmon is a perfect choice for sandwiches, a flavorful salmon spread and more.Ingredients: Wild pink salmon (Oncorhynchus gorbuscha) and salt.	6	oz	4.69	0.78	oz	Fish	Canned & Jarred	http://goodeggs2.imgix.net/product_photos/NcJLNHGfRQuOOD5IhMME_20160701-WildPlan%20et_CannedSalmon_MG_4214.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	387	\N	\N	\N
1064	Pole Caught Albacore Tuna with Sea Salt	Briny sea salt brings out this sashimi-grade albacore tuna's meatiness while also adding balance. You won't get any sad, mushy tuna salad with this stuff! Combine with chopped celery and shallots, a scoop of sweet relish, mayo and lots of fresh lemon juice.American Tuna has 100% traceability for every single albacore harvested, meaning we can trace our final product back to the vessel that caught it! All tuna are caught using the MSC Certified Sustainable Pole & Line Harvest Method in the U.S. Pacific Northwest. Our premium albacore loin steaks are then hand filleted and hand packed, sealed and pressure-cooked, a packing method that retains 100% of the omega-3 fatty acids in the fish. We don't add any oil, water, soy, or other fish—just premium albacore in its own natural fish oil! Our cans are BPA-free and manufactured in America. Pole and line caught albacore tuna are on average 12-20 lbs, making them naturally low in mercury, and we test yearly for mercury concentrations with Columbia Food Labs. Ingredients: albacore tuna, sea salt.	6	oz	5.99	1.0	oz	Fish	Canned & Jarred	http://goodeggs2.imgix.net/product_photos/OCZb90T7Ska4Vhyt110M_salt.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	393	\N	\N	\N
1065	Pole Caught Albacore Tuna No Salt Added	We don't add any extra salt to these sushi-grade albacore tuna loins so that you can customize them to your heart's content. Try a white bean and tuna salad with sliced fennel, a drizzle of good olive oil, fresh lemon juice and chunky sea salt. American Tuna has 100% traceability for every single albacore harvested, meaning we can trace our final product back to the vessel that caught it! All tuna are caught using the MSC Certified Sustainable Pole & Line Harvest Method in the U.S. Pacific Northwest. Our premium albacore loin steaks are then hand filleted and hand packed, sealed and pressure-cooked, a packing method that retains 100% of the omega-3 fatty acids in the fish. We don't add any oil, water, soy, or other fish—just premium albacore in its own natural fish oil! Our cans are BPA-free and manufactured in America. Pole and line caught albacore tuna are on average 12-20 lbs, making them naturally low in mercury, and we test yearly for mercury concentrations with Columbia Food Labs. Ingredients: albacore tuna.	6	oz	5.99	1.0	oz	Fish	Canned & Jarred	http://goodeggs2.imgix.net/product_photos/XzRFo5YeRU6iNeG1ACsd_nosalt.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	393	\N	\N	\N
1066	Smoked Albacore Tuna with Olive Oil	Smoky and silky, this smoked tuna in olive oil will make all of your Mediterranean salad dreams come true! Just throw a fillet or two on a bed of your favorite greens with some crumbled feta, marinated artichoke hearts, chopped cucumbers, cherry tomatoes and olives.American Tuna has 100% traceability for every single albacore harvested, meaning we can trace our final product back to the vessel that caught it! All tuna are caught using the MSC Certified Sustainable Pole & Line Harvest Method in the U.S. Pacific Northwest. Our premium albacore loin steaks are then hand filleted and hand packed, sealed and pressure-cooked, a packing method that retains 100% of the omega-3 fatty acids in the fish. We don't add any oil, water, soy, or other fish—just premium albacore in its own natural fish oil! Our cans are BPA-free and manufactured in America. Pole and line caught albacore tuna are on average 12-20 lbs, making them naturally low in mercury, and we test yearly for mercury concentrations with Columbia Food Labs. Ingredients: albacore tuna, olive oil.	6	oz	6.79	1.13	oz	Fish	Canned & Jarred	http://goodeggs1.imgix.net/product_photos/wmQ331BmR9mJFoWNNgcT_smoked.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	393	\N	\N	\N
1067	Wild Caught Smoked Albacore	Our albacore are individually caught using a sustainable hook and line method. Each fish is handled with special care to ensure the finest quality product for you. The fish are carefully loined, hand packed, and pressure cooked, ensuring the nutritional quality is maintained. This premium Albacore Tuna is rich in Omega-3s.In our smoked albacore, spices are added before smoking and then we have a small amount of olive oil added in each can to replace the small amount of oil lost in the smoking process. This healthy olive oil can then be mixed back into the fish. Ingredients: Albacore, salt, sugar, olive oil, spices	6.5	oz	7.99	1.23	oz	Fish	Canned & Jarred	http://goodeggs1.imgix.net/product_photos/TmkGy6muRVSc2a5jDA7Q_FK1A1065.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	378	\N	\N	\N
1068	Bonito Del Norte Tuna	One of their most famous product their Bonito Del Norte Tuna, or Albacore Tuna as it is more commonly know as in the states, is line-caught, hand cleaned, and then packaged in fine olive oil. This olive oil perfectly balances out the tuna adding to the flavor and texture. This tuna can be eaten over salads like a Salade Niçoise, atop a crostini garnished with oil, salt, and pepper, on a sandwich, or simply out of the can. Ingredients: White tuna, olive oil, salt.	2.89	oz	6.99	2.42	oz	Fish	Canned & Jarred	http://goodeggs1.imgix.net/product_photos/Kx5Du1nGS1yDr2STW1a7_FK1A7841.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	393	\N	\N	\N
\.


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('products_product_id_seq', 1068, true);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY recipes (recipe_id, url, name, ingredients, img) FROM stdin;
\.


--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('recipes_recipe_id_seq', 1, false);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY tags (tag_id, name) FROM stdin;
1	Certified Organic
2	Locally Grown
3	Synthetic Pesticide & Fertilizer Free
4	Wild
5	Organic Ingredients
6	Locally Sourced Ingredients
7	Heirloom
8	Office Box
9	Aquaponic
10	Non-GMO
11	Eco-Certified
12	Arrives Frozen
13	Dairy Free
14	Raw
15	Vegan
16	Wheat Free
17	Gluten-Free
18	Kosher Certified
19	Paleo
20	Vegetarian
21	Pasture Raised
22	Raised with Non-GMO Feed
23	Animals Raised without rBGH
24	Grass Fed
25	Unpasteurized
26	Pastured
27	Soy Free
28	Arrives Fresh
29	Tree Nut Free
30	Made with Vegetarian Rennet
31	Heritage Breed
32	Nitrate/Nitrite Free
33	Grain Finished
34	Line Caught
\.


--
-- Name: tags_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('tags_tag_id_seq', 34, true);


--
-- Name: customer_recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY customer_recipes
    ADD CONSTRAINT customer_recipes_pkey PRIMARY KEY (cust_rec_id);


--
-- Name: customer_restrictions_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY customer_restrictions
    ADD CONSTRAINT customer_restrictions_pkey PRIMARY KEY (cust_restr_id);


--
-- Name: customers_email_key; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (user_id);


--
-- Name: deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (delivery_id);


--
-- Name: delivery_quantities_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY delivery_quantities
    ADD CONSTRAINT delivery_quantities_pkey PRIMARY KEY (deliv_qty_id);


--
-- Name: dietary_restrictions_name_key; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY dietary_restrictions
    ADD CONSTRAINT dietary_restrictions_name_key UNIQUE (name);


--
-- Name: dietary_restrictions_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY dietary_restrictions
    ADD CONSTRAINT dietary_restrictions_pkey PRIMARY KEY (diet_id);


--
-- Name: icons_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY icons
    ADD CONSTRAINT icons_pkey PRIMARY KEY (icon_id);


--
-- Name: order_quantities_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY order_quantities
    ADD CONSTRAINT order_quantities_pkey PRIMARY KEY (order_qty_id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: pickups_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY pickups
    ADD CONSTRAINT pickups_pkey PRIMARY KEY (pickup_id);


--
-- Name: product_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY product_tags
    ADD CONSTRAINT product_tags_pkey PRIMARY KEY (prod_tag_id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (recipe_id);


--
-- Name: tags_name_key; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_name_key UNIQUE (name);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (tag_id);


--
-- Name: customer_recipes_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY customer_recipes
    ADD CONSTRAINT customer_recipes_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers(user_id);


--
-- Name: customer_recipes_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY customer_recipes
    ADD CONSTRAINT customer_recipes_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id);


--
-- Name: customer_restrictions_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY customer_restrictions
    ADD CONSTRAINT customer_restrictions_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers(user_id);


--
-- Name: customer_restrictions_diet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY customer_restrictions
    ADD CONSTRAINT customer_restrictions_diet_id_fkey FOREIGN KEY (diet_id) REFERENCES dietary_restrictions(diet_id);


--
-- Name: delivery_quantities_delivery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY delivery_quantities
    ADD CONSTRAINT delivery_quantities_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES deliveries(delivery_id);


--
-- Name: delivery_quantities_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY delivery_quantities
    ADD CONSTRAINT delivery_quantities_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(product_id);


--
-- Name: order_quantities_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY order_quantities
    ADD CONSTRAINT order_quantities_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(order_id);


--
-- Name: order_quantities_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY order_quantities
    ADD CONSTRAINT order_quantities_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(product_id);


--
-- Name: orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers(user_id);


--
-- Name: orders_pickup_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pickup_id_fkey FOREIGN KEY (pickup_id) REFERENCES pickups(pickup_id);


--
-- Name: product_tags_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY product_tags
    ADD CONSTRAINT product_tags_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(product_id);


--
-- Name: product_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY product_tags
    ADD CONSTRAINT product_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tags(tag_id);


--
-- Name: products_icon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_icon_id_fkey FOREIGN KEY (icon_id) REFERENCES icons(icon_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

