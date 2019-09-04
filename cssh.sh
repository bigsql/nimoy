source ./cluster-def.sh

node=$1

if [ "$node" == "driver1-1" ]; then
  ssh -i $key1 $ssh_d1
elif [ "$node" == "driver2-1" ]; then
  ssh -i $key2 $ssh_d2
elif [ "$node" == "node1-1" ]; then
  ssh -i $key1 $ssh_n1
elif [ "$node" == "node2-1" ]; then
  ssh -i $key2 $ssh_n2
else
  echo "YIKES!!"
  exit 1
fi

