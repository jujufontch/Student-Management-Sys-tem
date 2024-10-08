FROM maven:3.9.4-eclipse-temurin-21-alpine AS build

# Set the working directory in the container
#WORKDIR /app

# Copy all files to the working directory
#COPY . .
COPY ./src src/
COPY ./pom.xml pom.xml

# Build the application, skipping tests
RUN mvn clean package -DskipTests

#FROM openjdk:21-jdk-slim
FROM eclipse-temurin:21-jre-alpine

# Copy the JAR file from the build stage
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar sms.jar
#COPY --from=build target/*.jar sms.jar

# Expose the application port
EXPOSE 9080

# Specify the command to run the application
#ENTRYPOINT
CMD ["java", "-jar", "sms.jar"]
