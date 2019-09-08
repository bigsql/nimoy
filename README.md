# nimoy - is the driver for setting up the aws multi-region
#   BenchmarkSQL testing of the pglogical2 fork, pgspock2

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

## configure the two pg servers hostname's
```
$ ./configure-nodes.sh
```

## log into driver1-1 and get started
```
  $ ./cssh.sh driver1-1
  $ cd $RMT
  $ ./init.sh
  $ ./refresh-bigsql.sh
  $ ./build-1.sh
  $ ./dump-1.sh
  $ ./bms-setup.sh
  $ ./bms-runBemchmark.sh (from both driver nodes simulateneously)
```
