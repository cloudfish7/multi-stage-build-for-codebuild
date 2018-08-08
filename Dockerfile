FROM maven:3.3.9-jdk-8 AS build1
RUN mkdir -p /opt/java/src
ADD ./pom.xml /opt/java/
ADD ./src /opt/java/src
RUN cd /opt/java && mvn install

FROM openjdk:8u131-jre-alpine
RUN mkdir -p /opt/app/
COPY --from=build1 /opt/java/target/ /opt/app/

RUN  java -jar /opt/app/HelloWorld-1.0.jar
