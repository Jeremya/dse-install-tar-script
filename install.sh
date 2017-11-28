#!/bin/bash

set -e
cd "$(dirname "$0")"

SCRIPT_PATH=$(pwd)


VERSION="5.1.5"

# user, password from https://academy.datastax.com/
USER=""
PWD=""


curl --user $USER:$PWD -L https://downloads.datastax.com/enterprise/dse-$VERSION-bin.tar.gz | tar xz


mkdir -p dse-$VERSION/data/commitlog  dse-$VERSION/data/data  dse-$VERSION/data/hints  dse-$VERSION/data/saved_caches dse-$VERSION/spark/worker dse-$VERSION/spark/rdd  dse-$VERSION/log/spark/worker dse-$VERSION/log/spark/master dse-$VERSION/log/cassandra dse-$VERSION/data/dsefs dse-$VERSION/data/dsefs/data

sed -i '/data_file_directories:/s/^/#/' dse-$VERSION/resources/cassandra/conf/cassandra.yaml
sed -i '/     - \/var\/lib\/cassandra\/data/s/^/#/' dse-$VERSION/resources/cassandra/conf/cassandra.yaml
sed -i '/commitlog_directory:/s/^/#/' dse-$VERSION/resources/cassandra/conf/cassandra.yaml
sed -i '/saved_caches_directory:/s/^/#/' dse-$VERSION/resources/cassandra/conf/cassandra.yaml
sed -i '/hints_directory:/s/^/#/' dse-$VERSION/resources/cassandra/conf/cassandra.yaml
sed -i 's/endpoint_snitch: com.datastax.bdp.snitch.DseSimpleSnitch/endpoint_snitch: SimpleSnitch/g' dse-$VERSION/resources/cassandra/conf/cassandra.yaml


sed -i "s/# dsefs_options:/dsefs_options:/g" dse-$VERSION/resources/dse/conf/dse.yaml
sed -i "s|#     work_dir: /var/lib/dsefs|     work_dir: $SCRIPT_PATH/dse-$VERSION/data/dsefs|g" dse-$VERSION/resources/dse/conf/dse.yaml
sed -i "s/#     data_directories:/     data_directories:/g" dse-$VERSION/resources/dse/conf/dse.yaml
sed -i "s|#         - dir: /var/lib/dsefs/data|         - dir: $SCRIPT_PATH/dse-$VERSION/data/dsefs/data|g" dse-$VERSION/resources/dse/conf/dse.yaml
