--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN1';
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
    received_at timestamp without time zone NOT NULL
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
    description text,
    weight numeric,
    unit character varying(50),
    price numeric NOT NULL,
    aisle character varying(50),
    category character varying(50),
    img character varying(500),
    icon_id integer,
    color character varying(10)
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
\.


--
-- Name: customers_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('customers_user_id_seq', 1, false);


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
\.


--
-- Name: icons_icon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('icons_icon_id_seq', 1, false);


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

COPY pickups (pickup_id, name, street_address, zipcode, state) FROM stdin;
\.


--
-- Name: pickups_pickup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('pickups_pickup_id_seq', 1, false);


--
-- Data for Name: product_tags; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY product_tags (prod_tag_id, product_id, tag_id) FROM stdin;
1	311	1
2	292	2
3	292	3
4	292	4
5	211	5
6	211	1
7	211	6
8	163	1
9	163	4
10	163	6
11	12	5
12	12	1
13	12	7
14	12	8
15	12	4
16	658	1
17	658	9
18	0	6
19	0	10
20	398	2
21	398	4
22	398	3
23	283	2
24	283	4
25	283	3
26	246	2
27	246	3
28	246	4
29	156	2
30	156	4
31	156	3
32	129	2
33	129	4
34	129	3
35	85	2
36	85	3
37	85	4
38	61	2
39	61	1
40	61	4
41	499	2
42	499	4
43	499	3
44	329	2
45	329	1
46	329	4
47	202	1
48	202	2
49	202	4
50	165	2
51	165	1
52	165	4
53	130	2
54	130	3
55	130	4
56	103	2
57	103	3
58	103	4
59	29	1
60	29	2
61	29	5
62	29	4
63	25	1
64	25	2
65	25	5
66	25	4
67	23	1
68	23	2
69	23	5
70	23	4
71	11	5
72	11	1
73	11	4
74	11	6
75	2	5
76	2	6
77	2	4
78	1	5
79	1	6
80	1	4
81	33	5
82	33	1
83	33	6
84	22	5
85	22	1
86	22	6
87	446	1
88	446	4
89	259	1
90	259	4
91	189	1
92	189	4
93	139	5
94	139	1
95	139	7
96	139	4
97	139	6
98	139	10
99	139	11
100	70	5
101	70	1
102	68	1
103	16	5
104	16	1
105	16	4
106	16	6
107	595	3
108	595	8
109	595	12
110	595	6
111	540	1
112	540	8
113	540	5
114	540	7
115	540	6
116	300	1
117	300	8
118	300	4
119	104	5
120	104	1
121	104	7
122	104	8
123	104	6
124	205	1
125	205	7
126	205	8
127	205	4
128	107	1
129	107	7
130	107	8
131	107	4
132	80	1
133	80	7
134	80	8
135	80	4
136	80	6
137	66	3
138	66	8
139	66	12
140	66	6
141	52	3
142	52	8
143	52	12
144	52	6
145	9	3
146	9	12
147	9	8
148	9	6
149	24	3
150	24	12
151	24	8
152	24	6
153	18	3
154	18	8
155	18	12
156	18	6
157	32	1
158	32	7
159	32	8
160	32	4
161	38	3
162	38	8
163	38	12
164	38	6
165	27	5
166	27	1
167	27	8
168	27	12
169	51	1
170	51	8
171	51	12
172	51	6
173	14	1
174	14	12
175	14	8
176	14	6
177	5	1
178	5	8
179	5	12
180	5	6
181	309	5
182	309	3
183	309	4
184	309	6
185	37	1
186	37	6
187	8	1
188	8	5
189	8	6
190	111	1
191	111	9
192	111	4
193	111	6
194	45	1
195	45	9
196	45	6
197	45	4
198	20	1
199	20	6
200	20	4
201	30	1
202	30	4
203	28	1
204	28	9
205	28	6
206	28	4
207	19	1
208	19	9
209	19	6
210	19	4
211	17	1
212	17	9
213	17	4
214	17	6
215	4	1
216	4	5
217	3	1
218	3	5
219	13	1
220	13	6
221	13	4
222	15	6
223	15	13
224	164	1
225	164	8
226	164	6
227	270	2
228	270	14
229	270	15
230	270	16
231	270	17
232	270	9
233	173	1
234	102	3
235	102	9
236	102	4
237	93	1
238	54	1
239	168	18
240	21	1
241	21	4
242	21	6
243	132	1
244	117	15
245	117	5
246	117	1
247	117	4
248	105	19
249	60	1
250	60	9
251	60	4
252	58	1
253	58	5
254	58	6
255	58	4
256	134	19
257	119	1
258	119	5
259	119	6
260	119	4
261	114	1
262	114	4
263	75	1
264	75	4
265	73	1
266	73	5
267	73	6
268	73	4
269	7	1
270	7	5
271	7	6
272	7	4
273	69	19
274	40	19
275	83	5
276	83	1
277	83	8
278	83	6
279	56	1
280	56	8
281	55	5
282	55	1
283	55	8
284	55	12
285	55	6
286	368	14
287	368	15
288	368	16
289	368	17
290	368	9
291	306	14
292	306	15
293	306	16
294	306	17
295	306	9
296	314	2
297	314	3
298	314	9
299	314	4
300	235	2
301	235	3
302	235	9
303	235	4
304	179	2
305	179	3
306	179	9
307	179	4
308	144	2
309	144	14
310	144	15
311	144	16
312	144	17
313	144	9
314	144	4
315	144	19
316	131	3
317	131	9
318	131	4
319	81	5
320	81	1
321	81	8
322	81	6
323	118	8
324	118	4
325	74	11
326	74	20
327	47	19
328	39	11
329	39	20
330	89	3
331	89	14
332	89	5
333	89	21
334	89	9
335	89	18
336	89	7
337	89	6
338	89	16
339	89	20
340	48	19
341	6	19
342	65	14
343	65	22
344	65	23
345	65	20
346	41	18
347	41	22
348	41	23
349	41	9
350	35	14
351	35	22
352	35	20
353	36	18
354	36	21
355	31	1
356	31	5
357	31	6
358	31	4
359	26	5
360	26	1
361	26	4
362	2548	2
363	2548	5
364	2426	2
365	2426	5
366	1236	2
367	1236	5
368	1124	5
369	1124	24
370	1082	2
371	1082	5
372	897	2
373	897	5
374	754	5
375	754	24
376	373	2
377	373	5
378	137	25
379	115	2
380	115	5
381	96	25
382	77	5
383	77	24
384	608	2
385	608	5
386	608	26
387	792	5
388	792	24
389	342	2
390	342	5
391	121	2
392	1589	24
393	1514	2
394	880	2
395	880	5
396	297	24
397	4880	2
398	4880	27
399	1151	2
400	1151	5
401	1132	2
402	904	2
403	454	2
404	454	5
405	350	2
406	2086	2
407	2086	5
408	1113	5
409	1113	24
410	88	2
411	88	5
412	440	5
413	242	2
414	242	5
415	2409	5
416	1881	2
417	1881	5
418	1348	2
419	1271	2
420	1271	5
421	959	2
422	386	2
423	386	5
424	523	2
425	523	5
426	356	2
427	308	2
428	308	5
429	308	24
430	193	2
431	193	5
432	176	2
433	176	5
434	122	2
435	122	5
436	247	2
437	247	5
438	230	2
439	230	5
440	870	24
441	502	2
442	338	24
443	145	2
444	145	5
445	98	24
446	1505	2
447	1505	5
448	1080	2
449	806	2
450	806	5
451	455	2
452	455	5
453	277	2
454	277	5
455	215	2
456	215	5
457	979	5
458	264	2
459	2754	2
460	2754	5
461	1216	5
462	1216	24
463	912	2
464	912	5
465	741	2
466	741	5
467	698	2
468	698	5
469	610	2
470	610	5
471	268	2
472	268	5
473	257	2
474	257	5
475	1223	2
476	995	2
477	828	2
478	828	5
479	720	2
480	546	2
481	546	5
482	366	5
483	366	24
484	359	5
485	357	5
486	357	24
487	774	2
488	774	5
489	468	2
490	468	5
491	162	2
492	162	5
493	803	2
494	743	2
495	743	5
496	493	2
497	493	5
498	425	2
499	425	5
500	352	2
501	352	5
502	319	2
503	319	5
504	141	2
505	141	5
506	44	2
507	401	2
508	401	5
509	288	2
510	288	5
511	210	2
512	210	5
513	236	2
514	236	5
515	94	2
516	387	2
517	387	5
518	192	2
519	192	5
520	175	2
521	175	5
522	127	2
523	127	5
524	732	2
525	732	5
526	469	2
527	469	5
528	349	2
529	349	5
530	332	2
531	332	5
532	313	2
533	313	5
534	194	2
535	194	5
536	1446	2
537	1446	5
538	274	2
539	274	5
540	248	2
541	232	2
542	232	5
543	90	2
544	90	5
545	1343	2
546	1343	5
547	495	2
548	495	5
549	324	5
550	324	24
551	324	28
552	296	5
553	296	24
554	296	28
555	220	28
556	220	5
557	167	28
558	167	5
559	120	2
560	120	5
561	221	5
562	221	24
563	221	28
564	95	2
565	95	5
566	113	2
567	113	5
568	231	2
569	231	5
570	184	2
571	184	5
572	146	2
573	146	5
574	100	2
575	100	5
576	1757	2
577	1757	5
578	486	2
579	486	5
580	2670	2
581	2670	5
582	1069	2
583	745	2
584	745	5
585	123	2
586	123	5
587	539	2
588	539	5
589	214	2
590	214	5
591	849	2
592	849	5
593	775	2
594	775	5
595	410	2
596	410	5
597	322	2
598	322	5
599	293	2
600	293	5
601	260	2
602	260	5
603	225	2
604	225	5
605	224	2
606	224	5
607	321	2
608	321	5
609	437	2
610	437	5
611	204	2
612	204	5
613	152	2
614	152	5
615	87	2
616	87	5
617	217	2
618	217	5
619	59	5
620	59	24
621	46	5
622	46	24
623	527	1
624	527	29
625	527	24
626	126	1
627	126	29
628	126	9
629	126	24
630	109	1
631	109	29
632	109	24
633	218	29
634	155	29
635	400	2
636	400	15
637	400	9
638	188	5
639	63	5
640	63	21
641	63	9
642	63	18
643	63	7
644	63	24
645	63	22
646	63	23
647	67	5
648	67	21
649	67	9
650	67	18
651	67	7
652	67	24
653	67	22
654	67	23
655	112	18
656	112	5
657	112	21
658	112	22
659	112	23
660	112	9
661	112	7
662	112	24
663	78	5
664	78	24
665	110	2
666	110	22
667	110	9
668	110	30
669	34	2
670	182	23
671	622	2
672	622	21
673	622	19
674	622	27
675	490	2
676	490	21
677	490	19
678	490	27
679	284	19
680	284	2
681	284	31
682	284	4
683	149	15
684	149	19
685	149	27
686	1063	2
687	1063	21
688	1063	19
689	1063	27
690	762	19
691	762	2
692	762	31
693	762	4
694	590	2
695	590	21
696	590	19
697	590	27
698	487	19
699	487	2
700	487	31
701	487	4
702	169	2
703	169	30
704	169	13
705	148	2
706	148	30
707	148	13
708	151	2
709	151	4
710	151	19
711	151	31
712	151	27
713	456	2
714	456	21
715	456	19
716	101	19
717	101	2
718	101	31
719	101	4
720	79	15
721	79	19
722	434	19
723	434	2
724	424	2
725	424	19
726	424	27
727	341	2
728	341	19
729	275	19
730	275	2
731	275	31
732	275	4
733	226	19
734	226	21
735	1853	2
736	1853	5
737	1853	24
738	1853	4
739	1279	2
740	1279	6
741	1136	4
742	1136	13
743	838	2
744	838	5
745	838	6
746	838	4
747	416	2
748	416	6
749	196	4
750	196	13
751	190	2
752	190	24
753	190	4
754	190	13
755	150	16
756	150	9
757	150	13
758	635	2
759	635	4
760	635	19
761	635	31
762	635	27
763	316	2
764	316	4
765	316	19
766	316	31
767	281	2
768	106	2
769	726	2
770	726	4
771	726	19
772	726	31
773	726	27
774	212	2
775	212	21
776	197	2
777	197	4
778	197	19
779	197	31
780	197	27
781	174	2
782	174	27
783	171	2
784	171	27
785	159	18
786	159	15
787	159	22
788	159	23
789	159	9
790	159	31
791	133	21
792	133	18
793	133	16
794	133	22
795	133	23
796	124	19
797	124	2
798	124	9
799	97	19
800	97	2
801	97	9
802	42	2
803	42	9
804	42	19
805	92	2
806	92	21
807	91	2
808	91	27
809	57	2
810	572	19
811	572	2
812	299	8
813	299	31
814	227	2
815	227	19
816	227	27
817	302	2
818	302	16
819	258	14
820	258	18
821	258	16
822	180	14
823	180	22
824	180	16
825	62	2
826	62	14
827	62	31
828	62	9
829	62	20
830	82	14
831	82	30
832	82	16
833	82	22
834	250	18
835	250	14
836	250	22
837	250	23
838	250	16
839	250	30
840	250	32
841	116	14
842	116	22
843	116	16
844	116	30
845	185	21
846	185	18
847	185	20
848	49	2
849	49	21
850	273	21
851	272	21
852	143	21
853	64	6
854	64	19
855	198	31
856	198	21
857	198	33
858	200	19
859	200	23
860	147	2
861	147	21
862	138	23
863	191	27
864	71	2
865	71	21
866	71	31
867	380	19
868	294	19
869	294	27
870	72	19
871	72	5
872	348	19
873	348	2
874	348	21
875	335	19
876	335	2
877	335	31
878	335	4
879	84	33
880	50	8
881	50	6
882	50	19
883	474	32
884	154	31
885	154	21
886	154	33
887	287	2
888	287	14
889	287	22
890	287	23
891	287	9
892	223	2
893	223	18
894	223	14
895	223	22
896	223	23
897	223	9
898	140	2
899	140	14
900	140	9
901	140	18
902	140	22
903	140	23
904	327	5
905	327	3
906	327	7
907	262	7
908	157	3
909	157	7
910	157	25
\.


