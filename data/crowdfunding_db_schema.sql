BEGIN;


CREATE TABLE IF NOT EXISTS public.category
(
    category_id character varying(4) NOT NULL,
    category character varying(50) NOT NULL,
    PRIMARY KEY (category_id)
);

CREATE TABLE IF NOT EXISTS public.subcategory
(
    subcategory_id character varying(10) NOT NULL,
    subcategory character varying(50) NOT NULL,
    PRIMARY KEY (subcategory_id)
);

CREATE TABLE IF NOT EXISTS public.contacts
(
    contact_id integer NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL,
    email character varying(255) NOT NULL,
    PRIMARY KEY (contact_id)
);

CREATE TABLE IF NOT EXISTS public.campaigns
(
    cf_id integer NOT NULL,
    contact_id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    description text NOT NULL,
    goal decimal NOT NULL,
    pledged decimal NOT NULL,
    outcome character varying(20) NOT NULL,
    backers_count integer NOT NULL,
    country character(2) NOT NULL,
    currency character(3) NOT NULL,
    launch_date date NOT NULL,
    end_date date NOT NULL,
    category_id character varying(4) NOT NULL,
    subcategory_id character varying(10) NOT NULL,
    PRIMARY KEY (cf_id)
);

ALTER TABLE IF EXISTS public.campaigns
    ADD CONSTRAINT contact_id FOREIGN KEY (contact_id)
    REFERENCES public.contacts (contact_id) MATCH SIMPLE
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public.campaigns
    ADD CONSTRAINT category_id FOREIGN KEY (category_id)
    REFERENCES public.category (category_id) MATCH SIMPLE
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public.campaigns
    ADD CONSTRAINT subcategory_id FOREIGN KEY (subcategory_id)
    REFERENCES public.subcategory (subcategory_id) MATCH SIMPLE
    ON DELETE CASCADE
    NOT VALID;

END;