
1.) Run 'refresh-bigsql.sh' to start over on each database node.
     - Make sure each node is clean and ready for bigsql 'remove-bigsql.sh'
     - 'install-bigsql.sh' to install bigsql on each node
     - run 'setup.sh' to do following on each node using pssh;
         + use pgc to install/tune pg11 & install pgspock into the demo db
         + replace pghba.conf with a permissive version for logical rep
         + create the replication role

#### For simple T1 replication of one table between nodes #############
T1) Run 't1-setup.sh' to do the following on each node:
       - create empty T1 table in each node
       - create each node for pgspock 
       - subscribe each node to the other in pgspock

T2) Demo multimaster working across nodes by explaining and then
     running 't1-insert.sh'

#### For testing with the TPC-C like BenchmarkSQL ####################

B1) run bms-build-1.sh
        bms-dump-1.sh

B2) run bms-setup.sh to:
          bms-restore.sh node1
          bms-pgspock-create-node.sh node1
          bms-restore2.sh node2
          bms-pgspock-create-node.sh node2
          bms-subscribe-nodes.sh

B3) run benchmarksql on node1 & node2 with calculated loads

B4) rinse & repeat for different size nodes


