# dse-install-tar-script
script to install dse tarball


set up your login and password in install.sh
make it executable
and run it

add this to your .bashrc/.zshrc  or your .profile
```bash
#choose your dse version
export CASSANDRA_HOME=/home/florent/soft/dse-6.0.7
#export CASSANDRA_HOME=/home/florent/soft/dse-5.1.13
#export CASSANDRA_HOME=/home/florent/soft/dse-6.7.2

export CASSANDRA_LOG_DIR=$CASSANDRA_HOME/log/cassandra
export CASSANDRA_TOOLS=$CASSANDRA_HOME/resources/cassandra/tools
export SPARK_WORKER_DIR=$CASSANDRA_HOME/spark/worker
export SPARK_LOCAL_DIRS=$CASSANDRA_HOME/spark/rdd
export SPARK_WORKER_LOG_DIR=$CASSANDRA_HOME/log/spark/worker
export SPARK_MASTER_LOG_DIR=$CASSANDRA_HOME/log/spark/master
export SPARK_HOME=$CASSANDRA_HOME/resources/spark
export SPARK_EXECUTOR_DIRS=$CASSANDRA_HOME/resources/spark_rdd
export DSE_HOME=$CASSANDRA_HOME

export PATH=$CASSANDRA_HOME/bin:$CASSANDRA_TOOLS/bin:$PATH
```

and next 
```bash
source .zshrc
dse cassandra
```
