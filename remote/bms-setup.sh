
source env.sh

./bms-restore.sh $NODE1 
./bms-pgspock-create-node.sh $NODE1_IP
./bms-restore.sh $NODE2
./bms-pgspock-create-node.sh $NODE2_IP
./bms-subscribe-nodes.sh
