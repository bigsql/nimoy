
this_dir=`pwd`
RUN=$this_dir/benchmarksql/run
PSSH="pssh -i -h hosts"
PSCP="pscp -h hosts"
pgXX=pg11
BIGSQL=/home/ec2-user/bigsql
pgc=$BIGSQL/pgc
PG=$BIGSQL/$pgXX
psql="$PG/bin/psql -U postgres"

DRIVER1=driver-wooly
NODE1=wooly
NODE1_IP=18.236.84.193

DRIVER2=driver-mammoth
NODE2=mammoth
NODE2_IP=18.191.240.233

dump_dir=/home/ec2-user/test/data

