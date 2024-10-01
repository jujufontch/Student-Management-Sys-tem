FROM maven:3.9.5-openjdk-21 AS build
COPY . .
RUM mvn clean package -DskipTests

FROM openjdk:21-jdk-slim
COPY --from=build /target/sms-0.0.1-SNAPSHOT.jar sms.jar
EXPOSE 9080
ENTRYPOINT ["java","-jar","sms.jar"]