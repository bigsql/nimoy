source env.sh

$psql -h $NODE1 -a -c "alter system set pgspock.conflict_resolution = 'keep_local'" demo

$psql -h $NODE2 -a -c "alter system set pgspock.conflict_resolution = 'apply_remote'" demo

./run_pgc.sh "restart $pgXX"

./run_sql.sh "show pgspock.conflict_resolution;"




