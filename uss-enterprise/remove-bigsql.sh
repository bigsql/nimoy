PSSH="pssh -i -h hosts"

cmd="bigsql/pgc stop"
echo "# $cmd"
$PSSH "$cmd"

cmd="rm -rf bigsql"
echo "# $cmd"
$PSSH "$cmd"

