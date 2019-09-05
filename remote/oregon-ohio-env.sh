
this_dir=`pwd`
RUN=$this_dir/benchmarksql/run
PSSH="pssh -i -h hosts"
PSCP="pscp -h hosts"
pgXX=pg11
BIGSQL=/home/ec2-user/bigsql
pgc=$BIGSQL/pgc
PG=$BIGSQL/$pgXX
psql="$PG/bin/psql -U postgres"

export DRIVER1=driver1-1   
export NODE1=node1-1
export NODE1_IP=54.189.134.62

export DRIVER2=driver2-1
export NODE2=node2-1
export NODE2_IP=18.221.61.168

dump_dir=/home/ec2-user/test/data

