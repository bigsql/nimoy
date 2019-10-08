-- create a simple table that will be replicated from node1
CREATE TABLE public.t1 (
  c1 INTEGER PRIMARY KEY,
  c2 VARCHAR(10)
);
-- INSERT INTO public.t1 VALUES
--  (4, 'four'), (5, 'five'), (6, 'six');

-- create node2
SELECT pgspock.create_node(
    node_name := 'node2',
    dsn := 'host=node2 port=5432 user=replication password=password dbname=demo'
);

SELECT pgspock.replication_set_add_all_tables('default', ARRAY['public']);
