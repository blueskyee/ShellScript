#!/bin/bash

SPARK_HOME=/opt/spark/spark-2.1.1-bin-hadoop2.7
PY4J_FILE=py4j-0.10.4-src.zip
echo "export SPARK_HOME=${SPARK_HOME}" >> /etc/profile.d/spark.sh
echo "export PY4J_FILE=${PY4J_FILE}" >> /etc/profile.d/spark.sh
echo "export PYTHONPATH=${SPARK_HOME}/python:\$PYTHONPATH" >> /etc/profile.d/spark.sh
echo "export PYTHONPATH=${SPARK_HOME}/python/lib/${PY4J_FILE}:\$PYTHONPATH" >> /etc/profile.d/spark.sh

source /etc/profile.d/spark.sh

