#!/bin/bash

set -x
export USE_HDFS=1
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jvm/java-8-oracle/jre/lib/amd64/server:/usr/lib/jvm/java-8-oracle/lib/amd64
export CLASSPATH=`hadoop classpath --glob` 
make jclean static_lib rocksdbjavastatic

# This part is needed to link library with libhdfs else loading fails and container gets killed.
# Build a new library at /tmp/, extract and replace jar created
# publish the jar to local .m2
#./lib.sh
#PWD1=`pwd`
#mkdir /tmp/extracts
#cd /tmp/extracts
#unzip $PWD1/java/target/rocksdbjni-5.10.0-linux64.jar 
#rm librocksdbjni-linux64.so
#cp /tmp/librocksdbjni-linux64.so .
#zip -r /tmp/rocksdbjni-5.10.0-linux64.jar *

mvn install:install-file -Dfile=java/target/rocksdbjni-5.12.0-linux64.jar -DgroupId=com.tugo -DartifactId=rocksdb -Dversion=0.0.1-SNAPSHOT  -Dpackaging=jar

