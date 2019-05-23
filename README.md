# docker-spark
![Docker Build Status](https://img.shields.io/docker/cloud/build/qiqi/spark.svg)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/qiqi/spark.svg)

Spark-2.4.3-bin-hadoop2.7

# Requirements
- Docker: 18.06.0+
    - [https://www.docker.com](https://www.docker.com)

# docker example
Run Spark-Submit with Example Application Locally
```
docker run --rm qiqi/spark spark-submit \
--class org.apache.spark.examples.SparkPi \
--master local[*] \
examples/jars/spark-examples_2.11-2.4.3.jar \
100
```

# docker-compose example
Create a simple spark standalone cluster with docker-compose:
```
docker-compose up
```
Or run at the background
```
docker-compose up -d
```

SparkUI will be running at: `http://localhost:8080` with 2 workers listed.

To run `spark-submit` with example application in spark standalone cluster
```
docker exec spark-master spark-submit \
--class org.apache.spark.examples.SparkPi \
--master spark://spark-master:7077 \
examples/jars/spark-examples_2.11-2.4.3.jar \
100
```