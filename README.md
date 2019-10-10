# nimoy - is the driver for setting up the aws multi-region
#   BenchmarkSQL testing of the pgspock

## configure the template
```
$ cp cluster-def.template cluster-def.sh
$ vi cluster-def.sh
```

You need the ip-addresses and ssh keys for the four vm's
in the two regions

## configure the two driver nodes, driver1-1 & driver2-1
```
$ ./config-drivers.sh
```

## Configure the two pg servers hostname's
##   NOTE: don't forget you must open up port 5432 on these 2
##         servers so they will be able to talk to each other
##         for replication & be reachable from the driver nodes
```
$ ./config-nodes.sh
```

## ssh into the four servers to get thru the warnings and you should reboot the four servers
##    to make sure the hostnames are all working
```
  $ ./cssh.sh driver1-1, node1-1, driver2-1, node2-1 (hit <enter> for 1st time warning)

  $ ./cssh.sh node1-1 & node2-1 (setup /db file system on 500GB EBS volume)
  $    sudo mkfs -t xfs /dev/nvme1n1
  $    sudo mkdir /db
  $    sudo chmod 777 /db
  $    sudo mount /dev/nvme1n1 /db
       
       automatically mount the EBS volume after Reboot as per:
         https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html

  $ ./cssh.sh driver1-1
  $   ssh node1-1 (hit <enter> for 1st time warning)
  $   ssh node2-1 (hit <enter> for 1st time warning)
  $   cd $RMT
  $   cat README.md
```
