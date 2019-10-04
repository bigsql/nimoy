PSSH="pssh -i -h hosts"

cmd="bigsql/apg stop"
echo "# $cmd"
$PSSH "$cmd"

cmd="rm -rf bigsql"
echo "# $cmd"
$PSSH "$cmd"

