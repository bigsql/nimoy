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

$PSSH "$pgc install $pgXX"
$PSSH "$pgc start $pgXX -y -d demo"

$PSSH "$pgc tune $pgXX"

echoCmd "$PSCP pg_hba.conf $PG/."

$PSSH "$pgc install logical -d demo"

echoCmd "$PSCP ../create-replication-role.sql $PG/."
$PSSH "$psql -f $PG/create-replication-role.sql"

