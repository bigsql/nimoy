
source env.sh

function echoCmd {
  echo "# $1"
  $1
  rc=$?
  if [ "$rc" == "0" ]; then
    echo ""
  else
    echo "FATAL ERROR!  stopping now"
    exit $rc
  fi
}

echoCmd "$PSCP t1-create.sql $PG/."
$PSSH "$psql -f $PG/t1-create.sql"

echoCmd "scp node1-create.sql $NODE1:$PG/node-create.sql"
echoCmd "scp node2-create.sql $NODE2:$PG/node-create.sql"
$PSSH "$psql -f $PG/node-create.sql demo"

echoCmd "scp node1-subscribe.sql $NODE1:$PG/node-subscribe.sql"
echoCmd "scp node2-subscribe.sql $NODE2:$PG/node-subscribe.sql"
$PSSH "$psql -f $PG/node-subscribe.sql demo"

