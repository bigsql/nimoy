source env.sh

$psql -h $NODE1 -a -c "INSERT INTO public.t1 VALUES (1, 'one'), (2, 'two'), (3, 'three');" demo

$psql -h $NODE2 -a -c "INSERT INTO public.t1 VALUES (4, 'four'), (5, 'five'), (6, 'six');" demo

sleep 1

./run_sql.sh "SELECT * FROM t1;"

exit 0
