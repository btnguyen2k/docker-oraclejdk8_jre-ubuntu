# Dockerfile to build a docker runtime for Java applications
# by Thanh Nguyen <btnguyen2k@gmail.com>

FROM ubuntu:14.04
MAINTAINER Thanh Nguyen <btnguyen2k@gmail.com>

# Minimum OracleJDK-8 for server applications
RUN mkdir -p /tmp
ADD jre-8u60-linux-x64.tar.gz /tmp
RUN \
	mv /tmp/jre1.8.0_60 /usr/local/ && \
	ln -s /usr/local/jre1.8.0_60 /usr/local/java && \
	ln -s /usr/local/java/bin/* /usr/local/bin/

ENV JAVA_HOME /usr/local/java

