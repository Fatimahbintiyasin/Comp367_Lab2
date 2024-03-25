# Use a Maven image as the base image
FROM maven:3.6.3-jdk-11 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Build the Maven project
RUN mvn clean package

# Use a smaller base image for runtime
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the built artifact from the Maven image
COPY --from=build /app/target/*.jar ./app.jar

# Command to run the application
CMD ["java", "-jar", "app.jar"]
