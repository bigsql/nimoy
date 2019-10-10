
source env.sh

if [ $# -ne 1 ] && [ $# -ne 2 ]; then
  echo "ERROR! Must supply node name & optional num warehouses"
  exit 1
fi

node=$1
num_whses=$2

if [ "$num_whses" == "" ]; then
  dump_file=$dump_dir/dump.sql
  RESTORE="psql -U postgres -h $node demo -f $dump_file"
else
  dump_file=$dump_dir/dump-$num_whses.custom
  RESTORE="pg_restore -U postgres -h $node -v -Cc -Fc -f $dump_file"
fi

echo ""
ls -sh $dump_file
echo ""
echo "$RESTORE"
~/bigsql/pg11/bin/$RESTORE
rc=$?

echo ""
$psql -h $node -c "select count(*) from bmsql_oorder" demo
echo ""
exit $rc

