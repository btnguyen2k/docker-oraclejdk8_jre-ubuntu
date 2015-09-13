# Dockerfile to build a docker runtime for Java applications
# by Thanh Nguyen <btnguyen2k@gmail.com>

# History:
# - 2015-09-13: better version, automatically download Oracle JRE with wget
# - 2015-09-11: first, quick-and-dirty version

FROM ubuntu:14.04
MAINTAINER Thanh Nguyen <btnguyen2k@gmail.com>

# Java Version
ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 60
ENV JAVA_VERSION_BUILD 27
ENV JAVA_PACKAGE       jre
ENV JAVA_OUTPUT_DIR    ${JAVA_PACKAGE}1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR}

# Download & Extract Oracle java
# Ref: http://stackoverflow.com/questions/10268583/downloading-java-jdk-on-linux-via-wget-is-shown-license-page-instead
RUN \
	mkdir -p /tmp && \
	cd /tmp && \
	apt-get install -y --no-install-recommends wget ca-certificates && \
	wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie; s_cc=true; gpw_e24=http%3A%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavase%2Fdownloads%2Fjdk6downloads-1902814.html; s_sq=%5B%5BB%5D%5D; gpv_p24=no%20value" -qO- http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz | tar -xzf - && \
	mv /tmp/${JAVA_OUTPUT_DIR} /usr/local && \
	ln -s /usr/local/${JAVA_OUTPUT_DIR} /usr/local/java && \
	ln -s /usr/local/java/bin/* /usr/local/bin/

ENV JAVA_HOME /usr/local/java
CMD ["java", "-version"]