--
-- Name: product_tags_prod_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('product_tags_prod_tag_id_seq', 910, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY products (product_id, name, description, weight, unit, price, aisle, category, img, icon_id, color) FROM stdin;
311	Chicken Apple Sausage (Frozen)	Ingredients: Hormone free boneless skinless chicken thighs, applesauce, maple syrup, oats, cinnamon and spices (no nitrates or preservatives).  Lamb casing ,Kid favorite, mild. Suggested cooking instructions: Add  approx.1/4 inch of water to a skillet or shallow sauce pan, place sausages in covered pan and bring to a boil. Steam for approximately 5 minutes, pour off excess water. Add small amount of oil or butter, lower heat and cook until skins are brown. Enjoy!	1	lb	10.99	Meat	What We Love	goodeggs1.imgix.net/product_photos/30BhA8hzTW6QwVTgmq1l_4o4j-dkPSCOPMN1VXz8UmKV3oLXH6rDCC04ogtUzap0.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
292	Organic Whole Chicken	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	3.5	lb	13.99	Meat	What We Love	goodeggs2.imgix.net/product_photos/wF0xk1L8TLS4zwnuPBrU_FK1A3556.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
211	Pasture Raised Pork Sausage, Bulk (Frozen)	Pasture Raised Pork Sauasage, No Casing- from Simas Swine and Wine in the Capay ValleyGrab some winter squash and start stuffing!A mild sausage with an awesomely rich pork flavor, equally great for both breakfast patties and pasta sauce, probably the most versatile sausage in our lineup!Ingredients: Pork, Water, Salt, Black Pepper, Spices and Crushed Red Pepper.Pasture raised Berkshire cross hogs from the Capay Valley.	1	lb	11.99	Meat	What We Love	goodeggs1.imgix.net/product_photos/mQ6pA8HSVi8cMnhGFiis_FK1A8581.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
163	Pasture Raised Honey Lavender Bacon (Frozen)	Handcrafted with lavender in small batches, Sonoma County Meat Co. brings you your new favorite bacon. Slightly sweet with just the tiniest hint of lavender, this bacon has got to be tasted!Prepare yourself for the wonder of our locally hand-made bacon now using 100% Duroc pork, also known as "red pig." This heritage breed originated in the U.S. in the 1800s. It is a cornerstone for charcuterie in niche markets from California to Spain. Our bacon is made with pork that is farmed humanely with outdoor access and vegetarian diets; no gestation crates, no antibiotics, no hormones, no growth promotants, and no animal byproduct feeds.Ingredients: Pasture Raised Pork, Sugar, Salt, Granulated Honey, Lavender Powder, Spices, Sodium Nitrite"Heritage breed pigs prance to create this bounty, free-ranging outdoors, raised by farmers who respect this land profoundly. Dry cured, hickory smoked, by the valiant team in Sonoma County. Fill your plate, clap your hands, for this bacon we share proudly."	0.75	lb	11.49	Meat	What We Love	goodeggs1.imgix.net/product_photos/ePo7iwRoCusyDsu0Gxwh_FK1A5370.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
12	Crosscut Beef Shanks (Frozen)	Braise away!  Take your time, fill your home with beautiful aromas and enjoy mouth-watering 100% locally-grown Morris Grassfed beef and gravy during the winter.  The perfect comfort food. The chuck roast is the perfect pot roast, and the short ribs and shanks are bone-in, which adds additional depth to the taste and nutritional value to your meal.Morris Grassfed provides 100% grassfed & finished (no antibiotics or added hormones) beef to customers throughout California. Our beef is dry-aged for 21 days, processed in USDA inspected facilities, cut & wrapped by small-scale, artisan butchers and delivered directly to you via Good Eggs.We are an independent, family-owned company. We practice holistic management on the rangelands we manage, taking into account the land, animals, and people affected by our decisions. We invite you to take a tour of our operations here and to learn about the social, ecological and health benefits of 100% grass finished beef.	1.25	lb	11.49	Meat	What We Love	goodeggs2.imgix.net/product_photos/3TE831reRUyGm0cdiBGs_beef_shank.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
658	Ground Dark Meat Turkey (Frozen)	100% dark meat ground turkey for optimal flavor- sub for beef or pork in all your favorite recipes!BN Ranch White Broad Breasted Turkeys possess the classic mild flavor of turkey, but with all the benefits of BN Ranch's humane, environmental, and quality standards. Our broad breasted turkeys are fed a Non-GMO Project Verified diet of vegetarian feed formulated for a slower, more natural growth pattern. The turkeys are raised in a free-range environment with plenty of room to roam outdoors from the time they are six weeks old. Raised to the highest standards of humane care and environmental consideration, BN Ranch Broad Breasted turkeys redefine this Thanksgiving staple.	1	lb	9.49	Meat	Poultry	goodeggs2.imgix.net/product_photos/HKDmWd7aQAmqjT9FJBto_FK1A3435.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
0	Smoked Turkey Breast (Frozen)	Smoking Goose Smoked Turkey Breast is all natural, free range birds. Brined in organic herbs and spices and smoked over fruit woods. This subtly smoked turkey has texture and body yet remains juicy. It tastes like you are thinly carving turkey right off the bone! Perfect for that "Thanksgiving-style" sandwich!All Smoking Goose recipes begin on the farm. They carefully curate farm sources based on research, site visits, flavor, and personal relationships with farmers. The base requirements for all Smoking Goose farm sources: Small Family Owned Farm, No factory Farms, No Gestation Pens,  Antibiotic Free, 100% Vegetarian Feed, No Growth Promotants, Humanely Slaughtered. Source codes printed in the bottom right corner of each smoking goose package. To find out more about the farm please visit their Raw Resource Sheet.Ingredients: Whole breast of turkey, thyme, cloves, orange peel.	6.49	lb	144.99	Meat	Poultry	goodeggs2.imgix.net/product_photos/XGeJDRltQFOvx9ofAOMv_20160914-SmokingGoose_WholeTurkey_MG_1004.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
4	Boneless Pork Shoulder Roast (Frozen)	These were for made low and slow.  Carnitas anyone?  Pulled Pork Sandwich?  You've found what you've been looking for.Our sows are Yorkshires crossed on either a Duroc or Berkshire boar. The\n sows are pastured along with their piglets until the piglets are \nweaned. The weaned piglets are then finished with whole milk, whole \ngrain breads, brewers grain, and tortillas, producing what we believe to\n be a superior product.	2.5	lb	19.99	Meat	Pork	goodeggs2.imgix.net/product_photos/WU2E3TK4TbiiZ7CWKvIg_oiIrpkwVEmQU8F85rrBKWt170Y_C2gxCqRD2dI-RARM.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
398	Organic Boneless Skinless Chicken Thighs	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1	lb	7.99	Meat	Poultry	goodeggs1.imgix.net/product_photos/lKAJdhWHTCwUgmM5sxAN_FK1A3473.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
283	Organic Whole Chicken Thighs	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1.5	lb	8.99	Meat	Poultry	goodeggs1.imgix.net/product_photos/ow7lddMASXOPpD5IoX55_FK1A4030.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
246	Organic Whole Chicken Thighs	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1.25	lb	7.49	Meat	Poultry	goodeggs1.imgix.net/product_photos/d7Ru4o1IRLaursDlxqGp_FK1A4030.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
156	Organic Boneless Skinless Chicken Thighs	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1.25	lb	9.99	Meat	Poultry	goodeggs1.imgix.net/product_photos/lKAJdhWHTCwUgmM5sxAN_FK1A3473.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
129	Organic Whole Chicken Legs	Organic Free Range Chicken LegsMary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1.5	lb	7.49	Meat	Poultry	goodeggs1.imgix.net/product_photos/TazKHmZETwmGUpEuOc2j_FK1A3464.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
3	Boneless Pork Shoulder Roast (Frozen)	These were for made low and slow.  Carnitas anyone?  Pulled Pork Sandwich?  You've found what you've been looking for.Our sows are Yorkshires crossed on either a Duroc or Berkshire boar. The\n sows are pastured along with their piglets until the piglets are \nweaned. The weaned piglets are then finished with whole milk, whole \ngrain breads, brewers grain, and tortillas, producing what we believe to\n be a superior product.	3.25	lb	28.99	Meat	Pork	goodeggs2.imgix.net/product_photos/WU2E3TK4TbiiZ7CWKvIg_oiIrpkwVEmQU8F85rrBKWt170Y_C2gxCqRD2dI-RARM.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
85	Organic Whole Chicken Legs (Fresh)	"This Memorial Day I'm looking forward to grilling these chicken thighs and covering them in Prather Ranch's BBQ Sauce!" Darren, Good Eggs Sourcing ManagerOrganic Free Range Chicken LegsMary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1.25	lb	6.29	Meat	Poultry	goodeggs1.imgix.net/product_photos/TazKHmZETwmGUpEuOc2j_FK1A3464.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
61	Organic Chicken Drumsticks (Frozen)	Individually Quick Frozen DrumsticksMary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	2	lb	9.99	Meat	Poultry	goodeggs2.imgix.net/product_photos/KU98MEoATmwGWenNlQus_20160701-Marys_IQFDrumsticks_MG_4269-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
499	Organic Boneless Skinless Chicken Breasts	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1.25	lb	11.89	Meat	Poultry	goodeggs1.imgix.net/product_photos/lKAJdhWHTCwUgmM5sxAN_FK1A3473.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
329	Organic Boneless Skinless Chicken Breasts (Frozen)	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	2	lb	17.99	Meat	Poultry	goodeggs2.imgix.net/product_photos/DYyR3ZrwTpSvxJTvXsUv_FK1A6571.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
202	Organic Chicken Breast Tenders (Frozen)	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	2	lb	17.99	Meat	Poultry	goodeggs1.imgix.net/product_photos/ecWdJsMjReyKo0trRQZs_Good%20Eggs_111515-16.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
165	Organic Ground Chicken (Frozen)	Free-Range Organic Ground Chicken, 95% Lean- from Mary'sGround chicken from Mary's! 95% lean ground chicken, no added fat or skin and as you would expect from Mary's: no antibiotics ever, no preservatives, gluten free, non-GMO Project Verified, and certified USDA Organic.	1	lb	9.49	Meat	Poultry	goodeggs2.imgix.net/product_photos/pspKw6X9QqMMxxyH6TKJ_FK1A5379.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
130	Organic Bone-In Skin-On Chicken Breasts	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1	lb	7.99	Meat	Poultry	goodeggs1.imgix.net/product_photos/pPLivv1ITjq68SdMeurq_FK1A3719.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
103	Organic Boneless Skinless Chicken Breasts	Mary's Free-Range Chickens are produced by Pitman Farms, a family owned business that has been raising poultry for three generations. Mary's Free Range Chickens grow naturally with plenty of open space on a ranch in sunny California. These chickens are raised in a humane manner by allowing them to roam in a stress-free environment that is four times the size of the average commercial ranch. Because of cleaner living quarters, a healthier and happier chicken is produced having a better taste.All chickens have access to outdoors. Outdoor areas include ample water and shade Natural behaviors are enriched with:bales of straw (used for pecking)eucalyptus tree branches (used for playing and hiding).Mary's Free-Range Organic Air Chilled Chickens are an additional step up the ladder in humane farming practices; with freedom to move about and a premium diet void of any chemical stimulators.Certified Organic feeds must be Certified by the USDA and everything that goes in them must be certified as well. Mary's Organic Chicken feed does not contain any of the following:NO Animal By ProductsNO Genetically Modified Organisms (GMOs)NO Antibiotics NO Pesticide Treated GrainsNO Grains Grown with Chemical Fertilizers NO Synthetic Amino Acids	1.5	lb	14.19	Meat	Poultry	goodeggs2.imgix.net/product_photos/m1PPbhmR2uDnY2pDDbY1_FK1A3473.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
29	Organic Duck Breast (Frozen)	Mary’s Free-Range Ducks are beautiful animals to raise. The Pekin Duck are raised naturally in the beautiful weather in California. They live year round with access to outdoors. We watch them everyday to make sure they are comfortable and happy. We make every effort to treat our ducks as humanely as possible throughout the production process. No Antibiotics EverRaised Without Added Hormones*No Preservatives or Additives*Federal Regulations Prohibit The Use Of Hormones In DuckFed a Vegetarian Diet (65% Corn, 25% Soybean Meal, 5% Vitamins and Nutrients, 5% Wheat)	1	lb	19.99	Meat	Poultry	goodeggs1.imgix.net/product_photos/edH5YHnGQ3WJgm2bGRMj_FK1A6307.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
25	Organic Whole Duck Legs (Frozen)	Mary’s Free-Range Ducks are beautiful animals to raise. The Pekin Duck are raised naturally in the beautiful weather in California. They live year round with access to outdoors. We watch them everyday to make sure they are comfortable and happy. We make every effort to treat our ducks as humanely as possible throughout the production process. No Antibiotics EverRaised Without Added Hormones*No Preservatives or Additives*Federal Regulations Prohibit The Use Of Hormones In DuckFed a Vegetarian Diet (65% Corn, 25% Soybean Meal, 5% Vitamins and Nutrients, 5% Wheat)	0.8	lb	8.69	Meat	Poultry	goodeggs2.imgix.net/product_photos/g9U4TxZgSVeLKWHlp8oA_FK1A6310.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
23	Organic Whole Duck (Frozen)	Mary’s Free-Range Ducks are beautiful animals to raise. The Pekin Duck are raised naturally in the beautiful weather in California. They live year round with access to outdoors. We watch them everyday to make sure they are comfortable and happy. We make every effort to treat our ducks as humanely as possible throughout the production process. No Antibiotics EverRaised Without Added Hormones*No Preservatives or Additives*Federal Regulations Prohibit The Use Of Hormones In DuckFed a Vegetarian Diet (65% Corn, 25% Soybean Meal, 5% Vitamins and Nutrients, 5% Wheat)	4	lb	35.69	Meat	Poultry	goodeggs2.imgix.net/product_photos/0F5NUIOTSXGAVj1HDqek_FK1A6364.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
11	Pasture Raised Pekin Duck (Frozen)	Pasture Raised Pekin DuckOur ducks have been raised in our orchard, in batches of 50 per “duck schooner” with lots of green grass and a wading pool. Their diet is a certified GMO free grain mix that includes organic corn, peas, wheat, barley, distillers grains and the minerals and vitamins they need to grow, along with wheat sprouts and the planted forages in the orchard including wheat, rye, and peas. They are harvested at 7 1/2 weeks, and frozen immediately for optimum freshness. Young duck is the most decadent poultry you will ever eat. The meat is moist, tender and will flake off the bone. The skin is crispy. The fat is melt in your mouth delicious. The broth made from the bones is better than chicken broth. Don’t forget to reserve the fat in your baking dish to fry up some potatoes. We fried up some delicious baby German potatoes from our garden to eat with our roast duck, along with a spring pasta salad we made with rocket arugula, easter egg radishes, marinated in our apricot vinegar and olive oil. Try a duck today, you’ll be glad you did! (Don’t be intimidated by all those fancy recipes on the internet. I roasted ours just like a chicken.) - says Rachel, Casa Rosa Farms	3.75	lb	29.99	Meat	Poultry	goodeggs2.imgix.net/product_photos/lMYXnoLQQAWxrFbFVtEC_20160701-CasaRosa-Duck_MG_4234.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
2	Pasture Raised Duck (Frozen)	Whole Pasture-Raised Duck, free of GMOs, corn, soy, and antibiotics.  Healthy, happy ducks raised on the beautiful coast just a short drive South of San Francisco.Each duck is cryo-vac'd and flash-frozen to preserve the highest quality and freshness.Early Bird ducks are a truly gourmet treat.  Their life on our fertile pastures gives their rich and tender meat deep flavors, making these ducks a perfect example of the exceptional food that the beautiful coastal pastures south of San Francisco can produce.  This is a seasonal product, once it's gone, it's gone!  Early Bird ducks live outside in mobile pasture shelters that are moved every day onto fresh grasses that haven't been grazed by poultry for at least a full year. They have constant access to water, and enjoy splashing and bathing several times a day.To help them grow, we supplement their diet with a high-quality feed free of GMOs, corn, soy, and antibiotics. Their healthy outdoor lifestyle and balanced and diverse diet produces a tender, juicy, and flavorful bird that will be the highlight of any meal!	3.5	lb	31.49	Meat	Poultry	goodeggs1.imgix.net/product_photos/u15znALOShKHoo5ULngz_FK1A4104.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1	Pasture Raised Duck (Frozen)	Whole Pasture-Raised Duck, free of GMOs, corn, soy, and antibiotics.  Healthy, happy ducks raised on the beautiful coast just a short drive South of San Francisco.Each duck is cryo-vac'd and flash-frozen to preserve the highest quality and freshness.Early Bird ducks are a truly gourmet treat.  Their life on our fertile pastures gives their rich and tender meat deep flavors, making these ducks a perfect example of the exceptional food that the beautiful coastal pastures south of San Francisco can produce.  This is a seasonal product, once it's gone, it's gone!  Early Bird ducks live outside in mobile pasture shelters that are moved every day onto fresh grasses that haven't been grazed by poultry for at least a full year. They have constant access to water, and enjoy splashing and bathing several times a day.To help them grow, we supplement their diet with a high-quality feed free of GMOs, corn, soy, and antibiotics. Their healthy outdoor lifestyle and balanced and diverse diet produces a tender, juicy, and flavorful bird that will be the highlight of any meal!	4	lb	35.69	Meat	Poultry	goodeggs1.imgix.net/product_photos/u15znALOShKHoo5ULngz_FK1A4104.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
33	Pasture Raised Whole Chicken (Frozen)	Pasture Raised Whole Chicken- from A4 Farms in Santa Rosa, through Sonoma County Meat Co.Whole chickens, perfect for roasting in the oven, spatchcocking and throwing on the grill, or cutting up and using in a soup or stew (or maybe even buttermilk fried chicken? I know, sounds good, right?) These chickens are the conventional "Cornish Cross" breed, so they'll have the proportions most folks are used to these days with all the benefits of being raised on pasture! A4 Farms has deep roots in Santa Rosa; with a longtime family farming history that has included hops, prunes, hay, cattle, and now pasture-raised farm fresh chickens. Jessica and Brian are committed to raising chickens outside and free with no antibiotics, and no hormones. They forage on grasses, and bugs, with access to high quality feed containing essential vitamins and minerals to keep the chickens healthy and vigorous.	2.75	lb	27.49	Meat	Poultry	goodeggs1.imgix.net/product_photos/O3MofGzCR4aGt2998CIw_chicken_spring.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
22	Pasture Raised Whole Chicken (Frozen)	Pasture Raised Whole Chicken- from A4 Farms in Santa Rosa, through Sonoma County Meat Co.Whole chickens, perfect for roasting in the oven, spatchcocking and throwing on the grill, or cutting up and using in a soup or stew (or maybe even buttermilk fried chicken? I know, sounds good, right?) These chickens are the conventional "Cornish Cross" breed, so they'll have the proportions most folks are used to these days with all the benefits of being raised on pasture! A4 Farms has deep roots in Santa Rosa; with a longtime family farming history that has included hops, prunes, hay, cattle, and now pasture-raised farm fresh chickens. Jessica and Brian are committed to raising chickens outside and free with no antibiotics, and no hormones. They forage on grasses, and bugs, with access to high quality feed containing essential vitamins and minerals to keep the chickens healthy and vigorous.	2.5	lb	24.99	Meat	Poultry	goodeggs1.imgix.net/product_photos/O3MofGzCR4aGt2998CIw_chicken_spring.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
446	Uncured Rustic Bacon (Frozen)	This is the same famous, sugar-free, uncured Rustic\nBacon found at our farmers’ markets: brined with sea salt and hickory smoked\nwithout added nitrites. This is pure, savory bacon at its finest. Sliced and\nready for breakfast, a BLT or pasta. Ingredients: Pork, Water, Sea Salt, Cultured Celery Juice	0.75	lb	10.69	Meat	Bacon	goodeggs2.imgix.net/product_photos/TqqFaON9QmOFSkNDULLx_FK1A5774.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
259	Uncured Smoked Maple Bacon (Frozen)	This is the same popular, delicious, uncured sliced Maple\nBacon found at our farmers’ markets: brined with sea\nsalt and real, organic maple syrup, then hickory smoked with no added\nnitrites. This maple bacon has a classic flavor and aroma that is delicious\npaired with breakfast or savory dishes.  Ingredients: Pork, Water, Organic Evaporated Cane Syrup, Sea Salt, Organic Maple Syrup, Cultured Celery Juice	0.75	lb	11.29	Meat	Bacon	goodeggs1.imgix.net/product_photos/ynxIEhpRQewbezCWg1gL_FK1A5745.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
189	Hardwood Smoked Bacon (Frozen)	Handcrafted with maple sugar in small batches, this bacon is a personal favorite, not just because of the flavor but because it is sliced reasonably thick and retains some chew and texture after being crisped up in the skillet (cast iron, start it cold, flip once).Prepare yourself for the wonder of our locally hand-made bacon now using 100% Duroc pork, also known as "red pig." This heritage breed originated in the U.S. in the 1800s. It is a cornerstone for charcuterie in niche markets from California to Spain. Our bacon is made with pork that is farmed humanely with outdoor access and vegetarian diets; no gestation crates, no antibiotics, no hormones, no growth promotants, and no animal byproduct feeds.Ingredients: Pork, Water, Sugar, Sea Salt, Maple Sugar, Spices, Sodium Erythorbate, Sodium Nitrite.	0.75	lb	8.99	Meat	Bacon	goodeggs1.imgix.net/product_photos/vx2WVpJRMKSNeiEVHAth_FK1A5363.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
139	Uncured Sugar-Free Bacon (Frozen)	Truly uncured, Paleo-friendly bacon. Made from pasture raised Walnut Keep pork belly, no sugar, nitrites or nitrates added, no celery juice powder, no nothing. Just pure smoked porky goodness.Ingredients: Pork, Salt, Spices, "Sliced bacon, artisanally made in Sonoma County.""Here's the story of a lovely lady, and a very handsome butcher man.Established in 2014, with a valiant team, they make the best meats in the land.Wood smoked in the most amazing smokehouse, fill your plate, clap your hands."	0.75	lb	11.99	Meat	Bacon	goodeggs2.imgix.net/product_photos/Je193VuQTyGHlSYo7sUn_Pork_Bacon1.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
70	Smoked Maple Bacon (Frozen)	If you're looking for that classic bacon flavor, sweet and savory that just hits that bacon spot, congratulations, you've found your new best friend.  DG-Langley Farms is proud to offer our Maple Sugar bacon.  This is what real bacon tastes likes folks.Our sows are Yorkshires crossed on either a Duroc or Berkshire boar. The\n sows are pastured along with their piglets until the piglets are \nweaned. The weaned piglets are then finished with whole milk, whole \ngrain breads, brewers grain, and tortillas, producing what we believe to\n be a superior product.Ingredients: Pork, Salt, Cane & Maple Sugars, Celery PowderNatural Bacon, No Nitrates	0.75	lb	12.79	Meat	Bacon	goodeggs2.imgix.net/product_photos/d4BYkvqYQlSREIJCH2jF_gSQBG6aK_Dq3hTMBCsiTGBm16p8SsZOE4N3zY9sZhAc.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
75	Bockwurst (Frozen)	PRMC’s Bockwurst is a traditional Munich-style Weisswurst\n(white sausage), made with milk, eggs and fresh spices including Italian\nparsley and cinnamon. The fine mousse is a perfect pair with your favorite\nhigh-quality mustard, a crusty roll, and of course, a stein of Bavarian\nbeer.  Kids love this one too – It is a\ntrue staff favorite. Arrives fully cooked for easy prep. \n \nIngredients: Pork\n(Food Alliance Certified), Milk, Water, Eggs, Sea Salt, Organic Evaporated Cane\n	0.75	lb	7.49	Meat	Sausage	goodeggs1.imgix.net/product_photos/A5icPzRORva7zZB400mg_FK1A0954.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
68	Smoked Pepper Bacon (Frozen)	This is the bacon that changed everything.  With it's cult-like following at the Farmer's Markets, we are proud to offer you our Smoked Pepper Bacon.  Thick cut, lots of fat (which of course you keep to cook your veggies in) and quite possibly the best bacon ever.  Our sows are Yorkshires crossed on either a Duroc or Berkshire boar. The\n sows are pastured along with their piglets until the piglets are \nweaned. The weaned piglets are then finished with whole milk, whole \ngrain breads, brewers grain, and tortillas, producing what we believe to\n be a superior product.Ingredients: Pork, Salt, Cane & Maple Sugars, Pepper, Celery PowderNatural Bacon, No Nitrates	0.75	lb	11.49	Meat	Bacon	goodeggs1.imgix.net/product_photos/TU7YLRzcRJiXfjbpqRPA_NHrp9OyCq2Fm75VdkEtleov4rmg3ojXg_p9JqKB0FeM.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
16	Guanciale (Frozen)	Jowl bacon- the king of all bacons, the classic ingredient to many an Italian dish (Carbonara anyone? all'Amatriciana?), guanciale adds that silky smooth feel and beautiful porky flavor to your pasta sauce. Or just fry some for breakfast, that's cool too.Ingredients: Pork, Sea Salt, Cane & Maple Sugars, Celery Powder.	0.3	lb	8.99	Meat	Bacon	goodeggs1.imgix.net/product_photos/0gbApB3cQDK6CVZWhwHB_unspecified.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
595	Ground Beef	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. "Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."Best if used or frozen within 11 days of the "packed on" date printed on the package.	1	lb	7.99	Meat	Beef	goodeggs2.imgix.net/product_photos/akGxv23jQeKoLTmASkfY_Beef_Ground_05.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
540	Grass-fed Ground Beef (Frozen)	Our son, Jack, orders a hamburger if it's on the menu, no matter where he is. Raised on a cattle ranch and eating good meat his whole life, this kid knows his ground beef. Although some have come close, Jack claims he has yet to find one that beats a Morris Grassfed burger (and as anyone with teenagers knows, he's got a mind of his own, and would not be afraid to offend us!) Grilled outdoors on your barbecue, or made into delicious sauces, chili, meat loafs or casseroles, you just can't beat locally-raised 100% Morris Grassfed Beef. Raised & finished on pastures of the Central Coast of California and dry aged for 14-21 days. We aim for a fat content of 10-15%.	1	lb	9.99	Meat	Beef	goodeggs2.imgix.net/product_photos/JAGD7J64SbyGBQNGxiI7_NlrWW_i2w_z_Owya9Vw__7CMctrSLnsaWlxMlYtj584.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
300	Ground Beef (Frozen)	Prather Ranch Meat Company is proud to offer our legendary Prather Ranch\nground beef at Good Eggs. Prather Ranch ground beef is known far and wide for\nits exceptional flavor (even our ground beef is dry-aged!), quality, and single\nanimal traceability. The grind is 85/15 lean to fat. Once you try it you’ll be hooked! Prather beef is grass fed and \nbarley/alfalfa hay finished, then dry-aged for 16-21 days. Certified Humane Raised and Handled, GMO free, and Food Alliance Certified.	1	lb	8.99	Meat	Beef	goodeggs2.imgix.net/product_photos/Y3EMJRBmQbOvlMt568aQ_FK1A4975.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
104	Grass Fed Beef Burger Patties (Frozen)	Our delicious 1/4 lb burger patties are now available just in time for sunny weather. Roll out that bbq, grab a beer and get grilling!(4) 1/4 lb burgers in a pack. We raise our Limousin steers on certified organic rotational pasture and native grasslands within 2 hours of the Bay Area in the beautiful Capay Valley. We take the time to alfalfa finish all our animals. We truly believe that in order for consistency in a grass fed, grass-finished product, each producer must choose the best method for their farm and its local ecology. We grow our own pesticide free, non-GM alfalfa on our family's fields to produce high quality beef. You will find our farm's beef to be a very lean red meat with light marbling, yet extra tender. Our beef is dry-aged for a minimum of 16 days, flash frozen, and vacuum sealed. We are a certified USDA Grass Fed Producer and our farm and pastures are certified organic by CCOF. Follow us on our new Instagram feed @casa_rosa_farm and see how our animals really live.	1	lb	12.99	Meat	Beef	goodeggs2.imgix.net/product_photos/zHhKdpqTU2ZW5aVw8KmA_Beam1U1OTXO8H3qLy8Dg_EiyGkbFGV9EDK6gV8Z4hfCqi-O30OOClDhYyBagPtA0.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
205	Fajita Meat (Frozen)	One of our go-to favorites, this stir fry meat is great and easy to sautée. It works well with a favorite marinade or simply garnished with a little salt and pepper. Certified Humane Raised and Handled and GMO-free.	0.7	lb	10.49	Meat	Beef	goodeggs1.imgix.net/product_photos/iEpnjysRHSoaK0r4UaGC_FK1A2681.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
107	Filet Mignon (Frozen)	Looking for\nthe most tender, lean, delicious steak available? Prather Ranch Filet Mignon is the\nticket. Filet lovers all over the Bay Area come to our farmers markets to pick\nup our filets - the perfect combination of dry-aged tenderness, flavor and low\nfat. Prather beef is grass fed and \nbarley/alfalfa hay finished, then dry-aged for 16-21 days. Certified Humane Raised and Handled, GMO free, and Food Alliance Certified.	0.5	lb	14.49	Meat	Beef	goodeggs1.imgix.net/product_photos/LsCsq2RMRMylLRE6eJt9_FK1A4861.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
80	Grass-fed Chuck Steak (Frozen)	100% Grass-fed and Finished Chuck Eye SteakPRATHER RANCH MEAT CO is proud to introduce Lost Coast Grass-Fed Beef into its repertoire of high quality, sustainably and humanely raised meat offerings.Lost Coast Grassfed beeves are raised on the lush grass pastures of Humbolt County they are 100% grassfed and finished, and are never treated with hormones or antibiotics.	0.7	lb	6.99	Meat	Beef	goodeggs1.imgix.net/product_photos/y8M6X99Q6ShGT01sX0VU_FK1A7974.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
66	Fajita Beef	Fajita/Stir Fry Beef- Oakridge Angus Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. Thin cut strips of top round cook up quickly for an easy meal- fajitas, stir fry, or steak tacos, great with a quick marinade or sprinkling of your favorite rub or herb mixture, this a great candidate for a nice hot cast iron pan or wok."Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	1	lb	11.99	Meat	Beef	goodeggs1.imgix.net/product_photos/hZvIc29HS1OmAqQNpKay_iEpnjysRHSoaK0r4UaGC_FK1A2681.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
52	Carne Asada	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. \nSliced by\nhand for ease of cooking and to maximize the surface area for your favorite\nspice mix! Cut into strips, douse in spices and use in tacos, fajitas, and\nburritos. \n\n"Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	0.9	lb	10.79	Meat	Beef	goodeggs2.imgix.net/product_photos/d1YOp4UbQaORRyVRmpkz_FK1A4381.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
9	Filet Mignon Steak	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. "Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	0.7	lb	19.59	Meat	Beef	goodeggs1.imgix.net/product_photos/5TwObZpMQ5u8dnoX8MQX_FK1A4517.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
24	Filet Mignon Steak	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. "Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	0.8	lb	22.39	Meat	Beef	goodeggs1.imgix.net/product_photos/5TwObZpMQ5u8dnoX8MQX_FK1A4517.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
18	Ribeye Steak	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. The perfect steak for the grill, or sear in hot pan and finish off in the oven to a perfect medium rare."Oak Ridge Angus raises premium grass-fed grain-finished beef in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi in 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pasture raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	0.75	lb	17.19	Meat	Beef	goodeggs2.imgix.net/product_photos/wZbqS4IkSnK91Knsi0pP_FK1A4653.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
32	Ribeye (Frozen)	It’s no wonder why Prather Ranch Rib-Eyes have become a\nBay Area steak lover’s dream. Prather beef is grass fed and barley/alfalfa hay finished, then dry-aged for 16-21 days. Well marbled and tender, these steaks are simply addicting. Certified Humane Raised and Handled, GMO free, and Food Alliance Certified.	0.75	lb	17.99	Meat	Beef	goodeggs1.imgix.net/product_photos/1YMCFzdQ5KzVft5Ui1VA_FK1A4836.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
38	Ribeye Steak	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. The perfect steak for the grill, or sear in hot pan and finish off in the oven to a perfect medium rare."Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	1	lb	22.99	Meat	Beef	goodeggs2.imgix.net/product_photos/wZbqS4IkSnK91Knsi0pP_FK1A4653.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
27	New York Steak (Frozen)	Tender and richly marbled, the New York steak is a classic\ncut. Simply season and grill to perfection.	0.75	lb	18.79	Meat	Beef	goodeggs2.imgix.net/product_photos/Xnyn88ukRWCDBfTkLS5G_Prather%20New%20York%20Steak.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
51	New York Steak	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. The NY Steak- deliciously flavorful, even cooking, impressive yet simple. Salt and pepper, a few minutes per side on a hot grill or pan, let it rest and you're all set!"Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."Best if used or frozen within 11 days of the "packed on" date printed on the package.	0.8	lb	15.99	Meat	Beef	goodeggs2.imgix.net/product_photos/UbQ7pgEwStWlRS2Qc12e_FK1A4438.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
53	Marinated Maui Ribs (Frozen)	Prather Ranch Dry-Aged\ncross-cut short ribs are marinated in soy sauce, toasted sesame oil, ginger and\nred chili paste.  Grill them quickly over high heat to a\nperfect medium-rare. Great for parties, this item is a summer classic.\nIngredients: Prather Ranch\nDry-Aged Cross-Cut Short Ribs, Soy Sauce, Toasted Sesame Oil, Ginger, Sugar,\nChili Paste, Scallions.	2	lb	21.99	Meat	Beef	goodeggs1.imgix.net/product_photos/acEYOC3RIiQV79OG19dh_FK1A6953.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
14	Beef Shanks (Frozen)	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. \nThe\nquintessential braising dish! With a beautiful round of femur in the center\npacked full of succulent marrow, this cut packs two flavor punches in one\npackage!\n\n"Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	0.9	lb	9.49	Meat	Beef	goodeggs1.imgix.net/product_photos/lMuB7fDTGmQZoZfknpiF_FK1A4468.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
5	Korean Cut Short Ribs (Frozen)	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co. The summer version of short ribs! Marinate (equal parts soy, sugar, rice wine + some ginger and garlic, or try this awesome recipe: http://cooking.nytimes.com/recipes/1014547-korean-style-short-ribs) and throw on a hot grill for a minute or two on each side and you've got dinner!"Oak Ridge Angus raises premium grass-fed grain-finished beef raised in Knights Valley, just outside Calistoga. Started as a dairy by Massimino LaFranchi 1912, the family sold their award winning Aryshires in 1974 and bought the first generation of the Angus herd they raise now. Pature raised on the rolling hills of northern California, and finished with only spent beer grain, 100% barley from the Bear Republic in Cloverdale; no corn, no antibiotics, no hormones of any kind.This is truly a local, sustainable protein."	2.1	lb	27.29	Meat	Beef	goodeggs1.imgix.net/product_photos/bBGbdgiQuOJNvelBHTVI_20160617-SonomaMeatCo_KoreanShortRibs_MG_3008.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
309	Pasture Raised Ground Pork	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. Ground pork- perfect for meatballs, meatloaf, potstickers, wontons, pasta sauce, and on and on...	1	lb	5.99	Meat	Pork	goodeggs2.imgix.net/product_photos/gVayrCaQfynKa8txTvqe_FK1A7934.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
37	Avocado Fed Ground Pork (Frozen)	Our goal at Stepladder Avocado Fed Pork is to create Hog Heaven. Our heritage Gloucester Old Spots roam 200 acres of forest with incredibly low density, and no fences. They are chaperoned by our livestock guardian dog, Gus, and free to forage, root, and just be happy pigs. They return to a small paddock in a gulch where they find water, a small amount of non-GMO, vegetarian grain ration, and all of the avocados we find on the ground of our orchards.  Heritage pigs have slightly smaller cuts than modern breeds, but the marbling and fat content makes up for it ten-fold.	1	lb	12.99	Meat	Pork	goodeggs2.imgix.net/product_photos/6fse32HRSQCQyBHl5hat_F1PS6rffS0y8PvkI2GB8_FK1A8581.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
8	Pasture Raised Ground Pork (Frozen)	Ground Pork from pasture raised pigs!Pasture raised Berkshire cross hogs from the Capay Valley.	1	lb	9.99	Meat	Pork	goodeggs1.imgix.net/product_photos/m3bqQ2QiSgmxiB419XL6_Pork_Ground_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
111	Thin-Cut Pork Chops (Frozen)	These heritage pork chops are juicy, flavorful and easy to\ncook. These are the perfect chops to have on hand for a quick delicious meal.\nNon-GMO Project Verified and Food Alliance Certified.	0.75	lb	9.59	Meat	Pork	goodeggs2.imgix.net/product_photos/hxRmlun7TLuJUjvDiqz3_FK1A4930.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
45	Thick-Cut Pork Chop (Frozen)	From Non-GMO verified heritage pigs, these\npork chops are bone-in, thick, juicy, flavorful and easy to cook. Cut 2”-thick,\nthey are great for the grill, skillet or oven. \n\nNon-GMO Project Verified and Food Alliance\nCertified	0.75	lb	9.59	Meat	Pork	goodeggs1.imgix.net/product_photos/xWmUo7IgSPK2jMP05Er9_FK1A5582.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
20	Bone-In Pork Chops (Frozen)	This pork chop is tender and flavorful, the "other red meat" as we like to say. Whether its put on the grill, the skillet, or in the oven, you're in for a treat. Our pork's fat is supple and full of just as much, if not more, flavor than the meat...be sure not to cut it off before cooking! Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	1.5	lb	19.19	Meat	Pork	goodeggs2.imgix.net/product_photos/SGrrcmmQki7JIfXxDByX_chop.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
30	Pork Tenderloin (Frozen)	Roast this baby in your oven slow and low and surround with your favorite vegetables to caramelize. Make a salsa verde of fresh parsley, mint, arugula and the like, with garlic, lemon juice and olive oil to garnish your lovely loin roast. Slice thin and wow your drooling dinner guests. Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	1	lb	19.99	Meat	Pork	goodeggs2.imgix.net/product_photos/ShbXuh60RPe4ZHJfP8Ly_uJ4TVbCJQuKZ5SDxAYSY_8gmO20za25aZWwqKLqxGYn-3RkvR3F7860NKJL8NABk.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
28	Picnic Roast (Frozen)	The Picnic Roast can be used in place of Boston\nButt for great stew, carnitas or pulled pork. The Picnic is also a\nstaff favorite for an amazing grill or oven roast—very juicy and delicious! Sit\naround the smoker on a Saturday, or throw it in your slow cooker, rotisserie or\noven for easy week-day cooking. \n\nNon-GMO Project Verified and\nFood Alliance Certified.	2.25	lb	17.99	Meat	Pork	goodeggs1.imgix.net/product_photos/KGisUryrTE1bdVTHfbbg_FK1A7603.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
19	Boston Butt (Frozen)	From Non-GMO Project verified heritage pigs,\nthis super juicy Boston Butt shoulder roast is perfect for the slow-cooker or smoker.\nBoston Butt is a great choice for carnitas, stews, pulled pork or any other\nlow-and-slow pork shoulder recipe. \nNon-GMO Project Verified and\nFood Alliance Certified	2	lb	17.99	Meat	Pork	goodeggs1.imgix.net/product_photos/AkQ8pVaXRXwxyNE4oXIA_FK1A7651.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
17	Spare Ribs (Frozen)	From our Non-GMO Project verified heritage pork program, our spare ribs are uniquely meaty and juicy: Grill ‘em, bake ‘em,\nbraise ‘em or smoke ‘em—you know how to do it. \n\nNon-GMO Project Verified and\nFood Alliance Certified.	1.6	lb	11.19	Meat	Pork	goodeggs1.imgix.net/product_photos/rudWjkOHRfmsEUH7mSA5_FK1A8536.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
338	Bulk Valencia Oranges	Valencia Oranges are the ultimate off-season citrus. They produce in the summer, while most citrus fruits in the winter. They're a lower acid, high sugar citrus that are great for juicing.	5	lb	9.99	Produce	Fruit	goodeggs2.imgix.net/product_photos/M5daQVkRQHS4b5Az3mrw_20160708-BernardRanch_Valencia_5lb_MG_4972.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
13	Spare Ribs (Frozen)	Anytime of the year these will be a hit.  Our spare ribs are tender and juicy with so many ways to prepare them: we like to dry rub with a mix of salt, cayenne, sugar and fennel, or leave overnight with oil, citrus and fresh herbs.  Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	3.5	lb	20.99	Meat	Pork	goodeggs1.imgix.net/product_photos/dIDSDbWHR4SLJfEExrp9_spare%20rib.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
15	Guanciale	Heavily spiced with bay leaves, garlic, juniper berries, sea salt, brown sugar and black peppercorns, these cured hog jowls bring a rich flavor and more dense texture than their belly-cut cousin, pancetta.All Smoking Goose recipes begin on the farm. They carefully curate farm sources based on research, site visits, flavor, and personal relationships with farmers. THe base requirements for all Smoking Goose farm sources: Small Family Owned Farm, No factory Farms, No Gestation Pens,  Antibiotic Free, 100% Vegetarian Feed, No Growth Promotants, Humanely Slaughtered. Source codes printed in the bottom right corner of each smoking goose package. To find out more about the farm please visit their Raw Resource Sheet. Ingredients: pork jowl, bay leaves, juniper berries, garlic, black peppercorns	8	oz	14.29	Meat	Pork	goodeggs2.imgix.net/product_photos/bOkPeOOQOKMGYeLz3oip_20160415-SmokingGoose_Tasso_MG_6978.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
164	Grassfed Ground Lamb (Frozen)	Anderson Ranches raises their grass fed lamb for longer periods of time, providing higher quality meat. The lamb is never given antibiotics or hormones. The ranch maintains a low carbon footprint by having the lamb processed at their own facility- which also provides minimal stress for the animals. Humane Certified Raised and Handled.	1	lb	12.99	Meat	Lamb	goodeggs1.imgix.net/product_photos/kKRhIP3PRjBWrxX2Mtg4_9d3nU8dfQpiRydBRlMbA_cnSSrTQVq0OXkPWrKSkQ_J7KkwAKgSTqcDwlrtwjq_FK1A7449.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
270	Organic Chicken Apple & Wildflower Honey Sausage	Slightly sweet with chunks of tender apple and whispers of wildflower honey, our organic chicken sausages are always the perfect pick.\n\nThese organic chickens are raised on family\nfarms, like Merlyn Bender’s in Humbolt, Nebraska.  He grew up on a farm,\nas had his parents, and appreciated the family values the livelihood provided.\nWhen it comes to animal welfare, Merlyn focuses on food, lighting, air, and\nwater. He provides his chickens with high-quality organic feed; allows the\nbirds to get at least eight hours of dark nighttime rest; provides proper\nventilation in barns to keep the air clean; and ensures a consistent clean\nwater supply. When weather permits, the chickens range outdoors, which he finds\nenhances health and well-being. Merlyn feels good about farming organically and\nthe opportunity it provides to produce good pure foods.\nIngredients: Organic Chicken, Water, Organic Dried Apples, Organic Honey, Organic Apple Juice Concentrate, 2% or Less of: Sea Salt, Organic Evaporated Cane Syrup, Organic Spices, Organic Onion Powder, Celery Powder, Sodium Lactate.	0.625	lb	4.39	Meat	Sausage	goodeggs2.imgix.net/product_photos/H0OZBFbzTaKTjkAnPOnY_20160409-TrueStory_AppleWildflowerSausage_MG_6029.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
173	Spicy Fennel Chicken Sausage (Frozen)	Ingredients: hormone free boneless skinless chicken thighs, fennel seed, aniseed, cayenne peppers, chilis, parsley. (No nitrates or preservatives). Pork casing, spicy!Suggested cooking instructions: Add  approx.1/4 inch of water to a skillet or shallow sauce pan, place sausages in covered pan and bring to a boil. Steam for approximately 5 minutes, pour off excess water. Add small amount of oil or butter, lower heat and cook until skins are brown. Enjoy!Excellent grilled as well !	1	lb	10.99	Meat	Sausage	goodeggs1.imgix.net/product_photos/ryfhiV7lRNmtWus0OnYH_6R0NwO4KKqyTiWUtvNzjHDEeHWs5gy67e_eWQc7paIE.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
102	Turkey Chorizo	Turkey Chorizo: Our Diestel Turkey Chorizo is delicious in a breakfast burrito, casserole, or even just grilled up with veggies! We’ve developed a special seasoning blend that gives our chorizo a nice kick without it being too spicy. It’s versatile, and we know you’ll love it for breakfast, lunch, or dinner!Ingredients: Turkey, water, spices, vinegar, sea salt, granulated garlic and onion powder.Real Turkey AttributesGluten FreeNo artificial ingredients or preservativesNo hormones, antibiotics, or growth stimulantsPure ground turkeyThoughtfully and humanely raised on GAP rated farmsGreat texture and flavor-the way turkey should taste!	16	oz	6.49	Meat	Sausage	goodeggs2.imgix.net/product_photos/u8thBuORR3ebzXKJdGty_FK1A9373.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
93	Spinach Mozzarella Chicken Sausage	Ingredients: Hormone free boneless skinless chicken thighs, spinach, mozzarella cheese, spice blend (no nitrates, or preservatives) Pork casing. Mild and Kid approved!Suggested cooking instructions: Add  approx.1/4 inch of water to a skillet or shallow sauce pan, place sausages in covered pan and bring to a boil. Steam for approximately 5 minutes, pour off excess water. Add small amount of oil or butter, lower heat and cook until skins are brown. Enjoy!Excellent grilled as well!	1	lb	10.99	Meat	Sausage	goodeggs2.imgix.net/product_photos/Hgi4oBxqRJuvgClzXMTV_poht3A1EMQekYZpz0IQbMllHXkqZtevA7nhY_e_WDN0.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
54	Artichoke & Mushroom Chicken Sausage (Frozen)	Ingredients: Hormone-free boneless skinless chicken thighs, porcini mushrooms, artichoke hearts, garlic, onion, spice blend. Pork casing (No preservatives or nitrates.)Suggested cooking instructions: Add  approx.1/4 inch of water to a skillet or shallow sauce pan, place sausages in covered pan and bring to a boil. Steam for approximately 5 minutes, pour off excess water. Add small amount of oil or butter, lower heat and cook until skins are brown. Enjoy!Excellent for grilling as well !	1	lb	10.99	Meat	Sausage	goodeggs2.imgix.net/product_photos/JPajTl2IRSmDNB1sh2aq_xQ88UrQ5vet0xMr7Ek695lXAt95DBR1xxgLrt-L-qsA.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
168	Uncured Beef Hot Dogs (Frozen)	Naturally cured with celery and salt, we worked hard and long to make a\ngreat tasting hot dog using only the highest quality meat, organic spices and\nno nitrites. THESE DOGS ARE REAL FOOD! Found at our farmers market, retail shop\nand local restaurants, we have upped our dog production to offer this popular\nitem at Good Eggs. We hope you love them as much as we do. Ingredients: Beef, Sea Salt, Organic Evaporated Cane Juice, Organic Paprika, Organic Spices, Organic Garlic, Cultured Celery Juice	1	lb	8.49	Meat	Sausage	goodeggs1.imgix.net/product_photos/YfmKJ3arRzyBy1gRdCoK_FK1A4753.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
21	Bacon Hot Dogs (Frozen)	Ingredients: Pork, Water, Bacon (Pork, water, sea salt, brown sugar, cherry powder, Turbinado sugar, natural flavoring) sea salt, spices, celery powder, turbindado sugar, sodium carbonate, natural flavoring, in a sheep casing.Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	0.75	lb	7.49	Meat	Sausage	goodeggs1.imgix.net/product_photos/tSMJY38JSo2vmNQhXXAb_FK1A8101.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
132	Apple Bacon Sausage (Frozen)	This is PRMC’s famous breakfast sausage. Made with our own\nmaple bacon, apples and organic spices these links are the perfect combination\nof sweet and smoky for your family’s breakfast table. These links arrive fully\ncooked, so just defrost and heat! Be careful though—they’re truly addicting!Ingredients: Pork (Food Alliance Certified), Water, Uncured\nMaple Bacon (Pork, Water, Organic Evaporated Cane Syrup, Sea Salt, Organic\nMaple Syrup, Cultured Celery Juice) Unsulfured Evaporated Apples, Apple Juice\nConcentrate, Sea Salt, Organic Spices, in Natural Pork Casing	0.75	lb	7.49	Meat	Sausage	goodeggs1.imgix.net/product_photos/F2ltLZdJRwumdL7iKzzf_FK1A0924.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
117	Breakfast Sausage, Bulk (Frozen)	The morning has never been so enjoyable. A slight sweetness is paired with our unctuous porky flavor to make the perfect accompaniment to your eggs, pancakes, oatmeal...Ingredients: Llano Seco Pork, Sea Salt, Paprika, and Spices.Our pigs are a cross of Duroc and Yorkshire breeds. Our hogs are fed GMO-free, vegetarian grains and legumes, 80% of which are grown on the Rancho. Pigs are raised in deep-bedded hoop barns with continual access to large open air pastures with plenty of sunshine and a great view of the California Buttes. All animals are confinement-free for 100% of their lives, humanely treated with best practices certified by Global Animal Partnership. Our pigs are never fed antibiotics or growth hormones. Llano Seco Pork is the culmination of our mission to provide a variety of products while caring for the people, the animals and the land. We pride ourselves in our holistic approach to ranching.	0.75	lb	5.79	Meat	Sausage	goodeggs1.imgix.net/product_photos/yrUIKjHtRaWsx0b0XG85_llanoseco_breakfastsausage.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
105	Pork Breakfast Sausage	Our Breakfast Sausage contains 100% pork seasoned with fresh sage and real Grade B (which is best) maple syrup.There are six, 2oz sausages per package.Product is fully cooked. INGREDIENTS: Pork shoulder, pork fatback, salt, milk powder, white and black pepper, ginger, mustard powder, nutmeg, sage, maple syrup.	0.75	lb	5.99	Meat	Sausage	goodeggs2.imgix.net/product_photos/Ecf2tqhaQVixiswfUazB_FK1A6843.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
76	Whiskey Maple Sage Sausage (Frozen)	These fully cooked sausages are made with real whiskey and a\ntouch of maple, but aren't too sweet. Combined with sage and other organic spices\nthese delicious links are versatile and great for breakfast, lunch or dinner. One\nof our most popular market picks. \nIngredients: Pork, Whiskey, Brown Sugar, Sea Salt, Maple\nSyrup, Black Pepper, Sage, Nutmeg, Cayenne Pepper, in Natural Pork Casing	0.75	lb	7.49	Meat	Sausage	goodeggs2.imgix.net/product_photos/DQGpSGdTScP8dpSkklsU_FK1A0892.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
60	Turkey Breakfast Sausage (Frozen)	Start your morning off right with Diestel Sausage. Our savory blend of herbs is delicious, and our sausage packs a lean protein punch to power you through the day. Diestel Breakfast Sausage is delicious with eggs or in a breakfast burrito. You can also make breakfast patties with it. For a brunch specialty, try our Diestel Turkey Breakfast Sausage Strata.Ingredients: Turkey, water, sea salt, spices, and turbinado (unrefined sugar)Real Turkey AttributesGluten FreeNo artificial ingredients or preservativesNo hormones, antibiotics, or growth stimulantsPure ground turkeyThoughtfully and humanely raised on GAP rated farmsGreat texture and flavor-the way turkey should taste!	16	oz	7.29	Meat	Sausage	goodeggs1.imgix.net/product_photos/Xl6AmV4eQnO6dJUdrVXd_FK1A9378.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
58	Pasture Raised Pork Breakfast Sausage (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. Ingredients: Walnut Keep Pork, Salt, Sugar, Sage, Sweet Smoked Paprika, Black PepperA savory breakfast sausage with well balanced spices where the pork flavor shines through and the sage is the predominant spice- would be great in an omelette, breakfast scramble, burrito, or frittata.	0.7	lb	8.49	Meat	Sausage	goodeggs2.imgix.net/product_photos/gZH0dvHQRfavKEy4F3AG_FK1A9440.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
134	Smoked Pork Kielbasa	Our smoked kielbasa contains 100% pork seasoned with mustard seed, garlic, and spices. We smoke these over applewood for hours, so they have a nice smokey flavor. Product is fully cooked. We like to slice it up and put it in a pan with our greens, so the fat and flavors season up the greens.  Serve that up with some mustardy potato salad, Oh Baby!INGREDIENTS: Pork, pork fat back, salt, dextrose, nitrite, milk powder, white and black pepper, mustard powder and seeds, garlic.	0.75	lb	6.79	Meat	Sausage	goodeggs1.imgix.net/product_photos/gSHwGhyyThWQKPIfm4qd_FK1A6872.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
119	Pasture Raised Apple Fennel Pork Sausage (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. A nicely balanced sausage, equally great for breakfast or for stuffing an acorn squash!Ingredients: pork, apple, salt, fennel, sugar, onion powder, sage, apple cider vinegar powder	0.7	lb	6.99	Meat	Sausage	goodeggs2.imgix.net/product_photos/dbgQhkw2SpaYEv9mhoVS_FK1A0653.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
114	Sweet Italian Sausage (Frozen)	Made using a very traditional European recipe including\nanise, fennel, minced garlic and touch of pepper, our Sweet Italian Sausage is\na true “do it all sausage”. Its great served in a roll, in your favorite pizza\nor pasta recipe, or all by itself. Fully cooked for simple prep. \nIngredients: Pork (Food Alliance Certified), Water, Organic\nSpices, Sea Salt, Organic Evaporated Cane Syrup, Organic Garlic, Organic\nPaprika, in Natural Pork Casing	0.75	lb	7.49	Meat	Sausage	goodeggs2.imgix.net/product_photos/Y7GVXjmuSLvGYhK8dLTM_FK1A0899.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
73	Pasture Raised Garlic Ginger Pork Sausage (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. Garlic and Ginger sausage- delicious in all the ways that sausage normally is, with the added bonus of making a perfect pot sticker or egg roll filling, or an awesome little meatball for a Pho style soup!Ingredients: pork, salt, garlic powder, dry honey, ginger powder, spices.	0.7	lb	8.39	Meat	Sausage	goodeggs2.imgix.net/product_photos/OmJWhPm0TamIYu7ABUsi_FK1A3966.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
7	Pasture Raised Maple Pecan Pork Sausage (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. Ingredients: pork, maple sugar, pecans, salt, onion powder, spices, garlic powder, vinegar powder, ginger powder.	0.8	lb	10.39	Meat	Sausage	goodeggs2.imgix.net/product_photos/dbgQhkw2SpaYEv9mhoVS_FK1A0653.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
69	Pork Bratwurst	Our Gourmet Bratwurst contains 100% pork seasoned with white pepper, ginger, and nutmeg.  Super traditional and super amazing!! Authentically made by salumist Elias Cairo. INGREDIENTS: Pork shoulder, pork fatback, salt, milk powder, white and black pepper, ginger, mustard powder, nutmeg.CONTAINS DAIRY	0.75	lb	6.79	Meat	Sausage	goodeggs1.imgix.net/product_photos/FpAWMsa6RRSyhmQjuptN_FK1A6845.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
40	Pork Ksekrainer	Käsekrainer are the delicacy of sausage stands dotting the towns and cities of Austria. A traditional street food, these plump pork sausages are studded with Emmenthaler cheese and smoked over apple wood. Once warmed through and lightly crisped each slice yields a gooey cheese interior. These are the most decadent cheese dogs you'll ever taste.Package includes three 4 ounce sausages (12 ounce).Ingredients: Pork, pork fat, water, swiss cheese (pasteurized cow's milk, cheese cultures, salt, enzymes), dry milk powder, less that 2% of: salt, dried vinegar, cultured dextrose, fresh garlic, black pepper, dextrose, swiss chard powder, natural flavors, lactic acid cultures. Stuffed in hog casing.Contains: Milk	0.75	lb	6.79	Meat	Sausage	goodeggs2.imgix.net/product_photos/eOqJRsYAQS6AEU6TOZig_FK1A6831.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
83	Grassfed Lamb Merguez (Frozen)	Lamb Merguez-Williams Ranches Lamb,  from Sonoma County Meat CompanySuper-flavorful, well spiced but not too hot, this 100% lamb merguez cooks up quickly and is an awesome complement to vegetable or grain dishes- especially good with lentils for a one pot no fuss meal!Ingredients: Lamb, Spics, Salt, Garlic Powder, in a Lamb Casing.Williams Ranches grows the highest quality lamb, fed on grass, clover and alfalfa with no hormones or antibiotic supplements. The Williams hand select each lamb, determining processing time by the amount of fat cover. This ensures a quality, consistent product that is available year round and lambs that are processed between 5 and 8 months old. This process means you will get a leaner, milder lamb that simply melts in your mouth.Ingredients: Lamb, Spics, Salt, Garlic Powder, in a Lamb Casing.	0.75	lb	10.49	Meat	Sausage	goodeggs2.imgix.net/product_photos/zt9hwO7R0W0EnKVIsRHz_20161007-SonomaMeatCo_LambMerguez_MG_3204%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
56	Lamb Sausage (Frozen)	One of our customer favorites, the lamb sausage comes ready to cook and is delicious on a bed of rice. The lamb is sourced from Anderson Ranch in Southern Oregon and is 100% grassfed and Certified Humane.Ingredients: Lamb, Water, Sea Salt, Spices, Onion, Garlic, In Natural Pork Casing.	0.75	lb	11.29	Meat	Sausage	goodeggs2.imgix.net/product_photos/8ieUXFz6RzO8epwxxkIp_FK1A8495.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
55	Sweet Italian Beef Sausage (Frozen)	Oakridge Angus- Grass-fed, Grain Finished Beef - from Sonoma County Meat Co.A classic sausage flavor made with delicious Oakridge Angus beef!Ingredients: Beef, Wine, Salt, Spices, Sugar, Garlic. Pork casing.	0.7	lb	9.99	Meat	Sausage	goodeggs2.imgix.net/product_photos/OmJWhPm0TamIYu7ABUsi_FK1A3966.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
368	Wildflower Honey Ham	Our sustainably farmed natural ham is brushed with a scrumptious glaze of wildflower honey, maple syrup, and brown sugar, and then slow roasted to perfection.These heirloom-breed\nhogs are raised by family farmers in the Midwest, like fifth-generation\nfarmer Russ Kremer. The hogs are raised without antibiotics, added hormones or\ngrowth enhancers in open spaces where they’re free to root, nest and\nexplore. When Russ graduated from the University of Missouri in the early\n1980s, he adopted modern hog production practices like everyone else he knew.\nAll that changed when one day a boar gored him and he nearly lost his\nleg. That near tragedy changed Russ’s way of farming forever. In 2001, he\nhelped found a cooperative made up of farmers who share his commitment to\nsustainable practices. Their antibiotic-free hogs are raised humanely and are\nprized by chefs for their tender, flavorful meat.\nIngredients: Pork, Water, Honey. Contains 2% or Less of: Maple Syrup, Brown Sugar, Sea Salt, Celery Juice, Natural Flavors.	0.437	lb	5.29	Meat	Deli Meat	goodeggs2.imgix.net/product_photos/TBCHqFpaRlZH0ldRbY5a_20160409-TrueStory_HoneyMapleHam_MG_6013.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
306	Black Forest Ham	Rubbed with brown sugar for a lick of sweetness and then slow-smoked over Applewood, our all natural uncured ham serves up heaps of deliciousness.These heirloom-breed\nhogs are raised by family farmers in the Midwest, like fifth-generation\nfarmer Russ Kremer. The hogs are raised without antibiotics, added hormones or\ngrowth enhancers in open spaces where they’re free to root, nest and\nexplore. When Russ graduated from the University of Missouri in the early\n1980s, he adopted modern hog production practices like everyone else he knew.\nAll that changed when one day a boar gored him and he nearly lost his\nleg. That near tragedy changed Russ’s way of farming forever. In 2001, he\nhelped found a cooperative made up of farmers who share his commitment to\nsustainable practices. Their antibiotic-free hogs are raised humanely and are\nprized by chefs for their tender, flavorful meat.Ingredients: Pork, Water, Contains 2% or Less of: Salt, Brown Sugar, Celery Juice, Natural Flavors.	0.437	lb	5.29	Meat	Deli Meat	goodeggs2.imgix.net/product_photos/fyP40MhQTr6BIFUryziN_20160409-TrueStory_BlackForestHam_MG_6016.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
135	Speck Americano	Speck, a lesser-known variation of prosciutto, is a sweet meat, deep, rich and earthy in texture with a distinct but light applewood-smoked flavor and aroma. Slice it thin to eat alone or with your favorite cheese. Ingredients: Pork, Sea Salt. Smoked over real applewood.	3	oz	6.99	Meat	Deli Meat	goodeggs1.imgix.net/product_photos/AVjP3aynSHKMR1dn8dfS_FK1A7221.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
610	Organic Fennel	Fennel is great in soups alongside chicken and mushroom, and delicious in rigatoni or baked, seasoned and covered in parmesan. Try it in salads and casseroles as well.	1	head	2.49	Produce	Vegetables	goodeggs1.imgix.net/product_photos/3qMY9zUJThiNwxF3yH6L_S994FmSr0wpl6gfH9_l4-be-ZKqh1U5mKlGDENYs_l8.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
314	Organic Honey Roasted Turkey	Organic Pre-Sliced Honey Turkey: Our oven-roasted turkey with a drizzle of honey. (We use locally sourced honey whenever possible.) Our pre-sliced turkey is fantastic in sandwiches, appetizers, or just as a grab-and-go snack!How Our Deli Meats Stack UpLow SodiumNo gluten, casein, carrageenan, phosphates, MSG, artificial ingredients, or preservativesNo added nitrates or nitritesNo antibiotics, growth stimulants, or hormonesTurkeys are fed a 100% Vegetarian DietOnly whole muscle meat used. No fillers!NON-GMO Project VerifiedAll animals are humanely raised on GAP-rated sustainable family farms and ranches.Ingredients: Organic turkey breast, water,  organic honey, sea salt, sodium carbonate, and natural flavorings.	6	oz	6.49	Meat	Deli Meat	goodeggs2.imgix.net/product_photos/XRvvBc4aR7ScFSItdKzw_FK1A9549.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
235	Smoked Turkey	Slowly smoked and seasoned with spices and a hint of brown sugar and sea salt. Our pre-sliced turkey is fantastic in sandwiches, appetizers, or just as a grab-and-go snack!How Our Deli Meats Stack UpNo gluten, casein, carrageenan, phosphates, MSG, artificial ingredients, or preservativesNo added nitrates or nitritesNo antibiotics, growth stimulants, or hormonesTurkeys are fed a 100% Vegetarian DietOnly whole muscle meat used. No fillers!NON-GMO Project VerifiedAll animals are humanely raised on GAP-rated sustainable family farms and ranches.Ingredients: Organic turkey breast, water, sea salt, organic brown sugar, sodium bicarbonate, organic spices, organic garlic powder, and natural flavorings.	6	oz	5.99	Meat	Deli Meat	goodeggs2.imgix.net/product_photos/51zvWX9OSWCTcK63Oidu_FK1A7373.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
179	Organic Oven Roasted Turkey	Slowly Roasted with a pinch of sea salt to bring out that old-fashioned flavor. Our pre-sliced turkey is fantastic in sandwiches, appetizers, or just as a grab-and-go snack!No added nitrates or nitritesNo antibiotics, growth stimulants, or hormonesTurkeys are fed a 100% Vegetarian DietOnly whole muscle meat used. No fillers!NON-GMO Project VerifiedAll animals are humanely raised on GAP-rated sustainable family farms and ranches.Ingredients: Organic turkey breast, sea salt, sodium carbonate, and natural flavoring.	6	oz	6.49	Meat	Deli Meat	goodeggs1.imgix.net/product_photos/fvkG8E6CQwqM3X9dEwAP_FK1A2042.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
144	Organic Oven Roasted Turkey Breast	Our sustainably farmed organic turkey breast is rubbed with sea salt, fresh cracked pepper, and a touch of mild seasonings, then slow roasted to juicy scrumptiousness.These turkeys are raised by True Story partners like on Pitman Family Farms, a family-owned business that has been raising poultry for three generations in Sanger, California. Don Pitman began raising free-range turkey and chickens in 1954 and was soon joined by his son Rick. Today, Rick’s sons, David and Ben, carry on the family tradition. From the beginning, the Pitman family has been focused on animal husbandry and welfare. Their organic turkeys have access to the outdoors with ample water and shade. Additionally, they have environmental enrichments, such as straw bales for pecking and eucalyptus tree branches for playing. The organic turkeys are fed a certified organic vegetarian diet, free of genetically modified organisms and synthetic amino acids.Ingredients: Organic Turkey Breast, Water, 2% or Less of the Following: Sea Salt, Organic Evaporated Cane Syrup, Sodium Carbonate, Natural Flavors.	0.375	lb	6.49	Meat	Deli Meat	goodeggs2.imgix.net/product_photos/sKeDFwzVS3SMGDytYtUi_20160409-TrueStory_OvenRaostedTurkey_MG_6018.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
131	Peppered Roast Turkey	Oven roasted breast sprinkled with freshly cracked coarse pepper. How Our Deli Meats Stack UpNo gluten, casein, carrageenan, phosphates, MSG, artificial ingredients, or preservativesNo added nitrates or nitritesNo antibiotics, growth stimulants, or hormonesTurkeys are fed a 100% Vegetarian DietOnly whole muscle meat used. No fillers!NON-GMO Project VerifiedAll animals are humanely raised on GAP-rated sustainable family farms and ranches.Ingredients: Turkey breast, water, sea salt, sodium carbonate, natural flavorings, spices.	6	oz	5.99	Meat	Deli Meat	goodeggs1.imgix.net/product_photos/Cf8kMBvHRJWraR5o5F5m_Good%20Eggs_111515-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
383	Prosciutto Americano	Prosciutto Americana was our first creation and remains our most popular.\n Humanely raised,  antibiotic free\npork from Heritage Acres\nand Niman\nRanch is dry cured with\nsea salt\nand aged for 9-12\nmonths.  Ingredients: pork, sea salt. The meat has a sweet, clean flavor\nand a floral minerality.    We started La Quercia to create premium quality American prosciutto, then applied what we learned to other cuts of pork. Our appreciation for cured meats grew out of the three and a half years we lived in Parma, Italy, prosciutto's area of origin, where we saw how the careful treatment of fine materials resulted in an accessible, sublime and entirely regional cuisine. Our ambition to create our own prosciutto came from our desire to take the bounty that surrounds us in Iowa to its highest expression. We seek to contribute to the growth of premium artisan-made American foods by offering unique dry cured meats of the finest quality.It has been hard for us to navigate the highly eroded language of meat labelling. Third party standards can develop, evolve, improve, and worsen. To enforce these standards, we clearly communicate them to our suppliers and do occasional grower visits.We decided to establish our own standards and hold our meat suppliers to them:  no pork from confinement facilities or from animals fed non-therapeutic antibiotics. We require that growers provide the pigs space to socially congregate, a place to bed in deep bedding, and access to the out of doors. We use organic spices whenever possible. Our supplier, Oregon Spice Company, has rigorous safety controls to ensure the purity and integrity of their spices. We use pure sea salt from the United States. We have no known allergens in any of our ingredients, including no gluten. Everything we make is dry-cured and raw, and may be eaten cooked or uncooked.	3	oz	8.49	Meat	Deli Meat	goodeggs1.imgix.net/product_photos/l0dH7Pa9SE2VwxdPM7jq_FK1A0404.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
81	Grassfed Beef Pastrami	Create the ultimate Reuben! Our grass fed beef top round is cured in a sea salt brine for 2 weeks, rubbed with cracked black pepper and hot smoked with almond and fruit wood to perfection. Sliced. Ingredients: Beef Round, Water, Salt, Sugar, Sodium Lactate, Sodium Nitrite, Black Pepper, Dehydrated Garlic, SpicesWe raise our Limousin steers on certified organic rotational pasture and native grasslands within 2 hours of the Bay Area in the beautiful Capay Valley. We take the time to alfalfa finish all our animals. We truly believe that in order for consistency in a grass fed, grass-finished product, each producer must choose the best method for their farm and its local ecology. We grow our own pesticide free, non-GM alfalfa on our family's fields to produce high quality beef. You will find our farm's beef to be a very lean red meat with light marbling, yet extra tender. Our beef is dry-aged for a minimum of 16 days, flash frozen, and vacuum sealed. We are a certified USDA Grass Fed Producer and our farm and pastures are certified organic by CCOF. Follow us on our new Instagram feed @casa_rosa_farm and see how our animals really live.	0.7	lb	18.99	Meat	Deli Meat	goodeggs1.imgix.net/product_photos/g53A9aGbRPyqeRYZEhXf_FK1A9639.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
118	Original Beef Candy	PRMC Beef Candy is a delicious jerky-style product made with\nour high-quality lean beef. It is brined in brown sugar, salt and other spices,\nand then slow-cooked to perfection. The brining process makes the meat tender,\nsweet and juicy—it really is Beef Candy! Makes a great mid-day-snack. \nProduct is shelf-stable just like traditional dried and\nsmoked jerky.\nIngredients: Beef, Brown Sugar, Sea Salt, Spices, Cultured Celery Juice, Garlic, Onion	3	oz	8.49	Meat	Savory Snacks	goodeggs1.imgix.net/product_photos/bInFHyEBTIyPxUqOi4Mu_FK1A1043.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
74	Original Beef Jerky	A trusted standby that is perfect for any occasion. Our Original flavor is what we are all about—bringing together a culmination of hickory smoke with a black pepper and brown sugar marinade. We think it's a pretty perfect flavor combination.No preservatives, no added MSG*, no nitrites, no corn syrup.*Except naturally occurring in soy sauce.Ingredients: top round beef, gluten-free reduced sodium soy sauce, (water, soybeans, salt, alcohol), apple juice, brown sugar, pineapple juice, water, natural hickory liquid smoke, rice wine, black pepper, granulated garlic, red wine vinegar, ginger, white pepper, granulated onion.Allergens: contains soy.	2.2	oz	5.99	Meat	Savory Snacks	goodeggs1.imgix.net/product_photos/69GWCynwQtyc7uDST3t8_20140528_GoodEggs_182_OriginalBeefJerky.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
47	Flaco Paco Pepperette	Pork Stick?  Yes Please. We've been smoking pork sticks (with really good pork, in natural casings, over hickory and apple woods) since the beginning.  If you've been to our restaurants, you've probably had one of the long, thin, delicious sticks elegantly gracing the top of the deli case.  This pepperette is a Spanish inspired pork stick flavored with paprika and garlic in a natural sheep's casing. Last fall, we started making these little shorties and wrapped them up all cute in a pocket-sized box.  Perfect for snacks, travel, pocket meat, and little gifts to say, "I love you... and you love meat." Olympia Provisions, Flaco Paco Pepperettes are shorty pepperoni sticks made with pork in natural casings, and smoked over hickory and apple woods. Flaco Paco variety is made with paprika, oregano and garlic.Ingredients: Pork, pork fat, paprika, salt. Contains 2% or less of spices, garlic, sodium nitrite, potassium sorbate, lamb casing. 	1.7	oz	3.99	Meat	Charcuterie	goodeggs2.imgix.net/product_photos/lvDgxgFLQLCacb9W0qDt_FK1A6816.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
39	Honey Spice Beef Jerky	This jerky will definitely get your tastebuds rocking! Its honey sweet start is in perfect harmony with the cayenne pepper finish. Our lean mean cuts marinate for hours in a smoky, yet spicy, cayenne pepper and garlic honey marinade.No preservatives, no added MSG*, no nitrites, no corn syrup.*Except naturally occurring in soy sauce.Ingredients: top round beef, brown sugar, gluten-free reduced sodium soy sauce, (water, soybeans, salt, alcohol), pineapple juice, honey, water, apple juice, rice wine, natural liquid smoke flavor, granulated garlic, ginger, Frank's RedHot (aged cayenne red peppers, vinegar, water, salt, garlic powder), cayenne pepper, granulated onion, black pepper, white pepper.Allergens: contains soy.	2.2	oz	5.99	Meat	Savory Snacks	goodeggs2.imgix.net/product_photos/ewmmThoJS7e3jlF1Qmem_20140528_GoodEggs_189_HoneySpice.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
89	Chicken Liver Pate	* ingredients: chicken liver, house smoked birch apple sauce, beef fat, thyme, shiso, epazote, saltMission: Heirloom is a food company based in Berkeley. All of our food is sourced as locally as possible and 100% organic or biodynamic. We never cook with refined oils, and our food is always gluten-free, grain-free, soy-free, peanut-free, legume-free, and added sugar-free.	8.1	oz	8.99	Meat	Charcuterie	goodeggs2.imgix.net/product_photos/rAdrmBdFT3WnbRbDcY5z_chix%20liver%20pate.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
48	Pork Liver Mousse	Rich and creamy mousse of pork liver, slightly sweetened with Port Wine and capped with rendered pig fat.  SUGGESTIONS TO ENJOY: Enjoy with your favorite baguette, olive oil and fleur de sel.INGREDIENTS: Liver, lard, cream, egg, Port Wine, salt, nitrite, pepper, coriander, chili flake.	8	oz	9.99	Meat	Charcuterie	goodeggs1.imgix.net/product_photos/e8vkjQw3QQCTkHS0OpnQ_FK1A5531-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
6	Pork Pistachio Pâtè	This country style pork pate is made with fresh herbs and pistachios, then capped with rendered pig fat. SUGGESTIONS TO ENJOY: Enjoy with your favorite baguette and a stone ground mustard.INGREDIENTS: Pork, liver, salt, nitrite, pepper, sugar, garlic, onion, parsley, thyme, shallot, port wine, cloves, nutmeg, ginger, bread, milk, spices. 	8	oz	9.99	Meat	Charcuterie	goodeggs1.imgix.net/product_photos/ZhKZsHU1THq8JzBtPL99_FK1A5516-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
65	Akka's Curry Paste - South Indian Style	Craving for a fresh tasting curry with authentic flavors without the hassle of shopping for ingredients and making them? Akka's Curry Paste is the simple solution! Made with 16 ingredients including fresh tomato, onion, coconut, ginger, garlic, curry leaf, turmeric, coriander, and spices is easy to use. This is inspired by my mother who used to make a curry paste before we went on our annual pilgrimage to a distant village when I as growing up in India. We bring this product to not so distant Silicon Village San Francisco, for everyone's enjoyment.All you do is brown 2 lbs of chicken breast or thigh meat. Transfer the full jar of curry paste to the pot. Add two cups of liquid - chicken broth, coconut milk, or water, and 1 lb of chopped vegetable like potato, carrots. Bring to boil and simmer for 15 minutes until chicken is cooked. Serve with rice, nan, paratha, or bread with a spoon full of Akka's Mango Chutney in the side.To make vegetarian curry: chop and boil three cups of vegetables like potatoes, carrots, green beans, cauliflower in water. Add three to four tablespoons of curry paste to the vegetable and simmer for few minutes. Serve with rice, chapathi, paratha, or bread with a spoon full of Akka's Meyer Lemon Relish in the side.Ingredients: tomato, onion, coconut, ginger, garlic, coriander powder, chili powder, safflower oil, curry leaf, spices, salt	6.7	oz	10.49	Meat	Rubs & Marinades	goodeggs2.imgix.net/product_photos/Hkgn1St3SjS22fZfSAM1_FK1A2641.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
41	Original Korean BBQ Marinade	"This is an all NEW product from Genuine Grub! As someone who loves Korean BBQ (or K-BBQ as we say in my house) it's awesome to know that I no longer have to wait in line at the K-BBQ spots around the Bay and that I can enjoy the flavors right from my own house" -Erin, Grocery Buyersure, we could tell you that our marinade has tons of great reviews. but most of them are from people we had to pay. like family and friends. but if you’re looking for something new and exciting in life (sorry, we’re referring to food only), we think you’ll love this. besides, it’s made with organic ingredients and stuff. so, c’mon, what've you got to lose? a few dollars, sure, but that's a risk we're willing to take! MADE IN MARIN.ingredients: soy sauce (water,soybean, wheat, salt),* sugar,* sesame oil,* water, apple cider vinegar,* apple cider,* arrowroot,* granulated garlic,* sesame seed,* minced garlic,* green onion,* black pepper.*     * organic 	16	oz	7.99	Meat	Rubs & Marinades	goodeggs1.imgix.net/product_photos/PxwlOyk7SfmyRkCvfN0g_20160824-GenuineGrub_KoreanBBQ_MG_8620.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
35	Akka's Indian Spice Rub	A South India style fresh tasting curry spice rub with authentic flavor is tailored from my family recipe. It pairs well with roasting both meat and vegetable.  Rub meat with generous amount of spice rub, olive oil, and lemon juice. Marinate in refrigerator for 30mins. Roast, grill, or barbeque until the meat is cooked. Serve with rice, bread, or paratha and Akka's mango chutney on the side. Coat chopped vegetables like potato, sweet potato, carrots, shallots, celery stick with the spice rub and olive oil mixture. Roast until cooked. Separately, make or heat tomato sauce on a skillet along with some spice rub. Transfer vegetable to the skillet and mix well. Serve with rice, chapathi, or paratha and Akka's Meyer lemon relish on the side. Mixing with tomato sauce is optional.Ingredients: coriander, ginger, garlic, safflower oil, coconut, turmeric, red chili, spices, salt, curry leaf	3.2	oz	9.99	Meat	Rubs & Marinades	goodeggs1.imgix.net/product_photos/qwG0wPQaRqG1nw1rHyuq_20160809-Akkas_IndianSpiceRubMG_7517.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
268	"Just a Few" Organic Celery Stalks	Try this organic Celery in a hearty vegetable stock, with peanut butter or in a salad with fresh mozzarella, olive oil and lemon zest!	0.25	lb	0.49	Produce	Vegetables	goodeggs2.imgix.net/product_photos/QQcnDbSVRNC7QeMqqeFN_20160816-SingleStalkCelery_MG_8028%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
36	BBQ Sauce	We've been making this highly addictive sauce/dip for ourselves and tinkering with the recipe since 1999. Not just for bbqs, this can be used instead of ketchup and as a general sauce/dip for any kind of meat or vegetables. We use it in sandwiches, as a dip for fries and roasted potatoes, on burgers and hot dogs. You can even make meat loaf with it. One dish we love to make is pulled bbq chicken or turkey sandwichs with coleslaw as they do in North Carolina - search online lots of recipes! If you are vegetarian, it is perfect seasoning for a wide variety of dishes. Just be creative! It is delicious all year round.Not too spicy, but not too mild. It is a perfect combination of spices, heat, sweetness and tang. The complex, addictive flavor is due to our use of more than seven types of chilies and peppers, and many, many spices. Just measuring out all the ingredients takes an hour! Read the rave review by Food & Wine magazine about it.Our bbq sauce is gluten free and contains organic California grown GMO-free tomatoes, processed by Neil Jones in Hollister, California.Ingredients: organic tomatoes, brown cane sugar, organic vinegar, mustard, organic wheat-free soy sauce, spices, garlic, salt.	16	fl oz	6.99	Meat	Rubs & Marinades	goodeggs1.imgix.net/product_photos/YlD5s4PcT8q5ojK7E2rQ_FK1A6460.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
31	Pasture Raised Pork Bones (Frozen)	Walnut Keep Farms Pork- from Sonoma County Meat CompanyHeritage breed pigs are pasture-raised in Suisun Valley and finished on walnuts, giving the fat a rich, creamy texture. Never given antibiotics or growth hormones, and never confined. Mixed pork bones, great for broth, stew, or dog treats!	2.8	lb	16.19	Meat	Bones & Offal	goodeggs1.imgix.net/product_photos/1LMynNe2QkqaE5PKP1Fj_FK1A0276.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
26	Duck Fat	Rendered Duck FatFried potatoes anyone? How about making your own duck confit? Everything's delicious with duck fat!Arrives frozen, keep frozen or refrigerated.Mary’s Free-Range Ducks are beautiful animals to raise. The Pekin Duck are raised naturally in the beautiful weather in California. They live year round with access to outdoors. We watch them everyday to make sure they are comfortable and happy. We make every effort to treat our ducks as humanely as possible throughout the production process. No Antibiotics EverRaised Without Added Hormones*No Preservatives or Additives*Federal Regulations Prohibit The Use Of Hormones In DuckFed a Vegetarian Diet (65% Corn, 25% Soybean Meal, 5% Vitamins and Nutrients, 5% Wheat)	12	oz	11.89	Meat	Bones & Offal	goodeggs2.imgix.net/product_photos/nynEyNm3RuG8AP4PfyDB_20160429-Marys_DuckFat_MG_8482.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
2548	Organic Princess Seedless Grapes	Organic Princess Seedless Grapes! These large, luscious, light green berries are a perfect blend of sweet and tart. Gobble them by the handful while you enjoy their satisfying crunch and slight floral character. Kids especially love frozen grapes as a refreshing treat on those warm summer days.	2	lb	6.99	Produce	New & Peak Season	goodeggs1.imgix.net/product_photos/Hw7KQ4eSQmGC5I6ld3pA_xLKNUloLvGi2c0DPg-zPwQowoJFqmX5R0peONf8gqAI.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
2426	Organic Zucchini	Grilled or sautéed, this succulent summer squash is sweet and tender.	1	lb	2.49	Produce	New & Peak Season	goodeggs1.imgix.net/product_photos/Vv7i3XgiRk0uIOTm3mnS_zucchini_01%20copy.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1236	Organic Fuji Apples	Perfect for on-the-go snacking these Fujis are on the smaller side, but pack a sweet punch nonetheless. Mostly on the sweet side, these apples are great for throwing into salads or eating with peanut butter.	4	lb	7.99	Produce	New & Peak Season	goodeggs1.imgix.net/product_photos/idBYd9NRTbSG5cJuIMD3_xzemHBTxj3-pY7qj_myMXTyD5VVhSNK5GGm3PgSWg6Q.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1124	Fuyu Persimmons	Jeremy Murdock's Fuyu Persimmons are some of the most delicious we've ever had. Grown in Winters, CA, just 70 miles from our San Francisco Food Hub, these Fuyus are harvested ripe and ready to eat. Though not certified organic, Jeremy--a former CCOF inspector--knows how to grow these Persimmons to perfection without the use of any pesticides or fertilizers whatsoever. The squat, tomato-shaped Fuyu variety--unlike the acorn-shaped Hachiya variety--can be eaten firm like an apple for a mildly sweet crunchy treat, or can be left to soften to a gel-like stage for an intensely sweet experience.	3	lb	9.99	Produce	New & Peak Season	goodeggs1.imgix.net/product_photos/PvSgXM9kRjGef0d9c6vy_20161012-FuyuPersimmon3pd_MG_3507%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1082	Organic Blackberries	Yerena's Blackberries are delicious, as they pick them when they're fully mature and perfect for snacking! Richer and more delicate than a raspberry, these are perfect for pie, jam, preserves and tea.	1	half pint	3.99	Produce	New & Peak Season	goodeggs2.imgix.net/product_photos/9r3RaxBNQsTdA678Z2vw_blackberries_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
897	Organic Lunch-Box Peppers	Our Organic Lunch-Box Peppers are the perfect sweet pepper for any purpose.Use them as their namesake in your lunch as a fresh, crunchy snack, or sauté them. Blend them into a tomato - pepper soup or reduce that down to an unforgettable pasta sauce.If you really want to get creative, bake and stuff them with your choice selection of rice, egg, meat and seasoning for a fantastic international dish you'll remember.	1	lb	5.99	Produce	New & Peak Season	goodeggs2.imgix.net/product_photos/iQvSgdWRIWQH8MgupyjS_20160803-Eatwell_LunchboxPeppers_MG_7090.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
754	Sweet Walla Walla Yellow Onions	Walla Wallas are a super sweet Yellow Onion variety. Enjoy as onion rings or caramelized into a sweet sauce.	2	lb	4.99	Produce	New & Peak Season	goodeggs2.imgix.net/product_photos/f0ocZSYCSmCptp6q4gf0_20161003-MartinB_WallaWallaOnion_MG_2572.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
373	Organic Sweet Wickson Crab Apples	The Wickson Crab Apple is small, like other crab apples, but different in every other way. They're sweet, with a tangy acidity. They're amazing for cider and perfect for a bite-sized snack.	1	lb	4.99	Produce	New & Peak Season	goodeggs1.imgix.net/product_photos/9X4XhgK1Se8Mz17cZDxD_filigreenfarm_wicksoncrabapple.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
137	Foraged Chanterelle Mushrooms	Freshly foraged from forests of the the Pacific Northwest, these delicious wild mushrooms are meaty and sweet. Simply sautéed with a bit of butter and a pinch of fresh rosemary, Fresh Chanterelles are some of the most delicious wild-harvested mushrooms around. The season is dependent upon the rains in Washington and Oregon, so don't miss out on this short season!Connie from Wineforest has been working for decades with some of the most professional foragers in the country, all of whom harvest sustainably in order to ensure abundant harvests for generations to come.	1	lb	19.99	Produce	New & Peak Season	goodeggs2.imgix.net/product_photos/008We1UTMGZlIi4blRxh_20161006-Wineforest_Chantrelles_1pd_MG_3154save4.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
425	Organic Honey Nut Squash	Honey Nut squash are mini Butternut Squash. They have a flavor similar to a butternut but sweeter and have a deep orange color.	2	lb	4.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/unyhipVaTfeBMSGSUyO4_squash_honey-nut.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
115	Organic Cinderella Pumpkin	These large, beautiful, lobed Pumpkins have a red-orange skin with a creamy, rich flesh. They sometimes have a dark green webbing to them and the occasional (spooky!) scarring, but that just makes them look all the cooler and shouldn't affect their flavor at all. They're beautiful enough to replace your standard Jack-O-Lantern Pumpkin, and delicious enough to roast into your next pumpkin pie filling.	1	count	14.99	Produce	New & Peak Season	goodeggs1.imgix.net/product_photos/cQLSIgzOS6C4ci5dWdtK_20161027-CinderellaPumpkinTrio_MG_5377.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
96	Foraged Matsutake Mushrooms	Freshly harvested from Oregon, these delicious wild mushrooms boast a peppery, earthy flavor. Try shaving them into a hot, salty miso soup right before removing it from the heat.Please note: Matsutake should be consumed within 48 hours of delivery. They're a very delicate mushroom, with all sorts of microbial forest flora and fauna, so they can can break down fairly quickly.	8	oz	14.99	Produce	New & Peak Season	goodeggs2.imgix.net/product_photos/NfrYkGCRzGzaMhWt82YQ_FK1A4624.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
77	Sunflowers	Nothing says summertime like a big old bunch of sunflowers! These beauties will arrive fully opened, and should last over a week with proper care. To care for them, place them in a vase away from direct sunlight, while regularly trimming their stems and changing their water.	1	bunch	9.99	Produce	New & Peak Season	goodeggs2.imgix.net/product_photos/yEall4RbKLcFK1zknZUA_Screen%20Shot%202016-08-01%20at%208.12.35%20AM.png?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
608	Stan Devoto's Organic Apples of the Week	Stan Devoto and his crew up in Sebastopol are in full-swing apple season right now! With so many delicious, heirloom varieties, sometimes you want to choose them all! Well now you can!We'll send you 3 lb of Devoto Garden's best varieties, which'll vary as the season marches on. (Due to the short harvest window for Stan's apples, and the fact that he's selling them as fresh apples instead of storage apples, the selection may change day to day, and may sometimes include fewer than three varieties. But don't worry, at the end of the day, you'll always end up with 3 lb of delicious, Organic Sebastopol-grown Apples!)	3	lb	8.99	Produce	New & Peak Season	goodeggs2.imgix.net/product_photos/7QjBfElaQ6uE6WUSWEIw_Apple_Party_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
792	Red Little Gem Lettuces	Martin's Red Little Gems are always crunchy and always sweet. Use as the base of your next salad, coarsely chopped or torn.	1	lb	5.99	Produce	New & Peak Season	goodeggs1.imgix.net/product_photos/3WS3Dw1DRDe2k1mytnFg_lettuce.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
342	Organic Dried Jujubes	Jujubes (aka Chinese Dates) are widely consumed throughout the Asian continent: dried as a snack with coffee, made into a syrup or juice, even pickled! Jujubes naturally turn from a lime-green color to a dark, amber red as they dry, and they'll begin to wrinkle when they're at their sweetest stage.These Jujubes are fully dried to a wrinkled stage, making them a wonderful chewy snack.	1	pint	4.99	Produce	New & Peak Season	goodeggs1.imgix.net/product_photos/3Efiet8VQVCrMCH7y0QD_20161019-FullBelly_Jujubes_MG_4505.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
121	Organic Purple Carrots	Bold and beautiful, these Organic Purple Carrots give a striking color break to your next salad.They were grown by Ralph's Greenhouse Mt. Vernon, WA, and brought to us by our trusted distributor partner, Earl's Organic.	1	bunch	2.29	Produce	New & Peak Season	goodeggs2.imgix.net/product_photos/cuWJp6liRSqpbcLIv0vw_carrots_purple_04.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1589	Lime	Sustainably grown, these first-of-the-season Limes offer a bright acidity to liven up tacos, pho or any earthy, nutty grain salad.	1	count	0.59	Produce	Fruit	goodeggs1.imgix.net/product_photos/MPMLcMrtQ9XjLwpS6fug_limes_03%20copy.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1514	Organic Lemon	Juicy and acidic, lemons are a must-have for any kitchen. Use it on fish or to add some life to your next salad dressing.When none of the farms we work with directly has lemons, we rely on our trusted distributor, Veritable Vegetable, to source us the highest quality organic lemons around. These Organic Lemons are grown in Riverside Co. by Corona-College Heights.	1	count	0.99	Produce	Fruit	goodeggs2.imgix.net/product_photos/m1XSgyCBTXaatVP9HF5f_lemons_01%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
880	Organic Meyer Lemons	These Meyers aren't the gorgeous, glossy Meyers of peak season, but their zest and juice are perfect for baking, making cocktails, and finishing off a salad dressing. Meyer lemons are sweeter and more fragrant than other varieties of lemons, with a slightly lower but perfectly balanced acid content, making them exceptional in flavor for lemonade and juicing. Also delicious zested onto desserts such a lemon bars and cream pies.	1	lb	5.99	Produce	Fruit	goodeggs2.imgix.net/product_photos/lodymfjxQOaYUK4kyeKH_lemons_meyer_4_1.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
297	Limes	Sustainably grown, these first-of-the-season Limes offer a bright acidity to liven up tacos, pho or any earthy, nutty grain salad. With this 2 lb bulk sizing, you'll have plenty of juice for desserts or limeade.	2	lb	4.99	Produce	Fruit	goodeggs1.imgix.net/product_photos/jzFHOdtESlWc5adHZPNp_bag_limes.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
4880	Six Organic Bananas	We've heard from hundreds of you that you'd love for us to offer Bananas, and we're proud to now offer a very different kind of banana than what you'll generally find at the supermarket.These Organic and Fairtrade Bananas are grown by the San Miguel de Brasil Cooperative in El Oro, Ecuador are many things: they're a perfectly healthy on-the-go snack, they're a naturally sweet base to your morning smoothie, and if all else fails, they're the frozen inspiration behind your next batch of banana bread. For all the things these bananas can be, we decided early on in our search for an ethically-grown banana that one thing they will never be is a product of the prevailing global banana industry that has both historically and even recently wreaked ecological, social and political havoc in regions of the world in which bananas grow.The 134 small growers of the Cooperative work together to pack, market and ship their bananas directly to international buyers, which allows them to receive a higher price for their fruit and have more control over the process than going through one of the larger banana labels. These bananas are Certified Organic, Global GAP Certified and Fairtrade Certified by Fairtrade International.	6	count	3.99	Produce	Fruit	goodeggs2.imgix.net/product_photos/NjWf2hI8TPlY4wk93SBy_FK1A8104.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1151	Organic Hayward Kiwis	Also known as Chinese Gooseberries, these Hayward Kiwis are fuzzy and bland on the outside, yet bright as a gem on the inside. Once the fuzzy skin is shaved off, the fruit that remains is a perfect balance of sweet-tart deliciousness. The California Kiwi season is short, so get em while you can!As we're currently near the beginning of the California Harvest, so the Kiwis may be on the firmer side and may need up to a week to fully ripen.	1	lb	3.99	Produce	Fruit	goodeggs1.imgix.net/product_photos/4YJe7mLcRAa05v3hantp_kiwis_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1132	Organic Banana	We've heard from hundreds of you that you'd love for us to offer Bananas, and we're proud to now offer a very different kind of banana than what you'll generally find at the supermarket.These Organic and Fairtrade Bananas are grown by the San Miguel de Brasil Cooperative in El Oro, Ecuador are many things: they're a perfectly healthy on-the-go snack, they're a naturally sweet base to your morning smoothie, and if all else fails, they're the frozen inspiration behind your next batch of banana bread. For all the things these bananas can be, we decided early on in our search for an ethically-grown banana that one thing they will never be is a product of the prevailing global banana industry that has both historically and even recently wreaked ecological, social and political havoc in regions of the world in which bananas grow.The 134 small growers of the Cooperative work together to pack, market and ship their bananas directly to international buyers, which allows them to receive a higher price for their fruit and have more control over the process than going through one of the larger banana labels. These bananas are Certified Organic, Global GAP Certified and Fairtrade Certified by Fairtrade International.	1	count	0.69	Produce	Fruit	goodeggs2.imgix.net/product_photos/ZvQsVECTTdu9bUWhEdKe_FK1A8096.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
904	Organic Baby Dragonfruit	With a refreshingly mild, tropical flavor (think Kiwi mixed with Banana mixed with Honeydew), this unique fruit -- rarely grown in California -- has a striking exterior and an even more striking flesh. Juiced or blended, the Dragonfruit can serve as an amazing color addition and mild sweetener.These dragonfruit is grown by Devine Growers in Fallbrook, CA, and brought to us by our trusted distributor partner, Veritable Vegetiable.	1	count	4.99	Produce	Fruit	goodeggs2.imgix.net/product_photos/egsisaEfQN28AhDJWRti_20161021-DragonFruit_MG_4690.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
454	Organic Pineapple Guava (Feijoa)	The Pineapple Guava (aka Feijoa or Guavasteen) is the fruit of an evergreen, perennial shrub in the myrtle family. Though not a true Guava, its tropical flavor has notes of mango, pineapple and banana. They're harvested green, but will ripen up to have a yellow-ish skin and a bit of give to the flesh. Their aroma will be very strong when ripe. Slice in half and scoop out the cream-white inner flesh.These Organic Pineapple Guavas were grown by Preston Farms in Healdsburg, CA, and brought to us by the good folks at FEED Sonoma.	1	lb	5.99	Produce	Fruit	goodeggs2.imgix.net/product_photos/Xs0H0GX5QGaHwg6c3MPg_Feijoa_Pineapple_Guava_Half_Pound_Swift_Subtropicals.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
350	Six Organic Smoothie Bananas	As part of our efforts to reduce food waste here at Good Eggs, we'd love to offer our riper bananas to you at a great price. These bananas are perfect for eating out of hand within a day or two of your delivery, for those of you who like to wait for your bananas to sweeten up to their fullest potential before opening. They're also great for smoothies or, if you don't get to them all right away, for throwing in the freezer for a future banana bread project.	6	count	1.99	Produce	Fruit	goodeggs2.imgix.net/product_photos/aMl8olp2RlAV5cEDkm0H_DSC_3428.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
2086	Organic Red Flame Grapes	Grape season is here! Enjoy the crisp texture and excellent, sweet-tart flavor of our Organic Red Flame variety. A perfect between-meal snack, grapes are also a refreshing addition to both fruit and vegetable salads. Keep a stash on hand in your freezer for a deliciously sweet treat without the extra sugar and calories! Grapes are an outstanding source of health promoting poly-phenolic antioxidants, vitamins and minerals.	2	lb	6.99	Produce	Fruit	goodeggs1.imgix.net/product_photos/W8yH5WQdS6GEKHpClDQW_lRZ_3Vy0jB72bLviUNRIIhmMxMHtE-MyA6YyjfcxwCQ.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1113	Fuyu Persimmons	Jeremy Murdock's Fuyu Persimmons are some of the most delicious we've ever had. Grown in Winters, CA, just 70 miles from our San Francisco Food Hub, these Fuyus are harvested ripe and ready to eat. Though not certified organic, Jeremy--a former CCOF inspector--knows how to grow these Persimmons to perfection without the use of any pesticides or fertilizers whatsoever. The squat, tomato-shaped Fuyu variety--unlike the acorn-shaped Hachiya variety--can be eaten firm like an apple for a mildly sweet crunchy treat, or can be left to soften to a gel-like stage for an intensely sweet experience.	1	lb	3.99	Produce	Fruit	goodeggs2.imgix.net/product_photos/wK1ZQFRiSsSnHcnBNzb3_20161012-FuyuPersimmon_Duo_MG_3518.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
88	Organic Pomegranate	Pomegranates are the darling of fall fruit, as they hide in their caverns tiny jewels that bring color to otherwise drably colored fall dishes. To easily access the perils, try quartering the fruit and removing perils in a bowl of water.	1	count	3.99	Produce	Fruit	goodeggs2.imgix.net/product_photos/n37hm3QHTCdjp0f0ytpg_pomegranate_05.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
440	Pomegranate	Bursting with fresh flavor, this quintessential fall fruit is the perfect addition to a Delicata and Arugula salad with a bit of reduced balsamic drizzled on top.These Pomegranates were grown by 3 Sisters Pomegranates in Healdsburg, CA, and brought to us by our friends at FEED Sonoma.	1	count	1.99	Produce	Fruit	goodeggs2.imgix.net/product_photos/3qNmR0tTQlSSBpyrnHOD_pomegranate_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
242	Organic Hachiya Persimmons	KNOW YOUR PERSIMMON VARIETIES!From Farmer Bryce Loewen: "At almost every Fall farmers' market, I get at least one potential customer that believes that they don't like persimmons because they have eaten an astringent variety--such as the Hachiya--before it was ready. So many lost sales!"The Hachiya persimmon is actually even sweeter than the Fuyu, but only when it's so ripe that it feels like a sack of jelly. If you eat it at any point before then, it has a tannic flavor (like a mouthful of mothballs) that rivals the greenest plantain. It can take a while for Hachiyas to ripen, but the good news is that they look stunning while you wait."Or you can try your hand at Hoshigaki, a difficult, fascinating method of peeling and drying Hachiyas.	1	lb	4.99	Produce	Fruit	goodeggs1.imgix.net/product_photos/xNrKIc7ZQXuaAedPq3O7_persimmon_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
2409	Organic Blueberries	Grown organically in the picturesque Santa Ynez Valley, these antioxidant rich blueberries are bursting with flavor. Bake them in a pie, sprinkle them on yogurt, or eat them as nature intended.When most retailers begin sourcing their blueberries from South America -- where the low prices can often come along with less freshness and lower quality -- we're proud to still be sourcing California-grown fruit from a wonderful producer like Forbidden Fruits.	4.4	oz	7.99	Produce	Fruit	goodeggs1.imgix.net/product_photos/XrvzTZe9T4eAvyL79XOp_blueberries_small.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1881	Organic Honey Crisp Apples	Honey Crisp apples are a fairly new variety that has quickly become an American favorite. They are a fantastic eating apple. Explosively crisp and juicy, this refreshing apple is honey-sweet with a touch of tart flavor. Great for applesauce, juicing and baking.	2	lb	6.99	Produce	Fruit	goodeggs2.imgix.net/product_photos/cHcYj1oHQiWRZQJBvhnK_prUd2aORxy4yglUNQlVg_9YPJC4yqs30_M2j8ixLn5FXI4CEd9v5k-u6bux80BDU.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1348	Organic & Biodynamic D'Anjou Pears	The d'Anjou pear (sometimes known as the Anjou pear), is sweet and juicy when ripe, with hints of a citrusy brightness, but the flesh is dense enough to hold up well to baking or poaching.  Unlike the more familiar Bartlett pear, the d'Anjou barely changes color at all when ripe (perhaps a bit more yellow, but still pretty green), so the best way to test for ripeness is the apply gently pressure to the neck of the pear, looking for the flesh to yield ever so slightly.	1	lb	2.99	Produce	Fruit	goodeggs2.imgix.net/product_photos/YqxNOtgSLucUbIK8dwog_D%27Anjouy_Pear_Duo_60ct_MtHood.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1271	Organic Fuji Apples	Delicious, crisp and sweet, Stan's Fujis showcase what the Sebastopol climate and his crew's dedicated care and collective green thumb.	1	lb	2.99	Produce	Fruit	goodeggs1.imgix.net/product_photos/RaUtxCh9RcyXklf4GGow_JvPpnrPl0QbuPp0P86Wv969AkmedfI7m4Ze93hiNbLk.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
959	Organic & Biodynamic Bosc Pear Duo	With their long, elegant neck, and beautifully golden russeted skin, Bosc pears are as much of a delight for the eyes as they are for the mouth. The flesh is sweet even before it fully ripens up, so these pears are ideal for slicing into salads, poaching or broiling.	2	count	2.29	Produce	Fruit	goodeggs2.imgix.net/product_photos/YIAdIlT0aN9v3Y9MnOtg_MtHoodOrganics_Bosc_Pear_Duo_80ct.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
386	Organic Newton Pippin Apples	As brightly colored as they are flavored, these Newton Pippins are the perfect choice for the tart apple lover, delicious eaten fresh and paired with mild cheeses. They have a tart-sweet flavor and a crisp, dense texture that holds up well to baking, makes them ideal for use in desserts.	1	lb	2.49	Produce	Fruit	goodeggs1.imgix.net/product_photos/Q0RIy4W9TiuAwaBy5edz_TUVReWJMRKyAZSjpPn3c_LsSxwrkARMF4g1xaqi7CwECAYqGB-2Lp-UdIpZzIEeI.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
523	Organic Davisson Apples	These apples are a non-patented variety, discovered as a chance seedling in the Davisson Orchard in Sebastopol.This big and beautiful apple has red stripes over a yellow background.  Davissons have a firm, dense, crisp texture and a sweet taste--a farmer favorite.	1	lb	3.99	Produce	Fruit	goodeggs2.imgix.net/product_photos/TJqVzJqQXeqOBinWVgSc_NjNwcHCODyFgyo6Ljn6jo-rEd_Qtu55X761Kh42duiM.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
356	Organic Seckel Pears	Seckel Pears--widely regarded as the most adorable of all pear varieties--have a rich sweetness accompanied by a subtle cinnamon-y spice. Wait until the green skin under their red blush turns yellow to eat.These Organic Seckel Pears are grown by Valley View Orchard in Ashland, OR.	1	lb	3.99	Produce	Fruit	goodeggs1.imgix.net/product_photos/ZNrCRkcVTWwjdOagAKG4_20160922-SeckelPears_MG_1807.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
308	Organic Granny Smith Apples	These Granny Smith Apples are far from your standard supermarket wax-covered apple. They're grown in Sebastopol's coastal climate, in which they slowly mature, concentrating all of their flavors into a more compact fruit, dense with sweet-tart flavor. They develop a light green, occasionally yellow tint, and are wonderful for eating and, of course, for baking projects. When Grannies are in town, they are not to be missed.	1	lb	2.99	Produce	Fruit	goodeggs1.imgix.net/product_photos/IDwaDPUSwSqSIhNIUd9C_Apples_Gingergold_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
193	Organic Royal Gala Apples	The Royal Gala is a crisp and juicy early-season variety. It has enough acidity to balance the sweetness, but isn't too tart, making it a kids' favorite. Live Earth is packing their smaller apples into 4 lb bags, so you can enjoy them throughout the week. They store best kept in the refrigerator, but take them out a few at a time if you want to enjoy them at room temperature.Regular price: $9.99. Sale price: $7.99!	4	lb	7.99	Produce	Fruit	goodeggs2.imgix.net/product_photos/eF25N2t5RCu4rVHjhp0u_apples_bulk_with_bag%20save2.jpeg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
176	Organic Pink Lady Apples	The Pink Lady, with it's delicate balance of both sweet and tart, almost effervescent flavor, has quickly become a customer favorite. And what a beauty it is! This cross between a Golden Delicious and Lady Williams variety is the only truly pink apple on the market. Great for baking and fantastic for applesauce!	1	lb	3.49	Produce	Fruit	goodeggs2.imgix.net/product_photos/KnKv4EeNTUaTBBJifpoI_Apples_PinkLady.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
122	Assorted Organic Sauce Apples	Before we send them to your door, we sort through all our apples to pull out any bruised ones, cut ones, scarred ones, or slightly-nibbled-on ones, so that you get only the best of the best. We hate the idea of throwing out a delicious apple because of one of these defects, so we're offering them to you at a discounted price for use in sauces, juicing, dehydrating, or, for those willing to eat around a bruise or a small worm-hole, snacking!These Apples are a mix of this week's seasonal varieties, all certified organic, from any of the following farms: Devoto Orchards, Hidden Star Orchards, and Filigreen Farm.	5	lb	6.99	Produce	Fruit	goodeggs1.imgix.net/product_photos/A4Ygu6WRw2v8ppckXAEt_20160812-Apples_MixedSeconds_MG_7927.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
247	Organic Belle de Boskoop Apples	These large, sometimes bumpy have a sharp but sweet flavor with a relatively dense flesh. They're great in baking applications, or sliced onto a cheese plate.	1	lb	4.99	Produce	Fruit	goodeggs2.imgix.net/product_photos/ugxa01BeRylzYI0ivnxL_apples_fuji.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
230	Organic Sierra Beauty Apples	 With a robust flavor, and a crisp and juicy yellow flesh, there's no better use for this apple than eating out-of-hand (though we won't stop you from using it in a pie). This Biodynamically Grown Sierra Beauty is everything one could ever want out of a snacking apple. 	1	lb	4.99	Produce	Fruit	goodeggs1.imgix.net/product_photos/KELTVr13T0G74aVXgadn_OYJbcpt4QNWe4Ifad9kS_apples_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
870	Valencia Orange Duo	Valencia Oranges are the ultimate off-season citrus. They produce in the summer, while most citrus fruits in the winter. They're a lower acid, high sugar citrus that are great for juicing.	2	count	2.79	Produce	Fruit	goodeggs1.imgix.net/product_photos/lHTh80VOSDK8adxQIrHU_20160708-BernardRanch_Valencia_Duo_MG_4979.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
502	Cosmetically-Challenged Organic Valencia Oranges	Valencias are great for juicing, salads, cocktails and eating out of hand.These cosmetically-challenges fruits might be a bit scarred up on the outside, but they're just as sweet on the inside!These oranges were grown by Pauma Valley Citrus in Valley Center, CA, and brought to us by our trusted distributor Veritable Vegetable.	5	lb	6.99	Produce	Fruit	goodeggs1.imgix.net/product_photos/eQQL9m7dTRORBZP6xozy_Capay%20Organic%20Ugly%20Juicing%20Orange%2010lb.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
145	Organic Limequats	The Limequat is, as its name suggests, the result of a cross between a Key Lime and a Kumquat that dates back to 1909.  It's aromatic like a lime, with the texture of a kumquat.  Very few cocktails wouldn't benefit from a Limequat garnish.	0.5	lb	3.99	Produce	Fruit	goodeggs1.imgix.net/product_photos/jhPMkDXHSuMR8RMLywEe_Limequat_Deer_Creek_Heights_Ranch_Buck_Brand.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
98	White Marsh Grapefruit	Lightly acidic with plenty of sugars to balance it out, these delicious White Marsh Grapefruit from Bernard Ranches in Riverside County are the perfect healthy snack.  Try broiling the halved grapefruit with a bit of honey or brown sugar on top for a sweet and tart dessert!Note: the White Marsh can vary in flesh color from light pink to yellow-white.	5	lb	9.99	Produce	Fruit	goodeggs1.imgix.net/product_photos/csIKBVdQq621d79rFjTq_20161003-BernardRanches_Grapefruit5pd_MG_2577.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1505	Organic Japanese Cucumber	It's hard to believe it, since it just turned to springtime, but summer is starting up in Janet and Akira's magical greenhouses in Watsonville, CA. Hikari Farms is known for their amazing Japanese Cucumbers. They're thin-skinned and virtually seedless, so these delicate cukes are all sweet and lack the bitterness often associated with the thick-skinned, rigid, and heavily-seeded slicer cucumbers you'd generally find at the supermarket. Perfect for cutting into thin spears and dipping into hummus or chopped roughly into your next fresh green salad.	1	count	1.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/I5cfzT05QKeUguoBEFYw_20160607-Hikari_JapaneseCucumber_MG_1445.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1080	Organic Small Slicing Cucumber	Slice into salads or layer onto sandwiches, these all-purpose cukes are sweet and crunchy.These Organic Cucumbers were grown by the Sanchez Brothers in Carpinteria, CA.	1	count	1.79	Produce	Vegetables	goodeggs2.imgix.net/product_photos/z8HqBCT8uuU1q3THOzw6_20160518-Lakeside_Cucumber_MG_0046.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
806	Organic Japanese Cucumber	Hikari Farms is known for their amazing Japanese Cucumbers. Thin-skinned and virtually seedless, these cukes lack the bitterness often associated with thick-skinned, rigid, heavily-seeded slicer cucumbers you'd generally find at the supermarket. Perfect for cutting into thin spears and dipping into hummus or chopped roughly into your next fresh green salad. Springtime may have just started, but it's already summer in Janet and Akira's magical greenhouses in Watsonville, CA.	1	lb	5.49	Produce	Vegetables	goodeggs1.imgix.net/product_photos/LibzqbVgTXON4EUIPJPW_Hikari_Japanese_Cucumber_Trio.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
455	Organic Mediterranean Cucumbers	These delightful Mediterranean Cucumbers are a crowd favorite! And for good reason: their delicate skin is paper-thin, not waxy or bitter like some varieties, and their flesh is sweet, crisp, refreshing, and virtually seedless. Chop them into cubes and toss into a bowl with some feta cheese, strawberries, and fresh croutons for a delightful spring/summer bread salad! Slice them lengthwise, scoop out the center, and fill with your favorite dip of choice for a nostalgic snack to go. So many ways to enjoy this summer treat!	1	lb	5.99	Produce	Vegetables	goodeggs1.imgix.net/product_photos/QQOUnw2LTByXq4KsuC9Z_23Tack59QyiTKHkD5I2v_kyfug6vQWIFzX3G50hpPHnqj29bJralJzb9kEvvLCVA.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
277	Organic Mixed Summer Squash	Summer squash makes a great grilling addition, as the Sunburst, Eight Ball, and Zucchini varieties are perfect for slicing, dressing with olive oil, and tossing over the flame.	1	lb	3.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/4QdvBNYwQyuZgxIjz6d1_squash_mix.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
215	Organic Tomatillos	Fresh-picked, exceptional tomatillos. Great for chili, enchiladas, salsa and anything else you can think of.	1	quart	4.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/8hF0bhABRe4JyTAdS1uC_jNUT9sRcxYevk7JwdyiSYGMNt10uWzQh-ZfIzOMF2sw.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
979	Giant Hass Avocado	These giant Hass Avocados have a high oil content, a creamy texture, and a sweet flavor. The Brokaws are in their last few weeks of the California season, so enjoy these while you can!	1	count	3.49	Produce	Vegetables	goodeggs1.imgix.net/product_photos/iz0V7J3YTCGzWzEdVQUs_avocado.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
264	Organic Large Fuerte Avocado Trio	The Fuerte Avocado is your grandmother's avocado.  In fact, it wasn't so long ago that the Hass held little to no commercial appeal because it turned black when ripe.  In the 1950's, before the Hass reigned supreme, the Fuerte accounted for nearly two-thirds of all California avocado production, so people were more used to this thinner- and green-skinned avocado.  And even though the Hass is pretty much the only domestic avocado you find anymore outside of California and Florida, the Fuerte has a thriving fan club in the Golden State.  Once you spread some creamy Fuerte goodness over a thick slab of hearty toast, you'll understand why.	3	count	6.99	Produce	Vegetables	goodeggs1.imgix.net/product_photos/JUESie94TZ6pmrdDkrEy_Fuerte_Avocado_Trio_Ranch_Vazquez_48ct.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
2754	Organic Carrots	Sweet and crisp, these carrots are tasty cooked and raw. Try them roasted whole for a fancy side-dish, or sweep them through your favorite dip for an easy snack.	1	bunch	2.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/KKM5jIDZTDeVoB7uvVHJ_Medium%20Bunched%20Carrots%20Happy%20Boy.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1216	Rainbow Carrots	As delicious as they are beautiful, Martin's Rainbow carrots are great for shaving raw into salads or roasting for a multi-colored side dish.	1	lb	2.49	Produce	Vegetables	goodeggs1.imgix.net/product_photos/pdd4QhpVRwaI3vDKQqtn_20161006-MixedCarrots_MG_3182.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
912	Organic Carrots	Crunchy and sweet Organic Carrots. Great for shaving into salads or steaming and topping with dill for a healthy and hearty side.	1	lb	1.49	Produce	Vegetables	goodeggs1.imgix.net/product_photos/pWksMSO2TyZ4gUT4SciN_carrots_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
741	Organic Baby Carrots	Sweet, tender baby carrots from Happy Boy Farms make a delightful snack when swept through hummus and a beautiful side-dish when roasted whole with aromatic herbs and garlic. Enjoy these while they last!	1	bunch	2.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/5kmAHdb2QYKm2CPOdaor_Baby%20Bunched%20Carrots%20Happy%20Boy.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
698	Organic Celery	Celery is one of those fine vegetable that are as good raw as they are cooked. Try it in an autumn salad with dates and pecorino with a sherry vinaigrette.	1	head	1.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/yD6Alc9mSe6pyzueZD0g_celery_01%20%282%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
257	Organic Celery Root with Greens	Great for gratins, soups, mashes and roasted vegetable medleys, celery root is an awesome substitute for any recipe that calls for potatoes or turnips. While reminiscent of celery itself, it has a much sweeter, earthy appeal that warms the soul on a cool winter night.The greens may be a bit more bitter than standard celery, but are great used in soups or stews!	1	count	2.99	Produce	Vegetables	goodeggs1.imgix.net/product_photos/EvEkR06eQDOLQHOQMMw3_celeriac%202.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1223	Organic Medium Garnet Sweet Potatoes	This classic variety of sweet potato has a burgundy skin and deep orange flesh. Wash them, poke a few holes in them, toss them on a baking sheet, and you'll have a sweet and filling side by the time you've finished prepping the rest of your dinner.	1	lb	2.79	Produce	Vegetables	goodeggs1.imgix.net/product_photos/3fRTu31ETXqlCtC4vX5A_Sweet_Potatoes.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
995	Organic Russet Potato Trio	Once the supply of storage potatoes starts to dwindle at the farms we work with directly, we rely heavily on our trusted distributor, Veritable Vegetable, to source the highest quality organic potatoes they can find.  These Russet Potatoes may be grown by one of the few trusted growers and labels Veritable Vegetable works with, including Nature's Pride, Fern Ridge, and Noonan. We'll do our best to update you as Veritable Vegetable's source changes.Today's Organic Russet Potatoes are coming from: Nature's Pride in Tulelake, CA.____________________________________________Veritable Vegetable: A Unique Organic DistributorAs an organic produce distributor with over 40 years of experience, Veritable Vegetable has benefited from the creativity and hard work of our employees, and the deep relationships we’ve formed with our growers. We’re proud of our reputation for quality and integrity. As a mission–driven company, we make every business decision based on a set of core values. Because we believe in supporting our growers, we maintain visibility for each of the 200+ farm labels we carry and communicate the distance each grower is from our warehouse in San Francisco. Our environmental initiatives are vast: not only do we transport our organic produce via an award winning, environmentally sustainable green fleet of trucks and trailers; we also divert 99% of our waste stream through a vigorous waste management program and the use of reusable pallets, crates and fabric wraps. Additionally, our solar array generates 70% of our electricity needs. We actively support our community by creating unique partnerships with local and national organizations, donating time, produce, and resources to sustainability efforts, and by weighing in on policy initiatives that impact sustainable food systems. Veritable Vegetable is a woman-owned, certified B Corporation, using the power of business to solve social and environmental challenges.	3	count	1.99	Produce	Vegetables	goodeggs1.imgix.net/product_photos/mnkbPfIQEG5JplKmbYIg_Russet_Potato_3pack_90ct.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
828	Organic Small German Butterball Potatoes	German Butterballs are sweet, fluffy and make the perfect mashed potatoes.	1	lb	2.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/TJagh2tjRYuNyAjChjdL_20161003-TerraFirma_GermanButterball_MG_2568.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
720	Organic Japanese Sweet Potatoes	These sweet potatoes have a firm, white flesh! These babies cook a little differently than their orange-fleshed cousins, so if you're unfamiliar read on: while orange sweet potatoes become soft and fluffy when cooked, white sweet potatoes remain dense and firm, making them an excellent candidate for dishes like a breakfast hash, oven roasted sweet potato fries, or chopped into chunks and added to hearty soups or stews.	1	lb	2.99	Produce	Vegetables	goodeggs1.imgix.net/product_photos/F62B1mB0S6aMLYT2FQ9R_jcWyBZvB5Dqbug3SNkrewYssa657h2iMDhee-4NdwuY.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
546	Organic Beauregard Sweet Potatoes	These organic sweet potatoes have a rich, bright orange flesh and a creamy sweetness that can't be beat! Bake or roast to your heart's content.	3	lb	7.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/fjsvrSRvRBKL80f0EqOg_cQ98bhSTTiuqjcPe4f9z_5t8bJBQ-fwomaGXy7UMvcK0ZmklAe_mMMsHlI0czhos.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
366	Yellow Potatoes	Martin grows a number of heirloom German potato varieties, and this yellow-skinned, yellow-fleshed variety is one of his favorites. Great for roasting.	1	lb	3.49	Produce	Vegetables	goodeggs1.imgix.net/product_photos/6ShHtiSRY217Dpobfkxw_potatoes_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
359	Red Beets	With their blood red color, these beets are richly sweet. Boiled or roasted, these beets are great simply topped with butter or chopped into a fresh salad.	1	lb	2.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/ASlZxFUsTyyS9b0tnEfw_beets_loose_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
357	Ruby Crescent Fingerling Potatoes	These Ruby Crescent Fingerling Potatoes are the perfect small size for roasting whole or halved with maximum surface area. Martin's potatoes should be used within a few days of purchase. They should be kept in a cool, dark spot to prevent moisture loss and sprouting.	1	lb	3.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/siO8nEdgS46Ufx04v0Rw_potatoes_fingerling_banana.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
774	Organic Romanesco	Fun, fractal, and festive, this Romanesco Cauliflower is just the thing to spruce up any winter fare. Sweet and firmly textured like white cauliflower, a rich broccoli-like flavor make this veggie perfect to carry the weight of any stir-fry, soup, or oven-roasted mix.	1	count	4.99	Produce	Vegetables	goodeggs1.imgix.net/product_photos/l7f5YtAdRYWFFV9P8fVe_koSUig53TFWykDTFO8YO_iWOqj9d2GG31DDrduwt9pYCwbpcSgpzarODPjnL-APs.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
468	Organic Cauliflower	This beautiful Brassica can be roasted or added to any stir-fry.  Lakeside Organics grows these large cauliflower heads down in Watsonville, CA.	2	lb	6.99	Produce	Vegetables	goodeggs1.imgix.net/product_photos/fpp8dkzSPiJ6S8PIut8Q_cauliflower_01%20copy.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
162	Organic Rapini Greens	This relative of Broccoli has a bit more of a mustardy kick.  Stir-fry these greens with garlic and red pepper flakes for a quick side!	1	bunch	2.49	Produce	Vegetables	goodeggs1.imgix.net/product_photos/zsovDPljQcW4ibbHxNm2_Rapini_Greens_Riverdog_Huge.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
803	Organic Brussels Sprouts	Tender and young, Brussels sprouts are a seasonal treat that should not be missed. Cook them on high heat to caramelize, which brings out their naturally sweet and rich flavor.Note: organically-grown Brussels Sprouts have had a difficult season due to early heat and then some wet and cold weather.  While Lakeside generally does a pretty good job of sorting through and cleaning up their Brussels, you should expect these to look less perfect than conventional Brussels Sprouts you might find at the supermarket.	1	lb	7.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/e6moGaonRyKtCui66Kew_Brussels_Spouts_03%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
743	Organic Small Butternut Squash	Classic long-lasting autumnal vegetable to be used in a wide range of recipes. Soups, roasts, even homemade baby food!	1	count	3.49	Produce	Vegetables	goodeggs2.imgix.net/product_photos/WaDbmdyHSaCn23dfCs57_ButternutSquash-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
493	Organic Delicata Squash	Delicata is the darling of winter squash, as they're sweet, quick roasting and can even be pan fried with your favorite herbs.	2	lb	4.99	Produce	Vegetables	goodeggs1.imgix.net/product_photos/LZWxKr5fRMifc7Yl4BMl_squash_delicata_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
352	Organic Medium Artichoke Duo	The Santa Cruz and Watsonville region is world renowned for it's artichoke production, and Rodoni Farms has led the way in growing them organically. Artichokes are surprisingly versatile. While they are easily enjoyed by boiling with lemon and eating with a garlic aioli, one should experiment with soups, dips and using the hearts to top a home baked pizza.	2	count	3.99	Produce	Vegetables	goodeggs1.imgix.net/product_photos/O3CPwDCWScm9GbBhNyOB_artichokes.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
319	Organic Acorn Squash	Acorn Squash has a light, corn-like sweetness, so it takes on other flavors very well. Its large seed cavity is well suited for stuffing, so load it up with quinoa and seasonal veggies for a healthy main course.	1	count	1.99	Produce	Vegetables	goodeggs1.imgix.net/product_photos/JBQTI9yDRwa33Xmi1iMv_squash_acorn_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
141	Organic Red Kuri Squash	These hubbard-type squash has a distinctly chestnutty flavor that pairs well with alliums, bay leaves and bright sweetnesses like cranberries. The Red Kuri can be hard to skin raw, so it's best cooked with the skin on or cubed and roasted. When fully cooked, the skin is edible, just like a Delicata! It has a smooth, silky orange flesh.	1	count	4.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/qtOd4xxnQbKeGiqnUuNg_squash_2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
44	Organic Small Spaghetti Squash	This incredible squash has spaghetti-like flesh! Bake the squash, fork out the stringy flesh and sauté with onions, garlic and parsley for a unique take on aglio olio!These squash were grown by Johnston Family Organics in Woodland, CA, and brought to us by our trusted distributor partner, Earl's Organic Produce.	1	count	2.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/VauTelftRSonLHVmzVHP_squash_spaghetti_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
401	Organic Cherry Tomato Medley	Farmer's choice of the best looking cherry tomatoes that day. Possible varieties include Sweet 100's, Sun Gold, Indigo Rose, and Black cherry tomatoes.	1	pint	4.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/W3iZfKtERfCCn9AbUp4p_AJs1f1HTC6tYFe1pTf0O_y9UxYYbTP2uDt0s8m3Tc_hQvlQLfLTuaaOivxSqMe_Pb38tI9knnie2BL-ZFVGPzqGbKSeQeZAFl7IMPeYgB0.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
288	Organic Padron Peppers	Padron Peppers are a Spanish appetizer that took hold in our part of the globe over the past ten years. They're a crowd-pleaser with the easiest preparation: simply sauté on high heat in a well-oiled pan until the skin is blistered. Salt, serve, and dig in!	0.5	lb	4.99	Produce	Vegetables	goodeggs1.imgix.net/product_photos/rjGimZzjQKgjs9UD6KSW_20160726-FullBelly_Padron_1-2pd_MG_5819%20%283%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
210	Organic Serrano Pepper Trio	Hot Peppers! Perfect for salsa and great in Thai food.	3	count	0.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/u5ZaAEOQTmyZJuDlaZLq_peppers_serrano%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
236	Organic Purple Bell Peppers	Add some beautiful color to your next green salad or complete the rainbow in your next fajita mix with these Organic Purple Bell Peppers! They're refreshingly sweet, crunchy and juicy.	1	lb	4.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/vBel6SJRQvWOBbnDxIfz_bell_pepper_purple.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
94	Organic Jalapeño Chile Trio	Jalapeños are your classic mild-heat pepper. Sliced into thin rounds, they're great for topping a nice warm bowl of pho, or diced up, they're an essential component of Pico de Gallo.	3	count	0.99	Produce	Vegetables	goodeggs1.imgix.net/product_photos/tAZVUSCCQEGRjICpu3jm_peppers_jalepenos.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
387	Organic Watermelon Radishes	Mostly sweet, with a mild kick, these striking Watermelon Radishes are great sliced thinly into a salad. Make wedges or spears for dipping, or try roasting them with other root veggies!	1	lb	1.99	Produce	Vegetables	goodeggs1.imgix.net/product_photos/rFL7afRQA27pzqqBdmdj_radish_watermelon_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
192	Organic Jerusalem Artichoke	Great for gratins, mashes and roasted vegetable medleys, Jerusalem Artichokes (aka Sunchokes) are a deliciously sweet tuber of a plant in the sunflower family.  They have a sweetness reminiscent of artichokes, with a texture closer to that of a potato, but a bit less starchy.	1	lb	5.99	Produce	Vegetables	goodeggs1.imgix.net/product_photos/mgCclCTTVKbTsicPzQrQ_sunchoke_04.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
175	Organic Rutabaga	Rutabaga is one of the many misunderstood root veggies. If allowed to brown a bit in the roasting process, Rutabagas can become quite sweet. Pair with Turnips and Carrots for a seasonal mixed veggie roast.	1	lb	2.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/vAmMtYZRsSHoYkvO1yx9_Rutabaga-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
127	Organic Pink Beauty Radishes	Crunchy with a slight kick, these beautifully vibrant radishes will add some pizazz to your next green salad.	1	bunch	1.99	Produce	Vegetables	goodeggs2.imgix.net/product_photos/q1wdqvezQC6A7YnAV5Bx_radish_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
732	Organic Baby Rainbow Chard	Baby Mixed chard is the younger leaves of the chard plant. The younger shoots are more delicate and sweet than the mature versions which makes this mix great for adding to a salad or lightly sauteing.	0.5	lb	3.99	Produce	Greens	goodeggs2.imgix.net/product_photos/vIJi0XDSSH2HLVqGashN_wywVnMioQdii2c4n87w1_mixed_chard_04.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
469	Organic Rainbow Chard	As tasty as it is colorful, Rainbow Chard  has a balanced, slightly savory flavor. Try pickling the stems for a delightful, beautiful snack.	1	bunch	2.99	Produce	Greens	goodeggs2.imgix.net/product_photos/ZXZwEw3uRCWQXar7L4on_CPk4j0uNlyfgouMO2QZvofrY6CxPgAd3TQJLZpHihEg.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
349	Organic Large Red Cabbage	Sweet and hearty, Lakeside Organic's Red Cabbage is perfect for soups, stews and slaws!	1	count	2.99	Produce	Greens	goodeggs2.imgix.net/product_photos/vvYw5oKZRYqhkIs8IlhQ_eat_well_cabbage_red.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
332	Organic Large Green Cabbage	Sweet and hearty, Lakeside Organic's green cabbage is perfect for soups, stews and slaws!	1	head	2.99	Produce	Greens	goodeggs1.imgix.net/product_photos/SaQTwWuaT3OwtbZWp7KY_GreenCabbage-1.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
313	Organic Collard Greens	Beautiful organic Collard Greens from Full Belly Farm. The collard plant produces large, dark-colored, edible leaves. These greens are high in vitamin C and soluble fiber, and contain multiple nutrients with potent anticancer properties! Collards are closely related to cabbage and broccoli. We like to pair them with fresh black eyed peas!	1	bunch	2.29	Produce	Greens	goodeggs1.imgix.net/product_photos/UwD66Yw7RcCPMSWWuKzw_Collards.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
194	Organic Komatsuna Greens	These amazingly tender Japanese mustard greens have a spinach-y taste with a mild radish-y kick.  It can be eaten raw or cooked.  It's great for stir-fries--garlic and shiitake mushrooms go amazingly well with Komatsuna--or hotpot dishes. They were greenhouse grown, giving them a light flavor and a delicate texture.They're high in vitamins C, A, K, Calcium and Fiber.100g of Komtsuna contains: 130mg of vitamin C (162% dv)495mcg vitamin A (61% dv)210mg Calcium (21% dv)2.8g fiber	1	bunch	3.49	Produce	Greens	goodeggs1.imgix.net/product_photos/fzNtDId1SqmUAAaxUCsP_Hikari_Komatsuna_Tender_Bunch.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1446	Organic Baby Spinach	Full Belly Spinach has a deep green color and a springy, crisp texture that makes it perfect for a fresh salad or sandwich topping.  It has a sweet flavor that melts in your mouth! Not to mention, its hearty leaves holds up in most recipes that call for spinach—from soups and dips to lasagnas and quiches!	0.5	lb	3.99	Produce	Greens	goodeggs2.imgix.net/product_photos/4HP7uJQ7QXuxNB63vDrv_spinach_07.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
274	Organic Bunched Spinach	Full Belly Spinach has a deep green color and a springy, crisp texture that makes it perfect for a fresh salad or sandwich topping.  It has a sweet flavor that melts in your mouth! Not to mention, its hearty leaves holds up in most recipes that call for spinach—from soups and dips to lasagnas and quiches!	1	bunch	2.99	Produce	Greens	goodeggs2.imgix.net/product_photos/fxtIjG8eTAKIBplXMih9_Spinach.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
248	Organic Juicing Lacinato Kale	Too small to bunch, slightly sunburnt, a small hole or tear: there are many reasons Lacinato Kale might end up getting tossed instead of sold on the retail shelf. We're happy to partner with Alba Organics to find a happy home for these perfectly delicious loose leaves of Lacinato Kale. They're great for juicing, making chips, or even sautéing!	0.5	lb	1.79	Produce	Greens	goodeggs2.imgix.net/product_photos/UKof4UH9T4GuYrJGkIQg_Kale_dino_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
232	Organic Lacinato Kale	Lacinato is a classic Italian variety of kale, also known as Tuscan Kale or Dino Kale.  During the winter months, the cold nights and occasional frosts make this kale even sweeter.	1	bunch	2.99	Produce	Greens	goodeggs2.imgix.net/product_photos/L5DBbkCwRGCJJIcTE1v5_Kale_dino_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
90	Organic Red Russian Kale	The tender leaves of this Red Russian Kale are sweet and nutritious.	1	bunch	2.79	Produce	Greens	goodeggs1.imgix.net/product_photos/lNZVLEcSl6aZlVGab1hA_JD0s-JmzIa_rQVwzRVb9AEXaPsZIh9F_7AsJSSAc-Cs.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1343	Pre-Washed Organic Salad Mix	A delightfully fresh mix of sweet, tender baby lettuces with other baby salad greens. You might find small leaves of frisee, tatsoi, radicchio, escarole, baby beet greens and other greens with earthy, spicy and/or bitter flavors.Comes pre-washed, though we always suggest an extra rinse!	0.5	lb	3.79	Produce	Greens	goodeggs1.imgix.net/product_photos/Y1yIPH3RpaFIgUJuiJcw__BWnWRQNxD3qcTNVtBFGuNAFEJdOd4_b71bNdP75Wtw.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
495	Organic Belgian Endive	"EN-dive," "on-DEEV," no matter how you pronounce it, this crunchy, sweet veggie is perfect for boats, or sliced into salads.Belgian Endive is part of the chicory family, along with Radicchio, Frisée, Escarole, and Dandelion Greens, but because their secondary growth period happens indoors, without any light, they have only a very mild amount of the characteristic bitterness of that family.	0.5	lb	3.99	Produce	Greens	goodeggs2.imgix.net/product_photos/oDyfJ6LLQc2eQQlY3zHi_endive.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
324	Pre-Washed Aquaponic Salad Mix	Farmers Choice!  We harvest the freshest heads each week to delight your senses with a unique and delicious combination of flavors, textures and colors.  Contains 3-5 of the following varieties: By buying our lettuce mix, you just saved 7+ gallons of water compared to a similar mix grown in soil!Red ButterGreen ButterRed Oakleaf Green OakleafRed CrispGreen CrispRed IncisedGreen IncisedGalacticBreen	0.5	lb	3.99	Produce	Greens	goodeggs1.imgix.net/product_photos/MKNtr8BS600raInGOZcA_lettuce_04.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
296	Aquaponic Green Living Butter Lettuce	Butter lettuce is named for its smooth buttery texture and delicate flavors.  Excellent as a stand alone salad or mixed with other types to create a variety of textures, flavors and colors.  Our lettuce comes with the roots still attached for maximum freshness and flavor!By buying our Green Butterhead, you just saved 7+ gallons of water compared to similar lettuce grown in soil.	1	head	1.99	Produce	Greens	goodeggs2.imgix.net/product_photos/DoDBnwzZTOmPM8566fxQ_20161013-Ourboros_GreenButterhead_MG_3652.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
220	Pre-Washed Aquaponic Deluxe Salad Mix	A tantalizing mixture of our best lettuce with baby Red Veined Sorrel, known as Hearts of Fire, Ruby Streaks Mustard Greens, Tatsoi, and a touch of Watercress to add texture and a hint of sour and spice to your evening salad.By buying our Deluxe Salad mix, you just saved 7+ gallons of water compared to a similar mix grown in soil!	0.5	lb	4.99	Produce	Greens	goodeggs1.imgix.net/product_photos/BpQuWJART0KvyLLTcCYQ_JLbuiqGntNdBBbdHhg0jxmSoydYEri26ZJ41boS3ynM.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
167	Aquaponic Living Baby Lettuce Trio	A trio of our freshest, most delicious baby head lettuces.  Baby lettuces add a tenderness and sweetness to any salad combination.  We include three different varieties to provide a mixture of flavors, textures and colors to make your salad mix exceptional!By buying out Baby Lettuce Trio, you just saved 12+ gallons of water compared to lettuce grown in soil!	3	head	4.19	Produce	Greens	goodeggs2.imgix.net/product_photos/AjFdA1XVSWaO8wZtxp3h_HaXtfUA7n5WWwosQm_qAvn9ttVRLPzoAjq2n6GoIzio.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
120	Organic Green Butter Lettuce	Butter Lettuces are just as their name suggests: like butter! Their soft cup-shaped leaves have a buttery texture. They have loosely shaped leaves often resemble a flowering rose and will make a beautiful and tasty salad.	1	head	2.79	Produce	Greens	goodeggs2.imgix.net/product_photos/75QiIw75QO69WpvJP2Dg_HydroponicLettuce1.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
221	Aquaponic Living Butter Lettuce	A duo of Red and Green Butter lettuce.  Butter lettuce is named for its smooth buttery texture and delicate flavors.  Excellent as a stand alone salad or mixed with other types to create a variety of textures, flavors and colors.  Our lettuce comes with the roots still attached for maximum freshness and flavor!By buying our Duo of Butterheads, you just saved 14+ gallons of water compared to similar lettuce grown in soil.	2	head	4.99	Produce	Greens	goodeggs2.imgix.net/product_photos/Jitk0mA4T7wTAlIQbatk_lettuce_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
95	Organic Sorrel (Kid Spinach)	Sorrel goes by many names but the one that I like best is "kid spinach".  That's what I call it because it's one of the only green leaves that my kids will eat !!!  If your kids are finicky eaters, than sorrel will probably win them over with its lemony taste.It's great for adults also.  Sorrel can be used in soups to make a green borscht, in salads and stews or on a sandwich.  I love to use the leaves like a tortilla, filling them with a little refried beans, panela cheese or even a thin slice of jicama.  It's also awesome in pesto, as a straight substitute for basil.  I am sure you can come up with other uses as well. Each "bunch" weighs approximately a quarter-pound, so it is enough to keep you happy.   We hope that you'll try it and love it.	1	bunch	2.79	Produce	Greens	goodeggs1.imgix.net/product_photos/kQWC7qsURWqN6CnoS50h_FK1A7646.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
113	Organic Wasabi Arugula	Crisp, green leaves with the same wasabi flavor as in the Japanese condiment.  An intense peppery flavor as well as a a slight hint of arugula.  They come from the mustard family, along with broccoli, cabbage, radish and collard greens.They're high in vitamins C, A, Calcium and Iron.Wasabi Arugula is most popular eaten raw, as it loses its peppery taste when cooked.  It's often used as an accent in salads, with Ahi Tuna, or in sushi.  Add it to your favorite green salad--it's great paired with sweet, creamy dressings--or include in wraps or sandwiches. For a quick project and a special treat, substitute Wasabi Arugula for basil to make a peppery pesto.Enjoy!	1	count	4.99	Produce	Greens	goodeggs1.imgix.net/product_photos/BXTCTsRpSmirW13DnSBg_Hikari_Wasabi_Arugula_Clamshell.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
99	Organic Baby Wild Arugula	Slightly spicy, baby leaves of tender, sweet Wild Arugula are perfect for adding a mustardy kick to a salad or sandwich.This Arugula was grown by The Salad Farm in Hollister, CA, and brought to us by our trusted distributor partner, Earl's Organic Produce.	0.5	lb	3.99	Produce	Greens	goodeggs1.imgix.net/product_photos/IXkuBC6RSmM2ntowVGGg_arugula_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
231	Organic Pea Shoots (4oz)	Very young green pea shoots with a fresh pea flavor for salads, wraps, quick stir fry, or wilting with hot water. Eat fresh in salads for that fresh pea flavor all year. Great crunch in a fresh spring roll. For an Asian noodle dish, place pea shoots in the colander and drain the hot noodle over them for the perfect wilt. For your stir fry drop the pea shoots in to retain some crunch. All young greens concentrate the nutrition of the mature vegetable.Packed with vitamins A, C and folic acid, Pea Shoots are a delicious, nutritious modern slant on the classic British garden pea. Lyndel Costain, B.Sc.RD, award winning dietitian and author of Super Nutrients Handbook, says, “Pea Shoots are a nutritious leaf with high levels of vitamin C and vitamin A. A 50g bag of these tasty greens offers more than half of the RDA for vitamin C, a quarter of the RDA for vitamin A and significant amounts of folic acid. It is great news that this healthy and simple to prepare vegetable leaf is readily available to consumers.”From http://www.peashoots.com/peashoots-nutrition.htm	4	oz	3.99	Produce	Greens	goodeggs1.imgix.net/product_photos/8re0JSqSYyDfeB9uxwbI_UYqaOC-Tum2HJrBVLxp_fBox5ZfHFN0FyyHSxBjCxDk.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
184	Organic Salad Mix	A combination of some of your favorite New Natives micro and baby greens. Sunflower Greens, Pea Shoots, and our Micro Arugula, Broccoli, Kale, Kohlrabi, and Daikon Radish ready to mix straight into your salad bowl. With New Natives' Salad Mix it is easier than ever to bolster your salad with great nutrition and amazing flavor.From the USDA Agricultural Research Service: In general, microgreens contained considerably higher levels of vitamins and carotenoids—about five times greater—than their mature plant counterparts, .......http//en.wikipedia.org/wiki/Micro_greens 	4	oz	4.99	Produce	Greens	goodeggs1.imgix.net/product_photos/OmGkEWwUREGvDRPcZiBp_T2kwFO0Vo4x3v-x7bMif-0IxJiiipEJbLbue5fJfeHQ.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
146	Organic Micro Arugula	Very Arugula!! Super packed with flavor and nutrition. Sprinkle our little greens on your salad, pasta just before you serve it, or try them on sandwiches and in wraps. From the USDA Agricultural Research Service: In general, microgreens contained considerably higher levels of vitamins and carotenoids—about five times greater—than their mature plant counterparts, .......http//en.wikipedia.org/wiki/Micro_greens 	2.5	oz	4.49	Produce	Greens	goodeggs1.imgix.net/product_photos/gb8VcfESt6uxDZhPgkya_AhBdUmeQyVzkhsC_4BPN0lfPTTd2v78g_nrkYjEFpnk.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
100	Organic Micro Broccoli	This is the really, really nutritious one and it tastes great! Top off a salad, soup, rice bowl, sandwich, or just eat em out of the container. Crunchy, fresh, and full of flavor.	2.5	oz	4.49	Produce	Greens	goodeggs1.imgix.net/product_photos/6ANVIwotQNS9h0DI48wu_nEVAZCOBVtqfEa8kEpqgB8adHd7ho6jfrfFggAyluy4.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1757	Organic Crimini Mushrooms	The classic Crimini is widely versatile, as many dishes can benefit from their rich, meaty, and earthy flavors. A quickly sauté with butter, garlic, and your favorite herb always amounts to a tasty starter, or add a few to your next late night grilled cheese, vegetarian nut roast, or lasagna.	8	oz	2.99	Produce	Mushrooms	goodeggs2.imgix.net/product_photos/e4LG13KjSfWv1IkxjbW3_r8dVolYMQAu1nt8clGF9_s9gy2ycTTsCfDYLiJ77d_z6_ky29DCzM-yRUzrxvFEsY6lkSI7-uK4UFifIJd4vk.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
840	Fresh Organic Shiitake Mushrooms	Shiitake is also known as "black mushroom" of Oriental cuisine.  They are full-bodied with a meaty texture and distinctively woodsy flavor. They are one of the most versatile mushrooms for a novice of exotic mushrooms and high in both protein and vitamin D.	6	oz	5.79	Produce	Mushrooms	goodeggs1.imgix.net/product_photos/dNIfB5RoRyerIt9qJMzl_FK1A4406.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
486	Organic White Button Mushrooms	White Mushrooms are the same species as Criminis, but younger, resulting in a closed cap and a meatier texture. They have a clean, fresh flavor that makes them great candidates for eating raw.	8	oz	2.79	Produce	Mushrooms	goodeggs2.imgix.net/product_photos/LqZVvgoTtKUcNuKgPxLW_p9MJXXLkQTWA6S00j2DR_jmseGhEy-tm8FssZRSiV8qOROVghhW2GtLBBhrC9MMg.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
304	Fresh Organic Maitake Mushroom	Maitake are also know as Hen of the Woods and can be gathered wild on the East Coast.  Our cultivated organic Maitake have a firm crisp texture and intense roasted chicken/ earthy mushroom flavor.  Known for it's immune enhancing abilities these mushrooms are also one of the best culinary mushrooms to eat.  They are easy to clean and can last for 10 days in refrigeration.  Perfect for a simple broth soup, roasting or a quick egg scramble.	6	oz	6.99	Produce	Mushrooms	goodeggs2.imgix.net/product_photos/dE9E4OFAQIWuEPrfsiKK_MUkGcMpiNF6EbWaCXKeZc_eiwvypLHhRfDCZtuyYV1k.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
161	Fresh Organic King Trumpet Mushrooms	Our Organic King Trumpets are sweet and hardy.  Usually used as a replacement for Porcini, these mushrooms are best grilled whole or cut thin and cooks with greens.  We like to cut then into long strips and use them as a noodle substitute.	6	oz	5.99	Produce	Mushrooms	goodeggs2.imgix.net/product_photos/ldu0VLTKSJy5Wlklo6kw_HdZwkxSbUmqyInszrzYYlcqr-RSn_zYrKAMrkjr1gAU.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
2670	Organic Small Yellow Onion	Don't be caught without this kitchen staple! Great for stocks, stir-fries or deep-frying!	1	count	0.29	Produce	Garlic & Onions	goodeggs2.imgix.net/product_photos/FEbdy6YQOGWpC5X4GglA_onion_large_03.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1933	Organic Garlic	Affectionately called "the stinking rose," garlic is powerfully flavorful and medicinal! Anti-inflammatory, antimicrobial, antioxidizing and anti-cancerous, it truly is a wonder of the culinary world. Garlic was first cultivated over 5,000 years ago, making it one of the oldest known vegetables, and is now a staple in every kitchen around the world.	1	count	0.99	Produce	Garlic & Onions	goodeggs1.imgix.net/product_photos/GycDcXBWTneTkmPZtm9t_Garlic-Jumbo.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1069	Organic Large Red Onion	Sweet with a bit of a kick, this kitchen staple is great raw and sliced thin or added to stir-fries.When none of the farms we work with directly have Organic Red Onions, we work with our neighbor and trusted distributed partner, Earl's Organic to source us the highest quality produce they can. This week's Red Onions were grown by Peri & Sons in California's Imperial Valley.	1	count	0.99	Produce	Garlic & Onions	goodeggs2.imgix.net/product_photos/JMH6bUZgRCJSlD7FltpQ_Hummingbird_Medium_Red_Onion2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
745	Organic Shallots	Shallots are excellent as an addition to a vinegar based dressing, roasted (as you would garlic), fried, or used in place of or with garlic and onions.  Pungently oniony when eaten raw and sweet and smooth when cooked!	0.5	lb	3.49	Produce	Garlic & Onions	goodeggs1.imgix.net/product_photos/1enx6lMWRFSY7EC9X1sL_K92N_7eT6dg2ADpqh_u_axxGc2_7kLpzzQRmfdTG05A.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
123	Organic Small Red Onions	Stock up on these sweet members of the Allium family! These small sizes are perfect for being able to use the whole thing in one sitting.Once the supply of storage onions starts to dwindle at the farms we work with directly, we rely heavily on our trusted distributor, Veritable Vegetable, to source the highest quality organic onions they can find.  These onions may be grown by one of the few trusted growers and labels Veritable Vegetable works with, including Hummingbird, Peri & Sons, Pinnacle/Foster Farms, and Heger Farms. We'll do our best to update you as Veritable Vegetable's source changes.Today's Organic Red Onions are coming from: Hummingbird.____________________________________________Veritable Vegetable: A Unique Organic DistributorAs an organic produce distributor with over 40 years of experience, Veritable Vegetable has benefited from the creativity and hard work of our employees, and the deep relationships we’ve formed with our growers. We’re proud of our reputation for quality and integrity. As a mission–driven company, we make every business decision based on a set of core values. Because we believe in supporting our growers, we maintain visibility for each of the 200+ farm labels we carry and communicate the distance each grower is from our warehouse in San Francisco. Our environmental initiatives are vast: not only do we transport our organic produce via an award winning, environmentally sustainable green fleet of trucks and trailers; we also divert 99% of our waste stream through a vigorous waste management program and the use of reusable pallets, crates and fabric wraps. Additionally, our solar array generates 70% of our electricity needs. We actively support our community by creating unique partnerships with local and national organizations, donating time, produce, and resources to sustainability efforts, and by weighing in on policy initiatives that impact sustainable food systems. Veritable Vegetable is a woman-owned, certified B Corporation, using the power of business to solve social and environmental challenges.	5	lb	7.99	Produce	Garlic & Onions	goodeggs2.imgix.net/product_photos/EbNM2eqpRJSvfPIbJ4zh_RedOnionsBulk-1.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
539	Organic Leeks	Our spring-planted, medium-large sized Pandora leeks with 1-2 inches of white flesh are nothing but young and succulent. Classic soup aside, these leeks also crisp up nice when separated into rings and roasted in the oven with a touch of oil and salt.	1	lb	2.99	Produce	Garlic & Onions	goodeggs1.imgix.net/product_photos/IjTQbzC9SHux8P7pCWJ1_leeks_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
214	Organic White Onions	White onions are somewhat sweeter with a cleaner taste than yellow onion.  They're great for soaking up flavor, so you can use them raw in a pico de gallo or cooked into a vegetable medley or a savory stew.	1	lb	1.79	Produce	Garlic & Onions	goodeggs2.imgix.net/product_photos/Y0OvHMbISSW2PshWXIZR_White%20Onion%203.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
849	Organic Cilantro	Beautiful bunches of fragrant Cilantro, straight from Watsonville, CA!	1	bunch	2.29	Produce	Herbs	goodeggs1.imgix.net/product_photos/vsqYtxzmTVOtOdUxGr1Y_cilantro_12.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
775	Organic Basil	Knoll's basil is looking beautiful right now! Full leaves of pungent, bright basil, just waiting for some sliced Heirloom Tomatoes and fresh Mozzarella. 	1	bunch	2.49	Produce	Herbs	goodeggs1.imgix.net/product_photos/M0VDe27hTumvLi4d2IvF_basil_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
410	Organic Thyme	A classic herb sure to intrigue dinner guests, thyme is amazing on roasted pork or chicken. Try it mixed in with dill and cream sauce to drizzle on top of salmon. Thyme is also great added to sautéd mushrooms or mushroom based sauces.	1	bunch	2.29	Produce	Herbs	goodeggs2.imgix.net/product_photos/jvLfForQLChJzRDE3akZ_thyme_04.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
322	Organic Chives	Excellent tossed with potatoes or thrown atop scrambled eggs!Due to the drought, this perennial herb is flowering more frequently than other, wetter years. Don't fear the flowers though: they are lovely and mild in flavor, and make a beautiful garnish and are delicious (and delightful!) when tossed into salads.	1	bunch	1.99	Produce	Herbs	goodeggs1.imgix.net/product_photos/1Q8CWwDS3GLpSBpbB9ih_Chives_02.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
293	Organic Rosemary	Rosemary is a hearty perennial herb that'll bring a liveliness and depth to winter roasts of root veggies or beef. If you only need a couple of sprigs, strip the bottom leaves first, and leave the rest in a cup of water in the fridge!	1	bunch	1.49	Produce	Herbs	goodeggs1.imgix.net/product_photos/6MFm2ENQDeQbwyFL7l8p_rosemary_08.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
260	Organic Spearmint	Our organic mint is a great addition to a salad, drinks or desert.   So refreshing !   Or, for a pot of tea, to relax after a difficult day.  Our mint is grown in a water based system so it is super green and fresh all year round, even in the hot summer months.  For tea, we suggest rinsing the mint with water, then chopping finely with a butcher's knife.  Then, add to your tea pot, fill with boiling water and let steep for a few minutes.  It's also great combined with our peppermint.  We hope you enjoy it!	1	bunch	1.99	Produce	Herbs	goodeggs2.imgix.net/product_photos/4IfcCfW9T62itD1TrzH8_mint.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
225	Organic Sage	Great in a brie and sage stuffed chicken breast and terrific on roasted broccoli. Try it in creamed onions or on roasted pork! Sage is amazing and versatile. For a real treat try spareribs with a savory sage rub including garlic, thyme, lemon, pepper and rosemary.	1	bunch	1.99	Produce	Herbs	goodeggs1.imgix.net/product_photos/XOZe7CmAQeiMiwYvAx9Y_sage_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
224	Organic Oregano	The great, classic, Italian herb. The go-to spice for pizza, for pastas and Italian style breads, oregano is also amazing on roasted tomatoes. Try it mixed into a breadcrumb with parmesan or just sprinkle it across the top of a nice feta with olive oil as an appetizer.	1	bunch	1.99	Produce	Herbs	goodeggs1.imgix.net/product_photos/NOR6OfFZQ8aAGnSEBJni_oregano_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
321	Organic Italian Flatleaf Parsley	This kitchen staple is great in soups, stews, roasts and salads.	1	bunch	1.29	Produce	Herbs	goodeggs2.imgix.net/product_photos/FMy8oacStyTh30riYHog_parsley%20%281%29.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
437	Organic Fresh Turmeric Root	Juicers and curry-makers rejoice! A new harvest of freshly-dug, barely-cured turmeric is upon is.This fresh turmeric root is brighter in flavor than its powdered counterpart.  Prepare it as you would ginger and add to fresh curries to brighten them up with a slight kick.  Turmeric also contains high levels of curcumin, a natural anti-inflammatory compound, making it a much sought-after item for adding to fresh fruit and veggie juices.Almost all commercially available fresh organic turmeric is imported from Peru or Hawaii, but we're lucky to have Whiskey Hill Farms growing this special treat for us just down the road in the Watsonville area. The wonders of heated greenhouses!	4	oz	4.99	Produce	Herbs	goodeggs2.imgix.net/product_photos/7vfp3quZSiKVGFaE8lIw_20161014-Tumeric_MG_4239.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
204	Organic Bay Leaf	An irreplaceable ingredient in your favorite hearty soups and stews like split pea, chicken or even a moroccan vegetable  soup.Picked fresh from the tree just for you.	1	bunch	1.99	Produce	Herbs	goodeggs1.imgix.net/product_photos/1oDawwRkSmKtUgNqxwYO_eat_well_bay_leaf.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
152	Organic Lemongrass	Lemongrass is a staple for Vietnamese cooking. Hikari's lemongrass is tender and not too fibrous.	1	count	1.49	Produce	Herbs	goodeggs2.imgix.net/product_photos/IKPQn9lYRkeuMx8wzL4g_Ouruboros_Lemongrass.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
87	Organic Garlic Chives	This chive variety has a slightly garlicky kick, and is great for stir-fries or for adding, coarsly chopped, into salty, brothy soups.	1	bunch	2.29	Produce	Herbs	goodeggs2.imgix.net/product_photos/mx0RepiFRiPDGnVplQyQ_garlic_chives.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
217	Organic Farmer's Choice Chrysanthemum	This species of Asteracea was first cultivated as an herb China. Chrysanthemums have grown to become a symbol of Royalty in Japan and China. They are a hearty flower with a fresh herbaceous fragrance. Trim the ends under water every day and give them fresh water for a long vase life. These Chrysanthemums may come in a variety of colors.	1	count	9.99	Produce	Flowers	goodeggs1.imgix.net/product_photos/gu5NenxTKAejQLawvf9Q_unspecified-2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
59	Medium Farm-to-Vase Bouquet	Oak Hill Farm calls these medium sized bouquets "Posies", and they're as cute and colorful as they sound! Amongst the greens are some of the finest fall flowers still blooming in Sonoma County.Chuy, the flower production manager at Oak Hill, selects different flowers each week, depending upon what's looking good. So the Posy you get might not look exactly like the one pictured, but it'll be equally as beautiful.In order to give your bouquet the longest life, give each stem a diagonal fresh cut and place in a jar of clean water. (The diagonal cut increases the surface area for each stem to uptake water.) Every couple of days, change out the water and give another fresh cut. Warm water works best.	1	bunch	11.99	Produce	Flowers	goodeggs1.imgix.net/product_photos/WTdp1fugRZqGwMsimw7R_20160606-FullBelly_SeasonalBouquet_MG_1232.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
46	Safflower	Safflower, one of humankind's earliest crops, is an annual flower bearing a passing resemblance to a thistle. Their bright orange flower heads contrast beautifully against their lush, green foliage. Long-lasting, they should live for about 10-14 days in a clean vase. Care for them by regularly changing their water and trimming their stems (especially after delivery), allowing them to up maximum amounts of water.	1	bunch	7.99	Produce	Flowers	goodeggs1.imgix.net/product_photos/0OEGYt0xQqetgvPNsk5s_20160628-FullBelly_Safflower_MG_3756.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
527	Frozen Green Peas	A favorite among our tasting table donations to the local schools, our sweet tasting green peas even get kids excited about eating veggies.  Try combining them with basil, olive oil, garlic, lemon juice, and Parmesan cheese for a fantastically simple pesto dish.	10	oz	2.69	Produce	Frozen Fruit & Vegetables	goodeggs1.imgix.net/product_photos/PZ3d3ETQwSJvxqs71CVw_FK1A9833.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
201	Frozen Sweet Corn	Flash-frozen straight from the field, our corn retains its summertime on-the-cob flavor.  Try combining it with our Cut Spinach, red pepper, garlic, and a little olive oil for the perfect stir-fry.	10	oz	2.69	Produce	Frozen Fruit & Vegetables	goodeggs2.imgix.net/product_photos/EV8UqWEoSUyIGHA149gm_FK1A0673.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
126	Frozen Sweet Potatoes	Equally at home in both sweet and savory dishes, we love these bite-size sweet potatoes for their versatility. Ingredients: Non-GMO Sweet Potatoes	10	oz	2.79	Produce	Frozen Fruit & Vegetables	goodeggs2.imgix.net/product_photos/xCCYuchmRMmXQrZ2dkyQ_FK1A7627.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
109	Frozen Cauliflower	With a subtle nutty flavor and satisfying crunch, our cauliflower florets have been carefully frozen to lock in their farm-fresh flavor. A great substitute for heavier starches like potatoes (try them mashed!) or as the base of a creamy soup.Ingredients: Non-GMO Cauliflower	10	oz	2.79	Produce	Frozen Fruit & Vegetables	goodeggs1.imgix.net/product_photos/jO52KnwWTaSfEYvuov5Q_FK1A7618.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
424	Organic Half and Half	Clover Organic Farms sources its rBST and antibiotic-free milk and cream from a select group of small, organic family farms on the North Coast of California. Our milk and cream arrives at the plant the same day the cows are milked and it is fresh pasteurized* to ensure quality while preserving its fresh farm taste and nutritional value. In 2000, we became the first U.S. dairy processor to be awarded the American Humane Certified label for humanely produced dairy products by the American Humane Association. We invite you to enjoy Clover Organic Farms Milk and Cream products in a good conscience and good health!Organic rBST and antibiotic-freeFresh pasteurized to ensure the qualityGluten freeLow sodiumPerfect for your morning coffee and your favorite family recipes!Ingredients: Certified organic grade A milk and certified organic cream	1	quart	4.29	Dairy	Cream	goodeggs2.imgix.net/product_photos/xuDRxQsOT9Kej7cydZGL_FK1A0595.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
218	Frozen Blueberries	We ensure our blueberries are sweet, plump and rich in antioxidants by flash freezing them straight from the field.Located in the heart of Oregon's lush Willamette Valley, Stahlbush Island Farms is an environmentally friendly farm and food processor committed to sustainable agriculture. Our philosophy is that farming practices should leave the soil, air, water, plant life, animals and people healthier. For us, sustainability is a continuing journey.What does it mean to be sustainable? Good question! At Stahlbush, we think it’s important to explain to people what we mean when we use this term to describe our way of farming and producing food. We define sustainable as “meeting the needs of the present without compromising the ability of future generations to meet their own needs” (based on “Report of the World Commission on Environment and Development,” United Nations, 1987). We like this definition because it shows the quest for sustainability is a philosophy. Our philosophy of sustainability guides our farming practices and affects the way we use energy and care for soil, water, people and wildlife.	10	oz	4.79	Produce	Frozen Fruit & Vegetables	goodeggs1.imgix.net/product_photos/zgptmpMTpaQMNMPdJlWk_FK1A9940.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
203	Frozen Health Berry Blend	For this super-premium berry blend, we selected the berries richest in color.  Add to smoothies for a rich breakfast.Ingredients: Marion Blackberries, Blueberries, and Black Raspberries.	10	oz	4.79	Produce	Frozen Fruit & Vegetables	goodeggs2.imgix.net/product_photos/bKQWfQ2YQBqCvoW3Oj1o_FK1A0693.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
155	Frozen Strawberries	Treat yourself to these Oregon strawberries – deep red through and through, delicate and deliciously sweet.	10	oz	4.79	Produce	Frozen Fruit & Vegetables	goodeggs1.imgix.net/product_photos/7T8cFUOtRaCYeCaQqzWm_FK1A9918.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
400	Organic Dried Mango	Peeled Snacks' Much-Ado-About-Mango® makes the perfect alternative to sugary filled snacks. Starting with whole organic mangoes harvested at the peak of ripeness, this gently sun dried snack has been preserves with no added sugar, preservatives or oils. Rich in flavor, vitamins and a variety of phytonutrients, with Peeled Snacks’ mango you can snack your way to a healthy new you.\nTo source the mangos for this snack, Peeled works directly with Mexican growers in the Western Sinaloa region. Through initiatives such as the implementation of solar panels on farms, increasing overall organic acreage in the region, and supporting cooperative organizing of workers, Peeled is a proud steward of fair labor and sustainable practices that encourage clean food production and sustain healthy communities.\nIngredients: Organic Mango	2.8	oz	3.99	Produce	Fruit & Veggie Snacks	goodeggs1.imgix.net/product_photos/qPzg4TbNRlmQFTK4ooAg_20160713-Peeled_DriedMango_MG_5175.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
188	Golden Raisins	Our sparkling Golden Raisins are a sweet and tangy bite. Add zing to your trail mix or eat them by the handful as an energy-boosting snack. Golden raisins add a natural sweetness to savory dishes and a bright burst of flavor to baked goods. Chewy, moist and delicious, these golden gems will keep you smiling!	1	pint	5.99	Produce	Fruit & Veggie Snacks	goodeggs1.imgix.net/product_photos/QUrrTUAYSeyVciy98ci1_FK1A9579.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
63	Lil' Apricots	Our sun dried ‘Lil Apricots have a mega sweet & tangy\nflavor. They are the Royal Blenheim variety which have a long history in\nCalifornia as the queens of apricots. The growers, Good Humus Produce, have been organic farming in Capay Valley since 1977 . We take their apricots, re-hydrate them to a chewy\ntexture and then cut them into bit-size bits. Great snack for kids of any age!\n\n\n\n\n\nAll of our products use ONLY organic ingredients. They are packaged in resealable, reusable zip bags for your convenience.	1.5	oz	2.99	Produce	Fruit & Veggie Snacks	goodeggs2.imgix.net/product_photos/edDISDETRJCPKOkarZoC_20160421-YoloFarmstead_Apricots_MG_7599%202.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
67	Sun Dried Peaches (7oz)	Our organic, sun-dried peaches are sulfur-free and soaked with\nCalifornia sunshine. We call ‘em ‘good and ugly’. The peaches are grown at \nFull Belly Farm, a certified organic grower in Guinda, CA. Absolutely \nnothing is added: no salt, no oil, no sugar. All of our products use ONLY organic ingredients.Our products are packaged in resealable, reusable zip bags for your convenience.	7	oz	10.49	Produce	Fruit & Veggie Snacks	goodeggs2.imgix.net/product_photos/UUqX69UdTrqfhGcPXnKG_FK1A7346.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
112	Raisins (7oz)	Our Red Flame Raisins provide a natural energy booster anytime of the day. The plump and juicy Red Flame variety raisins are not coated in any oil, unlike most raisins on the market. Benzler Farms in Fresno, CA is a certified organic grower and are a third generation farm. All of our products use ONLY organic ingredients. They are packaged in resealable, reusable zip bags for your convenience.	7	oz	3.69	Produce	Fruit & Veggie Snacks	goodeggs1.imgix.net/product_photos/2qJ9riOZQCSj0AiubEbs_FK1A3114.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
78	Khadrawi Dates	The Khadrawi Date is absolutely delicious! It's chewy and caramely with a very satisfying flavor. it would fit right in in a box of chocolates.	8	oz	5.99	Produce	Fruit & Veggie Snacks	goodeggs2.imgix.net/product_photos/HNsxqiUrQA6vOmGxn7yv_20160912-KhadrawiDates_MG_0822.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
110	Organic Spicy Raw Lemon Almonds	This Low-Glycemic snack is a divine spin on your everyday trail mix. Soaked in lemon and dehydrated at low temps for optimal digestion this spicy snack can get you through any hunger hurdles during a long day.Sprouted Almonds*, Lemon Juice*, Cayenne*, Himalayan Pink Salt	2	oz	5.99	Produce	Dried Fruit & Nuts	goodeggs2.imgix.net/product_photos/9TFDoiWWRwIOwmCv1fCA_FK1A3779.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
34	Organic Golden Flaxseed	Similar nutritional value to brown flax, it’s used in the same ways as well. Be sure to grind the seeds so your body can benefit from the low-carb, high fiber, vitamins, minerals, and antioxidants. Get your flax straight. Golden Flax has the same benefits as Brown Flax and can be used in the same creative ways. Try it ground up orsprinkled on top of your breakfast cereal, yogurt or fresh fruit.Stuff to know:High in Omega 3 fatty acidsHigh in dietary fiberEat whole, sprouted or ground for optimal health benefits Country of Origin: USA	1	lb	3.99	Produce	Dried Fruit & Nuts	goodeggs2.imgix.net/product_photos/KwueBRfqTFi2TL0tZ3gK_FK1A0232.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
182	Extra-Sharp Cheddar	Tillamook's Extra-Sharp Cheddar is aged for eighteen months, creating a rich and complex flavor that's more than perfect as wedges for a cheese platter, baked into a casserole, or sliced into a sandwich that'll be the envy of your office-mates.Contains no animal rennet (vegetarian)Ingredients: Cultured Milk, Salt, Enzymes.Allergens: Milk	8	oz	5.49	Dairy	What We Love	goodeggs2.imgix.net/product_photos/zY0m9cKTQytF1kmTUwRA_20161012-Tillamook_ExtraSharpWhite_MG_3577.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
622	Organic 2% Reduced Fat Milk	Clover Organic Farms sources its rBST and antibiotic-free milk and cream from a select group of small, organic family farms on the North Coast of California. Our milk and cream arrives at the plant the same day the cows are milked and it is fresh pasteurized* to ensure quality while preserving its fresh farm taste and nutritional value. In 2000, we became the first U.S. dairy processor to be awarded the American Humane Certified label for humanely produced dairy products by the American Humane Association. We invite you to enjoy Clover Organic Farms Milk and Cream products in a good conscience and good health!OrganicrBST and antibiotic-freeFresh pasteurized to ensure the qualityGluten freeLow sodiumExcellent source of calciumIngredients:  Certified organic grade A reduced fat milk, certified organic nonfat dry milk, vitamin A palmitate, vitamin D3	1	half gallon	4.49	Dairy	Milk	goodeggs1.imgix.net/product_photos/J35OVXygQgaO8P5e73qT_FK1A9909.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
490	Organic 2% Reduced Fat Milk	Clover Organic Farms sources its rBST and antibiotic-free milk and cream from a select group of small, organic family farms on the North Coast of California. Our milk and cream arrives at the plant the same day the cows are milked and it is fresh pasteurized to ensure quality while preserving its fresh farm taste and nutritional value. In 2000, we became the first U.S. dairy processor to be awarded the American Humane Certified label for humanely produced dairy products by the American Humane Association. We invite you to enjoy Clover Organic Farms Milk and Cream products in a good conscience and good health!OrganicrBST and antibiotic-freeFresh pasteurized to ensure the qualityGluten freeLow sodiumExcellent source of calciumIngredients:  Certified organic grade A reduced fat milk, certified organic nonfat dry milk, vitamin A palmitate, vitamin D3	1	gallon	7.99	Dairy	Milk	goodeggs1.imgix.net/product_photos/ZPr0RMbqS0WodT0eJIBQ_FK1A9932.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
284	Organic 2% Reduced Fat Milk	The cream floats to the top, just like in our Organic Whole Milk.Our Organic, Cream Top 2% Reduced Fat milk is pasteurized at 171°F for 18 seconds. Unlike most milk, which is ultra-pasteurized (at or above 280°F for at least two seconds), we preserve the true flavor of milk that results from our cows’ diet.The pasture grasses our cows graze on tend to be sweeter out here in Northern California’s Marin and Sonoma County Coasts. The first thing you’ll notice when you pop the top of our cream-top milk is its beautiful aroma. Milk is supposed to have an aroma and a fresh taste. Enjoy!Ingredients: Pasteurized Organic Reduced Fat Milk, Vitamin A Palmitate.	1	half gallon	4.99	Dairy	Milk	goodeggs1.imgix.net/product_photos/fG4sVGJ9SxyGB0GGQ2o7_FK1A5738.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
149	2% Reduced Fat Milk	Clover sources its rBST and anti-biotic-free milk and cream from a select group of small family farms on the North Coast of California. Our milk and cream arrive at the plant the same day the cows are milked and it is fresh pasteurized* to ensure quality while preserving its fresh farm taste and nutritional value. We do this so your family can enjoy Clover Milk and Cream products in a good conscience and good health!Ingredients: Milk, nonfat milk, vitamin A palmitate, vitamin D3	1	half gallon	2.49	Dairy	Milk	goodeggs2.imgix.net/product_photos/CG8lzeDSLKVz7A0K6b9A_20160422-Clover_HalfGallon_2percentMilk_MG_7830.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1063	Organic Whole Milk	Clover Organic Farms sources its rBST and antibiotic-free milk and cream from a select group of small, organic family farms on the North Coast of California. Our milk and cream arrives at the plant the same day the cows are milked and it is fresh pasteurized to ensure quality while preserving its fresh farm taste and nutritional value. In 2000, we became the first U.S. dairy processor to be awarded the American Humane Certified label for humanely produced dairy products by the American Humane Association. We invite you to enjoy Clover Organic Farms Milk and Cream products in a good conscience and good health!OrganicrBST and antibiotic-freeFresh pasteurized to ensure the qualityGluten freeLow sodiumExcellent source of calciumIngredients: Organic grade A milk, vitamin D3	1	half gallon	4.49	Dairy	Milk	goodeggs1.imgix.net/product_photos/zNv1C63zSVeKUREEH0Zj_FK1A9922.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
762	Organic Whole Milk	Our Organic, Cream Top Whole Milk is the way it used to be, with the cream on the top. The cream in our organic milk floats naturally to the top because it is non-homogenized.Straus Family Creamery Organic Whole Milk is pasteurized at 171°F for 18 seconds. Unlike most milk, which is ultra-pasteurized (at or above 280°F for at least two seconds), we preserve the true flavor of our cows’ diet.All of Straus Family Creamery’s certified organic milk products are Non-GMO Project Verified, certified kosher and gluten-free.Recyclable, reusable glass bottles.Ingredients: Pasteurized Organic Milk.	1	half gallon	4.99	Dairy	Milk	goodeggs1.imgix.net/product_photos/az8cr19SNS7CqAp4G1sX_FK1A5733.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
590	Organic Whole Milk	Clover Organic Farms sources its rBST and antibiotic-free milk and cream from a select group of small, organic family farms on the North Coast of California. Our milk and cream arrives at the plant the same day the cows are milked and it is fresh pasteurized to ensure quality while preserving its fresh farm taste and nutritional value. In 2000, we became the first U.S. dairy processor to be awarded the American Humane Certified label for humanely produced dairy products by the American Humane Association. We invite you to enjoy Clover Organic Farms Milk and Cream products in a good conscience and good health!OrganicrBST and antibiotic-freeFresh pasteurized to ensure the qualityGluten freeLow sodiumExcellent source of calciumIngredients: Organic grade A milk, vitamin D3	1	gallon	7.99	Dairy	Milk	goodeggs2.imgix.net/product_photos/cV82b2TSTdO2azipp9v3_FK1A7554.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
487	Organic Whole Milk	Please note that this milk comes in plastic containers that can be recycled or reused. One gallon is 128 oz.Our Organic, Cream Top Whole Milk is the way it used to be, with the cream on the top. The cream in our organic milk floats naturally to the top because it non-homogenized.Straus Family Creamery Organic Whole Milk is pasteurized at 171°F for 18 seconds. Unlike most milk, which is ultra-pasteurized (at or above 280°F for at least two seconds), we preserve the true flavor of our cows’ diet.The pasture grasses our cows graze on tend to be sweeter out here in Northern California’s Marin and Sonoma County Coasts. The first thing you’ll notice when you pop the top of our cream-top milk is its beautiful aroma. Milk is supposed to have an aroma and a fresh taste. Enjoy!All of Straus Family Creamery’s certified organic milk products are Non-GMO Project Verified, certified kosher and gluten-free.Ingredients: Pasteurized Organic Milk.	1	gallon	8.49	Dairy	Milk	goodeggs1.imgix.net/product_photos/F6IiAC6fQKm3RXweQWnt_FK1A5721.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
169	Organic Whole Raw Milk	OPDC raw milk is alive with fully active enzymes, a broad spectrum of\n naturally occurring beneficial bacteria, all 22 essential amino acids, \n18 good fatty acids, metabolically available vitamins, immunoglobulins, \nminerals, antioxidants, and CLA.The milk is never damaged or \nchanged by pasteurization, homogenization, or other processing. Organic \nPastures produces 100% USDA certified organic, Grade A, raw milk of \nsuper premium quality. USDA organic standards require that cows be pasture grazed just four months out of the year. OPDC goes far beyond this standard and grazes our cows on green pastures every day. In addition to green pastures, our cows are fed: a specially formulated organic mineral supplement, free choice salt and trace mineral blocks, high test organic alfalfa, and some sweet organic corn to keep them healthy and strong. A disease free life: a life with optimal health starts with a strong immune system - and raw milk is the finest immune system support food available.	1	half gallon	9.99	Dairy	Milk	goodeggs1.imgix.net/product_photos/0l2S1nG3TB6VlJhLuo6c_FK1A1924.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
148	Organic Whole Raw Milk	OPDC raw milk is alive with fully active enzymes, a broad spectrum of naturally occurring beneficial bacteria, all 22 essential amino acids, 18 good fatty acids, metabolically available vitamins, immunoglobulins, minerals, antioxidants, and CLA.The milk is never damaged or changed by pasteurization, homogenization, or other processing. Organic Pastures produces 100% USDA certified organic, Grade A, raw milk of super premium quality. USDA organic standards require that cows be pasture grazed just four months out of the year. OPDC goes far beyond this standard and grazes our cows on green pastures every day. In addition to green pastures, our cows are fed: a specially formulated organic mineral supplement, free choice salt and trace mineral blocks, high test organic alfalfa, and some sweet organic corn to keep them healthy and strong. A disease free life: a life with optimal health starts with a strong immune system - and raw milk is the finest immune system support food available.	1	gallon	17.99	Dairy	Milk	goodeggs2.imgix.net/product_photos/OQ5xJ8nNSKW99lscb2NR_FK1A1913.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
151	Organic Nonfat Milk	Please note that this milk comes in plastic containers that can be recycled or reused. One gallon is 128 ounces.Most people agree that our Organic Nonfat Milk is sweeter and richer than any skim milk they've ever tasted. It's the skim milk with the full-bodied flavor of low fat milk.Our Organic Nonfat Milk is pasteurized at 171°F for 18 seconds. Unlike most milk, which is ultra-pasteurized (at or above 280°F for at least two seconds), we preserve the true flavor of milk that results from our cows’ diet.The pasture grasses our cows graze on tend to be sweeter out here in Northern California’s Marin and Sonoma County Coasts. The first thing you’ll notice when you pop the top of our cream-top milk is its beautiful aroma. Milk is supposed to have an aroma and a fresh taste. Enjoy!All of Straus Family Creamery’s certified organic milk products are Non-GMO Project Verified, certified kosher and gluten-free.Ingredients: Pasteurized Nonfat Milk, Vitamin A Palmitate.	1	gallon	8.49	Dairy	Milk	goodeggs2.imgix.net/product_photos/oE1WF6EOQjuOHQIZ7o7J_FK1A1809.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
456	Organic 1% Low Fat Milk	Clover Organic Farms sources its rBST and antibiotic-free milk and cream from a select group of small, organic family farms on the North Coast of California. Our milk and cream arrives at the plant the same day the cows are milked and it is fresh pasteurized to ensure quality while preserving its fresh farm taste and nutritional value. In 2000, we became the first U.S. dairy processor to be awarded the American Humane Certified label for humanely produced dairy products by the American Humane Association. We invite you to enjoy Clover Organic Farms Milk and Cream products in a good conscience and good health!OrganicrBST and antibiotic-freeFresh pasteurized to ensure the qualityGluten freeLow fatExcellent source of calciumGood for reduced calorie dietsIngredients: Certified organic grade A low fat milk, certified organic nonfat dry milk, vitamin A palmitate, vitamin D3Contains Dairy	1	half gallon	4.49	Dairy	Milk	goodeggs1.imgix.net/product_photos/nGGvW18IQzqgQgA7YT78_FK1A9914.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
101	Organic 1%  Lowfat Milk	The only Organic 1% Lowfat Milk available with cream on top!Our Organic, Cream Top Lowfat milk is pasteurized at 171°F for 18 seconds. Unlike most milk, which is ultra-pasteurized (at or above 280°F for at least two seconds), we preserve the true flavor of milk that results from our cows’ diet.The pasture grasses our cows graze on tend to be sweeter out here in Northern California’s Marin and Sonoma County Coasts. The first thing you’ll notice when you pop the top of our cream-top milk is its beautiful aroma. Milk is supposed to have an aroma and a fresh taste. Enjoy!Ingredients: Pasteurized Organic Lowfat Milk, Vitamin A Palmitate.	1	half gallon	4.99	Dairy	Milk	goodeggs1.imgix.net/product_photos/0XqeB1kGTv6BucEaJvHI_FK1A5736.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
79	1% Low Fat Milk	Clover sources its rBST and anti-biotic-free milk and cream from a select group of small family farms on the North Coast of California. Our milk and cream arrive at the plant the same day the cows are milked and it is fresh pasteurized* to ensure quality while preserving its fresh farm taste and nutritional value. We do this so your family can enjoy Clover Milk and Cream products in a good conscience and good health!Ingredients:  Nonfat milk, milk, vitamin A palmitate, vitamin D3	1	half gallon	2.49	Dairy	Milk	goodeggs1.imgix.net/product_photos/ouhvVn2ET8WHH5lOvNj7_20160422-Clover_HalfGallon_1percentMilk_MG_7828.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
434	Organic Half and Half	Clover Organic Farms sources its rBST and antibiotic-free milk and cream from a select group of small, organic family farms on the North Coast of California. Our milk and cream arrives at the plant the same day the cows are milked and it is fresh pasteurized* to ensure quality while preserving its fresh farm taste and nutritional value. In 2000, we became the first U.S. dairy processor to be awarded the American Humane Certified label for humanely produced dairy products by the American Humane Association. We invite you to enjoy Clover Organic Farms Milk and Cream products in a good conscience and good health!Organic rBST and antibiotic-freeFresh pasteurized to ensure the qualityGluten freeLow sodiumPerfect for your morning coffee and your favorite family recipes!Ingredients: Certified organic grade A milk and certified organic cream	1	pint	2.49	Dairy	Cream	goodeggs2.imgix.net/product_photos/lRTcZGSsS7R0d6c3Lbsg_FK1A2031.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
150	Soy Free Pasture Raised Eggs (Medium)	These eggs come to you from Lost Marbles Ranch via the Capay Valley Farmshop.Lost Marbles RanchHi, My name is Lora Murray. Along with my husband I run a small farm playfully named Lost Marbles Ranch near Capay, northern Yolo County. My chickens are free range on irrigated pasture that has no herbicieds, pesticides or fertilizers applied. The feed they are given is GMO and soy free. I get many compliments on their eggs at farmers markets, I hope you enjoy them as well. Feel free to visit the Lost Marbles Ranch Facebook page. Thank you!	1	dozen	6.99	Dairy	Eggs	goodeggs2.imgix.net/product_photos/w79bZoLKRea6wg2yWd1N_FK1A7612.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
341	Organic Heavy Whipping Cream	Clover Organic Farms sources its rBST and antibiotic-free milk and cream from a select group of small, organic family farms on the North Coast of California. Our milk and cream arrives at the plant the same day the cows are milked and it is fresh pasteurized* to ensure quality while preserving its fresh farm taste and nutritional value. In 2000, we became the first U.S. dairy processor to be awarded the American Humane Certified label for humanely produced dairy products by the American Humane Association. We invite you to enjoy Clover Organic Farms Milk and Cream products in a good conscience and good health!OrganicrBST and antibiotic-freeFresh pasteurized to ensure the qualityMinimum 40% butter fat Gluten free Low sodiumGreat for Baking!Ingredients: Certified organic grade A cream	1	pint	4.59	Dairy	Cream	goodeggs2.imgix.net/product_photos/tynsidYQapnWxo0Fv4rA_FK1A0603.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
275	Organic Half & Half	Our Organic Half & Half is rich and delicious for your morning coffee, tea or cereal! It is made up of our Organic Milk and Organic Cream to achieve an 11% butterfat content.Our organic Half & Half is pasteurized at 171°F for 18 seconds and lightly homogenized to emulsify the milk and cream. Unlike most milk, which is ultra-pasteurized (at or above 280°F for at least two seconds), we preserve the true flavor of milk that results from our cows’ diet.Recyclable, reusable glass bottles.Ingredients: Pasteurized Organic Milk and Organic Cream.	1	pint	2.99	Dairy	Cream	goodeggs1.imgix.net/product_photos/pBJgDwveSY2Jepu1ekGK_FK1A5774.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
226	Grade A Cultured Low Fat Buttermilk	Cultured with lactic acid bacteria for flavor and thickness.Ingredients: Nonfat milk, milk, culture and salt	1	quart	1.79	Dairy	Cream	goodeggs1.imgix.net/product_photos/S6bBoHRuQT2xXDVSqZaV_FK1A9924.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1853	Organic Cage Free Brown Eggs (Large)	Organic Cage Free Large Eggs- Glaum Egg Ranch, Aptos CAMany of our customers have expressed a desire for cage-free eggs. After careful consideration and in collaboration with our producer community, we have chosen to offer organic, cage-free eggs from Glaum Egg Ranch in Aptos, CA—just south of Santa Cruz.  Glaum goes beyond the letter of the law when it comes to their layers.  These birds have outdoor access from both ends of the barn, constant access to organic feed and water, and space within the barn to spread their wings, scratch and dust bathe. The sides of the barns are screened and can be opened to allow in natural sunlight and the fresh sea breeze.A true family business, Glaum has been far ahead of the game for generations (four, to be precise) when it comes to cage-free eggs and sustainable ranching. They are the first egg ranch in California to be Certified Humane by Humane Farm Animal Care, and have produced zero manure waste since 1988. Glaum is also a member of CAAF (Community Alliance with Family Farmers), and certified organic by the USDA National Organic Program, and are well regarded within the egg producing community, even coming at the recommendation of some of our current egg producers.Follow this link to check out a video of Glaum's organic layers in action: https://www.youtube.com/watch?v=VSyxtcsSaNc&feature=youtu.beClick here to learn more about egg labeling standards	1	dozen	5.49	Dairy	Eggs	goodeggs2.imgix.net/product_photos/tFaJ9FjFS2mbP2mtXCX7_20160708-Glaum_DozenEggsMG_4926.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1279	Organic Pasture Raised Eggs (Large)	Gently Gathered Daily\n• Gluten Free\n• No Antibiotics\n• No Added Hormones\n• No Preservatives	1	dozen	7.99	Dairy	Eggs	goodeggs2.imgix.net/product_photos/ynrbcfrSS16cvaYIRVuU_FK1A9532.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
1136	Pasture Raised Eggs (Large)	Living out in the pasture, our hens are free to explore, chase bugs and snack on hearty green grasses. Three times a day, we serve them freshly mixed non-GMO feed. In the their spacious mobile coops, they lay beautiful eggs and roost for the evening."Appreciate Nature's Perfection"	1	dozen	8.29	Dairy	Eggs	goodeggs2.imgix.net/product_photos/fCQYz1HcSKeqWItobqnU_FK1A9515.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
838	Organic Pasture Raised Eggs (Medium)	Coastal Hill Farm eggs are as natural as can be.  The hens are allowed to feed on grasses, insects, and seeds, as well as given ample feed and space. These conditions make our birds comfortable and happy, which is reflected in their eggs.  Typically, the good cholesterol and omega-3 fatty acid levels are higher in chickens that are allowed to feed on greens such as grasses.Local Certified Organic Pasture Raised EggsCoastal Hill Farm, PetalumaMedium Grade AA, one dozen eggsCertified Organic by MOCA	1	dozen	8.79	Dairy	Eggs	goodeggs1.imgix.net/product_photos/G1kQkvASruj6LpXUE41m_FK1A9561.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
416	Organic Pasture Raised Eggs (Large)	Gently Gathered Daily from Pasture Raised Hens • Gluten Free\n• No Antibiotics\n• No Added Hormones\n• No Preservatives	1	half dozen	4.29	Dairy	Eggs	goodeggs2.imgix.net/product_photos/LyhxSQURQGmIl1SpPADG_FK1A9403.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
196	Pasture Raised Eggs (Large)	Living out in the pasture, our hens are free to explore, chase bugs and snack on hearty green grasses. Three times a day, we serve them freshly mixed non-GMO feed. In the their spacious mobile coops, they lay beautiful eggs and roost for the evening."Appreciate Nature's Perfection"	1	half dozen	4.29	Dairy	Eggs	goodeggs1.imgix.net/product_photos/UTAVlvPR4uSi2ygCiKyQ_FK1A9589.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
190	Organic Pasture Raised Eggs (Jumbo)	Alexandre Kids Organic Pasture Raised Large Eggs- from Alexandre Family EcoDairy Farms, Crescent City, CAHands down some of the best eggs we've ever tasted, these hens are part of a multi-species rotational grazing system, moving twice every week onto fresh green grass all year round. "5-egg" ranking from the Cornucopia Institute, certified organic, and really, really delicious! Read more about Alexandre Kids eggs here!All of the hens are raised on organic pastures under the watchful eyes of the Alexandre dairy cows and Great Pyrenees guard dogs. The hens graze on green, lush organic grass and have room to roam in the fresh coastal air and sunshine. They intermingle with the dairy cows and enjoy a natural farm life setting where they can produce the most nutritious organic eggs. Hens are housed in mobile “egg-mobiles,” designed and constructed by the Alexandre Family. The “egg-mobiles” are moved to new areas of pasture twice a week so the pasture gets desired fertilizer and to prevent overgrazing. Our chickens eat certified organic feeds; irrigated dairy pastures consisting of 50 to 100 variety of plant species ranging from grasses, forbs, herbs and clovers; oyster shell, with limited daily feeding of mixture of organic grains and minerals. We never add any chemicals, hormones or antibiotics. Collected eggs are processed daily at the Alexandre Kids egg ranch.	1	half dozen	4.99	Dairy	Eggs	goodeggs1.imgix.net/product_photos/fQWhXRbyQBWakK5i5fOe_20160908-AlexanderKids_HalfDozenEggs_MG_0405.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
635	Organic Plain Whole Milk Yogurt	Our Organic, Plain Whole-Milk Yogurt is smooth, tart and creamy.  And, it’s our bestseller.Made only with Organic Whole Milk and live cultures. No thickeners or additives are used, yet the consistency is so smooth it pours beautifully out of the container. It’s a great choice for breakfast cereals, for smoothies or as a substitute for sour cream.All Straus Family Creamery’s certified organic yogurts are Non-GMO Project Verified, certified kosher and gluten-free.Ingredients: Pasteurized Organic Whole Milk, Organic Sweet Cream Buttermilk, Living Yogurt Cultures.	32	oz	4.59	Dairy	Yogurt	goodeggs1.imgix.net/product_photos/niUc3KsHSgCpEmvJrDnA_plain%20sale.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
316	Organic Vanilla Whole Milk Yogurt	Smooth and creamy with a pure, delicious vanilla taste.Made with Organic Whole Milk, live cultures, organic cane sugar and organic vanilla. These simple ingredients combine to make the most delicious organic vanilla yogurt you’ll ever taste!  It’s creamy, smooth and it pours right out of the container.All Straus Family Creamery’s certified organic yogurts are Non-GMO Project Verified, certified kosher and gluten-free.Ingredients: Pasteurized Organic Whole Milk, Organic Cane Sugar, Organic Sweet Cream Buttermilk, Organic Vanilla Extract, Living Yogurt Cultures.	32	oz	4.59	Dairy	Yogurt	goodeggs1.imgix.net/product_photos/QeT2E24wQmiX8IznJpU2_vanilla%20yog%20sale.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
281	Organic French-Style Plain Yogurt	We use wholesome pasture-fed organic cow's milk from John Mattos’ family farm in Two Rock (near Petaluma) in Sonoma county. Our Yogurt culture comes from France where it has been used for decades to produce sweet, mild and smooth yogurts. Unlike most producers, we add no thickeners, stabilizers or preservatives. Just milk and culture, that’s it!Ingredients: Whole Organic Jersey Milk, Living Cultures. 	23	oz	7.49	Dairy	Yogurt	goodeggs2.imgix.net/product_photos/QwXNXh0rTZOsXm1ybxXK_032116_GoodEggs-4737.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
136	Organic Plain Nonfat Yogurt	This Organic, Plain Nonfat Yogurt is made from Organic Nonfat Milk and live cultures.No thickeners or additives are used, yet the consistency is so smooth it pours beautifully out of the container. It is great in smoothies, on cereals or as a substitute for sour cream. This is our bestselling nonfat yogurt.All Straus Family Creamery’s certified organic yogurts are Non-GMO Project Verified, certified kosher and gluten-free.Ingredients: Pasteurized Organic Nonfat Milk, Organic Sweet Cream Buttermilk, Living Yogurt Cultures.	32	oz	4.59	Dairy	Yogurt	goodeggs2.imgix.net/product_photos/BoLYzNfeR7mpgvtPlx3T_nonfat%20sale.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
106	Organic French-Style Meyer Lemon Yogurt	We use wholesome pasture-fed organic cow's milk from John Mattos’ family farm in Two Rock (near Petaluma) in Sonoma county. We use local jams for our fruit-at-the-bottom flavors. They come from farms in Sonoma county that grow the fruit organically and make the jam by hand.  Our Yogurt culture comes from France where it has been used for decades to produce sweet, mild and smooth yogurts. Unlike most producers, we add no thickeners, stabilizers or preservatives. Just milk and culture, that’s it!Ingredients: Whole Organic Jersey Milk, Meyer Lemon Spread (Organic Meyer Lemon, Organic Sugar), Living Cultures. 	23	oz	7.49	Dairy	Yogurt	goodeggs1.imgix.net/product_photos/YijASihRST6t3GcOe2Nr_FK1A4734.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
726	Organic Whole Greek Yogurt	Just two simple ingredients go into our yogurt: organic milk and live, active cultures. Rich, creamy and packed with probiotic goodness, our Greek yogurt is unforgettable. Our cows graze on pasture grass on the beautiful hillsides of Marin and Sonoma Counties in the coastal region of Northern California, for a difference you can taste. Our organic Greek yogurt is certified kosher, gluten-free and is the only Non-GMO Project Verified organic Greek yogurt on the market.Ingredients: Pasteurized organic whole milk, live yogurt cultures.	32	oz	7.99	Dairy	Yogurt	goodeggs2.imgix.net/product_photos/VpCXMmPCQfKlMmEG0ObN_FK1A5703.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
212	Organic Plain Lowfat Greek Yogurt	These lowfat Greek yogurts are authentically strained, rich in protein, and made with premium organic ingredients. In addition to straining, a traditional, unhurried cooking process is used to develop the texture of these yogurts naturally and authentically—bringing you a Greek yogurt that’s not only organic, but unparalleled in taste.Ingredients:Strained Yogurt (Organic Cultured Pasteurized Lowfat Milk)Live Active Cultures:L. acidophilus, L. bulgaricus, S. thermophilus, bifidus.	16	oz	4.99	Dairy	Yogurt	goodeggs2.imgix.net/product_photos/WYqtu0oTyqj7xhrjLNgW_FK1A5780.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
197	Organic Nonfat Greek Yogurt	Enjoy an extra $1.00 off Straus Organic Nonfat Greek Yogurt for the month of October!Just two simple ingredients go into our yogurt: organic milk and live, active cultures. Rich, creamy and packed with probiotic goodness, our Greek yogurt is unforgettable. Our cows graze on pasture grass on the beautiful hillsides of Marin and Sonoma Counties in the coastal region of Northern California, for a difference you can taste. Our organic Greek yogurt is certified kosher, gluten-free and is the only Non-GMO Project Verified organic Greek yogurt on the market.Ingredients: Pasteurized organic nonfat milk, live yogurt cultures.	32	oz	7.99	Dairy	Yogurt	goodeggs1.imgix.net/product_photos/9ZxocAGVSc2G6V6wJLfl_FK1A5711.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
174	Organic Cream on Top Peach Yogurt	Clover Organic Farms Yogurts are produced by culturing a mixture of fresh, organic milk from our local family farms along with fresh, organic fruit, sweeteners, and the addition of vitamin A. This particular yogurt has a deliciously rich layer of cream on top. Ingredients: Organic Pasteurized Milk, Organic Pasteurized Cream, Organic Nonfat Pasteurized Milk, Organic Peaches, Organic Cane Sugar, Pectin, Organic Corn Starch, Natural Flavor and Live Active Cultures.	6	oz	1.29	Dairy	Yogurt	goodeggs1.imgix.net/product_photos/CQCXTtvQSKCXX0uJAcAt_FK1A1881.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
171	Organic Cream on Top Vanilla Yogurt	Clover Organic Farms Yogurts are produced by culturing a mixture of fresh, organic milk from our local family farms along with fresh, organic fruit, sweeteners, and the addition of vitamin A. This particular yogurt has a deliciously rich layer of cream on top. Ingredients: Organic Pasteurized Milk, Organic Pasteurized Cream, Organic Nonfat Milk, Organic Cane Sugar, Organic Vanilla Extract, Pectin Organic Corn Starch and Live Active Cultures.	6	oz	1.29	Dairy	Yogurt	goodeggs2.imgix.net/product_photos/7yMY04B0R1mBFwt1sa2P_FK1A1869.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
299	Graziers Unsalted Grass-Fed Butter	Graziers Butter is made with certified Graziers Cream. Not only is the delicious butter grass-fed, it is vat cultured for a minimum of 16 hours, and made European-Style with 83% butterfat. Make this a staple in your house!	8	oz	4.79	Dairy	Butter	goodeggs2.imgix.net/product_photos/ehkIOsJQQXWkZ7C79OhV_FK1A5629.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
159	Stellar Strawberry Non-Dairy Yogurt Tubes	This delicious blend of creamed coconut, strawberries, carrots, and beets not only excites the taste buds, but delivers on the healthiness. Infused with chia seed flour and pea protein, this fruit-and-veggie blend provides you with the antioxidants, protein, and fiber you needIngredients: filtered water, organic strawberry puree, organic sweet potato puree, pear juice concentrate, organic creamed coconut, vegetable glycerin, organic banana puree, pea protein, organic tapioca starch, organic carrot puree, pectin, fruit & vegetable juices for color, citric acid, organic red beet juice concentrate for color, organic chia powder, locust bean gum, natural flavors, monk fruit. Contains: tree nuts (coconut)	8	count	4.99	Dairy	Yogurt	goodeggs1.imgix.net/product_photos/wPYqCjQTmUsc5HSJjOJg_20160929-RubysRocket_Strawberry_MG_2402.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
133	Lavender Coconut & Almond Yogurt	Lavender infused non-dairy yogurt made from almond and coconut milk. From one of our customers:"Hi ,Just wanted to say I LOVE YOUR PRODUCT!!!! I have tried every non-dairy yogurt on the market and found them barely palatable at best. I can't get enough of Crunch Culture... SO good I even eat them as a dessert in the afternoon and evenings! I've been ordering them in my regular Good Eggs delivery..."\nLavender-infused Yogurt ingredients: almond milk, coconut\nmilk*, sugar*, lavender, tapioca flour, agar agar, live active bacteria\n(Bifidobacterium bifidum, Lactobacillus acidophilus, Lactobacillus casei,\nLactobacillus delbrueckii subsp bulgarcus, Lactobacillus rhamnosus,\nStreptococcus thermophiles) *Organic\nAlmond Milk Contains Less\nThan 1% Of The Following: Vitamin/Mineral Blend (Calcium Carbonate, Vitamin A,\nVitamin E, Vitamin D2, Vitamin B12, Vitamin B2, Zinc), Gellan Gum, Carrageenan,\nPotassium Citrate, Sunflower Lecithin, Natural Flavors, Sea Salt. 	16	oz	7.29	Dairy	Yogurt	goodeggs2.imgix.net/product_photos/tGuHr5vSiKR7Up4UZdXA_FK1A1898.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
124	Organic Nonfat Coconut Icelandic Yogurt	Smári yogurt has more protein per serving than any other yogurt in the US. It's thicker than most other yogurt. Creamier, also. It's thick because we strain off most of the water, and leave the yogurt. It's concentrated. It takes four cups of whole milk to make one cup of Smári.Ingredients: Organic grade A pasteurized skim milk, water, organic cane sugar, organic dehydrated coconut, pectin, organic coconut flavor, organic lemon juice, live and active cultures.	5	oz	1.99	Dairy	Yogurt	goodeggs2.imgix.net/product_photos/TSXRQVQyQD2W1btas139_FK1A4462.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
97	Organic Nonfat Strawberry Icelandic Yogurt	Smári yogurt has more protein per serving than any other yogurt in the US. It's thicker than most other yogurt. Creamier, also. It's thick because we strain off most of the water, and leave the yogurt. It's concentrated. It takes four cups of whole milk to make one cup of Smári.Ingredients: Organic grade A pasteurized skim milk, organic strawberries, organic cane sugar, water, pectin, organic fruit and vegetable juice for color, live and active cultures.	5	oz	1.99	Dairy	Yogurt	goodeggs1.imgix.net/product_photos/DGqqJmH0SbCR716sVoNc_FK1A7294.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
42	Organic Nonfat Pure Icelandic Yogurt	Smári yogurt has more protein per serving than any other yogurt in the US. It's thicker than most other yogurt. Creamier, also. It's thick because we strain off most of the water, and leave the yogurt. It's concentrated. It takes four cups of whole milk to make one cup of Smári.Ingredients: Organic grade A pasteurized skim milk. Contains live and active cultures.	5	oz	1.99	Dairy	Yogurt	goodeggs2.imgix.net/product_photos/aUge9aY4TDuwXpGRqfL6_FK1A7286.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
92	Organic Blueberry Lowfat Greek Yogurt	These lowfat Greek yogurts are authentically strained, rich in protein, and made with premium organic ingredients. In addition to straining, a traditional, unhurried cooking process is used to develop the texture of these yogurts naturally and authentically—bringing you a Greek yogurt that’s not only organic, but unparalleled in taste.Ingredients:STRAINED YOGURT: Organic Cultured Pasteurized Lowfat MilkBLUEBERRY FRUIT PREPARATION (20%): Organic Blueberries, Organic Cane Sugar, Natural Flavor, Organic Locust Bean Gum, Pectin, Organic Lemon Concentrate.Live Active Cultures:L. acidophilus, L. bulgaricus, S. thermophilus, bifidus.	5.3	oz	1.99	Dairy	Yogurt	goodeggs1.imgix.net/product_photos/crIyXsxQXi4uPPHpXIxl_FK1A5796.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
91	Organic Nonfat  Black Cherry Greek Yogurt	Get ready to fall in love with this burst of flavorful tart organic cherries paired with creamy Clover Organic Nonfat Milk and subtle floral notes of cassis and fresh-baked pie.We think that if you can't make it right, you shouldn't make it at all. And we've found a way to make it right: in our organic, authentically strained Greek yogurt, with nonfat milk and 22 grams of protein per serving. For decades we've partnered with a handful of humane, family-owned farms where the cows are raised in open pastures to produce our organic milk. Clo even gave her approval. Ingredients: Cultured Pasteurized Organic Nonfat Grade A Milk, Organic Cherries, Organic Sugar, Pectin, Organic Juice (Black Currant, Apple, Black Carrot) (color), Natural Flavor, Citric Acid, Tricalcium Phosphate. Live Cultures: Lactobacillus bulgaricus, Streptococcus thermophilus, Lactobacillus acidophilus, Bifidus, Lactobacillus casei.	5.3	oz	1.79	Dairy	Yogurt	goodeggs1.imgix.net/product_photos/WtVROvL9TqKlkTCxdOi0_FK1A0477.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
57	Organic  Nonfat Blueberry Greek Yogurt	Sweet and tangy come together in this classic flavor that combines the floral, jammy notes of Organic Blueberries and Elderberry married with fresh Clover Organic Nonfat Milk.We think that if you can't make it right, you shouldn't make it at all. And we've found a way to make it right: in our organic, authentically strained Greek yogurt, with nonfat milk and 22 grams of protein per serving. For decades we've partnered with a handful of humane, family-owned farms where the cows are raised in open pastures to produce our organic milk. Clo even gave her approval. Ingredients: Cultured Pasteurized Organic Nonfat Grade A Milk, Organic Blueberries, Organic Sugar, Pectin, Natural Flavor, Organic Locust Bean Gum, Organic Elderberry Juice Concentrate (color), Calcium Chloride, Citric Acid. Live Cultures: Lactobacillus bulgaricus, Streptococcus thermophilus, Lactobacillus acidophilus, Bifidus, Lactobacillus casei.	5.3	oz	1.79	Dairy	Yogurt	goodeggs2.imgix.net/product_photos/DfPcsUoSTIS2IS39LQeM_FK1A0466.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
572	Organic Unsalted Butter	Clover Organic Farms quality butters are made in small batches with rich, organic milk and cream from a select group of family farms on the North Coast of California. The cows on these farms are not treated with antibiotics or the growth hormone rBST and are American Humane Certified by the American Humane Association, resulting in superior milk and cream used to make our delicious butter products. Enjoy Clover Organic Farms butter in good conscience and good health.OrganicThe cream is culturedGluten freeLow sodiumGreat for baking, cooking and to top your favorite foods!Ingredients: Certified organic cream (derived from milk), cultures	16	oz	7.79	Dairy	Butter	goodeggs1.imgix.net/product_photos/65G9e9rlShKnNuMIKBqk_FK1A0581.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
227	Organic Salted Butter	Clover Organic Farms quality butters are made in small batches with rich, organic milk and cream from a select group of family farms on the North Coast of California. The cows on these farms are not treated with antibiotics or the growth hormone rBST and are American Humane Certified by the American Humane Association, resulting in superior milk and cream used to make our delicious butter products. Enjoy Clover Organic Farms butter in good conscience and good health.OrganicThe cream is culturedGluten freeGreat for baking, cooking and to top your favorite foods!Ingredients:  Certified organic cream (derived from milk), sea salt, cultures	16	oz	7.79	Dairy	Butter	goodeggs1.imgix.net/product_photos/buKuaA23ROWlzxucWmdg_FK1A0587.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
302	Organic Unsweetened Almond Milk	Our unsweetened almond milk is the true staple for your fridge. Four simple, organic ingredients create everything you need, and nothing you don’t. We start with single-source spring water and blend it with delicious organic almonds. Then we add just a touch of sea salt for balance, and organic acacia gum to make sure it actually comes back together when you shake it. Our unsweetened almond milk is just like you would make in your own kitchen. Simple, delicious, and good for just about anything.Ingredients: Organic Almondmilk (Spring Water, Organic Almonds), Organic Acacia Gum, Sea SaltContains AlmondsGluten-free, soy-free, produced in a peanut-free facility	28	fl oz	6.29	Dairy	Nut & Soy Milk	goodeggs1.imgix.net/product_photos/QC4Kab8YRguvBzytG71H_FK1A3553.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
258	Almond Milk	Organic Ingredients: organic sprouted almonds, filtered water.Marin Living Foods strives to be a 100% organic company, with that in mind our ingredients are of the highest quality in our almond milk drinks.  Our almonds are in a raw and sprouted state before we make our almond milk drinks. Almond milk is one of the most nutritious milk substitutes available. Almond milk does not need to be fortified as almonds are naturally very nutritious, containing vitamin E, omega-3 fatty acids, manganese, selenium, magnesium, potassium, zinc, iron, fiber, phosphorous, calcium and flavonoids.Our almond milk is prepared free of preservatives and is 100% healthy.  The nut's soft texture, milk flavor, and light colouring makes for an efficient analog to dairy, and a soy-free choice for lactose intolerant people and vegans. Please shake well before enjoying our drinks. 	32	fl oz	10.99	Dairy	Nut & Soy Milk	goodeggs2.imgix.net/product_photos/n6WuRFd9QeVvc9MMnuDy_FK1A5246.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
180	Organic Unsweetened Vanilla Almond Milk	By popular customer demand!  Our smooth almondmilk flavored with real vanilla is perfect in cereal, coffee, or anywhere you might use milk.  Consisting only of almonds and vanilla, Three Trees Unsweetened Vanilla Almondmilk is pure and healthy deliciousness.Simple, quality ingredients and tons of almonds – that’s how we achieve the pure deliciousness in every bottle. A slightly modified recipe of the original, Three Trees now mimic milk more closely. Three Trees is perfectly satisfying as a light meal, after a workout, or anytime you’re craving nourishing, clean energy.Ingredients: Filtered Water, Organic Almonds, Organic Vanilla Extract.	33.8	fl oz	8.99	Dairy	Nut & Soy Milk	goodeggs1.imgix.net/product_photos/R5ZDmBGWQ0C2BETO06D5_032116_GoodEggs-4733.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
62	Organic Vanilla Almond Milk	We take organic almonds and add a gentle roast to allow their natural flavor to shine through. The result is our signature taste that’s a pleasure to drink by the glass and blends perfectly in your recipes.      INGREDIENTSAlmond Base* (Water, Almonds*)Dried Cane Syrup*Potassium CitrateSea SaltNatural Vanilla Flavor With Other Natural FlavorsCarrageenanRiboflavin (B2)Vitamin A PalmitateVitamin D2	32	fl oz	3.49	Dairy	Nut & Soy Milk	goodeggs1.imgix.net/product_photos/zw9NpbqSQbmRtsIjWzVM_FK1A7350.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
82	Raw Coconut Almond Milk (Quart)	Ingredients: young coconut water paired with sprouted almonds, filtered water, organic vanilla and pink himalayan sea salt 100% Raw and VeganNo Preservatives or AdditivesDairy, Soy, Carrageenan, and Gluten FreeHealthy and Delicious!   4 day shelf life (delivered fresh to GOOD EGGS on Saturday AM)Always Shake Well and Keep Refrigerated	32	fl oz	13.99	Dairy	Nut & Soy Milk	goodeggs2.imgix.net/product_photos/l0P2rs1NSM6ntQEv53yL_FK1A1392.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
250	Vanilla Bean Almond Milk	Our vanilla bean almond milk is light, refreshing and naturally nutritious. It is 100% pure, raw, organic and abundant in almonds. Ideal for breakfast, as a post-workout drink, or a delicious and wholesome on-the-go beverage. Ingredients: organic almonds, organic medjool date, vanilla bean, purified water, pink himalayan salt	10.75	fl oz	4.99	Dairy	Nut & Soy Milk	goodeggs1.imgix.net/product_photos/8aXVcu1jS728rry4vX1w_FK1A3454.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
116	Raw Coconut Almond Milk (Pint)	Ingredients: young coconut water paired with sprouted almonds, filtered water, organic vanilla and pink himalayan sea salt 100% Raw and VeganNo Preservatives or AdditivesDairy, Soy, Carrageenan, and Gluten FreeHealthy and Delicious!   4 day shelf life (delivered fresh to GOOD EGGS on Saturday AM)Always Shake Well and Keep Refrigerated	16	fl oz	9.99	Dairy	Nut & Soy Milk	goodeggs1.imgix.net/product_photos/Lj0mNvYTiCzUQ3WQ89QR_FK1A1401.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
185	Mint Chip Ice Cream	Our mint chip is made with Seely Farm’s mint oil from Oregon and TCHO chocolate chips we make ourselves to ensure they are thin and delicate.Cream*, Milk*, Egg Yolks*, Sugar*, TCHO Bittersweet Chocolate, Seely Farm’s Mint Oil*, Rice Bran Oil, Salt (*= organic)Proudly made with Straus Family Creamery organic dairy located in Marshall, in West Marin, only 35 miles away.	1	pint	8.99	Dairy	Ice Cream	goodeggs1.imgix.net/product_photos/F0coyQZNQ8uvHx16xaBL_FK1A9240.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
49	Organic Caramel Toffee Crunch Ice Cream	This newest organic ice-cream flavor combines sea-salt infused toffee and caramel to create a delicious mix of sweet and savory flavors. The caramel is made with Straus's own Organic Butter and Organic Cream. All Straus Family Creamery’s gourmet organic ice creams are Non-GMO Project Verified, certified kosher and gluten free.Ingredients: Pasteurized Organic Cream And Organic Nonfat Milk, Organic Cane Sugar, Organic Dark Brown Sugar, Organic Cream [Organic Cream], Organic Egg Yolks, Water, Sea Salt, Organic Soy Lecithin (Non-Gmo, Added As An Emulsifier).	1	pint	5.59	Dairy	Ice Cream	goodeggs1.imgix.net/product_photos/BsSGQhBUQQmz3QDNvnuv_FK1A1825.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
206	King Salmon Lox	Delicious cold smoked King salmon. Brined for 12 hours and smoked in an old-fashioned smokehouse for a full day, you haven't had lox like this. After smoking it's immediately flash frozen to maintain that freshness and is defrosted the night before delivery to you!	8	oz	21.99	Fish	Smoked	goodeggs1.imgix.net/product_photos/nF6UEIBZSi2t9zDtp9Mc_FK1A0352.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
273	Fior di Latte Fresh Mozzarella	Belfiore Cheese Company is one of the few remaining small, family-owned cheese making operations in the Bay Area. All Belfiore products are made 100% naturally without any additives or preservatives. The operation was established in 1987 as one of first pioneers producing hand crafted Italian-style Mozzarella, Fior di Latte (or Fresh Mozzarella in water) here inAmericaIn 1989, new owners, pursuing the same dreams of perfection in cheese making, took over the small operation and continued the same traditional cheese making techniques with a passion to preserve the genuine quality and homemade style that has become the signature of the Belfiore Cheese brand.Ingredients: Pasteurized cow's milk , vinegar, sea salt, cultures, vegetarian rennet.Contains dairy	8	oz	5.99	Dairy	Cheese	goodeggs2.imgix.net/product_photos/2xq0yI5PQs2PQ8UxoubF_FK1A1757.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
272	Burrata	Burrata is a small bag of mozzarella, filled with cream and more mozzarella. Belfiore's flavor is milky-creamy-gooey goodness, much like the flavor of fresh milk. Adding olive oil and a pinch of salt is a straight trip to an Italian trattoria.Ingredients: Pasturized cow's milk, cream, vinegar, sea salt, cultures, vegetarian rennet. 	8	oz	5.99	Dairy	Cheese	goodeggs1.imgix.net/product_photos/bqrFSvAOQdazhLvnGuUD_FK1A7351.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
143	Ricotta	Made with fresh whole cow's milk. Creamy and delicious, perfect for lasagna and other pasta dishes.Belfiore Cheese Company is one of the few remaining small, family-owned cheese making operations in the Bay Area. All Belfiore products are made 100% naturally without any additives or preservatives. The operation was established in 1987 as one of first pioneers producing hand crafted Italian-style Mozzarella, Fior di Latte (or Fresh Mozzarella in water) here inAmericaIn 1989, new owners, pursuing the same dreams of perfection in cheese making, took over the small operation and continued the same traditional cheese making techniques with a passion to preserve the genuine quality and homemade style that has become the signature of the Belfiore Cheese brand.Ingredients: Whole milk and wheyContains Dairy	16	oz	4.99	Dairy	Cheese	goodeggs1.imgix.net/product_photos/GdrNlD1hSDufzeOv2nZx_FK1A1839.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
64	Jersey Cow's Milk Ricotta	Traditionally in Italy ricotta is made only using the finest milk. Unlike other American ricotta that uses whey, Bellwether honors Italian cheesemaking by only using fresh Jersey Cow's milk. The rich and decadent texture is due to the high fat content in the milk. Want to spruce up a lackluster recipe? Add this ricotta! Alternatively, take advantage of the ice cream like texture and add honey, fruit, nuts, or chocolate. It's the perfect cure to any after dinner sweet tooth!Ingredients: Cultured Grade A Pasteurized Jersey Cow’s Milk, Salt Contains: Dairy	12	oz	6.99	Dairy	Cheese	goodeggs2.imgix.net/product_photos/oNih4E13Qv2j08ogUjAF_FK1A1883.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
198	Pt. Reyes Farmstead Fresh Mozzarella	Fresh Mozzarella Cheese - Pt Reyes Farmstead Cheese CompanyThe best fresh mozzarella we've tried, ready to be melted on a pizza or sliced for a caprese salad.  Light & pillowy soft, the ball comes packed with water in a recyclable plastic container.Pasteurized Cow's MilkVegetarian RennetCertified Kosher & Gluten Free	8	oz	7.99	Dairy	Cheese	goodeggs2.imgix.net/product_photos/zQL12PA8QEeZPiT1n5U8_FK1A1935.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
200	Shredded Mozzarella Cheese	Creamy and mild, Tillamook Mozzarella was made to do exactly what you want it to: melt atop scrumptious dishes. That’s because we make it with the highest-quality, farm-fresh milk. Our facilities even use larger pipes than most to transport our milk so that we’re extra gentle to it. Use our Mozzarella to crown pizzas, fold it between layers of lasagna, or melt it atop pasta. It goes from shreds to gooey meltedness before you can even say cheese.Contains no animal rennet (vegetarian)Ingredients: Cultured Pasteurized Part-Skim Milk, Salt, Enzymes, Potato Starch and Cellulose Powder (added to prevent caking), Natamycin (natural mold inhibitor).Allergens: Contains Milk	8	oz	4.29	Dairy	Cheese	goodeggs1.imgix.net/product_photos/cM90U9iMSm27C231joOp_FK1A2824.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
147	Organic Sliced Mozzarella	The classic Italian mozzarella is made fresh with our best organic ingredients. Resembling Monterey Jack in color and texture, this stirred curd organic Mozzarella is available in a whole milk version. Mozzarella is a favorite ingredient in Italian dishes such as pizza, lasagna, and caprese salad. This cheese is Certified Organic, Kosher, American Humane Certified and Non-GMO Verified.Rumiano Cheese Company is California's oldest family-owned cheese company, dedicated to the manufacture and distribution of the highest quality cheese. Their main focus is providing their customers with the utmost service and quality. Their success is measured by their loyalty to their employees and vendors and to the success of their customers.Ingredients: Natural Cheese made from pasteurized cultured organic milk, sea salt, enzymes.	6	oz	3.79	Dairy	Cheese	goodeggs2.imgix.net/product_photos/HDY15RavRRKiUlmyvbBX_FK1A9345.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
138	Sliced Swiss Cheese	A bit nutty and a bit sweet, this 75-day aged Tillamook Swiss Cheese is as holey as anyone could ask for. Neatly sliced for perfect sandwiches, cheeseburgers or just eating out of hand.Contains no animal rennet (vegetarian).Ingredients: Cultured Part-Skim Milk, Salt, Enzymes.Allergens: Milk	8	oz	4.99	Dairy	Cheese	goodeggs1.imgix.net/product_photos/9110XCrQR3W131HoR8iP_20161012-Tillamook_SwissSlices_MG_3602.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
191	Scallion Cream Cheese	Sliced chives mixed with cream cheese.Ingredients: Chives, Cream, Milk.	8	oz	6.99	Dairy	Cheese	goodeggs2.imgix.net/product_photos/hn1OTeDvTlaxOaONqQlD_vmri3CGjcxmXqO8FyN8melFetvugRaIM24A32LwGUdU.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
71	Organic Lactose Free Cream Cheese	Green Valley Organics® lactose-free cream cheese has a superb cheesy flavor, is lower in salt, and has a thick, creamy texture. Enjoy this minimally-processed, real dairy cream cheese on a bagel, in baking, as a spread, in dips, and in creamy sauces and soups.Green Valley Organics' lactose-free dairy is made by Redwood Hill Farm & Creamery in Sebastopol CA. Ingredients: organic cream, sea salt, lactase enzyme and live, active cultures	8	oz	3.39	Dairy	Cheese	goodeggs1.imgix.net/product_photos/1sq8vPbBSiOiU8TaKUrY_greenvalley_creamcheese.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
380	Tillamoos Medium Cheddar	A century in the eating, Tillamook Medium Cheddar is still made from the same recipe we’ve used for over 100 years. While our equipment might look a little different these days, we use only four simple ingredients and age every batch naturally for at least 60 days. No wonder it was voted 'America's Best' at the 2015 International Cheese Awards.Ingredients: Cultured Milk, Salt, Enzymes, Annatto (color).	7.5	oz	4.99	Dairy	Cheese	goodeggs1.imgix.net/product_photos/EstegN8sRyKzfPGIYhat_tillamoos_2.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
328	Oaxacan String Cheese	This string cheese comes from Cesar's Cheese company out of Columbus, WI. Cesar and his family moved to Wisconsin from Oaxaca and started making the cheeses that Cesar's learned how to make as a young boy. In 2008, after Cesar earned his cheesemaking license, his company opened. Oaxaca cheese is traditionally pulled by hand and Cesar and his wife Heydi continue this tradition by pulling all the string cheese by hand. This string cheese has a beautiful chewy texture and the perfect amount of salt. Pack in your lunch, eat on the run, or have an afternoon snack. This Oaxacan string cheese knows no age limits so adults and kids enjoy!Ingredients: Pasteurized cow's milk, enzymes, cultures, salt ( and love!).Contains dairy	8	oz	7.99	Dairy	Cheese	goodeggs2.imgix.net/product_photos/aID1SChzR8WDz5imI8Fg_20160825-Cesar_StringCheese_MG_8754.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
294	Sharp White Cheddar Tillamoos	For nine whole months, Sharp White Cheddar waits. It waits and it waits because that’s how we make cheese—without rushing it out the door. Once its full, sharp flavor has just enough bite to pair magically with crackers, meats, smoked fish, nuts, and wine—we’re satisfied. And if that sounds like a feast, it’s because nine months of preparation deserves a celebration.Ingredients: Cultured Milk, Salt, Enzymes.Contains milk 	7.5	oz	4.99	Dairy	Cheese	goodeggs1.imgix.net/product_photos/nLlttVRcT6qm9XAjPpHv_tilamoos_whitecheddar.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
72	Graziers Raw Milk Monterey Jack	Monterey Jack is a very mild, buttery tasting cheese perfect for melting on everything from sandwiches to omelets!Graziers Raw Milk Sharp Cheddar Cheese is made from milk from Certified Graziers at Alderson and Belo Dairies. Enjoy the benefits of grass-fed and raw milk! 	8	oz	4.99	Dairy	Cheese	goodeggs1.imgix.net/product_photos/KvUaZdASQi6hA5QYLsm8_File0201.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
348	Organic Small Curd Cottage Cheese	Clover Organic Farms Cottage Cheeses are produced by introducing non-animal rennet , a natural enzyme, to fresh, organic milk from our local family farms. The rennet causes the milk to separate into curds and whey. The curds are then drained to separate them from the whey, and then a small amount of whey is added back in for texture and flavor.  We invite you to enjoy Clover Organic Farms Cottage Cheese in good conscience and good health. Great for salads, with fruit and in all your favorite family recipes!Ingredients: Cultured pasteurized grade A organic nonfat milk, pasteurized grade A organic milk, pasteurized organic cream, salt, stabilizer (organic guar gum, xanthan gum, carageenan, organic locust bean gum), carbon dioxide (to maintain freshness)	16	oz	5.29	Dairy	Cheese	goodeggs2.imgix.net/product_photos/6sECVFnTj6NSBMTXWGaQ_FK1A9938.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
335	Organic Sour Cream	Our Organic Sour Cream is rich and delicious with the perfect balance of sweet and tangy.Made with only three ingredients, our Organic Sour Cream is slowly cultured, using a traditional 16-hour process. This creates a naturally thick texture and pure, rich flavor. Use it as a base for dips and dressings or as the perfect spoonful of luxury on a baked potato. No fillers, additives or stabilizers, ever.Straus Family Creamery’s certified Organic Sour Cream is Non-GMO Project Verified,certified kosher and gluten-free.Ingredients: Cultured Pasteurized Grade A Nonfat Milk and Cream, Enzymes.	1	pint	4.29	Dairy	Cheese	goodeggs2.imgix.net/product_photos/xpuVDxrtQmWICjaGuoWP_FK1A5763.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
84	Goat Milk Feta	With a long history throughout the Balkan Peninsula, especially in Greece, Feta is traditionally made from a combination of sheep and goat milk. Redwood Hill Farm’s award winning feta, is made with pure goat milk. We gently cut the curd and form it into blocks by hand. Then it is brined in a natural, salt water brine before aging.  Try it sliced or cubed, sprinkled with fresh cracked pepper and drizzled with olive oil, or on top of a salad. Serve with assorted olivesStorage & Serving SuggestionsLeft in its packaging it will last refrigerated for 6 months or more. After opening, re-wrap your cheese in fresh plastic or cheese wrap and keep it refrigerated. Redwood Hill Farm Feta is fabulous sliced or cubed, sprinkled with fresh cracked pepper and organic oregano and then drizzled with your best olive oil. Serve with assorted olives.Ingredients: Cultured goat milk, sea salt and vegetable enzyme.	6	oz	8.79	Dairy	Cheese	goodeggs1.imgix.net/product_photos/DknwNWeSge1VfbWGcv3Z_goat%20feta%20photo.jpeg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
50	Ricottage	This cheese is an Orland Farmstead creation. It is a blend between a ricotta and a cottage cheese. Ricottage can be used as a snack like cottage cheese or to take the place of ricotta in dishes such as lasagna.  	8	oz	5.99	Dairy	Cheese	goodeggs1.imgix.net/product_photos/SexNegvKSyyG0EH7y0a3_FK1A2977.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
474	Parmigiano Reggiano	Parmigiano Reggiano is a hard Italian Cheese made from partly skimmed, unpasteurized milk. It is only allowed to be produced in the provinces of Parma, Reggio-Emilia and Modena, as well as parts of Emilia-Romagna. Its nuttiness and intense savory flavors  are guaranteed to impress on any cheese board, spice up any broth, and compliment pasta and risotto. Ingredients: Part-skim milk, salt, rennet.	6	oz	7.49	Dairy	Cheese	goodeggs1.imgix.net/product_photos/SBzWN6VKSaX7MFdSAwhk_FK1A7890.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
263	Manchego	Perhaps Spain’s most famous cheese, Manchego is a D.O. (Denominacion de Origen) protected cheese, meaning the traditional recipe must use 100% Manchega sheep milk. The breed has proven sturdy enough over the centuries to traverse the rocky, arid central plateau region of La Mancha – where cows just can’t hang. Made using fresh, pasteurized sheep’s milk, this Manchego develops a rich nuttiness and pleasant gaminess (think toasted almonds and broiled lamb chops) after over a year of aging. The patterned rind is a nod to the grass baskets previously used to form the cheese. Firm enough to grate for any culinary application, highlight its sharp, caramelly flavor anywhere you would use Parmigiano.	6	oz	8.79	Dairy	Cheese	goodeggs1.imgix.net/product_photos/fWeHFFYoSKi785exSgWZ_FK1A7436.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
154	Pt. Reyes Farmstead Toma	Point Reyes Farmstead Cheese Company - Marin CountyToma is a creamy semi-firm cheese with a pleasant tangy finish. It's easily the highlight of any cheeseboard & pairs well with hoppy beers, pinot noir, or chardonnays. It melts perfectly in an omelette & is a favorite for grilled cheese sandwiches. Hand cut & wrapped in compostable cheese paper.Pasteurized Cow's MilkVegetarian RennetCertified Kosher & Gluten Free	6	oz	7.49	Dairy	Cheese	goodeggs1.imgix.net/product_photos/X8i01xcXSS2ffoVMPkZq_toma.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
287	Organic Firm Tofu	"This tofu is a great consistency. I like to marinate in sesame oil, ponzu, minced garlic and rice vinegar, then fry lightly in peanut oil to use in noodle or cabbage salads!" - Darren, Grocery BuyerOur Organic Firm Tofu is made with our rich soymilk that is\nsweet and creamy. We brew our soymilk with just the right amount of water and\nsoybeans. Then we bring it to a specific temperature in order to produce the\nperfect consistency of texture and flavor.  Precision and accuracy is how we make our tofu\nin order to provide the best quality from our family to yours. \nWe are the largest and oldest family (three generations)\nowned and operated manufacturer in Northern California. \nWe take great pride in our tofu that is made with our family\nrecipe for over 90 years.  Our tofu and\nsprouts are produced with only the highest quality ingredients and care.   We use a high quality organic soybean that\nare grown in the USA and is USDA approved non-GMO. Wo Chong Company, Inc.  has\ndeveloped, maintains and administers a HACCP-based Good Manufacturing Practices\n(GMPs) Food Safety Program.For firm tofu, we recommend marinating the tofu with your favorite sauces or leave it as it is, then grill, bake, or stir fry it to add to your salad, sandwich or rice. \nIngredients: Water, Organic Soybeans, Calcium Sulphate	14	oz	1.99	Dairy	Ready to Eat	goodeggs1.imgix.net/product_photos/0GqGYVJURg6bnnl2g4q2_FK1A5646.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
223	Organic Hodo Firm Tofu	Taste the difference in Hodo\nFirm Tofu. At Hodo, we use time-honored, artisan methods to make\na creamy, higher protein soymilk that is the foundation of all our hand-crafted\ntofu. The result is our tofu has more complexity and depth of flavor. Hodo Firm Tofu has a subtle nutty aroma and\nbuttery smooth texture.  Compared to\naverage market brands, Hodo Firm Tofu has 50% higher protein per serving. Our hand-crafted tofu is made from organic, non-GMO, US-grown, whole\n\nsoybeans.\nHodo Firm Tofu is a favorite staple in\nstir-frys, stews and curries.  A fully cooked\nproduct, you can add Hodo Firm Tofu directly to your favorite\nsalad or crumble it into scrambles and chilis. \n\nTo\nfully savor Hodo Firm Tofu’s fresh flavor and superior texture, slice thinly\nand dip with a good olive oil and sea salt. We love to\nmarinate the tofu and grill or broil it.  Ingredients: Water, Organic, Non-GMO Soybeans, Calcium Sulfate.Recipes: http://goo.gl/u7Wwua	12	oz	4.19	Dairy	Ready to Eat	goodeggs2.imgix.net/product_photos/FYuO75k2QDGriDQYTcqN_853404002213.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
140	Organic Hodo Fresh Handmade Yuba	Yuba is a delicacy. Also known as “bean curd sheet,” yuba is the\nthin veil that forms on the surface as the cream rises in heated soymilk. At Hodo, we hand harvest the yuba, one sheet\nat a time. Hodo Yuba has a creamy, nutty and subtly complex flavor,\nwith a firm bite. Hodo Yuba is\ngluten-free, protein-rich and has zero cholesterol. All Hodo Yuba is made from organic, non-GMO, US-grown whole soybeans.Hodo Yuba comes in thin sheets that can be cut\ninto noodles and makes for a great all-organic, gluten-free pasta dish. Hodo Yuba is perfect for wraps and spring\nrolls or as a wonderful addition into stews, soups and sautés.Ingredients: Water, Organic Non-GMO Soybeans.Recipes: http://goo.gl/ExABmN	5	oz	6.99	Dairy	Ready to Eat	goodeggs2.imgix.net/product_photos/gNveqFRSJOuVdRiXDlGg_853404002237.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
327	McFarland Springs Trout, Two Fillets	McFarland Springs Trout is delicious and nutritious. And it's more than unique – it is the world’s first deliberate collaboration to responsibly farm sustainable fish. This product is filleted with the skin on for easy cooking on the grill or on the stove. Arrives fresh, not frozen. For recipe ideas check out our website.About our trout:McFarland Springs is an environmental dream. The water supply comes from the headwaters of a natural spring, extremely cold and free of the pesticides and contaminates found in other water sources. The spring not only provides for the trout, but also generates all of the electricity for the farm though hydroelectric. It is raised locally, lowering carbon footprint and further promoting regional cuisine. The fish is hand harvested and processed, instead of machine processed as is customary.Typically, farmed fish are fed fishmeal which is made up of small fish that are being taken from the ocean at alarming rates. These fish are then ground, dried, and fed to many types of farmed fish in order to increase their growth rates. This practice is an environmental catastrophe and not sustainable. With higher levels of healthy Omega-3s than wild salmon, and zero trace of mercury or contaminants, McFarland Springs trout provides exceptional nutrition benefits. Lastly, the flavor and texture is that of wild trout with a sweet flavor and lighter, firm flesh. The extreme cold created by the natural spring creates slow growth rates, but far better texture.Thanks for your support!-Team TwoXSea 	1	lb	18.99	Fish	What We Love	goodeggs1.imgix.net/product_photos/LXZeml1QTIOPS1FvtBZY_mcfarland%20springs%20trout%20fillet%2010-10-12.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
229	Half Pound Fresh Steelhead Trout	Harvested in Washington's Columbia River, Steelhead Trout is the salmon lovers' alternative fish. Steelhead is so much like salmon in color, taste, and texture that it's sometimes very difficult to tell the difference.Information on Source:PORTLAND, Ore. – April 29, 2013 – The Pacific Seafood Group, a family owned seafood company based in Portland, Ore., is pleased to announce that their Pacific Aquaculture Steelhead Farm on the Columbia River in Washington State has received Best Aquaculture Practices (BAP) certification. This is the first and only Salmon/Steelhead farm to be BAP certified in the U.S.The Best Aquaculture Practices (BAP) standards address environmental and social responsibility, animal welfare, food safety and traceability in a voluntary certification program for aquaculture facilities. BAP certification defines the most important elements of responsible aquaculture and provides quantitative guidelines by which to evaluate adherence to those practices.	0.5	lb	10.99	Fish	Fish	goodeggs2.imgix.net/product_photos/5v92S2UmRjWTLRjxD8wC_FK1A2389.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
262	Fresh Fish Sampler for Two	New & Improved Fresh Fish Sampler includes 2 servings (0.66+ lbs) of 1 or 2 varieties of fish.  Possible varieties include:King Salmon (May-October)Steelhead TroutArctic Char California HalibutCalifornia White SeabassPetrale SoleBlack CodLing CodRock CodTrue CodSand DabsAlbacore TunaSea Scallops The concept of the Fresh Fish Sampler is based on another system that connects farms to the people called a CSA (Community Supported Agriculture).  But, In this case, fish.  You (the community) support the local fishermen, & me (the fishmonger).  Select either one-time, weekly (best choice!) or monthly.  You benefit by getting more than your moneys worth & a chance to try new fish.	0.66	lb	12.99	Fish	Fish	goodeggs2.imgix.net/product_photos/vrEjQdldSYCsJuBvvUxz_FK1A9573.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
157	Half Pound Fresh Wild California White Seabass	Fresh Wild California White Seabass is a thick, delicious fish. California White Seabass is caught off the Santa Barbara Coast, periodically coming north to San Francisco.  White Seabass is mild flavored, with large flakes.  Best on grill or broiled.  Just add lemon.	0.5	lb	12.49	Fish	Fish	goodeggs1.imgix.net/product_photos/dB8hXxpTzWSEx5QaovwR_FK1A9277.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
86	Hot Smoked Wild King Salmon	Wild local King salmon brined for 24 hours and smoked for two days. Angelo's Meats and Sausage in Petaluma makes this smoked salmon for us using salt and smoke. Angelo is a smokehouse master and has agreed to make small weekly batches for us so that our salmon is always fresh from the smokehouse. It's immediately flash frozen to maintain that freshness and is defrosted the night before delivery to you!This is a hot smoked fillet, so it will not be sliceable but will flake beautifully. Gobble it up as-is or enjoy on top of a bagel with cream cheese or sprinkled on top of a salad.	8	oz	21.99	Fish	Smoked	goodeggs1.imgix.net/product_photos/HTtg4EDqQMm69vH1HD49_FK1A5438.jpg?w=380&h=238&fm=jpg&q=41&fit=crop	\N	\N
\.


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('products_product_id_seq', 1, false);


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
1	Arrives Frozen
2	Certified Organic
3	Arrives Fresh
4	Raised with Non-GMO Feed
5	Locally Grown
6	Pasture Raised
7	Paleo
8	Grass Fed
9	Non-GMO
10	Heritage Breed
11	Nitrate/Nitrite Free
12	Grain Finished
13	Pastured
14	Dairy Free
15	Gluten-Free
16	Soy Free
17	Tree Nut Free
18	Organic Ingredients
19	Animals Raised without rBGH
20	Wheat Free
21	Locally Sourced Ingredients
22	Vegan
23	Vegetarian
24	Synthetic Pesticide & Fertilizer Free
25	Wild
26	Heirloom
27	Office Box
28	Aquaponic
29	Eco-Certified
30	Raw
31	Kosher Certified
32	Unpasteurized
33	Made with Vegetarian Rennet
\.


--
-- Name: tags_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('tags_tag_id_seq', 33, true);


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

