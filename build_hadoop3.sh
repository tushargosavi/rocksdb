#!/bin/bash

set -x
export USE_HDFS3=1
make jclean static_lib rocksdbjavastatic
if [ $? -eq 0 ]; then
  mvn install:install-file -Dfile=./java/target/rocksdbjni-5.12.0-linux64.jar -DgroupId=com.tugo -DartifactId=rocksdb -Dversion=0.0.1-SNAPSHOT  -Dpackaging=jar
fi

