FROM gradle:jdk8-alpine as build
COPY build.gradle .
COPY src ./src
RUN gradle clean build --no-daemon

FROM openjdk:8-jdk-alpine as prod
COPY --from=build /home/gradle/build/libs/gradle.jar /cssc.jar
#COPY ./stub.sh ./
#RUN cat stub.sh cssc.jar > cssc && chmod +x cssc
