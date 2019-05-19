# docker-spark
![Docker Build Status](https://img.shields.io/docker/cloud/build/qiqi/spark.svg)

# Run Spark-Submit with Example Application Locally 
```bash
docker run \
    --rm qiqi/spark spark-submit \
    --class org.apache.spark.examples.SparkPi \
    --master local[*] \
    examples/jars/spark-examples_2.11-2.4.3.jar \
    100
```