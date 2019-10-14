
source env.sh 

SELECT="select pg_size_pretty(pg_wal_lsn_diff(pg_current_wal_lsn(), replay_lsn)) from pg_stat_replication"
sleep 1
timer=1

while true; do
  total_lag=`echo "$SELECT" | psql -qAt -U postgres -h $NODE1 -d demo
  if [ "$total_lag" == "0" ]; then
    exit 0
  else
    echo "total_lag = $total_lag after $timer (s)"
    sleep 1
    timer=$(( $timer + 1 ))
  fi
done


