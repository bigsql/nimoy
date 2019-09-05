
-- create a simple table 
CREATE TABLE public.t1 (
  c1 INTEGER PRIMARY KEY,
  c2 VARCHAR(10)
);
--INSERT INTO public.t1 VALUES 
--  (1, 'one'), (2, 'two'), (3, 'three');

-- create node1
SELECT pglogical.create_node(
    node_name := 'node1',
    dsn := 'host=node1 port=5432 user=replication password=password dbname=demo'
);

-- add all tables in public schema to the default replication set.
SELECT pglogical.replication_set_add_all_tables('default', ARRAY['public']);

