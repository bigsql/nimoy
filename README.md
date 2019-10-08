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
```
$ ./config-nodes.sh
```

## log into driver1-1 and get started
```
  $ ./cssh.sh driver1-1
  $ cd $RMT
  $ cat README.md
```
