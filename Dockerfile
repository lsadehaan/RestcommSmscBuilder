FROM maven:3.5-jdk-7

ENV BUILD_HOME=/usr/local/build/

RUN mkdir -p $BUILD_HOME
WORKDIR $BUILD_HOME

# speed up maven build, read https://keyholesoftware.com/2015/01/05/caching-for-maven-docker-builds/
# selectively add the POM file
ADD pom.xml $BUILD_HOME

# get all the downloads out of the way
RUN ["mvn","verify","clean","--fail-never"]
# add source
ADD ./smscgateway/ $BUILD_HOME

WORKDIR $BUILD_HOME/release
RUN ant

# run maven verify
# RUN ["mvn","verify"]