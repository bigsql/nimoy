
source env.sh

PSQL="$psql -h $NODE1 demo"

$PSQL -c "SELECT pglogical.create_subscription( \
    subscription_name := 'subscription2', \
    provider_dsn := 'host=$NODE2_IP port=5432 user=replication password=password dbname=demo', \
    forward_origins := '{}', \
    synchronize_data := false \
);"


$PSQL -c "SELECT pglogical.alter_subscription_add_replication_set( \
    subscription_name := 'subscription2', \
    replication_set := 'bmsql_set' \
);"


$PSQL -c "SELECT pglogical.wait_for_subscription_sync_complete('subscription2');"
