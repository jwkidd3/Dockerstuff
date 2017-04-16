Docker Stuff for Dev and more
==================
[![Build Status](https://travis-ci.org/HariSekhon/Dockerfiles.svg?branch=master)](https://travis-ci.org/HariSekhon/Dockerfiles) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/de6229f2d2ba4945acde9f86f59d2c66)](https://www.codacy.com/app/harisekhon/Dockerfiles) [![DockerHub](https://img.shields.io/badge/docker-available-blue.svg)](https://hub.docker.com/u/harisekhon/)

Docker Images containing hundreds of my published tools and the supporting technologies to run full functional test suites.

##### Contains 41 repos with over 140 tags, many different versions of [official software](https://github.com/HariSekhon/Dockerfiles#official-technologies):

* Hadoop, Big Data, NoSQL & OS images
* [My GitHub repos](https://github.com/HariSekhon) containing hundreds of tools related to these technologies with all dependencies pre-built

These images are all available pre-built on [My DockerHub](https://hub.docker.com/u/harisekhon/).


### Ready to run Docker images


To see more than the 25 DockerHub repos limited by ```docker search``` ([docker issue 23055](https://github.com/docker/docker/issues/23055)) I wrote ```dockerhub_search.py``` using the DockerHub API, available in my [PyTools github repo](https://github.com/harisekhon/pytools) and as a pre-built docker image:

```
docker run harisekhon/pytools dockerhub_search.py harisekhon
```

There are lots of tagged versions of official software in my repos to allow development testing across multiple versions, usually more versions than available from the official repos (and new version updates available on request, just [raise a GitHub issue](https://github.com/harisekhon/Dockerfiles/issues)).

DockerHub tags are not shown by ```docker search``` ([docker issue 17238](https://github.com/docker/docker/issues/17238)) so I wrote ```dockerhub_show_tags.py``` available in my [PyTools github repo](https://github.com/harisekhon/pytools) and as a pre-built docker image - eg. to see an organized list of all tags for the official CentOS & Ubuntu repos dynamically using the DockerHub API:

```
docker run harisekhon/pytools dockerhub_show_tags.py centos ubuntu
```

For service technologies like Hadoop, HBase, ZooKeeper etc for which you'll also want port mappings, each directory in the [GitHub project](https://github.com/harisekhon/dockerfiles) contains both a standard ` docker-compose ` configuration as well as a ` make run ` shortcut (which doesn't require ` docker-compose ` to be installed) - either way you don't have to remember all the command line switches and port number specifics:
```
cd zookeeper
docker-compose up
```
or for technologies with interactive shells like Spark, ZooKeeper, HBase, Drill, Cassandra where you want to be dropped in to an interactive shell, use the ` make run ` shortcut instead:
```
cd zookeeper
make run
```
which is much easier to type and remember than the equivalent bigger commands like:
```
docker run -ti -p 2181:2181 harisekhon/zookeeper
```
which gets much worse for more complex services like Hadoop / HBase:
```
docker run -ti -p 2181:2181 -p 8080:8080 -p 8085:8085 -p 9090:9090 -p 9095:9095 -p 16000:16000 -p 16010:16010 -p 16201:16201 -p 16301:16301 harisekhon/hbase
```
```
docker run -ti -p 8020:8020 -p 8032:8032 -p 8088:8088 -p 9000:9000 -p 10020:10020 -p 19888:19888 -p 50010:50010 -p 50020:50020 -p 50070:50070 -p 50075:50075 -p 50090:50090 harisekhon/hadoop
```

### Full Inventory:

##### Official Technologies:

- Alluxio
- Apache Drill (opens Drill shell)
- Cassandra (opens CQL shell, bundled with [nagios-plugins](https://github.com/harisekhon/nagios-plugins))
- Consul
- H2O by 0xdata
- Hadoop (HDFS + Yarn)
- HBase (opens HBase shell)
- Jython
- Kafka
- Mesos
- Nifi
- RabbitMQ Cluster (supports all same env vars as RabbitMQ official base, plus ones for enabling plugins)
- Riak
- Riak (bundled with [nagios-plugins](https://github.com/harisekhon/nagios-plugins))
- Serf
- Solr
- SolrCloud
- Spark (opens Spark shell)
- Tachyon
- ZooKeeper (opens ZK shell)

Repos suffixed with ```-dev``` are the official technologies + development & debugging tools + my github repos with all dependencies pre-built.


##### Base Images:

Dev images:

- CentOS latest with Java JDK, Perl, Python, Jython, Ruby, Scala, Groovy, GCC, Maven, SBT, Gradle, Make, Expect, EPEL etc.
- Debian latest with Java JDK, Perl, Python, Jython, Ruby, Scala, Groovy, GCC, Maven, SBT, Gradle, Make, Expect etc.
- Ubuntu latest with Java JDK, Perl, Python, Jython, Ruby, Scala, Groovy, GCC, Maven, SBT, Gradle, Make, Expect etc.
- Alpine latest with Java JDK, Perl, Python, Jython, Ruby, Scala, Groovy, GCC, Maven, SBT, Gradle, Make, Expect etc.

###### Base Images of Java / Scala:

All builds use OpenJDK with ```jre``` and ```jdk``` numbered tags. See this article below for why it might be illegal to bundle Oracle Java (and why no Linux distributions do this either):

