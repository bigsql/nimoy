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

## on all four nodes, setup the EBS volume as /db 
```
  $ ./cssh.sh driver1-1, node1-1, driver2-1, node2-1 (hit <enter> for 1st time warning)
  $    sudo mkfs -t xfs /dev/nvme1n1
  $    sudo mkdir /db
  $    sudo mount /dev/nvme1n1 /db
  $    sudo chmod 777 /db
       
       automatically mount the EBS volume after Reboot as per:
         https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html

       sudo reboot
```

## Now your ready to login into driver1-1 and get started
```
  $ ./cssh.sh driver1-1
  $   cd $RMT
  $   cat README.md
```
