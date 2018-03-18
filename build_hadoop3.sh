#!/bin/bash

set -x
export USE_HDFS3=1
make -n jclean static_lib rocksdbjavastatic
if [ $? -eq 0 ]; then
  mvn install:install-file -Dfile=/tmp/rocksdbjni-5.10.0-linux64.jar -DgroupId=com.tugo -DartifactId=rocksdb -Dversion=0.0.1-SNAPSHOT  -Dpackaging=jar
fi

