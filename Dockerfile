FROM maven:3.5-jdk-7

ENV BUILD_HOME=/usr/local/build/

RUN mkdir -p $BUILD_HOME
WORKDIR $BUILD_HOME

RUN git clone git@github.com:lsadehaan/smscgateway.git
WORKDIR $BUILD_HOME/smscgateway/release
RUN ant

# run maven verify
# RUN ["mvn","verify"]