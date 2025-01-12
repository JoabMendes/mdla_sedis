PGDMP     -                    t            mdla_sequential    9.3.13    9.3.13 !    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    214501    mdla_sequential    DATABASE     �   CREATE DATABASE mdla_sequential WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE mdla_sequential;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                        3079    11789    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    214502    action_id_seq    SEQUENCE     n   CREATE SEQUENCE action_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.action_id_seq;
       public       postgres    false    7            �            1259    214504    actions    TABLE     �   CREATE TABLE actions (
    action_id bigint DEFAULT nextval('action_id_seq'::regclass) NOT NULL,
    label character varying(40)
);
    DROP TABLE public.actions;
       public         postgres    false    171    7            �            1259    214508    event_id_seq    SEQUENCE     m   CREATE SEQUENCE event_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.event_id_seq;
       public       postgres    false    7            �            1259    214510    event    TABLE     �   CREATE TABLE event (
    event_id bigint DEFAULT nextval('event_id_seq'::regclass) NOT NULL,
    sequence_id bigint,
    action_id bigint,
    module_id bigint
);
    DROP TABLE public.event;
       public         postgres    false    173    7            �            1259    214514    module_id_seq    SEQUENCE     n   CREATE SEQUENCE module_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.module_id_seq;
       public       postgres    false    7            �            1259    214516    modules    TABLE     �   CREATE TABLE modules (
    module_id bigint DEFAULT nextval('module_id_seq'::regclass) NOT NULL,
    label character varying(20)
);
    DROP TABLE public.modules;
       public         postgres    false    175    7            �            1259    214520    sequence_id_seq    SEQUENCE     p   CREATE SEQUENCE sequence_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sequence_id_seq;
       public       postgres    false    7            �            1259    214522 	   sequences    TABLE     �   CREATE TABLE sequences (
    sequence_id bigint DEFAULT nextval('sequence_id_seq'::regclass) NOT NULL,
    student bigint,
    sequence_start bigint,
    sequence_end bigint,
    duration bigint,
    course bigint
);
    DROP TABLE public.sequences;
       public         postgres    false    177    7            �            1259    214526    test_id_seq    SEQUENCE     m   CREATE SEQUENCE test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.test_id_seq;
       public       postgres    false    7            �           0    0    action_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('action_id_seq', 0, true);
            public       postgres    false    171            �          0    214504    actions 
   TABLE DATA               ,   COPY actions (action_id, label) FROM stdin;
    public       postgres    false    172   �        �          0    214510    event 
   TABLE DATA               E   COPY event (event_id, sequence_id, action_id, module_id) FROM stdin;
    public       postgres    false    174   �        �           0    0    event_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('event_id_seq', 0, true);
            public       postgres    false    173            �           0    0    module_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('module_id_seq', 0, true);
            public       postgres    false    175            �          0    214516    modules 
   TABLE DATA               ,   COPY modules (module_id, label) FROM stdin;
    public       postgres    false    176   �        �           0    0    sequence_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('sequence_id_seq', 0, true);
            public       postgres    false    177            �          0    214522 	   sequences 
   TABLE DATA               b   COPY sequences (sequence_id, student, sequence_start, sequence_end, duration, course) FROM stdin;
    public       postgres    false    178   �        �           0    0    test_id_seq    SEQUENCE SET     2   SELECT pg_catalog.setval('test_id_seq', 3, true);
            public       postgres    false    179            ^           2606    214533    actions_id_pk 
   CONSTRAINT     S   ALTER TABLE ONLY actions
    ADD CONSTRAINT actions_id_pk PRIMARY KEY (action_id);
 ?   ALTER TABLE ONLY public.actions DROP CONSTRAINT actions_id_pk;
       public         postgres    false    172    172            `           2606    214535    event_id_pk 
   CONSTRAINT     N   ALTER TABLE ONLY event
    ADD CONSTRAINT event_id_pk PRIMARY KEY (event_id);
 ;   ALTER TABLE ONLY public.event DROP CONSTRAINT event_id_pk;
       public         postgres    false    174    174            b           2606    214539    module_id_pk 
   CONSTRAINT     R   ALTER TABLE ONLY modules
    ADD CONSTRAINT module_id_pk PRIMARY KEY (module_id);
 >   ALTER TABLE ONLY public.modules DROP CONSTRAINT module_id_pk;
       public         postgres    false    176    176            d           2606    214541    sequence_id 
   CONSTRAINT     U   ALTER TABLE ONLY sequences
    ADD CONSTRAINT sequence_id PRIMARY KEY (sequence_id);
 ?   ALTER TABLE ONLY public.sequences DROP CONSTRAINT sequence_id;
       public         postgres    false    178    178            e           2606    214542    action_id_fk    FK CONSTRAINT     n   ALTER TABLE ONLY event
    ADD CONSTRAINT action_id_fk FOREIGN KEY (action_id) REFERENCES actions(action_id);
 <   ALTER TABLE ONLY public.event DROP CONSTRAINT action_id_fk;
       public       postgres    false    1886    174    172            f           2606    214547    module_id_fk    FK CONSTRAINT     n   ALTER TABLE ONLY event
    ADD CONSTRAINT module_id_fk FOREIGN KEY (module_id) REFERENCES modules(module_id);
 <   ALTER TABLE ONLY public.event DROP CONSTRAINT module_id_fk;
       public       postgres    false    174    176    1890            g           2606    214552    sequence_id_fk    FK CONSTRAINT     v   ALTER TABLE ONLY event
    ADD CONSTRAINT sequence_id_fk FOREIGN KEY (sequence_id) REFERENCES sequences(sequence_id);
 >   ALTER TABLE ONLY public.event DROP CONSTRAINT sequence_id_fk;
       public       postgres    false    1892    174    178            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     