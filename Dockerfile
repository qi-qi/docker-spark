FROM openjdk:8-slim

ARG SPARK_VERSION=2.4.3
ARG HADOOP_VERSION=2.7

# Install libs & Set Locales
RUN set -ex \
    && apt-get update -yqq \
    && apt-get upgrade -yqq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yqq wget procps locales \
    && sed -i 's/^# en_US.UTF-8 UTF-8$/en_US.UTF-8 UTF-8/g' /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Define en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_MESSAGES en_US.UTF-8

# Set Spark Path
ENV SPARK_HOME "/spark"
ENV PATH $PATH:${SPARK_HOME}/bin

# Spark
RUN set -ex \
    && wget "https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" \
    && tar -xzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} ${SPARK_HOME} \
    && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && chown -R root:root $SPARK_HOME

WORKDIR $SPARK_HOME